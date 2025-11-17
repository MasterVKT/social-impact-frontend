// lib/features/user_profile/data/mappers/user_profile_mappers.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import '../../../user_profile/domain/entities/user_profile.dart';

DateTime? _toDateTime(dynamic value) {
  if (value == null) return null;
  if (value is Timestamp) return value.toDate();
  if (value is DateTime) return value;
  if (value is int) return DateTime.fromMillisecondsSinceEpoch(value);
  return null;
}

T? _safeEnum<T>(List<T> values, String? name, T? fallback) {
  if (name == null) return fallback;
  try {
    return values.firstWhere((e) => describeEnum(e as dynamic) == name);
  } catch (_) {
    return fallback;
  }
}

String? _string(dynamic v) => v?.toString();
int? _int(dynamic v) {
  if (v == null) return null;
  if (v is int) return v;
  if (v is num) return v.toInt();
  return int.tryParse(v.toString());
}

double? _double(dynamic v) {
  if (v == null) return null;
  if (v is double) return v;
  if (v is num) return v.toDouble();
  return double.tryParse(v.toString());
}

List<String> _stringList(dynamic v) {
  if (v is List) {
    return v.map((e) => e?.toString() ?? '').where((e) => e.isNotEmpty).toList();
  }
  return const [];
}

Map<String, dynamic> _map(dynamic v) {
  if (v is Map<String, dynamic>) return v;
  if (v is Map) return v.map((k, val) => MapEntry(k.toString(), val));
  return {};
}

// UserProfile mappers
extension UserProfileFirestore on UserProfile {
  static UserProfile fromFirestore(String id, Map<String, dynamic> data) {
    final role = _safeEnum(UserRole.values, data['role']?.toString(), UserRole.investor) ?? UserRole.investor;
    final status = _safeEnum(UserStatus.values, data['status']?.toString(), UserStatus.active) ?? UserStatus.active;
    return UserProfile(
      id: id,
      email: _string(data['email']) ?? '',
      firstName: _string(data['firstName']) ?? '',
      lastName: _string(data['lastName']) ?? '',
      role: role,
      createdAt: _toDateTime(data['createdAt']) ?? DateTime.fromMillisecondsSinceEpoch(0),
      updatedAt: _toDateTime(data['updatedAt']) ?? _toDateTime(data['createdAt']) ?? DateTime.fromMillisecondsSinceEpoch(0),
      status: status,
      profileImageUrl: _string(data['photoURL']) ?? _string(data['profileImageUrl']),
      phoneNumber: _string(data['phoneNumber']),
      bio: _string(data['bio']),
      title: _string(data['title']),
      company: _string(data['company']),
      location: _string(data['location']),
      website: _string(data['website']),
      dateOfBirth: _toDateTime(data['dateOfBirth']),
      languages: _stringList(data['languages']),
      socialLinks: _map(data['socialLinks']),
      preferences: _map(data['preferences']),
      interests: _stringList(data['interests']),
      skills: _stringList(data['skills']),
      timezone: _string(data['timezone']),
      currency: _string(data['currency']),
      isVerified: data['isVerified'] == null ? null : (data['isVerified'] == true),
      lastLoginAt: _toDateTime(data['lastLoginAt']),
      loginCount: _int(data['loginCount']),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'role': describeEnum(role),
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
      'status': describeEnum(status),
      if (profileImageUrl != null) 'photoURL': profileImageUrl,
      if (phoneNumber != null) 'phoneNumber': phoneNumber,
      if (bio != null) 'bio': bio,
      if (title != null) 'title': title,
      if (company != null) 'company': company,
      if (location != null) 'location': location,
      if (website != null) 'website': website,
      if (dateOfBirth != null) 'dateOfBirth': Timestamp.fromDate(dateOfBirth!),
      if (languages.isNotEmpty) 'languages': languages,
      if (socialLinks.isNotEmpty) 'socialLinks': socialLinks,
      if (preferences.isNotEmpty) 'preferences': preferences,
      if (interests.isNotEmpty) 'interests': interests,
      if (skills.isNotEmpty) 'skills': skills,
      if (timezone != null) 'timezone': timezone,
      if (currency != null) 'currency': currency,
      if (isVerified != null) 'isVerified': isVerified,
      if (lastLoginAt != null) 'lastLoginAt': Timestamp.fromDate(lastLoginAt!),
      if (loginCount != null) 'loginCount': loginCount,
    };
  }
}

// UserPreferences mappers
extension UserPreferencesFirestore on UserPreferences {
  static UserPreferences fromFirestore(String userId, Map<String, dynamic> data) {
    return UserPreferences(
      userId: userId,
      notificationPreferences: _map(data['notificationPreferences']),
      displayPreferences: _map(data['displayPreferences']),
      privacySettings: _map(data['privacySettings']),
      dashboardSettings: _map(data['dashboardSettings']),
      language: _string(data['language']) ?? 'en',
      theme: _string(data['theme']) ?? 'light',
      currency: _string(data['currency']) ?? 'USD',
      timezone: _string(data['timezone']) ?? 'UTC',
      emailNotifications: data['emailNotifications'] != false,
      pushNotifications: data['pushNotifications'] != false,
      marketingEmails: data['marketingEmails'] == true,
      profileVisibility: data['profileVisibility'] != false,
      updatedAt: _toDateTime(data['updatedAt']),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (notificationPreferences.isNotEmpty) 'notificationPreferences': notificationPreferences,
      if (displayPreferences.isNotEmpty) 'displayPreferences': displayPreferences,
      if (privacySettings.isNotEmpty) 'privacySettings': privacySettings,
      if (dashboardSettings.isNotEmpty) 'dashboardSettings': dashboardSettings,
      'language': language,
      'theme': theme,
      'currency': currency,
      'timezone': timezone,
      'emailNotifications': emailNotifications,
      'pushNotifications': pushNotifications,
      'marketingEmails': marketingEmails,
      'profileVisibility': profileVisibility,
      'updatedAt': FieldValue.serverTimestamp(),
    };
  }
}

