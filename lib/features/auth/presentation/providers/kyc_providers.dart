import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/kyc.dart';
import '../../domain/usecases/kyc_usecases.dart';
import '../../domain/repositories/kyc_repository.dart';
import '../../data/repositories/kyc_repository_impl.dart';
import '../../data/datasources/kyc_data_source.dart';
import 'auth_provider_aliases.dart';

part 'kyc_providers.g.dart';

/// Provider for KYC data source
@riverpod
KYCDataSource kycDataSource(KycDataSourceRef ref) {
  return KYCDataSource();
}

/// Provider for KYC repository
@riverpod
KYCRepository kycRepository(KycRepositoryRef ref) {
  final dataSource = ref.read(kycDataSourceProvider);
  return KYCRepositoryImpl(dataSource);
}

/// Provider for KYC use cases
@riverpod
KYCUseCases kycUseCases(KycUseCasesRef ref) {
  final repository = ref.read(kycRepositoryProvider);
  return KYCUseCases(repository);
}

/// Provider for user's KYC data
@riverpod
class UserKYC extends _$UserKYC {
  @override
  Future<KYCData?> build() async {
    final authState = ref.watch(authStateProvider);

    return authState.maybeWhen(
      authenticated: (user) async {

        final useCases = ref.read(kycUseCasesProvider);
        try {
          return await useCases.getUserKYC(user.uid);
        } catch (e) {
          // If KYC doesn't exist or error occurs, return null
          return null;
        }
      },
      loading: () => null,
      error: (error, code) => null,
      orElse: () => null,
    );
  }

  /// Initialize KYC process for user
  Future<void> initializeKYC({KYCLevel level = KYCLevel.basic}) async {
    final authState = ref.read(authStateProvider);

    await authState.maybeWhen(
      authenticated: (user) async {
        final useCases = ref.read(kycUseCasesProvider);
        final kycData = await useCases.initializeKYC(
          userId: user.uid,
          level: level,
        );

        state = AsyncValue.data(kycData);
      },
      loading: () => throw Exception('Authentication loading'),
      error: (error, code) => throw error,
      orElse: () => throw Exception('User not authenticated'),
    );
  }

  /// Submit personal information
  Future<void> submitPersonalInfo(PersonalInfo personalInfo) async {
    final currentKYC = state.valueOrNull;
    if (currentKYC == null) throw Exception('No KYC record found');

    final useCases = ref.read(kycUseCasesProvider);
    await useCases.submitPersonalInfo(
      kycId: currentKYC.id,
      personalInfo: personalInfo,
    );

    // Refresh KYC data
    ref.invalidateSelf();
  }

  /// Submit address information
  Future<void> submitAddressInfo(AddressInfo addressInfo) async {
    final currentKYC = state.valueOrNull;
    if (currentKYC == null) throw Exception('No KYC record found');

    final useCases = ref.read(kycUseCasesProvider);
    await useCases.submitAddressInfo(
      kycId: currentKYC.id,
      addressInfo: addressInfo,
    );

    // Refresh KYC data
    ref.invalidateSelf();
  }

  /// Upload identity document
  Future<void> uploadIdentityDocument({
    required String fileName,
    required List<int> fileBytes,
    required IdentityDocumentType documentType,
  }) async {
    final currentKYC = state.valueOrNull;
    if (currentKYC == null) throw Exception('No KYC record found');

    final useCases = ref.read(kycUseCasesProvider);
    await useCases.uploadIdentityDocument(
      kycId: currentKYC.id,
      fileName: fileName,
      fileBytes: fileBytes,
      documentType: documentType,
    );

    // Refresh KYC data
    ref.invalidateSelf();
  }

  /// Upload proof of address
  Future<void> uploadProofOfAddress({
    required String fileName,
    required List<int> fileBytes,
    required ProofOfAddressType documentType,
  }) async {
    final currentKYC = state.valueOrNull;
    if (currentKYC == null) throw Exception('No KYC record found');

    final useCases = ref.read(kycUseCasesProvider);
    await useCases.uploadProofOfAddress(
      kycId: currentKYC.id,
      fileName: fileName,
      fileBytes: fileBytes,
      documentType: documentType,
    );

    // Refresh KYC data
    ref.invalidateSelf();
  }

