// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kyc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KYCDataImpl _$$KYCDataImplFromJson(Map<String, dynamic> json) =>
    _$KYCDataImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      status: $enumDecode(_$KYCStatusEnumMap, json['status']),
      level: $enumDecode(_$KYCLevelEnumMap, json['level']),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      submittedAt: json['submittedAt'] == null
          ? null
          : DateTime.parse(json['submittedAt'] as String),
      reviewedAt: json['reviewedAt'] == null
          ? null
          : DateTime.parse(json['reviewedAt'] as String),
      approvedAt: json['approvedAt'] == null
          ? null
          : DateTime.parse(json['approvedAt'] as String),
      reviewNotes: json['reviewNotes'] as String?,
      rejectionReason: json['rejectionReason'] as String?,
      rejectionReasons: (json['rejectionReasons'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      personalInfo:
          PersonalInfo.fromJson(json['personalInfo'] as Map<String, dynamic>),
      addressInfo:
          AddressInfo.fromJson(json['addressInfo'] as Map<String, dynamic>),
      documents: (json['documents'] as List<dynamic>)
          .map((e) => KYCDocument.fromJson(e as Map<String, dynamic>))
          .toList(),
      verificationSteps: (json['verificationSteps'] as List<dynamic>?)
              ?.map((e) =>
                  KYCVerificationStep.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      financialInfo: json['financialInfo'] == null
          ? null
          : FinancialInfo.fromJson(
              json['financialInfo'] as Map<String, dynamic>),
      businessInfo: json['businessInfo'] == null
          ? null
          : BusinessInfo.fromJson(json['businessInfo'] as Map<String, dynamic>),
      riskAssessment: json['riskAssessment'] == null
          ? null
          : RiskAssessment.fromJson(
              json['riskAssessment'] as Map<String, dynamic>),
      biometricData: json['biometricData'] == null
          ? null
          : BiometricData.fromJson(
              json['biometricData'] as Map<String, dynamic>),
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$KYCDataImplToJson(_$KYCDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'status': _$KYCStatusEnumMap[instance.status]!,
      'level': _$KYCLevelEnumMap[instance.level]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'submittedAt': instance.submittedAt?.toIso8601String(),
      'reviewedAt': instance.reviewedAt?.toIso8601String(),
      'approvedAt': instance.approvedAt?.toIso8601String(),
      'reviewNotes': instance.reviewNotes,
      'rejectionReason': instance.rejectionReason,
      'rejectionReasons': instance.rejectionReasons,
      'personalInfo': instance.personalInfo,
      'addressInfo': instance.addressInfo,
      'documents': instance.documents,
      'verificationSteps': instance.verificationSteps,
      'financialInfo': instance.financialInfo,
      'businessInfo': instance.businessInfo,
      'riskAssessment': instance.riskAssessment,
      'biometricData': instance.biometricData,
      'metadata': instance.metadata,
    };

const _$KYCStatusEnumMap = {
  KYCStatus.notStarted: 'notStarted',
  KYCStatus.pending: 'pending',
  KYCStatus.inReview: 'inReview',
  KYCStatus.approved: 'approved',
  KYCStatus.verified: 'verified',
  KYCStatus.rejected: 'rejected',
  KYCStatus.expired: 'expired',
  KYCStatus.needsUpdate: 'needsUpdate',
};

const _$KYCLevelEnumMap = {
  KYCLevel.basic: 'basic',
  KYCLevel.enhanced: 'enhanced',
  KYCLevel.intermediate: 'intermediate',
  KYCLevel.advanced: 'advanced',
  KYCLevel.institutional: 'institutional',
};

_$PersonalInfoImpl _$$PersonalInfoImplFromJson(Map<String, dynamic> json) =>
    _$PersonalInfoImpl(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      middleName: json['middleName'] as String?,
      dateOfBirth: DateTime.parse(json['dateOfBirth'] as String),
      nationality: json['nationality'] as String,
      countryOfResidence: json['countryOfResidence'] as String?,
      placeOfBirth: json['placeOfBirth'] as String?,
      phoneNumber: json['phoneNumber'] as String,
      email: json['email'] as String,
      occupation: json['occupation'] as String?,
      employerName: json['employerName'] as String?,
      annualIncome: (json['annualIncome'] as num?)?.toDouble(),
      sourceOfFunds: json['sourceOfFunds'] as String?,
    );

Map<String, dynamic> _$$PersonalInfoImplToJson(_$PersonalInfoImpl instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'middleName': instance.middleName,
      'dateOfBirth': instance.dateOfBirth.toIso8601String(),
      'nationality': instance.nationality,
      'countryOfResidence': instance.countryOfResidence,
      'placeOfBirth': instance.placeOfBirth,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'occupation': instance.occupation,
      'employerName': instance.employerName,
      'annualIncome': instance.annualIncome,
      'sourceOfFunds': instance.sourceOfFunds,
    };

_$AddressInfoImpl _$$AddressInfoImplFromJson(Map<String, dynamic> json) =>
    _$AddressInfoImpl(
      street: json['street'] as String,
      apartment: json['apartment'] as String?,
      city: json['city'] as String,
      state: json['state'] as String,
      postalCode: json['postalCode'] as String,
      country: json['country'] as String,
      isPrimary: json['isPrimary'] as bool?,
      residenceSince: json['residenceSince'] == null
          ? null
          : DateTime.parse(json['residenceSince'] as String),
    );

Map<String, dynamic> _$$AddressInfoImplToJson(_$AddressInfoImpl instance) =>
    <String, dynamic>{
      'street': instance.street,
      'apartment': instance.apartment,
      'city': instance.city,
      'state': instance.state,
      'postalCode': instance.postalCode,
      'country': instance.country,
      'isPrimary': instance.isPrimary,
      'residenceSince': instance.residenceSince?.toIso8601String(),
    };

_$KYCDocumentImpl _$$KYCDocumentImplFromJson(Map<String, dynamic> json) =>
    _$KYCDocumentImpl(
      id: json['id'] as String,
      type: $enumDecode(_$DocumentTypeEnumMap, json['type']),
      fileName: json['fileName'] as String,
      filePath: json['filePath'] as String,
      fileUrl: json['fileUrl'] as String?,
      uploadedAt: DateTime.parse(json['uploadedAt'] as String),
      isVerified: json['isVerified'] as bool?,
      verificationNotes: json['verificationNotes'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$KYCDocumentImplToJson(_$KYCDocumentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$DocumentTypeEnumMap[instance.type]!,
      'fileName': instance.fileName,
      'filePath': instance.filePath,
      'fileUrl': instance.fileUrl,
      'uploadedAt': instance.uploadedAt.toIso8601String(),
      'isVerified': instance.isVerified,
      'verificationNotes': instance.verificationNotes,
      'metadata': instance.metadata,
    };

const _$DocumentTypeEnumMap = {
  DocumentType.passport: 'passport',
  DocumentType.driverLicense: 'driverLicense',
  DocumentType.nationalId: 'nationalId',
  DocumentType.utilityBill: 'utilityBill',
  DocumentType.bankStatement: 'bankStatement',
  DocumentType.taxDocument: 'taxDocument',
  DocumentType.identityFront: 'identityFront',
  DocumentType.identityBack: 'identityBack',
  DocumentType.proofOfAddress: 'proofOfAddress',
  DocumentType.selfie: 'selfie',
  DocumentType.businessRegistration: 'businessRegistration',
  DocumentType.authorizationLetter: 'authorizationLetter',
};

_$BiometricDataImpl _$$BiometricDataImplFromJson(Map<String, dynamic> json) =>
    _$BiometricDataImpl(
      faceImagePath: json['faceImagePath'] as String?,
      voiceSamplePath: json['voiceSamplePath'] as String?,
      capturedAt: json['capturedAt'] == null
          ? null
          : DateTime.parse(json['capturedAt'] as String),
      isLive: json['isLive'] as bool?,
      confidenceScore: (json['confidenceScore'] as num?)?.toDouble(),
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$BiometricDataImplToJson(_$BiometricDataImpl instance) =>
    <String, dynamic>{
      'faceImagePath': instance.faceImagePath,
      'voiceSamplePath': instance.voiceSamplePath,
      'capturedAt': instance.capturedAt?.toIso8601String(),
      'isLive': instance.isLive,
      'confidenceScore': instance.confidenceScore,
      'metadata': instance.metadata,
    };

_$KYCVerificationResultImpl _$$KYCVerificationResultImplFromJson(
        Map<String, dynamic> json) =>
    _$KYCVerificationResultImpl(
      kycId: json['kycId'] as String,
      status: $enumDecode(_$KYCStatusEnumMap, json['status']),
      level: $enumDecode(_$KYCLevelEnumMap, json['level']),
      message: json['message'] as String?,
      errors:
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      nextReviewDate: json['nextReviewDate'] == null
          ? null
          : DateTime.parse(json['nextReviewDate'] as String),
      details: json['details'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$KYCVerificationResultImplToJson(
        _$KYCVerificationResultImpl instance) =>
    <String, dynamic>{
      'kycId': instance.kycId,
      'status': _$KYCStatusEnumMap[instance.status]!,
      'level': _$KYCLevelEnumMap[instance.level]!,
      'message': instance.message,
      'errors': instance.errors,
      'nextReviewDate': instance.nextReviewDate?.toIso8601String(),
      'details': instance.details,
    };

_$KYCRequirementsImpl _$$KYCRequirementsImplFromJson(
        Map<String, dynamic> json) =>
    _$KYCRequirementsImpl(
      level: $enumDecode(_$KYCLevelEnumMap, json['level']),
      requiredDocuments: (json['requiredDocuments'] as List<dynamic>)
          .map((e) => $enumDecode(_$DocumentTypeEnumMap, e))
          .toList(),
      requiredSteps: (json['requiredSteps'] as List<dynamic>)
          .map((e) => $enumDecode(_$KYCStepEnumMap, e))
          .toList(),
      requiresBiometric: json['requiresBiometric'] as bool?,
      requiresAddressVerification: json['requiresAddressVerification'] as bool?,
      requiresIncomeVerification: json['requiresIncomeVerification'] as bool?,
      additionalRequirements:
          (json['additionalRequirements'] as Map<String, dynamic>?)?.map(
                (k, e) => MapEntry(k, e as String),
              ) ??
              const {},
    );

Map<String, dynamic> _$$KYCRequirementsImplToJson(
        _$KYCRequirementsImpl instance) =>
    <String, dynamic>{
      'level': _$KYCLevelEnumMap[instance.level]!,
      'requiredDocuments': instance.requiredDocuments
          .map((e) => _$DocumentTypeEnumMap[e]!)
          .toList(),
      'requiredSteps':
          instance.requiredSteps.map((e) => _$KYCStepEnumMap[e]!).toList(),
      'requiresBiometric': instance.requiresBiometric,
      'requiresAddressVerification': instance.requiresAddressVerification,
      'requiresIncomeVerification': instance.requiresIncomeVerification,
      'additionalRequirements': instance.additionalRequirements,
    };

const _$KYCStepEnumMap = {
  KYCStep.personalInfo: 'personalInfo',
  KYCStep.addressInfo: 'addressInfo',
  KYCStep.identityVerification: 'identityVerification',
  KYCStep.documentUpload: 'documentUpload',
  KYCStep.biometricVerification: 'biometricVerification',
  KYCStep.review: 'review',
};

_$KYCVerificationStepImpl _$$KYCVerificationStepImplFromJson(
        Map<String, dynamic> json) =>
    _$KYCVerificationStepImpl(
      id: json['id'] as String,
      stepId: json['stepId'] as String,
      name: json['name'] as String,
      type: $enumDecode(_$KYCStepTypeEnumMap, json['type']),
      status: $enumDecode(_$KYCStepStatusEnumMap, json['status']),
      title: json['title'] as String,
      description: json['description'] as String,
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
      errorMessage: json['errorMessage'] as String?,
      data: json['data'] as Map<String, dynamic>? ?? const {},
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$KYCVerificationStepImplToJson(
        _$KYCVerificationStepImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'stepId': instance.stepId,
      'name': instance.name,
      'type': _$KYCStepTypeEnumMap[instance.type]!,
      'status': _$KYCStepStatusEnumMap[instance.status]!,
      'title': instance.title,
      'description': instance.description,
      'completedAt': instance.completedAt?.toIso8601String(),
      'errorMessage': instance.errorMessage,
      'data': instance.data,
      'metadata': instance.metadata,
    };

const _$KYCStepTypeEnumMap = {
  KYCStepType.personalInformation: 'personalInformation',
  KYCStepType.addressVerification: 'addressVerification',
  KYCStepType.identityVerification: 'identityVerification',
  KYCStepType.documentUpload: 'documentUpload',
  KYCStepType.documentVerification: 'documentVerification',
  KYCStepType.biometricVerification: 'biometricVerification',
  KYCStepType.businessVerification: 'businessVerification',
  KYCStepType.financialVerification: 'financialVerification',
  KYCStepType.riskAssessment: 'riskAssessment',
  KYCStepType.manualReview: 'manualReview',
};

const _$KYCStepStatusEnumMap = {
  KYCStepStatus.notStarted: 'notStarted',
  KYCStepStatus.inProgress: 'inProgress',
  KYCStepStatus.completed: 'completed',
  KYCStepStatus.failed: 'failed',
  KYCStepStatus.pending: 'pending',
  KYCStepStatus.skipped: 'skipped',
};

_$RiskAssessmentImpl _$$RiskAssessmentImplFromJson(Map<String, dynamic> json) =>
    _$RiskAssessmentImpl(
      riskLevel: $enumDecode(_$RiskLevelEnumMap, json['riskLevel']),
      riskScore: (json['riskScore'] as num).toDouble(),
      assessedAt: DateTime.parse(json['assessedAt'] as String),
      assessedBy: json['assessedBy'] as String,
      riskFactors: (json['riskFactors'] as List<dynamic>)
          .map((e) => RiskFactor.fromJson(e as Map<String, dynamic>))
          .toList(),
      notes: json['notes'] as String?,
      nextReviewDate: json['nextReviewDate'] == null
          ? null
          : DateTime.parse(json['nextReviewDate'] as String),
    );

Map<String, dynamic> _$$RiskAssessmentImplToJson(
        _$RiskAssessmentImpl instance) =>
    <String, dynamic>{
      'riskLevel': _$RiskLevelEnumMap[instance.riskLevel]!,
      'riskScore': instance.riskScore,
      'assessedAt': instance.assessedAt.toIso8601String(),
      'assessedBy': instance.assessedBy,
      'riskFactors': instance.riskFactors,
      'notes': instance.notes,
      'nextReviewDate': instance.nextReviewDate?.toIso8601String(),
    };

const _$RiskLevelEnumMap = {
  RiskLevel.low: 'low',
  RiskLevel.medium: 'medium',
  RiskLevel.high: 'high',
};

_$RiskFactorImpl _$$RiskFactorImplFromJson(Map<String, dynamic> json) =>
    _$RiskFactorImpl(
      factor: json['factor'] as String,
      level: $enumDecode(_$RiskLevelEnumMap, json['level']),
      weight: (json['weight'] as num).toDouble(),
      description: json['description'] as String,
    );

Map<String, dynamic> _$$RiskFactorImplToJson(_$RiskFactorImpl instance) =>
    <String, dynamic>{
      'factor': instance.factor,
      'level': _$RiskLevelEnumMap[instance.level]!,
      'weight': instance.weight,
      'description': instance.description,
    };

_$FinancialInfoImpl _$$FinancialInfoImplFromJson(Map<String, dynamic> json) =>
    _$FinancialInfoImpl(
      annualIncome: $enumDecode(_$IncomeRangeEnumMap, json['annualIncome']),
      sourceOfWealth:
          $enumDecode(_$WealthSourceEnumMap, json['sourceOfWealth']),
      employerName: json['employerName'] as String?,
      occupation: json['occupation'] as String?,
      netWorth: (json['netWorth'] as num?)?.toDouble(),
      additionalInfo:
          json['additionalInfo'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$FinancialInfoImplToJson(_$FinancialInfoImpl instance) =>
    <String, dynamic>{
      'annualIncome': _$IncomeRangeEnumMap[instance.annualIncome]!,
      'sourceOfWealth': _$WealthSourceEnumMap[instance.sourceOfWealth]!,
      'employerName': instance.employerName,
      'occupation': instance.occupation,
      'netWorth': instance.netWorth,
      'additionalInfo': instance.additionalInfo,
    };

const _$IncomeRangeEnumMap = {
  IncomeRange.under25k: 'under25k',
  IncomeRange.from25kTo50k: 'from25kTo50k',
  IncomeRange.from50kTo100k: 'from50kTo100k',
  IncomeRange.from100kTo250k: 'from100kTo250k',
  IncomeRange.from250kTo500k: 'from250kTo500k',
  IncomeRange.over500k: 'over500k',
};

const _$WealthSourceEnumMap = {
  WealthSource.employment: 'employment',
  WealthSource.business: 'business',
  WealthSource.investments: 'investments',
  WealthSource.inheritance: 'inheritance',
  WealthSource.realEstate: 'realEstate',
  WealthSource.other: 'other',
};

_$BusinessInfoImpl _$$BusinessInfoImplFromJson(Map<String, dynamic> json) =>
    _$BusinessInfoImpl(
      legalName: json['legalName'] as String,
      registrationNumber: json['registrationNumber'] as String,
      taxId: json['taxId'] as String,
      businessType: $enumDecode(_$BusinessTypeEnumMap, json['businessType']),
      incorporationDate: json['incorporationDate'] == null
          ? null
          : DateTime.parse(json['incorporationDate'] as String),
      website: json['website'] as String?,
      description: json['description'] as String?,
      additionalInfo:
          json['additionalInfo'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$BusinessInfoImplToJson(_$BusinessInfoImpl instance) =>
    <String, dynamic>{
      'legalName': instance.legalName,
      'registrationNumber': instance.registrationNumber,
      'taxId': instance.taxId,
      'businessType': _$BusinessTypeEnumMap[instance.businessType]!,
      'incorporationDate': instance.incorporationDate?.toIso8601String(),
      'website': instance.website,
      'description': instance.description,
      'additionalInfo': instance.additionalInfo,
    };

const _$BusinessTypeEnumMap = {
  BusinessType.corporation: 'corporation',
  BusinessType.llc: 'llc',
  BusinessType.partnership: 'partnership',
  BusinessType.soleProprietorship: 'soleProprietorship',
  BusinessType.nonprofit: 'nonprofit',
  BusinessType.government: 'government',
};

_$IdentityDocumentImpl _$$IdentityDocumentImplFromJson(
        Map<String, dynamic> json) =>
    _$IdentityDocumentImpl(
      id: json['id'] as String,
      type: $enumDecode(_$IdentityDocumentTypeEnumMap, json['type']),
      documentNumber: json['documentNumber'] as String,
      issuingCountry: json['issuingCountry'] as String,
      expiryDate: DateTime.parse(json['expiryDate'] as String),
      frontImageUrl: json['frontImageUrl'] as String?,
      backImageUrl: json['backImageUrl'] as String?,
      isVerified: json['isVerified'] as bool?,
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$IdentityDocumentImplToJson(
        _$IdentityDocumentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$IdentityDocumentTypeEnumMap[instance.type]!,
      'documentNumber': instance.documentNumber,
      'issuingCountry': instance.issuingCountry,
      'expiryDate': instance.expiryDate.toIso8601String(),
      'frontImageUrl': instance.frontImageUrl,
      'backImageUrl': instance.backImageUrl,
      'isVerified': instance.isVerified,
      'metadata': instance.metadata,
    };

const _$IdentityDocumentTypeEnumMap = {
  IdentityDocumentType.passport: 'passport',
  IdentityDocumentType.nationalId: 'nationalId',
  IdentityDocumentType.driversLicense: 'driversLicense',
  IdentityDocumentType.residencePermit: 'residencePermit',
};

_$ProofOfAddressImpl _$$ProofOfAddressImplFromJson(Map<String, dynamic> json) =>
    _$ProofOfAddressImpl(
      id: json['id'] as String,
      type: $enumDecode(_$ProofOfAddressTypeEnumMap, json['type']),
      documentName: json['documentName'] as String,
      documentDate: DateTime.parse(json['documentDate'] as String),
      imageUrl: json['imageUrl'] as String?,
      isVerified: json['isVerified'] as bool?,
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$ProofOfAddressImplToJson(
        _$ProofOfAddressImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$ProofOfAddressTypeEnumMap[instance.type]!,
      'documentName': instance.documentName,
      'documentDate': instance.documentDate.toIso8601String(),
      'imageUrl': instance.imageUrl,
      'isVerified': instance.isVerified,
      'metadata': instance.metadata,
    };

const _$ProofOfAddressTypeEnumMap = {
  ProofOfAddressType.utilityBill: 'utilityBill',
  ProofOfAddressType.bankStatement: 'bankStatement',
  ProofOfAddressType.rentalAgreement: 'rentalAgreement',
  ProofOfAddressType.taxDocument: 'taxDocument',
  ProofOfAddressType.insuranceDocument: 'insuranceDocument',
};
