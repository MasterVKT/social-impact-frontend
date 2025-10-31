/// Platform-specific constants for adaptive multi-platform development
/// Handles Android, iOS, and Web specific configurations

class PlatformConstants {
  // Platform Capabilities
  static const Map<String, bool> capabilities = {
    'biometrics': true, // Available on mobile only
    'push_notifications': true, // Available on mobile only
    'background_processing': true, // Available on mobile only
    'url_navigation': true, // Available on web only
    'file_system': true, // Available on mobile only
    'camera': true, // Available on mobile only
    'geolocation': true, // Available on all platforms
    'local_storage': true, // Available on all platforms
  };

  // Android Specific
  static const String androidMinSdkVersion = '21'; // Android 5.0
  static const String androidTargetSdkVersion = '34'; // Android 14
  static const String androidCompileSdkVersion = '34';

  // Android Permissions
  static const List<String> androidPermissions = [
    'android.permission.INTERNET',
    'android.permission.ACCESS_NETWORK_STATE',
    'android.permission.CAMERA',
    'android.permission.READ_EXTERNAL_STORAGE',
    'android.permission.WRITE_EXTERNAL_STORAGE',
    'android.permission.USE_BIOMETRIC',
    'android.permission.USE_FINGERPRINT',
  ];

  // iOS Specific
  static const String iOSMinVersion = '13.0';
  static const String iOSTargetVersion = '17.0';

  // iOS Permissions (Info.plist keys)
  static const List<String> iOSPermissions = [
    'NSCameraUsageDescription',
    'NSPhotoLibraryUsageDescription',
    'NSLocationWhenInUseUsageDescription',
    'NSFaceIDUsageDescription',
    'NSUserTrackingUsageDescription',
  ];

  // iOS Permission Descriptions
  static const Map<String, String> iOSPermissionDescriptions = {
    'NSCameraUsageDescription':
        'This app needs access to your camera to capture profile pictures and KYC documents.',
    'NSPhotoLibraryUsageDescription':
        'This app needs access to your photo library to select profile pictures and KYC documents.',
    'NSLocationWhenInUseUsageDescription':
        'This app uses your location to find nearby projects and organizations.',
    'NSFaceIDUsageDescription':
        'This app uses Face ID for secure authentication.',
    'NSUserTrackingUsageDescription':
        'This app uses tracking to provide personalized content and analytics.',
  };

  // Web Specific
  static const bool webUseCanvasKit = false; // Use HTML renderer by default
  static const bool webEnableServiceWorker = true;
  static const bool webEnablePWA = true;

  // Web Storage Limits
  static const int webLocalStorageMaxSizeKB = 5120; // 5MB typical limit
  static const int webIndexedDBQuotaMB = 50; // Varies by browser

  // Deep Linking
  static const String androidDeepLinkScheme = 'socialfinance';
  static const String iosDeepLinkScheme = 'socialfinance';
  static const String webDeepLinkDomain = 'socialfinance.com';

  // App Links / Universal Links
  static const String androidAppLinkHost = 'socialfinance.com';
  static const String iosUniversalLinkHost = 'socialfinance.com';

  // Platform-specific Features Flags
  static const Map<String, Map<String, bool>> platformFeatures = {
    'android': {
      'biometric_auth': true,
      'push_notifications': true,
      'background_sync': true,
      'app_shortcuts': true,
      'widgets': true,
      'picture_in_picture': true,
    },
    'ios': {
      'biometric_auth': true,
      'push_notifications': true,
      'background_sync': true,
      'app_shortcuts': true,
      'widgets': true,
      'picture_in_picture': false,
    },
    'web': {
      'biometric_auth': false,
      'push_notifications': true, // Via web push
      'background_sync': true, // Via service workers
      'app_shortcuts': false,
      'widgets': false,
      'picture_in_picture': false,
    },
  };

  // Network Configuration
  static const bool requiresSecureConnection = true;
  static const int maxConcurrentConnections = 6; // HTTP/1.1 standard

  // Private constructor
  PlatformConstants._();
}

