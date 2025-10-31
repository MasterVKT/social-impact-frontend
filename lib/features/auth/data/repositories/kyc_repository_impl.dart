import '../../domain/entities/kyc.dart';
import '../../domain/repositories/kyc_repository.dart';
import '../datasources/kyc_data_source.dart';

/// Implementation of KYCRepository using Firebase data source
/// Provides concrete implementation of all KYC-related operations
class KYCRepositoryImpl implements KYCRepository {
  final KYCDataSource _dataSource;

  const KYCRepositoryImpl(this._dataSource);

  @override
  Future<KYCData?> getKYCData(String userId) async {
    return await _dataSource.getKYCData(userId);
  }

  @override
  Future<KYCData> createKYCData({
    required String userId,
    required KYCLevel level,
  }) async {
    return await _dataSource.createKYCData(
      userId: userId,
      level: level,
    );
  }

  @override
  Future<KYCData> updateKYCData(KYCData kycData) async {
    return await _dataSource.updateKYCData(kycData);
  }

  @override
  Future<KYCData> submitForReview(String kycId) async {
    return await _dataSource.submitForReview(kycId);
  }

  @override
  Future<KYCDocument> uploadDocument({
    required String kycId,
    required String fileName,
    required List<int> fileBytes,
    required DocumentType type,
    String? description,
  }) async {
    return await _dataSource.uploadDocument(
      kycId: kycId,
      fileName: fileName,
      fileBytes: fileBytes,
      type: type,
      description: description,
    );
  }

  @override
  Future<void> deleteDocument(String documentId) async {
    return await _dataSource.deleteDocument(documentId);
  }

  @override
  Future<List<KYCDocument>> getDocuments(String kycId) async {
    return await _dataSource.getDocuments(kycId);
  }

  @override
  Future<void> updatePersonalInfo({
    required String kycId,
    required PersonalInfo personalInfo,
  }) async {
    // Get current KYC data
    final currentKYC = await _getKYCById(kycId);
    if (currentKYC == null) {
      throw Exception('KYC record not found');
    }

    // Update with new personal info
    final updatedKYC = currentKYC.copyWith(personalInfo: personalInfo);
    await _dataSource.updateKYCData(updatedKYC);
  }

  @override
  Future<void> updateAddressInfo({
    required String kycId,
    required AddressInfo addressInfo,
  }) async {
    // Get current KYC data
    final currentKYC = await _getKYCById(kycId);
    if (currentKYC == null) {
      throw Exception('KYC record not found');
    }

    // Update with new address info
    final updatedKYC = currentKYC.copyWith(addressInfo: addressInfo);
    await _dataSource.updateKYCData(updatedKYC);
  }

  @override
  Future<void> updateIdentityDocument({
    required String kycId,
    required IdentityDocument identityDocument,
  }) async {
    // Get current KYC data
    final currentKYC = await _getKYCById(kycId);
    if (currentKYC == null) {
      throw Exception('KYC record not found');
    }

    // Convertir l'IdentityDocument en KYCDocument
    final kycDocument = KYCDocument(
      id: identityDocument.id,
      type: DocumentType.identityFront,
      fileName:
          '${identityDocument.type.toString()}_${identityDocument.documentNumber}',
      filePath: identityDocument.frontImageUrl ?? '',
      fileUrl: identityDocument.frontImageUrl,
      uploadedAt: DateTime.now(),
      isVerified: identityDocument.isVerified,
      metadata: {
        'documentType': identityDocument.type.toString(),
        'documentNumber': identityDocument.documentNumber,
        'issuingCountry': identityDocument.issuingCountry,
        'expiryDate': identityDocument.expiryDate.toIso8601String(),
        'backImageUrl': identityDocument.backImageUrl,
      },
    );

    // Ajouter le document à la liste des documents existants
    final updatedDocuments = List<KYCDocument>.from(currentKYC.documents);
    updatedDocuments.add(kycDocument);

    final updatedKYC = currentKYC.copyWith(documents: updatedDocuments);
    await _dataSource.updateKYCData(updatedKYC);
  }

