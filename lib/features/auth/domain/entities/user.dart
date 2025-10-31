import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

/// User entity representing authenticated users in the Social Finance Impact Platform
@freezed
class User with _$User {
  const factory User({
    required String uid,
    required String email,
    String? displayName,
    String? photoURL,
    String? phoneNumber,
    @Default(false) bool isEmailVerified,
    @Default(UserRole.investor) UserRole role,
    @Default(UserStatus.active) UserStatus status,
    @Default(KYCStatus.pending) KYCStatus kycStatus,
    UserProfile? profile,
    UserPreferences? preferences,
    DateTime? createdAt,
    DateTime? lastSignInAt,
    @Default([]) List<AuthProvider> linkedProviders,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

/// User profile information
@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    String? firstName,
    String? lastName,
    String? bio,
    String? organization,
    String? jobTitle,
    String? country,
    String? city,
    String? website,
    DateTime? dateOfBirth,
    @Default([]) List<String> interests,
    @Default([]) List<String> skills,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);
}

/// User preferences for app behavior
@freezed
class UserPreferences with _$UserPreferences {
  const factory UserPreferences({
    @Default(true) bool emailNotifications,
    @Default(true) bool pushNotifications,
    @Default(false) bool marketingEmails,
    @Default('en') String language,
    @Default('USD') String currency,
    @Default(ThemeMode.system) ThemeMode themeMode,
    @Default(false) bool biometricEnabled,
    @Default(true) bool rememberMe,
  }) = _UserPreferences;

  factory UserPreferences.fromJson(Map<String, dynamic> json) => _$UserPreferencesFromJson(json);
}

/// User roles in the platform
enum UserRole {
  @JsonValue('investor')
  investor,
  @JsonValue('organization')
  organization,
  @JsonValue('auditor')
  auditor,
  @JsonValue('admin')
  admin;

  String get displayName {
    switch (this) {
      case UserRole.investor:
        return 'Investor';
      case UserRole.organization:
        return 'Organization';
      case UserRole.auditor:
        return 'Auditor';
      case UserRole.admin:
        return 'Admin';
    }
  }
}

/// User account status
enum UserStatus {
  @JsonValue('active')
  active,
  @JsonValue('suspended')
  suspended,
  @JsonValue('pending')
  pending,
  @JsonValue('banned')
  banned;

  String get displayName {
    switch (this) {
      case UserStatus.active:
        return 'Active';
      case UserStatus.suspended:
        return 'Suspended';
      case UserStatus.pending:
        return 'Pending';
      case UserStatus.banned:
        return 'Banned';
    }
  }
}

/// KYC (Know Your Customer) verification status
enum KYCStatus {
  @JsonValue('pending')
  pending,
  @JsonValue('in_review')
  inReview,
  @JsonValue('verified')
  verified,
  @JsonValue('rejected')
  rejected,
  @JsonValue('expired')
  expired;

  String get displayName {
    switch (this) {
      case KYCStatus.pending:
        return 'Pending';
      case KYCStatus.inReview:
        return 'In Review';
      case KYCStatus.verified:
        return 'Verified';
      case KYCStatus.rejected:
        return 'Rejected';
      case KYCStatus.expired:
        return 'Expired';
    }
  }
}

/// Authentication providers
enum AuthProvider {
  @JsonValue('email')
  email,
  @JsonValue('google')
  google,
  @JsonValue('apple')
  apple,
  @JsonValue('facebook')
  facebook,
  @JsonValue('linkedin')
  linkedin,
}

/// Theme mode preference
enum ThemeMode {
  @JsonValue('system')
  system,
  @JsonValue('light')
  light,
  @JsonValue('dark')
  dark,
}

/// Extensions for User entity
extension UserExtensions on User {
  /// Get user's full name
  String get fullName {
    final firstName = profile?.firstName ?? '';
    final lastName = profile?.lastName ?? '';
    if (firstName.isNotEmpty && lastName.isNotEmpty) {
      return '$firstName $lastName';
    }
    return displayName ?? email.split('@').first;
  }

  /// Get user's initials for avatar
  String get initials {
    final name = fullName;
    final parts = name.split(' ');
    if (parts.length >= 2) {
      return '${parts.first[0]}${parts[1][0]}'.toUpperCase();
    }
    return name.isNotEmpty ? name[0].toUpperCase() : 'U';
  }

  /// Check if user has completed KYC
  bool get isKYCVerified => kycStatus == KYCStatus.verified;

  /// Check if user can perform investor actions
  bool get canInvest => isKYCVerified && status == UserStatus.active;

  /// Check if user is an organization
  bool get isOrganization => role == UserRole.organization;

  /// Check if user is an admin
  bool get isAdmin => role == UserRole.admin;

  /// Check if user has linked a specific provider
  bool hasProvider(AuthProvider provider) => linkedProviders.contains(provider);

  /// Get profile completion percentage
  double get profileCompletionPercentage {
    if (profile == null) return 0.0;
    
    int completedFields = 0;
    int totalFields = 8; // firstName, lastName, bio, organization, jobTitle, country, city, dateOfBirth
    
    if (profile!.firstName?.isNotEmpty == true) completedFields++;
    if (profile!.lastName?.isNotEmpty == true) completedFields++;
    if (profile!.bio?.isNotEmpty == true) completedFields++;
    if (profile!.organization?.isNotEmpty == true) completedFields++;
    if (profile!.jobTitle?.isNotEmpty == true) completedFields++;
    if (profile!.country?.isNotEmpty == true) completedFields++;
    if (profile!.city?.isNotEmpty == true) completedFields++;
    if (profile!.dateOfBirth != null) completedFields++;
    
    return completedFields / totalFields;
  }
  
  /// Check if profile is complete enough for certain actions
  bool get isProfileComplete => profileCompletionPercentage > 0.5;
}

/// Extensions for UserRole enum
extension UserRoleExtension on UserRole {
  String get displayName {
    switch (this) {
      case UserRole.investor:
        return 'Investor';
      case UserRole.organization:
        return 'Organization';
      case UserRole.auditor:
        return 'Auditor';
      case UserRole.admin:
        return 'Administrator';
    }
  }
  
  String get description {
    switch (this) {
      case UserRole.investor:
        return 'Invests in social impact projects';
      case UserRole.organization:
        return 'Creates and manages social impact projects';
      case UserRole.auditor:
        return 'Reviews and audits impact projects';
      case UserRole.admin:
        return 'Platform administrator with full access';
    }
  }
}

/// Extensions for UserStatus enum
extension UserStatusExtension on UserStatus {
  String get displayName {
    switch (this) {
      case UserStatus.active:
        return 'Active';
      case UserStatus.suspended:
        return 'Suspended';
      case UserStatus.pending:
        return 'Pending';
      case UserStatus.banned:
        return 'Banned';
    }
  }
}

/// Extensions for KYCStatus enum
extension KYCStatusExtension on KYCStatus {
  String get displayName {
    switch (this) {
      case KYCStatus.pending:
        return 'Pending';
      case KYCStatus.inReview:
        return 'Under Review';
      case KYCStatus.verified:
        return 'Verified';
      case KYCStatus.rejected:
        return 'Rejected';
      case KYCStatus.expired:
        return 'Expired';
    }
  }
}