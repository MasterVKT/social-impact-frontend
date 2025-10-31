import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'adaptive_storage_service.dart';

/// Utility class for common storage operations
/// Provides convenience methods for storing complex data types
class StorageUtils {
  static AdaptiveStorageService get _storage => AdaptiveStorageService.instance;
  
  /// Store data as JSON
  static Future<void> setJson({
    required String key,
    required Map<String, dynamic> value,
    bool secure = false,
  }) async {
    await _storage.setJson(key: key, value: value, secure: secure);
  }
  
  /// Get data as JSON
  static Future<Map<String, dynamic>?> getJson({
    required String key,
    bool secure = false,
  }) async {
    return await _storage.getJson(key: key, secure: secure);
  }
}

/// Cache management utilities
class StorageCacheUtils {
    static AdaptiveStorageService get _storage => AdaptiveStorageService.instance;
    /// Store data with expiration timestamp
    static Future<void> setWithExpiry({
      required String key,
      required Map<String, dynamic> data,
      required Duration expiry,
      bool secure = false,
    }) async {
      final expiryTimestamp = DateTime.now().add(expiry).millisecondsSinceEpoch;
      final cacheData = {
        'data': data,
        'expiry': expiryTimestamp,
        'created': DateTime.now().millisecondsSinceEpoch,
      };
      
      await _storage.setJson(key: key, value: cacheData, secure: secure);
    }

    /// Get cached data if not expired
    static Future<Map<String, dynamic>?> getIfValid({
      required String key,
      bool secure = false,
    }) async {
      final cacheData = await _storage.getJson(key: key, secure: secure);
      if (cacheData == null) return null;

      final expiryTimestamp = cacheData['expiry'] as int?;
      if (expiryTimestamp == null) return null;

      final now = DateTime.now().millisecondsSinceEpoch;
      if (now > expiryTimestamp) {
        // Cache expired, remove it
        await _storage.remove(key: key, secure: secure);
        return null;
      }

      return cacheData['data'] as Map<String, dynamic>?;
    }

    /// Check if cached data exists and is valid
    static Future<bool> isValid({
      required String key,
      bool secure = false,
    }) async {
      final data = await getIfValid(key: key, secure: secure);
      return data != null;
    }

    /// Clear all expired cache entries
    static Future<void> clearExpired() async {
      final allKeys = await _storage.getAllKeys(secure: false);
      final secureKeys = await _storage.getAllKeys(secure: true);
      
      final now = DateTime.now().millisecondsSinceEpoch;
      
      // Check regular cache
      for (final key in allKeys) {
        if (key.contains('cache')) {
          final data = await _storage.getJson(key: key, secure: false);
          if (data != null) {
            final expiry = data['expiry'] as int?;
            if (expiry != null && now > expiry) {
              await _storage.remove(key: key, secure: false);
            }
          }
        }
      }
      
      // Check secure cache
      for (final key in secureKeys) {
        if (key.contains('cache')) {
          final data = await _storage.getJson(key: key, secure: true);
          if (data != null) {
            final expiry = data['expiry'] as int?;
            if (expiry != null && now > expiry) {
              await _storage.remove(key: key, secure: true);
            }
          }
        }
      }
    }
}

/// User preferences utilities
class StoragePreferences {
  static AdaptiveStorageService get _storage => AdaptiveStorageService.instance;
    /// Store user preference with validation
    static Future<void> setPreference<T>({
      required String key,
      required T value,
      T? defaultValue,
    }) async {
      if (value == null && defaultValue != null) {
        await _storage.setString(key: 'pref_$key', value: defaultValue.toString());
      } else {
        await _storage.setString(key: 'pref_$key', value: value.toString());
      }
    }

    /// Get user preference with type safety
    static Future<T?> getPreference<T>({
      required String key,
      T? defaultValue,
    }) async {
      final stringValue = await _storage.getString(key: 'pref_$key');
      if (stringValue == null) return defaultValue;

      try {
        if (T == bool) {
          return (stringValue.toLowerCase() == 'true') as T?;
        } else if (T == int) {
          return int.tryParse(stringValue) as T?;
        } else if (T == double) {
          return double.tryParse(stringValue) as T?;
        } else {
          return stringValue as T?;
        }
      } catch (e) {
        if (kDebugMode) {
          print('StorageUtils: Error parsing preference $key: $e');
        }
        return defaultValue;
      }
    }