  @override
  Future<void> updateProofOfAddress({
    required String kycId,
    required ProofOfAddress proofOfAddress,
  }) async {
    // Get current KYC data
    final currentKYC = await _getKYCById(kycId);
    if (currentKYC == null) {
      throw Exception('KYC record not found');
    }

    // Convertir le ProofOfAddress en KYCDocument
    final kycDocument = KYCDocument(
      id: proofOfAddress.id,
      type: DocumentType.proofOfAddress,
      fileName:
          '${proofOfAddress.type.toString()}_${proofOfAddress.documentName}',
      filePath: proofOfAddress.imageUrl ?? '',
      fileUrl: proofOfAddress.imageUrl,
      uploadedAt: DateTime.now(),
      isVerified: proofOfAddress.isVerified,
      metadata: {
        'documentType': proofOfAddress.type.toString(),
        'documentName': proofOfAddress.documentName,
        'documentDate': proofOfAddress.documentDate.toIso8601String(),
      },
    );

    // Ajouter le document à la liste des documents existants
    final updatedDocuments = List<KYCDocument>.from(currentKYC.documents);
    updatedDocuments.add(kycDocument);

    final updatedKYC = currentKYC.copyWith(documents: updatedDocuments);
    await _dataSource.updateKYCData(updatedKYC);
  }

  @override
  Future<void> updateFinancialInfo({
    required String kycId,
    required FinancialInfo financialInfo,
  }) async {
    // Get current KYC data
    final currentKYC = await _getKYCById(kycId);
    if (currentKYC == null) {
      throw Exception('KYC record not found');
    }

    // Update with new financial info
    final updatedKYC = currentKYC.copyWith(financialInfo: financialInfo);
    await _dataSource.updateKYCData(updatedKYC);
  }

  @override
  Future<void> updateBusinessInfo({
    required String kycId,
    required BusinessInfo businessInfo,
  }) async {
    // Get current KYC data
    final currentKYC = await _getKYCById(kycId);
    if (currentKYC == null) {
      throw Exception('KYC record not found');
    }

    // Update with new business info
    final updatedKYC = currentKYC.copyWith(businessInfo: businessInfo);
    await _dataSource.updateKYCData(updatedKYC);
  }

  @override
  Future<KYCVerificationStep> startVerificationStep({
    required String kycId,
    required KYCStepType stepType,
  }) async {
    return await _dataSource.startVerificationStep(
      kycId: kycId,
      stepType: stepType,
    );
  }

  @override
  Future<KYCVerificationStep> completeVerificationStep({
    required String kycId,
    required String stepId,
    Map<String, dynamic>? metadata,
  }) async {
    return await _dataSource.completeVerificationStep(
      kycId: kycId,
      stepId: stepId,
      metadata: metadata,
    );
  }

  @override
  Future<KYCVerificationStep> failVerificationStep({
    required String kycId,
    required String stepId,
    String? reason,
  }) async {
    // This would be implemented similar to completeVerificationStep
    // but setting status to failed and storing the reason
    throw UnimplementedError('failVerificationStep not yet implemented');
  }

  @override
  Future<List<KYCVerificationStep>> getVerificationSteps(String kycId) async {
    final kycData = await _getKYCById(kycId);
    return kycData?.verificationSteps ?? [];
  }

  @override
  Future<RiskAssessment> performRiskAssessment(String kycId) async {
    return await _dataSource.performRiskAssessment(kycId);
  }

  @override
  Future<Map<String, dynamic>> getKYCStats(String userId) async {
    return await _dataSource.getKYCStats(userId);
  }

  @override
  Future<bool> canUpgradeLevel({
    required String kycId,
    required KYCLevel targetLevel,
  }) async {
    final kycData = await _getKYCById(kycId);
    if (kycData == null) return false;

    // Check if current level allows upgrade to target level
    final currentLevelIndex = KYCLevel.values.indexOf(kycData.level);
    final targetLevelIndex = KYCLevel.values.indexOf(targetLevel);

    // Can only upgrade to higher levels
    if (targetLevelIndex <= currentLevelIndex) return false;

    // Check if current level is verified
    if (!kycData.isVerified) return false;

    // Check if not expired
    if (kycData.isExpired) return false;

    return true;
  }

  @override
  Future<KYCData> upgradeKYCLevel({
    required String kycId,
    required KYCLevel newLevel,
  }) async {
    final kycData = await _getKYCById(kycId);
    if (kycData == null) {
      throw Exception('KYC record not found');
    }

    // Generate new verification steps for the upgraded level
    final newSteps = _generateUpgradeSteps(kycData.level, newLevel);
    final allSteps = [...kycData.verificationSteps, ...newSteps];

    final upgradedKYC = kycData.copyWith(
      level: newLevel,
      status: KYCStatus.pending, // Reset status for new verification
      verificationSteps: allSteps,
    );

    return await _dataSource.updateKYCData(upgradedKYC);
  }

