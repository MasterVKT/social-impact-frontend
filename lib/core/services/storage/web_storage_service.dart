import 'dart:convert';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:crypto/crypto.dart';
import 'adaptive_storage_service.dart';

// Conditional import for web platform
import 'web_storage_stub.dart'
    if (dart.library.html) 'web_storage_impl.dart';

/// Web storage service using localStorage with basic security measures
/// Provides persistent storage for web applications with optional encoding
class WebStorageService implements StorageInterface {
  static const String _securePrefix = 'secure_';
  static const String _appPrefix = 'social_impact_';
  
  bool _initialized = false;
  String? _encryptionKey;

  @override
  Future<void> initialize() async {
    if (_initialized) return;
    
    try {
      // Check if localStorage is available
      _encryptionKey = await _getOrCreateEncryptionKey();
      
      _initialized = true;
      
      if (kDebugMode) {
        print('WebStorageService: Initialized successfully');
        final info = await getStorageInfo();
        print('WebStorageService: $info');
      }
    } catch (e) {
      if (kDebugMode) {
        print('WebStorageService: Initialization error: $e');
      }
      rethrow;
    }
  }

  void _ensureInitialized() {
    if (!_initialized) {
      throw StateError('WebStorageService must be initialized before use');
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
      final storageKey = _buildKey(key, secure);
      final storageValue = secure ? _encodeValue(value) : value;
      
      WebStorageImpl.setItem(storageKey, storageValue);
    } catch (e) {
      if (kDebugMode) {
        print('WebStorageService: Error setting string for key $key: $e');
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
      final storageKey = _buildKey(key, secure);
      final storageValue = WebStorageImpl.getItem(storageKey);
      
      if (storageValue == null) return null;
      
      return secure ? _decodeValue(storageValue) : storageValue;
    } catch (e) {
      if (kDebugMode) {
        print('WebStorageService: Error getting string for key $key: $e');
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
      final storageKey = _buildKey(key, secure);
      return WebStorageImpl.keys.contains(storageKey);
    } catch (e) {
      if (kDebugMode) {
        print('WebStorageService: Error checking key existence $key: $e');
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
      final storageKey = _buildKey(key, secure);
      WebStorageImpl.removeItem(storageKey);
    } catch (e) {
      if (kDebugMode) {
        print('WebStorageService: Error removing key $key: $e');
      }
    }
  }

  @override
  Future<void> clear({bool secure = false}) async {
    _ensureInitialized();
    
    try {
      final keysToRemove = <String>[];
      final prefix = secure ? _buildKey('', true) : _appPrefix;
      
      for (final key in WebStorageImpl.keys) {
        if (key.startsWith(prefix)) {
          keysToRemove.add(key);
        }
      }
      
      for (final key in keysToRemove) {
        WebStorageImpl.removeItem(key);
      }
    } catch (e) {
      if (kDebugMode) {
        print('WebStorageService: Error clearing storage (secure: $secure): $e');
      }
    }
  }

  @override
  Future<Set<String>> getAllKeys({bool secure = false}) async {
    _ensureInitialized();
    
    try {
      final appKeys = <String>{};
      final prefix = secure ? _buildKey('', true) : _appPrefix;
      final prefixLength = prefix.length;
      
      for (final key in WebStorageImpl.keys) {
        if (key.startsWith(prefix)) {
          appKeys.add(key.substring(prefixLength));
        }
      }
      
      return appKeys;
    } catch (e) {
      if (kDebugMode) {
        print('WebStorageService: Error getting all keys (secure: $secure): $e');
      }
      return <String>{};
    }
  }

  @override
  Future<StorageInfo> getStorageInfo() async {
    _ensureInitialized();
    
    try {
      // Estimate storage usage
      int totalSize = 0;
      int appDataSize = 0;
      
      for (final key in WebStorageImpl.keys) {
        final value = WebStorageImpl.getItem(key) ?? '';
        totalSize += key.length + value.length;
        
        if (key.startsWith(_appPrefix)) {
          appDataSize += key.length + value.length;
        }
      }
      
      // Check if we can estimate quota
      int? quotaEstimate;
      try {
        // This is a rough estimate - localStorage typically has ~5-10MB limit
        quotaEstimate = 10 * 1024 * 1024; // 10MB estimate
      } catch (e) {
        quotaEstimate = null;
      }
      
      return StorageInfo(
        platform: 'Web',
        storageType: 'localStorage',
        supportsEncryption: false, // Basic encoding only
        supportsBiometricLock: false,
        isPersistent: true,
        maxStorageSize: quotaEstimate,
        additionalInfo: {
          'totalStorageSize': totalSize,
          'appDataSize': appDataSize,
          'totalKeys': WebStorageImpl.keys.length,
          'supportsSessionStorage': WebStorageImpl.supportsSessionStorage,
          'userAgent': WebStorageImpl.userAgent,
        },
      );
    } catch (e) {
      if (kDebugMode) {
        print('WebStorageService: Error getting storage info: $e');
      }
      
      return const StorageInfo(
        platform: 'Web',
        storageType: 'localStorage (Error)',
        supportsEncryption: false,
        supportsBiometricLock: false,
        isPersistent: true,
        additionalInfo: {'error': 'Failed to get storage info'},
      );
    }
  }

  @override
  Future<void> dispose() async {
    _initialized = false;
    _encryptionKey = null;
  }

  /// Build full storage key with app prefix
  String _buildKey(String key, bool secure) {
    return '$_appPrefix${secure ? _securePrefix : ''}$key';
  }

  /// Simple encoding for "secure" values (not cryptographically secure)
  String _encodeValue(String value) {
    if (_encryptionKey == null) return value;
    
    try {
      // Simple XOR encoding - not secure, just obfuscation
      final keyBytes = utf8.encode(_encryptionKey!);
      final valueBytes = utf8.encode(value);
      final encodedBytes = <int>[];
      
      for (int i = 0; i < valueBytes.length; i++) {
        encodedBytes.add(valueBytes[i] ^ keyBytes[i % keyBytes.length]);
      }
      
      return base64.encode(encodedBytes);
    } catch (e) {
      if (kDebugMode) {
        print('WebStorageService: Encoding error: $e');
      }
      return value; // Fallback to plain text
    }
  }

  /// Simple decoding for "secure" values
  String _decodeValue(String encodedValue) {
    if (_encryptionKey == null) return encodedValue;
    
    try {
      final keyBytes = utf8.encode(_encryptionKey!);
      final encodedBytes = base64.decode(encodedValue);
      final decodedBytes = <int>[];
      
      for (int i = 0; i < encodedBytes.length; i++) {
        decodedBytes.add(encodedBytes[i] ^ keyBytes[i % keyBytes.length]);
      }
      
      return utf8.decode(decodedBytes);
    } catch (e) {
      if (kDebugMode) {
        print('WebStorageService: Decoding error: $e');
      }
      return encodedValue; // Fallback to encoded value
    }
  }

  /// Generate or retrieve encryption key for obfuscation
  Future<String> _getOrCreateEncryptionKey() async {
    const keyName = '${_appPrefix}_encryption_key';
    
    try {
      String? existingKey = WebStorageImpl.getItem(keyName);
      
      if (existingKey != null && existingKey.isNotEmpty) {
        return existingKey;
      }
      
      // Generate a simple key based on browser info and random data
      final random = Random.secure();
      final randomBytes = List.generate(32, (_) => random.nextInt(256));
      final browserInfo = WebStorageImpl.userAgent;
      final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
      
      final keyData = '$browserInfo$timestamp${randomBytes.join()}';
      final keyHash = sha256.convert(utf8.encode(keyData)).toString();
      
      // Store the key
      WebStorageImpl.setItem(keyName, keyHash);
      
      return keyHash;
    } catch (e) {
      if (kDebugMode) {
        print('WebStorageService: Error creating encryption key: $e');
      }
      // Fallback to a static key (not recommended for production)
      return 'fallback_key_social_impact_2024';
    }
  }

  /// Check localStorage availability and quota
  Future<Map<String, dynamic>> checkStorageAvailability() async {
    try {
      // Test write capability
      const testKey = '${_appPrefix}_storage_test';
      const testValue = 'test_data_12345';
      
      WebStorageImpl.setItem(testKey, testValue);
      final readValue = WebStorageImpl.getItem(testKey);
      WebStorageImpl.removeItem(testKey);
      
      final isWorking = readValue == testValue;
      
      // Estimate available space (rough)
      int currentSize = 0;
      for (final key in WebStorageImpl.keys) {
        final value = WebStorageImpl.getItem(key) ?? '';
        currentSize += key.length + value.length;
      }
      
      return {
        'available': isWorking,
        'currentSize': currentSize,
        'estimatedQuota': 10 * 1024 * 1024, // 10MB estimate
        'keysCount': WebStorageImpl.keys.length,
        'supportsSessionStorage': WebStorageImpl.supportsSessionStorage,
      };
    } catch (e) {
      return {
        'available': false,
        'error': e.toString(),
        'currentSize': 0,
        'estimatedQuota': 0,
        'keysCount': 0,
      };
    }
  }

  /// Backup localStorage data to JSON
  Future<Map<String, dynamic>> exportData({bool includeSecure = false}) async {
    _ensureInitialized();
    
    final backup = <String, dynamic>{};
    const regularPrefix = _appPrefix;
    final securePrefix = _buildKey('', true);
    
    for (final key in WebStorageImpl.keys) {
      if (key.startsWith(regularPrefix)) {
        if (includeSecure || !key.startsWith(securePrefix)) {
          backup[key] = WebStorageImpl.getItem(key);
        }
      }
    }
    
    return {
      'timestamp': DateTime.now().toIso8601String(),
      'platform': 'web',
      'data': backup,
    };
  }

  /// Import data from JSON backup
  Future<void> importData(Map<String, dynamic> backup) async {
    _ensureInitialized();
    
    try {
      final data = backup['data'] as Map<String, dynamic>?;
      if (data == null) return;
      
      for (final entry in data.entries) {
        if (entry.key.startsWith(_appPrefix)) {
          WebStorageImpl.setItem(entry.key, entry.value.toString());
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('WebStorageService: Error importing data: $e');
      }
      rethrow;
    }
  }

  /// Get storage usage statistics
  Future<WebStorageStats> getStorageStats() async {
    _ensureInitialized();
    
    try {
      int totalKeys = 0;
      int appKeys = 0;
      int secureKeys = 0;
      int totalSize = 0;
      int appSize = 0;
      int secureSize = 0;
      
      for (final key in WebStorageImpl.keys) {
        final value = WebStorageImpl.getItem(key) ?? '';
        final entrySize = key.length + value.length;
        
        totalKeys++;
        totalSize += entrySize;
        
        if (key.startsWith(_appPrefix)) {
          appKeys++;
          appSize += entrySize;
          
          if (key.startsWith(_buildKey('', true))) {
            secureKeys++;
            secureSize += entrySize;
          }
        }
      }
      
      return WebStorageStats(
        totalKeys: totalKeys,
        appKeys: appKeys,
        secureKeys: secureKeys,
        totalSize: totalSize,
        appSize: appSize,
        secureSize: secureSize,
      );
    } catch (e) {
      if (kDebugMode) {
        print('WebStorageService: Error getting storage stats: $e');
      }
      return const WebStorageStats();
    }
  }
}

/// Web storage statistics helper class
class WebStorageStats {
  final int totalKeys;
  final int appKeys;
  final int secureKeys;
  final int totalSize;
  final int appSize;
  final int secureSize;
  
  const WebStorageStats({
    this.totalKeys = 0,
    this.appKeys = 0,
    this.secureKeys = 0,
    this.totalSize = 0,
    this.appSize = 0,
    this.secureSize = 0,
  });
  
  @override
  String toString() {
    return 'WebStorageStats('
        'total: $totalKeys keys, $totalSize bytes, '
        'app: $appKeys keys, $appSize bytes, '
        'secure: $secureKeys keys, $secureSize bytes'
        ')';
  }
}