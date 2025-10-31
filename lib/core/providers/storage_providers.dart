import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../services/storage/adaptive_storage_service.dart';
import '../services/storage/storage_utils.dart';

part 'storage_providers.g.dart';

/// Provider for the adaptive storage service instance
@riverpod
AdaptiveStorageService adaptiveStorage(AdaptiveStorageRef ref) {
  return AdaptiveStorageService.instance;
}

/// Provider for storage initialization status
@riverpod
class StorageInitialization extends _$StorageInitialization {
  @override
  Future<bool> build() async {
    final storage = ref.read(adaptiveStorageProvider);
    
    try {
      await storage.initialize();
      
      // Perform any necessary migrations
      await StorageMigration.performMigrations();
      
      // Clear expired cache entries
      await StorageCacheUtils.clearExpired();
      
      return true;
    } catch (e) {
      throw Exception('Storage initialization failed: $e');
    }
  }
  
  /// Reinitialize storage service
  Future<void> reinitialize() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final storage = ref.read(adaptiveStorageProvider);
      await storage.initialize();
      return true;
    });
  }
}

/// Provider for storage information
@riverpod
Future<StorageInfo> storageInfo(StorageInfoRef ref) async {
  final storage = ref.read(adaptiveStorageProvider);
  
  // Ensure storage is initialized
  await ref.read(storageInitializationProvider.future);
  
  return await storage.getStorageInfo();
}

/// Provider for user preferences
@riverpod
class UserPreferencesNotifier extends _$UserPreferencesNotifier {
  @override
  Future<Map<String, dynamic>> build() async {
    // Ensure storage is initialized
    await ref.read(storageInitializationProvider.future);
    
    return await StoragePreferences.exportAll();
  }
  
  /// Set a user preference
  Future<void> setPreference<T>(String key, T value) async {
    await StoragePreferences.setPreference(key: key, value: value);
    
    // Refresh the preferences state
    final currentPrefs = state.valueOrNull ?? {};
    state = AsyncValue.data({...currentPrefs, key: value.toString()});
  }
  
  /// Get a user preference with type safety
  Future<T?> getPreference<T>(String key, {T? defaultValue}) async {
    return await StoragePreferences.getPreference<T>(
      key: key,
      defaultValue: defaultValue,
    );
  }
  
  /// Set multiple preferences at once
  Future<void> setBatch(Map<String, dynamic> preferences) async {
    await StoragePreferences.setBatch(preferences);
    
    // Refresh the preferences state
    final currentPrefs = state.valueOrNull ?? {};
    state = AsyncValue.data({...currentPrefs, ...preferences});
  }
  
  /// Reset all preferences
  Future<void> resetAll() async {
    final storage = ref.read(adaptiveStorageProvider);
    final allKeys = await storage.getAllKeys();
    
    for (final key in allKeys) {
      if (key.startsWith('pref_')) {
        await storage.remove(key: key);
      }
    }
    
    state = const AsyncValue.data({});
  }
}

/// Provider for theme preference
@riverpod
class ThemePreference extends _$ThemePreference {
  @override
  Future<String> build() async {
    final prefs = ref.read(userPreferencesNotifierProvider.notifier);
    return await prefs.getPreference('theme_mode', defaultValue: 'system') ?? 'system';
  }
  
  /// Set theme preference
  Future<void> setTheme(String theme) async {
    final prefs = ref.read(userPreferencesNotifierProvider.notifier);
    await prefs.setPreference('theme_mode', theme);
    state = AsyncValue.data(theme);
  }
}

/// Provider for language preference
@riverpod
class LanguagePreference extends _$LanguagePreference {
  @override
  Future<String> build() async {
    final prefs = ref.read(userPreferencesNotifierProvider.notifier);
    return await prefs.getPreference('language', defaultValue: 'en') ?? 'en';
  }
  
  /// Set language preference
  Future<void> setLanguage(String language) async {
    final prefs = ref.read(userPreferencesNotifierProvider.notifier);
    await prefs.setPreference('language', language);
    state = AsyncValue.data(language);
  }
}

/// Provider for currency preference
@riverpod
class CurrencyPreference extends _$CurrencyPreference {
  @override
  Future<String> build() async {
    final prefs = ref.read(userPreferencesNotifierProvider.notifier);
    return await prefs.getPreference('currency', defaultValue: 'USD') ?? 'USD';
  }
  
  /// Set currency preference
  Future<void> setCurrency(String currency) async {
    final prefs = ref.read(userPreferencesNotifierProvider.notifier);
    await prefs.setPreference('currency', currency);
    state = AsyncValue.data(currency);
  }
}

/// Provider for notifications preference
@riverpod
class NotificationsPreference extends _$NotificationsPreference {
  @override
  Future<bool> build() async {
    final prefs = ref.read(userPreferencesNotifierProvider.notifier);
    return await prefs.getPreference('notifications_enabled', defaultValue: true) ?? true;
  }
  
  /// Toggle notifications preference
  Future<void> setNotifications(bool enabled) async {
    final prefs = ref.read(userPreferencesNotifierProvider.notifier);
    await prefs.setPreference('notifications_enabled', enabled);
    state = AsyncValue.data(enabled);
  }
}

