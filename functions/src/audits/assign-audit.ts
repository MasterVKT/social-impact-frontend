import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';

interface AssignAuditData {
  projectId: string;
  milestoneId?: string;
  auditType: string;
  auditorId: string;
  dueDate: string; // ISO date string
}

export const assignAuditToAuditor = functions.https.onCall(
  async (data: AssignAuditData, context) => {
    // Verify authentication and admin role
    if (!context.auth) {
      throw new functions.https.HttpsError(
        'unauthenticated',
        'User must be authenticated'
      );
    }

    // Check if user is admin (you'd verify this from custom claims)
    const userDoc = await admin
      .firestore()
      .collection('users')
      .doc(context.auth.uid)
      .get();

    const userData = userDoc.data();
    if (!userData || userData.role !== 'admin') {
      throw new functions.https.HttpsError(
        'permission-denied',
        'Only admins can assign audits'
      );
    }

    const { projectId, milestoneId, auditType, auditorId, dueDate } = data;

    // Validation
    if (!projectId || !auditType || !auditorId || !dueDate) {
      throw new functions.https.HttpsError(
        'invalid-argument',
        'Missing required fields'
      );
    }

    try {
      // Verify auditor exists and has auditor role
      const auditorDoc = await admin
        .firestore()
        .collection('users')
        .doc(auditorId)
        .get();

      if (!auditorDoc.exists) {
        throw new functions.https.HttpsError('not-found', 'Auditor not found');
      }

      const auditor = auditorDoc.data();
      if (!auditor || auditor.role !== 'auditor') {
        throw new functions.https.HttpsError(
          'invalid-argument',
          'Specified user is not an auditor'
        );
      }

      // Create audit assignment
      const auditRef = await admin.firestore().collection('audits').add({
        projectId,
        milestoneId: milestoneId || null,
        type: auditType,
        status: 'assigned',
        assignedTo: auditorId,
        assignedBy: context.auth.uid,
        assignedAt: admin.firestore.FieldValue.serverTimestamp(),
        dueDate: new Date(dueDate),
        createdAt: admin.firestore.FieldValue.serverTimestamp(),
      });

      // Send notification to auditor
      await admin.firestore().collection('notifications').add({
        userId: auditorId,
        type: 'audit_assigned',
        title: 'New Audit Assignment',
        message: `You have been assigned a new audit for project ${projectId}`,
        data: {
          auditId: auditRef.id,
          projectId,
          milestoneId,
        },
        read: false,
        createdAt: admin.firestore.FieldValue.serverTimestamp(),
      });

      functions.logger.log(
        `Audit ${auditRef.id} assigned to auditor ${auditorId}`
      );

      return {
        auditId: auditRef.id,
        success: true,
      };
    } catch (error) {
      functions.logger.error('Error assigning audit:', error);
      throw new functions.https.HttpsError('internal', 'Failed to assign audit');
    }
  }
);
