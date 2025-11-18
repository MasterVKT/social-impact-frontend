import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';

interface NotificationData {
  userId: string;
  title: string;
  message: string;
  type: string;
  data?: Record<string, any>;
}

export const sendNotification = functions.https.onCall(
  async (data: NotificationData, context) => {
    // Verify authentication
    if (!context.auth) {
      throw new functions.https.HttpsError(
        'unauthenticated',
        'User must be authenticated'
      );
    }

    const { userId, title, message, type, data: notificationData } = data;

    // Validation
    if (!userId || !title || !message) {
      throw new functions.https.HttpsError(
        'invalid-argument',
        'Missing required fields'
      );
    }

    try {
      // Create notification in Firestore
      const notificationRef = await admin
        .firestore()
        .collection('notifications')
        .add({
          userId,
          type,
          title,
          message,
          data: notificationData || {},
          read: false,
          createdAt: admin.firestore.FieldValue.serverTimestamp(),
        });

      // Get user's FCM token
      const userDoc = await admin.firestore().collection('users').doc(userId).get();
      const userData = userDoc.data();

      if (userData?.fcmToken) {
        // Send push notification
        await admin.messaging().send({
          token: userData.fcmToken,
          notification: {
            title,
            body: message,
          },
          data: {
            notificationId: notificationRef.id,
            type,
            ...notificationData,
          },
        });

        functions.logger.log(`Push notification sent to user ${userId}`);
      }

      return {
        notificationId: notificationRef.id,
        success: true,
      };
    } catch (error) {
      functions.logger.error('Error sending notification:', error);
      throw new functions.https.HttpsError(
        'internal',
        'Failed to send notification'
      );
    }
  }
);

// Trigger on milestone evidence submission
export const onMilestoneSubmitted = functions.firestore
  .document('milestone_evidence/{evidenceId}')
  .onCreate(async (snapshot, context) => {
    const evidence = snapshot.data();

    try {
      // Get project details
      const projectDoc = await admin
        .firestore()
        .collection('projects')
        .doc(evidence.projectId)
        .get();

      if (!projectDoc.exists) return;

      const project = projectDoc.data();

      // Notify project creator
      await admin.firestore().collection('notifications').add({
        userId: project?.creatorId,
        type: 'milestone_evidence_submitted',
        title: 'Milestone Evidence Submitted',
        message: `Evidence has been submitted for milestone: ${evidence.title}`,
        data: {
          evidenceId: snapshot.id,
          milestoneId: evidence.milestoneId,
          projectId: evidence.projectId,
        },
        read: false,
        createdAt: admin.firestore.FieldValue.serverTimestamp(),
      });

      // Notify admins to assign auditor
      const adminsSnapshot = await admin
        .firestore()
        .collection('users')
        .where('role', '==', 'admin')
        .get();

      for (const adminDoc of adminsSnapshot.docs) {
        await admin.firestore().collection('notifications').add({
          userId: adminDoc.id,
          type: 'milestone_evidence_review_required',
          title: 'Milestone Evidence Requires Review',
          message: `New milestone evidence submitted for project ${evidence.projectId}`,
          data: {
            evidenceId: snapshot.id,
            milestoneId: evidence.milestoneId,
            projectId: evidence.projectId,
          },
          read: false,
          createdAt: admin.firestore.FieldValue.serverTimestamp(),
        });
      }

      functions.logger.log(
        `Notifications sent for milestone evidence ${snapshot.id}`
      );
    } catch (error) {
      functions.logger.error('Error in onMilestoneSubmitted:', error);
    }
  });

// Trigger on contribution created
export const onContributionCreated = functions.firestore
  .document('contributions/{contributionId}')
  .onCreate(async (snapshot, context) => {
    const contribution = snapshot.data();

    try {
      // Get project details
      const projectDoc = await admin
        .firestore()
        .collection('projects')
        .doc(contribution.projectId)
        .get();

      if (!projectDoc.exists) return;

      const project = projectDoc.data();

      // Notify project creator
      await admin.firestore().collection('notifications').add({
        userId: project?.creatorId,
        type: 'new_contribution',
        title: 'New Contribution Received!',
        message: `You received a contribution of €${contribution.amount}`,
        data: {
          contributionId: snapshot.id,
          projectId: contribution.projectId,
          amount: contribution.amount,
        },
        read: false,
        createdAt: admin.firestore.FieldValue.serverTimestamp(),
      });

      // Notify contributor
      await admin.firestore().collection('notifications').add({
        userId: contribution.contributorId,
        type: 'contribution_confirmed',
        title: 'Contribution Confirmed',
        message: `Thank you for your contribution of €${contribution.amount} to ${project?.name}`,
        data: {
          contributionId: snapshot.id,
          projectId: contribution.projectId,
          amount: contribution.amount,
        },
        read: false,
        createdAt: admin.firestore.FieldValue.serverTimestamp(),
      });

      functions.logger.log(`Notifications sent for contribution ${snapshot.id}`);
    } catch (error) {
      functions.logger.error('Error in onContributionCreated:', error);
    }
  });
