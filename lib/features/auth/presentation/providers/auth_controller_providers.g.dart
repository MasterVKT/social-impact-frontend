// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$signInControllerHash() => r'fcd4f0d450e262d89989fdb764a991e674e4f200';

/// Sign in controller
/// Handles sign in operations with loading states
///
/// Copied from [SignInController].
@ProviderFor(SignInController)
final signInControllerProvider = AutoDisposeNotifierProvider<SignInController,
    AsyncValue<AuthResult?>>.internal(
  SignInController.new,
  name: r'signInControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$signInControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SignInController = AutoDisposeNotifier<AsyncValue<AuthResult?>>;
String _$registerControllerHash() =>
    r'7bc9e5885ba19444ed63df43cdfe61ff1058cb17';

/// Registration controller
/// Handles user registration operations
///
/// Copied from [RegisterController].
@ProviderFor(RegisterController)
final registerControllerProvider = AutoDisposeNotifierProvider<
    RegisterController, AsyncValue<AuthResult?>>.internal(
  RegisterController.new,
  name: r'registerControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$registerControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$RegisterController = AutoDisposeNotifier<AsyncValue<AuthResult?>>;
String _$passwordControllerHash() =>
    r'c65225325660f6a2ccfad8e09e022c6e16ba1682';

/// Password management controller
/// Handles password-related operations
///
/// Copied from [PasswordController].
@ProviderFor(PasswordController)
final passwordControllerProvider = AutoDisposeNotifierProvider<
    PasswordController, AsyncValue<AuthResult?>>.internal(
  PasswordController.new,
  name: r'passwordControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$passwordControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PasswordController = AutoDisposeNotifier<AsyncValue<AuthResult?>>;
String _$biometricControllerHash() =>
    r'ac3f5c516ceee64d4cdbbf615fc4bccb5fc7417e';

/// Biometric authentication controller
/// Handles biometric authentication setup and operations
///
/// Copied from [BiometricController].
@ProviderFor(BiometricController)
final biometricControllerProvider = AutoDisposeNotifierProvider<
    BiometricController, AsyncValue<AuthResult?>>.internal(
  BiometricController.new,
  name: r'biometricControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$biometricControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$BiometricController = AutoDisposeNotifier<AsyncValue<AuthResult?>>;
String _$userProfileControllerHash() =>
    r'f9db020d8c574e17dbac85bf42277adb4ef2a698';

/// User profile controller
/// Handles user profile management operations
///
/// Copied from [UserProfileController].
@ProviderFor(UserProfileController)
final userProfileControllerProvider = AutoDisposeNotifierProvider<
    UserProfileController, AsyncValue<AuthResult?>>.internal(
  UserProfileController.new,
  name: r'userProfileControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userProfileControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserProfileController = AutoDisposeNotifier<AsyncValue<AuthResult?>>;
String _$emailVerificationControllerHash() =>
    r'b737a248690e31094c6c12cc7d5713d242e79e0a';

/// Email verification controller
/// Handles email verification operations
///
/// Copied from [EmailVerificationController].
@ProviderFor(EmailVerificationController)
final emailVerificationControllerProvider = AutoDisposeNotifierProvider<
    EmailVerificationController, AsyncValue<AuthResult?>>.internal(
  EmailVerificationController.new,
  name: r'emailVerificationControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$emailVerificationControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$EmailVerificationController
    = AutoDisposeNotifier<AsyncValue<AuthResult?>>;
String _$sessionControllerHash() => r'49d3e27b482ee257d7f083d48c5f28da57801898';

/// Session controller
/// Handles session management operations
///
/// Copied from [SessionController].
@ProviderFor(SessionController)
final sessionControllerProvider =
    AutoDisposeNotifierProvider<SessionController, AsyncValue<void>>.internal(
  SessionController.new,
  name: r'sessionControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sessionControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SessionController = AutoDisposeNotifier<AsyncValue<void>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
