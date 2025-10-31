import 'package:freezed_annotation/freezed_annotation.dart';

part 'kyc.freezed.dart';
part 'kyc.g.dart';

/// KYC status enumeration
enum KYCStatus {
  notStarted,
  pending,
  inReview,
  approved,
  verified,
  rejected,
  expired,
  needsUpdate,
}

/// KYC step enumeration
enum KYCStep {
  personalInfo,
  addressInfo,
  identityVerification,
  documentUpload,
  biometricVerification,
  review,
}

/// KYC step types for verification process
enum KYCStepType {
  personalInformation,
  addressVerification,
  identityVerification,
  documentUpload,
  documentVerification,
  biometricVerification,
  businessVerification,
  financialVerification,
  riskAssessment,
  manualReview,
}

/// KYC step status
enum KYCStepStatus {
  notStarted,
  inProgress,
  completed,
  failed,
  pending,
  skipped,
}

/// KYC verification level
enum KYCLevel {
  basic,
  enhanced,
  intermediate,
  advanced,
  institutional,
}

/// Document type for KYC
enum DocumentType {
  passport,
  driverLicense,
  nationalId,
  utilityBill,
  bankStatement,
  taxDocument,
  identityFront,
  identityBack,
  proofOfAddress,
  selfie,
  businessRegistration,
  authorizationLetter,
}

/// KYC data entity
@freezed
class KYCData with _$KYCData {
  const factory KYCData({
    required String id,
    required String userId,
    required KYCStatus status,
    required KYCLevel level,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? submittedAt,
    DateTime? reviewedAt,
    DateTime? approvedAt,
    String? reviewNotes,
    String? rejectionReason,
    List<String>? rejectionReasons,
    required PersonalInfo personalInfo,
    required AddressInfo addressInfo,
    required List<KYCDocument> documents,
    @Default([]) List<KYCVerificationStep> verificationSteps,
    FinancialInfo? financialInfo,
    BusinessInfo? businessInfo,
    RiskAssessment? riskAssessment,
    BiometricData? biometricData,
    @Default({}) Map<String, dynamic> metadata,
  }) = _KYCData;
  
  const KYCData._();
  
  factory KYCData.fromJson(Map<String, dynamic> json) => _$KYCDataFromJson(json);
  
  /// Extensions for KYCData
  double get completionPercentage {
    int completedSteps = verificationSteps.where((step) => step.status == KYCStepStatus.completed).length;
    int totalSteps = verificationSteps.length;
    return totalSteps > 0 ? completedSteps / totalSteps : 0.0;
  }
  
  bool get isVerified => status == KYCStatus.verified;
  bool get isPendingReview => status == KYCStatus.inReview;
  bool get isExpired => status == KYCStatus.expired;
  
  KYCVerificationStep? get nextStep {
    return verificationSteps.firstWhere(
      (step) => step.status == KYCStepStatus.pending || step.status == KYCStepStatus.notStarted,
      orElse: () => verificationSteps.first,
    );
  }
}

/// Personal information for KYC
@freezed
class PersonalInfo with _$PersonalInfo {
  const factory PersonalInfo({
    required String firstName,
    required String lastName,
    String? middleName,
    required DateTime dateOfBirth,
    required String nationality,
    String? countryOfResidence,
    String? placeOfBirth,
    required String phoneNumber,
    required String email,
    String? occupation,
    String? employerName,
    double? annualIncome,
    String? sourceOfFunds,
  }) = _PersonalInfo;
  
  factory PersonalInfo.fromJson(Map<String, dynamic> json) => _$PersonalInfoFromJson(json);
}

/// Address information for KYC
@freezed
class AddressInfo with _$AddressInfo {
  const factory AddressInfo({
    required String street,
    String? apartment,
    required String city,
    required String state,
    required String postalCode,
    required String country,
    bool? isPrimary,
    DateTime? residenceSince,
  }) = _AddressInfo;
  
  factory AddressInfo.fromJson(Map<String, dynamic> json) => _$AddressInfoFromJson(json);
}

/// KYC document
@freezed
class KYCDocument with _$KYCDocument {
  const factory KYCDocument({
    required String id,
    required DocumentType type,
    required String fileName,
    required String filePath,
    String? fileUrl,
    required DateTime uploadedAt,
    bool? isVerified,
    String? verificationNotes,
    @Default({}) Map<String, dynamic> metadata,
  }) = _KYCDocument;
  
  factory KYCDocument.fromJson(Map<String, dynamic> json) => _$KYCDocumentFromJson(json);
}

/// Biometric data for KYC
@freezed
class BiometricData with _$BiometricData {
  const factory BiometricData({
    String? faceImagePath,
    String? voiceSamplePath,
    DateTime? capturedAt,
    bool? isLive,
    double? confidenceScore,
    @Default({}) Map<String, dynamic> metadata,
  }) = _BiometricData;
  
  factory BiometricData.fromJson(Map<String, dynamic> json) => _$BiometricDataFromJson(json);
}

/// KYC verification result
@freezed
class KYCVerificationResult with _$KYCVerificationResult {
  const factory KYCVerificationResult({
    required String kycId,
    required KYCStatus status,
    required KYCLevel level,
    String? message,
    List<String>? errors,
    DateTime? nextReviewDate,
    @Default({}) Map<String, dynamic> details,
  }) = _KYCVerificationResult;
  
