import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_settings.freezed.dart';
part 'app_settings.g.dart';

/// Application settings entity
@freezed
class AppSettings with _$AppSettings {
  const factory AppSettings({
    required String userId,
    required String version,
    required DateTime lastUpdated,
    @Default('en') String language,
    @Default('light') String theme,
    @Default('EUR') String currency,
    @Default('Europe/London') String timezone,
    @Default(true) bool autoSave,
    @Default(true) bool offlineMode,
    @Default(false) bool analyticsEnabled,
    @Default(false) bool crashReporting,
    @Default({}) Map<String, dynamic> customSettings,
    NotificationSettings? notificationSettings,
    DisplaySettings? displaySettings,
    PrivacySettings? privacySettings,
    SecuritySettings? securitySettings,
    AccessibilitySettings? accessibilitySettings,
  }) = _AppSettings;

  factory AppSettings.fromJson(Map<String, dynamic> json) => 
    _$AppSettingsFromJson(json);
}

/// Notification settings
@freezed
class NotificationSettings with _$NotificationSettings {
  const factory NotificationSettings({
    @Default(true) bool emailNotifications,
    @Default(true) bool pushNotifications,
    @Default(true) bool smsNotifications,
    @Default(false) bool marketingEmails,
    @Default(true) bool investmentAlerts,
    @Default(true) bool portfolioUpdates,
    @Default(true) bool projectNews,
    @Default(false) bool systemMaintenance,
    @Default('09:00') String quietHoursStart,
    @Default('22:00') String quietHoursEnd,
    @Default('Europe/London') String quietHoursTimezone,
    @Default({}) Map<String, bool> categoryPreferences,
    @Default({}) Map<String, bool> channelPreferences,
    @Default([]) List<String> mutedKeywords,
    @Default([]) List<String> blockedSenders,
    DateTime? lastUpdated,
  }) = _NotificationSettings;

  factory NotificationSettings.fromJson(Map<String, dynamic> json) => 
    _$NotificationSettingsFromJson(json);
}

/// Display settings
@freezed
class DisplaySettings with _$DisplaySettings {
  const factory DisplaySettings({
    @Default('system') String themeMode, // light, dark, system
    @Default('blue') String accentColor,
    @Default(false) bool highContrast,
    @Default(false) bool reducedMotion,
    @Default(1.0) double textScaling,
    @Default(1.0) double interfaceScale,
    @Default(true) bool showAnimations,
    @Default(true) bool showThumbnails,
    @Default('comfortable') String density, // compact, comfortable, spacious
    @Default('grid') String defaultView, // list, grid, cards
    @Default(50) int itemsPerPage,
    @Default(true) bool showTooltips,
    @Default(false) bool debugMode,
    DateTime? lastUpdated,
  }) = _DisplaySettings;

  factory DisplaySettings.fromJson(Map<String, dynamic> json) => 
    _$DisplaySettingsFromJson(json);
}

/// Privacy settings
@freezed
class PrivacySettings with _$PrivacySettings {
  const factory PrivacySettings({
    @Default(true) bool profileVisibility,
    @Default(true) bool showOnlineStatus,
    @Default(false) bool shareAnalytics,
    @Default(false) bool allowTracking,
    @Default(true) bool cookieConsent,
    @Default(false) bool shareUsageData,
    @Default([]) List<String> blockedUsers,
    @Default([]) List<String> trustedDomains,
    @Default('friends') String defaultPrivacyLevel, // public, friends, private
    @Default(true) bool showInSearchResults,
    @Default(false) bool allowDirectMessages,
    @Default(false) bool shareLocation,
    @Default({}) Map<String, bool> dataSharing,
    DateTime? lastUpdated,
  }) = _PrivacySettings;

  factory PrivacySettings.fromJson(Map<String, dynamic> json) => 
    _$PrivacySettingsFromJson(json);
}

/// Security settings
@freezed
class SecuritySettings with _$SecuritySettings {
  const factory SecuritySettings({
    @Default(false) bool twoFactorEnabled,
    @Default(false) bool biometricAuth,
    @Default(false) bool emailVerificationRequired,
    @Default(30) int sessionTimeout, // minutes
    @Default(90) int passwordExpiryDays,
    @Default(5) int maxLoginAttempts,
    @Default(true) bool requireStrongPassword,
    @Default(true) bool logSecurityEvents,
    @Default([]) List<String> trustedDevices,
    @Default([]) List<String> authorizedApplications,
    @Default({}) Map<String, bool> permissionSettings,
    String? recoveryEmail,
    String? recoveryPhone,
    DateTime? lastPasswordChange,
    DateTime? lastSecurityReview,
    DateTime? lastUpdated,
  }) = _SecuritySettings;

