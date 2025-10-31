import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

/// User profile entity with comprehensive user information
@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String id,
    required String email,
    required String firstName,
    required String lastName,
    required UserRole role,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(UserStatus.active) UserStatus status,
    String? profileImageUrl,
    String? phoneNumber,
    String? bio,
    String? title,
    String? company,
    String? location,
    String? website,
    DateTime? dateOfBirth,
    @Default([]) List<String> languages,
    @Default({}) Map<String, dynamic> socialLinks,
    @Default({}) Map<String, dynamic> preferences,
    @Default([]) List<String> interests,
    @Default([]) List<String> skills,
    String? timezone,
    String? currency,
    bool? isVerified,
    DateTime? lastLoginAt,
    int? loginCount,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) => 
    _$UserProfileFromJson(json);
}

/// User role enum
enum UserRole {
  investor('Investor'),
  organizationAdmin('Organization Admin'),
  projectManager('Project Manager'),
  analyst('Analyst'),
  auditor('Auditor'),
  support('Support'),
  systemAdmin('System Admin');

  const UserRole(this.displayName);
  final String displayName;
}

/// User status enum
enum UserStatus {
  active('Active'),
  inactive('Inactive'),
  suspended('Suspended'),
  pendingVerification('Pending Verification');

  const UserStatus(this.displayName);
  final String displayName;
}

/// User preferences entity
@freezed
class UserPreferences with _$UserPreferences {
  const factory UserPreferences({
    required String userId,
    @Default({}) Map<String, dynamic> notificationPreferences,
    @Default({}) Map<String, dynamic> displayPreferences,
    @Default({}) Map<String, dynamic> privacySettings,
    @Default({}) Map<String, dynamic> dashboardSettings,
    @Default('en') String language,
    @Default('light') String theme,
    @Default('USD') String currency,
    @Default('UTC') String timezone,
    @Default(true) bool emailNotifications,
    @Default(true) bool pushNotifications,
    @Default(false) bool marketingEmails,
    @Default(true) bool profileVisibility,
    DateTime? updatedAt,
  }) = _UserPreferences;

  factory UserPreferences.fromJson(Map<String, dynamic> json) => 
    _$UserPreferencesFromJson(json);
}

/// User activity log entry
@freezed
class UserActivity with _$UserActivity {
  const factory UserActivity({
    required String id,
    required String userId,
    required ActivityType type,
    required String description,
    required DateTime timestamp,
    String? resourceId,
    String? resourceType,
    @Default({}) Map<String, dynamic> metadata,
    String? ipAddress,
    String? userAgent,
    String? location,
  }) = _UserActivity;

  factory UserActivity.fromJson(Map<String, dynamic> json) => 
    _$UserActivityFromJson(json);
}

/// Activity type enum
enum ActivityType {
  login('Login'),
  logout('Logout'),
  profileUpdate('Profile Update'),
  passwordChange('Password Change'),
  emailChange('Email Change'),
  settingsUpdate('Settings Update'),
  investment('Investment Activity'),
  projectView('Project View'),
  reportGeneration('Report Generation'),
  search('Search Activity'),
  dataExport('Data Export'),
  fileUpload('File Upload'),
  systemAction('System Action');

  const ActivityType(this.displayName);
  final String displayName;
}

/// User verification entity
@freezed
class UserVerification with _$UserVerification {
  const factory UserVerification({
    required String userId,
    @Default(false) bool emailVerified,
    @Default(false) bool phoneVerified,
    @Default(false) bool identityVerified,
    @Default(false) bool kycCompleted,
    @Default(false) bool amlCompleted,
    DateTime? emailVerifiedAt,
    DateTime? phoneVerifiedAt,
    DateTime? identityVerifiedAt,
    DateTime? kycCompletedAt,
    DateTime? amlCompletedAt,
    @Default([]) List<VerificationDocument> documents,
    String? verificationNotes,
    String? verifiedBy,
  }) = _UserVerification;

  factory UserVerification.fromJson(Map<String, dynamic> json) => 
    _$UserVerificationFromJson(json);
}

/// Verification document
@freezed
class VerificationDocument with _$VerificationDocument {
  const factory VerificationDocument({
    required String id,
    required DocumentType type,
    required String fileName,
    required String fileUrl,
    required DocumentStatus status,
    required DateTime uploadedAt,
    DateTime? verifiedAt,
    String? verifiedBy,
    String? rejectionReason,
    DateTime? expiresAt,
  }) = _VerificationDocument;

  factory VerificationDocument.fromJson(Map<String, dynamic> json) => 
    _$VerificationDocumentFromJson(json);
}

/// Document type enum
enum DocumentType {
  passport('Passport'),
  drivingLicense('Driving License'),
  nationalId('National ID'),
  utilityBill('Utility Bill'),
  bankStatement('Bank Statement'),
  proofOfIncome('Proof of Income'),
  businessRegistration('Business Registration'),
  other('Other');

  const DocumentType(this.displayName);
  final String displayName;
}

/// Document status enum
enum DocumentStatus {
  pending('Pending Review'),
  approved('Approved'),
  rejected('Rejected'),
  expired('Expired');

  const DocumentStatus(this.displayName);
  final String displayName;
}

/// User security settings
@freezed
class UserSecurity with _$UserSecurity {
  const factory UserSecurity({
    required String userId,
    @Default(false) bool twoFactorEnabled,
    @Default(false) bool biometricEnabled,
    @Default([]) List<String> trustedDevices,
    @Default([]) List<SecuritySession> activeSessions,
    DateTime? lastPasswordChange,
    @Default([]) List<LoginAttempt> recentLogins,
    @Default({}) Map<String, dynamic> securityQuestions,
    String? recoveryEmail,
    String? recoveryPhone,
  }) = _UserSecurity;

