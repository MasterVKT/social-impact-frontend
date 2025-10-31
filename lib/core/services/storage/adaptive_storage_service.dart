import 'dart:convert';
import 'package:flutter/foundation.dart';
import '../../utils/platform_detector.dart';
import 'secure_storage_service.dart';
import 'web_storage_service.dart';

/// Adaptive storage service that automatically chooses the appropriate storage mechanism
/// - Mobile: Uses flutter_secure_storage for encrypted storage
/// - Web: Uses localStorage with basic encoding
/// - Desktop: Falls back to secure storage where available
class AdaptiveStorageService {
  static AdaptiveStorageService? _instance;
  static AdaptiveStorageService get instance {
    _instance ??= AdaptiveStorageService._internal();
    return _instance!;
  }

  AdaptiveStorageService._internal();

  late final StorageInterface _storage;

  /// Initialize the adaptive storage service
  Future<void> initialize() async {
    if (PlatformDetector.isWeb) {
      _storage = WebStorageService();
    } else {
      _storage = SecureStorageService();
    }
    
    await _storage.initialize();
    
    if (kDebugMode) {
      print('AdaptiveStorage: Initialized with ${_storage.runtimeType}');
    }
  }

  /// Store a string value with optional encryption
  Future<void> setString({
    required String key,
    required String value,
    bool secure = false,
  }) async {
    await _storage.setString(key: key, value: value, secure: secure);
  }

  /// Retrieve a string value
  Future<String?> getString({
    required String key,
    bool secure = false,
  }) async {
    return await _storage.getString(key: key, secure: secure);
  }

  /// Store an integer value
  Future<void> setInt({
    required String key,
    required int value,
    bool secure = false,
  }) async {
    await setString(key: key, value: value.toString(), secure: secure);
  }

  /// Retrieve an integer value
  Future<int?> getInt({
    required String key,
    bool secure = false,
  }) async {
    final stringValue = await getString(key: key, secure: secure);
    return stringValue != null ? int.tryParse(stringValue) : null;
  }

  /// Store a boolean value
  Future<void> setBool({
    required String key,
    required bool value,
    bool secure = false,
  }) async {
    await setString(key: key, value: value.toString(), secure: secure);
  }

  /// Retrieve a boolean value
  Future<bool?> getBool({
    required String key,
    bool secure = false,
  }) async {
    final stringValue = await getString(key: key, secure: secure);
    if (stringValue == null) return null;
    return stringValue.toLowerCase() == 'true';
  }

  /// Store a double value
  Future<void> setDouble({
    required String key,
    required double value,
    bool secure = false,
  }) async {
    await setString(key: key, value: value.toString(), secure: secure);
  }

  /// Retrieve a double value
  Future<double?> getDouble({
    required String key,
    bool secure = false,
  }) async {
    final stringValue = await getString(key: key, secure: secure);
    return stringValue != null ? double.tryParse(stringValue) : null;
  }

  /// Store a list of strings
  Future<void> setStringList({
    required String key,
    required List<String> value,
    bool secure = false,
  }) async {
    final jsonString = jsonEncode(value);
    await setString(key: key, value: jsonString, secure: secure);
  }

  /// Retrieve a list of strings
  Future<List<String>?> getStringList({
    required String key,
    bool secure = false,
  }) async {
    final jsonString = await getString(key: key, secure: secure);
    if (jsonString == null) return null;
    
    try {
      final List<dynamic> decoded = jsonDecode(jsonString);
      return decoded.cast<String>();
    } catch (e) {
      if (kDebugMode) {
        print('AdaptiveStorage: Error decoding string list for key $key: $e');
      }
      return null;
    }
  }

  /// Store a JSON-serializable object
  Future<void> setJson({
    required String key,
    required Map<String, dynamic> value,
    bool secure = false,
  }) async {
    final jsonString = jsonEncode(value);
    await setString(key: key, value: jsonString, secure: secure);
  }

  /// Retrieve a JSON object
  Future<Map<String, dynamic>?> getJson({
    required String key,
    bool secure = false,
  }) async {
    final jsonString = await getString(key: key, secure: secure);
    if (jsonString == null) return null;
    
    try {
      return jsonDecode(jsonString) as Map<String, dynamic>;
    } catch (e) {
      if (kDebugMode) {
        print('AdaptiveStorage: Error decoding JSON for key $key: $e');
      }
      return null;
    }
  }

  /// Check if a key exists
  Future<bool> containsKey({
    required String key,
    bool secure = false,
  }) async {
    return await _storage.containsKey(key: key, secure: secure);
  }

  /// Remove a value by key
  Future<void> remove({
    required String key,
    bool secure = false,
  }) async {
    await _storage.remove(key: key, secure: secure);
  }

  /// Clear all stored values
  Future<void> clear({bool secure = false}) async {
    await _storage.clear(secure: secure);
  }

  /// Clear all values (both secure and non-secure)
  Future<void> clearAll() async {
    await _storage.clear(secure: false);
    await _storage.clear(secure: true);
  }

  /// Get all keys
  Future<Set<String>> getAllKeys({bool secure = false}) async {
    return await _storage.getAllKeys(secure: secure);
  }

