import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/platform_detector.dart';
import 'adaptive_storage_service.dart';

/// Secure storage service for mobile platforms using flutter_secure_storage
/// Provides hardware-backed encryption on supported devices
class SecureStorageService implements StorageInterface {
  static const String _securePrefix = 'secure_';
  
  late final FlutterSecureStorage _secureStorage;
  late final SharedPreferences _preferences;
  bool _initialized = false;

  @override
  Future<void> initialize() async {
    if (_initialized) return;
    
    try {
      // Initialize secure storage with platform-appropriate options
      AndroidOptions androidOptions = const AndroidOptions(
        encryptedSharedPreferences: true,
        sharedPreferencesName: 'social_impact_secure_prefs',
        preferencesKeyPrefix: 'secure_',
      );
      
      IOSOptions iosOptions = const IOSOptions(
        groupId: 'group.com.socialimpact.app',
        accountName: 'social_impact_keychain',
        accessibility: KeychainAccessibility.first_unlock_this_device,
      );
      
      _secureStorage = FlutterSecureStorage(
        aOptions: androidOptions,
        iOptions: iosOptions,
      );
      
      // Initialize shared preferences for non-secure storage
      _preferences = await SharedPreferences.getInstance();
      
      _initialized = true;
      
      if (kDebugMode) {
        print('SecureStorageService: Initialized successfully');
        final info = await getStorageInfo();
        print('SecureStorageService: $info');
      }
    } catch (e) {
      if (kDebugMode) {
        print('SecureStorageService: Initialization error: $e');
      }
      rethrow;
    }
  }

  void _ensureInitialized() {
    if (!_initialized) {
      throw StateError('SecureStorageService must be initialized before use');
    }
  }

  @override
  Future<void> setString({
    required String key,
    required String value,
    bool secure = false,
  }) async {
    _ensureInitialized();
    
    try {
      if (secure) {
        await _secureStorage.write(key: _secureKey(key), value: value);
      } else {
        await _preferences.setString(key, value);
      }
    } catch (e) {
      if (kDebugMode) {
        print('SecureStorageService: Error setting string for key $key: $e');
      }
      rethrow;
    }
  }

  @override
  Future<String?> getString({
    required String key,
    bool secure = false,
  }) async {
    _ensureInitialized();
    
    try {
      if (secure) {
        return await _secureStorage.read(key: _secureKey(key));
      } else {
        return _preferences.getString(key);
      }
    } catch (e) {
      if (kDebugMode) {
        print('SecureStorageService: Error getting string for key $key: $e');
      }
      return null;
    }
  }

  @override
  Future<bool> containsKey({
    required String key,
    bool secure = false,
  }) async {
    _ensureInitialized();
    
    try {
      if (secure) {
        return await _secureStorage.containsKey(key: _secureKey(key));
      } else {
        return _preferences.containsKey(key);
      }
    } catch (e) {
      if (kDebugMode) {
        print('SecureStorageService: Error checking key existence $key: $e');
      }
      return false;
    }
  }

  @override
  Future<void> remove({
    required String key,
    bool secure = false,
  }) async {
    _ensureInitialized();
    
    try {
      if (secure) {
        await _secureStorage.delete(key: _secureKey(key));
      } else {
        await _preferences.remove(key);
      }
    } catch (e) {
      if (kDebugMode) {
        print('SecureStorageService: Error removing key $key: $e');
      }
    }
  }

  @override
  Future<void> clear({bool secure = false}) async {
    _ensureInitialized();
    
    try {
      if (secure) {
        await _secureStorage.deleteAll();
      } else {
        await _preferences.clear();
      }
    } catch (e) {
      if (kDebugMode) {
        print('SecureStorageService: Error clearing storage (secure: $secure): $e');
      }
    }
  }

  @override
  Future<Set<String>> getAllKeys({bool secure = false}) async {
    _ensureInitialized();
    
    try {
      if (secure) {
        final allSecureKeys = await _secureStorage.readAll();
        return allSecureKeys.keys
            .where((key) => key.startsWith(_securePrefix))
            .map((key) => key.substring(_securePrefix.length))
            .toSet();
      } else {
        return _preferences.getKeys();
      }
    } catch (e) {
      if (kDebugMode) {
        print('SecureStorageService: Error getting all keys (secure: $secure): $e');
      }
      return <String>{};
    }
  }

