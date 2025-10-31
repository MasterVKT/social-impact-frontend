// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppSettingsImpl _$$AppSettingsImplFromJson(Map<String, dynamic> json) =>
    _$AppSettingsImpl(
      userId: json['userId'] as String,
      version: json['version'] as String,
      lastUpdated: DateTime.parse(json['lastUpdated'] as String),
      language: json['language'] as String? ?? 'en',
      theme: json['theme'] as String? ?? 'light',
      currency: json['currency'] as String? ?? 'EUR',
      timezone: json['timezone'] as String? ?? 'Europe/London',
      autoSave: json['autoSave'] as bool? ?? true,
      offlineMode: json['offlineMode'] as bool? ?? true,
      analyticsEnabled: json['analyticsEnabled'] as bool? ?? false,
      crashReporting: json['crashReporting'] as bool? ?? false,
      customSettings:
          json['customSettings'] as Map<String, dynamic>? ?? const {},
      notificationSettings: json['notificationSettings'] == null
          ? null
          : NotificationSettings.fromJson(
              json['notificationSettings'] as Map<String, dynamic>),
      displaySettings: json['displaySettings'] == null
          ? null
          : DisplaySettings.fromJson(
              json['displaySettings'] as Map<String, dynamic>),
      privacySettings: json['privacySettings'] == null
          ? null
          : PrivacySettings.fromJson(
              json['privacySettings'] as Map<String, dynamic>),
      securitySettings: json['securitySettings'] == null
          ? null
          : SecuritySettings.fromJson(
              json['securitySettings'] as Map<String, dynamic>),
      accessibilitySettings: json['accessibilitySettings'] == null
          ? null
          : AccessibilitySettings.fromJson(
              json['accessibilitySettings'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AppSettingsImplToJson(_$AppSettingsImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'version': instance.version,
      'lastUpdated': instance.lastUpdated.toIso8601String(),
      'language': instance.language,
      'theme': instance.theme,
      'currency': instance.currency,
      'timezone': instance.timezone,
      'autoSave': instance.autoSave,
      'offlineMode': instance.offlineMode,
      'analyticsEnabled': instance.analyticsEnabled,
      'crashReporting': instance.crashReporting,
      'customSettings': instance.customSettings,
      'notificationSettings': instance.notificationSettings,
      'displaySettings': instance.displaySettings,
      'privacySettings': instance.privacySettings,
      'securitySettings': instance.securitySettings,
      'accessibilitySettings': instance.accessibilitySettings,
    };

_$NotificationSettingsImpl _$$NotificationSettingsImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationSettingsImpl(
      emailNotifications: json['emailNotifications'] as bool? ?? true,
      pushNotifications: json['pushNotifications'] as bool? ?? true,
      smsNotifications: json['smsNotifications'] as bool? ?? true,
      marketingEmails: json['marketingEmails'] as bool? ?? false,
      investmentAlerts: json['investmentAlerts'] as bool? ?? true,
      portfolioUpdates: json['portfolioUpdates'] as bool? ?? true,
      projectNews: json['projectNews'] as bool? ?? true,
      systemMaintenance: json['systemMaintenance'] as bool? ?? false,
      quietHoursStart: json['quietHoursStart'] as String? ?? '09:00',
      quietHoursEnd: json['quietHoursEnd'] as String? ?? '22:00',
      quietHoursTimezone:
          json['quietHoursTimezone'] as String? ?? 'Europe/London',
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
      mutedKeywords: (json['mutedKeywords'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      blockedSenders: (json['blockedSenders'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      lastUpdated: json['lastUpdated'] == null
          ? null
          : DateTime.parse(json['lastUpdated'] as String),
    );

Map<String, dynamic> _$$NotificationSettingsImplToJson(
        _$NotificationSettingsImpl instance) =>
    <String, dynamic>{
      'emailNotifications': instance.emailNotifications,
      'pushNotifications': instance.pushNotifications,
      'smsNotifications': instance.smsNotifications,
      'marketingEmails': instance.marketingEmails,
      'investmentAlerts': instance.investmentAlerts,
      'portfolioUpdates': instance.portfolioUpdates,
      'projectNews': instance.projectNews,
      'systemMaintenance': instance.systemMaintenance,
      'quietHoursStart': instance.quietHoursStart,
      'quietHoursEnd': instance.quietHoursEnd,
      'quietHoursTimezone': instance.quietHoursTimezone,
      'categoryPreferences': instance.categoryPreferences,
      'channelPreferences': instance.channelPreferences,
      'mutedKeywords': instance.mutedKeywords,
      'blockedSenders': instance.blockedSenders,
      'lastUpdated': instance.lastUpdated?.toIso8601String(),
    };

_$DisplaySettingsImpl _$$DisplaySettingsImplFromJson(
        Map<String, dynamic> json) =>
    _$DisplaySettingsImpl(
      themeMode: json['themeMode'] as String? ?? 'system',
      accentColor: json['accentColor'] as String? ?? 'blue',
      highContrast: json['highContrast'] as bool? ?? false,
      reducedMotion: json['reducedMotion'] as bool? ?? false,
      textScaling: (json['textScaling'] as num?)?.toDouble() ?? 1.0,
      interfaceScale: (json['interfaceScale'] as num?)?.toDouble() ?? 1.0,
      showAnimations: json['showAnimations'] as bool? ?? true,
      showThumbnails: json['showThumbnails'] as bool? ?? true,
      density: json['density'] as String? ?? 'comfortable',
      defaultView: json['defaultView'] as String? ?? 'grid',
      itemsPerPage: (json['itemsPerPage'] as num?)?.toInt() ?? 50,
      showTooltips: json['showTooltips'] as bool? ?? true,
      debugMode: json['debugMode'] as bool? ?? false,
      lastUpdated: json['lastUpdated'] == null
          ? null
          : DateTime.parse(json['lastUpdated'] as String),
    );

Map<String, dynamic> _$$DisplaySettingsImplToJson(
        _$DisplaySettingsImpl instance) =>
    <String, dynamic>{
      'themeMode': instance.themeMode,
      'accentColor': instance.accentColor,
      'highContrast': instance.highContrast,
      'reducedMotion': instance.reducedMotion,
      'textScaling': instance.textScaling,
      'interfaceScale': instance.interfaceScale,
      'showAnimations': instance.showAnimations,
      'showThumbnails': instance.showThumbnails,
      'density': instance.density,
      'defaultView': instance.defaultView,
      'itemsPerPage': instance.itemsPerPage,
      'showTooltips': instance.showTooltips,
      'debugMode': instance.debugMode,
      'lastUpdated': instance.lastUpdated?.toIso8601String(),
    };

_$PrivacySettingsImpl _$$PrivacySettingsImplFromJson(
        Map<String, dynamic> json) =>
    _$PrivacySettingsImpl(
      profileVisibility: json['profileVisibility'] as bool? ?? true,
      showOnlineStatus: json['showOnlineStatus'] as bool? ?? true,
      shareAnalytics: json['shareAnalytics'] as bool? ?? false,
      allowTracking: json['allowTracking'] as bool? ?? false,
      cookieConsent: json['cookieConsent'] as bool? ?? true,
      shareUsageData: json['shareUsageData'] as bool? ?? false,
      blockedUsers: (json['blockedUsers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      trustedDomains: (json['trustedDomains'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      defaultPrivacyLevel: json['defaultPrivacyLevel'] as String? ?? 'friends',
      showInSearchResults: json['showInSearchResults'] as bool? ?? true,
      allowDirectMessages: json['allowDirectMessages'] as bool? ?? false,
      shareLocation: json['shareLocation'] as bool? ?? false,
      dataSharing: (json['dataSharing'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as bool),
          ) ??
          const {},
      lastUpdated: json['lastUpdated'] == null
          ? null
          : DateTime.parse(json['lastUpdated'] as String),
    );

Map<String, dynamic> _$$PrivacySettingsImplToJson(
        _$PrivacySettingsImpl instance) =>
    <String, dynamic>{
      'profileVisibility': instance.profileVisibility,
      'showOnlineStatus': instance.showOnlineStatus,
      'shareAnalytics': instance.shareAnalytics,
      'allowTracking': instance.allowTracking,
      'cookieConsent': instance.cookieConsent,
      'shareUsageData': instance.shareUsageData,
      'blockedUsers': instance.blockedUsers,
      'trustedDomains': instance.trustedDomains,
      'defaultPrivacyLevel': instance.defaultPrivacyLevel,
      'showInSearchResults': instance.showInSearchResults,
      'allowDirectMessages': instance.allowDirectMessages,
      'shareLocation': instance.shareLocation,
      'dataSharing': instance.dataSharing,
      'lastUpdated': instance.lastUpdated?.toIso8601String(),
    };

_$SecuritySettingsImpl _$$SecuritySettingsImplFromJson(
        Map<String, dynamic> json) =>
    _$SecuritySettingsImpl(
      twoFactorEnabled: json['twoFactorEnabled'] as bool? ?? false,
      biometricAuth: json['biometricAuth'] as bool? ?? false,
      emailVerificationRequired:
          json['emailVerificationRequired'] as bool? ?? false,
      sessionTimeout: (json['sessionTimeout'] as num?)?.toInt() ?? 30,
      passwordExpiryDays: (json['passwordExpiryDays'] as num?)?.toInt() ?? 90,
      maxLoginAttempts: (json['maxLoginAttempts'] as num?)?.toInt() ?? 5,
      requireStrongPassword: json['requireStrongPassword'] as bool? ?? true,
      logSecurityEvents: json['logSecurityEvents'] as bool? ?? true,
      trustedDevices: (json['trustedDevices'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      authorizedApplications: (json['authorizedApplications'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      permissionSettings:
          (json['permissionSettings'] as Map<String, dynamic>?)?.map(
                (k, e) => MapEntry(k, e as bool),
              ) ??
              const {},
      recoveryEmail: json['recoveryEmail'] as String?,
      recoveryPhone: json['recoveryPhone'] as String?,
      lastPasswordChange: json['lastPasswordChange'] == null
          ? null
          : DateTime.parse(json['lastPasswordChange'] as String),
      lastSecurityReview: json['lastSecurityReview'] == null
          ? null
          : DateTime.parse(json['lastSecurityReview'] as String),
      lastUpdated: json['lastUpdated'] == null
          ? null
          : DateTime.parse(json['lastUpdated'] as String),
    );

Map<String, dynamic> _$$SecuritySettingsImplToJson(
        _$SecuritySettingsImpl instance) =>
    <String, dynamic>{
      'twoFactorEnabled': instance.twoFactorEnabled,
      'biometricAuth': instance.biometricAuth,
      'emailVerificationRequired': instance.emailVerificationRequired,
      'sessionTimeout': instance.sessionTimeout,
      'passwordExpiryDays': instance.passwordExpiryDays,
      'maxLoginAttempts': instance.maxLoginAttempts,
      'requireStrongPassword': instance.requireStrongPassword,
      'logSecurityEvents': instance.logSecurityEvents,
      'trustedDevices': instance.trustedDevices,
      'authorizedApplications': instance.authorizedApplications,
      'permissionSettings': instance.permissionSettings,
      'recoveryEmail': instance.recoveryEmail,
      'recoveryPhone': instance.recoveryPhone,
      'lastPasswordChange': instance.lastPasswordChange?.toIso8601String(),
      'lastSecurityReview': instance.lastSecurityReview?.toIso8601String(),
      'lastUpdated': instance.lastUpdated?.toIso8601String(),
    };

_$AccessibilitySettingsImpl _$$AccessibilitySettingsImplFromJson(
        Map<String, dynamic> json) =>
    _$AccessibilitySettingsImpl(
      screenReader: json['screenReader'] as bool? ?? false,
      highContrastText: json['highContrastText'] as bool? ?? false,
      largeText: json['largeText'] as bool? ?? false,
      reducedMotion: json['reducedMotion'] as bool? ?? false,
      boldText: json['boldText'] as bool? ?? false,
      hapticFeedback: json['hapticFeedback'] as bool? ?? false,
      soundEffects: json['soundEffects'] as bool? ?? false,
      voiceControl: json['voiceControl'] as bool? ?? false,
      textSize: (json['textSize'] as num?)?.toDouble() ?? 1.0,
      interfaceSize: (json['interfaceSize'] as num?)?.toDouble() ?? 1.0,
      fontFamily: json['fontFamily'] as String? ?? 'default',
      colorBlindnessType: (json['colorBlindnessType'] as num?)?.toInt() ?? 0,
      keyboardNavigation: json['keyboardNavigation'] as bool? ?? false,
      customKeyboardShortcuts:
          (json['customKeyboardShortcuts'] as List<dynamic>?)
                  ?.map((e) => e as String)
                  .toList() ??
              const [],
      lastUpdated: json['lastUpdated'] == null
          ? null
          : DateTime.parse(json['lastUpdated'] as String),
    );

Map<String, dynamic> _$$AccessibilitySettingsImplToJson(
        _$AccessibilitySettingsImpl instance) =>
    <String, dynamic>{
      'screenReader': instance.screenReader,
      'highContrastText': instance.highContrastText,
      'largeText': instance.largeText,
      'reducedMotion': instance.reducedMotion,
      'boldText': instance.boldText,
      'hapticFeedback': instance.hapticFeedback,
      'soundEffects': instance.soundEffects,
      'voiceControl': instance.voiceControl,
      'textSize': instance.textSize,
      'interfaceSize': instance.interfaceSize,
      'fontFamily': instance.fontFamily,
      'colorBlindnessType': instance.colorBlindnessType,
      'keyboardNavigation': instance.keyboardNavigation,
      'customKeyboardShortcuts': instance.customKeyboardShortcuts,
      'lastUpdated': instance.lastUpdated?.toIso8601String(),
    };

_$SettingsBackupImpl _$$SettingsBackupImplFromJson(Map<String, dynamic> json) =>
    _$SettingsBackupImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      settingsData: json['settingsData'] as Map<String, dynamic>,
      name: json['name'] as String?,
      description: json['description'] as String?,
      isAutomatic: json['isAutomatic'] as bool? ?? false,
      deviceInfo: json['deviceInfo'] as String?,
      appVersion: json['appVersion'] as String?,
    );

Map<String, dynamic> _$$SettingsBackupImplToJson(
        _$SettingsBackupImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'createdAt': instance.createdAt.toIso8601String(),
      'settingsData': instance.settingsData,
      'name': instance.name,
      'description': instance.description,
      'isAutomatic': instance.isAutomatic,
      'deviceInfo': instance.deviceInfo,
      'appVersion': instance.appVersion,
    };

_$SettingsSyncStatusImpl _$$SettingsSyncStatusImplFromJson(
        Map<String, dynamic> json) =>
    _$SettingsSyncStatusImpl(
      userId: json['userId'] as String,
      isEnabled: json['isEnabled'] as bool? ?? false,
      currentState:
          $enumDecodeNullable(_$SyncStateEnumMap, json['currentState']) ??
              SyncState.idle,
      lastSyncAt: json['lastSyncAt'] == null
          ? null
          : DateTime.parse(json['lastSyncAt'] as String),
      nextSyncAt: json['nextSyncAt'] == null
          ? null
          : DateTime.parse(json['nextSyncAt'] as String),
      conflictingKeys: (json['conflictingKeys'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      error: json['error'] as String?,
      syncCount: (json['syncCount'] as num?)?.toInt() ?? 0,
      deviceLastSync: (json['deviceLastSync'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, DateTime.parse(e as String)),
          ) ??
          const {},
    );

Map<String, dynamic> _$$SettingsSyncStatusImplToJson(
        _$SettingsSyncStatusImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'isEnabled': instance.isEnabled,
      'currentState': _$SyncStateEnumMap[instance.currentState]!,
      'lastSyncAt': instance.lastSyncAt?.toIso8601String(),
      'nextSyncAt': instance.nextSyncAt?.toIso8601String(),
      'conflictingKeys': instance.conflictingKeys,
      'error': instance.error,
      'syncCount': instance.syncCount,
      'deviceLastSync': instance.deviceLastSync
          .map((k, e) => MapEntry(k, e.toIso8601String())),
    };

const _$SyncStateEnumMap = {
  SyncState.idle: 'idle',
  SyncState.syncing: 'syncing',
  SyncState.conflict: 'conflict',
  SyncState.error: 'error',
  SyncState.success: 'success',
};

_$DeviceSettingsImpl _$$DeviceSettingsImplFromJson(Map<String, dynamic> json) =>
    _$DeviceSettingsImpl(
      deviceId: json['deviceId'] as String,
      deviceName: json['deviceName'] as String,
      platform: json['platform'] as String,
      appVersion: json['appVersion'] as String,
      lastActive: DateTime.parse(json['lastActive'] as String),
      syncEnabled: json['syncEnabled'] as bool? ?? true,
      platformSpecificSettings:
          json['platformSpecificSettings'] as Map<String, dynamic>? ?? const {},
      pushToken: json['pushToken'] as String?,
      biometricId: json['biometricId'] as String?,
      enabledFeatures: (json['enabledFeatures'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$DeviceSettingsImplToJson(
        _$DeviceSettingsImpl instance) =>
    <String, dynamic>{
      'deviceId': instance.deviceId,
      'deviceName': instance.deviceName,
      'platform': instance.platform,
      'appVersion': instance.appVersion,
      'lastActive': instance.lastActive.toIso8601String(),
      'syncEnabled': instance.syncEnabled,
      'platformSpecificSettings': instance.platformSpecificSettings,
      'pushToken': instance.pushToken,
      'biometricId': instance.biometricId,
      'enabledFeatures': instance.enabledFeatures,
    };

_$SettingsChangeLogImpl _$$SettingsChangeLogImplFromJson(
        Map<String, dynamic> json) =>
    _$SettingsChangeLogImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      settingKey: json['settingKey'] as String,
      oldValue: json['oldValue'] as String,
      newValue: json['newValue'] as String,
      changedAt: DateTime.parse(json['changedAt'] as String),
      changedBy: json['changedBy'] as String?,
      reason: json['reason'] as String?,
      deviceId: json['deviceId'] as String?,
      ipAddress: json['ipAddress'] as String?,
    );

Map<String, dynamic> _$$SettingsChangeLogImplToJson(
        _$SettingsChangeLogImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'settingKey': instance.settingKey,
      'oldValue': instance.oldValue,
      'newValue': instance.newValue,
      'changedAt': instance.changedAt.toIso8601String(),
      'changedBy': instance.changedBy,
      'reason': instance.reason,
      'deviceId': instance.deviceId,
      'ipAddress': instance.ipAddress,
    };
