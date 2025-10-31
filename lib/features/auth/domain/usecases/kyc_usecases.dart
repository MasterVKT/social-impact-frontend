import '../entities/kyc.dart';
import '../repositories/kyc_repository.dart';

/// Use cases for KYC (Know Your Customer) operations
/// Implements business logic for KYC verification processes
class KYCUseCases {
  final KYCRepository _repository;

  const KYCUseCases(this._repository);

  /// Initialize KYC process for a user
  Future<KYCData> initializeKYC({
    required String userId,
    KYCLevel level = KYCLevel.basic,
  }) async {
    // Check if KYC already exists
    final existingKYC = await _repository.getKYCData(userId);
    if (existingKYC != null) {
      throw const KYCException('KYC record already exists for user');
    }

    return await _repository.createKYCData(
      userId: userId,
      level: level,
    );
  }

  /// Get user's KYC data with validation
  Future<KYCData?> getUserKYC(String userId) async {
    final kycData = await _repository.getKYCData(userId);

    // Check for expiration
    if (kycData?.isExpired == true) {
      throw const KYCException('KYC verification has expired');
    }

    return kycData;
  }

  /// Submit personal information for KYC
  Future<void> submitPersonalInfo({
    required String kycId,
    required PersonalInfo personalInfo,
  }) async {
    // Validate personal information
    _validatePersonalInfo(personalInfo);

    await _repository.updatePersonalInfo(
      kycId: kycId,
      personalInfo: personalInfo,
    );
  }

  /// Submit address information for KYC
  Future<void> submitAddressInfo({
    required String kycId,
    required AddressInfo addressInfo,
  }) async {
    // Validate address information
    _validateAddressInfo(addressInfo);

    await _repository.updateAddressInfo(
      kycId: kycId,
      addressInfo: addressInfo,
    );
  }

  /// Upload and validate identity document
  Future<KYCDocument> uploadIdentityDocument({
    required String kycId,
    required String fileName,
    required List<int> fileBytes,
    required IdentityDocumentType documentType,
  }) async {
    // Validate file size and format
    _validateDocumentFile(fileName, fileBytes);

    final kycDocumentType = _mapIdentityDocumentType(documentType);

    final document = await _repository.uploadDocument(
      kycId: kycId,
      fileName: fileName,
      fileBytes: fileBytes,
      type: kycDocumentType,
      description: 'Identity document: ${documentType.name}',
    );

    // Start identity verification step
    await _repository.startVerificationStep(
      kycId: kycId,
      stepType: KYCStepType.identityVerification,
    );

    return document;
  }

  /// Upload proof of address document
  Future<KYCDocument> uploadProofOfAddress({
    required String kycId,
    required String fileName,
    required List<int> fileBytes,
    required ProofOfAddressType documentType,
  }) async {
    // Validate file size and format
    _validateDocumentFile(fileName, fileBytes);

    final document = await _repository.uploadDocument(
      kycId: kycId,
      fileName: fileName,
      fileBytes: fileBytes,
      type: DocumentType.proofOfAddress,
      description: 'Proof of address: ${documentType.name}',
    );

    // Start address verification step
    await _repository.startVerificationStep(
      kycId: kycId,
      stepType: KYCStepType.addressVerification,
    );

    return document;
  }

  /// Submit financial information for enhanced KYC
  Future<void> submitFinancialInfo({
    required String kycId,
    required FinancialInfo financialInfo,
  }) async {
    // Validate financial information
    _validateFinancialInfo(financialInfo);

    await _repository.updateFinancialInfo(
      kycId: kycId,
      financialInfo: financialInfo,
    );

    // Start financial verification step
    await _repository.startVerificationStep(
      kycId: kycId,
      stepType: KYCStepType.financialVerification,
    );
  }

  /// Submit business information for institutional KYC
  Future<void> submitBusinessInfo({
    required String kycId,
    required BusinessInfo businessInfo,
  }) async {
    // Validate business information
    _validateBusinessInfo(businessInfo);

    await _repository.updateBusinessInfo(
      kycId: kycId,
      businessInfo: businessInfo,
    );

    // Start business verification step
    await _repository.startVerificationStep(
      kycId: kycId,
      stepType: KYCStepType.businessVerification,
    );
  }

  /// Submit complete KYC application for review
  Future<KYCData> submitForReview(String kycId) async {
    // Validate that all required information is provided
    final kycData =
        await _repository.getKYCData(''); // Will be filtered by kycId
    if (kycData == null) {
      throw const KYCException('KYC data not found');
    }

    // Check completion requirements based on level
    final requiredSteps = await _repository.getRequiredSteps(kycData.level);
    final completedSteps = kycData.verificationSteps
        .where((step) => step.status == KYCStepStatus.completed)
        .map((step) => step.type)
        .toList();

    final missingSteps =
        requiredSteps.where((step) => !completedSteps.contains(step)).toList();

    if (missingSteps.isNotEmpty) {
      throw KYCException(
          'Missing required verification steps: ${missingSteps.map((s) => s.name).join(', ')}');
    }

    final submittedKYC = await _repository.submitForReview(kycId);

    // Trigger risk assessment
    await _repository.performRiskAssessment(kycId);

    return submittedKYC;
  }

  /// Get KYC verification progress percentage
  Future<double> getVerificationProgress(String kycId) async {
    return await _repository.getVerificationProgress(kycId);
  }