  /// Submit financial information
  Future<void> submitFinancialInfo(FinancialInfo financialInfo) async {
    final currentKYC = state.valueOrNull;
    if (currentKYC == null) throw Exception('No KYC record found');

    final useCases = ref.read(kycUseCasesProvider);
    await useCases.submitFinancialInfo(
      kycId: currentKYC.id,
      financialInfo: financialInfo,
    );

    // Refresh KYC data
    ref.invalidateSelf();
  }

  /// Submit business information
  Future<void> submitBusinessInfo(BusinessInfo businessInfo) async {
    final currentKYC = state.valueOrNull;
    if (currentKYC == null) throw Exception('No KYC record found');

    final useCases = ref.read(kycUseCasesProvider);
    await useCases.submitBusinessInfo(
      kycId: currentKYC.id,
      businessInfo: businessInfo,
    );

    // Refresh KYC data
    ref.invalidateSelf();
  }

  /// Submit KYC for review
  Future<void> submitForReview() async {
    final currentKYC = state.valueOrNull;
    if (currentKYC == null) throw Exception('No KYC record found');

    final useCases = ref.read(kycUseCasesProvider);
    final submittedKYC = await useCases.submitForReview(currentKYC.id);

    state = AsyncValue.data(submittedKYC);
  }

  /// Upgrade KYC level
  Future<void> upgradeKYCLevel(KYCLevel targetLevel) async {
    final currentKYC = state.valueOrNull;
    if (currentKYC == null) throw Exception('No KYC record found');

    final useCases = ref.read(kycUseCasesProvider);
    final upgradedKYC = await useCases.upgradeKYCLevel(
      kycId: currentKYC.id,
      targetLevel: targetLevel,
    );

    state = AsyncValue.data(upgradedKYC);
  }
}

/// Provider for KYC verification progress
@riverpod
Future<double> kycProgress(KycProgressRef ref) async {
  final kycData = await ref.watch(userKYCProvider.future);
  if (kycData == null) return 0.0;

  return kycData.completionPercentage;
}

/// Provider for next KYC step
@riverpod
Future<KYCVerificationStep?> nextKYCStep(NextKYCStepRef ref) async {
  final kycData = await ref.watch(userKYCProvider.future);
  if (kycData == null) return null;

  return kycData.nextStep;
}

/// Provider for KYC requirements based on level
@riverpod
Future<List<KYCStepType>> kycRequirements(
  KycRequirementsRef ref,
  KYCLevel level,
) async {
  final repository = ref.read(kycRepositoryProvider);
  return await repository.getRequiredSteps(level);
}

/// Provider to check if user can perform specific action
@riverpod
Future<bool> canPerformAction(
  CanPerformActionRef ref,
  String action,
) async {
  final authState = ref.watch(authStateProvider);
  return authState.maybeWhen(
    authenticated: (user) async {
      final useCases = ref.read(kycUseCasesProvider);
      return await useCases.canPerformAction(
        userId: user.uid,
        action: action,
      );
    },
    orElse: () => false,
  );
}

/// Provider for KYC statistics
@riverpod
Future<Map<String, dynamic>> kycStats(KycStatsRef ref) async {
  final authState = ref.watch(authStateProvider);
  return authState.maybeWhen(
    authenticated: (user) async {
      final repository = ref.read(kycRepositoryProvider);
      return await repository.getKYCStats(user.uid);
    },
    orElse: () => {
      'hasKYC': false,
      'level': null,
      'status': null,
      'progress': 0.0,
      'completedSteps': 0,
      'totalSteps': 0,
    },
  );
}

/// Provider for current KYC step in flow
@riverpod
class CurrentKYCStep extends _$CurrentKYCStep {
  @override
  KYCVerificationStep? build() {
    return null;
  }

  /// Set current step
  void setCurrentStep(KYCVerificationStep step) {
    state = step;
  }

