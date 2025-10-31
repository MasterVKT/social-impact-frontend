import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart' hide BiometricType;
import 'package:local_auth/local_auth.dart' as local_auth show BiometricType;
import '../../../../core/services/storage/adaptive_storage_service.dart';
import '../../../../core/utils/platform_detector.dart';

/// Biometric authentication service for mobile platforms
/// Provides secure biometric authentication using device hardware
class BiometricAuthService {
  static final LocalAuthentication _localAuth = LocalAuthentication();
  static const String _biometricEnabledKey = 'biometric_enabled';
  static const String _biometricUserKey = 'biometric_user_id';
  
  /// Check if biometric authentication is supported on current platform
  static bool get isSupported => PlatformDetector.supportsBiometrics;
  
  /// Check if device has biometric capabilities
  static Future<bool> isDeviceSupported() async {
    if (!isSupported) return false;
    
    try {
      return await _localAuth.isDeviceSupported();
    } catch (e) {
      if (kDebugMode) {
        print('Biometric device support check error: $e');
      }
      return false;
    }
  }
  
  /// Check if biometric authentication is available on the device
  static Future<bool> isBiometricsAvailable() async {
    if (!isSupported) return false;
    
    try {
      // Check if device supports biometrics
      final isSupported = await isDeviceSupported();
      if (!isSupported) return false;
      
      // Check if biometrics are enrolled
      final availableBiometrics = await _localAuth.getAvailableBiometrics();
      return availableBiometrics.isNotEmpty;
    } catch (e) {
      if (kDebugMode) {
        print('Biometric availability check error: $e');
      }
      return false;
    }
  }
  
  /// Get available biometric types
  static Future<List<local_auth.BiometricType>> getAvailableBiometrics() async {
    if (!isSupported) return [];
    
    try {
      return await _localAuth.getAvailableBiometrics();
    } catch (e) {
      if (kDebugMode) {
        print('Get available biometrics error: $e');
      }
      return [];
    }
  }
  
  /// Check if biometric authentication is enabled for current user
  static Future<bool> isBiometricEnabled({String? userId}) async {
    if (!isSupported) return false;
    
    try {
      final storage = AdaptiveStorageService.instance;
      final isEnabled = await storage.getBool(key: '${_biometricEnabledKey}_$userId', secure: true) ?? false;
      final storedUserId = await storage.getString(key: _biometricUserKey, secure: true);
      
      // Biometric is enabled only if flag is true and user ID matches
      return isEnabled && storedUserId == userId;
    } catch (e) {
      if (kDebugMode) {
        print('Check biometric enabled error: $e');
      }
      return false;
    }
  }
  
  /// Enable biometric authentication for current user
  static Future<BiometricEnrollmentResult> enableBiometric({
    required String userId,
    required String userEmail,
  }) async {
    if (!isSupported) {
      return BiometricEnrollmentResult.failure(
        'Biometric authentication is not supported on this platform',
      );
    }
    
    try {
      // Check device support
      final deviceSupported = await isDeviceSupported();
      if (!deviceSupported) {
        return BiometricEnrollmentResult.failure(
          'Biometric authentication is not supported on this device',
        );
      }
      
      // Check if biometrics are available
      final isAvailable = await isBiometricsAvailable();
      if (!isAvailable) {
        return BiometricEnrollmentResult.failure(
          'No biometrics are enrolled on this device. Please set up biometrics in device settings.',
        );
      }
      
      // Test biometric authentication
      final didAuthenticate = await authenticate(
        reason: 'Enable biometric authentication for your account',
      );
      
      if (!didAuthenticate.success) {
        return BiometricEnrollmentResult.failure(
          didAuthenticate.errorMessage ?? 'Biometric authentication failed',
        );
      }
      
      // Store biometric settings
      final storage = AdaptiveStorageService.instance;
      await storage.setBool(key: '${_biometricEnabledKey}_$userId', value: true, secure: true);
      await storage.setString(key: _biometricUserKey, value: userId, secure: true);
      await storage.setString(key: '${_biometricUserKey}_email', value: userEmail, secure: true);
      
      return BiometricEnrollmentResult.success();
    } catch (e) {
      return BiometricEnrollmentResult.failure(
        'Failed to enable biometric authentication: ${e.toString()}',
      );
    }
  }
  