  /// Check if user can perform specific action based on KYC status
  Future<bool> canPerformAction({
    required String userId,
    required String action,
  }) async {
    return await _repository.meetsRequirements(
      userId: userId,
      action: action,
    );
  }

  /// Upgrade KYC level
  Future<KYCData> upgradeKYCLevel({
    required String kycId,
    required KYCLevel targetLevel,
  }) async {
    // Check if upgrade is possible
    final canUpgrade = await _repository.canUpgradeLevel(
      kycId: kycId,
      targetLevel: targetLevel,
    );

    if (!canUpgrade) {
      throw const KYCException('Cannot upgrade to requested KYC level');
    }

    return await _repository.upgradeKYCLevel(
      kycId: kycId,
      newLevel: targetLevel,
    );
  }

  /// Get next required verification step
  Future<KYCStepType?> getNextRequiredStep(String kycId) async {
    final steps = await _repository.getVerificationSteps(kycId);

    final nextStep =
        steps.where((step) => step.status == KYCStepStatus.pending).firstOrNull;

    return nextStep?.type;
  }

  /// Validate personal information
  void _validatePersonalInfo(PersonalInfo personalInfo) {
    if (personalInfo.firstName.trim().isEmpty) {
      throw const KYCValidationException('First name is required');
    }

    if (personalInfo.lastName.trim().isEmpty) {
      throw const KYCValidationException('Last name is required');
    }

    if (personalInfo.nationality.trim().isEmpty) {
      throw const KYCValidationException('Nationality is required');
    }

    if (personalInfo.countryOfResidence == null ||
        personalInfo.countryOfResidence!.trim().isEmpty) {
      throw const KYCValidationException('Country of residence is required');
    }

    // Check age requirement (must be 18+)
    final age =
        DateTime.now().difference(personalInfo.dateOfBirth).inDays / 365;
    if (age < 18) {
      throw const KYCValidationException('Must be 18 years or older');
    }
  }

  /// Validate address information
  void _validateAddressInfo(AddressInfo addressInfo) {
    if (addressInfo.street.trim().isEmpty) {
      throw const KYCValidationException('Street address is required');
    }

    if (addressInfo.city.trim().isEmpty) {
      throw const KYCValidationException('City is required');
    }

    if (addressInfo.state.trim().isEmpty) {
      throw const KYCValidationException('State/Province is required');
    }

    if (addressInfo.postalCode.trim().isEmpty) {
      throw const KYCValidationException('Postal code is required');
    }

    if (addressInfo.country.trim().isEmpty) {
      throw const KYCValidationException('Country is required');
    }
  }

  /// Validate financial information
  void _validateFinancialInfo(FinancialInfo financialInfo) {
    if (financialInfo.sourceOfWealth == WealthSource.other) {
      throw const KYCValidationException(
          'A specific source of wealth must be provided');
    }

    if (financialInfo.netWorth != null && financialInfo.netWorth! < 0) {
      throw const KYCValidationException('Net worth cannot be negative');
    }
  }

  /// Validate business information
  void _validateBusinessInfo(BusinessInfo businessInfo) {
    if (businessInfo.legalName.trim().isEmpty) {
      throw const KYCValidationException('Business legal name is required');
    }

    if (businessInfo.registrationNumber.trim().isEmpty) {
      throw const KYCValidationException('Business registration number is required');
    }

    if (businessInfo.taxId.trim().isEmpty) {
      throw const KYCValidationException('Tax ID is required');
    }

    // Nous ne vérifions pas les personnes autorisées pour l'instant
    // Cette fonctionnalité sera implémentée ultérieurement
  }

  /// Validate document file
  void _validateDocumentFile(String fileName, List<int> fileBytes) {
    const maxFileSize = 10 * 1024 * 1024; // 10MB
    const allowedExtensions = ['jpg', 'jpeg', 'png', 'pdf'];

    if (fileBytes.length > maxFileSize) {
      throw const KYCValidationException('File size cannot exceed 10MB');
    }

    final extension = fileName.split('.').last.toLowerCase();
    if (!allowedExtensions.contains(extension)) {
      throw const KYCValidationException(
          'Only JPG, JPEG, PNG, and PDF files are allowed');
    }
  }

  /// Map identity document type to KYC document type
  DocumentType _mapIdentityDocumentType(IdentityDocumentType type) {
    switch (type) {
      case IdentityDocumentType.passport:
      case IdentityDocumentType.nationalId:
      case IdentityDocumentType.driversLicense:
      case IdentityDocumentType.residencePermit:
        return DocumentType.identityFront;
    }
  }
}

/// Base exception for KYC operations
class KYCException implements Exception {
  final String message;
  const KYCException(this.message);

  @override
  String toString() => 'KYCException: $message';
}

/// Exception for KYC validation errors
class KYCValidationException extends KYCException {
  const KYCValidationException(String message) : super(message);

  @override
  String toString() => 'KYCValidationException: $message';
}

/// Exception for insufficient KYC level
class InsufficientKYCException extends KYCException {
  final KYCLevel required;
  final KYCLevel? current;

  const InsufficientKYCException({
    required this.required,
    this.current,
  }) : super('Insufficient KYC level');

  @override
  String toString() =>
      'InsufficientKYCException: Required ${required.name}, current: ${current?.name ?? 'none'}';
}
