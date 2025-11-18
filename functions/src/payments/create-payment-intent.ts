import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';
import Stripe from 'stripe';

const stripe = new Stripe(functions.config().stripe.secret_key, {
  apiVersion: '2023-10-16',
});

interface PaymentIntentData {
  amount: number; // in cents
  currency: string;
  projectId: string;
  contributorId: string;
  milestoneId?: string;
}

export const stripeCreatePaymentIntent = functions.https.onCall(
  async (data: PaymentIntentData, context) => {
    // Verify authentication
    if (!context.auth) {
      throw new functions.https.HttpsError(
        'unauthenticated',
        'User must be authenticated to create payment intent'
      );
    }

    const { amount, currency, projectId, contributorId, milestoneId } = data;

    // Validation
    if (!amount || amount <= 0) {
      throw new functions.https.HttpsError(
        'invalid-argument',
        'Invalid amount'
      );
    }

    if (!projectId || !contributorId) {
      throw new functions.https.HttpsError(
        'invalid-argument',
        'Missing required fields'
      );
    }

    // Verify project exists and is accepting contributions
    const projectRef = admin.firestore().collection('projects').doc(projectId);
    const projectDoc = await projectRef.get();

    if (!projectDoc.exists) {
      throw new functions.https.HttpsError('not-found', 'Project not found');
    }

    const project = projectDoc.data();
    if (project?.status !== 'fundingActive') {
      throw new functions.https.HttpsError(
        'failed-precondition',
        'Project is not accepting contributions'
      );
    }

    try {
      // Create payment intent
      const paymentIntent = await stripe.paymentIntents.create({
        amount,
        currency: currency.toLowerCase(),
        metadata: {
          projectId,
          contributorId,
          ...(milestoneId && { milestoneId }),
        },
        automatic_payment_methods: {
          enabled: true,
        },
      });

      // Log payment intent creation
      await admin
        .firestore()
        .collection('payment_intents')
        .doc(paymentIntent.id)
        .set({
          projectId,
          contributorId,
          milestoneId: milestoneId || null,
          amount,
          currency,
          status: paymentIntent.status,
          createdAt: admin.firestore.FieldValue.serverTimestamp(),
        });

      return {
        clientSecret: paymentIntent.client_secret,
        paymentIntentId: paymentIntent.id,
      };
    } catch (error) {
      functions.logger.error('Error creating payment intent:', error);
      throw new functions.https.HttpsError(
        'internal',
        'Failed to create payment intent'
      );
    }
  }
);