/// Provider for analytics preference
@riverpod
class AnalyticsPreference extends _$AnalyticsPreference {
  @override
  Future<bool> build() async {
    final prefs = ref.read(userPreferencesNotifierProvider.notifier);
    return await prefs.getPreference('analytics_enabled', defaultValue: true) ?? true;
  }
  
  /// Toggle analytics preference
  Future<void> setAnalytics(bool enabled) async {
    final prefs = ref.read(userPreferencesNotifierProvider.notifier);
    await prefs.setPreference('analytics_enabled', enabled);
    state = AsyncValue.data(enabled);
  }
}

/// Provider for app state flags
@riverpod
class AppStateFlags extends _$AppStateFlags {
  @override
  Future<Map<String, bool>> build() async {
    // Ensure storage is initialized
    await ref.read(storageInitializationProvider.future);
    
    final storage = ref.read(adaptiveStorageProvider);
    
    final isFirstLaunch = await storage.getBool(key: StorageKeys.firstLaunch) ?? true;
    final isOnboardingCompleted = await storage.getBool(key: StorageKeys.onboardingCompleted) ?? false;
    
    return {
      'first_launch': isFirstLaunch,
      'onboarding_completed': isOnboardingCompleted,
    };
  }
  
  /// Mark first launch as completed
  Future<void> completeFirstLaunch() async {
    final storage = ref.read(adaptiveStorageProvider);
    await storage.setBool(key: StorageKeys.firstLaunch, value: false);
    
    final currentFlags = state.valueOrNull ?? {};
    state = AsyncValue.data({...currentFlags, 'first_launch': false});
  }
  
  /// Mark onboarding as completed
  Future<void> completeOnboarding() async {
    final storage = ref.read(adaptiveStorageProvider);
    await storage.setBool(key: StorageKeys.onboardingCompleted, value: true);
    
    final currentFlags = state.valueOrNull ?? {};
    state = AsyncValue.data({...currentFlags, 'onboarding_completed': true});
  }
  
  /// Reset app state (for debugging)
  Future<void> resetAppState() async {
    final storage = ref.read(adaptiveStorageProvider);
    await storage.setBool(key: StorageKeys.firstLaunch, value: true);
    await storage.setBool(key: StorageKeys.onboardingCompleted, value: false);
    
    state = const AsyncValue.data({
      'first_launch': true,
      'onboarding_completed': false,
    });
  }
}

/// Provider for secure session data
@riverpod
class SecureSession extends _$SecureSession {
  @override
  Future<Map<String, dynamic>?> build() async {
    // Ensure storage is initialized
    await ref.read(storageInitializationProvider.future);
    
    return await StorageSession.getSessionData(key: 'user_session');
  }
  
  /// Store session data
  Future<void> storeSession({
    required Map<String, dynamic> data,
    Duration? timeout,
  }) async {
    await StorageSession.storeSessionData(
      key: 'user_session',
      data: data,
      timeout: timeout,
    );
    
    state = AsyncValue.data(data);
  }
  
  /// Clear current session
  Future<void> clearSession() async {
    await StorageSession.clearAll();
    state = const AsyncValue.data(null);
  }
  
  /// Extend session timeout
  Future<void> extendSession(Duration newTimeout) async {
    await StorageSession.extendTimeout(
      key: 'user_session',
      newTimeout: newTimeout,
    );
  }
}

/// Provider for storage debugging information
@riverpod
Future<Map<String, dynamic>> storageDebugInfo(StorageDebugInfoRef ref) async {
  // Ensure storage is initialized
  await ref.read(storageInitializationProvider.future);
  
  return await StorageDebug.getDetailedInfo();
}

/// Provider for storage cache management
@riverpod
class StorageCache extends _$StorageCache {
  @override
  Future<Map<String, dynamic>> build() async {
    // Return empty state initially
    return {};
  }
  
  /// Set cached data with expiration
  Future<void> setCache({
    required String key,
    required Map<String, dynamic> data,
    Duration expiry = const Duration(hours: 1),
    bool secure = false,
  }) async {
    await StorageCacheUtils.setWithExpiry(
      key: key,
      data: data,
      expiry: expiry,
      secure: secure,
    );
    
    final currentCache = state.valueOrNull ?? {};
    state = AsyncValue.data({...currentCache, key: data});
  }
  
  /// Get cached data if valid
  Future<Map<String, dynamic>?> getCache(String key, {bool secure = false}) async {
    return await StorageCacheUtils.getIfValid(key: key, secure: secure);
  }
  
  /// Check if cache is valid
  Future<bool> isCacheValid(String key, {bool secure = false}) async {
    return await StorageCacheUtils.isValid(key: key, secure: secure);
  }
  
  /// Clear expired cache entries
  Future<void> clearExpired() async {
    await StorageCacheUtils.clearExpired();
    
    // Refresh cache state
    state = const AsyncValue.data({});
  }
  
  /// Clear all cache
  Future<void> clearAll() async {
    final storage = ref.read(adaptiveStorageProvider);
    final allKeys = await storage.getAllKeys();
    
    for (final key in allKeys) {
      if (key.contains('cache')) {
        await storage.remove(key: key);
      }
    }
    
    state = const AsyncValue.data({});
  }
}