  factory UserSecurity.fromJson(Map<String, dynamic> json) => 
    _$UserSecurityFromJson(json);
}

/// Security session
@freezed
class SecuritySession with _$SecuritySession {
  const factory SecuritySession({
    required String id,
    required String deviceId,
    required String deviceName,
    required String ipAddress,
    required String location,
    required DateTime createdAt,
    DateTime? lastActiveAt,
    @Default(true) bool isActive,
    String? userAgent,
  }) = _SecuritySession;

  factory SecuritySession.fromJson(Map<String, dynamic> json) => 
    _$SecuritySessionFromJson(json);
}

/// Login attempt
@freezed
class LoginAttempt with _$LoginAttempt {
  const factory LoginAttempt({
    required String id,
    required DateTime timestamp,
    required String ipAddress,
    required String location,
    required LoginResult result,
    String? deviceId,
    String? userAgent,
    String? failureReason,
  }) = _LoginAttempt;

  factory LoginAttempt.fromJson(Map<String, dynamic> json) => 
    _$LoginAttemptFromJson(json);
}

/// Login result enum
enum LoginResult {
  success('Success'),
  invalidCredentials('Invalid Credentials'),
  accountLocked('Account Locked'),
  twoFactorRequired('2FA Required'),
  blocked('Blocked');

  const LoginResult(this.displayName);
  final String displayName;
}

/// User portfolio summary
@freezed
class UserPortfolioSummary with _$UserPortfolioSummary {
  const factory UserPortfolioSummary({
    required String userId,
    required double totalInvestment,
    required double currentValue,
    required double totalReturn,
    required double returnPercentage,
    required int activeInvestments,
    required int completedInvestments,
    @Default([]) List<InvestmentSummary> topInvestments,
    @Default([]) List<String> investmentCategories,
    DateTime? lastUpdated,
  }) = _UserPortfolioSummary;

  factory UserPortfolioSummary.fromJson(Map<String, dynamic> json) => 
    _$UserPortfolioSummaryFromJson(json);
}

/// Investment summary
@freezed
class InvestmentSummary with _$InvestmentSummary {
  const factory InvestmentSummary({
    required String id,
    required String name,
    required String type,
    required double amount,
    required double currentValue,
    required double returnPercentage,
    required DateTime investmentDate,
    String? imageUrl,
  }) = _InvestmentSummary;

  factory InvestmentSummary.fromJson(Map<String, dynamic> json) => 
    _$InvestmentSummaryFromJson(json);
}

/// User achievements
@freezed
class UserAchievement with _$UserAchievement {
  const factory UserAchievement({
    required String id,
    required String userId,
    required AchievementType type,
    required String title,
    required String description,
    required DateTime earnedAt,
    String? iconUrl,
    String? badgeUrl,
    @Default({}) Map<String, dynamic> criteria,
    int? points,
    String? category,
  }) = _UserAchievement;

  factory UserAchievement.fromJson(Map<String, dynamic> json) => 
    _$UserAchievementFromJson(json);
}

/// Achievement type enum
enum AchievementType {
  firstInvestment('First Investment'),
  portfolioMilestone('Portfolio Milestone'),
  impactGoal('Impact Goal'),
  loyaltyBadge('Loyalty Badge'),
  referralReward('Referral Reward'),
  knowledgeBadge('Knowledge Badge'),
  communityContribution('Community Contribution');

  const AchievementType(this.displayName);
  final String displayName;
}

/// User notification settings
@freezed
class UserNotificationSettings with _$UserNotificationSettings {
  const factory UserNotificationSettings({
    required String userId,
    @Default(true) bool emailNotifications,
    @Default(true) bool pushNotifications,
    @Default(true) bool smsNotifications,
    @Default(false) bool marketingEmails,
    @Default({}) Map<String, bool> categoryPreferences,
    @Default({}) Map<String, bool> channelPreferences,
    @Default('09:00') String quietHoursStart,
    @Default('22:00') String quietHoursEnd,
    @Default([]) List<String> mutedTopics,
    DateTime? updatedAt,
  }) = _UserNotificationSettings;

  factory UserNotificationSettings.fromJson(Map<String, dynamic> json) => 
    _$UserNotificationSettingsFromJson(json);
}

/// User subscription
@freezed
class UserSubscription with _$UserSubscription {
  const factory UserSubscription({
    required String userId,
    required SubscriptionPlan plan,
    required SubscriptionStatus status,
    required DateTime startDate,
    DateTime? endDate,
    DateTime? renewalDate,
    @Default([]) List<String> features,
    double? monthlyPrice,
    double? annualPrice,
    String? paymentMethodId,
    DateTime? lastPaymentDate,
    DateTime? nextPaymentDate,
  }) = _UserSubscription;

  factory UserSubscription.fromJson(Map<String, dynamic> json) => 
    _$UserSubscriptionFromJson(json);
}

/// Subscription plan enum
enum SubscriptionPlan {
  free('Free'),
  basic('Basic'),
  premium('Premium'),
  enterprise('Enterprise');

  const SubscriptionPlan(this.displayName);
  final String displayName;
}

/// Subscription status enum
enum SubscriptionStatus {
  active('Active'),
  inactive('Inactive'),
  cancelled('Cancelled'),
  suspended('Suspended'),
  expired('Expired');

  const SubscriptionStatus(this.displayName);
  final String displayName;
}