  factory KYCVerificationResult.fromJson(Map<String, dynamic> json) => _$KYCVerificationResultFromJson(json);
}

/// KYC requirements
@freezed
class KYCRequirements with _$KYCRequirements {
  const factory KYCRequirements({
    required KYCLevel level,
    required List<DocumentType> requiredDocuments,
    required List<KYCStep> requiredSteps,
    bool? requiresBiometric,
    bool? requiresAddressVerification,
    bool? requiresIncomeVerification,
    @Default({}) Map<String, String> additionalRequirements,
  }) = _KYCRequirements;
  
  factory KYCRequirements.fromJson(Map<String, dynamic> json) => _$KYCRequirementsFromJson(json);
}

/// KYC verification step
@freezed
class KYCVerificationStep with _$KYCVerificationStep {
  const factory KYCVerificationStep({
    required String id,
    required String stepId,
    required String name,
    required KYCStepType type,
    required KYCStepStatus status,
    required String title,
    required String description,
    DateTime? completedAt,
    String? errorMessage,
    @Default({}) Map<String, dynamic> data,
    @Default({}) Map<String, dynamic> metadata,
  }) = _KYCVerificationStep;
  
  factory KYCVerificationStep.fromJson(Map<String, dynamic> json) => _$KYCVerificationStepFromJson(json);
}

/// Risk assessment
@freezed
class RiskAssessment with _$RiskAssessment {
  const factory RiskAssessment({
    required RiskLevel riskLevel,
    required double riskScore,
    required DateTime assessedAt,
    required String assessedBy,
    required List<RiskFactor> riskFactors,
    String? notes,
    DateTime? nextReviewDate,
  }) = _RiskAssessment;
  
  factory RiskAssessment.fromJson(Map<String, dynamic> json) => _$RiskAssessmentFromJson(json);
}

/// Risk factor
@freezed
class RiskFactor with _$RiskFactor {
  const factory RiskFactor({
    required String factor,
    required RiskLevel level,
    required double weight,
    required String description,
  }) = _RiskFactor;
  
  factory RiskFactor.fromJson(Map<String, dynamic> json) => _$RiskFactorFromJson(json);
}

/// Risk level enumeration
enum RiskLevel {
  low,
  medium,
  high,
}

/// Financial information
@freezed
class FinancialInfo with _$FinancialInfo {
  const factory FinancialInfo({
    required IncomeRange annualIncome,
    required WealthSource sourceOfWealth,
    String? employerName,
    String? occupation,
    double? netWorth,
    @Default({}) Map<String, dynamic> additionalInfo,
  }) = _FinancialInfo;
  
  factory FinancialInfo.fromJson(Map<String, dynamic> json) => _$FinancialInfoFromJson(json);
}

/// Income range enumeration
enum IncomeRange {
  under25k,
  from25kTo50k,
  from50kTo100k,
  from100kTo250k,
  from250kTo500k,
  over500k,
}

/// Wealth source enumeration
enum WealthSource {
  employment,
  business,
  investments,
  inheritance,
  realEstate,
  other,
}

/// Business information
@freezed
class BusinessInfo with _$BusinessInfo {
  const factory BusinessInfo({
    required String legalName,
    required String registrationNumber,
    required String taxId,
    required BusinessType businessType,
    DateTime? incorporationDate,
    String? website,
    String? description,
    @Default({}) Map<String, dynamic> additionalInfo,
  }) = _BusinessInfo;
  
  factory BusinessInfo.fromJson(Map<String, dynamic> json) => _$BusinessInfoFromJson(json);
}

/// Business type enumeration
enum BusinessType {
  corporation,
  llc,
  partnership,
  soleProprietorship,
  nonprofit,
  government,
}

/// Identity document type enumeration
enum IdentityDocumentType {
  passport,
  nationalId,
  driversLicense,
  residencePermit,
}

/// Proof of address type enumeration
enum ProofOfAddressType {
  utilityBill,
  bankStatement,
  rentalAgreement,
  taxDocument,
  insuranceDocument,
}

/// Identity document entity
@freezed
class IdentityDocument with _$IdentityDocument {
  const factory IdentityDocument({
    required String id,
    required IdentityDocumentType type,
    required String documentNumber,
    required String issuingCountry,
    required DateTime expiryDate,
    String? frontImageUrl,
    String? backImageUrl,
    bool? isVerified,
    @Default({}) Map<String, dynamic> metadata,
  }) = _IdentityDocument;
  
  factory IdentityDocument.fromJson(Map<String, dynamic> json) => _$IdentityDocumentFromJson(json);
}

/// Proof of address entity
@freezed
class ProofOfAddress with _$ProofOfAddress {
  const factory ProofOfAddress({
    required String id,
    required ProofOfAddressType type,
    required String documentName,
    required DateTime documentDate,
    String? imageUrl,
    bool? isVerified,
    @Default({}) Map<String, dynamic> metadata,
  }) = _ProofOfAddress;
  
  factory ProofOfAddress.fromJson(Map<String, dynamic> json) => _$ProofOfAddressFromJson(json);
}