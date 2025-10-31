// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kyc_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$kycDataSourceHash() => r'ac8b5bbdfc393e003fb7e9711f70d09fa3382ecd';

/// Provider for KYC data source
///
/// Copied from [kycDataSource].
@ProviderFor(kycDataSource)
final kycDataSourceProvider = AutoDisposeProvider<KYCDataSource>.internal(
  kycDataSource,
  name: r'kycDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$kycDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef KycDataSourceRef = AutoDisposeProviderRef<KYCDataSource>;
String _$kycRepositoryHash() => r'5ff41eafb15b45c13d48301ea807f646dceba913';

/// Provider for KYC repository
///
/// Copied from [kycRepository].
@ProviderFor(kycRepository)
final kycRepositoryProvider = AutoDisposeProvider<KYCRepository>.internal(
  kycRepository,
  name: r'kycRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$kycRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef KycRepositoryRef = AutoDisposeProviderRef<KYCRepository>;
String _$kycUseCasesHash() => r'9e2878f6a3aac74b3b45d2584d40666aa01c7198';

/// Provider for KYC use cases
///
/// Copied from [kycUseCases].
@ProviderFor(kycUseCases)
final kycUseCasesProvider = AutoDisposeProvider<KYCUseCases>.internal(
  kycUseCases,
  name: r'kycUseCasesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$kycUseCasesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef KycUseCasesRef = AutoDisposeProviderRef<KYCUseCases>;
String _$kycProgressHash() => r'c1065522ce85984b230c63f29bf17ed167f866e6';

/// Provider for KYC verification progress
///
/// Copied from [kycProgress].
@ProviderFor(kycProgress)
final kycProgressProvider = AutoDisposeFutureProvider<double>.internal(
  kycProgress,
  name: r'kycProgressProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$kycProgressHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef KycProgressRef = AutoDisposeFutureProviderRef<double>;
String _$nextKYCStepHash() => r'4ad5919af546eff9b30b3647d8d5ab4e1565e6c8';

/// Provider for next KYC step
///
/// Copied from [nextKYCStep].
@ProviderFor(nextKYCStep)
final nextKYCStepProvider =
    AutoDisposeFutureProvider<KYCVerificationStep?>.internal(
  nextKYCStep,
  name: r'nextKYCStepProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$nextKYCStepHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NextKYCStepRef = AutoDisposeFutureProviderRef<KYCVerificationStep?>;
String _$kycRequirementsHash() => r'a0ee010945b03971578cff57d4305f2e83c90ca7';

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

/// Provider for KYC requirements based on level
///
/// Copied from [kycRequirements].
@ProviderFor(kycRequirements)
const kycRequirementsProvider = KycRequirementsFamily();

/// Provider for KYC requirements based on level
///
/// Copied from [kycRequirements].
class KycRequirementsFamily extends Family<AsyncValue<List<KYCStepType>>> {
  /// Provider for KYC requirements based on level
  ///
  /// Copied from [kycRequirements].
  const KycRequirementsFamily();

  /// Provider for KYC requirements based on level
  ///
  /// Copied from [kycRequirements].
  KycRequirementsProvider call(
    KYCLevel level,
  ) {
    return KycRequirementsProvider(
      level,
    );
  }

  @override
  KycRequirementsProvider getProviderOverride(
    covariant KycRequirementsProvider provider,
  ) {
    return call(
      provider.level,
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
  String? get name => r'kycRequirementsProvider';
}

/// Provider for KYC requirements based on level
///
/// Copied from [kycRequirements].
class KycRequirementsProvider
    extends AutoDisposeFutureProvider<List<KYCStepType>> {
  /// Provider for KYC requirements based on level
  ///
  /// Copied from [kycRequirements].
  KycRequirementsProvider(
    KYCLevel level,
  ) : this._internal(
          (ref) => kycRequirements(
            ref as KycRequirementsRef,
            level,
          ),
          from: kycRequirementsProvider,
          name: r'kycRequirementsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$kycRequirementsHash,
          dependencies: KycRequirementsFamily._dependencies,
          allTransitiveDependencies:
              KycRequirementsFamily._allTransitiveDependencies,
          level: level,
        );

  KycRequirementsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.level,
  }) : super.internal();

  final KYCLevel level;

  @override
  Override overrideWith(
    FutureOr<List<KYCStepType>> Function(KycRequirementsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: KycRequirementsProvider._internal(
        (ref) => create(ref as KycRequirementsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        level: level,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<KYCStepType>> createElement() {
    return _KycRequirementsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is KycRequirementsProvider && other.level == level;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, level.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin KycRequirementsRef on AutoDisposeFutureProviderRef<List<KYCStepType>> {
  /// The parameter `level` of this provider.
  KYCLevel get level;
}

class _KycRequirementsProviderElement
    extends AutoDisposeFutureProviderElement<List<KYCStepType>>
    with KycRequirementsRef {
  _KycRequirementsProviderElement(super.provider);

  @override
  KYCLevel get level => (origin as KycRequirementsProvider).level;
}

String _$canPerformActionHash() => r'3826b07579c20f579f004dfd5bbad11e05b4b510';

/// Provider to check if user can perform specific action
///
/// Copied from [canPerformAction].
@ProviderFor(canPerformAction)
const canPerformActionProvider = CanPerformActionFamily();

/// Provider to check if user can perform specific action
///
/// Copied from [canPerformAction].
class CanPerformActionFamily extends Family<AsyncValue<bool>> {
  /// Provider to check if user can perform specific action
  ///
  /// Copied from [canPerformAction].
  const CanPerformActionFamily();

  /// Provider to check if user can perform specific action
  ///
  /// Copied from [canPerformAction].
  CanPerformActionProvider call(
    String action,
  ) {
    return CanPerformActionProvider(
      action,
    );
  }

  @override
  CanPerformActionProvider getProviderOverride(
    covariant CanPerformActionProvider provider,
  ) {
    return call(
      provider.action,
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
  String? get name => r'canPerformActionProvider';
}

/// Provider to check if user can perform specific action
///
/// Copied from [canPerformAction].
class CanPerformActionProvider extends AutoDisposeFutureProvider<bool> {
  /// Provider to check if user can perform specific action
  ///
  /// Copied from [canPerformAction].
  CanPerformActionProvider(
    String action,
  ) : this._internal(
          (ref) => canPerformAction(
            ref as CanPerformActionRef,
            action,
          ),
          from: canPerformActionProvider,
          name: r'canPerformActionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$canPerformActionHash,
          dependencies: CanPerformActionFamily._dependencies,
          allTransitiveDependencies:
              CanPerformActionFamily._allTransitiveDependencies,
          action: action,
        );

  CanPerformActionProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.action,
  }) : super.internal();

  final String action;

  @override
  Override overrideWith(
    FutureOr<bool> Function(CanPerformActionRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CanPerformActionProvider._internal(
        (ref) => create(ref as CanPerformActionRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        action: action,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _CanPerformActionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CanPerformActionProvider && other.action == action;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, action.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CanPerformActionRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `action` of this provider.
  String get action;
}

class _CanPerformActionProviderElement
    extends AutoDisposeFutureProviderElement<bool> with CanPerformActionRef {
  _CanPerformActionProviderElement(super.provider);

  @override
  String get action => (origin as CanPerformActionProvider).action;
}

String _$kycStatsHash() => r'207738b5b722c647fe4347505c9b4fb1c550bd43';

/// Provider for KYC statistics
///
/// Copied from [kycStats].
@ProviderFor(kycStats)
final kycStatsProvider =
    AutoDisposeFutureProvider<Map<String, dynamic>>.internal(
  kycStats,
  name: r'kycStatsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$kycStatsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef KycStatsRef = AutoDisposeFutureProviderRef<Map<String, dynamic>>;
String _$userKYCHash() => r'0d232e8b2576e3063d7205974693470e10ec9312';

/// Provider for user's KYC data
///
/// Copied from [UserKYC].
@ProviderFor(UserKYC)
final userKYCProvider =
    AutoDisposeAsyncNotifierProvider<UserKYC, KYCData?>.internal(
  UserKYC.new,
  name: r'userKYCProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userKYCHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserKYC = AutoDisposeAsyncNotifier<KYCData?>;
String _$currentKYCStepHash() => r'45a5744bd4b7af7bec01c2d10457f00e292a213f';

/// Provider for current KYC step in flow
///
/// Copied from [CurrentKYCStep].
@ProviderFor(CurrentKYCStep)
final currentKYCStepProvider =
    AutoDisposeNotifierProvider<CurrentKYCStep, KYCVerificationStep?>.internal(
  CurrentKYCStep.new,
  name: r'currentKYCStepProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentKYCStepHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentKYCStep = AutoDisposeNotifier<KYCVerificationStep?>;
String _$kYCFlowStateHash() => r'49688efe617ce10a010db25d49418a503fb58ab3';

/// Provider for KYC flow state
///
/// Copied from [KYCFlowState].
@ProviderFor(KYCFlowState)
final kYCFlowStateProvider =
    AutoDisposeNotifierProvider<KYCFlowState, Map<String, dynamic>>.internal(
  KYCFlowState.new,
  name: r'kYCFlowStateProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$kYCFlowStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$KYCFlowState = AutoDisposeNotifier<Map<String, dynamic>>;
String _$documentUploadStateHash() =>
    r'03e3ee73b9f3498ef0638aa9edb5ecb5f79d1d45';

/// Provider for document upload state
///
/// Copied from [DocumentUploadState].
@ProviderFor(DocumentUploadState)
final documentUploadStateProvider = AutoDisposeNotifierProvider<
    DocumentUploadState, Map<String, bool>>.internal(
  DocumentUploadState.new,
  name: r'documentUploadStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$documentUploadStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DocumentUploadState = AutoDisposeNotifier<Map<String, bool>>;
String _$kYCValidationErrorsHash() =>
    r'd9f7b31c7a089c86316b9703c44c0ee6d4bedbdb';

/// Provider for KYC validation errors
///
/// Copied from [KYCValidationErrors].
@ProviderFor(KYCValidationErrors)
final kYCValidationErrorsProvider = AutoDisposeNotifierProvider<
    KYCValidationErrors, Map<String, String>>.internal(
  KYCValidationErrors.new,
  name: r'kYCValidationErrorsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$kYCValidationErrorsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$KYCValidationErrors = AutoDisposeNotifier<Map<String, String>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
