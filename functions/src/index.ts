/**
 * Cloud Functions for Social Finance Impact Platform
 *
 * IMPORTANT: These functions MUST be deployed for the app to work properly.
 *
 * Setup:
 * 1. cd functions
 * 2. npm install
 * 3. Create .env file with required environment variables
 * 4. npm run build
 * 5. firebase deploy --only functions
 */

import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';

// Initialize Firebase Admin
admin.initializeApp();

// Export function modules
export {stripeCreatePaymentIntent} from './payments/create-payment-intent';
export {stripeWebhook} from './payments/stripe-webhook';
export {onContributionCreated} from './payments/on-contribution-created';
export {releaseFundsToCreator} from './payments/release-funds';

export {assignAuditToAuditor} from './audits/assign-audit';
export {onMilestoneSubmitted, onContributionCreated as onContributionCreatedNotif} from './notifications/send-notification';

export {sendNotification} from './notifications/send-notification';

export {onProjectCreated} from './projects/on-project-created';
export {approveProject} from './projects/approve-project';

export {onUserCreated} from './users/on-user-created';
export {updateUserKYCStatus} from './users/update-kyc-status';

export {createAuditTrail} from './compliance/audit-trail';
export {generateAnalytics} from './analytics/generate-analytics';

// Health check function
export const healthCheck = functions.https.onRequest((req, res) => {
  res.status(200).json({
    status: 'ok',
    timestamp: new Date().toISOString(),
    version: '1.0.0',
  });
});