// Portfolio mappers
extension InvestmentSummaryFirestore on InvestmentSummary {
  static InvestmentSummary fromMap(Map<String, dynamic> data) {
    return InvestmentSummary(
      id: _string(data['id']) ?? '',
      name: _string(data['name']) ?? '',
      type: _string(data['type']) ?? '',
      amount: _double(data['amount']) ?? 0,
      currentValue: _double(data['currentValue']) ?? 0,
      returnPercentage: _double(data['returnPercentage']) ?? 0,
      investmentDate: _toDateTime(data['investmentDate']) ?? DateTime.fromMillisecondsSinceEpoch(0),
      imageUrl: _string(data['imageUrl']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'amount': amount,
      'currentValue': currentValue,
      'returnPercentage': returnPercentage,
      'investmentDate': Timestamp.fromDate(investmentDate),
      if (imageUrl != null) 'imageUrl': imageUrl,
    };
  }
}

extension UserPortfolioSummaryFirestore on UserPortfolioSummary {
  static UserPortfolioSummary fromFirestore(String userId, Map<String, dynamic> data) {
    final top = (data['topInvestments'] as List<dynamic>?)
            ?.whereType<Map<String, dynamic>>()
            .map(InvestmentSummaryFirestore.fromMap)
            .toList() ??
        const <InvestmentSummary>[];

    final categories = (data['investmentCategories'] as List<dynamic>?)
            ?.map((e) => e?.toString() ?? '')
            .where((e) => e.isNotEmpty)
            .toList() ??
        const <String>[];

    return UserPortfolioSummary(
      userId: userId,
      totalInvestment: _double(data['totalInvestment']) ?? 0,
      currentValue: _double(data['currentValue']) ?? 0,
      totalReturn: _double(data['totalReturn']) ?? 0,
      returnPercentage: _double(data['returnPercentage']) ?? 0,
      activeInvestments: _int(data['activeInvestments']) ?? 0,
      completedInvestments: _int(data['completedInvestments']) ?? 0,
      topInvestments: top,
      investmentCategories: categories,
      lastUpdated: _toDateTime(data['lastUpdated']),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'totalInvestment': totalInvestment,
      'currentValue': currentValue,
      'totalReturn': totalReturn,
      'returnPercentage': returnPercentage,
      'activeInvestments': activeInvestments,
      'completedInvestments': completedInvestments,
      if (topInvestments.isNotEmpty)
        'topInvestments': topInvestments.map((e) => e.toMap()).toList(),
      if (investmentCategories.isNotEmpty)
        'investmentCategories': investmentCategories,
      if (lastUpdated != null) 'lastUpdated': Timestamp.fromDate(lastUpdated!),
    };
  }
}

// Activity mappers
extension UserActivityFirestore on UserActivity {
  static UserActivity fromFirestore(String id, Map<String, dynamic> data) {
    final type = _safeEnum(ActivityType.values, data['type']?.toString(), ActivityType.systemAction) ?? ActivityType.systemAction;
    return UserActivity(
      id: id,
      userId: _string(data['userId']) ?? '',
      type: type,
      description: _string(data['description']) ?? '',
      timestamp: _toDateTime(data['timestamp']) ?? DateTime.fromMillisecondsSinceEpoch(0),
      resourceId: _string(data['resourceId']),
      resourceType: _string(data['resourceType']),
      metadata: _map(data['metadata']),
      ipAddress: _string(data['ipAddress']),
      userAgent: _string(data['userAgent']),
      location: _string(data['location']),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'userId': userId,
      'type': describeEnum(type),
      'description': description,
      'timestamp': Timestamp.fromDate(timestamp),
      if (resourceId != null) 'resourceId': resourceId,
      if (resourceType != null) 'resourceType': resourceType,
      if (metadata.isNotEmpty) 'metadata': metadata,
      if (ipAddress != null) 'ipAddress': ipAddress,
      if (userAgent != null) 'userAgent': userAgent,
      if (location != null) 'location': location,
    };
  }
}

// Achievements mappers
extension UserAchievementFirestore on UserAchievement {
  static UserAchievement fromFirestore(String id, Map<String, dynamic> data) {
    final type = _safeEnum(AchievementType.values, data['type']?.toString(), AchievementType.firstInvestment) ?? AchievementType.firstInvestment;
    return UserAchievement(
      id: id,
      userId: _string(data['userId']) ?? '',
      type: type,
      title: _string(data['title']) ?? '',
      description: _string(data['description']) ?? '',
      earnedAt: _toDateTime(data['earnedAt']) ?? DateTime.fromMillisecondsSinceEpoch(0),
      iconUrl: _string(data['iconUrl']),
      badgeUrl: _string(data['badgeUrl']),
      criteria: _map(data['criteria']),
      points: _int(data['points']),
      category: _string(data['category']),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'userId': userId,
      'type': describeEnum(type),
      'title': title,
      'description': description,
      'earnedAt': Timestamp.fromDate(earnedAt),
      if (iconUrl != null) 'iconUrl': iconUrl,
      if (badgeUrl != null) 'badgeUrl': badgeUrl,
      if (criteria.isNotEmpty) 'criteria': criteria,
      if (points != null) 'points': points,
      if (category != null) 'category': category,
    };
  }
}