  /// Disable biometric authentication for current user
  static Future<void> disableBiometric({String? userId}) async {
    if (!isSupported) return;
    
    try {
      final storage = AdaptiveStorageService.instance;
      await storage.remove(key: '${_biometricEnabledKey}_$userId', secure: true);
      await storage.remove(key: _biometricUserKey, secure: true);
      await storage.remove(key: '${_biometricUserKey}_email', secure: true);
    } catch (e) {
      if (kDebugMode) {
        print('Disable biometric error: $e');
      }
    }
  }
  
  /// Authenticate user with biometrics
  static Future<BiometricAuthResult> authenticate({
    required String reason,
    bool useErrorDialogs = true,
    bool stickyAuth = false,
  }) async {
    if (!isSupported) {
      return BiometricAuthResult.failure(
        'Biometric authentication is not supported on this platform',
      );
    }
    
    try {
      // Check if biometrics are available
      final isAvailable = await isBiometricsAvailable();
      if (!isAvailable) {
        return BiometricAuthResult.failure(
          'Biometric authentication is not available. Please check your device settings.',
        );
      }
      
      // Authenticate with biometrics
      final didAuthenticate = await _localAuth.authenticate(
        localizedReason: reason,
        options: AuthenticationOptions(
          useErrorDialogs: useErrorDialogs,
          stickyAuth: stickyAuth,
          biometricOnly: true,
        ),
      );
      
      if (didAuthenticate) {
        return BiometricAuthResult.success();
      } else {
        return BiometricAuthResult.failure('Biometric authentication was cancelled or failed');
      }
    } on PlatformException catch (e) {
      return BiometricAuthResult.failure(_mapPlatformException(e));
    } catch (e) {
      return BiometricAuthResult.failure(
        'Biometric authentication error: ${e.toString()}',
      );
    }
  }
  
  /// Get stored user information for biometric authentication
  static Future<BiometricUserInfo?> getStoredUserInfo() async {
    if (!isSupported) return null;
    
    try {
      final storage = AdaptiveStorageService.instance;
      final userId = await storage.getString(key: _biometricUserKey, secure: true);
      final userEmail = await storage.getString(key: '${_biometricUserKey}_email', secure: true);
      
      if (userId == null || userEmail == null) return null;
      
      return BiometricUserInfo(
        userId: userId,
        email: userEmail,
      );
    } catch (e) {
      if (kDebugMode) {
        print('Get stored user info error: $e');
      }
      return null;
    }
  }
  
  /// Get comprehensive biometric capabilities information
  static Future<BiometricCapabilities> getCapabilities() async {
    if (!isSupported) {
      return const BiometricCapabilities(
        isSupported: false,
        isDeviceSupported: false,
        isAvailable: false,
        isEnrolled: false,
        availableBiometrics: [],
        reason: 'Biometric authentication is not supported on this platform',
      );
    }
    
    try {
      final deviceSupported = await isDeviceSupported();
      final isAvailable = await isBiometricsAvailable();
      final availableBiometrics = await getAvailableBiometrics();
      
      String reason;
      if (!deviceSupported) {
        reason = 'Biometric authentication is not supported on this device';
      } else if (!isAvailable) {
        reason = 'No biometrics are enrolled on this device';
      } else {
        reason = 'Biometric authentication is ready';
      }
      
      return BiometricCapabilities(
        isSupported: true,
        isDeviceSupported: deviceSupported,
        isAvailable: isAvailable,
        isEnrolled: availableBiometrics.isNotEmpty,
        availableBiometrics: availableBiometrics,
        reason: reason,
      );
    } catch (e) {
      return BiometricCapabilities(
        isSupported: true,
        isDeviceSupported: false,
        isAvailable: false,
        isEnrolled: false,
        availableBiometrics: const <local_auth.BiometricType>[],
        reason: 'Failed to check biometric capabilities: ${e.toString()}',
      );
    }
  }
  
  /// Get user-friendly biometric type name
  static String getBiometricTypeName(local_auth.BiometricType type) {
    switch (type) {
      case local_auth.BiometricType.face:
        return 'Face ID';
      case local_auth.BiometricType.fingerprint:
        return 'Fingerprint';
      case local_auth.BiometricType.iris:
        return 'Iris';
      case local_auth.BiometricType.weak:
        return 'PIN/Pattern/Password';
      case local_auth.BiometricType.strong:
        return 'Strong Biometric';
    }
  }
  
