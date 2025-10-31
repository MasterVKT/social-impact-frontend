// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileImpl _$$UserProfileImplFromJson(Map<String, dynamic> json) =>
    _$UserProfileImpl(
      id: json['id'] as String,
      email: json['email'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      role: $enumDecode(_$UserRoleEnumMap, json['role']),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      status: $enumDecodeNullable(_$UserStatusEnumMap, json['status']) ??
          UserStatus.active,
      profileImageUrl: json['profileImageUrl'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      bio: json['bio'] as String?,
      title: json['title'] as String?,
      company: json['company'] as String?,
      location: json['location'] as String?,
      website: json['website'] as String?,
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
      languages: (json['languages'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      socialLinks: json['socialLinks'] as Map<String, dynamic>? ?? const {},
      preferences: json['preferences'] as Map<String, dynamic>? ?? const {},
      interests: (json['interests'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      skills: (json['skills'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      timezone: json['timezone'] as String?,
      currency: json['currency'] as String?,
      isVerified: json['isVerified'] as bool?,
      lastLoginAt: json['lastLoginAt'] == null
          ? null
          : DateTime.parse(json['lastLoginAt'] as String),
      loginCount: (json['loginCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$UserProfileImplToJson(_$UserProfileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'role': _$UserRoleEnumMap[instance.role]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'status': _$UserStatusEnumMap[instance.status]!,
      'profileImageUrl': instance.profileImageUrl,
      'phoneNumber': instance.phoneNumber,
      'bio': instance.bio,
      'title': instance.title,
      'company': instance.company,
      'location': instance.location,
      'website': instance.website,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'languages': instance.languages,
      'socialLinks': instance.socialLinks,
      'preferences': instance.preferences,
      'interests': instance.interests,
      'skills': instance.skills,
      'timezone': instance.timezone,
      'currency': instance.currency,
      'isVerified': instance.isVerified,
      'lastLoginAt': instance.lastLoginAt?.toIso8601String(),
      'loginCount': instance.loginCount,
    };

const _$UserRoleEnumMap = {
  UserRole.investor: 'investor',
  UserRole.organizationAdmin: 'organizationAdmin',
  UserRole.projectManager: 'projectManager',
  UserRole.analyst: 'analyst',
  UserRole.auditor: 'auditor',
  UserRole.support: 'support',
  UserRole.systemAdmin: 'systemAdmin',
};

const _$UserStatusEnumMap = {
  UserStatus.active: 'active',
  UserStatus.inactive: 'inactive',
  UserStatus.suspended: 'suspended',
  UserStatus.pendingVerification: 'pendingVerification',
};

_$UserPreferencesImpl _$$UserPreferencesImplFromJson(
        Map<String, dynamic> json) =>
    _$UserPreferencesImpl(
      userId: json['userId'] as String,
      notificationPreferences:
          json['notificationPreferences'] as Map<String, dynamic>? ?? const {},
      displayPreferences:
          json['displayPreferences'] as Map<String, dynamic>? ?? const {},
      privacySettings:
          json['privacySettings'] as Map<String, dynamic>? ?? const {},
      dashboardSettings:
          json['dashboardSettings'] as Map<String, dynamic>? ?? const {},
      language: json['language'] as String? ?? 'en',
      theme: json['theme'] as String? ?? 'light',
      currency: json['currency'] as String? ?? 'USD',
      timezone: json['timezone'] as String? ?? 'UTC',
      emailNotifications: json['emailNotifications'] as bool? ?? true,
      pushNotifications: json['pushNotifications'] as bool? ?? true,
      marketingEmails: json['marketingEmails'] as bool? ?? false,
      profileVisibility: json['profileVisibility'] as bool? ?? true,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$UserPreferencesImplToJson(
        _$UserPreferencesImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'notificationPreferences': instance.notificationPreferences,
      'displayPreferences': instance.displayPreferences,
      'privacySettings': instance.privacySettings,
      'dashboardSettings': instance.dashboardSettings,
      'language': instance.language,
      'theme': instance.theme,
      'currency': instance.currency,
      'timezone': instance.timezone,
      'emailNotifications': instance.emailNotifications,
      'pushNotifications': instance.pushNotifications,
      'marketingEmails': instance.marketingEmails,
      'profileVisibility': instance.profileVisibility,
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$UserActivityImpl _$$UserActivityImplFromJson(Map<String, dynamic> json) =>
    _$UserActivityImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      type: $enumDecode(_$ActivityTypeEnumMap, json['type']),
      description: json['description'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      resourceId: json['resourceId'] as String?,
      resourceType: json['resourceType'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
      ipAddress: json['ipAddress'] as String?,
      userAgent: json['userAgent'] as String?,
      location: json['location'] as String?,
    );

Map<String, dynamic> _$$UserActivityImplToJson(_$UserActivityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'type': _$ActivityTypeEnumMap[instance.type]!,
      'description': instance.description,
      'timestamp': instance.timestamp.toIso8601String(),
      'resourceId': instance.resourceId,
      'resourceType': instance.resourceType,
      'metadata': instance.metadata,
      'ipAddress': instance.ipAddress,
      'userAgent': instance.userAgent,
      'location': instance.location,
    };

const _$ActivityTypeEnumMap = {
  ActivityType.login: 'login',
  ActivityType.logout: 'logout',
  ActivityType.profileUpdate: 'profileUpdate',
  ActivityType.passwordChange: 'passwordChange',
  ActivityType.emailChange: 'emailChange',
  ActivityType.settingsUpdate: 'settingsUpdate',
  ActivityType.investment: 'investment',
  ActivityType.projectView: 'projectView',
  ActivityType.reportGeneration: 'reportGeneration',
  ActivityType.search: 'search',
  ActivityType.dataExport: 'dataExport',
  ActivityType.fileUpload: 'fileUpload',
  ActivityType.systemAction: 'systemAction',
};

_$UserVerificationImpl _$$UserVerificationImplFromJson(
        Map<String, dynamic> json) =>
    _$UserVerificationImpl(
      userId: json['userId'] as String,
      emailVerified: json['emailVerified'] as bool? ?? false,
      phoneVerified: json['phoneVerified'] as bool? ?? false,
      identityVerified: json['identityVerified'] as bool? ?? false,
      kycCompleted: json['kycCompleted'] as bool? ?? false,
      amlCompleted: json['amlCompleted'] as bool? ?? false,
      emailVerifiedAt: json['emailVerifiedAt'] == null
          ? null
          : DateTime.parse(json['emailVerifiedAt'] as String),
      phoneVerifiedAt: json['phoneVerifiedAt'] == null
          ? null
          : DateTime.parse(json['phoneVerifiedAt'] as String),
      identityVerifiedAt: json['identityVerifiedAt'] == null
          ? null
          : DateTime.parse(json['identityVerifiedAt'] as String),
      kycCompletedAt: json['kycCompletedAt'] == null
          ? null
          : DateTime.parse(json['kycCompletedAt'] as String),
      amlCompletedAt: json['amlCompletedAt'] == null
          ? null
          : DateTime.parse(json['amlCompletedAt'] as String),
      documents: (json['documents'] as List<dynamic>?)
              ?.map((e) =>
                  VerificationDocument.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      verificationNotes: json['verificationNotes'] as String?,
      verifiedBy: json['verifiedBy'] as String?,
    );

Map<String, dynamic> _$$UserVerificationImplToJson(
        _$UserVerificationImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'emailVerified': instance.emailVerified,
      'phoneVerified': instance.phoneVerified,
      'identityVerified': instance.identityVerified,
      'kycCompleted': instance.kycCompleted,
      'amlCompleted': instance.amlCompleted,
      'emailVerifiedAt': instance.emailVerifiedAt?.toIso8601String(),
      'phoneVerifiedAt': instance.phoneVerifiedAt?.toIso8601String(),
      'identityVerifiedAt': instance.identityVerifiedAt?.toIso8601String(),
      'kycCompletedAt': instance.kycCompletedAt?.toIso8601String(),
      'amlCompletedAt': instance.amlCompletedAt?.toIso8601String(),
      'documents': instance.documents,
      'verificationNotes': instance.verificationNotes,
      'verifiedBy': instance.verifiedBy,
    };

_$VerificationDocumentImpl _$$VerificationDocumentImplFromJson(
        Map<String, dynamic> json) =>
    _$VerificationDocumentImpl(
      id: json['id'] as String,
      type: $enumDecode(_$DocumentTypeEnumMap, json['type']),
      fileName: json['fileName'] as String,
      fileUrl: json['fileUrl'] as String,
      status: $enumDecode(_$DocumentStatusEnumMap, json['status']),
      uploadedAt: DateTime.parse(json['uploadedAt'] as String),
      verifiedAt: json['verifiedAt'] == null
          ? null
          : DateTime.parse(json['verifiedAt'] as String),
      verifiedBy: json['verifiedBy'] as String?,
      rejectionReason: json['rejectionReason'] as String?,
      expiresAt: json['expiresAt'] == null
          ? null
          : DateTime.parse(json['expiresAt'] as String),
    );

Map<String, dynamic> _$$VerificationDocumentImplToJson(
        _$VerificationDocumentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$DocumentTypeEnumMap[instance.type]!,
      'fileName': instance.fileName,
      'fileUrl': instance.fileUrl,
      'status': _$DocumentStatusEnumMap[instance.status]!,
      'uploadedAt': instance.uploadedAt.toIso8601String(),
      'verifiedAt': instance.verifiedAt?.toIso8601String(),
      'verifiedBy': instance.verifiedBy,
      'rejectionReason': instance.rejectionReason,
      'expiresAt': instance.expiresAt?.toIso8601String(),
    };

const _$DocumentTypeEnumMap = {
  DocumentType.passport: 'passport',
  DocumentType.drivingLicense: 'drivingLicense',
  DocumentType.nationalId: 'nationalId',
  DocumentType.utilityBill: 'utilityBill',
  DocumentType.bankStatement: 'bankStatement',
  DocumentType.proofOfIncome: 'proofOfIncome',
  DocumentType.businessRegistration: 'businessRegistration',
  DocumentType.other: 'other',
};

const _$DocumentStatusEnumMap = {
  DocumentStatus.pending: 'pending',
  DocumentStatus.approved: 'approved',
  DocumentStatus.rejected: 'rejected',
  DocumentStatus.expired: 'expired',
};

_$UserSecurityImpl _$$UserSecurityImplFromJson(Map<String, dynamic> json) =>
    _$UserSecurityImpl(
      userId: json['userId'] as String,
      twoFactorEnabled: json['twoFactorEnabled'] as bool? ?? false,
      biometricEnabled: json['biometricEnabled'] as bool? ?? false,
      trustedDevices: (json['trustedDevices'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      activeSessions: (json['activeSessions'] as List<dynamic>?)
              ?.map((e) => SecuritySession.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      lastPasswordChange: json['lastPasswordChange'] == null
          ? null
          : DateTime.parse(json['lastPasswordChange'] as String),
      recentLogins: (json['recentLogins'] as List<dynamic>?)
              ?.map((e) => LoginAttempt.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      securityQuestions:
          json['securityQuestions'] as Map<String, dynamic>? ?? const {},
      recoveryEmail: json['recoveryEmail'] as String?,
      recoveryPhone: json['recoveryPhone'] as String?,
    );

Map<String, dynamic> _$$UserSecurityImplToJson(_$UserSecurityImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'twoFactorEnabled': instance.twoFactorEnabled,
      'biometricEnabled': instance.biometricEnabled,
      'trustedDevices': instance.trustedDevices,
      'activeSessions': instance.activeSessions,
      'lastPasswordChange': instance.lastPasswordChange?.toIso8601String(),
      'recentLogins': instance.recentLogins,
      'securityQuestions': instance.securityQuestions,
      'recoveryEmail': instance.recoveryEmail,
      'recoveryPhone': instance.recoveryPhone,
    };

_$SecuritySessionImpl _$$SecuritySessionImplFromJson(
        Map<String, dynamic> json) =>
    _$SecuritySessionImpl(
      id: json['id'] as String,
      deviceId: json['deviceId'] as String,
      deviceName: json['deviceName'] as String,
      ipAddress: json['ipAddress'] as String,
      location: json['location'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      lastActiveAt: json['lastActiveAt'] == null
          ? null
          : DateTime.parse(json['lastActiveAt'] as String),
      isActive: json['isActive'] as bool? ?? true,
      userAgent: json['userAgent'] as String?,
    );

Map<String, dynamic> _$$SecuritySessionImplToJson(
        _$SecuritySessionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'deviceId': instance.deviceId,
      'deviceName': instance.deviceName,
      'ipAddress': instance.ipAddress,
      'location': instance.location,
      'createdAt': instance.createdAt.toIso8601String(),
      'lastActiveAt': instance.lastActiveAt?.toIso8601String(),
      'isActive': instance.isActive,
      'userAgent': instance.userAgent,
    };

_$LoginAttemptImpl _$$LoginAttemptImplFromJson(Map<String, dynamic> json) =>
    _$LoginAttemptImpl(
      id: json['id'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      ipAddress: json['ipAddress'] as String,
      location: json['location'] as String,
      result: $enumDecode(_$LoginResultEnumMap, json['result']),
      deviceId: json['deviceId'] as String?,
      userAgent: json['userAgent'] as String?,
      failureReason: json['failureReason'] as String?,
    );

Map<String, dynamic> _$$LoginAttemptImplToJson(_$LoginAttemptImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'timestamp': instance.timestamp.toIso8601String(),
      'ipAddress': instance.ipAddress,
      'location': instance.location,
      'result': _$LoginResultEnumMap[instance.result]!,
      'deviceId': instance.deviceId,
      'userAgent': instance.userAgent,
      'failureReason': instance.failureReason,
    };

const _$LoginResultEnumMap = {
  LoginResult.success: 'success',
  LoginResult.invalidCredentials: 'invalidCredentials',
  LoginResult.accountLocked: 'accountLocked',
  LoginResult.twoFactorRequired: 'twoFactorRequired',
  LoginResult.blocked: 'blocked',
};

_$UserPortfolioSummaryImpl _$$UserPortfolioSummaryImplFromJson(
        Map<String, dynamic> json) =>
    _$UserPortfolioSummaryImpl(
      userId: json['userId'] as String,
      totalInvestment: (json['totalInvestment'] as num).toDouble(),
      currentValue: (json['currentValue'] as num).toDouble(),
      totalReturn: (json['totalReturn'] as num).toDouble(),
      returnPercentage: (json['returnPercentage'] as num).toDouble(),
      activeInvestments: (json['activeInvestments'] as num).toInt(),
      completedInvestments: (json['completedInvestments'] as num).toInt(),
      topInvestments: (json['topInvestments'] as List<dynamic>?)
              ?.map(
                  (e) => InvestmentSummary.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      investmentCategories: (json['investmentCategories'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      lastUpdated: json['lastUpdated'] == null
          ? null
          : DateTime.parse(json['lastUpdated'] as String),
    );

Map<String, dynamic> _$$UserPortfolioSummaryImplToJson(
        _$UserPortfolioSummaryImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'totalInvestment': instance.totalInvestment,
      'currentValue': instance.currentValue,
      'totalReturn': instance.totalReturn,
      'returnPercentage': instance.returnPercentage,
      'activeInvestments': instance.activeInvestments,
      'completedInvestments': instance.completedInvestments,
      'topInvestments': instance.topInvestments,
      'investmentCategories': instance.investmentCategories,
      'lastUpdated': instance.lastUpdated?.toIso8601String(),
    };

_$InvestmentSummaryImpl _$$InvestmentSummaryImplFromJson(
        Map<String, dynamic> json) =>
    _$InvestmentSummaryImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      amount: (json['amount'] as num).toDouble(),
      currentValue: (json['currentValue'] as num).toDouble(),
      returnPercentage: (json['returnPercentage'] as num).toDouble(),
      investmentDate: DateTime.parse(json['investmentDate'] as String),
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$$InvestmentSummaryImplToJson(
        _$InvestmentSummaryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'amount': instance.amount,
      'currentValue': instance.currentValue,
      'returnPercentage': instance.returnPercentage,
      'investmentDate': instance.investmentDate.toIso8601String(),
      'imageUrl': instance.imageUrl,
    };

_$UserAchievementImpl _$$UserAchievementImplFromJson(
        Map<String, dynamic> json) =>
    _$UserAchievementImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      type: $enumDecode(_$AchievementTypeEnumMap, json['type']),
      title: json['title'] as String,
      description: json['description'] as String,
      earnedAt: DateTime.parse(json['earnedAt'] as String),
      iconUrl: json['iconUrl'] as String?,
      badgeUrl: json['badgeUrl'] as String?,
      criteria: json['criteria'] as Map<String, dynamic>? ?? const {},
      points: (json['points'] as num?)?.toInt(),
      category: json['category'] as String?,
    );

Map<String, dynamic> _$$UserAchievementImplToJson(
        _$UserAchievementImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'type': _$AchievementTypeEnumMap[instance.type]!,
      'title': instance.title,
      'description': instance.description,
      'earnedAt': instance.earnedAt.toIso8601String(),
      'iconUrl': instance.iconUrl,
      'badgeUrl': instance.badgeUrl,
      'criteria': instance.criteria,
      'points': instance.points,
      'category': instance.category,
    };

const _$AchievementTypeEnumMap = {
  AchievementType.firstInvestment: 'firstInvestment',
  AchievementType.portfolioMilestone: 'portfolioMilestone',
  AchievementType.impactGoal: 'impactGoal',
  AchievementType.loyaltyBadge: 'loyaltyBadge',
  AchievementType.referralReward: 'referralReward',
  AchievementType.knowledgeBadge: 'knowledgeBadge',
  AchievementType.communityContribution: 'communityContribution',
};

_$UserNotificationSettingsImpl _$$UserNotificationSettingsImplFromJson(
        Map<String, dynamic> json) =>
    _$UserNotificationSettingsImpl(
      userId: json['userId'] as String,
      emailNotifications: json['emailNotifications'] as bool? ?? true,
      pushNotifications: json['pushNotifications'] as bool? ?? true,
      smsNotifications: json['smsNotifications'] as bool? ?? true,
      marketingEmails: json['marketingEmails'] as bool? ?? false,
      categoryPreferences:
          (json['categoryPreferences'] as Map<String, dynamic>?)?.map(
                (k, e) => MapEntry(k, e as bool),
              ) ??
              const {},
      channelPreferences:
          (json['channelPreferences'] as Map<String, dynamic>?)?.map(
                (k, e) => MapEntry(k, e as bool),
              ) ??
              const {},
      quietHoursStart: json['quietHoursStart'] as String? ?? '09:00',
      quietHoursEnd: json['quietHoursEnd'] as String? ?? '22:00',
      mutedTopics: (json['mutedTopics'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$UserNotificationSettingsImplToJson(
        _$UserNotificationSettingsImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'emailNotifications': instance.emailNotifications,
      'pushNotifications': instance.pushNotifications,
      'smsNotifications': instance.smsNotifications,
      'marketingEmails': instance.marketingEmails,
      'categoryPreferences': instance.categoryPreferences,
      'channelPreferences': instance.channelPreferences,
      'quietHoursStart': instance.quietHoursStart,
      'quietHoursEnd': instance.quietHoursEnd,
      'mutedTopics': instance.mutedTopics,
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$UserSubscriptionImpl _$$UserSubscriptionImplFromJson(
        Map<String, dynamic> json) =>
    _$UserSubscriptionImpl(
      userId: json['userId'] as String,
      plan: $enumDecode(_$SubscriptionPlanEnumMap, json['plan']),
      status: $enumDecode(_$SubscriptionStatusEnumMap, json['status']),
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      renewalDate: json['renewalDate'] == null
          ? null
          : DateTime.parse(json['renewalDate'] as String),
      features: (json['features'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      monthlyPrice: (json['monthlyPrice'] as num?)?.toDouble(),
      annualPrice: (json['annualPrice'] as num?)?.toDouble(),
      paymentMethodId: json['paymentMethodId'] as String?,
      lastPaymentDate: json['lastPaymentDate'] == null
          ? null
          : DateTime.parse(json['lastPaymentDate'] as String),
      nextPaymentDate: json['nextPaymentDate'] == null
          ? null
          : DateTime.parse(json['nextPaymentDate'] as String),
    );

Map<String, dynamic> _$$UserSubscriptionImplToJson(
        _$UserSubscriptionImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'plan': _$SubscriptionPlanEnumMap[instance.plan]!,
      'status': _$SubscriptionStatusEnumMap[instance.status]!,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'renewalDate': instance.renewalDate?.toIso8601String(),
      'features': instance.features,
      'monthlyPrice': instance.monthlyPrice,
      'annualPrice': instance.annualPrice,
      'paymentMethodId': instance.paymentMethodId,
      'lastPaymentDate': instance.lastPaymentDate?.toIso8601String(),
      'nextPaymentDate': instance.nextPaymentDate?.toIso8601String(),
    };

const _$SubscriptionPlanEnumMap = {
  SubscriptionPlan.free: 'free',
  SubscriptionPlan.basic: 'basic',
  SubscriptionPlan.premium: 'premium',
  SubscriptionPlan.enterprise: 'enterprise',
};

const _$SubscriptionStatusEnumMap = {
  SubscriptionStatus.active: 'active',
  SubscriptionStatus.inactive: 'inactive',
  SubscriptionStatus.cancelled: 'cancelled',
  SubscriptionStatus.suspended: 'suspended',
  SubscriptionStatus.expired: 'expired',
};
