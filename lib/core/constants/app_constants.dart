/// Application-wide constants for the Social Finance Impact Platform
/// Multi-platform constants used across Android, iOS, and Web

class AppConstants {
  // Application Information
  static const String appName = 'Social Finance Impact Platform';
  static const String appVersion = '1.0.0';
  static const String appBuildNumber = '1';

  // Application Features
  static const bool enableBiometricAuth = true;
  static const bool enableSocialAuth = true;
  static const bool enableKYCVerification = true;
  static const bool enableNotifications = true;

  // Session Management
  static const int sessionTimeoutMinutes = 30;
  static const int maxLoginAttempts = 5;
  static const int lockoutDurationMinutes = 15;

  // Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;

  // Cache Settings
  static const int imageCacheMaxSize = 100;
  static const int imageCacheMaxSizeBytes = 50 * 1024 * 1024; // 50MB

  // File Upload
  static const int maxFileUploadSizeMB = 10;
  static const List<String> allowedImageTypes = [
    'image/jpeg',
    'image/png',
    'image/jpg',
  ];
  static const List<String> allowedDocumentTypes = [
    'application/pdf',
    'application/msword',
    'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
  ];

  // Minimum Requirements
  static const String minimumAndroidVersion = '21'; // Android 5.0
  static const String minimumIOSVersion = '13.0';

  // Performance
  static const int maxConcurrentRequests = 5;
  static const int defaultRequestTimeoutSeconds = 30;

  // Security
  static const int passwordMinLength = 8;
  static const int passwordMaxLength = 128;
  static const bool requirePasswordUppercase = true;
  static const bool requirePasswordLowercase = true;
  static const bool requirePasswordNumbers = true;
  static const bool requirePasswordSpecialChars = true;

  // KYC Verification
  static const List<String> kycRequiredDocuments = [
    'identity_card',
    'proof_of_address',
    'bank_statement',
  ];

  // Investment Limits (in USD)
  static const double minInvestmentAmount = 100.0;
  static const double maxInvestmentAmountUnverified = 1000.0;
  static const double maxInvestmentAmountVerified = 100000.0;

  // Currency
  static const String defaultCurrency = 'USD';
  static const String defaultCurrencySymbol = '\$';
  static const List<String> supportedCurrencies = [
    'USD',
    'EUR',
    'GBP',
    'XOF', // West African CFA franc
    'XAF', // Central African CFA franc
  ];

  // Localization
  static const String defaultLanguage = 'fr';
  static const List<String> supportedLanguages = ['fr', 'en'];

  // Analytics
  static const bool enableAnalytics = true;
  static const bool enableCrashReporting = true;

  // Feature Flags
  static const bool enableDarkMode = true;
  static const bool enableOfflineMode = true;
  static const bool enableBetaFeatures = false;

  // Support
  static const String supportEmail = 'support@socialfinance.com';
  static const String privacyPolicyUrl = 'https://socialfinance.com/privacy';
  static const String termsOfServiceUrl = 'https://socialfinance.com/terms';

  // Social Media (for sharing)
  static const String twitterHandle = '@socialfinance';
  static const String facebookPage = 'socialfinanceplatform';

  // Private constructor to prevent instantiation
  AppConstants._();
}

/// Environment-specific constants
class EnvironmentConstants {
  static const bool isProduction = bool.fromEnvironment('dart.vm.product');
  static const bool isDevelopment = !isProduction;

  // Private constructor
  EnvironmentConstants._();
}

/// Storage Keys
class StorageKeys {
  // Authentication
  static const String accessToken = 'access_token';
  static const String refreshToken = 'refresh_token';
  static const String userId = 'user_id';
  static const String userEmail = 'user_email';
  static const String userRole = 'user_role';

  // Preferences
  static const String theme = 'theme_mode';
  static const String language = 'language';
  static const String rememberMe = 'remember_me';
  static const String biometricEnabled = 'biometric_enabled';

  // Onboarding
  static const String hasCompletedOnboarding = 'has_completed_onboarding';
  static const String lastSyncTime = 'last_sync_time';

  // Cache
  static const String cachedProjects = 'cached_projects';
  static const String cachedTransactions = 'cached_transactions';

  // Private constructor
  StorageKeys._();
}

/// Animation Durations
class AnimationDurations {
  static const int fast = 200; // milliseconds
  static const int normal = 300;
  static const int slow = 500;
  static const int verySlow = 1000;

  // Private constructor
  AnimationDurations._();
}

/// Asset Paths
class AssetPaths {
  // Images
  static const String imagesDir = 'assets/images/';
  static const String iconsDir = 'assets/icons/';

  // Logos
  static const String logo = '${imagesDir}logo.png';
  static const String logoWhite = '${imagesDir}logo_white.png';
  static const String splash = '${imagesDir}splash.png';

  // Placeholders
  static const String userPlaceholder = '${imagesDir}user_placeholder.png';
  static const String projectPlaceholder = '${imagesDir}project_placeholder.png';

  // Icons
  static const String iconApp = '${iconsDir}icon.png';

  // Private constructor
  AssetPaths._();
}

/// Regular Expressions
class RegexPatterns {
  static const String email = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  static const String phone = r'^\+?[1-9]\d{1,14}$'; // E.164 format
  static const String url = r'^https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)$';
  static const String password = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';

  // Private constructor
  RegexPatterns._();
}