  /// Get appropriate icon for biometric type
  static String getBiometricTypeIcon(local_auth.BiometricType type) {
    switch (type) {
      case local_auth.BiometricType.face:
        return 'face';
      case local_auth.BiometricType.fingerprint:
        return 'fingerprint';
      case local_auth.BiometricType.iris:
        return 'remove_red_eye';
      case local_auth.BiometricType.weak:
        return 'security';
      case local_auth.BiometricType.strong:
        return 'verified_user';
    }
  }
  
  /// Map platform exception to user-friendly message
  static String _mapPlatformException(PlatformException e) {
    switch (e.code) {
      case 'NotAvailable':
        return 'Biometric authentication is not available on this device';
      case 'NotEnrolled':
        return 'No biometrics are enrolled. Please set up biometrics in device settings';
      case 'LockedOut':
        return 'Biometric authentication is locked. Please try again later';
      case 'PermanentlyLockedOut':
        return 'Biometric authentication is permanently locked. Please use alternative authentication';
      case 'BiometricOnlyNotSupported':
        return 'Device does not support biometric-only authentication';
      case 'UserCancel':
        return 'Biometric authentication was cancelled';
      case 'UserFallback':
        return 'User chose to use fallback authentication method';
      case 'SystemCancel':
        return 'Biometric authentication was cancelled by the system';
      case 'InvalidContext':
        return 'Authentication context is invalid';
      case 'NotImplemented':
        return 'Biometric authentication is not implemented on this platform';
      default:
        return e.message ?? 'Biometric authentication failed';
    }
  }
  
  /// Clear all biometric data (for logout/account deletion)
  static Future<void> clearBiometricData() async {
    if (!isSupported) return;
    
    try {
      final storage = AdaptiveStorageService.instance;
      final keys = await storage.getAllKeys(secure: true);
      
      // Remove all biometric-related keys
      for (final key in keys) {
        if (key.startsWith(_biometricEnabledKey) || 
            key.startsWith(_biometricUserKey)) {
          await storage.remove(key: key, secure: true);
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Clear biometric data error: $e');
      }
    }
  }
  
  /// Initialize biometric service
  static Future<void> initialize() async {
    if (!isSupported) {
      if (kDebugMode) {
        print('Biometric Auth: Not supported on this platform');
      }
      return;
    }
    
    try {
      final capabilities = await getCapabilities();
      if (kDebugMode) {
        print('Biometric Auth: Capabilities = ${capabilities.toString()}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Biometric Auth initialization error: $e');
      }
    }
  }
}

// Helper Data Classes

/// Result of biometric enrollment
class BiometricEnrollmentResult {
  final bool success;
  final String? errorMessage;
  
  const BiometricEnrollmentResult._(this.success, this.errorMessage);
  
  factory BiometricEnrollmentResult.success() {
    return const BiometricEnrollmentResult._(true, null);
  }
  
  factory BiometricEnrollmentResult.failure(String message) {
    return BiometricEnrollmentResult._(false, message);
  }
}

/// Result of biometric authentication
class BiometricAuthResult {
  final bool success;
  final String? errorMessage;
  
  const BiometricAuthResult._(this.success, this.errorMessage);
  
  factory BiometricAuthResult.success() {
    return const BiometricAuthResult._(true, null);
  }
  
  factory BiometricAuthResult.failure(String message) {
    return BiometricAuthResult._(false, message);
  }
}

/// Stored user information for biometric authentication
class BiometricUserInfo {
  final String userId;
  final String email;
  
  const BiometricUserInfo({
    required this.userId,
    required this.email,
  });
}

/// Comprehensive biometric capabilities information
class BiometricCapabilities {
  final bool isSupported;
  final bool isDeviceSupported;
  final bool isAvailable;
  final bool isEnrolled;
  final List<local_auth.BiometricType> availableBiometrics;
  final String reason;
  
  const BiometricCapabilities({
    required this.isSupported,
    required this.isDeviceSupported,
    required this.isAvailable,
    required this.isEnrolled,
    required this.availableBiometrics,
    required this.reason,
  });
  
  @override
  String toString() {
    return 'BiometricCapabilities('
        'isSupported: $isSupported, '
        'isDeviceSupported: $isDeviceSupported, '
        'isAvailable: $isAvailable, '
        'isEnrolled: $isEnrolled, '
        'availableBiometrics: $availableBiometrics, '
        'reason: $reason'
        ')';
  }
}