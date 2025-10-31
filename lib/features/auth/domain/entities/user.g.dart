// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      uid: json['uid'] as String,
      email: json['email'] as String,
      displayName: json['displayName'] as String?,
      photoURL: json['photoURL'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      isEmailVerified: json['isEmailVerified'] as bool? ?? false,
      role: $enumDecodeNullable(_$UserRoleEnumMap, json['role']) ??
          UserRole.investor,
      status: $enumDecodeNullable(_$UserStatusEnumMap, json['status']) ??
          UserStatus.active,
      kycStatus: $enumDecodeNullable(_$KYCStatusEnumMap, json['kycStatus']) ??
          KYCStatus.pending,
      profile: json['profile'] == null
          ? null
          : UserProfile.fromJson(json['profile'] as Map<String, dynamic>),
      preferences: json['preferences'] == null
          ? null
          : UserPreferences.fromJson(
              json['preferences'] as Map<String, dynamic>),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      lastSignInAt: json['lastSignInAt'] == null
          ? null
          : DateTime.parse(json['lastSignInAt'] as String),
      linkedProviders: (json['linkedProviders'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$AuthProviderEnumMap, e))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'displayName': instance.displayName,
      'photoURL': instance.photoURL,
      'phoneNumber': instance.phoneNumber,
      'isEmailVerified': instance.isEmailVerified,
      'role': _$UserRoleEnumMap[instance.role]!,
      'status': _$UserStatusEnumMap[instance.status]!,
      'kycStatus': _$KYCStatusEnumMap[instance.kycStatus]!,
      'profile': instance.profile,
      'preferences': instance.preferences,
      'createdAt': instance.createdAt?.toIso8601String(),
      'lastSignInAt': instance.lastSignInAt?.toIso8601String(),
      'linkedProviders': instance.linkedProviders
          .map((e) => _$AuthProviderEnumMap[e]!)
          .toList(),
    };

const _$UserRoleEnumMap = {
  UserRole.investor: 'investor',
  UserRole.organization: 'organization',
  UserRole.auditor: 'auditor',
  UserRole.admin: 'admin',
};

const _$UserStatusEnumMap = {
  UserStatus.active: 'active',
  UserStatus.suspended: 'suspended',
  UserStatus.pending: 'pending',
  UserStatus.banned: 'banned',
};

const _$KYCStatusEnumMap = {
  KYCStatus.pending: 'pending',
  KYCStatus.inReview: 'in_review',
  KYCStatus.verified: 'verified',
  KYCStatus.rejected: 'rejected',
  KYCStatus.expired: 'expired',
};

const _$AuthProviderEnumMap = {
  AuthProvider.email: 'email',
  AuthProvider.google: 'google',
  AuthProvider.apple: 'apple',
  AuthProvider.facebook: 'facebook',
  AuthProvider.linkedin: 'linkedin',
};

_$UserProfileImpl _$$UserProfileImplFromJson(Map<String, dynamic> json) =>
    _$UserProfileImpl(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      bio: json['bio'] as String?,
      organization: json['organization'] as String?,
      jobTitle: json['jobTitle'] as String?,
      country: json['country'] as String?,
      city: json['city'] as String?,
      website: json['website'] as String?,
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
      interests: (json['interests'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      skills: (json['skills'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$UserProfileImplToJson(_$UserProfileImpl instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'bio': instance.bio,
      'organization': instance.organization,
      'jobTitle': instance.jobTitle,
      'country': instance.country,
      'city': instance.city,
      'website': instance.website,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'interests': instance.interests,
      'skills': instance.skills,
    };

_$UserPreferencesImpl _$$UserPreferencesImplFromJson(
        Map<String, dynamic> json) =>
    _$UserPreferencesImpl(
      emailNotifications: json['emailNotifications'] as bool? ?? true,
      pushNotifications: json['pushNotifications'] as bool? ?? true,
      marketingEmails: json['marketingEmails'] as bool? ?? false,
      language: json['language'] as String? ?? 'en',
      currency: json['currency'] as String? ?? 'USD',
      themeMode: $enumDecodeNullable(_$ThemeModeEnumMap, json['themeMode']) ??
          ThemeMode.system,
      biometricEnabled: json['biometricEnabled'] as bool? ?? false,
      rememberMe: json['rememberMe'] as bool? ?? true,
    );

Map<String, dynamic> _$$UserPreferencesImplToJson(
        _$UserPreferencesImpl instance) =>
    <String, dynamic>{
      'emailNotifications': instance.emailNotifications,
      'pushNotifications': instance.pushNotifications,
      'marketingEmails': instance.marketingEmails,
      'language': instance.language,
      'currency': instance.currency,
      'themeMode': _$ThemeModeEnumMap[instance.themeMode]!,
      'biometricEnabled': instance.biometricEnabled,
      'rememberMe': instance.rememberMe,
    };

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};
