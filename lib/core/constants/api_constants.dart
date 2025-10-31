/// API and Backend constants for Firebase and Cloud Functions
/// Multi-platform API configuration

class ApiConstants {
  // Firebase Project Configuration
  static const String firebaseProjectId = 'social-finance-impact-mvp';

  // Cloud Functions Base URLs
  static const String cloudFunctionsBaseUrl =
      'https://us-central1-$firebaseProjectId.cloudfunctions.net';

  // Development/Staging URLs
  static const String devBaseUrl =
      'https://us-central1-$firebaseProjectId-dev.cloudfunctions.net';

  // API Endpoints (Cloud Functions)
  static const String authEndpoint = '/auth';
  static const String kycEndpoint = '/kyc';
  static const String projectsEndpoint = '/projects';
  static const String contributionsEndpoint = '/contributions';
  static const String transactionsEndpoint = '/transactions';
  static const String auditsEndpoint = '/audits';
  static const String notificationsEndpoint = '/notifications';
  static const String analyticsEndpoint = '/analytics';

  // Firestore Collections
  static const String usersCollection = 'users';
  static const String projectsCollection = 'projects';
  static const String contributionsCollection = 'contributions';
  static const String transactionsCollection = 'transactions';
  static const String auditsCollection = 'audits';
  static const String kycCollection = 'kyc_verifications';
  static const String notificationsCollection = 'notifications';
  static const String organizationsCollection = 'organizations';
  static const String impactMetricsCollection = 'impact_metrics';

  // Storage Buckets
  static const String profileImagesBucket = 'profile_images';
  static const String projectImagesBucket = 'project_images';
  static const String kycDocumentsBucket = 'kyc_documents';
  static const String auditReportsBucket = 'audit_reports';

  // API Versioning
  static const String apiVersion = 'v1';

  // HTTP Headers
  static const String authorizationHeader = 'Authorization';
  static const String contentTypeHeader = 'Content-Type';
  static const String acceptHeader = 'Accept';
  static const String userAgentHeader = 'User-Agent';

  // Content Types
  static const String jsonContentType = 'application/json';
  static const String formDataContentType = 'multipart/form-data';

  // Timeouts (in seconds)
  static const int connectTimeout = 30;
  static const int receiveTimeout = 30;
  static const int sendTimeout = 30;

  // Retry Configuration
  static const int maxRetries = 3;
  static const int retryDelaySeconds = 2;

  // Query Limits
  static const int defaultQueryLimit = 20;
  static const int maxQueryLimit = 100;

  // Private constructor
  ApiConstants._();
}

/// HTTP Status Codes
class HttpStatusCodes {
  // Success
  static const int ok = 200;
  static const int created = 201;
  static const int accepted = 202;
  static const int noContent = 204;

  // Redirection
  static const int movedPermanently = 301;
  static const int found = 302;
  static const int notModified = 304;

  // Client Errors
  static const int badRequest = 400;
  static const int unauthorized = 401;
  static const int forbidden = 403;
  static const int notFound = 404;
  static const int methodNotAllowed = 405;
  static const int conflict = 409;
  static const int unprocessableEntity = 422;
  static const int tooManyRequests = 429;

  // Server Errors
  static const int internalServerError = 500;
  static const int notImplemented = 501;
  static const int badGateway = 502;
  static const int serviceUnavailable = 503;
  static const int gatewayTimeout = 504;

  // Private constructor
  HttpStatusCodes._();
}

/// Error Codes (Custom Application Errors)
class ErrorCodes {
  // Authentication Errors
  static const String invalidCredentials = 'AUTH_INVALID_CREDENTIALS';
  static const String userNotFound = 'AUTH_USER_NOT_FOUND';
  static const String emailAlreadyInUse = 'AUTH_EMAIL_ALREADY_IN_USE';
  static const String weakPassword = 'AUTH_WEAK_PASSWORD';
  static const String accountDisabled = 'AUTH_ACCOUNT_DISABLED';
  static const String tokenExpired = 'AUTH_TOKEN_EXPIRED';
  static const String invalidToken = 'AUTH_INVALID_TOKEN';

  // KYC Errors
  static const String kycNotCompleted = 'KYC_NOT_COMPLETED';
  static const String kycDocumentInvalid = 'KYC_DOCUMENT_INVALID';
  static const String kycUnderReview = 'KYC_UNDER_REVIEW';
  static const String kycRejected = 'KYC_REJECTED';

  // Investment Errors
  static const String insufficientFunds = 'INVESTMENT_INSUFFICIENT_FUNDS';
  static const String investmentLimitExceeded = 'INVESTMENT_LIMIT_EXCEEDED';
  static const String projectNotAvailable = 'PROJECT_NOT_AVAILABLE';
  static const String projectFundingComplete = 'PROJECT_FUNDING_COMPLETE';

  // Validation Errors
  static const String invalidInput = 'VALIDATION_INVALID_INPUT';
  static const String missingRequiredField = 'VALIDATION_MISSING_FIELD';
  static const String invalidFormat = 'VALIDATION_INVALID_FORMAT';

  // Network Errors
  static const String networkError = 'NETWORK_ERROR';
  static const String timeoutError = 'NETWORK_TIMEOUT';
  static const String connectionError = 'NETWORK_CONNECTION_ERROR';

  // Server Errors
  static const String serverError = 'SERVER_ERROR';
  static const String serviceUnavailable = 'SERVER_UNAVAILABLE';

  // Private constructor
  ErrorCodes._();
}

/// Firebase Cloud Messaging Topics
class FCMTopics {
  static const String allUsers = 'all_users';
  static const String investors = 'investors';
  static const String organizations = 'organizations';
  static const String auditors = 'auditors';
  static const String admins = 'admins';

  // Private constructor
  FCMTopics._();
}