  @override
  Future<List<KYCStepType>> getRequiredSteps(KYCLevel level) async {
    switch (level) {
      case KYCLevel.basic:
        return [
          KYCStepType.documentUpload,
          KYCStepType.identityVerification,
          KYCStepType.addressVerification,
        ];
      case KYCLevel.enhanced:
        return [
          KYCStepType.documentUpload,
          KYCStepType.identityVerification,
          KYCStepType.addressVerification,
          KYCStepType.financialVerification,
        ];
      case KYCLevel.intermediate:
        return [
          KYCStepType.documentUpload,
          KYCStepType.identityVerification,
          KYCStepType.addressVerification,
          KYCStepType.financialVerification,
        ];
      case KYCLevel.advanced:
        return [
          KYCStepType.documentUpload,
          KYCStepType.identityVerification,
          KYCStepType.addressVerification,
          KYCStepType.financialVerification,
          KYCStepType.businessVerification,
        ];
      case KYCLevel.institutional:
        return [
          KYCStepType.documentUpload,
          KYCStepType.identityVerification,
          KYCStepType.addressVerification,
          KYCStepType.financialVerification,
          KYCStepType.businessVerification,
        ];
    }
  }

  @override
  Future<Map<String, dynamic>> validateDocument({
    required String documentUrl,
    required DocumentType type,
  }) async {
    // This would implement document validation logic
    // For now, return a simple validation result
    return {
      'isValid': true,
      'confidence': 0.95,
      'extractedData': {},
      'validationErrors': <String>[],
    };
  }

  @override
  Future<double> getVerificationProgress(String kycId) async {
    final kycData = await _getKYCById(kycId);
    if (kycData == null) return 0.0;

    return kycData.completionPercentage;
  }

  @override
  Future<bool> meetsRequirements({
    required String userId,
    required String action,
  }) async {
    final kycData = await getKYCData(userId);
    if (kycData == null || !kycData.isVerified) return false;

    switch (action) {
      case 'invest':
        return kycData.level == KYCLevel.basic ||
            kycData.level == KYCLevel.enhanced ||
            kycData.level == KYCLevel.institutional;
      case 'withdraw':
        return kycData.level == KYCLevel.enhanced ||
            kycData.level == KYCLevel.institutional;
      case 'transfer':
        return kycData.level == KYCLevel.enhanced ||
            kycData.level == KYCLevel.institutional;
      case 'institutional_trading':
        return kycData.level == KYCLevel.institutional;
      default:
        return false;
    }
  }

  /// Helper method to get KYC by ID
  /// This is a simplified implementation - in practice you might need a separate method
  Future<KYCData?> _getKYCById(String kycId) async {
    // This is a simplified implementation
    // In practice, you'd have a separate method to get KYC by ID
    throw UnimplementedError('_getKYCById needs proper implementation');
  }

  /// Generate additional verification steps for level upgrade
  List<KYCVerificationStep> _generateUpgradeSteps(
    KYCLevel currentLevel,
    KYCLevel targetLevel,
  ) {
    final steps = <KYCVerificationStep>[];

    // Add financial verification for enhanced upgrade
    if (currentLevel == KYCLevel.basic &&
        (targetLevel == KYCLevel.enhanced ||
            targetLevel == KYCLevel.institutional)) {
      steps.add(KYCVerificationStep(
        id: 'fin_${DateTime.now().millisecondsSinceEpoch}',
        stepId: 'financial_upgrade_${DateTime.now().millisecondsSinceEpoch}',
        name: 'Financial Verification Upgrade',
        type: KYCStepType.financialVerification,
        status: KYCStepStatus.pending,
        title: 'Financial Verification',
        description: 'Additional financial verification for enhanced level',
      ));
    }

    // Add business verification for institutional upgrade
    if (targetLevel == KYCLevel.institutional) {
      steps.add(KYCVerificationStep(
        id: 'bus_${DateTime.now().millisecondsSinceEpoch}',
        stepId: 'business_upgrade_${DateTime.now().millisecondsSinceEpoch}',
        name: 'Business Verification Upgrade',
        type: KYCStepType.businessVerification,
        status: KYCStepStatus.pending,
        title: 'Business Verification',
        description: 'Business verification for institutional level',
      ));
    }

    // Add new risk assessment for any upgrade
    steps.add(KYCVerificationStep(
      id: 'risk_${DateTime.now().millisecondsSinceEpoch}',
      stepId: 'risk_upgrade_${DateTime.now().millisecondsSinceEpoch}',
      name: 'Risk Assessment Upgrade',
      type: KYCStepType.riskAssessment,
      status: KYCStepStatus.pending,
      title: 'Risk Assessment',
      description: 'Updated risk assessment for new KYC level',
    ));

    return steps;
  }
}
