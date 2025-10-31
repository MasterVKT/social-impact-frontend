// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_recovery_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$passwordRecoveryUseCasesHash() =>
    r'2cf841ffb020ff3112d456ae0dad71e9d63be9b3';

/// Provider for password recovery use cases
///
/// Copied from [passwordRecoveryUseCases].
@ProviderFor(passwordRecoveryUseCases)
final passwordRecoveryUseCasesProvider =
    AutoDisposeProvider<PasswordRecoveryUseCases>.internal(
  passwordRecoveryUseCases,
  name: r'passwordRecoveryUseCasesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$passwordRecoveryUseCasesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PasswordRecoveryUseCasesRef
    = AutoDisposeProviderRef<PasswordRecoveryUseCases>;
String _$emailVerificationRequiredHash() =>
    r'51c02ebea224984444deeb24aa94e66d29cd5ef8';

/// Provider for email verification status
///
/// Copied from [emailVerificationRequired].
@ProviderFor(emailVerificationRequired)
final emailVerificationRequiredProvider =
    AutoDisposeFutureProvider<bool>.internal(
  emailVerificationRequired,
  name: r'emailVerificationRequiredProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$emailVerificationRequiredHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef EmailVerificationRequiredRef = AutoDisposeFutureProviderRef<bool>;
String _$passwordValidationHash() =>
    r'5f49876e9dfa48379e8975a8ae4177729e9994cc';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// Provider for password validation
///
/// Copied from [passwordValidation].
@ProviderFor(passwordValidation)
const passwordValidationProvider = PasswordValidationFamily();

/// Provider for password validation
///
/// Copied from [passwordValidation].
class PasswordValidationFamily extends Family<PasswordValidationResult> {
  /// Provider for password validation
  ///
  /// Copied from [passwordValidation].
  const PasswordValidationFamily();

  /// Provider for password validation
  ///
  /// Copied from [passwordValidation].
  PasswordValidationProvider call(
    String password,
  ) {
    return PasswordValidationProvider(
      password,
    );
  }

  @override
  PasswordValidationProvider getProviderOverride(
    covariant PasswordValidationProvider provider,
  ) {
    return call(
      provider.password,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'passwordValidationProvider';
}

/// Provider for password validation
///
/// Copied from [passwordValidation].
class PasswordValidationProvider
    extends AutoDisposeProvider<PasswordValidationResult> {
  /// Provider for password validation
  ///
  /// Copied from [passwordValidation].
  PasswordValidationProvider(
    String password,
  ) : this._internal(
          (ref) => passwordValidation(
            ref as PasswordValidationRef,
            password,
          ),
          from: passwordValidationProvider,
          name: r'passwordValidationProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$passwordValidationHash,
          dependencies: PasswordValidationFamily._dependencies,
          allTransitiveDependencies:
              PasswordValidationFamily._allTransitiveDependencies,
          password: password,
        );

  PasswordValidationProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.password,
  }) : super.internal();

  final String password;

  @override
  Override overrideWith(
    PasswordValidationResult Function(PasswordValidationRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PasswordValidationProvider._internal(
        (ref) => create(ref as PasswordValidationRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        password: password,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<PasswordValidationResult> createElement() {
    return _PasswordValidationProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PasswordValidationProvider && other.password == password;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, password.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PasswordValidationRef
    on AutoDisposeProviderRef<PasswordValidationResult> {
  /// The parameter `password` of this provider.
  String get password;
}

class _PasswordValidationProviderElement
    extends AutoDisposeProviderElement<PasswordValidationResult>
    with PasswordValidationRef {
  _PasswordValidationProviderElement(super.provider);

  @override
  String get password => (origin as PasswordValidationProvider).password;
}

String _$resendCooldownHash() => r'df2dbb33dc5833fddad90bb3784dc392d8d7c266';

/// Provider for resend cooldown timer
///
/// Copied from [ResendCooldown].
@ProviderFor(ResendCooldown)
final resendCooldownProvider =
    AutoDisposeNotifierProvider<ResendCooldown, int>.internal(
  ResendCooldown.new,
  name: r'resendCooldownProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$resendCooldownHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ResendCooldown = AutoDisposeNotifier<int>;
String _$passwordResetFlowHash() => r'd00773e04ddc10e12f7ead18ad33b1d9059fdf8a';

/// Provider for password reset flow state
///
/// Copied from [PasswordResetFlow].
@ProviderFor(PasswordResetFlow)
final passwordResetFlowProvider = AutoDisposeNotifierProvider<PasswordResetFlow,
    PasswordResetFlowState>.internal(
  PasswordResetFlow.new,
  name: r'passwordResetFlowProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$passwordResetFlowHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PasswordResetFlow = AutoDisposeNotifier<PasswordResetFlowState>;
String _$emailVerificationFlowHash() =>
    r'b3548abb3e2a260df57cd0be88ae75b6b701e8c3';

/// Provider for email verification flow state
///
/// Copied from [EmailVerificationFlow].
@ProviderFor(EmailVerificationFlow)
final emailVerificationFlowProvider = AutoDisposeNotifierProvider<
    EmailVerificationFlow, EmailVerificationFlowState>.internal(
  EmailVerificationFlow.new,
  name: r'emailVerificationFlowProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$emailVerificationFlowHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$EmailVerificationFlow
    = AutoDisposeNotifier<EmailVerificationFlowState>;
String _$passwordChangeFlowHash() =>
    r'95a63b7fe4d9e636da0148258664751a1bce7c6d';

/// Provider for password change flow
///
/// Copied from [PasswordChangeFlow].
@ProviderFor(PasswordChangeFlow)
final passwordChangeFlowProvider = AutoDisposeNotifierProvider<
    PasswordChangeFlow, PasswordChangeFlowState>.internal(
  PasswordChangeFlow.new,
  name: r'passwordChangeFlowProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$passwordChangeFlowHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PasswordChangeFlow = AutoDisposeNotifier<PasswordChangeFlowState>;
String _$emailUpdateFlowHash() => r'b6236cb58f5101703d049d68164d75cd8ea16410';

/// Provider for email update flow
///
/// Copied from [EmailUpdateFlow].
@ProviderFor(EmailUpdateFlow)
final emailUpdateFlowProvider =
    AutoDisposeNotifierProvider<EmailUpdateFlow, EmailUpdateFlowState>.internal(
  EmailUpdateFlow.new,
  name: r'emailUpdateFlowProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$emailUpdateFlowHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$EmailUpdateFlow = AutoDisposeNotifier<EmailUpdateFlowState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