  factory SecuritySettings.fromJson(Map<String, dynamic> json) => 
    _$SecuritySettingsFromJson(json);
}

/// Accessibility settings
@freezed
class AccessibilitySettings with _$AccessibilitySettings {
  const factory AccessibilitySettings({
    @Default(false) bool screenReader,
    @Default(false) bool highContrastText,
    @Default(false) bool largeText,
    @Default(false) bool reducedMotion,
    @Default(false) bool boldText,
    @Default(false) bool hapticFeedback,
    @Default(false) bool soundEffects,
    @Default(false) bool voiceControl,
    @Default(1.0) double textSize,
    @Default(1.0) double interfaceSize,
    @Default('default') String fontFamily,
    @Default(0) int colorBlindnessType, // 0: none, 1: deuteranopia, 2: protanopia, 3: tritanopia
    @Default(false) bool keyboardNavigation,
    @Default([]) List<String> customKeyboardShortcuts,
    DateTime? lastUpdated,
  }) = _AccessibilitySettings;

  factory AccessibilitySettings.fromJson(Map<String, dynamic> json) => 
    _$AccessibilitySettingsFromJson(json);
}

/// User preference categories
enum PreferenceCategory {
  general('General'),
  notifications('Notifications'),
  display('Display'),
  privacy('Privacy'),
  security('Security'),
  accessibility('Accessibility'),
  advanced('Advanced');

  const PreferenceCategory(this.displayName);
  final String displayName;
}

/// Settings backup
@freezed
class SettingsBackup with _$SettingsBackup {
  const factory SettingsBackup({
    required String id,
    required String userId,
    required DateTime createdAt,
    required Map<String, dynamic> settingsData,
    String? name,
    String? description,
    @Default(false) bool isAutomatic,
    String? deviceInfo,
    String? appVersion,
  }) = _SettingsBackup;

  factory SettingsBackup.fromJson(Map<String, dynamic> json) => 
    _$SettingsBackupFromJson(json);
}

/// Settings sync status
@freezed
class SettingsSyncStatus with _$SettingsSyncStatus {
  const factory SettingsSyncStatus({
    required String userId,
    @Default(false) bool isEnabled,
    @Default(SyncState.idle) SyncState currentState,
    DateTime? lastSyncAt,
    DateTime? nextSyncAt,
    @Default([]) List<String> conflictingKeys,
    String? error,
    @Default(0) int syncCount,
    @Default({}) Map<String, DateTime> deviceLastSync,
  }) = _SettingsSyncStatus;

  factory SettingsSyncStatus.fromJson(Map<String, dynamic> json) => 
    _$SettingsSyncStatusFromJson(json);
}

/// Sync state enum
enum SyncState {
  idle('Idle'),
  syncing('Syncing'),
  conflict('Conflict'),
  error('Error'),
  success('Success');

  const SyncState(this.displayName);
  final String displayName;
}

/// Device settings
@freezed
class DeviceSettings with _$DeviceSettings {
  const factory DeviceSettings({
    required String deviceId,
    required String deviceName,
    required String platform,
    required String appVersion,
    required DateTime lastActive,
    @Default(true) bool syncEnabled,
    @Default({}) Map<String, dynamic> platformSpecificSettings,
    String? pushToken,
    String? biometricId,
    @Default([]) List<String> enabledFeatures,
  }) = _DeviceSettings;

  factory DeviceSettings.fromJson(Map<String, dynamic> json) => 
    _$DeviceSettingsFromJson(json);
}

/// Import/Export format
enum SettingsFormat {
  json('JSON'),
  csv('CSV'),
  xml('XML');

  const SettingsFormat(this.displayName);
  final String displayName;
}

/// Settings change log
@freezed
class SettingsChangeLog with _$SettingsChangeLog {
  const factory SettingsChangeLog({
    required String id,
    required String userId,
    required String settingKey,
    required String oldValue,
    required String newValue,
    required DateTime changedAt,
    String? changedBy,
    String? reason,
    String? deviceId,
    String? ipAddress,
  }) = _SettingsChangeLog;

  factory SettingsChangeLog.fromJson(Map<String, dynamic> json) => 
    _$SettingsChangeLogFromJson(json);
}