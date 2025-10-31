import 'package:flutter/foundation.dart';
import 'adaptive_storage_service.dart';
import 'storage_utils.dart';

/// Example usage of the adaptive storage system
/// This file demonstrates how to use the storage services
class StorageExample {
  static final AdaptiveStorageService _storage = AdaptiveStorageService.instance;

  /// Example of basic storage operations
  static Future<void> basicStorageExample() async {
    if (kDebugMode) {
      print('=== Basic Storage Example ===');
    }

    try {
      // Initialize storage
      await _storage.initialize();
      
      // Store different types of data
      await _storage.setString(key: 'user_name', value: 'John Doe');
      await _storage.setInt(key: 'user_age', value: 30);
      await _storage.setBool(key: 'notifications_enabled', value: true);
      await _storage.setDouble(key: 'app_rating', value: 4.5);
      
      // Store complex data as JSON
      await _storage.setJson(key: 'user_profile', value: {
        'name': 'John Doe',
        'email': 'john@example.com',
        'preferences': {
          'theme': 'dark',
          'language': 'en',
        }
      });
      
      // Store secure data
      await _storage.setString(
        key: 'auth_token', 
        value: 'secure_token_123', 
        secure: true
      );
      
      // Retrieve data
      final name = await _storage.getString(key: 'user_name');
      final age = await _storage.getInt(key: 'user_age');
      final notificationsEnabled = await _storage.getBool(key: 'notifications_enabled');
      final rating = await _storage.getDouble(key: 'app_rating');
      final profile = await _storage.getJson(key: 'user_profile');
      final token = await _storage.getString(key: 'auth_token', secure: true);
      
      if (kDebugMode) {
        print('Name: $name');
        print('Age: $age');
        print('Notifications: $notificationsEnabled');
        print('Rating: $rating');
        print('Profile: $profile');
        print('Token: $token');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Basic storage example error: $e');
      }
    }
  }

  /// Example of cache operations
  static Future<void> cacheExample() async {
    if (kDebugMode) {
      print('=== Cache Example ===');
    }

    try {
      // Store data with expiration
      await StorageCacheUtils.setWithExpiry(
        key: 'user_dashboard',
        data: {
          'widgets': ['balance', 'transactions', 'investments'],
          'last_updated': DateTime.now().toIso8601String(),
          'user_id': 'user123',
        },
        expiry: const Duration(hours: 2),
      );
      
      // Retrieve cached data if still valid
      final cachedDashboard = await StorageCacheUtils.getIfValid(key: 'user_dashboard');
      
      if (cachedDashboard != null) {
        if (kDebugMode) {
          print('Dashboard cache hit: $cachedDashboard');
        }
      } else {
        if (kDebugMode) {
          print('Dashboard cache miss or expired');
        }
      }
      
      // Check if cache is valid without retrieving data
      final isValid = await StorageCacheUtils.isValid(key: 'user_dashboard');
      if (kDebugMode) {
        print('Dashboard cache is valid: $isValid');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Cache example error: $e');
      }
    }
  }

  /// Example of preferences management
  static Future<void> preferencesExample() async {
    if (kDebugMode) {
      print('=== Preferences Example ===');
    }

    try {
      // Set individual preferences
      await StoragePreferences.setPreference(key: 'theme_mode', value: 'dark');
      await StoragePreferences.setPreference(key: 'language', value: 'en');
      await StoragePreferences.setPreference(key: 'notifications_enabled', value: true);
      
      // Set multiple preferences at once
      await StoragePreferences.setBatch({
        'currency': 'USD',
        'timezone': 'UTC',
        'analytics_enabled': false,
      });
      
      // Get preferences with type safety
      final theme = await StoragePreferences.getPreference<String>(
        key: 'theme_mode', 
        defaultValue: 'system'
      );
      final notifications = await StoragePreferences.getPreference<bool>(
        key: 'notifications_enabled', 
        defaultValue: true
      );
      
      // Export all preferences
      final allPreferences = await StoragePreferences.exportAll();
      
      if (kDebugMode) {
        print('Theme: $theme');
        print('Notifications: $notifications');
        print('All preferences: $allPreferences');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Preferences example error: $e');
      }
    }
  }