  /// Get storage info and capabilities
  Future<StorageInfo> getStorageInfo() async {
    return await _storage.getStorageInfo();
  }

  /// Backup data to JSON
  Future<Map<String, dynamic>> backup({bool includeSecure = false}) async {
    final backup = <String, dynamic>{};
    
    // Backup regular storage
    final regularKeys = await getAllKeys(secure: false);
    final regularData = <String, dynamic>{};
    
    for (final key in regularKeys) {
      final value = await getString(key: key, secure: false);
      if (value != null) {
        regularData[key] = value;
      }
    }
    backup['regular'] = regularData;
    
    // Backup secure storage if requested
    if (includeSecure) {
      final secureKeys = await getAllKeys(secure: true);
      final secureData = <String, dynamic>{};
      
      for (final key in secureKeys) {
        final value = await getString(key: key, secure: true);
        if (value != null) {
          secureData[key] = value;
        }
      }
      backup['secure'] = secureData;
    }
    
    return backup;
  }

  /// Restore data from JSON backup
  Future<void> restore(Map<String, dynamic> backup) async {
    // Restore regular storage
    if (backup.containsKey('regular')) {
      final regularData = backup['regular'] as Map<String, dynamic>;
      for (final entry in regularData.entries) {
        await setString(key: entry.key, value: entry.value.toString(), secure: false);
      }
    }
    
    // Restore secure storage
    if (backup.containsKey('secure')) {
      final secureData = backup['secure'] as Map<String, dynamic>;
      for (final entry in secureData.entries) {
        await setString(key: entry.key, value: entry.value.toString(), secure: true);
      }
    }
  }

  /// Migration helper - move data from one key to another
  Future<void> migrateKey({
    required String oldKey,
    required String newKey,
    bool secure = false,
  }) async {
    final value = await getString(key: oldKey, secure: secure);
    if (value != null) {
      await setString(key: newKey, value: value, secure: secure);
      await remove(key: oldKey, secure: secure);
    }
  }

  /// Dispose resources
  Future<void> dispose() async {
    await _storage.dispose();
  }
}

/// Abstract interface for storage implementations
abstract class StorageInterface {
  /// Initialize the storage service
  Future<void> initialize();
  
  /// Store a string value
  Future<void> setString({required String key, required String value, bool secure = false});
  
  /// Retrieve a string value
  Future<String?> getString({required String key, bool secure = false});
  
  /// Check if a key exists
  Future<bool> containsKey({required String key, bool secure = false});
  
  /// Remove a value by key
  Future<void> remove({required String key, bool secure = false});
  
  /// Clear all stored values
  Future<void> clear({bool secure = false});
  
  /// Get all keys
  Future<Set<String>> getAllKeys({bool secure = false});
  
  /// Get storage info
  Future<StorageInfo> getStorageInfo();
  
  /// Dispose resources
  Future<void> dispose();
}

/// Storage information and capabilities
class StorageInfo {
  final String platform;
  final String storageType;
  final bool supportsEncryption;
  final bool supportsBiometricLock;
  final bool isPersistent;
  final int? maxStorageSize;
  final Map<String, dynamic> additionalInfo;

  const StorageInfo({
    required this.platform,
    required this.storageType,
    required this.supportsEncryption,
    required this.supportsBiometricLock,
    required this.isPersistent,
    this.maxStorageSize,
    this.additionalInfo = const {},
  });

  @override
  String toString() {
    return 'StorageInfo('
        'platform: $platform, '
        'storageType: $storageType, '
        'supportsEncryption: $supportsEncryption, '
        'supportsBiometricLock: $supportsBiometricLock, '
        'isPersistent: $isPersistent, '
        'maxStorageSize: $maxStorageSize'
        ')';
  }
}

/// Common storage keys used throughout the app
class StorageKeys {
  // Authentication
  static const String userToken = 'user_token';
  static const String refreshToken = 'refresh_token';
  static const String userId = 'user_id';
  static const String userEmail = 'user_email';
  static const String biometricEnabled = 'biometric_enabled';
  static const String rememberMe = 'remember_me';
  static const String lastSignInMethod = 'last_sign_in_method';
  
  // User Preferences
  static const String themeMode = 'theme_mode';
  static const String language = 'language';
  static const String currency = 'currency';
  static const String notificationsEnabled = 'notifications_enabled';
  static const String analyticsEnabled = 'analytics_enabled';
  
  // App State
  static const String firstLaunch = 'first_launch';
  static const String onboardingCompleted = 'onboarding_completed';
  static const String lastAppVersion = 'last_app_version';
  static const String crashReportingEnabled = 'crash_reporting_enabled';
  
  // Cache
  static const String userProfileCache = 'user_profile_cache';
  static const String dashboardCache = 'dashboard_cache';
  static const String cacheTimestamp = 'cache_timestamp';
  
  // Security
  static const String securityPin = 'security_pin';
  static const String securityQuestions = 'security_questions';
  static const String lastSecurityCheck = 'last_security_check';
  static const String suspiciousActivityCount = 'suspicious_activity_count';
}