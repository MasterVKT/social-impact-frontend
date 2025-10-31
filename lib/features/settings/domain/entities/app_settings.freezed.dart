// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppSettings _$AppSettingsFromJson(Map<String, dynamic> json) {
  return _AppSettings.fromJson(json);
}

/// @nodoc
mixin _$AppSettings {
  String get userId => throw _privateConstructorUsedError;
  String get version => throw _privateConstructorUsedError;
  DateTime get lastUpdated => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;
  String get theme => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  String get timezone => throw _privateConstructorUsedError;
  bool get autoSave => throw _privateConstructorUsedError;
  bool get offlineMode => throw _privateConstructorUsedError;
  bool get analyticsEnabled => throw _privateConstructorUsedError;
  bool get crashReporting => throw _privateConstructorUsedError;
  Map<String, dynamic> get customSettings => throw _privateConstructorUsedError;
  NotificationSettings? get notificationSettings =>
      throw _privateConstructorUsedError;
  DisplaySettings? get displaySettings => throw _privateConstructorUsedError;
  PrivacySettings? get privacySettings => throw _privateConstructorUsedError;
  SecuritySettings? get securitySettings => throw _privateConstructorUsedError;
  AccessibilitySettings? get accessibilitySettings =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppSettingsCopyWith<AppSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppSettingsCopyWith<$Res> {
  factory $AppSettingsCopyWith(
          AppSettings value, $Res Function(AppSettings) then) =
      _$AppSettingsCopyWithImpl<$Res, AppSettings>;
  @useResult
  $Res call(
      {String userId,
      String version,
      DateTime lastUpdated,
      String language,
      String theme,
      String currency,
      String timezone,
      bool autoSave,
      bool offlineMode,
      bool analyticsEnabled,
      bool crashReporting,
      Map<String, dynamic> customSettings,
      NotificationSettings? notificationSettings,
      DisplaySettings? displaySettings,
      PrivacySettings? privacySettings,
      SecuritySettings? securitySettings,
      AccessibilitySettings? accessibilitySettings});

  $NotificationSettingsCopyWith<$Res>? get notificationSettings;
  $DisplaySettingsCopyWith<$Res>? get displaySettings;
  $PrivacySettingsCopyWith<$Res>? get privacySettings;
  $SecuritySettingsCopyWith<$Res>? get securitySettings;
  $AccessibilitySettingsCopyWith<$Res>? get accessibilitySettings;
}

/// @nodoc
class _$AppSettingsCopyWithImpl<$Res, $Val extends AppSettings>
    implements $AppSettingsCopyWith<$Res> {
  _$AppSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? version = null,
    Object? lastUpdated = null,
    Object? language = null,
    Object? theme = null,
    Object? currency = null,
    Object? timezone = null,
    Object? autoSave = null,
    Object? offlineMode = null,
    Object? analyticsEnabled = null,
    Object? crashReporting = null,
    Object? customSettings = null,
    Object? notificationSettings = freezed,
    Object? displaySettings = freezed,
    Object? privacySettings = freezed,
    Object? securitySettings = freezed,
    Object? accessibilitySettings = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      timezone: null == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String,
      autoSave: null == autoSave
          ? _value.autoSave
          : autoSave // ignore: cast_nullable_to_non_nullable
              as bool,
      offlineMode: null == offlineMode
          ? _value.offlineMode
          : offlineMode // ignore: cast_nullable_to_non_nullable
              as bool,
      analyticsEnabled: null == analyticsEnabled
          ? _value.analyticsEnabled
          : analyticsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      crashReporting: null == crashReporting
          ? _value.crashReporting
          : crashReporting // ignore: cast_nullable_to_non_nullable
              as bool,
      customSettings: null == customSettings
          ? _value.customSettings
          : customSettings // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      notificationSettings: freezed == notificationSettings
          ? _value.notificationSettings
          : notificationSettings // ignore: cast_nullable_to_non_nullable
              as NotificationSettings?,
      displaySettings: freezed == displaySettings
          ? _value.displaySettings
          : displaySettings // ignore: cast_nullable_to_non_nullable
              as DisplaySettings?,
      privacySettings: freezed == privacySettings
          ? _value.privacySettings
          : privacySettings // ignore: cast_nullable_to_non_nullable
              as PrivacySettings?,
      securitySettings: freezed == securitySettings
          ? _value.securitySettings
          : securitySettings // ignore: cast_nullable_to_non_nullable
              as SecuritySettings?,
      accessibilitySettings: freezed == accessibilitySettings
          ? _value.accessibilitySettings
          : accessibilitySettings // ignore: cast_nullable_to_non_nullable
              as AccessibilitySettings?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NotificationSettingsCopyWith<$Res>? get notificationSettings {
    if (_value.notificationSettings == null) {
      return null;
    }

    return $NotificationSettingsCopyWith<$Res>(_value.notificationSettings!,
        (value) {
      return _then(_value.copyWith(notificationSettings: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DisplaySettingsCopyWith<$Res>? get displaySettings {
    if (_value.displaySettings == null) {
      return null;
    }

    return $DisplaySettingsCopyWith<$Res>(_value.displaySettings!, (value) {
      return _then(_value.copyWith(displaySettings: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PrivacySettingsCopyWith<$Res>? get privacySettings {
    if (_value.privacySettings == null) {
      return null;
    }

    return $PrivacySettingsCopyWith<$Res>(_value.privacySettings!, (value) {
      return _then(_value.copyWith(privacySettings: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SecuritySettingsCopyWith<$Res>? get securitySettings {
    if (_value.securitySettings == null) {
      return null;
    }

    return $SecuritySettingsCopyWith<$Res>(_value.securitySettings!, (value) {
      return _then(_value.copyWith(securitySettings: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AccessibilitySettingsCopyWith<$Res>? get accessibilitySettings {
    if (_value.accessibilitySettings == null) {
      return null;
    }

    return $AccessibilitySettingsCopyWith<$Res>(_value.accessibilitySettings!,
        (value) {
      return _then(_value.copyWith(accessibilitySettings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppSettingsImplCopyWith<$Res>
    implements $AppSettingsCopyWith<$Res> {
  factory _$$AppSettingsImplCopyWith(
          _$AppSettingsImpl value, $Res Function(_$AppSettingsImpl) then) =
      __$$AppSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      String version,
      DateTime lastUpdated,
      String language,
      String theme,
      String currency,
      String timezone,
      bool autoSave,
      bool offlineMode,
      bool analyticsEnabled,
      bool crashReporting,
      Map<String, dynamic> customSettings,
      NotificationSettings? notificationSettings,
      DisplaySettings? displaySettings,
      PrivacySettings? privacySettings,
      SecuritySettings? securitySettings,
      AccessibilitySettings? accessibilitySettings});

  @override
  $NotificationSettingsCopyWith<$Res>? get notificationSettings;
  @override
  $DisplaySettingsCopyWith<$Res>? get displaySettings;
  @override
  $PrivacySettingsCopyWith<$Res>? get privacySettings;
  @override
  $SecuritySettingsCopyWith<$Res>? get securitySettings;
  @override
  $AccessibilitySettingsCopyWith<$Res>? get accessibilitySettings;
}

/// @nodoc
class __$$AppSettingsImplCopyWithImpl<$Res>
    extends _$AppSettingsCopyWithImpl<$Res, _$AppSettingsImpl>
    implements _$$AppSettingsImplCopyWith<$Res> {
  __$$AppSettingsImplCopyWithImpl(
      _$AppSettingsImpl _value, $Res Function(_$AppSettingsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? version = null,
    Object? lastUpdated = null,
    Object? language = null,
    Object? theme = null,
    Object? currency = null,
    Object? timezone = null,
    Object? autoSave = null,
    Object? offlineMode = null,
    Object? analyticsEnabled = null,
    Object? crashReporting = null,
    Object? customSettings = null,
    Object? notificationSettings = freezed,
    Object? displaySettings = freezed,
    Object? privacySettings = freezed,
    Object? securitySettings = freezed,
    Object? accessibilitySettings = freezed,
  }) {
    return _then(_$AppSettingsImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      timezone: null == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String,
      autoSave: null == autoSave
          ? _value.autoSave
          : autoSave // ignore: cast_nullable_to_non_nullable
              as bool,
      offlineMode: null == offlineMode
          ? _value.offlineMode
          : offlineMode // ignore: cast_nullable_to_non_nullable
              as bool,
      analyticsEnabled: null == analyticsEnabled
          ? _value.analyticsEnabled
          : analyticsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      crashReporting: null == crashReporting
          ? _value.crashReporting
          : crashReporting // ignore: cast_nullable_to_non_nullable
              as bool,
      customSettings: null == customSettings
          ? _value._customSettings
          : customSettings // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      notificationSettings: freezed == notificationSettings
          ? _value.notificationSettings
          : notificationSettings // ignore: cast_nullable_to_non_nullable
              as NotificationSettings?,
      displaySettings: freezed == displaySettings
          ? _value.displaySettings
          : displaySettings // ignore: cast_nullable_to_non_nullable
              as DisplaySettings?,
      privacySettings: freezed == privacySettings
          ? _value.privacySettings
          : privacySettings // ignore: cast_nullable_to_non_nullable
              as PrivacySettings?,
      securitySettings: freezed == securitySettings
          ? _value.securitySettings
          : securitySettings // ignore: cast_nullable_to_non_nullable
              as SecuritySettings?,
      accessibilitySettings: freezed == accessibilitySettings
          ? _value.accessibilitySettings
          : accessibilitySettings // ignore: cast_nullable_to_non_nullable
              as AccessibilitySettings?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppSettingsImpl implements _AppSettings {
  const _$AppSettingsImpl(
      {required this.userId,
      required this.version,
      required this.lastUpdated,
      this.language = 'en',
      this.theme = 'light',
      this.currency = 'EUR',
      this.timezone = 'Europe/London',
      this.autoSave = true,
      this.offlineMode = true,
      this.analyticsEnabled = false,
      this.crashReporting = false,
      final Map<String, dynamic> customSettings = const {},
      this.notificationSettings,
      this.displaySettings,
      this.privacySettings,
      this.securitySettings,
      this.accessibilitySettings})
      : _customSettings = customSettings;

  factory _$AppSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppSettingsImplFromJson(json);

  @override
  final String userId;
  @override
  final String version;
  @override
  final DateTime lastUpdated;
  @override
  @JsonKey()
  final String language;
  @override
  @JsonKey()
  final String theme;
  @override
  @JsonKey()
  final String currency;
  @override
  @JsonKey()
  final String timezone;
  @override
  @JsonKey()
  final bool autoSave;
  @override
  @JsonKey()
  final bool offlineMode;
  @override
  @JsonKey()
  final bool analyticsEnabled;
  @override
  @JsonKey()
  final bool crashReporting;
  final Map<String, dynamic> _customSettings;
  @override
  @JsonKey()
  Map<String, dynamic> get customSettings {
    if (_customSettings is EqualUnmodifiableMapView) return _customSettings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_customSettings);
  }

  @override
  final NotificationSettings? notificationSettings;
  @override
  final DisplaySettings? displaySettings;
  @override
  final PrivacySettings? privacySettings;
  @override
  final SecuritySettings? securitySettings;
  @override
  final AccessibilitySettings? accessibilitySettings;

  @override
  String toString() {
    return 'AppSettings(userId: $userId, version: $version, lastUpdated: $lastUpdated, language: $language, theme: $theme, currency: $currency, timezone: $timezone, autoSave: $autoSave, offlineMode: $offlineMode, analyticsEnabled: $analyticsEnabled, crashReporting: $crashReporting, customSettings: $customSettings, notificationSettings: $notificationSettings, displaySettings: $displaySettings, privacySettings: $privacySettings, securitySettings: $securitySettings, accessibilitySettings: $accessibilitySettings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppSettingsImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone) &&
            (identical(other.autoSave, autoSave) ||
                other.autoSave == autoSave) &&
            (identical(other.offlineMode, offlineMode) ||
                other.offlineMode == offlineMode) &&
            (identical(other.analyticsEnabled, analyticsEnabled) ||
                other.analyticsEnabled == analyticsEnabled) &&
            (identical(other.crashReporting, crashReporting) ||
                other.crashReporting == crashReporting) &&
            const DeepCollectionEquality()
                .equals(other._customSettings, _customSettings) &&
            (identical(other.notificationSettings, notificationSettings) ||
                other.notificationSettings == notificationSettings) &&
            (identical(other.displaySettings, displaySettings) ||
                other.displaySettings == displaySettings) &&
            (identical(other.privacySettings, privacySettings) ||
                other.privacySettings == privacySettings) &&
            (identical(other.securitySettings, securitySettings) ||
                other.securitySettings == securitySettings) &&
            (identical(other.accessibilitySettings, accessibilitySettings) ||
                other.accessibilitySettings == accessibilitySettings));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      version,
      lastUpdated,
      language,
      theme,
      currency,
      timezone,
      autoSave,
      offlineMode,
      analyticsEnabled,
      crashReporting,
      const DeepCollectionEquality().hash(_customSettings),
      notificationSettings,
      displaySettings,
      privacySettings,
      securitySettings,
      accessibilitySettings);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppSettingsImplCopyWith<_$AppSettingsImpl> get copyWith =>
      __$$AppSettingsImplCopyWithImpl<_$AppSettingsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppSettingsImplToJson(
      this,
    );
  }
}

abstract class _AppSettings implements AppSettings {
  const factory _AppSettings(
      {required final String userId,
      required final String version,
      required final DateTime lastUpdated,
      final String language,
      final String theme,
      final String currency,
      final String timezone,
      final bool autoSave,
      final bool offlineMode,
      final bool analyticsEnabled,
      final bool crashReporting,
      final Map<String, dynamic> customSettings,
      final NotificationSettings? notificationSettings,
      final DisplaySettings? displaySettings,
      final PrivacySettings? privacySettings,
      final SecuritySettings? securitySettings,
      final AccessibilitySettings? accessibilitySettings}) = _$AppSettingsImpl;

  factory _AppSettings.fromJson(Map<String, dynamic> json) =
      _$AppSettingsImpl.fromJson;

  @override
  String get userId;
  @override
  String get version;
  @override
  DateTime get lastUpdated;
  @override
  String get language;
  @override
  String get theme;
  @override
  String get currency;
  @override
  String get timezone;
  @override
  bool get autoSave;
  @override
  bool get offlineMode;
  @override
  bool get analyticsEnabled;
  @override
  bool get crashReporting;
  @override
  Map<String, dynamic> get customSettings;
  @override
  NotificationSettings? get notificationSettings;
  @override
  DisplaySettings? get displaySettings;
  @override
  PrivacySettings? get privacySettings;
  @override
  SecuritySettings? get securitySettings;
  @override
  AccessibilitySettings? get accessibilitySettings;
  @override
  @JsonKey(ignore: true)
  _$$AppSettingsImplCopyWith<_$AppSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NotificationSettings _$NotificationSettingsFromJson(Map<String, dynamic> json) {
  return _NotificationSettings.fromJson(json);
}

/// @nodoc
mixin _$NotificationSettings {
  bool get emailNotifications => throw _privateConstructorUsedError;
  bool get pushNotifications => throw _privateConstructorUsedError;
  bool get smsNotifications => throw _privateConstructorUsedError;
  bool get marketingEmails => throw _privateConstructorUsedError;
  bool get investmentAlerts => throw _privateConstructorUsedError;
  bool get portfolioUpdates => throw _privateConstructorUsedError;
  bool get projectNews => throw _privateConstructorUsedError;
  bool get systemMaintenance => throw _privateConstructorUsedError;
  String get quietHoursStart => throw _privateConstructorUsedError;
  String get quietHoursEnd => throw _privateConstructorUsedError;
  String get quietHoursTimezone => throw _privateConstructorUsedError;
  Map<String, bool> get categoryPreferences =>
      throw _privateConstructorUsedError;
  Map<String, bool> get channelPreferences =>
      throw _privateConstructorUsedError;
  List<String> get mutedKeywords => throw _privateConstructorUsedError;
  List<String> get blockedSenders => throw _privateConstructorUsedError;
  DateTime? get lastUpdated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationSettingsCopyWith<NotificationSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationSettingsCopyWith<$Res> {
  factory $NotificationSettingsCopyWith(NotificationSettings value,
          $Res Function(NotificationSettings) then) =
      _$NotificationSettingsCopyWithImpl<$Res, NotificationSettings>;
  @useResult
  $Res call(
      {bool emailNotifications,
      bool pushNotifications,
      bool smsNotifications,
      bool marketingEmails,
      bool investmentAlerts,
      bool portfolioUpdates,
      bool projectNews,
      bool systemMaintenance,
      String quietHoursStart,
      String quietHoursEnd,
      String quietHoursTimezone,
      Map<String, bool> categoryPreferences,
      Map<String, bool> channelPreferences,
      List<String> mutedKeywords,
      List<String> blockedSenders,
      DateTime? lastUpdated});
}

/// @nodoc
class _$NotificationSettingsCopyWithImpl<$Res,
        $Val extends NotificationSettings>
    implements $NotificationSettingsCopyWith<$Res> {
  _$NotificationSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailNotifications = null,
    Object? pushNotifications = null,
    Object? smsNotifications = null,
    Object? marketingEmails = null,
    Object? investmentAlerts = null,
    Object? portfolioUpdates = null,
    Object? projectNews = null,
    Object? systemMaintenance = null,
    Object? quietHoursStart = null,
    Object? quietHoursEnd = null,
    Object? quietHoursTimezone = null,
    Object? categoryPreferences = null,
    Object? channelPreferences = null,
    Object? mutedKeywords = null,
    Object? blockedSenders = null,
    Object? lastUpdated = freezed,
  }) {
    return _then(_value.copyWith(
      emailNotifications: null == emailNotifications
          ? _value.emailNotifications
          : emailNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      pushNotifications: null == pushNotifications
          ? _value.pushNotifications
          : pushNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      smsNotifications: null == smsNotifications
          ? _value.smsNotifications
          : smsNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      marketingEmails: null == marketingEmails
          ? _value.marketingEmails
          : marketingEmails // ignore: cast_nullable_to_non_nullable
              as bool,
      investmentAlerts: null == investmentAlerts
          ? _value.investmentAlerts
          : investmentAlerts // ignore: cast_nullable_to_non_nullable
              as bool,
      portfolioUpdates: null == portfolioUpdates
          ? _value.portfolioUpdates
          : portfolioUpdates // ignore: cast_nullable_to_non_nullable
              as bool,
      projectNews: null == projectNews
          ? _value.projectNews
          : projectNews // ignore: cast_nullable_to_non_nullable
              as bool,
      systemMaintenance: null == systemMaintenance
          ? _value.systemMaintenance
          : systemMaintenance // ignore: cast_nullable_to_non_nullable
              as bool,
      quietHoursStart: null == quietHoursStart
          ? _value.quietHoursStart
          : quietHoursStart // ignore: cast_nullable_to_non_nullable
              as String,
      quietHoursEnd: null == quietHoursEnd
          ? _value.quietHoursEnd
          : quietHoursEnd // ignore: cast_nullable_to_non_nullable
              as String,
      quietHoursTimezone: null == quietHoursTimezone
          ? _value.quietHoursTimezone
          : quietHoursTimezone // ignore: cast_nullable_to_non_nullable
              as String,
      categoryPreferences: null == categoryPreferences
          ? _value.categoryPreferences
          : categoryPreferences // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      channelPreferences: null == channelPreferences
          ? _value.channelPreferences
          : channelPreferences // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      mutedKeywords: null == mutedKeywords
          ? _value.mutedKeywords
          : mutedKeywords // ignore: cast_nullable_to_non_nullable
              as List<String>,
      blockedSenders: null == blockedSenders
          ? _value.blockedSenders
          : blockedSenders // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationSettingsImplCopyWith<$Res>
    implements $NotificationSettingsCopyWith<$Res> {
  factory _$$NotificationSettingsImplCopyWith(_$NotificationSettingsImpl value,
          $Res Function(_$NotificationSettingsImpl) then) =
      __$$NotificationSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool emailNotifications,
      bool pushNotifications,
      bool smsNotifications,
      bool marketingEmails,
      bool investmentAlerts,
      bool portfolioUpdates,
      bool projectNews,
      bool systemMaintenance,
      String quietHoursStart,
      String quietHoursEnd,
      String quietHoursTimezone,
      Map<String, bool> categoryPreferences,
      Map<String, bool> channelPreferences,
      List<String> mutedKeywords,
      List<String> blockedSenders,
      DateTime? lastUpdated});
}

/// @nodoc
class __$$NotificationSettingsImplCopyWithImpl<$Res>
    extends _$NotificationSettingsCopyWithImpl<$Res, _$NotificationSettingsImpl>
    implements _$$NotificationSettingsImplCopyWith<$Res> {
  __$$NotificationSettingsImplCopyWithImpl(_$NotificationSettingsImpl _value,
      $Res Function(_$NotificationSettingsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailNotifications = null,
    Object? pushNotifications = null,
    Object? smsNotifications = null,
    Object? marketingEmails = null,
    Object? investmentAlerts = null,
    Object? portfolioUpdates = null,
    Object? projectNews = null,
    Object? systemMaintenance = null,
    Object? quietHoursStart = null,
    Object? quietHoursEnd = null,
    Object? quietHoursTimezone = null,
    Object? categoryPreferences = null,
    Object? channelPreferences = null,
    Object? mutedKeywords = null,
    Object? blockedSenders = null,
    Object? lastUpdated = freezed,
  }) {
    return _then(_$NotificationSettingsImpl(
      emailNotifications: null == emailNotifications
          ? _value.emailNotifications
          : emailNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      pushNotifications: null == pushNotifications
          ? _value.pushNotifications
          : pushNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      smsNotifications: null == smsNotifications
          ? _value.smsNotifications
          : smsNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      marketingEmails: null == marketingEmails
          ? _value.marketingEmails
          : marketingEmails // ignore: cast_nullable_to_non_nullable
              as bool,
      investmentAlerts: null == investmentAlerts
          ? _value.investmentAlerts
          : investmentAlerts // ignore: cast_nullable_to_non_nullable
              as bool,
      portfolioUpdates: null == portfolioUpdates
          ? _value.portfolioUpdates
          : portfolioUpdates // ignore: cast_nullable_to_non_nullable
              as bool,
      projectNews: null == projectNews
          ? _value.projectNews
          : projectNews // ignore: cast_nullable_to_non_nullable
              as bool,
      systemMaintenance: null == systemMaintenance
          ? _value.systemMaintenance
          : systemMaintenance // ignore: cast_nullable_to_non_nullable
              as bool,
      quietHoursStart: null == quietHoursStart
          ? _value.quietHoursStart
          : quietHoursStart // ignore: cast_nullable_to_non_nullable
              as String,
      quietHoursEnd: null == quietHoursEnd
          ? _value.quietHoursEnd
          : quietHoursEnd // ignore: cast_nullable_to_non_nullable
              as String,
      quietHoursTimezone: null == quietHoursTimezone
          ? _value.quietHoursTimezone
          : quietHoursTimezone // ignore: cast_nullable_to_non_nullable
              as String,
      categoryPreferences: null == categoryPreferences
          ? _value._categoryPreferences
          : categoryPreferences // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      channelPreferences: null == channelPreferences
          ? _value._channelPreferences
          : channelPreferences // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      mutedKeywords: null == mutedKeywords
          ? _value._mutedKeywords
          : mutedKeywords // ignore: cast_nullable_to_non_nullable
              as List<String>,
      blockedSenders: null == blockedSenders
          ? _value._blockedSenders
          : blockedSenders // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationSettingsImpl implements _NotificationSettings {
  const _$NotificationSettingsImpl(
      {this.emailNotifications = true,
      this.pushNotifications = true,
      this.smsNotifications = true,
      this.marketingEmails = false,
      this.investmentAlerts = true,
      this.portfolioUpdates = true,
      this.projectNews = true,
      this.systemMaintenance = false,
      this.quietHoursStart = '09:00',
      this.quietHoursEnd = '22:00',
      this.quietHoursTimezone = 'Europe/London',
      final Map<String, bool> categoryPreferences = const {},
      final Map<String, bool> channelPreferences = const {},
      final List<String> mutedKeywords = const [],
      final List<String> blockedSenders = const [],
      this.lastUpdated})
      : _categoryPreferences = categoryPreferences,
        _channelPreferences = channelPreferences,
        _mutedKeywords = mutedKeywords,
        _blockedSenders = blockedSenders;

  factory _$NotificationSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationSettingsImplFromJson(json);

  @override
  @JsonKey()
  final bool emailNotifications;
  @override
  @JsonKey()
  final bool pushNotifications;
  @override
  @JsonKey()
  final bool smsNotifications;
  @override
  @JsonKey()
  final bool marketingEmails;
  @override
  @JsonKey()
  final bool investmentAlerts;
  @override
  @JsonKey()
  final bool portfolioUpdates;
  @override
  @JsonKey()
  final bool projectNews;
  @override
  @JsonKey()
  final bool systemMaintenance;
  @override
  @JsonKey()
  final String quietHoursStart;
  @override
  @JsonKey()
  final String quietHoursEnd;
  @override
  @JsonKey()
  final String quietHoursTimezone;
  final Map<String, bool> _categoryPreferences;
  @override
  @JsonKey()
  Map<String, bool> get categoryPreferences {
    if (_categoryPreferences is EqualUnmodifiableMapView)
      return _categoryPreferences;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_categoryPreferences);
  }

  final Map<String, bool> _channelPreferences;
  @override
  @JsonKey()
  Map<String, bool> get channelPreferences {
    if (_channelPreferences is EqualUnmodifiableMapView)
      return _channelPreferences;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_channelPreferences);
  }

  final List<String> _mutedKeywords;
  @override
  @JsonKey()
  List<String> get mutedKeywords {
    if (_mutedKeywords is EqualUnmodifiableListView) return _mutedKeywords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mutedKeywords);
  }

  final List<String> _blockedSenders;
  @override
  @JsonKey()
  List<String> get blockedSenders {
    if (_blockedSenders is EqualUnmodifiableListView) return _blockedSenders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_blockedSenders);
  }

  @override
  final DateTime? lastUpdated;

  @override
  String toString() {
    return 'NotificationSettings(emailNotifications: $emailNotifications, pushNotifications: $pushNotifications, smsNotifications: $smsNotifications, marketingEmails: $marketingEmails, investmentAlerts: $investmentAlerts, portfolioUpdates: $portfolioUpdates, projectNews: $projectNews, systemMaintenance: $systemMaintenance, quietHoursStart: $quietHoursStart, quietHoursEnd: $quietHoursEnd, quietHoursTimezone: $quietHoursTimezone, categoryPreferences: $categoryPreferences, channelPreferences: $channelPreferences, mutedKeywords: $mutedKeywords, blockedSenders: $blockedSenders, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationSettingsImpl &&
            (identical(other.emailNotifications, emailNotifications) ||
                other.emailNotifications == emailNotifications) &&
            (identical(other.pushNotifications, pushNotifications) ||
                other.pushNotifications == pushNotifications) &&
            (identical(other.smsNotifications, smsNotifications) ||
                other.smsNotifications == smsNotifications) &&
            (identical(other.marketingEmails, marketingEmails) ||
                other.marketingEmails == marketingEmails) &&
            (identical(other.investmentAlerts, investmentAlerts) ||
                other.investmentAlerts == investmentAlerts) &&
            (identical(other.portfolioUpdates, portfolioUpdates) ||
                other.portfolioUpdates == portfolioUpdates) &&
            (identical(other.projectNews, projectNews) ||
                other.projectNews == projectNews) &&
            (identical(other.systemMaintenance, systemMaintenance) ||
                other.systemMaintenance == systemMaintenance) &&
            (identical(other.quietHoursStart, quietHoursStart) ||
                other.quietHoursStart == quietHoursStart) &&
            (identical(other.quietHoursEnd, quietHoursEnd) ||
                other.quietHoursEnd == quietHoursEnd) &&
            (identical(other.quietHoursTimezone, quietHoursTimezone) ||
                other.quietHoursTimezone == quietHoursTimezone) &&
            const DeepCollectionEquality()
                .equals(other._categoryPreferences, _categoryPreferences) &&
            const DeepCollectionEquality()
                .equals(other._channelPreferences, _channelPreferences) &&
            const DeepCollectionEquality()
                .equals(other._mutedKeywords, _mutedKeywords) &&
            const DeepCollectionEquality()
                .equals(other._blockedSenders, _blockedSenders) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      emailNotifications,
      pushNotifications,
      smsNotifications,
      marketingEmails,
      investmentAlerts,
      portfolioUpdates,
      projectNews,
      systemMaintenance,
      quietHoursStart,
      quietHoursEnd,
      quietHoursTimezone,
      const DeepCollectionEquality().hash(_categoryPreferences),
      const DeepCollectionEquality().hash(_channelPreferences),
      const DeepCollectionEquality().hash(_mutedKeywords),
      const DeepCollectionEquality().hash(_blockedSenders),
      lastUpdated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationSettingsImplCopyWith<_$NotificationSettingsImpl>
      get copyWith =>
          __$$NotificationSettingsImplCopyWithImpl<_$NotificationSettingsImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationSettingsImplToJson(
      this,
    );
  }
}

abstract class _NotificationSettings implements NotificationSettings {
  const factory _NotificationSettings(
      {final bool emailNotifications,
      final bool pushNotifications,
      final bool smsNotifications,
      final bool marketingEmails,
      final bool investmentAlerts,
      final bool portfolioUpdates,
      final bool projectNews,
      final bool systemMaintenance,
      final String quietHoursStart,
      final String quietHoursEnd,
      final String quietHoursTimezone,
      final Map<String, bool> categoryPreferences,
      final Map<String, bool> channelPreferences,
      final List<String> mutedKeywords,
      final List<String> blockedSenders,
      final DateTime? lastUpdated}) = _$NotificationSettingsImpl;

  factory _NotificationSettings.fromJson(Map<String, dynamic> json) =
      _$NotificationSettingsImpl.fromJson;

  @override
  bool get emailNotifications;
  @override
  bool get pushNotifications;
  @override
  bool get smsNotifications;
  @override
  bool get marketingEmails;
  @override
  bool get investmentAlerts;
  @override
  bool get portfolioUpdates;
  @override
  bool get projectNews;
  @override
  bool get systemMaintenance;
  @override
  String get quietHoursStart;
  @override
  String get quietHoursEnd;
  @override
  String get quietHoursTimezone;
  @override
  Map<String, bool> get categoryPreferences;
  @override
  Map<String, bool> get channelPreferences;
  @override
  List<String> get mutedKeywords;
  @override
  List<String> get blockedSenders;
  @override
  DateTime? get lastUpdated;
  @override
  @JsonKey(ignore: true)
  _$$NotificationSettingsImplCopyWith<_$NotificationSettingsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DisplaySettings _$DisplaySettingsFromJson(Map<String, dynamic> json) {
  return _DisplaySettings.fromJson(json);
}

/// @nodoc
mixin _$DisplaySettings {
  String get themeMode =>
      throw _privateConstructorUsedError; // light, dark, system
  String get accentColor => throw _privateConstructorUsedError;
  bool get highContrast => throw _privateConstructorUsedError;
  bool get reducedMotion => throw _privateConstructorUsedError;
  double get textScaling => throw _privateConstructorUsedError;
  double get interfaceScale => throw _privateConstructorUsedError;
  bool get showAnimations => throw _privateConstructorUsedError;
  bool get showThumbnails => throw _privateConstructorUsedError;
  String get density =>
      throw _privateConstructorUsedError; // compact, comfortable, spacious
  String get defaultView =>
      throw _privateConstructorUsedError; // list, grid, cards
  int get itemsPerPage => throw _privateConstructorUsedError;
  bool get showTooltips => throw _privateConstructorUsedError;
  bool get debugMode => throw _privateConstructorUsedError;
  DateTime? get lastUpdated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DisplaySettingsCopyWith<DisplaySettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DisplaySettingsCopyWith<$Res> {
  factory $DisplaySettingsCopyWith(
          DisplaySettings value, $Res Function(DisplaySettings) then) =
      _$DisplaySettingsCopyWithImpl<$Res, DisplaySettings>;
  @useResult
  $Res call(
      {String themeMode,
      String accentColor,
      bool highContrast,
      bool reducedMotion,
      double textScaling,
      double interfaceScale,
      bool showAnimations,
      bool showThumbnails,
      String density,
      String defaultView,
      int itemsPerPage,
      bool showTooltips,
      bool debugMode,
      DateTime? lastUpdated});
}

/// @nodoc
class _$DisplaySettingsCopyWithImpl<$Res, $Val extends DisplaySettings>
    implements $DisplaySettingsCopyWith<$Res> {
  _$DisplaySettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeMode = null,
    Object? accentColor = null,
    Object? highContrast = null,
    Object? reducedMotion = null,
    Object? textScaling = null,
    Object? interfaceScale = null,
    Object? showAnimations = null,
    Object? showThumbnails = null,
    Object? density = null,
    Object? defaultView = null,
    Object? itemsPerPage = null,
    Object? showTooltips = null,
    Object? debugMode = null,
    Object? lastUpdated = freezed,
  }) {
    return _then(_value.copyWith(
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as String,
      accentColor: null == accentColor
          ? _value.accentColor
          : accentColor // ignore: cast_nullable_to_non_nullable
              as String,
      highContrast: null == highContrast
          ? _value.highContrast
          : highContrast // ignore: cast_nullable_to_non_nullable
              as bool,
      reducedMotion: null == reducedMotion
          ? _value.reducedMotion
          : reducedMotion // ignore: cast_nullable_to_non_nullable
              as bool,
      textScaling: null == textScaling
          ? _value.textScaling
          : textScaling // ignore: cast_nullable_to_non_nullable
              as double,
      interfaceScale: null == interfaceScale
          ? _value.interfaceScale
          : interfaceScale // ignore: cast_nullable_to_non_nullable
              as double,
      showAnimations: null == showAnimations
          ? _value.showAnimations
          : showAnimations // ignore: cast_nullable_to_non_nullable
              as bool,
      showThumbnails: null == showThumbnails
          ? _value.showThumbnails
          : showThumbnails // ignore: cast_nullable_to_non_nullable
              as bool,
      density: null == density
          ? _value.density
          : density // ignore: cast_nullable_to_non_nullable
              as String,
      defaultView: null == defaultView
          ? _value.defaultView
          : defaultView // ignore: cast_nullable_to_non_nullable
              as String,
      itemsPerPage: null == itemsPerPage
          ? _value.itemsPerPage
          : itemsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
      showTooltips: null == showTooltips
          ? _value.showTooltips
          : showTooltips // ignore: cast_nullable_to_non_nullable
              as bool,
      debugMode: null == debugMode
          ? _value.debugMode
          : debugMode // ignore: cast_nullable_to_non_nullable
              as bool,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DisplaySettingsImplCopyWith<$Res>
    implements $DisplaySettingsCopyWith<$Res> {
  factory _$$DisplaySettingsImplCopyWith(_$DisplaySettingsImpl value,
          $Res Function(_$DisplaySettingsImpl) then) =
      __$$DisplaySettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String themeMode,
      String accentColor,
      bool highContrast,
      bool reducedMotion,
      double textScaling,
      double interfaceScale,
      bool showAnimations,
      bool showThumbnails,
      String density,
      String defaultView,
      int itemsPerPage,
      bool showTooltips,
      bool debugMode,
      DateTime? lastUpdated});
}

/// @nodoc
class __$$DisplaySettingsImplCopyWithImpl<$Res>
    extends _$DisplaySettingsCopyWithImpl<$Res, _$DisplaySettingsImpl>
    implements _$$DisplaySettingsImplCopyWith<$Res> {
  __$$DisplaySettingsImplCopyWithImpl(
      _$DisplaySettingsImpl _value, $Res Function(_$DisplaySettingsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeMode = null,
    Object? accentColor = null,
    Object? highContrast = null,
    Object? reducedMotion = null,
    Object? textScaling = null,
    Object? interfaceScale = null,
    Object? showAnimations = null,
    Object? showThumbnails = null,
    Object? density = null,
    Object? defaultView = null,
    Object? itemsPerPage = null,
    Object? showTooltips = null,
    Object? debugMode = null,
    Object? lastUpdated = freezed,
  }) {
    return _then(_$DisplaySettingsImpl(
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as String,
      accentColor: null == accentColor
          ? _value.accentColor
          : accentColor // ignore: cast_nullable_to_non_nullable
              as String,
      highContrast: null == highContrast
          ? _value.highContrast
          : highContrast // ignore: cast_nullable_to_non_nullable
              as bool,
      reducedMotion: null == reducedMotion
          ? _value.reducedMotion
          : reducedMotion // ignore: cast_nullable_to_non_nullable
              as bool,
      textScaling: null == textScaling
          ? _value.textScaling
          : textScaling // ignore: cast_nullable_to_non_nullable
              as double,
      interfaceScale: null == interfaceScale
          ? _value.interfaceScale
          : interfaceScale // ignore: cast_nullable_to_non_nullable
              as double,
      showAnimations: null == showAnimations
          ? _value.showAnimations
          : showAnimations // ignore: cast_nullable_to_non_nullable
              as bool,
      showThumbnails: null == showThumbnails
          ? _value.showThumbnails
          : showThumbnails // ignore: cast_nullable_to_non_nullable
              as bool,
      density: null == density
          ? _value.density
          : density // ignore: cast_nullable_to_non_nullable
              as String,
      defaultView: null == defaultView
          ? _value.defaultView
          : defaultView // ignore: cast_nullable_to_non_nullable
              as String,
      itemsPerPage: null == itemsPerPage
          ? _value.itemsPerPage
          : itemsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
      showTooltips: null == showTooltips
          ? _value.showTooltips
          : showTooltips // ignore: cast_nullable_to_non_nullable
              as bool,
      debugMode: null == debugMode
          ? _value.debugMode
          : debugMode // ignore: cast_nullable_to_non_nullable
              as bool,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DisplaySettingsImpl implements _DisplaySettings {
  const _$DisplaySettingsImpl(
      {this.themeMode = 'system',
      this.accentColor = 'blue',
      this.highContrast = false,
      this.reducedMotion = false,
      this.textScaling = 1.0,
      this.interfaceScale = 1.0,
      this.showAnimations = true,
      this.showThumbnails = true,
      this.density = 'comfortable',
      this.defaultView = 'grid',
      this.itemsPerPage = 50,
      this.showTooltips = true,
      this.debugMode = false,
      this.lastUpdated});

  factory _$DisplaySettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$DisplaySettingsImplFromJson(json);

  @override
  @JsonKey()
  final String themeMode;
// light, dark, system
  @override
  @JsonKey()
  final String accentColor;
  @override
  @JsonKey()
  final bool highContrast;
  @override
  @JsonKey()
  final bool reducedMotion;
  @override
  @JsonKey()
  final double textScaling;
  @override
  @JsonKey()
  final double interfaceScale;
  @override
  @JsonKey()
  final bool showAnimations;
  @override
  @JsonKey()
  final bool showThumbnails;
  @override
  @JsonKey()
  final String density;
// compact, comfortable, spacious
  @override
  @JsonKey()
  final String defaultView;
// list, grid, cards
  @override
  @JsonKey()
  final int itemsPerPage;
  @override
  @JsonKey()
  final bool showTooltips;
  @override
  @JsonKey()
  final bool debugMode;
  @override
  final DateTime? lastUpdated;

  @override
  String toString() {
    return 'DisplaySettings(themeMode: $themeMode, accentColor: $accentColor, highContrast: $highContrast, reducedMotion: $reducedMotion, textScaling: $textScaling, interfaceScale: $interfaceScale, showAnimations: $showAnimations, showThumbnails: $showThumbnails, density: $density, defaultView: $defaultView, itemsPerPage: $itemsPerPage, showTooltips: $showTooltips, debugMode: $debugMode, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DisplaySettingsImpl &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode) &&
            (identical(other.accentColor, accentColor) ||
                other.accentColor == accentColor) &&
            (identical(other.highContrast, highContrast) ||
                other.highContrast == highContrast) &&
            (identical(other.reducedMotion, reducedMotion) ||
                other.reducedMotion == reducedMotion) &&
            (identical(other.textScaling, textScaling) ||
                other.textScaling == textScaling) &&
            (identical(other.interfaceScale, interfaceScale) ||
                other.interfaceScale == interfaceScale) &&
            (identical(other.showAnimations, showAnimations) ||
                other.showAnimations == showAnimations) &&
            (identical(other.showThumbnails, showThumbnails) ||
                other.showThumbnails == showThumbnails) &&
            (identical(other.density, density) || other.density == density) &&
            (identical(other.defaultView, defaultView) ||
                other.defaultView == defaultView) &&
            (identical(other.itemsPerPage, itemsPerPage) ||
                other.itemsPerPage == itemsPerPage) &&
            (identical(other.showTooltips, showTooltips) ||
                other.showTooltips == showTooltips) &&
            (identical(other.debugMode, debugMode) ||
                other.debugMode == debugMode) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      themeMode,
      accentColor,
      highContrast,
      reducedMotion,
      textScaling,
      interfaceScale,
      showAnimations,
      showThumbnails,
      density,
      defaultView,
      itemsPerPage,
      showTooltips,
      debugMode,
      lastUpdated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DisplaySettingsImplCopyWith<_$DisplaySettingsImpl> get copyWith =>
      __$$DisplaySettingsImplCopyWithImpl<_$DisplaySettingsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DisplaySettingsImplToJson(
      this,
    );
  }
}

abstract class _DisplaySettings implements DisplaySettings {
  const factory _DisplaySettings(
      {final String themeMode,
      final String accentColor,
      final bool highContrast,
      final bool reducedMotion,
      final double textScaling,
      final double interfaceScale,
      final bool showAnimations,
      final bool showThumbnails,
      final String density,
      final String defaultView,
      final int itemsPerPage,
      final bool showTooltips,
      final bool debugMode,
      final DateTime? lastUpdated}) = _$DisplaySettingsImpl;

  factory _DisplaySettings.fromJson(Map<String, dynamic> json) =
      _$DisplaySettingsImpl.fromJson;

  @override
  String get themeMode;
  @override // light, dark, system
  String get accentColor;
  @override
  bool get highContrast;
  @override
  bool get reducedMotion;
  @override
  double get textScaling;
  @override
  double get interfaceScale;
  @override
  bool get showAnimations;
  @override
  bool get showThumbnails;
  @override
  String get density;
  @override // compact, comfortable, spacious
  String get defaultView;
  @override // list, grid, cards
  int get itemsPerPage;
  @override
  bool get showTooltips;
  @override
  bool get debugMode;
  @override
  DateTime? get lastUpdated;
  @override
  @JsonKey(ignore: true)
  _$$DisplaySettingsImplCopyWith<_$DisplaySettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PrivacySettings _$PrivacySettingsFromJson(Map<String, dynamic> json) {
  return _PrivacySettings.fromJson(json);
}

/// @nodoc
mixin _$PrivacySettings {
  bool get profileVisibility => throw _privateConstructorUsedError;
  bool get showOnlineStatus => throw _privateConstructorUsedError;
  bool get shareAnalytics => throw _privateConstructorUsedError;
  bool get allowTracking => throw _privateConstructorUsedError;
  bool get cookieConsent => throw _privateConstructorUsedError;
  bool get shareUsageData => throw _privateConstructorUsedError;
  List<String> get blockedUsers => throw _privateConstructorUsedError;
  List<String> get trustedDomains => throw _privateConstructorUsedError;
  String get defaultPrivacyLevel =>
      throw _privateConstructorUsedError; // public, friends, private
  bool get showInSearchResults => throw _privateConstructorUsedError;
  bool get allowDirectMessages => throw _privateConstructorUsedError;
  bool get shareLocation => throw _privateConstructorUsedError;
  Map<String, bool> get dataSharing => throw _privateConstructorUsedError;
  DateTime? get lastUpdated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PrivacySettingsCopyWith<PrivacySettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrivacySettingsCopyWith<$Res> {
  factory $PrivacySettingsCopyWith(
          PrivacySettings value, $Res Function(PrivacySettings) then) =
      _$PrivacySettingsCopyWithImpl<$Res, PrivacySettings>;
  @useResult
  $Res call(
      {bool profileVisibility,
      bool showOnlineStatus,
      bool shareAnalytics,
      bool allowTracking,
      bool cookieConsent,
      bool shareUsageData,
      List<String> blockedUsers,
      List<String> trustedDomains,
      String defaultPrivacyLevel,
      bool showInSearchResults,
      bool allowDirectMessages,
      bool shareLocation,
      Map<String, bool> dataSharing,
      DateTime? lastUpdated});
}

/// @nodoc
class _$PrivacySettingsCopyWithImpl<$Res, $Val extends PrivacySettings>
    implements $PrivacySettingsCopyWith<$Res> {
  _$PrivacySettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profileVisibility = null,
    Object? showOnlineStatus = null,
    Object? shareAnalytics = null,
    Object? allowTracking = null,
    Object? cookieConsent = null,
    Object? shareUsageData = null,
    Object? blockedUsers = null,
    Object? trustedDomains = null,
    Object? defaultPrivacyLevel = null,
    Object? showInSearchResults = null,
    Object? allowDirectMessages = null,
    Object? shareLocation = null,
    Object? dataSharing = null,
    Object? lastUpdated = freezed,
  }) {
    return _then(_value.copyWith(
      profileVisibility: null == profileVisibility
          ? _value.profileVisibility
          : profileVisibility // ignore: cast_nullable_to_non_nullable
              as bool,
      showOnlineStatus: null == showOnlineStatus
          ? _value.showOnlineStatus
          : showOnlineStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      shareAnalytics: null == shareAnalytics
          ? _value.shareAnalytics
          : shareAnalytics // ignore: cast_nullable_to_non_nullable
              as bool,
      allowTracking: null == allowTracking
          ? _value.allowTracking
          : allowTracking // ignore: cast_nullable_to_non_nullable
              as bool,
      cookieConsent: null == cookieConsent
          ? _value.cookieConsent
          : cookieConsent // ignore: cast_nullable_to_non_nullable
              as bool,
      shareUsageData: null == shareUsageData
          ? _value.shareUsageData
          : shareUsageData // ignore: cast_nullable_to_non_nullable
              as bool,
      blockedUsers: null == blockedUsers
          ? _value.blockedUsers
          : blockedUsers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      trustedDomains: null == trustedDomains
          ? _value.trustedDomains
          : trustedDomains // ignore: cast_nullable_to_non_nullable
              as List<String>,
      defaultPrivacyLevel: null == defaultPrivacyLevel
          ? _value.defaultPrivacyLevel
          : defaultPrivacyLevel // ignore: cast_nullable_to_non_nullable
              as String,
      showInSearchResults: null == showInSearchResults
          ? _value.showInSearchResults
          : showInSearchResults // ignore: cast_nullable_to_non_nullable
              as bool,
      allowDirectMessages: null == allowDirectMessages
          ? _value.allowDirectMessages
          : allowDirectMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      shareLocation: null == shareLocation
          ? _value.shareLocation
          : shareLocation // ignore: cast_nullable_to_non_nullable
              as bool,
      dataSharing: null == dataSharing
          ? _value.dataSharing
          : dataSharing // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PrivacySettingsImplCopyWith<$Res>
    implements $PrivacySettingsCopyWith<$Res> {
  factory _$$PrivacySettingsImplCopyWith(_$PrivacySettingsImpl value,
          $Res Function(_$PrivacySettingsImpl) then) =
      __$$PrivacySettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool profileVisibility,
      bool showOnlineStatus,
      bool shareAnalytics,
      bool allowTracking,
      bool cookieConsent,
      bool shareUsageData,
      List<String> blockedUsers,
      List<String> trustedDomains,
      String defaultPrivacyLevel,
      bool showInSearchResults,
      bool allowDirectMessages,
      bool shareLocation,
      Map<String, bool> dataSharing,
      DateTime? lastUpdated});
}

/// @nodoc
class __$$PrivacySettingsImplCopyWithImpl<$Res>
    extends _$PrivacySettingsCopyWithImpl<$Res, _$PrivacySettingsImpl>
    implements _$$PrivacySettingsImplCopyWith<$Res> {
  __$$PrivacySettingsImplCopyWithImpl(
      _$PrivacySettingsImpl _value, $Res Function(_$PrivacySettingsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profileVisibility = null,
    Object? showOnlineStatus = null,
    Object? shareAnalytics = null,
    Object? allowTracking = null,
    Object? cookieConsent = null,
    Object? shareUsageData = null,
    Object? blockedUsers = null,
    Object? trustedDomains = null,
    Object? defaultPrivacyLevel = null,
    Object? showInSearchResults = null,
    Object? allowDirectMessages = null,
    Object? shareLocation = null,
    Object? dataSharing = null,
    Object? lastUpdated = freezed,
  }) {
    return _then(_$PrivacySettingsImpl(
      profileVisibility: null == profileVisibility
          ? _value.profileVisibility
          : profileVisibility // ignore: cast_nullable_to_non_nullable
              as bool,
      showOnlineStatus: null == showOnlineStatus
          ? _value.showOnlineStatus
          : showOnlineStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      shareAnalytics: null == shareAnalytics
          ? _value.shareAnalytics
          : shareAnalytics // ignore: cast_nullable_to_non_nullable
              as bool,
      allowTracking: null == allowTracking
          ? _value.allowTracking
          : allowTracking // ignore: cast_nullable_to_non_nullable
              as bool,
      cookieConsent: null == cookieConsent
          ? _value.cookieConsent
          : cookieConsent // ignore: cast_nullable_to_non_nullable
              as bool,
      shareUsageData: null == shareUsageData
          ? _value.shareUsageData
          : shareUsageData // ignore: cast_nullable_to_non_nullable
              as bool,
      blockedUsers: null == blockedUsers
          ? _value._blockedUsers
          : blockedUsers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      trustedDomains: null == trustedDomains
          ? _value._trustedDomains
          : trustedDomains // ignore: cast_nullable_to_non_nullable
              as List<String>,
      defaultPrivacyLevel: null == defaultPrivacyLevel
          ? _value.defaultPrivacyLevel
          : defaultPrivacyLevel // ignore: cast_nullable_to_non_nullable
              as String,
      showInSearchResults: null == showInSearchResults
          ? _value.showInSearchResults
          : showInSearchResults // ignore: cast_nullable_to_non_nullable
              as bool,
      allowDirectMessages: null == allowDirectMessages
          ? _value.allowDirectMessages
          : allowDirectMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      shareLocation: null == shareLocation
          ? _value.shareLocation
          : shareLocation // ignore: cast_nullable_to_non_nullable
              as bool,
      dataSharing: null == dataSharing
          ? _value._dataSharing
          : dataSharing // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PrivacySettingsImpl implements _PrivacySettings {
  const _$PrivacySettingsImpl(
      {this.profileVisibility = true,
      this.showOnlineStatus = true,
      this.shareAnalytics = false,
      this.allowTracking = false,
      this.cookieConsent = true,
      this.shareUsageData = false,
      final List<String> blockedUsers = const [],
      final List<String> trustedDomains = const [],
      this.defaultPrivacyLevel = 'friends',
      this.showInSearchResults = true,
      this.allowDirectMessages = false,
      this.shareLocation = false,
      final Map<String, bool> dataSharing = const {},
      this.lastUpdated})
      : _blockedUsers = blockedUsers,
        _trustedDomains = trustedDomains,
        _dataSharing = dataSharing;

  factory _$PrivacySettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrivacySettingsImplFromJson(json);

  @override
  @JsonKey()
  final bool profileVisibility;
  @override
  @JsonKey()
  final bool showOnlineStatus;
  @override
  @JsonKey()
  final bool shareAnalytics;
  @override
  @JsonKey()
  final bool allowTracking;
  @override
  @JsonKey()
  final bool cookieConsent;
  @override
  @JsonKey()
  final bool shareUsageData;
  final List<String> _blockedUsers;
  @override
  @JsonKey()
  List<String> get blockedUsers {
    if (_blockedUsers is EqualUnmodifiableListView) return _blockedUsers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_blockedUsers);
  }

  final List<String> _trustedDomains;
  @override
  @JsonKey()
  List<String> get trustedDomains {
    if (_trustedDomains is EqualUnmodifiableListView) return _trustedDomains;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_trustedDomains);
  }

  @override
  @JsonKey()
  final String defaultPrivacyLevel;
// public, friends, private
  @override
  @JsonKey()
  final bool showInSearchResults;
  @override
  @JsonKey()
  final bool allowDirectMessages;
  @override
  @JsonKey()
  final bool shareLocation;
  final Map<String, bool> _dataSharing;
  @override
  @JsonKey()
  Map<String, bool> get dataSharing {
    if (_dataSharing is EqualUnmodifiableMapView) return _dataSharing;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_dataSharing);
  }

  @override
  final DateTime? lastUpdated;

  @override
  String toString() {
    return 'PrivacySettings(profileVisibility: $profileVisibility, showOnlineStatus: $showOnlineStatus, shareAnalytics: $shareAnalytics, allowTracking: $allowTracking, cookieConsent: $cookieConsent, shareUsageData: $shareUsageData, blockedUsers: $blockedUsers, trustedDomains: $trustedDomains, defaultPrivacyLevel: $defaultPrivacyLevel, showInSearchResults: $showInSearchResults, allowDirectMessages: $allowDirectMessages, shareLocation: $shareLocation, dataSharing: $dataSharing, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrivacySettingsImpl &&
            (identical(other.profileVisibility, profileVisibility) ||
                other.profileVisibility == profileVisibility) &&
            (identical(other.showOnlineStatus, showOnlineStatus) ||
                other.showOnlineStatus == showOnlineStatus) &&
            (identical(other.shareAnalytics, shareAnalytics) ||
                other.shareAnalytics == shareAnalytics) &&
            (identical(other.allowTracking, allowTracking) ||
                other.allowTracking == allowTracking) &&
            (identical(other.cookieConsent, cookieConsent) ||
                other.cookieConsent == cookieConsent) &&
            (identical(other.shareUsageData, shareUsageData) ||
                other.shareUsageData == shareUsageData) &&
            const DeepCollectionEquality()
                .equals(other._blockedUsers, _blockedUsers) &&
            const DeepCollectionEquality()
                .equals(other._trustedDomains, _trustedDomains) &&
            (identical(other.defaultPrivacyLevel, defaultPrivacyLevel) ||
                other.defaultPrivacyLevel == defaultPrivacyLevel) &&
            (identical(other.showInSearchResults, showInSearchResults) ||
                other.showInSearchResults == showInSearchResults) &&
            (identical(other.allowDirectMessages, allowDirectMessages) ||
                other.allowDirectMessages == allowDirectMessages) &&
            (identical(other.shareLocation, shareLocation) ||
                other.shareLocation == shareLocation) &&
            const DeepCollectionEquality()
                .equals(other._dataSharing, _dataSharing) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      profileVisibility,
      showOnlineStatus,
      shareAnalytics,
      allowTracking,
      cookieConsent,
      shareUsageData,
      const DeepCollectionEquality().hash(_blockedUsers),
      const DeepCollectionEquality().hash(_trustedDomains),
      defaultPrivacyLevel,
      showInSearchResults,
      allowDirectMessages,
      shareLocation,
      const DeepCollectionEquality().hash(_dataSharing),
      lastUpdated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PrivacySettingsImplCopyWith<_$PrivacySettingsImpl> get copyWith =>
      __$$PrivacySettingsImplCopyWithImpl<_$PrivacySettingsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PrivacySettingsImplToJson(
      this,
    );
  }
}

abstract class _PrivacySettings implements PrivacySettings {
  const factory _PrivacySettings(
      {final bool profileVisibility,
      final bool showOnlineStatus,
      final bool shareAnalytics,
      final bool allowTracking,
      final bool cookieConsent,
      final bool shareUsageData,
      final List<String> blockedUsers,
      final List<String> trustedDomains,
      final String defaultPrivacyLevel,
      final bool showInSearchResults,
      final bool allowDirectMessages,
      final bool shareLocation,
      final Map<String, bool> dataSharing,
      final DateTime? lastUpdated}) = _$PrivacySettingsImpl;

  factory _PrivacySettings.fromJson(Map<String, dynamic> json) =
      _$PrivacySettingsImpl.fromJson;

  @override
  bool get profileVisibility;
  @override
  bool get showOnlineStatus;
  @override
  bool get shareAnalytics;
  @override
  bool get allowTracking;
  @override
  bool get cookieConsent;
  @override
  bool get shareUsageData;
  @override
  List<String> get blockedUsers;
  @override
  List<String> get trustedDomains;
  @override
  String get defaultPrivacyLevel;
  @override // public, friends, private
  bool get showInSearchResults;
  @override
  bool get allowDirectMessages;
  @override
  bool get shareLocation;
  @override
  Map<String, bool> get dataSharing;
  @override
  DateTime? get lastUpdated;
  @override
  @JsonKey(ignore: true)
  _$$PrivacySettingsImplCopyWith<_$PrivacySettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SecuritySettings _$SecuritySettingsFromJson(Map<String, dynamic> json) {
  return _SecuritySettings.fromJson(json);
}

/// @nodoc
mixin _$SecuritySettings {
  bool get twoFactorEnabled => throw _privateConstructorUsedError;
  bool get biometricAuth => throw _privateConstructorUsedError;
  bool get emailVerificationRequired => throw _privateConstructorUsedError;
  int get sessionTimeout => throw _privateConstructorUsedError; // minutes
  int get passwordExpiryDays => throw _privateConstructorUsedError;
  int get maxLoginAttempts => throw _privateConstructorUsedError;
  bool get requireStrongPassword => throw _privateConstructorUsedError;
  bool get logSecurityEvents => throw _privateConstructorUsedError;
  List<String> get trustedDevices => throw _privateConstructorUsedError;
  List<String> get authorizedApplications => throw _privateConstructorUsedError;
  Map<String, bool> get permissionSettings =>
      throw _privateConstructorUsedError;
  String? get recoveryEmail => throw _privateConstructorUsedError;
  String? get recoveryPhone => throw _privateConstructorUsedError;
  DateTime? get lastPasswordChange => throw _privateConstructorUsedError;
  DateTime? get lastSecurityReview => throw _privateConstructorUsedError;
  DateTime? get lastUpdated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SecuritySettingsCopyWith<SecuritySettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SecuritySettingsCopyWith<$Res> {
  factory $SecuritySettingsCopyWith(
          SecuritySettings value, $Res Function(SecuritySettings) then) =
      _$SecuritySettingsCopyWithImpl<$Res, SecuritySettings>;
  @useResult
  $Res call(
      {bool twoFactorEnabled,
      bool biometricAuth,
      bool emailVerificationRequired,
      int sessionTimeout,
      int passwordExpiryDays,
      int maxLoginAttempts,
      bool requireStrongPassword,
      bool logSecurityEvents,
      List<String> trustedDevices,
      List<String> authorizedApplications,
      Map<String, bool> permissionSettings,
      String? recoveryEmail,
      String? recoveryPhone,
      DateTime? lastPasswordChange,
      DateTime? lastSecurityReview,
      DateTime? lastUpdated});
}

/// @nodoc
class _$SecuritySettingsCopyWithImpl<$Res, $Val extends SecuritySettings>
    implements $SecuritySettingsCopyWith<$Res> {
  _$SecuritySettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? twoFactorEnabled = null,
    Object? biometricAuth = null,
    Object? emailVerificationRequired = null,
    Object? sessionTimeout = null,
    Object? passwordExpiryDays = null,
    Object? maxLoginAttempts = null,
    Object? requireStrongPassword = null,
    Object? logSecurityEvents = null,
    Object? trustedDevices = null,
    Object? authorizedApplications = null,
    Object? permissionSettings = null,
    Object? recoveryEmail = freezed,
    Object? recoveryPhone = freezed,
    Object? lastPasswordChange = freezed,
    Object? lastSecurityReview = freezed,
    Object? lastUpdated = freezed,
  }) {
    return _then(_value.copyWith(
      twoFactorEnabled: null == twoFactorEnabled
          ? _value.twoFactorEnabled
          : twoFactorEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      biometricAuth: null == biometricAuth
          ? _value.biometricAuth
          : biometricAuth // ignore: cast_nullable_to_non_nullable
              as bool,
      emailVerificationRequired: null == emailVerificationRequired
          ? _value.emailVerificationRequired
          : emailVerificationRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      sessionTimeout: null == sessionTimeout
          ? _value.sessionTimeout
          : sessionTimeout // ignore: cast_nullable_to_non_nullable
              as int,
      passwordExpiryDays: null == passwordExpiryDays
          ? _value.passwordExpiryDays
          : passwordExpiryDays // ignore: cast_nullable_to_non_nullable
              as int,
      maxLoginAttempts: null == maxLoginAttempts
          ? _value.maxLoginAttempts
          : maxLoginAttempts // ignore: cast_nullable_to_non_nullable
              as int,
      requireStrongPassword: null == requireStrongPassword
          ? _value.requireStrongPassword
          : requireStrongPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      logSecurityEvents: null == logSecurityEvents
          ? _value.logSecurityEvents
          : logSecurityEvents // ignore: cast_nullable_to_non_nullable
              as bool,
      trustedDevices: null == trustedDevices
          ? _value.trustedDevices
          : trustedDevices // ignore: cast_nullable_to_non_nullable
              as List<String>,
      authorizedApplications: null == authorizedApplications
          ? _value.authorizedApplications
          : authorizedApplications // ignore: cast_nullable_to_non_nullable
              as List<String>,
      permissionSettings: null == permissionSettings
          ? _value.permissionSettings
          : permissionSettings // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      recoveryEmail: freezed == recoveryEmail
          ? _value.recoveryEmail
          : recoveryEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      recoveryPhone: freezed == recoveryPhone
          ? _value.recoveryPhone
          : recoveryPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      lastPasswordChange: freezed == lastPasswordChange
          ? _value.lastPasswordChange
          : lastPasswordChange // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastSecurityReview: freezed == lastSecurityReview
          ? _value.lastSecurityReview
          : lastSecurityReview // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SecuritySettingsImplCopyWith<$Res>
    implements $SecuritySettingsCopyWith<$Res> {
  factory _$$SecuritySettingsImplCopyWith(_$SecuritySettingsImpl value,
          $Res Function(_$SecuritySettingsImpl) then) =
      __$$SecuritySettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool twoFactorEnabled,
      bool biometricAuth,
      bool emailVerificationRequired,
      int sessionTimeout,
      int passwordExpiryDays,
      int maxLoginAttempts,
      bool requireStrongPassword,
      bool logSecurityEvents,
      List<String> trustedDevices,
      List<String> authorizedApplications,
      Map<String, bool> permissionSettings,
      String? recoveryEmail,
      String? recoveryPhone,
      DateTime? lastPasswordChange,
      DateTime? lastSecurityReview,
      DateTime? lastUpdated});
}

/// @nodoc
class __$$SecuritySettingsImplCopyWithImpl<$Res>
    extends _$SecuritySettingsCopyWithImpl<$Res, _$SecuritySettingsImpl>
    implements _$$SecuritySettingsImplCopyWith<$Res> {
  __$$SecuritySettingsImplCopyWithImpl(_$SecuritySettingsImpl _value,
      $Res Function(_$SecuritySettingsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? twoFactorEnabled = null,
    Object? biometricAuth = null,
    Object? emailVerificationRequired = null,
    Object? sessionTimeout = null,
    Object? passwordExpiryDays = null,
    Object? maxLoginAttempts = null,
    Object? requireStrongPassword = null,
    Object? logSecurityEvents = null,
    Object? trustedDevices = null,
    Object? authorizedApplications = null,
    Object? permissionSettings = null,
    Object? recoveryEmail = freezed,
    Object? recoveryPhone = freezed,
    Object? lastPasswordChange = freezed,
    Object? lastSecurityReview = freezed,
    Object? lastUpdated = freezed,
  }) {
    return _then(_$SecuritySettingsImpl(
      twoFactorEnabled: null == twoFactorEnabled
          ? _value.twoFactorEnabled
          : twoFactorEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      biometricAuth: null == biometricAuth
          ? _value.biometricAuth
          : biometricAuth // ignore: cast_nullable_to_non_nullable
              as bool,
      emailVerificationRequired: null == emailVerificationRequired
          ? _value.emailVerificationRequired
          : emailVerificationRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      sessionTimeout: null == sessionTimeout
          ? _value.sessionTimeout
          : sessionTimeout // ignore: cast_nullable_to_non_nullable
              as int,
      passwordExpiryDays: null == passwordExpiryDays
          ? _value.passwordExpiryDays
          : passwordExpiryDays // ignore: cast_nullable_to_non_nullable
              as int,
      maxLoginAttempts: null == maxLoginAttempts
          ? _value.maxLoginAttempts
          : maxLoginAttempts // ignore: cast_nullable_to_non_nullable
              as int,
      requireStrongPassword: null == requireStrongPassword
          ? _value.requireStrongPassword
          : requireStrongPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      logSecurityEvents: null == logSecurityEvents
          ? _value.logSecurityEvents
          : logSecurityEvents // ignore: cast_nullable_to_non_nullable
              as bool,
      trustedDevices: null == trustedDevices
          ? _value._trustedDevices
          : trustedDevices // ignore: cast_nullable_to_non_nullable
              as List<String>,
      authorizedApplications: null == authorizedApplications
          ? _value._authorizedApplications
          : authorizedApplications // ignore: cast_nullable_to_non_nullable
              as List<String>,
      permissionSettings: null == permissionSettings
          ? _value._permissionSettings
          : permissionSettings // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      recoveryEmail: freezed == recoveryEmail
          ? _value.recoveryEmail
          : recoveryEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      recoveryPhone: freezed == recoveryPhone
          ? _value.recoveryPhone
          : recoveryPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      lastPasswordChange: freezed == lastPasswordChange
          ? _value.lastPasswordChange
          : lastPasswordChange // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastSecurityReview: freezed == lastSecurityReview
          ? _value.lastSecurityReview
          : lastSecurityReview // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SecuritySettingsImpl implements _SecuritySettings {
  const _$SecuritySettingsImpl(
      {this.twoFactorEnabled = false,
      this.biometricAuth = false,
      this.emailVerificationRequired = false,
      this.sessionTimeout = 30,
      this.passwordExpiryDays = 90,
      this.maxLoginAttempts = 5,
      this.requireStrongPassword = true,
      this.logSecurityEvents = true,
      final List<String> trustedDevices = const [],
      final List<String> authorizedApplications = const [],
      final Map<String, bool> permissionSettings = const {},
      this.recoveryEmail,
      this.recoveryPhone,
      this.lastPasswordChange,
      this.lastSecurityReview,
      this.lastUpdated})
      : _trustedDevices = trustedDevices,
        _authorizedApplications = authorizedApplications,
        _permissionSettings = permissionSettings;

  factory _$SecuritySettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SecuritySettingsImplFromJson(json);

  @override
  @JsonKey()
  final bool twoFactorEnabled;
  @override
  @JsonKey()
  final bool biometricAuth;
  @override
  @JsonKey()
  final bool emailVerificationRequired;
  @override
  @JsonKey()
  final int sessionTimeout;
// minutes
  @override
  @JsonKey()
  final int passwordExpiryDays;
  @override
  @JsonKey()
  final int maxLoginAttempts;
  @override
  @JsonKey()
  final bool requireStrongPassword;
  @override
  @JsonKey()
  final bool logSecurityEvents;
  final List<String> _trustedDevices;
  @override
  @JsonKey()
  List<String> get trustedDevices {
    if (_trustedDevices is EqualUnmodifiableListView) return _trustedDevices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_trustedDevices);
  }

  final List<String> _authorizedApplications;
  @override
  @JsonKey()
  List<String> get authorizedApplications {
    if (_authorizedApplications is EqualUnmodifiableListView)
      return _authorizedApplications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_authorizedApplications);
  }

  final Map<String, bool> _permissionSettings;
  @override
  @JsonKey()
  Map<String, bool> get permissionSettings {
    if (_permissionSettings is EqualUnmodifiableMapView)
      return _permissionSettings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_permissionSettings);
  }

  @override
  final String? recoveryEmail;
  @override
  final String? recoveryPhone;
  @override
  final DateTime? lastPasswordChange;
  @override
  final DateTime? lastSecurityReview;
  @override
  final DateTime? lastUpdated;

  @override
  String toString() {
    return 'SecuritySettings(twoFactorEnabled: $twoFactorEnabled, biometricAuth: $biometricAuth, emailVerificationRequired: $emailVerificationRequired, sessionTimeout: $sessionTimeout, passwordExpiryDays: $passwordExpiryDays, maxLoginAttempts: $maxLoginAttempts, requireStrongPassword: $requireStrongPassword, logSecurityEvents: $logSecurityEvents, trustedDevices: $trustedDevices, authorizedApplications: $authorizedApplications, permissionSettings: $permissionSettings, recoveryEmail: $recoveryEmail, recoveryPhone: $recoveryPhone, lastPasswordChange: $lastPasswordChange, lastSecurityReview: $lastSecurityReview, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SecuritySettingsImpl &&
            (identical(other.twoFactorEnabled, twoFactorEnabled) ||
                other.twoFactorEnabled == twoFactorEnabled) &&
            (identical(other.biometricAuth, biometricAuth) ||
                other.biometricAuth == biometricAuth) &&
            (identical(other.emailVerificationRequired,
                    emailVerificationRequired) ||
                other.emailVerificationRequired == emailVerificationRequired) &&
            (identical(other.sessionTimeout, sessionTimeout) ||
                other.sessionTimeout == sessionTimeout) &&
            (identical(other.passwordExpiryDays, passwordExpiryDays) ||
                other.passwordExpiryDays == passwordExpiryDays) &&
            (identical(other.maxLoginAttempts, maxLoginAttempts) ||
                other.maxLoginAttempts == maxLoginAttempts) &&
            (identical(other.requireStrongPassword, requireStrongPassword) ||
                other.requireStrongPassword == requireStrongPassword) &&
            (identical(other.logSecurityEvents, logSecurityEvents) ||
                other.logSecurityEvents == logSecurityEvents) &&
            const DeepCollectionEquality()
                .equals(other._trustedDevices, _trustedDevices) &&
            const DeepCollectionEquality().equals(
                other._authorizedApplications, _authorizedApplications) &&
            const DeepCollectionEquality()
                .equals(other._permissionSettings, _permissionSettings) &&
            (identical(other.recoveryEmail, recoveryEmail) ||
                other.recoveryEmail == recoveryEmail) &&
            (identical(other.recoveryPhone, recoveryPhone) ||
                other.recoveryPhone == recoveryPhone) &&
            (identical(other.lastPasswordChange, lastPasswordChange) ||
                other.lastPasswordChange == lastPasswordChange) &&
            (identical(other.lastSecurityReview, lastSecurityReview) ||
                other.lastSecurityReview == lastSecurityReview) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      twoFactorEnabled,
      biometricAuth,
      emailVerificationRequired,
      sessionTimeout,
      passwordExpiryDays,
      maxLoginAttempts,
      requireStrongPassword,
      logSecurityEvents,
      const DeepCollectionEquality().hash(_trustedDevices),
      const DeepCollectionEquality().hash(_authorizedApplications),
      const DeepCollectionEquality().hash(_permissionSettings),
      recoveryEmail,
      recoveryPhone,
      lastPasswordChange,
      lastSecurityReview,
      lastUpdated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SecuritySettingsImplCopyWith<_$SecuritySettingsImpl> get copyWith =>
      __$$SecuritySettingsImplCopyWithImpl<_$SecuritySettingsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SecuritySettingsImplToJson(
      this,
    );
  }
}

abstract class _SecuritySettings implements SecuritySettings {
  const factory _SecuritySettings(
      {final bool twoFactorEnabled,
      final bool biometricAuth,
      final bool emailVerificationRequired,
      final int sessionTimeout,
      final int passwordExpiryDays,
      final int maxLoginAttempts,
      final bool requireStrongPassword,
      final bool logSecurityEvents,
      final List<String> trustedDevices,
      final List<String> authorizedApplications,
      final Map<String, bool> permissionSettings,
      final String? recoveryEmail,
      final String? recoveryPhone,
      final DateTime? lastPasswordChange,
      final DateTime? lastSecurityReview,
      final DateTime? lastUpdated}) = _$SecuritySettingsImpl;

  factory _SecuritySettings.fromJson(Map<String, dynamic> json) =
      _$SecuritySettingsImpl.fromJson;

  @override
  bool get twoFactorEnabled;
  @override
  bool get biometricAuth;
  @override
  bool get emailVerificationRequired;
  @override
  int get sessionTimeout;
  @override // minutes
  int get passwordExpiryDays;
  @override
  int get maxLoginAttempts;
  @override
  bool get requireStrongPassword;
  @override
  bool get logSecurityEvents;
  @override
  List<String> get trustedDevices;
  @override
  List<String> get authorizedApplications;
  @override
  Map<String, bool> get permissionSettings;
  @override
  String? get recoveryEmail;
  @override
  String? get recoveryPhone;
  @override
  DateTime? get lastPasswordChange;
  @override
  DateTime? get lastSecurityReview;
  @override
  DateTime? get lastUpdated;
  @override
  @JsonKey(ignore: true)
  _$$SecuritySettingsImplCopyWith<_$SecuritySettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AccessibilitySettings _$AccessibilitySettingsFromJson(
    Map<String, dynamic> json) {
  return _AccessibilitySettings.fromJson(json);
}

/// @nodoc
mixin _$AccessibilitySettings {
  bool get screenReader => throw _privateConstructorUsedError;
  bool get highContrastText => throw _privateConstructorUsedError;
  bool get largeText => throw _privateConstructorUsedError;
  bool get reducedMotion => throw _privateConstructorUsedError;
  bool get boldText => throw _privateConstructorUsedError;
  bool get hapticFeedback => throw _privateConstructorUsedError;
  bool get soundEffects => throw _privateConstructorUsedError;
  bool get voiceControl => throw _privateConstructorUsedError;
  double get textSize => throw _privateConstructorUsedError;
  double get interfaceSize => throw _privateConstructorUsedError;
  String get fontFamily => throw _privateConstructorUsedError;
  int get colorBlindnessType =>
      throw _privateConstructorUsedError; // 0: none, 1: deuteranopia, 2: protanopia, 3: tritanopia
  bool get keyboardNavigation => throw _privateConstructorUsedError;
  List<String> get customKeyboardShortcuts =>
      throw _privateConstructorUsedError;
  DateTime? get lastUpdated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccessibilitySettingsCopyWith<AccessibilitySettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccessibilitySettingsCopyWith<$Res> {
  factory $AccessibilitySettingsCopyWith(AccessibilitySettings value,
          $Res Function(AccessibilitySettings) then) =
      _$AccessibilitySettingsCopyWithImpl<$Res, AccessibilitySettings>;
  @useResult
  $Res call(
      {bool screenReader,
      bool highContrastText,
      bool largeText,
      bool reducedMotion,
      bool boldText,
      bool hapticFeedback,
      bool soundEffects,
      bool voiceControl,
      double textSize,
      double interfaceSize,
      String fontFamily,
      int colorBlindnessType,
      bool keyboardNavigation,
      List<String> customKeyboardShortcuts,
      DateTime? lastUpdated});
}

/// @nodoc
class _$AccessibilitySettingsCopyWithImpl<$Res,
        $Val extends AccessibilitySettings>
    implements $AccessibilitySettingsCopyWith<$Res> {
  _$AccessibilitySettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? screenReader = null,
    Object? highContrastText = null,
    Object? largeText = null,
    Object? reducedMotion = null,
    Object? boldText = null,
    Object? hapticFeedback = null,
    Object? soundEffects = null,
    Object? voiceControl = null,
    Object? textSize = null,
    Object? interfaceSize = null,
    Object? fontFamily = null,
    Object? colorBlindnessType = null,
    Object? keyboardNavigation = null,
    Object? customKeyboardShortcuts = null,
    Object? lastUpdated = freezed,
  }) {
    return _then(_value.copyWith(
      screenReader: null == screenReader
          ? _value.screenReader
          : screenReader // ignore: cast_nullable_to_non_nullable
              as bool,
      highContrastText: null == highContrastText
          ? _value.highContrastText
          : highContrastText // ignore: cast_nullable_to_non_nullable
              as bool,
      largeText: null == largeText
          ? _value.largeText
          : largeText // ignore: cast_nullable_to_non_nullable
              as bool,
      reducedMotion: null == reducedMotion
          ? _value.reducedMotion
          : reducedMotion // ignore: cast_nullable_to_non_nullable
              as bool,
      boldText: null == boldText
          ? _value.boldText
          : boldText // ignore: cast_nullable_to_non_nullable
              as bool,
      hapticFeedback: null == hapticFeedback
          ? _value.hapticFeedback
          : hapticFeedback // ignore: cast_nullable_to_non_nullable
              as bool,
      soundEffects: null == soundEffects
          ? _value.soundEffects
          : soundEffects // ignore: cast_nullable_to_non_nullable
              as bool,
      voiceControl: null == voiceControl
          ? _value.voiceControl
          : voiceControl // ignore: cast_nullable_to_non_nullable
              as bool,
      textSize: null == textSize
          ? _value.textSize
          : textSize // ignore: cast_nullable_to_non_nullable
              as double,
      interfaceSize: null == interfaceSize
          ? _value.interfaceSize
          : interfaceSize // ignore: cast_nullable_to_non_nullable
              as double,
      fontFamily: null == fontFamily
          ? _value.fontFamily
          : fontFamily // ignore: cast_nullable_to_non_nullable
              as String,
      colorBlindnessType: null == colorBlindnessType
          ? _value.colorBlindnessType
          : colorBlindnessType // ignore: cast_nullable_to_non_nullable
              as int,
      keyboardNavigation: null == keyboardNavigation
          ? _value.keyboardNavigation
          : keyboardNavigation // ignore: cast_nullable_to_non_nullable
              as bool,
      customKeyboardShortcuts: null == customKeyboardShortcuts
          ? _value.customKeyboardShortcuts
          : customKeyboardShortcuts // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccessibilitySettingsImplCopyWith<$Res>
    implements $AccessibilitySettingsCopyWith<$Res> {
  factory _$$AccessibilitySettingsImplCopyWith(
          _$AccessibilitySettingsImpl value,
          $Res Function(_$AccessibilitySettingsImpl) then) =
      __$$AccessibilitySettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool screenReader,
      bool highContrastText,
      bool largeText,
      bool reducedMotion,
      bool boldText,
      bool hapticFeedback,
      bool soundEffects,
      bool voiceControl,
      double textSize,
      double interfaceSize,
      String fontFamily,
      int colorBlindnessType,
      bool keyboardNavigation,
      List<String> customKeyboardShortcuts,
      DateTime? lastUpdated});
}

/// @nodoc
class __$$AccessibilitySettingsImplCopyWithImpl<$Res>
    extends _$AccessibilitySettingsCopyWithImpl<$Res,
        _$AccessibilitySettingsImpl>
    implements _$$AccessibilitySettingsImplCopyWith<$Res> {
  __$$AccessibilitySettingsImplCopyWithImpl(_$AccessibilitySettingsImpl _value,
      $Res Function(_$AccessibilitySettingsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? screenReader = null,
    Object? highContrastText = null,
    Object? largeText = null,
    Object? reducedMotion = null,
    Object? boldText = null,
    Object? hapticFeedback = null,
    Object? soundEffects = null,
    Object? voiceControl = null,
    Object? textSize = null,
    Object? interfaceSize = null,
    Object? fontFamily = null,
    Object? colorBlindnessType = null,
    Object? keyboardNavigation = null,
    Object? customKeyboardShortcuts = null,
    Object? lastUpdated = freezed,
  }) {
    return _then(_$AccessibilitySettingsImpl(
      screenReader: null == screenReader
          ? _value.screenReader
          : screenReader // ignore: cast_nullable_to_non_nullable
              as bool,
      highContrastText: null == highContrastText
          ? _value.highContrastText
          : highContrastText // ignore: cast_nullable_to_non_nullable
              as bool,
      largeText: null == largeText
          ? _value.largeText
          : largeText // ignore: cast_nullable_to_non_nullable
              as bool,
      reducedMotion: null == reducedMotion
          ? _value.reducedMotion
          : reducedMotion // ignore: cast_nullable_to_non_nullable
              as bool,
      boldText: null == boldText
          ? _value.boldText
          : boldText // ignore: cast_nullable_to_non_nullable
              as bool,
      hapticFeedback: null == hapticFeedback
          ? _value.hapticFeedback
          : hapticFeedback // ignore: cast_nullable_to_non_nullable
              as bool,
      soundEffects: null == soundEffects
          ? _value.soundEffects
          : soundEffects // ignore: cast_nullable_to_non_nullable
              as bool,
      voiceControl: null == voiceControl
          ? _value.voiceControl
          : voiceControl // ignore: cast_nullable_to_non_nullable
              as bool,
      textSize: null == textSize
          ? _value.textSize
          : textSize // ignore: cast_nullable_to_non_nullable
              as double,
      interfaceSize: null == interfaceSize
          ? _value.interfaceSize
          : interfaceSize // ignore: cast_nullable_to_non_nullable
              as double,
      fontFamily: null == fontFamily
          ? _value.fontFamily
          : fontFamily // ignore: cast_nullable_to_non_nullable
              as String,
      colorBlindnessType: null == colorBlindnessType
          ? _value.colorBlindnessType
          : colorBlindnessType // ignore: cast_nullable_to_non_nullable
              as int,
      keyboardNavigation: null == keyboardNavigation
          ? _value.keyboardNavigation
          : keyboardNavigation // ignore: cast_nullable_to_non_nullable
              as bool,
      customKeyboardShortcuts: null == customKeyboardShortcuts
          ? _value._customKeyboardShortcuts
          : customKeyboardShortcuts // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AccessibilitySettingsImpl implements _AccessibilitySettings {
  const _$AccessibilitySettingsImpl(
      {this.screenReader = false,
      this.highContrastText = false,
      this.largeText = false,
      this.reducedMotion = false,
      this.boldText = false,
      this.hapticFeedback = false,
      this.soundEffects = false,
      this.voiceControl = false,
      this.textSize = 1.0,
      this.interfaceSize = 1.0,
      this.fontFamily = 'default',
      this.colorBlindnessType = 0,
      this.keyboardNavigation = false,
      final List<String> customKeyboardShortcuts = const [],
      this.lastUpdated})
      : _customKeyboardShortcuts = customKeyboardShortcuts;

  factory _$AccessibilitySettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccessibilitySettingsImplFromJson(json);

  @override
  @JsonKey()
  final bool screenReader;
  @override
  @JsonKey()
  final bool highContrastText;
  @override
  @JsonKey()
  final bool largeText;
  @override
  @JsonKey()
  final bool reducedMotion;
  @override
  @JsonKey()
  final bool boldText;
  @override
  @JsonKey()
  final bool hapticFeedback;
  @override
  @JsonKey()
  final bool soundEffects;
  @override
  @JsonKey()
  final bool voiceControl;
  @override
  @JsonKey()
  final double textSize;
  @override
  @JsonKey()
  final double interfaceSize;
  @override
  @JsonKey()
  final String fontFamily;
  @override
  @JsonKey()
  final int colorBlindnessType;
// 0: none, 1: deuteranopia, 2: protanopia, 3: tritanopia
  @override
  @JsonKey()
  final bool keyboardNavigation;
  final List<String> _customKeyboardShortcuts;
  @override
  @JsonKey()
  List<String> get customKeyboardShortcuts {
    if (_customKeyboardShortcuts is EqualUnmodifiableListView)
      return _customKeyboardShortcuts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_customKeyboardShortcuts);
  }

  @override
  final DateTime? lastUpdated;

  @override
  String toString() {
    return 'AccessibilitySettings(screenReader: $screenReader, highContrastText: $highContrastText, largeText: $largeText, reducedMotion: $reducedMotion, boldText: $boldText, hapticFeedback: $hapticFeedback, soundEffects: $soundEffects, voiceControl: $voiceControl, textSize: $textSize, interfaceSize: $interfaceSize, fontFamily: $fontFamily, colorBlindnessType: $colorBlindnessType, keyboardNavigation: $keyboardNavigation, customKeyboardShortcuts: $customKeyboardShortcuts, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccessibilitySettingsImpl &&
            (identical(other.screenReader, screenReader) ||
                other.screenReader == screenReader) &&
            (identical(other.highContrastText, highContrastText) ||
                other.highContrastText == highContrastText) &&
            (identical(other.largeText, largeText) ||
                other.largeText == largeText) &&
            (identical(other.reducedMotion, reducedMotion) ||
                other.reducedMotion == reducedMotion) &&
            (identical(other.boldText, boldText) ||
                other.boldText == boldText) &&
            (identical(other.hapticFeedback, hapticFeedback) ||
                other.hapticFeedback == hapticFeedback) &&
            (identical(other.soundEffects, soundEffects) ||
                other.soundEffects == soundEffects) &&
            (identical(other.voiceControl, voiceControl) ||
                other.voiceControl == voiceControl) &&
            (identical(other.textSize, textSize) ||
                other.textSize == textSize) &&
            (identical(other.interfaceSize, interfaceSize) ||
                other.interfaceSize == interfaceSize) &&
            (identical(other.fontFamily, fontFamily) ||
                other.fontFamily == fontFamily) &&
            (identical(other.colorBlindnessType, colorBlindnessType) ||
                other.colorBlindnessType == colorBlindnessType) &&
            (identical(other.keyboardNavigation, keyboardNavigation) ||
                other.keyboardNavigation == keyboardNavigation) &&
            const DeepCollectionEquality().equals(
                other._customKeyboardShortcuts, _customKeyboardShortcuts) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      screenReader,
      highContrastText,
      largeText,
      reducedMotion,
      boldText,
      hapticFeedback,
      soundEffects,
      voiceControl,
      textSize,
      interfaceSize,
      fontFamily,
      colorBlindnessType,
      keyboardNavigation,
      const DeepCollectionEquality().hash(_customKeyboardShortcuts),
      lastUpdated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccessibilitySettingsImplCopyWith<_$AccessibilitySettingsImpl>
      get copyWith => __$$AccessibilitySettingsImplCopyWithImpl<
          _$AccessibilitySettingsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccessibilitySettingsImplToJson(
      this,
    );
  }
}

abstract class _AccessibilitySettings implements AccessibilitySettings {
  const factory _AccessibilitySettings(
      {final bool screenReader,
      final bool highContrastText,
      final bool largeText,
      final bool reducedMotion,
      final bool boldText,
      final bool hapticFeedback,
      final bool soundEffects,
      final bool voiceControl,
      final double textSize,
      final double interfaceSize,
      final String fontFamily,
      final int colorBlindnessType,
      final bool keyboardNavigation,
      final List<String> customKeyboardShortcuts,
      final DateTime? lastUpdated}) = _$AccessibilitySettingsImpl;

  factory _AccessibilitySettings.fromJson(Map<String, dynamic> json) =
      _$AccessibilitySettingsImpl.fromJson;

  @override
  bool get screenReader;
  @override
  bool get highContrastText;
  @override
  bool get largeText;
  @override
  bool get reducedMotion;
  @override
  bool get boldText;
  @override
  bool get hapticFeedback;
  @override
  bool get soundEffects;
  @override
  bool get voiceControl;
  @override
  double get textSize;
  @override
  double get interfaceSize;
  @override
  String get fontFamily;
  @override
  int get colorBlindnessType;
  @override // 0: none, 1: deuteranopia, 2: protanopia, 3: tritanopia
  bool get keyboardNavigation;
  @override
  List<String> get customKeyboardShortcuts;
  @override
  DateTime? get lastUpdated;
  @override
  @JsonKey(ignore: true)
  _$$AccessibilitySettingsImplCopyWith<_$AccessibilitySettingsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SettingsBackup _$SettingsBackupFromJson(Map<String, dynamic> json) {
  return _SettingsBackup.fromJson(json);
}

/// @nodoc
mixin _$SettingsBackup {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  Map<String, dynamic> get settingsData => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  bool get isAutomatic => throw _privateConstructorUsedError;
  String? get deviceInfo => throw _privateConstructorUsedError;
  String? get appVersion => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SettingsBackupCopyWith<SettingsBackup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsBackupCopyWith<$Res> {
  factory $SettingsBackupCopyWith(
          SettingsBackup value, $Res Function(SettingsBackup) then) =
      _$SettingsBackupCopyWithImpl<$Res, SettingsBackup>;
  @useResult
  $Res call(
      {String id,
      String userId,
      DateTime createdAt,
      Map<String, dynamic> settingsData,
      String? name,
      String? description,
      bool isAutomatic,
      String? deviceInfo,
      String? appVersion});
}

/// @nodoc
class _$SettingsBackupCopyWithImpl<$Res, $Val extends SettingsBackup>
    implements $SettingsBackupCopyWith<$Res> {
  _$SettingsBackupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? createdAt = null,
    Object? settingsData = null,
    Object? name = freezed,
    Object? description = freezed,
    Object? isAutomatic = null,
    Object? deviceInfo = freezed,
    Object? appVersion = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      settingsData: null == settingsData
          ? _value.settingsData
          : settingsData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isAutomatic: null == isAutomatic
          ? _value.isAutomatic
          : isAutomatic // ignore: cast_nullable_to_non_nullable
              as bool,
      deviceInfo: freezed == deviceInfo
          ? _value.deviceInfo
          : deviceInfo // ignore: cast_nullable_to_non_nullable
              as String?,
      appVersion: freezed == appVersion
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SettingsBackupImplCopyWith<$Res>
    implements $SettingsBackupCopyWith<$Res> {
  factory _$$SettingsBackupImplCopyWith(_$SettingsBackupImpl value,
          $Res Function(_$SettingsBackupImpl) then) =
      __$$SettingsBackupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      DateTime createdAt,
      Map<String, dynamic> settingsData,
      String? name,
      String? description,
      bool isAutomatic,
      String? deviceInfo,
      String? appVersion});
}

/// @nodoc
class __$$SettingsBackupImplCopyWithImpl<$Res>
    extends _$SettingsBackupCopyWithImpl<$Res, _$SettingsBackupImpl>
    implements _$$SettingsBackupImplCopyWith<$Res> {
  __$$SettingsBackupImplCopyWithImpl(
      _$SettingsBackupImpl _value, $Res Function(_$SettingsBackupImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? createdAt = null,
    Object? settingsData = null,
    Object? name = freezed,
    Object? description = freezed,
    Object? isAutomatic = null,
    Object? deviceInfo = freezed,
    Object? appVersion = freezed,
  }) {
    return _then(_$SettingsBackupImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      settingsData: null == settingsData
          ? _value._settingsData
          : settingsData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isAutomatic: null == isAutomatic
          ? _value.isAutomatic
          : isAutomatic // ignore: cast_nullable_to_non_nullable
              as bool,
      deviceInfo: freezed == deviceInfo
          ? _value.deviceInfo
          : deviceInfo // ignore: cast_nullable_to_non_nullable
              as String?,
      appVersion: freezed == appVersion
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SettingsBackupImpl implements _SettingsBackup {
  const _$SettingsBackupImpl(
      {required this.id,
      required this.userId,
      required this.createdAt,
      required final Map<String, dynamic> settingsData,
      this.name,
      this.description,
      this.isAutomatic = false,
      this.deviceInfo,
      this.appVersion})
      : _settingsData = settingsData;

  factory _$SettingsBackupImpl.fromJson(Map<String, dynamic> json) =>
      _$$SettingsBackupImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final DateTime createdAt;
  final Map<String, dynamic> _settingsData;
  @override
  Map<String, dynamic> get settingsData {
    if (_settingsData is EqualUnmodifiableMapView) return _settingsData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_settingsData);
  }

  @override
  final String? name;
  @override
  final String? description;
  @override
  @JsonKey()
  final bool isAutomatic;
  @override
  final String? deviceInfo;
  @override
  final String? appVersion;

  @override
  String toString() {
    return 'SettingsBackup(id: $id, userId: $userId, createdAt: $createdAt, settingsData: $settingsData, name: $name, description: $description, isAutomatic: $isAutomatic, deviceInfo: $deviceInfo, appVersion: $appVersion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsBackupImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality()
                .equals(other._settingsData, _settingsData) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isAutomatic, isAutomatic) ||
                other.isAutomatic == isAutomatic) &&
            (identical(other.deviceInfo, deviceInfo) ||
                other.deviceInfo == deviceInfo) &&
            (identical(other.appVersion, appVersion) ||
                other.appVersion == appVersion));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      createdAt,
      const DeepCollectionEquality().hash(_settingsData),
      name,
      description,
      isAutomatic,
      deviceInfo,
      appVersion);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingsBackupImplCopyWith<_$SettingsBackupImpl> get copyWith =>
      __$$SettingsBackupImplCopyWithImpl<_$SettingsBackupImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SettingsBackupImplToJson(
      this,
    );
  }
}

abstract class _SettingsBackup implements SettingsBackup {
  const factory _SettingsBackup(
      {required final String id,
      required final String userId,
      required final DateTime createdAt,
      required final Map<String, dynamic> settingsData,
      final String? name,
      final String? description,
      final bool isAutomatic,
      final String? deviceInfo,
      final String? appVersion}) = _$SettingsBackupImpl;

  factory _SettingsBackup.fromJson(Map<String, dynamic> json) =
      _$SettingsBackupImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  DateTime get createdAt;
  @override
  Map<String, dynamic> get settingsData;
  @override
  String? get name;
  @override
  String? get description;
  @override
  bool get isAutomatic;
  @override
  String? get deviceInfo;
  @override
  String? get appVersion;
  @override
  @JsonKey(ignore: true)
  _$$SettingsBackupImplCopyWith<_$SettingsBackupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SettingsSyncStatus _$SettingsSyncStatusFromJson(Map<String, dynamic> json) {
  return _SettingsSyncStatus.fromJson(json);
}

/// @nodoc
mixin _$SettingsSyncStatus {
  String get userId => throw _privateConstructorUsedError;
  bool get isEnabled => throw _privateConstructorUsedError;
  SyncState get currentState => throw _privateConstructorUsedError;
  DateTime? get lastSyncAt => throw _privateConstructorUsedError;
  DateTime? get nextSyncAt => throw _privateConstructorUsedError;
  List<String> get conflictingKeys => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  int get syncCount => throw _privateConstructorUsedError;
  Map<String, DateTime> get deviceLastSync =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SettingsSyncStatusCopyWith<SettingsSyncStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsSyncStatusCopyWith<$Res> {
  factory $SettingsSyncStatusCopyWith(
          SettingsSyncStatus value, $Res Function(SettingsSyncStatus) then) =
      _$SettingsSyncStatusCopyWithImpl<$Res, SettingsSyncStatus>;
  @useResult
  $Res call(
      {String userId,
      bool isEnabled,
      SyncState currentState,
      DateTime? lastSyncAt,
      DateTime? nextSyncAt,
      List<String> conflictingKeys,
      String? error,
      int syncCount,
      Map<String, DateTime> deviceLastSync});
}

/// @nodoc
class _$SettingsSyncStatusCopyWithImpl<$Res, $Val extends SettingsSyncStatus>
    implements $SettingsSyncStatusCopyWith<$Res> {
  _$SettingsSyncStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? isEnabled = null,
    Object? currentState = null,
    Object? lastSyncAt = freezed,
    Object? nextSyncAt = freezed,
    Object? conflictingKeys = null,
    Object? error = freezed,
    Object? syncCount = null,
    Object? deviceLastSync = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      isEnabled: null == isEnabled
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      currentState: null == currentState
          ? _value.currentState
          : currentState // ignore: cast_nullable_to_non_nullable
              as SyncState,
      lastSyncAt: freezed == lastSyncAt
          ? _value.lastSyncAt
          : lastSyncAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      nextSyncAt: freezed == nextSyncAt
          ? _value.nextSyncAt
          : nextSyncAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      conflictingKeys: null == conflictingKeys
          ? _value.conflictingKeys
          : conflictingKeys // ignore: cast_nullable_to_non_nullable
              as List<String>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      syncCount: null == syncCount
          ? _value.syncCount
          : syncCount // ignore: cast_nullable_to_non_nullable
              as int,
      deviceLastSync: null == deviceLastSync
          ? _value.deviceLastSync
          : deviceLastSync // ignore: cast_nullable_to_non_nullable
              as Map<String, DateTime>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SettingsSyncStatusImplCopyWith<$Res>
    implements $SettingsSyncStatusCopyWith<$Res> {
  factory _$$SettingsSyncStatusImplCopyWith(_$SettingsSyncStatusImpl value,
          $Res Function(_$SettingsSyncStatusImpl) then) =
      __$$SettingsSyncStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      bool isEnabled,
      SyncState currentState,
      DateTime? lastSyncAt,
      DateTime? nextSyncAt,
      List<String> conflictingKeys,
      String? error,
      int syncCount,
      Map<String, DateTime> deviceLastSync});
}

/// @nodoc
class __$$SettingsSyncStatusImplCopyWithImpl<$Res>
    extends _$SettingsSyncStatusCopyWithImpl<$Res, _$SettingsSyncStatusImpl>
    implements _$$SettingsSyncStatusImplCopyWith<$Res> {
  __$$SettingsSyncStatusImplCopyWithImpl(_$SettingsSyncStatusImpl _value,
      $Res Function(_$SettingsSyncStatusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? isEnabled = null,
    Object? currentState = null,
    Object? lastSyncAt = freezed,
    Object? nextSyncAt = freezed,
    Object? conflictingKeys = null,
    Object? error = freezed,
    Object? syncCount = null,
    Object? deviceLastSync = null,
  }) {
    return _then(_$SettingsSyncStatusImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      isEnabled: null == isEnabled
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      currentState: null == currentState
          ? _value.currentState
          : currentState // ignore: cast_nullable_to_non_nullable
              as SyncState,
      lastSyncAt: freezed == lastSyncAt
          ? _value.lastSyncAt
          : lastSyncAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      nextSyncAt: freezed == nextSyncAt
          ? _value.nextSyncAt
          : nextSyncAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      conflictingKeys: null == conflictingKeys
          ? _value._conflictingKeys
          : conflictingKeys // ignore: cast_nullable_to_non_nullable
              as List<String>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      syncCount: null == syncCount
          ? _value.syncCount
          : syncCount // ignore: cast_nullable_to_non_nullable
              as int,
      deviceLastSync: null == deviceLastSync
          ? _value._deviceLastSync
          : deviceLastSync // ignore: cast_nullable_to_non_nullable
              as Map<String, DateTime>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SettingsSyncStatusImpl implements _SettingsSyncStatus {
  const _$SettingsSyncStatusImpl(
      {required this.userId,
      this.isEnabled = false,
      this.currentState = SyncState.idle,
      this.lastSyncAt,
      this.nextSyncAt,
      final List<String> conflictingKeys = const [],
      this.error,
      this.syncCount = 0,
      final Map<String, DateTime> deviceLastSync = const {}})
      : _conflictingKeys = conflictingKeys,
        _deviceLastSync = deviceLastSync;

  factory _$SettingsSyncStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$SettingsSyncStatusImplFromJson(json);

  @override
  final String userId;
  @override
  @JsonKey()
  final bool isEnabled;
  @override
  @JsonKey()
  final SyncState currentState;
  @override
  final DateTime? lastSyncAt;
  @override
  final DateTime? nextSyncAt;
  final List<String> _conflictingKeys;
  @override
  @JsonKey()
  List<String> get conflictingKeys {
    if (_conflictingKeys is EqualUnmodifiableListView) return _conflictingKeys;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_conflictingKeys);
  }

  @override
  final String? error;
  @override
  @JsonKey()
  final int syncCount;
  final Map<String, DateTime> _deviceLastSync;
  @override
  @JsonKey()
  Map<String, DateTime> get deviceLastSync {
    if (_deviceLastSync is EqualUnmodifiableMapView) return _deviceLastSync;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_deviceLastSync);
  }

  @override
  String toString() {
    return 'SettingsSyncStatus(userId: $userId, isEnabled: $isEnabled, currentState: $currentState, lastSyncAt: $lastSyncAt, nextSyncAt: $nextSyncAt, conflictingKeys: $conflictingKeys, error: $error, syncCount: $syncCount, deviceLastSync: $deviceLastSync)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsSyncStatusImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.isEnabled, isEnabled) ||
                other.isEnabled == isEnabled) &&
            (identical(other.currentState, currentState) ||
                other.currentState == currentState) &&
            (identical(other.lastSyncAt, lastSyncAt) ||
                other.lastSyncAt == lastSyncAt) &&
            (identical(other.nextSyncAt, nextSyncAt) ||
                other.nextSyncAt == nextSyncAt) &&
            const DeepCollectionEquality()
                .equals(other._conflictingKeys, _conflictingKeys) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.syncCount, syncCount) ||
                other.syncCount == syncCount) &&
            const DeepCollectionEquality()
                .equals(other._deviceLastSync, _deviceLastSync));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      isEnabled,
      currentState,
      lastSyncAt,
      nextSyncAt,
      const DeepCollectionEquality().hash(_conflictingKeys),
      error,
      syncCount,
      const DeepCollectionEquality().hash(_deviceLastSync));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingsSyncStatusImplCopyWith<_$SettingsSyncStatusImpl> get copyWith =>
      __$$SettingsSyncStatusImplCopyWithImpl<_$SettingsSyncStatusImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SettingsSyncStatusImplToJson(
      this,
    );
  }
}

abstract class _SettingsSyncStatus implements SettingsSyncStatus {
  const factory _SettingsSyncStatus(
      {required final String userId,
      final bool isEnabled,
      final SyncState currentState,
      final DateTime? lastSyncAt,
      final DateTime? nextSyncAt,
      final List<String> conflictingKeys,
      final String? error,
      final int syncCount,
      final Map<String, DateTime> deviceLastSync}) = _$SettingsSyncStatusImpl;

  factory _SettingsSyncStatus.fromJson(Map<String, dynamic> json) =
      _$SettingsSyncStatusImpl.fromJson;

  @override
  String get userId;
  @override
  bool get isEnabled;
  @override
  SyncState get currentState;
  @override
  DateTime? get lastSyncAt;
  @override
  DateTime? get nextSyncAt;
  @override
  List<String> get conflictingKeys;
  @override
  String? get error;
  @override
  int get syncCount;
  @override
  Map<String, DateTime> get deviceLastSync;
  @override
  @JsonKey(ignore: true)
  _$$SettingsSyncStatusImplCopyWith<_$SettingsSyncStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DeviceSettings _$DeviceSettingsFromJson(Map<String, dynamic> json) {
  return _DeviceSettings.fromJson(json);
}

/// @nodoc
mixin _$DeviceSettings {
  String get deviceId => throw _privateConstructorUsedError;
  String get deviceName => throw _privateConstructorUsedError;
  String get platform => throw _privateConstructorUsedError;
  String get appVersion => throw _privateConstructorUsedError;
  DateTime get lastActive => throw _privateConstructorUsedError;
  bool get syncEnabled => throw _privateConstructorUsedError;
  Map<String, dynamic> get platformSpecificSettings =>
      throw _privateConstructorUsedError;
  String? get pushToken => throw _privateConstructorUsedError;
  String? get biometricId => throw _privateConstructorUsedError;
  List<String> get enabledFeatures => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeviceSettingsCopyWith<DeviceSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceSettingsCopyWith<$Res> {
  factory $DeviceSettingsCopyWith(
          DeviceSettings value, $Res Function(DeviceSettings) then) =
      _$DeviceSettingsCopyWithImpl<$Res, DeviceSettings>;
  @useResult
  $Res call(
      {String deviceId,
      String deviceName,
      String platform,
      String appVersion,
      DateTime lastActive,
      bool syncEnabled,
      Map<String, dynamic> platformSpecificSettings,
      String? pushToken,
      String? biometricId,
      List<String> enabledFeatures});
}

/// @nodoc
class _$DeviceSettingsCopyWithImpl<$Res, $Val extends DeviceSettings>
    implements $DeviceSettingsCopyWith<$Res> {
  _$DeviceSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? deviceName = null,
    Object? platform = null,
    Object? appVersion = null,
    Object? lastActive = null,
    Object? syncEnabled = null,
    Object? platformSpecificSettings = null,
    Object? pushToken = freezed,
    Object? biometricId = freezed,
    Object? enabledFeatures = null,
  }) {
    return _then(_value.copyWith(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      deviceName: null == deviceName
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String,
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
      appVersion: null == appVersion
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String,
      lastActive: null == lastActive
          ? _value.lastActive
          : lastActive // ignore: cast_nullable_to_non_nullable
              as DateTime,
      syncEnabled: null == syncEnabled
          ? _value.syncEnabled
          : syncEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      platformSpecificSettings: null == platformSpecificSettings
          ? _value.platformSpecificSettings
          : platformSpecificSettings // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      pushToken: freezed == pushToken
          ? _value.pushToken
          : pushToken // ignore: cast_nullable_to_non_nullable
              as String?,
      biometricId: freezed == biometricId
          ? _value.biometricId
          : biometricId // ignore: cast_nullable_to_non_nullable
              as String?,
      enabledFeatures: null == enabledFeatures
          ? _value.enabledFeatures
          : enabledFeatures // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeviceSettingsImplCopyWith<$Res>
    implements $DeviceSettingsCopyWith<$Res> {
  factory _$$DeviceSettingsImplCopyWith(_$DeviceSettingsImpl value,
          $Res Function(_$DeviceSettingsImpl) then) =
      __$$DeviceSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String deviceId,
      String deviceName,
      String platform,
      String appVersion,
      DateTime lastActive,
      bool syncEnabled,
      Map<String, dynamic> platformSpecificSettings,
      String? pushToken,
      String? biometricId,
      List<String> enabledFeatures});
}

/// @nodoc
class __$$DeviceSettingsImplCopyWithImpl<$Res>
    extends _$DeviceSettingsCopyWithImpl<$Res, _$DeviceSettingsImpl>
    implements _$$DeviceSettingsImplCopyWith<$Res> {
  __$$DeviceSettingsImplCopyWithImpl(
      _$DeviceSettingsImpl _value, $Res Function(_$DeviceSettingsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? deviceName = null,
    Object? platform = null,
    Object? appVersion = null,
    Object? lastActive = null,
    Object? syncEnabled = null,
    Object? platformSpecificSettings = null,
    Object? pushToken = freezed,
    Object? biometricId = freezed,
    Object? enabledFeatures = null,
  }) {
    return _then(_$DeviceSettingsImpl(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      deviceName: null == deviceName
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String,
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
      appVersion: null == appVersion
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String,
      lastActive: null == lastActive
          ? _value.lastActive
          : lastActive // ignore: cast_nullable_to_non_nullable
              as DateTime,
      syncEnabled: null == syncEnabled
          ? _value.syncEnabled
          : syncEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      platformSpecificSettings: null == platformSpecificSettings
          ? _value._platformSpecificSettings
          : platformSpecificSettings // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      pushToken: freezed == pushToken
          ? _value.pushToken
          : pushToken // ignore: cast_nullable_to_non_nullable
              as String?,
      biometricId: freezed == biometricId
          ? _value.biometricId
          : biometricId // ignore: cast_nullable_to_non_nullable
              as String?,
      enabledFeatures: null == enabledFeatures
          ? _value._enabledFeatures
          : enabledFeatures // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceSettingsImpl implements _DeviceSettings {
  const _$DeviceSettingsImpl(
      {required this.deviceId,
      required this.deviceName,
      required this.platform,
      required this.appVersion,
      required this.lastActive,
      this.syncEnabled = true,
      final Map<String, dynamic> platformSpecificSettings = const {},
      this.pushToken,
      this.biometricId,
      final List<String> enabledFeatures = const []})
      : _platformSpecificSettings = platformSpecificSettings,
        _enabledFeatures = enabledFeatures;

  factory _$DeviceSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeviceSettingsImplFromJson(json);

  @override
  final String deviceId;
  @override
  final String deviceName;
  @override
  final String platform;
  @override
  final String appVersion;
  @override
  final DateTime lastActive;
  @override
  @JsonKey()
  final bool syncEnabled;
  final Map<String, dynamic> _platformSpecificSettings;
  @override
  @JsonKey()
  Map<String, dynamic> get platformSpecificSettings {
    if (_platformSpecificSettings is EqualUnmodifiableMapView)
      return _platformSpecificSettings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_platformSpecificSettings);
  }

  @override
  final String? pushToken;
  @override
  final String? biometricId;
  final List<String> _enabledFeatures;
  @override
  @JsonKey()
  List<String> get enabledFeatures {
    if (_enabledFeatures is EqualUnmodifiableListView) return _enabledFeatures;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_enabledFeatures);
  }

  @override
  String toString() {
    return 'DeviceSettings(deviceId: $deviceId, deviceName: $deviceName, platform: $platform, appVersion: $appVersion, lastActive: $lastActive, syncEnabled: $syncEnabled, platformSpecificSettings: $platformSpecificSettings, pushToken: $pushToken, biometricId: $biometricId, enabledFeatures: $enabledFeatures)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceSettingsImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.deviceName, deviceName) ||
                other.deviceName == deviceName) &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.appVersion, appVersion) ||
                other.appVersion == appVersion) &&
            (identical(other.lastActive, lastActive) ||
                other.lastActive == lastActive) &&
            (identical(other.syncEnabled, syncEnabled) ||
                other.syncEnabled == syncEnabled) &&
            const DeepCollectionEquality().equals(
                other._platformSpecificSettings, _platformSpecificSettings) &&
            (identical(other.pushToken, pushToken) ||
                other.pushToken == pushToken) &&
            (identical(other.biometricId, biometricId) ||
                other.biometricId == biometricId) &&
            const DeepCollectionEquality()
                .equals(other._enabledFeatures, _enabledFeatures));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      deviceId,
      deviceName,
      platform,
      appVersion,
      lastActive,
      syncEnabled,
      const DeepCollectionEquality().hash(_platformSpecificSettings),
      pushToken,
      biometricId,
      const DeepCollectionEquality().hash(_enabledFeatures));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceSettingsImplCopyWith<_$DeviceSettingsImpl> get copyWith =>
      __$$DeviceSettingsImplCopyWithImpl<_$DeviceSettingsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceSettingsImplToJson(
      this,
    );
  }
}

abstract class _DeviceSettings implements DeviceSettings {
  const factory _DeviceSettings(
      {required final String deviceId,
      required final String deviceName,
      required final String platform,
      required final String appVersion,
      required final DateTime lastActive,
      final bool syncEnabled,
      final Map<String, dynamic> platformSpecificSettings,
      final String? pushToken,
      final String? biometricId,
      final List<String> enabledFeatures}) = _$DeviceSettingsImpl;

  factory _DeviceSettings.fromJson(Map<String, dynamic> json) =
      _$DeviceSettingsImpl.fromJson;

  @override
  String get deviceId;
  @override
  String get deviceName;
  @override
  String get platform;
  @override
  String get appVersion;
  @override
  DateTime get lastActive;
  @override
  bool get syncEnabled;
  @override
  Map<String, dynamic> get platformSpecificSettings;
  @override
  String? get pushToken;
  @override
  String? get biometricId;
  @override
  List<String> get enabledFeatures;
  @override
  @JsonKey(ignore: true)
  _$$DeviceSettingsImplCopyWith<_$DeviceSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SettingsChangeLog _$SettingsChangeLogFromJson(Map<String, dynamic> json) {
  return _SettingsChangeLog.fromJson(json);
}

/// @nodoc
mixin _$SettingsChangeLog {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get settingKey => throw _privateConstructorUsedError;
  String get oldValue => throw _privateConstructorUsedError;
  String get newValue => throw _privateConstructorUsedError;
  DateTime get changedAt => throw _privateConstructorUsedError;
  String? get changedBy => throw _privateConstructorUsedError;
  String? get reason => throw _privateConstructorUsedError;
  String? get deviceId => throw _privateConstructorUsedError;
  String? get ipAddress => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SettingsChangeLogCopyWith<SettingsChangeLog> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsChangeLogCopyWith<$Res> {
  factory $SettingsChangeLogCopyWith(
          SettingsChangeLog value, $Res Function(SettingsChangeLog) then) =
      _$SettingsChangeLogCopyWithImpl<$Res, SettingsChangeLog>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String settingKey,
      String oldValue,
      String newValue,
      DateTime changedAt,
      String? changedBy,
      String? reason,
      String? deviceId,
      String? ipAddress});
}

/// @nodoc
class _$SettingsChangeLogCopyWithImpl<$Res, $Val extends SettingsChangeLog>
    implements $SettingsChangeLogCopyWith<$Res> {
  _$SettingsChangeLogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? settingKey = null,
    Object? oldValue = null,
    Object? newValue = null,
    Object? changedAt = null,
    Object? changedBy = freezed,
    Object? reason = freezed,
    Object? deviceId = freezed,
    Object? ipAddress = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      settingKey: null == settingKey
          ? _value.settingKey
          : settingKey // ignore: cast_nullable_to_non_nullable
              as String,
      oldValue: null == oldValue
          ? _value.oldValue
          : oldValue // ignore: cast_nullable_to_non_nullable
              as String,
      newValue: null == newValue
          ? _value.newValue
          : newValue // ignore: cast_nullable_to_non_nullable
              as String,
      changedAt: null == changedAt
          ? _value.changedAt
          : changedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      changedBy: freezed == changedBy
          ? _value.changedBy
          : changedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      ipAddress: freezed == ipAddress
          ? _value.ipAddress
          : ipAddress // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SettingsChangeLogImplCopyWith<$Res>
    implements $SettingsChangeLogCopyWith<$Res> {
  factory _$$SettingsChangeLogImplCopyWith(_$SettingsChangeLogImpl value,
          $Res Function(_$SettingsChangeLogImpl) then) =
      __$$SettingsChangeLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String settingKey,
      String oldValue,
      String newValue,
      DateTime changedAt,
      String? changedBy,
      String? reason,
      String? deviceId,
      String? ipAddress});
}

/// @nodoc
class __$$SettingsChangeLogImplCopyWithImpl<$Res>
    extends _$SettingsChangeLogCopyWithImpl<$Res, _$SettingsChangeLogImpl>
    implements _$$SettingsChangeLogImplCopyWith<$Res> {
  __$$SettingsChangeLogImplCopyWithImpl(_$SettingsChangeLogImpl _value,
      $Res Function(_$SettingsChangeLogImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? settingKey = null,
    Object? oldValue = null,
    Object? newValue = null,
    Object? changedAt = null,
    Object? changedBy = freezed,
    Object? reason = freezed,
    Object? deviceId = freezed,
    Object? ipAddress = freezed,
  }) {
    return _then(_$SettingsChangeLogImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      settingKey: null == settingKey
          ? _value.settingKey
          : settingKey // ignore: cast_nullable_to_non_nullable
              as String,
      oldValue: null == oldValue
          ? _value.oldValue
          : oldValue // ignore: cast_nullable_to_non_nullable
              as String,
      newValue: null == newValue
          ? _value.newValue
          : newValue // ignore: cast_nullable_to_non_nullable
              as String,
      changedAt: null == changedAt
          ? _value.changedAt
          : changedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      changedBy: freezed == changedBy
          ? _value.changedBy
          : changedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      ipAddress: freezed == ipAddress
          ? _value.ipAddress
          : ipAddress // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SettingsChangeLogImpl implements _SettingsChangeLog {
  const _$SettingsChangeLogImpl(
      {required this.id,
      required this.userId,
      required this.settingKey,
      required this.oldValue,
      required this.newValue,
      required this.changedAt,
      this.changedBy,
      this.reason,
      this.deviceId,
      this.ipAddress});

  factory _$SettingsChangeLogImpl.fromJson(Map<String, dynamic> json) =>
      _$$SettingsChangeLogImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String settingKey;
  @override
  final String oldValue;
  @override
  final String newValue;
  @override
  final DateTime changedAt;
  @override
  final String? changedBy;
  @override
  final String? reason;
  @override
  final String? deviceId;
  @override
  final String? ipAddress;

  @override
  String toString() {
    return 'SettingsChangeLog(id: $id, userId: $userId, settingKey: $settingKey, oldValue: $oldValue, newValue: $newValue, changedAt: $changedAt, changedBy: $changedBy, reason: $reason, deviceId: $deviceId, ipAddress: $ipAddress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsChangeLogImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.settingKey, settingKey) ||
                other.settingKey == settingKey) &&
            (identical(other.oldValue, oldValue) ||
                other.oldValue == oldValue) &&
            (identical(other.newValue, newValue) ||
                other.newValue == newValue) &&
            (identical(other.changedAt, changedAt) ||
                other.changedAt == changedAt) &&
            (identical(other.changedBy, changedBy) ||
                other.changedBy == changedBy) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.ipAddress, ipAddress) ||
                other.ipAddress == ipAddress));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, settingKey, oldValue,
      newValue, changedAt, changedBy, reason, deviceId, ipAddress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingsChangeLogImplCopyWith<_$SettingsChangeLogImpl> get copyWith =>
      __$$SettingsChangeLogImplCopyWithImpl<_$SettingsChangeLogImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SettingsChangeLogImplToJson(
      this,
    );
  }
}

abstract class _SettingsChangeLog implements SettingsChangeLog {
  const factory _SettingsChangeLog(
      {required final String id,
      required final String userId,
      required final String settingKey,
      required final String oldValue,
      required final String newValue,
      required final DateTime changedAt,
      final String? changedBy,
      final String? reason,
      final String? deviceId,
      final String? ipAddress}) = _$SettingsChangeLogImpl;

  factory _SettingsChangeLog.fromJson(Map<String, dynamic> json) =
      _$SettingsChangeLogImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get settingKey;
  @override
  String get oldValue;
  @override
  String get newValue;
  @override
  DateTime get changedAt;
  @override
  String? get changedBy;
  @override
  String? get reason;
  @override
  String? get deviceId;
  @override
  String? get ipAddress;
  @override
  @JsonKey(ignore: true)
  _$$SettingsChangeLogImplCopyWith<_$SettingsChangeLogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