  /// Example of session management
  static Future<void> sessionExample() async {
    if (kDebugMode) {
      print('=== Session Example ===');
    }

    try {
      // Store session data with timeout
      await StorageSession.storeSessionData(
        key: 'user_session',
        data: {
          'user_id': 'user123',
          'token': 'session_token_xyz',
          'permissions': ['read', 'write'],
          'login_time': DateTime.now().toIso8601String(),
        },
        timeout: const Duration(hours: 8),
      );
      
      // Retrieve session data if still valid
      final sessionData = await StorageSession.getSessionData(key: 'user_session');
      
      if (sessionData != null) {
        if (kDebugMode) {
          print('Active session: $sessionData');
        }
      } else {
        if (kDebugMode) {
          print('No active session or session expired');
        }
      }
      
      // Extend session timeout
      await StorageSession.extendTimeout(
        key: 'user_session',
        newTimeout: const Duration(hours: 12),
      );
    } catch (e) {
      if (kDebugMode) {
        print('Session example error: $e');
      }
    }
  }

  /// Example of secure storage
  static Future<void> secureStorageExample() async {
    if (kDebugMode) {
      print('=== Secure Storage Example ===');
    }

    try {
      // Store sensitive data with PIN protection
      await StorageSecurity.storeSecureData(
        key: 'payment_info',
        data: {
          'card_number': '**** **** **** 1234',
          'exp_date': '12/25',
          'user_id': 'user123',
        },
        userPin: '1234', // In real app, get from user input
      );
      
      // Retrieve secure data with PIN validation
      final paymentInfo = await StorageSecurity.getSecureData(
        key: 'payment_info',
        userPin: '1234', // In real app, get from user input
      );
      
      if (kDebugMode) {
        print('Payment info: $paymentInfo');
      }
      
      // Try to retrieve with wrong PIN (will throw SecurityException)
      try {
        await StorageSecurity.getSecureData(
          key: 'payment_info',
          userPin: 'wrong_pin',
        );
      } catch (e) {
        if (kDebugMode) {
          print('Security validation worked: $e');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Secure storage example error: $e');
      }
    }
  }

  /// Example of storage information and debugging
  static Future<void> debugExample() async {
    if (kDebugMode) {
      print('=== Debug Example ===');
    }

    try {
      // Get storage information
      final storageInfo = await _storage.getStorageInfo();
      if (kDebugMode) {
        print('Storage Info: $storageInfo');
      }
      
      // Get detailed debugging information
      final debugInfo = await StorageDebug.getDetailedInfo();
      if (kDebugMode) {
        print('Debug Info: $debugInfo');
      }
      
      // Export data for debugging (excluding secure data)
      final exportData = await StorageDebug.exportForDebug();
      if (kDebugMode) {
        print('Export size: ${exportData.toString().length} characters');
      }
      
      // Get all keys
      final regularKeys = await _storage.getAllKeys(secure: false);
      final secureKeys = await _storage.getAllKeys(secure: true);
      
      if (kDebugMode) {
        print('Regular keys (${regularKeys.length}): ${regularKeys.take(10).toList()}');
        print('Secure keys (${secureKeys.length}): ${secureKeys.take(10).toList()}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Debug example error: $e');
      }
    }
  }

  /// Run all examples
  static Future<void> runAllExamples() async {
    if (kDebugMode) {
      print('Running Adaptive Storage Examples...');
    }

    await basicStorageExample();
    await cacheExample();
    await preferencesExample();
    await sessionExample();
    await secureStorageExample();
    await debugExample();
    
    if (kDebugMode) {
      print('All examples completed!');
    }
  }

  /// Clean up example data
  static Future<void> cleanup() async {
    try {
      // Remove example data
      await _storage.remove(key: 'user_name');
      await _storage.remove(key: 'user_age');
      await _storage.remove(key: 'notifications_enabled');
      await _storage.remove(key: 'app_rating');
      await _storage.remove(key: 'user_profile');
      await _storage.remove(key: 'auth_token', secure: true);
      
      // Clear expired cache
      await StorageCacheUtils.clearExpired();
      
      // Clear all session data
      await StorageSession.clearAll();
      
      if (kDebugMode) {
        print('Cleanup completed');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Cleanup error: $e');
      }
    }
  }
}