  /// Clear current step
  void clearCurrentStep() {
    state = null;
  }

  /// Move to next step
  void moveToNextStep(List<KYCVerificationStep> steps) {
    if (state == null) return;

    final currentIndex =
        steps.indexWhere((step) => step.stepId == state!.stepId);
    if (currentIndex != -1 && currentIndex < steps.length - 1) {
      state = steps[currentIndex + 1];
    }
  }

  /// Move to previous step
  void moveToPreviousStep(List<KYCVerificationStep> steps) {
    if (state == null) return;

    final currentIndex =
        steps.indexWhere((step) => step.stepId == state!.stepId);
    if (currentIndex > 0) {
      state = steps[currentIndex - 1];
    }
  }
}

/// Provider for KYC flow state
@riverpod
class KYCFlowState extends _$KYCFlowState {
  @override
  Map<String, dynamic> build() {
    return {
      'isActive': false,
      'selectedLevel': KYCLevel.basic,
      'completedSteps': <String>[],
      'currentStepData': <String, dynamic>{},
    };
  }

  /// Start KYC flow
  void startFlow(KYCLevel level) {
    state = {
      ...state,
      'isActive': true,
      'selectedLevel': level,
      'completedSteps': <String>[],
      'currentStepData': <String, dynamic>{},
    };
  }

  /// Complete current step
  void completeStep(String stepId, Map<String, dynamic> stepData) {
    final completedSteps = List<String>.from(state['completedSteps'] as List);
    if (!completedSteps.contains(stepId)) {
      completedSteps.add(stepId);
    }

    state = {
      ...state,
      'completedSteps': completedSteps,
      'currentStepData': {
        ...state['currentStepData'] as Map<String, dynamic>,
        stepId: stepData,
      },
    };
  }

  /// Update step data
  void updateStepData(String stepId, Map<String, dynamic> stepData) {
    state = {
      ...state,
      'currentStepData': {
        ...state['currentStepData'] as Map<String, dynamic>,
        stepId: stepData,
      },
    };
  }

  /// End KYC flow
  void endFlow() {
    state = {
      'isActive': false,
      'selectedLevel': KYCLevel.basic,
      'completedSteps': <String>[],
      'currentStepData': <String, dynamic>{},
    };
  }

  /// Get step data
  Map<String, dynamic>? getStepData(String stepId) {
    final allStepData = state['currentStepData'] as Map<String, dynamic>;
    return allStepData[stepId] as Map<String, dynamic>?;
  }

  /// Check if step is completed
  bool isStepCompleted(String stepId) {
    final completedSteps = state['completedSteps'] as List<String>;
    return completedSteps.contains(stepId);
  }

  /// Get selected KYC level
  KYCLevel get selectedLevel => state['selectedLevel'] as KYCLevel;

  /// Check if flow is active
  bool get isActive => state['isActive'] as bool;
}

/// Provider for document upload state
@riverpod
class DocumentUploadState extends _$DocumentUploadState {
  @override
  Map<String, bool> build() {
    return {};
  }

  /// Set upload state for document
  void setUploading(String documentKey, bool isUploading) {
    state = {
      ...state,
      documentKey: isUploading,
    };
  }

  /// Check if document is uploading
  bool isUploading(String documentKey) {
    return state[documentKey] ?? false;
  }

  /// Clear all upload states
  void clearAll() {
    state = {};
  }
}

/// Provider for KYC validation errors
@riverpod
class KYCValidationErrors extends _$KYCValidationErrors {
  @override
  Map<String, String> build() {
    return {};
  }

  /// Set validation error
  void setError(String field, String error) {
    state = {
      ...state,
      field: error,
    };
  }

  /// Clear validation error
  void clearError(String field) {
    final newState = Map<String, String>.from(state);
    newState.remove(field);
    state = newState;
  }

  /// Clear all errors
  void clearAll() {
    state = {};
  }

  /// Check if field has error
  bool hasError(String field) {
    return state.containsKey(field);
  }

  /// Get error for field
  String? getError(String field) {
    return state[field];
  }
}
