// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$adaptiveStorageHash() => r'c1ec15f231d11ce8e6d03945cb52860666df3c2c';

/// Provider for the adaptive storage service instance
///
/// Copied from [adaptiveStorage].
@ProviderFor(adaptiveStorage)
final adaptiveStorageProvider =
    AutoDisposeProvider<AdaptiveStorageService>.internal(
  adaptiveStorage,
  name: r'adaptiveStorageProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$adaptiveStorageHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AdaptiveStorageRef = AutoDisposeProviderRef<AdaptiveStorageService>;
String _$storageInfoHash() => r'4e08e739183564e2be949262b10a84bf4866e08f';

/// Provider for storage information
///
/// Copied from [storageInfo].
@ProviderFor(storageInfo)
final storageInfoProvider = AutoDisposeFutureProvider<StorageInfo>.internal(
  storageInfo,
  name: r'storageInfoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$storageInfoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef StorageInfoRef = AutoDisposeFutureProviderRef<StorageInfo>;
String _$storageDebugInfoHash() => r'f0ba0b8becca3d39d0ce559940f334a2ff92f1ea';

/// Provider for storage debugging information
///
/// Copied from [storageDebugInfo].
@ProviderFor(storageDebugInfo)
final storageDebugInfoProvider =
    AutoDisposeFutureProvider<Map<String, dynamic>>.internal(
  storageDebugInfo,
  name: r'storageDebugInfoProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$storageDebugInfoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef StorageDebugInfoRef
    = AutoDisposeFutureProviderRef<Map<String, dynamic>>;
String _$storageInitializationHash() =>
    r'9976206e68551878b1e59ee5ae9767439feba9c1';

/// Provider for storage initialization status
///
/// Copied from [StorageInitialization].
@ProviderFor(StorageInitialization)
final storageInitializationProvider =
    AutoDisposeAsyncNotifierProvider<StorageInitialization, bool>.internal(
  StorageInitialization.new,
  name: r'storageInitializationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$storageInitializationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$StorageInitialization = AutoDisposeAsyncNotifier<bool>;
String _$userPreferencesNotifierHash() =>
    r'6286b37ce3a35f5826b32eed838cee0dec2b5499';

/// Provider for user preferences
///
/// Copied from [UserPreferencesNotifier].
@ProviderFor(UserPreferencesNotifier)
final userPreferencesNotifierProvider = AutoDisposeAsyncNotifierProvider<
    UserPreferencesNotifier, Map<String, dynamic>>.internal(
  UserPreferencesNotifier.new,
  name: r'userPreferencesNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userPreferencesNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserPreferencesNotifier
    = AutoDisposeAsyncNotifier<Map<String, dynamic>>;
String _$themePreferenceHash() => r'cfccd9a5e5b3cd60e51204b7f49c16b7e34d7cd2';

/// Provider for theme preference
///
/// Copied from [ThemePreference].
@ProviderFor(ThemePreference)
final themePreferenceProvider =
    AutoDisposeAsyncNotifierProvider<ThemePreference, String>.internal(
  ThemePreference.new,
  name: r'themePreferenceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$themePreferenceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ThemePreference = AutoDisposeAsyncNotifier<String>;
String _$languagePreferenceHash() =>
    r'629e33710ce79dc8609bd232c930915b140aefa2';

/// Provider for language preference
///
/// Copied from [LanguagePreference].
@ProviderFor(LanguagePreference)
final languagePreferenceProvider =
    AutoDisposeAsyncNotifierProvider<LanguagePreference, String>.internal(
  LanguagePreference.new,
  name: r'languagePreferenceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$languagePreferenceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LanguagePreference = AutoDisposeAsyncNotifier<String>;
String _$currencyPreferenceHash() =>
    r'56c28e0324e1b50b447e5f4c2bb0ba29eeea9f73';

/// Provider for currency preference
///
/// Copied from [CurrencyPreference].
@ProviderFor(CurrencyPreference)
final currencyPreferenceProvider =
    AutoDisposeAsyncNotifierProvider<CurrencyPreference, String>.internal(
  CurrencyPreference.new,
  name: r'currencyPreferenceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currencyPreferenceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrencyPreference = AutoDisposeAsyncNotifier<String>;
String _$notificationsPreferenceHash() =>
    r'6a5d9ed4ee2c2a1473bddc5bfbca178abf6dfa6f';

/// Provider for notifications preference
///
/// Copied from [NotificationsPreference].
@ProviderFor(NotificationsPreference)
final notificationsPreferenceProvider =
    AutoDisposeAsyncNotifierProvider<NotificationsPreference, bool>.internal(
  NotificationsPreference.new,
  name: r'notificationsPreferenceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$notificationsPreferenceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NotificationsPreference = AutoDisposeAsyncNotifier<bool>;
String _$analyticsPreferenceHash() =>
    r'e5c6800b6f961598f3a0bd3e4cef1a0421221386';

/// Provider for analytics preference
///
/// Copied from [AnalyticsPreference].
@ProviderFor(AnalyticsPreference)
final analyticsPreferenceProvider =
    AutoDisposeAsyncNotifierProvider<AnalyticsPreference, bool>.internal(
  AnalyticsPreference.new,
  name: r'analyticsPreferenceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$analyticsPreferenceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AnalyticsPreference = AutoDisposeAsyncNotifier<bool>;
String _$appStateFlagsHash() => r'5b70081f31be7e8ec9731734e6abc4654b1f8497';

/// Provider for app state flags
///
/// Copied from [AppStateFlags].
@ProviderFor(AppStateFlags)
final appStateFlagsProvider =
    AutoDisposeAsyncNotifierProvider<AppStateFlags, Map<String, bool>>.internal(
  AppStateFlags.new,
  name: r'appStateFlagsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appStateFlagsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AppStateFlags = AutoDisposeAsyncNotifier<Map<String, bool>>;
String _$secureSessionHash() => r'79d92168b1f06ef3105f7b623f442967c40afa83';

/// Provider for secure session data
///
/// Copied from [SecureSession].
@ProviderFor(SecureSession)
final secureSessionProvider = AutoDisposeAsyncNotifierProvider<SecureSession,
    Map<String, dynamic>?>.internal(
  SecureSession.new,
  name: r'secureSessionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$secureSessionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SecureSession = AutoDisposeAsyncNotifier<Map<String, dynamic>?>;
String _$storageCacheHash() => r'6bb1ca7505e7ae2ac2d2d88e9c32976b19f2fbe9';

/// Provider for storage cache management
///
/// Copied from [StorageCache].
@ProviderFor(StorageCache)
final storageCacheProvider = AutoDisposeAsyncNotifierProvider<StorageCache,
    Map<String, dynamic>>.internal(
  StorageCache.new,
  name: r'storageCacheProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$storageCacheHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$StorageCache = AutoDisposeAsyncNotifier<Map<String, dynamic>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
