import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';
import Stripe from 'stripe';
import * as express from 'express';

const stripe = new Stripe(functions.config().stripe.secret_key, {
  apiVersion: '2023-10-16',
});

const endpointSecret = functions.config().stripe.webhook_secret;

export const stripeWebhook = functions.https.onRequest(
  async (req: express.Request, res: express.Response) => {
    const sig = req.headers['stripe-signature'];

    if (!sig) {
      res.status(400).send('Missing stripe-signature header');
      return;
    }

    let event: Stripe.Event;

    try {
      event = stripe.webhooks.constructEvent(
        req.rawBody,
        sig,
        endpointSecret
      );
    } catch (err) {
      functions.logger.error('Webhook signature verification failed:', err);
      res.status(400).send(`Webhook Error: ${err}`);
      return;
    }

    // Handle the event
    switch (event.type) {
      case 'payment_intent.succeeded':
        await handlePaymentSuccess(event.data.object as Stripe.PaymentIntent);
        break;

      case 'payment_intent.payment_failed':
        await handlePaymentFailed(event.data.object as Stripe.PaymentIntent);
        break;

      case 'charge.refunded':
        await handleRefund(event.data.object as Stripe.Charge);
        break;

      default:
        functions.logger.log(`Unhandled event type: ${event.type}`);
    }

    res.json({ received: true });
  }
);

async function handlePaymentSuccess(paymentIntent: Stripe.PaymentIntent) {
  const {projectId, contributorId, milestoneId} = paymentIntent.metadata;

  try {
    const db = admin.firestore();
    const batch = db.batch();

    // Create contribution record
    const contributionRef = db.collection('contributions').doc();
    batch.set(contributionRef, {
      projectId,
      contributorId,
      milestoneId: milestoneId || null,
      amount: paymentIntent.amount / 100, // Convert cents to euros
      currency: paymentIntent.currency.toUpperCase(),
      paymentIntentId: paymentIntent.id,
      status: 'completed',
      createdAt: admin.firestore.FieldValue.serverTimestamp(),
    });

    // Update project funding
    const projectRef = db.collection('projects').doc(projectId);
    batch.update(projectRef, {
      currentFunding: admin.firestore.FieldValue.increment(
        paymentIntent.amount / 100
      ),
      updatedAt: admin.firestore.FieldValue.serverTimestamp(),
    });

    // Update payment intent status
    const paymentIntentRef = db
      .collection('payment_intents')
      .doc(paymentIntent.id);
    batch.update(paymentIntentRef, {
      status: 'succeeded',
      completedAt: admin.firestore.FieldValue.serverTimestamp(),
    });

    await batch.commit();

    functions.logger.log(
      `Payment succeeded for project ${projectId}, amount: ${paymentIntent.amount / 100}`
    );

    // Send notification to project owner
    await sendContributionNotification(projectId, contributorId, paymentIntent.amount / 100);
  } catch (error) {
    functions.logger.error('Error handling payment success:', error);
  }
}

async function handlePaymentFailed(paymentIntent: Stripe.PaymentIntent) {
  const {projectId} = paymentIntent.metadata;

  try {
    // Update payment intent status
    await admin
      .firestore()
      .collection('payment_intents')
      .doc(paymentIntent.id)
      .update({
        status: 'failed',
        failedAt: admin.firestore.FieldValue.serverTimestamp(),
      });

    functions.logger.log(`Payment failed for project ${projectId}`);
  } catch (error) {
    functions.logger.error('Error handling payment failure:', error);
  }
}

async function handleRefund(charge: Stripe.Charge) {
  const paymentIntentId = charge.payment_intent as string;

  if (!paymentIntentId) return;

  try {
    // Get original contribution
    const contributionsSnapshot = await admin
      .firestore()
      .collection('contributions')
      .where('paymentIntentId', '==', paymentIntentId)
      .limit(1)
      .get();

    if (contributionsSnapshot.empty) return;

    const contribution = contributionsSnapshot.docs[0];
    const contributionData = contribution.data();

    const db = admin.firestore();
    const batch = db.batch();

    // Update contribution status
    batch.update(contribution.ref, {
      status: 'refunded',
      refundedAt: admin.firestore.FieldValue.serverTimestamp(),
    });

    // Decrease project funding
    const projectRef = db.collection('projects').doc(contributionData.projectId);
    batch.update(projectRef, {
      currentFunding: admin.firestore.FieldValue.increment(-contributionData.amount),
      updatedAt: admin.firestore.FieldValue.serverTimestamp(),
    });

    await batch.commit();

    functions.logger.log(`Refund processed for contribution ${contribution.id}`);
  } catch (error) {
    functions.logger.error('Error handling refund:', error);
  }
}

async function sendContributionNotification(
  projectId: string,
  contributorId: string,
  amount: number
) {
  // This would integrate with Firebase Cloud Messaging
  // For now, just log
  functions.logger.log(
    `Sending notification for contribution: ${amount} EUR to project ${projectId}`
  );
}
