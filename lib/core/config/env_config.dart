import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Environment configuration service
/// Loads and provides access to environment variables from .env file
class EnvConfig {
  static bool _initialized = false;

  /// Load environment variables from .env file
  static Future<void> load() async {
    if (_initialized) return;

    try {
      await dotenv.load(fileName: ".env");
      _initialized = true;
      print('✅ Environment variables loaded');
    } catch (e) {
      print('❌ Error loading .env file: $e');
      print('⚠️ Using default/empty values for environment variables');
      // Continue without .env - app may have limited functionality
    }
  }

  /// Check if environment variables are loaded
  static bool get isInitialized => _initialized;

  // ============================================
  // STRIPE CONFIGURATION
  // ============================================

  static String get stripePublishableKey {
    if (isTestMode) {
      return dotenv.env['STRIPE_PUBLISHABLE_KEY_TEST'] ?? '';
    }
    return dotenv.env['STRIPE_PUBLISHABLE_KEY_LIVE'] ?? '';
  }

  static String get stripeSecretKey {
    if (isTestMode) {
      return dotenv.env['STRIPE_SECRET_KEY_TEST'] ?? '';
    }
    return dotenv.env['STRIPE_SECRET_KEY_LIVE'] ?? '';
  }

  static String get stripeWebhookSecret =>
      dotenv.env['STRIPE_WEBHOOK_SECRET'] ?? '';

  // ============================================
  // SUMSUB KYC CONFIGURATION
  // ============================================

  static String get sumsubAppToken =>
      dotenv.env['SUMSUB_APP_TOKEN'] ?? '';

  static String get sumsubSecretKey =>
      dotenv.env['SUMSUB_SECRET_KEY'] ?? '';

  static String get sumsubLevelNameContributor =>
      dotenv.env['SUMSUB_LEVEL_NAME_CONTRIBUTOR'] ?? 'basic-kyc-level';

  static String get sumsubLevelNameCreator =>
      dotenv.env['SUMSUB_LEVEL_NAME_CREATOR'] ?? 'advanced-kyc-level';

  // ============================================
  // FIREBASE CONFIGURATION
  // ============================================

  static String get firebaseProjectId =>
      dotenv.env['FIREBASE_PROJECT_ID'] ?? 'social-impact-mvp';

  static String get firebaseWebApiKey =>
      dotenv.env['FIREBASE_WEB_API_KEY'] ?? '';

  static String get firebaseMessagingServerKey =>
      dotenv.env['FIREBASE_MESSAGING_SERVER_KEY'] ?? '';

  // ============================================
  // APP CONFIGURATION
  // ============================================

  static String get environment =>
      dotenv.env['ENVIRONMENT'] ?? 'development';

  static String get apiBaseUrl =>
      dotenv.env['API_BASE_URL'] ??
      'http://localhost:5001/social-impact-mvp/us-central1';

  static String get appUrlAndroid =>
      dotenv.env['APP_URL_ANDROID'] ?? 'http://localhost';

  static String get appUrlIOS =>
      dotenv.env['APP_URL_IOS'] ?? 'http://localhost';

  static String get appUrlWeb =>
      dotenv.env['APP_URL_WEB'] ?? 'http://localhost:5000';

  // ============================================
  // FEATURE FLAGS
  // ============================================

  static bool get enableAnalytics =>
      dotenv.env['ENABLE_ANALYTICS']?.toLowerCase() == 'true';

  static bool get enableCrashlytics =>
      dotenv.env['ENABLE_CRASHLYTICS']?.toLowerCase() == 'true';

  static bool get enableBiometricAuth =>
      dotenv.env['ENABLE_BIOMETRIC_AUTH']?.toLowerCase() == 'true';

  static bool get enableApplePay =>
      dotenv.env['ENABLE_APPLE_PAY']?.toLowerCase() == 'true';

  static bool get enableGooglePay =>
      dotenv.env['ENABLE_GOOGLE_PAY']?.toLowerCase() == 'true';

  // ============================================
  // TESTING
  // ============================================

  static bool get isTestMode =>
      dotenv.env['USE_TEST_MODE']?.toLowerCase() == 'true';

  static bool get isDevelopment => environment == 'development';
  static bool get isStaging => environment == 'staging';
  static bool get isProduction => environment == 'production';

  // ============================================
  // VALIDATION
  // ============================================

  /// Validate that all required environment variables are set
  static List<String> validateRequiredVariables() {
    final missing = <String>[];

    if (stripePublishableKey.isEmpty) {
      missing.add('STRIPE_PUBLISHABLE_KEY_${isTestMode ? "TEST" : "LIVE"}');
    }

    if (sumsubAppToken.isEmpty) {
      missing.add('SUMSUB_APP_TOKEN');
    }

    if (sumsubSecretKey.isEmpty) {
      missing.add('SUMSUB_SECRET_KEY');
    }

    if (firebaseWebApiKey.isEmpty && isProduction) {
      missing.add('FIREBASE_WEB_API_KEY');
    }

    return missing;
  }

  /// Print environment configuration (safe - no secrets)
  static void printConfig() {
    print('');
    print('🔧 ENVIRONMENT CONFIGURATION');
    print('═══════════════════════════════════════');
    print('Environment: $environment');
    print('Test Mode: $isTestMode');
    print('API Base URL: $apiBaseUrl');
    print('Firebase Project: $firebaseProjectId');
    print('');
    print('FEATURE FLAGS:');
    print('  Analytics: $enableAnalytics');
    print('  Crashlytics: $enableCrashlytics');
    print('  Biometric Auth: $enableBiometricAuth');
    print('  Apple Pay: $enableApplePay');
    print('  Google Pay: $enableGooglePay');
    print('');
    print('VALIDATION:');
    final missing = validateRequiredVariables();
    if (missing.isEmpty) {
      print('  ✅ All required variables set');
    } else {
      print('  ⚠️  Missing variables: ${missing.join(", ")}');
    }
    print('═══════════════════════════════════════');
    print('');
  }
}