    /// Store multiple preferences at once
    static Future<void> setBatch(Map<String, dynamic> preferences) async {
      for (final entry in preferences.entries) {
        await setPreference(key: entry.key, value: entry.value);
      }
    }

    /// Export all preferences
    static Future<Map<String, dynamic>> exportAll() async {
      final allKeys = await _storage.getAllKeys();
      final preferences = <String, dynamic>{};
      
      for (final key in allKeys) {
        if (key.startsWith('pref_')) {
          final prefKey = key.substring(5); // Remove 'pref_' prefix
          final value = await _storage.getString(key: key);
          if (value != null) {
            preferences[prefKey] = value;
          }
        }
      }
      
      return preferences;
    }
}

/// Session management utilities
class StorageSession {
  static AdaptiveStorageService get _storage => AdaptiveStorageService.instance;
    /// Store session data with automatic cleanup
    static Future<void> storeSessionData({
      required String key,
      required Map<String, dynamic> data,
      Duration? timeout,
    }) async {
      final sessionData = {
        'data': data,
        'created': DateTime.now().millisecondsSinceEpoch,
        'timeout': timeout?.inMilliseconds,
      };
      
      await _storage.setJson(key: 'session_$key', value: sessionData, secure: true);
    }

    /// Get session data if still valid
    static Future<Map<String, dynamic>?> getSessionData({
      required String key,
    }) async {
      final sessionData = await _storage.getJson(key: 'session_$key', secure: true);
      if (sessionData == null) return null;

      final created = sessionData['created'] as int?;
      final timeoutMs = sessionData['timeout'] as int?;
      
      if (created != null && timeoutMs != null) {
        final now = DateTime.now().millisecondsSinceEpoch;
        if (now > created + timeoutMs) {
          // Session expired
          await _storage.remove(key: 'session_$key', secure: true);
          return null;
        }
      }

      return sessionData['data'] as Map<String, dynamic>?;
    }

    /// Clear all session data
    static Future<void> clearAll() async {
      final secureKeys = await _storage.getAllKeys(secure: true);
      
      for (final key in secureKeys) {
        if (key.startsWith('session_')) {
          await _storage.remove(key: key, secure: true);
        }
      }
    }

    /// Extend session timeout
    static Future<void> extendTimeout({
      required String key,
      required Duration newTimeout,
    }) async {
      final sessionData = await _storage.getJson(key: 'session_$key', secure: true);
      if (sessionData != null) {
        sessionData['created'] = DateTime.now().millisecondsSinceEpoch;
        sessionData['timeout'] = newTimeout.inMilliseconds;
        await _storage.setJson(key: 'session_$key', value: sessionData, secure: true);
      }
    }
}

/// Security utilities
class StorageSecurity {
  static AdaptiveStorageService get _storage => AdaptiveStorageService.instance;
    /// Store sensitive data with additional security
    static Future<void> storeSecureData({
      required String key,
      required dynamic data,
      String? userPin,
    }) async {
      Map<String, dynamic> secureData = {
        'data': data,
        'timestamp': DateTime.now().millisecondsSinceEpoch,
        'checksum': _generateChecksum(data),
      };

      if (userPin != null) {
        secureData['pin_hash'] = _hashPin(userPin);
      }

      await _storage.setJson(key: 'secure_$key', value: secureData, secure: true);
    }

    /// Retrieve secure data with validation
    static Future<dynamic> getSecureData({
      required String key,
      String? userPin,
    }) async {
      final secureData = await _storage.getJson(key: 'secure_$key', secure: true);
      if (secureData == null) return null;

      // Validate PIN if provided
      if (userPin != null) {
        final storedPinHash = secureData['pin_hash'] as String?;
        if (storedPinHash == null || storedPinHash != _hashPin(userPin)) {
          throw const SecurityException('Invalid PIN provided');
        }
      }

      final data = secureData['data'];
      final storedChecksum = secureData['checksum'] as String?;
      
      // Validate data integrity
      if (storedChecksum != null && storedChecksum != _generateChecksum(data)) {
        throw const SecurityException('Data integrity check failed');
      }

      return data;
    }