/// Platform-specific UI/UX Guidelines
class PlatformUIGuidelines {
  // Gesture Behaviors
  static const Map<String, Map<String, dynamic>> gestures = {
    'android': {
      'back_gesture': 'swipe_from_left_edge',
      'menu_gesture': 'three_finger_swipe',
      'haptic_feedback': true,
      'long_press_duration_ms': 500,
    },
    'ios': {
      'back_gesture': 'swipe_from_left_edge',
      'menu_gesture': 'force_touch',
      'haptic_feedback': true,
      'long_press_duration_ms': 500,
    },
    'web': {
      'back_gesture': 'browser_back_button',
      'menu_gesture': 'right_click',
      'haptic_feedback': false,
      'long_press_duration_ms': 1000,
    },
  };

  // Navigation Patterns
  static const Map<String, String> navigationPatterns = {
    'android': 'bottom_navigation', // Material Design
    'ios': 'tab_bar', // iOS Human Interface Guidelines
    'web_mobile': 'bottom_navigation',
    'web_tablet': 'navigation_rail',
    'web_desktop': 'sidebar',
  };

  // Loading Indicators
  static const Map<String, String> loadingIndicators = {
    'android': 'circular_progress_indicator', // Material
    'ios': 'cupertino_activity_indicator', // Cupertino
    'web': 'circular_progress_indicator',
  };

  // Private constructor
  PlatformUIGuidelines._();
}

/// Platform-specific Performance Targets
class PlatformPerformanceTargets {
  // Mobile Performance Targets
  static const Map<String, dynamic> mobileTargets = {
    'app_start_time_ms': 3000, // 3 seconds
    'frame_rate_fps': 60,
    'memory_limit_mb': 150,
    'bundle_size_mb': 50,
    'image_cache_mb': 50,
  };

  // Web Performance Targets
  static const Map<String, dynamic> webTargets = {
    'first_contentful_paint_ms': 1500, // 1.5 seconds
    'time_to_interactive_ms': 3000, // 3 seconds
    'lighthouse_performance_score': 90,
    'lighthouse_accessibility_score': 95,
    'lighthouse_seo_score': 90,
    'bundle_size_mb': 10,
    'image_cache_mb': 25,
  };

  // Network Performance
  static const Map<String, int> networkTimeouts = {
    'connection_timeout_ms': 30000, // 30 seconds
    'read_timeout_ms': 30000,
    'write_timeout_ms': 30000,
  };

  // Private constructor
  PlatformPerformanceTargets._();
}

/// Platform-specific Security Settings
class PlatformSecuritySettings {
  // Certificate Pinning (for production)
  static const bool enableCertificatePinning = false; // Enable in production
  static const List<String> pinnedCertificates = [];

  // Secure Storage
  static const Map<String, String> secureStorageConfig = {
    'android': 'encrypted_shared_preferences',
    'ios': 'keychain',
    'web': 'encrypted_local_storage',
  };

  // Biometric Authentication Settings
  static const Map<String, dynamic> biometricSettings = {
    'android': {
      'title': 'Biometric Authentication',
      'subtitle': 'Use your fingerprint or face to authenticate',
      'negative_button': 'Cancel',
      'use_error_dialogs': true,
      'sticky_auth': true,
    },
    'ios': {
      'localized_reason': 'Authenticate to access your account',
      'use_error_dialogs': true,
      'sticky_auth': true,
    },
  };

  // Private constructor
  PlatformSecuritySettings._();
}

/// Platform Detection Helpers
class PlatformDetectionHelpers {
  // User Agent Patterns for Web
  static const Map<String, String> webUserAgentPatterns = {
    'mobile': r'(Mobile|Android|iPhone|iPad|iPod|webOS|BlackBerry)',
    'tablet': r'(iPad|Android(?!.*Mobile))',
    'desktop': r'(Windows|Macintosh|Linux)',
  };

  // Device Type Detection
  static const Map<String, Map<String, dynamic>> deviceTypeThresholds = {
    'phone': {
      'max_width': 600,
      'max_diagonal_inches': 7,
    },
    'tablet': {
      'min_width': 600,
      'max_width': 1024,
      'min_diagonal_inches': 7,
      'max_diagonal_inches': 13,
    },
    'desktop': {
      'min_width': 1024,
      'min_diagonal_inches': 13,
    },
  };

  // Private constructor
  PlatformDetectionHelpers._();
}
