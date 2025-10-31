// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$firebaseAuthDataSourceHash() =>
    r'a19b8b341181cbb42051a555a7238e60e1ae0eb7';

/// Firebase authentication data source provider
///
/// Copied from [firebaseAuthDataSource].
@ProviderFor(firebaseAuthDataSource)
final firebaseAuthDataSourceProvider =
    AutoDisposeProvider<FirebaseAuthDataSource>.internal(
  firebaseAuthDataSource,
  name: r'firebaseAuthDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$firebaseAuthDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FirebaseAuthDataSourceRef
    = AutoDisposeProviderRef<FirebaseAuthDataSource>;
String _$authRepositoryHash() => r'255f21d6d769d69771780df9ff6bdb2d7288295b';

/// Authentication repository provider
///
/// Copied from [authRepository].
@ProviderFor(authRepository)
final authRepositoryProvider = AutoDisposeProvider<AuthRepository>.internal(
  authRepository,
  name: r'authRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthRepositoryRef = AutoDisposeProviderRef<AuthRepository>;
String _$signInUseCaseHash() => r'8a7eba9c6bde77a8f714110befd1267e0de21012';

/// Sign in use case provider
///
/// Copied from [signInUseCase].
@ProviderFor(signInUseCase)
final signInUseCaseProvider = AutoDisposeProvider<SignInUseCase>.internal(
  signInUseCase,
  name: r'signInUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$signInUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SignInUseCaseRef = AutoDisposeProviderRef<SignInUseCase>;
String _$registerUseCaseHash() => r'18c4ae3ab62f2a877460370ce79e87ab31043ae3';

/// Registration use case provider
///
/// Copied from [registerUseCase].
@ProviderFor(registerUseCase)
final registerUseCaseProvider = AutoDisposeProvider<RegisterUseCase>.internal(
  registerUseCase,
  name: r'registerUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$registerUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RegisterUseCaseRef = AutoDisposeProviderRef<RegisterUseCase>;
String _$passwordManagementUseCaseHash() =>
    r'731ea2f45783131ae7e9884145f3f28e445761bd';

/// Password management use case provider
///
/// Copied from [passwordManagementUseCase].
@ProviderFor(passwordManagementUseCase)
final passwordManagementUseCaseProvider =
    AutoDisposeProvider<PasswordManagementUseCase>.internal(
  passwordManagementUseCase,
  name: r'passwordManagementUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$passwordManagementUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PasswordManagementUseCaseRef
    = AutoDisposeProviderRef<PasswordManagementUseCase>;
String _$biometricAuthUseCaseHash() =>
    r'dacbf134a3ed1da976207f60f0846b7b39090e88';

/// Biometric authentication use case provider
///
/// Copied from [biometricAuthUseCase].
@ProviderFor(biometricAuthUseCase)
final biometricAuthUseCaseProvider =
    AutoDisposeProvider<BiometricAuthUseCase>.internal(
  biometricAuthUseCase,
  name: r'biometricAuthUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$biometricAuthUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef BiometricAuthUseCaseRef = AutoDisposeProviderRef<BiometricAuthUseCase>;
String _$userManagementUseCaseHash() =>
    r'edc59c45cb9427308b832185196629ddc1c091ad';

/// User management use case provider
///
/// Copied from [userManagementUseCase].
@ProviderFor(userManagementUseCase)
final userManagementUseCaseProvider =
    AutoDisposeProvider<UserManagementUseCase>.internal(
  userManagementUseCase,
  name: r'userManagementUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userManagementUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserManagementUseCaseRef
    = AutoDisposeProviderRef<UserManagementUseCase>;
String _$emailVerificationUseCaseHash() =>
    r'd55d753638a9062d64561bed7074dcb3a42ed0ab';

/// Email verification use case provider
///
/// Copied from [emailVerificationUseCase].
@ProviderFor(emailVerificationUseCase)
final emailVerificationUseCaseProvider =
    AutoDisposeProvider<EmailVerificationUseCase>.internal(
  emailVerificationUseCase,
  name: r'emailVerificationUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$emailVerificationUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef EmailVerificationUseCaseRef
    = AutoDisposeProviderRef<EmailVerificationUseCase>;
String _$sessionManagementUseCaseHash() =>
    r'2d8ddef6f36e6aa5b3bca08b3299d63688aba4f3';

/// Session management use case provider
///
/// Copied from [sessionManagementUseCase].
@ProviderFor(sessionManagementUseCase)
final sessionManagementUseCaseProvider =
    AutoDisposeProvider<SessionManagementUseCase>.internal(
  sessionManagementUseCase,
  name: r'sessionManagementUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sessionManagementUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SessionManagementUseCaseRef
    = AutoDisposeProviderRef<SessionManagementUseCase>;
String _$authStateStreamHash() => r'7708d42c3f56fa9af4b4af6b3ec6a262ea99aef7';

/// Authentication state stream provider
/// Provides real-time authentication state changes
///
/// Copied from [authStateStream].
@ProviderFor(authStateStream)
final authStateStreamProvider = AutoDisposeStreamProvider<AuthState>.internal(
  authStateStream,
  name: r'authStateStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authStateStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthStateStreamRef = AutoDisposeStreamProviderRef<AuthState>;
String _$currentUserHash() => r'bd02ab16ea6d4d65e8ada90c3e1496ab33465aec';

/// Current user provider
/// Provides the currently authenticated user
///
/// Copied from [currentUser].
@ProviderFor(currentUser)
final currentUserProvider = AutoDisposeProvider<User?>.internal(
  currentUser,
  name: r'currentUserProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$currentUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CurrentUserRef = AutoDisposeProviderRef<User?>;
String _$isAuthenticatedHash() => r'3b291889555ea3ce50e24888f024bdd2980f6be2';

/// Authentication status provider
/// Provides boolean authentication status
///
/// Copied from [isAuthenticated].
@ProviderFor(isAuthenticated)
final isAuthenticatedProvider = AutoDisposeProvider<bool>.internal(
  isAuthenticated,
  name: r'isAuthenticatedProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$isAuthenticatedHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef IsAuthenticatedRef = AutoDisposeProviderRef<bool>;
String _$userRoleHash() => r'1dffcb16d883c4a80a28d92e5a31020fcf6bd103';

/// User role provider
/// Provides the current user's role
///
/// Copied from [userRole].
@ProviderFor(userRole)
final userRoleProvider = AutoDisposeProvider<UserRole?>.internal(
  userRole,
  name: r'userRoleProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userRoleHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserRoleRef = AutoDisposeProviderRef<UserRole?>;
String _$kycStatusHash() => r'02ceee3ee476bad0c158639590a0b236cf04fac7';

/// KYC status provider
/// Provides the current user's KYC verification status
///
/// Copied from [kycStatus].
@ProviderFor(kycStatus)
final kycStatusProvider = AutoDisposeProvider<KYCStatus?>.internal(
  kycStatus,
  name: r'kycStatusProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$kycStatusHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef KycStatusRef = AutoDisposeProviderRef<KYCStatus?>;
String _$isEmailVerifiedHash() => r'345204a0dc82806c00294f889177feb314388678';

/// Email verification status provider
/// Provides the current user's email verification status
///
/// Copied from [isEmailVerified].
@ProviderFor(isEmailVerified)
final isEmailVerifiedProvider = AutoDisposeProvider<bool>.internal(
  isEmailVerified,
  name: r'isEmailVerifiedProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$isEmailVerifiedHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef IsEmailVerifiedRef = AutoDisposeProviderRef<bool>;
String _$userPermissionsHash() => r'797caa2812d0b46d99ce0392d9f53e45fe0c6734';

/// User permissions provider
/// Provides computed permissions based on user role and status
///
/// Copied from [userPermissions].
@ProviderFor(userPermissions)
final userPermissionsProvider = AutoDisposeProvider<UserPermissions>.internal(
  userPermissions,
  name: r'userPermissionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userPermissionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserPermissionsRef = AutoDisposeProviderRef<UserPermissions>;
String _$biometricCapabilitiesHash() =>
    r'a2788b6c50ce62ce29181adec04d9fc5b1c33fdf';

/// Biometric availability provider
/// Checks if biometric authentication is available on current platform
///
/// Copied from [biometricCapabilities].
@ProviderFor(biometricCapabilities)
final biometricCapabilitiesProvider =
    AutoDisposeFutureProvider<BiometricCapabilities>.internal(
  biometricCapabilities,
  name: r'biometricCapabilitiesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$biometricCapabilitiesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef BiometricCapabilitiesRef
    = AutoDisposeFutureProviderRef<BiometricCapabilities>;
String _$appleSignInCapabilitiesHash() =>
    r'209b86c7e23bb1415489ceb63ffb801e2a38df06';

/// Apple Sign-In availability provider
/// Checks if Apple Sign-In is available on current platform (iOS only)
///
/// Copied from [appleSignInCapabilities].
@ProviderFor(appleSignInCapabilities)
final appleSignInCapabilitiesProvider =
    AutoDisposeFutureProvider<AppleSignInCapabilities>.internal(
  appleSignInCapabilities,
  name: r'appleSignInCapabilitiesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appleSignInCapabilitiesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AppleSignInCapabilitiesRef
    = AutoDisposeFutureProviderRef<AppleSignInCapabilities>;
String _$sessionStatusHash() => r'3b5e42e819fe37b9a75e9060f7e30a182d441d49';

/// Session status provider
/// Provides current session information and security status
///
/// Copied from [sessionStatus].
@ProviderFor(sessionStatus)
final sessionStatusProvider = AutoDisposeFutureProvider<SessionStatus>.internal(
  sessionStatus,
  name: r'sessionStatusProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sessionStatusHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SessionStatusRef = AutoDisposeFutureProviderRef<SessionStatus>;
String _$authStateNotifierHash() => r'a5b775059267ae27b00d16f8befa9300e3872f83';

/// Current authentication state provider
/// Provides the current authentication state synchronously
///
/// Copied from [AuthStateNotifier].
@ProviderFor(AuthStateNotifier)
final authStateNotifierProvider =
    AutoDisposeNotifierProvider<AuthStateNotifier, AuthState>.internal(
  AuthStateNotifier.new,
  name: r'authStateNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authStateNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AuthStateNotifier = AutoDisposeNotifier<AuthState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