    /// Clear all secure data
    static Future<void> clearAllSecureData() async {
      final secureKeys = await _storage.getAllKeys(secure: true);
      
      for (final key in secureKeys) {
        if (key.startsWith('secure_')) {
          await _storage.remove(key: key, secure: true);
        }
      }
    }

    /// Generate simple checksum for data validation
    static String _generateChecksum(dynamic data) {
      final jsonString = jsonEncode(data);
      return jsonString.hashCode.toString();
    }

    /// Simple PIN hashing (not cryptographically secure)
    static String _hashPin(String pin) {
      return pin.hashCode.toString();
    }
}

/// Migration utilities
class StorageMigration {
  static AdaptiveStorageService get _storage => AdaptiveStorageService.instance;
    /// Migrate data from old key structure to new
    static Future<void> migrateKeys(Map<String, String> keyMappings) async {
      for (final entry in keyMappings.entries) {
        final oldKey = entry.key;
        final newKey = entry.value;
        
        // Check regular storage
        if (await _storage.containsKey(key: oldKey, secure: false)) {
          final value = await _storage.getString(key: oldKey, secure: false);
          if (value != null) {
            await _storage.setString(key: newKey, value: value, secure: false);
            await _storage.remove(key: oldKey, secure: false);
          }
        }
        
        // Check secure storage
        if (await _storage.containsKey(key: oldKey, secure: true)) {
          final value = await _storage.getString(key: oldKey, secure: true);
          if (value != null) {
            await _storage.setString(key: newKey, value: value, secure: true);
            await _storage.remove(key: oldKey, secure: true);
          }
        }
      }
    }

    /// Get storage version and perform migrations if needed
    static Future<void> performMigrations() async {
      const currentVersion = 1;
      final storedVersion = await _storage.getInt(key: 'storage_version') ?? 0;
      
      if (storedVersion < currentVersion) {
        if (kDebugMode) {
          print('StorageUtils: Performing migration from v$storedVersion to v$currentVersion');
        }
        
        // Perform version-specific migrations here
        // if (storedVersion < 1) { ... }
        
        await _storage.setInt(key: 'storage_version', value: currentVersion);
      }
    }
}

/// Debugging and maintenance utilities
class StorageDebug {
  static AdaptiveStorageService get _storage => AdaptiveStorageService.instance;
    /// Get detailed storage information
    static Future<Map<String, dynamic>> getDetailedInfo() async {
      final info = await _storage.getStorageInfo();
      final regularKeys = await _storage.getAllKeys(secure: false);
      final secureKeys = await _storage.getAllKeys(secure: true);
      
      return {
        'storage_info': {
          'platform': info.platform,
          'storage_type': info.storageType,
          'supports_encryption': info.supportsEncryption,
          'supports_biometric_lock': info.supportsBiometricLock,
          'is_persistent': info.isPersistent,
          'max_storage_size': info.maxStorageSize,
        },
        'key_counts': {
          'regular': regularKeys.length,
          'secure': secureKeys.length,
          'total': regularKeys.length + secureKeys.length,
        },
        'key_samples': {
          'regular': regularKeys.take(10).toList(),
          'secure': secureKeys.take(10).toList(),
        },
      };
    }

    /// Export all data for debugging
    static Future<Map<String, dynamic>> exportForDebug() async {
      final backup = await _storage.backup(includeSecure: false);
      final info = await getDetailedInfo();
      
      return {
        'timestamp': DateTime.now().toIso8601String(),
        'storage_info': info,
        'data': backup,
      };
    }
}

/// Custom exception for security-related storage errors
class SecurityException implements Exception {
  final String message;
  const SecurityException(this.message);
  
  @override
  String toString() => 'SecurityException: $message';
}