  @override
  Future<StorageInfo> getStorageInfo() async {
    _ensureInitialized();
    
    try {
      final platform = PlatformDetector.isAndroid ? 'Android' :
                      PlatformDetector.isIOS ? 'iOS' : 'Mobile';
      
      // Check if hardware security is available
      bool hasHardwareSecurity = false;
      try {
        await _secureStorage.write(key: '_test_key', value: 'test');
        await _secureStorage.delete(key: '_test_key');
        hasHardwareSecurity = true;
      } catch (e) {
        hasHardwareSecurity = false;
      }
      
      return StorageInfo(
        platform: platform,
        storageType: 'SecureStorage + SharedPreferences',
        supportsEncryption: true,
        supportsBiometricLock: PlatformDetector.supportsBiometrics,
        isPersistent: true,
        additionalInfo: {
          'hasHardwareSecurity': hasHardwareSecurity,
          'androidEncryptedPrefs': PlatformDetector.isAndroid,
          'iosKeychainAccess': PlatformDetector.isIOS,
          'biometricSupport': PlatformDetector.supportsBiometrics,
        },
      );
    } catch (e) {
      if (kDebugMode) {
        print('SecureStorageService: Error getting storage info: $e');
      }
      
      return const StorageInfo(
        platform: 'Mobile',
        storageType: 'SecureStorage (Error)',
        supportsEncryption: false,
        supportsBiometricLock: false,
        isPersistent: true,
        additionalInfo: {'error': 'Failed to get storage info'},
      );
    }
  }

  @override
  Future<void> dispose() async {
    // FlutterSecureStorage doesn't require explicit disposal
    _initialized = false;
  }

  /// Helper method to create secure keys with prefix
  String _secureKey(String key) => '$_securePrefix$key';

  /// Migrate data from SharedPreferences to SecureStorage
  Future<void> migrateToSecure(String key) async {
    _ensureInitialized();
    
    try {
      final value = _preferences.getString(key);
      if (value != null) {
        await _secureStorage.write(key: _secureKey(key), value: value);
        await _preferences.remove(key);
        
        if (kDebugMode) {
          print('SecureStorageService: Migrated key $key to secure storage');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('SecureStorageService: Error migrating key $key: $e');
      }
    }
  }

  /// Batch write operation for better performance
  Future<void> batchWrite(Map<String, String> data, {bool secure = false}) async {
    _ensureInitialized();
    
    try {
      if (secure) {
        for (final entry in data.entries) {
          await _secureStorage.write(key: _secureKey(entry.key), value: entry.value);
        }
      } else {
        for (final entry in data.entries) {
          await _preferences.setString(entry.key, entry.value);
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('SecureStorageService: Error in batch write (secure: $secure): $e');
      }
      rethrow;
    }
  }

  /// Batch read operation
  Future<Map<String, String?>> batchRead(List<String> keys, {bool secure = false}) async {
    _ensureInitialized();
    
    final result = <String, String?>{};
    
    try {
      if (secure) {
        for (final key in keys) {
          result[key] = await _secureStorage.read(key: _secureKey(key));
        }
      } else {
        for (final key in keys) {
          result[key] = _preferences.getString(key);
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('SecureStorageService: Error in batch read (secure: $secure): $e');
      }
    }
    
    return result;
  }

  /// Check if secure storage is functioning properly
  Future<bool> testSecureStorage() async {
    _ensureInitialized();
    
    try {
      const testKey = '_test_secure_storage';
      const testValue = 'test_value_12345';
      
      // Test write
      await _secureStorage.write(key: testKey, value: testValue);
      
      // Test read
      final readValue = await _secureStorage.read(key: testKey);
      
      // Test delete
      await _secureStorage.delete(key: testKey);
      
      // Verify deletion
      final deletedValue = await _secureStorage.read(key: testKey);
      
      return readValue == testValue && deletedValue == null;
    } catch (e) {
      if (kDebugMode) {
        print('SecureStorageService: Secure storage test failed: $e');
      }
      return false;
    }
  }

  /// Get storage statistics
  Future<StorageStats> getStats() async {
    _ensureInitialized();
    
    try {
      final regularKeys = await getAllKeys(secure: false);
      final secureKeys = await getAllKeys(secure: true);
      
      int regularSize = 0;
      for (final key in regularKeys) {
        final value = _preferences.getString(key);
        if (value != null) {
          regularSize += value.length;
        }
      }
      
      int secureSize = 0;
      for (final key in secureKeys) {
        final value = await _secureStorage.read(key: _secureKey(key));
        if (value != null) {
          secureSize += value.length;
        }
      }
      
      return StorageStats(
        regularKeyCount: regularKeys.length,
        secureKeyCount: secureKeys.length,
        regularDataSize: regularSize,
        secureDataSize: secureSize,
        totalKeys: regularKeys.length + secureKeys.length,
        totalDataSize: regularSize + secureSize,
      );
    } catch (e) {
      if (kDebugMode) {
        print('SecureStorageService: Error getting stats: $e');
      }
      return const StorageStats();
    }
  }
}

/// Storage statistics helper class
class StorageStats {
  final int regularKeyCount;
  final int secureKeyCount;
  final int regularDataSize;
  final int secureDataSize;
  final int totalKeys;
  final int totalDataSize;
  
  const StorageStats({
    this.regularKeyCount = 0,
    this.secureKeyCount = 0,
    this.regularDataSize = 0,
    this.secureDataSize = 0,
    this.totalKeys = 0,
    this.totalDataSize = 0,
  });
  
  @override
  String toString() {
    return 'StorageStats('
        'regular: $regularKeyCount keys, $regularDataSize bytes, '
        'secure: $secureKeyCount keys, $secureDataSize bytes, '
        'total: $totalKeys keys, $totalDataSize bytes'
        ')';
  }
}