// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Notification _$NotificationFromJson(Map<String, dynamic> json) {
  return _Notification.fromJson(json);
}

/// @nodoc
mixin _$Notification {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  NotificationType get type => throw _privateConstructorUsedError;
  NotificationPriority get priority => throw _privateConstructorUsedError;
  NotificationChannel get channel => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  bool get isRead => throw _privateConstructorUsedError;
  bool get isDelivered => throw _privateConstructorUsedError;
  DateTime? get readAt => throw _privateConstructorUsedError;
  DateTime? get expiresAt => throw _privateConstructorUsedError;
  String? get actionUrl => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  Map<String, dynamic>? get data => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;
  String? get groupId => throw _privateConstructorUsedError;
  String? get campaignId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationCopyWith<Notification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationCopyWith<$Res> {
  factory $NotificationCopyWith(
          Notification value, $Res Function(Notification) then) =
      _$NotificationCopyWithImpl<$Res, Notification>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String title,
      String message,
      NotificationType type,
      NotificationPriority priority,
      NotificationChannel channel,
      DateTime createdAt,
      bool isRead,
      bool isDelivered,
      DateTime? readAt,
      DateTime? expiresAt,
      String? actionUrl,
      String? imageUrl,
      Map<String, dynamic>? data,
      Map<String, dynamic>? metadata,
      String? groupId,
      String? campaignId});
}

/// @nodoc
class _$NotificationCopyWithImpl<$Res, $Val extends Notification>
    implements $NotificationCopyWith<$Res> {
  _$NotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? title = null,
    Object? message = null,
    Object? type = null,
    Object? priority = null,
    Object? channel = null,
    Object? createdAt = null,
    Object? isRead = null,
    Object? isDelivered = null,
    Object? readAt = freezed,
    Object? expiresAt = freezed,
    Object? actionUrl = freezed,
    Object? imageUrl = freezed,
    Object? data = freezed,
    Object? metadata = freezed,
    Object? groupId = freezed,
    Object? campaignId = freezed,
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
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as NotificationPriority,
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as NotificationChannel,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      isDelivered: null == isDelivered
          ? _value.isDelivered
          : isDelivered // ignore: cast_nullable_to_non_nullable
              as bool,
      readAt: freezed == readAt
          ? _value.readAt
          : readAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      actionUrl: freezed == actionUrl
          ? _value.actionUrl
          : actionUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      groupId: freezed == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String?,
      campaignId: freezed == campaignId
          ? _value.campaignId
          : campaignId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationImplCopyWith<$Res>
    implements $NotificationCopyWith<$Res> {
  factory _$$NotificationImplCopyWith(
          _$NotificationImpl value, $Res Function(_$NotificationImpl) then) =
      __$$NotificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String title,
      String message,
      NotificationType type,
      NotificationPriority priority,
      NotificationChannel channel,
      DateTime createdAt,
      bool isRead,
      bool isDelivered,
      DateTime? readAt,
      DateTime? expiresAt,
      String? actionUrl,
      String? imageUrl,
      Map<String, dynamic>? data,
      Map<String, dynamic>? metadata,
      String? groupId,
      String? campaignId});
}

/// @nodoc
class __$$NotificationImplCopyWithImpl<$Res>
    extends _$NotificationCopyWithImpl<$Res, _$NotificationImpl>
    implements _$$NotificationImplCopyWith<$Res> {
  __$$NotificationImplCopyWithImpl(
      _$NotificationImpl _value, $Res Function(_$NotificationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? title = null,
    Object? message = null,
    Object? type = null,
    Object? priority = null,
    Object? channel = null,
    Object? createdAt = null,
    Object? isRead = null,
    Object? isDelivered = null,
    Object? readAt = freezed,
    Object? expiresAt = freezed,
    Object? actionUrl = freezed,
    Object? imageUrl = freezed,
    Object? data = freezed,
    Object? metadata = freezed,
    Object? groupId = freezed,
    Object? campaignId = freezed,
  }) {
    return _then(_$NotificationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as NotificationPriority,
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as NotificationChannel,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      isDelivered: null == isDelivered
          ? _value.isDelivered
          : isDelivered // ignore: cast_nullable_to_non_nullable
              as bool,
      readAt: freezed == readAt
          ? _value.readAt
          : readAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      actionUrl: freezed == actionUrl
          ? _value.actionUrl
          : actionUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      groupId: freezed == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String?,
      campaignId: freezed == campaignId
          ? _value.campaignId
          : campaignId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationImpl implements _Notification {
  const _$NotificationImpl(
      {required this.id,
      required this.userId,
      required this.title,
      required this.message,
      required this.type,
      required this.priority,
      required this.channel,
      required this.createdAt,
      required this.isRead,
      required this.isDelivered,
      this.readAt,
      this.expiresAt,
      this.actionUrl,
      this.imageUrl,
      final Map<String, dynamic>? data,
      final Map<String, dynamic>? metadata,
      this.groupId,
      this.campaignId})
      : _data = data,
        _metadata = metadata;

  factory _$NotificationImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String title;
  @override
  final String message;
  @override
  final NotificationType type;
  @override
  final NotificationPriority priority;
  @override
  final NotificationChannel channel;
  @override
  final DateTime createdAt;
  @override
  final bool isRead;
  @override
  final bool isDelivered;
  @override
  final DateTime? readAt;
  @override
  final DateTime? expiresAt;
  @override
  final String? actionUrl;
  @override
  final String? imageUrl;
  final Map<String, dynamic>? _data;
  @override
  Map<String, dynamic>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String? groupId;
  @override
  final String? campaignId;

  @override
  String toString() {
    return 'Notification(id: $id, userId: $userId, title: $title, message: $message, type: $type, priority: $priority, channel: $channel, createdAt: $createdAt, isRead: $isRead, isDelivered: $isDelivered, readAt: $readAt, expiresAt: $expiresAt, actionUrl: $actionUrl, imageUrl: $imageUrl, data: $data, metadata: $metadata, groupId: $groupId, campaignId: $campaignId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isRead, isRead) || other.isRead == isRead) &&
            (identical(other.isDelivered, isDelivered) ||
                other.isDelivered == isDelivered) &&
            (identical(other.readAt, readAt) || other.readAt == readAt) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.actionUrl, actionUrl) ||
                other.actionUrl == actionUrl) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.campaignId, campaignId) ||
                other.campaignId == campaignId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      title,
      message,
      type,
      priority,
      channel,
      createdAt,
      isRead,
      isDelivered,
      readAt,
      expiresAt,
      actionUrl,
      imageUrl,
      const DeepCollectionEquality().hash(_data),
      const DeepCollectionEquality().hash(_metadata),
      groupId,
      campaignId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationImplCopyWith<_$NotificationImpl> get copyWith =>
      __$$NotificationImplCopyWithImpl<_$NotificationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationImplToJson(
      this,
    );
  }
}

abstract class _Notification implements Notification {
  const factory _Notification(
      {required final String id,
      required final String userId,
      required final String title,
      required final String message,
      required final NotificationType type,
      required final NotificationPriority priority,
      required final NotificationChannel channel,
      required final DateTime createdAt,
      required final bool isRead,
      required final bool isDelivered,
      final DateTime? readAt,
      final DateTime? expiresAt,
      final String? actionUrl,
      final String? imageUrl,
      final Map<String, dynamic>? data,
      final Map<String, dynamic>? metadata,
      final String? groupId,
      final String? campaignId}) = _$NotificationImpl;

  factory _Notification.fromJson(Map<String, dynamic> json) =
      _$NotificationImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get title;
  @override
  String get message;
  @override
  NotificationType get type;
  @override
  NotificationPriority get priority;
  @override
  NotificationChannel get channel;
  @override
  DateTime get createdAt;
  @override
  bool get isRead;
  @override
  bool get isDelivered;
  @override
  DateTime? get readAt;
  @override
  DateTime? get expiresAt;
  @override
  String? get actionUrl;
  @override
  String? get imageUrl;
  @override
  Map<String, dynamic>? get data;
  @override
  Map<String, dynamic>? get metadata;
  @override
  String? get groupId;
  @override
  String? get campaignId;
  @override
  @JsonKey(ignore: true)
  _$$NotificationImplCopyWith<_$NotificationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NotificationPreferences _$NotificationPreferencesFromJson(
    Map<String, dynamic> json) {
  return _NotificationPreferences.fromJson(json);
}

/// @nodoc
mixin _$NotificationPreferences {
  String get userId => throw _privateConstructorUsedError;
  Map<NotificationType, bool> get typePreferences =>
      throw _privateConstructorUsedError;
  Map<NotificationChannel, bool> get channelPreferences =>
      throw _privateConstructorUsedError;
  Map<NotificationPriority, bool> get priorityPreferences =>
      throw _privateConstructorUsedError;
  bool get allowMarketing => throw _privateConstructorUsedError;
  bool get allowReminders => throw _privateConstructorUsedError;
  QuietHourTime get quietHoursStart => throw _privateConstructorUsedError;
  QuietHourTime get quietHoursEnd => throw _privateConstructorUsedError;
  List<String> get mutedProjects => throw _privateConstructorUsedError;
  List<String> get mutedOrganizations => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationPreferencesCopyWith<NotificationPreferences> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationPreferencesCopyWith<$Res> {
  factory $NotificationPreferencesCopyWith(NotificationPreferences value,
          $Res Function(NotificationPreferences) then) =
      _$NotificationPreferencesCopyWithImpl<$Res, NotificationPreferences>;
  @useResult
  $Res call(
      {String userId,
      Map<NotificationType, bool> typePreferences,
      Map<NotificationChannel, bool> channelPreferences,
      Map<NotificationPriority, bool> priorityPreferences,
      bool allowMarketing,
      bool allowReminders,
      QuietHourTime quietHoursStart,
      QuietHourTime quietHoursEnd,
      List<String> mutedProjects,
      List<String> mutedOrganizations,
      DateTime? updatedAt});

  $QuietHourTimeCopyWith<$Res> get quietHoursStart;
  $QuietHourTimeCopyWith<$Res> get quietHoursEnd;
}

/// @nodoc
class _$NotificationPreferencesCopyWithImpl<$Res,
        $Val extends NotificationPreferences>
    implements $NotificationPreferencesCopyWith<$Res> {
  _$NotificationPreferencesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? typePreferences = null,
    Object? channelPreferences = null,
    Object? priorityPreferences = null,
    Object? allowMarketing = null,
    Object? allowReminders = null,
    Object? quietHoursStart = null,
    Object? quietHoursEnd = null,
    Object? mutedProjects = null,
    Object? mutedOrganizations = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      typePreferences: null == typePreferences
          ? _value.typePreferences
          : typePreferences // ignore: cast_nullable_to_non_nullable
              as Map<NotificationType, bool>,
      channelPreferences: null == channelPreferences
          ? _value.channelPreferences
          : channelPreferences // ignore: cast_nullable_to_non_nullable
              as Map<NotificationChannel, bool>,
      priorityPreferences: null == priorityPreferences
          ? _value.priorityPreferences
          : priorityPreferences // ignore: cast_nullable_to_non_nullable
              as Map<NotificationPriority, bool>,
      allowMarketing: null == allowMarketing
          ? _value.allowMarketing
          : allowMarketing // ignore: cast_nullable_to_non_nullable
              as bool,
      allowReminders: null == allowReminders
          ? _value.allowReminders
          : allowReminders // ignore: cast_nullable_to_non_nullable
              as bool,
      quietHoursStart: null == quietHoursStart
          ? _value.quietHoursStart
          : quietHoursStart // ignore: cast_nullable_to_non_nullable
              as QuietHourTime,
      quietHoursEnd: null == quietHoursEnd
          ? _value.quietHoursEnd
          : quietHoursEnd // ignore: cast_nullable_to_non_nullable
              as QuietHourTime,
      mutedProjects: null == mutedProjects
          ? _value.mutedProjects
          : mutedProjects // ignore: cast_nullable_to_non_nullable
              as List<String>,
      mutedOrganizations: null == mutedOrganizations
          ? _value.mutedOrganizations
          : mutedOrganizations // ignore: cast_nullable_to_non_nullable
              as List<String>,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $QuietHourTimeCopyWith<$Res> get quietHoursStart {
    return $QuietHourTimeCopyWith<$Res>(_value.quietHoursStart, (value) {
      return _then(_value.copyWith(quietHoursStart: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $QuietHourTimeCopyWith<$Res> get quietHoursEnd {
    return $QuietHourTimeCopyWith<$Res>(_value.quietHoursEnd, (value) {
      return _then(_value.copyWith(quietHoursEnd: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NotificationPreferencesImplCopyWith<$Res>
    implements $NotificationPreferencesCopyWith<$Res> {
  factory _$$NotificationPreferencesImplCopyWith(
          _$NotificationPreferencesImpl value,
          $Res Function(_$NotificationPreferencesImpl) then) =
      __$$NotificationPreferencesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      Map<NotificationType, bool> typePreferences,
      Map<NotificationChannel, bool> channelPreferences,
      Map<NotificationPriority, bool> priorityPreferences,
      bool allowMarketing,
      bool allowReminders,
      QuietHourTime quietHoursStart,
      QuietHourTime quietHoursEnd,
      List<String> mutedProjects,
      List<String> mutedOrganizations,
      DateTime? updatedAt});

  @override
  $QuietHourTimeCopyWith<$Res> get quietHoursStart;
  @override
  $QuietHourTimeCopyWith<$Res> get quietHoursEnd;
}

/// @nodoc
class __$$NotificationPreferencesImplCopyWithImpl<$Res>
    extends _$NotificationPreferencesCopyWithImpl<$Res,
        _$NotificationPreferencesImpl>
    implements _$$NotificationPreferencesImplCopyWith<$Res> {
  __$$NotificationPreferencesImplCopyWithImpl(
      _$NotificationPreferencesImpl _value,
      $Res Function(_$NotificationPreferencesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? typePreferences = null,
    Object? channelPreferences = null,
    Object? priorityPreferences = null,
    Object? allowMarketing = null,
    Object? allowReminders = null,
    Object? quietHoursStart = null,
    Object? quietHoursEnd = null,
    Object? mutedProjects = null,
    Object? mutedOrganizations = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_$NotificationPreferencesImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      typePreferences: null == typePreferences
          ? _value._typePreferences
          : typePreferences // ignore: cast_nullable_to_non_nullable
              as Map<NotificationType, bool>,
      channelPreferences: null == channelPreferences
          ? _value._channelPreferences
          : channelPreferences // ignore: cast_nullable_to_non_nullable
              as Map<NotificationChannel, bool>,
      priorityPreferences: null == priorityPreferences
          ? _value._priorityPreferences
          : priorityPreferences // ignore: cast_nullable_to_non_nullable
              as Map<NotificationPriority, bool>,
      allowMarketing: null == allowMarketing
          ? _value.allowMarketing
          : allowMarketing // ignore: cast_nullable_to_non_nullable
              as bool,
      allowReminders: null == allowReminders
          ? _value.allowReminders
          : allowReminders // ignore: cast_nullable_to_non_nullable
              as bool,
      quietHoursStart: null == quietHoursStart
          ? _value.quietHoursStart
          : quietHoursStart // ignore: cast_nullable_to_non_nullable
              as QuietHourTime,
      quietHoursEnd: null == quietHoursEnd
          ? _value.quietHoursEnd
          : quietHoursEnd // ignore: cast_nullable_to_non_nullable
              as QuietHourTime,
      mutedProjects: null == mutedProjects
          ? _value._mutedProjects
          : mutedProjects // ignore: cast_nullable_to_non_nullable
              as List<String>,
      mutedOrganizations: null == mutedOrganizations
          ? _value._mutedOrganizations
          : mutedOrganizations // ignore: cast_nullable_to_non_nullable
              as List<String>,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationPreferencesImpl implements _NotificationPreferences {
  const _$NotificationPreferencesImpl(
      {required this.userId,
      final Map<NotificationType, bool> typePreferences = const {},
      final Map<NotificationChannel, bool> channelPreferences = const {},
      final Map<NotificationPriority, bool> priorityPreferences = const {},
      this.allowMarketing = true,
      this.allowReminders = true,
      this.quietHoursStart = const QuietHourTime(hour: 9, minute: 0),
      this.quietHoursEnd = const QuietHourTime(hour: 22, minute: 0),
      final List<String> mutedProjects = const [],
      final List<String> mutedOrganizations = const [],
      this.updatedAt})
      : _typePreferences = typePreferences,
        _channelPreferences = channelPreferences,
        _priorityPreferences = priorityPreferences,
        _mutedProjects = mutedProjects,
        _mutedOrganizations = mutedOrganizations;

  factory _$NotificationPreferencesImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationPreferencesImplFromJson(json);

  @override
  final String userId;
  final Map<NotificationType, bool> _typePreferences;
  @override
  @JsonKey()
  Map<NotificationType, bool> get typePreferences {
    if (_typePreferences is EqualUnmodifiableMapView) return _typePreferences;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_typePreferences);
  }

  final Map<NotificationChannel, bool> _channelPreferences;
  @override
  @JsonKey()
  Map<NotificationChannel, bool> get channelPreferences {
    if (_channelPreferences is EqualUnmodifiableMapView)
      return _channelPreferences;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_channelPreferences);
  }

  final Map<NotificationPriority, bool> _priorityPreferences;
  @override
  @JsonKey()
  Map<NotificationPriority, bool> get priorityPreferences {
    if (_priorityPreferences is EqualUnmodifiableMapView)
      return _priorityPreferences;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_priorityPreferences);
  }

  @override
  @JsonKey()
  final bool allowMarketing;
  @override
  @JsonKey()
  final bool allowReminders;
  @override
  @JsonKey()
  final QuietHourTime quietHoursStart;
  @override
  @JsonKey()
  final QuietHourTime quietHoursEnd;
  final List<String> _mutedProjects;
  @override
  @JsonKey()
  List<String> get mutedProjects {
    if (_mutedProjects is EqualUnmodifiableListView) return _mutedProjects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mutedProjects);
  }

  final List<String> _mutedOrganizations;
  @override
  @JsonKey()
  List<String> get mutedOrganizations {
    if (_mutedOrganizations is EqualUnmodifiableListView)
      return _mutedOrganizations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mutedOrganizations);
  }

  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'NotificationPreferences(userId: $userId, typePreferences: $typePreferences, channelPreferences: $channelPreferences, priorityPreferences: $priorityPreferences, allowMarketing: $allowMarketing, allowReminders: $allowReminders, quietHoursStart: $quietHoursStart, quietHoursEnd: $quietHoursEnd, mutedProjects: $mutedProjects, mutedOrganizations: $mutedOrganizations, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationPreferencesImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality()
                .equals(other._typePreferences, _typePreferences) &&
            const DeepCollectionEquality()
                .equals(other._channelPreferences, _channelPreferences) &&
            const DeepCollectionEquality()
                .equals(other._priorityPreferences, _priorityPreferences) &&
            (identical(other.allowMarketing, allowMarketing) ||
                other.allowMarketing == allowMarketing) &&
            (identical(other.allowReminders, allowReminders) ||
                other.allowReminders == allowReminders) &&
            (identical(other.quietHoursStart, quietHoursStart) ||
                other.quietHoursStart == quietHoursStart) &&
            (identical(other.quietHoursEnd, quietHoursEnd) ||
                other.quietHoursEnd == quietHoursEnd) &&
            const DeepCollectionEquality()
                .equals(other._mutedProjects, _mutedProjects) &&
            const DeepCollectionEquality()
                .equals(other._mutedOrganizations, _mutedOrganizations) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      const DeepCollectionEquality().hash(_typePreferences),
      const DeepCollectionEquality().hash(_channelPreferences),
      const DeepCollectionEquality().hash(_priorityPreferences),
      allowMarketing,
      allowReminders,
      quietHoursStart,
      quietHoursEnd,
      const DeepCollectionEquality().hash(_mutedProjects),
      const DeepCollectionEquality().hash(_mutedOrganizations),
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationPreferencesImplCopyWith<_$NotificationPreferencesImpl>
      get copyWith => __$$NotificationPreferencesImplCopyWithImpl<
          _$NotificationPreferencesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationPreferencesImplToJson(
      this,
    );
  }
}

abstract class _NotificationPreferences implements NotificationPreferences {
  const factory _NotificationPreferences(
      {required final String userId,
      final Map<NotificationType, bool> typePreferences,
      final Map<NotificationChannel, bool> channelPreferences,
      final Map<NotificationPriority, bool> priorityPreferences,
      final bool allowMarketing,
      final bool allowReminders,
      final QuietHourTime quietHoursStart,
      final QuietHourTime quietHoursEnd,
      final List<String> mutedProjects,
      final List<String> mutedOrganizations,
      final DateTime? updatedAt}) = _$NotificationPreferencesImpl;

  factory _NotificationPreferences.fromJson(Map<String, dynamic> json) =
      _$NotificationPreferencesImpl.fromJson;

  @override
  String get userId;
  @override
  Map<NotificationType, bool> get typePreferences;
  @override
  Map<NotificationChannel, bool> get channelPreferences;
  @override
  Map<NotificationPriority, bool> get priorityPreferences;
  @override
  bool get allowMarketing;
  @override
  bool get allowReminders;
  @override
  QuietHourTime get quietHoursStart;
  @override
  QuietHourTime get quietHoursEnd;
  @override
  List<String> get mutedProjects;
  @override
  List<String> get mutedOrganizations;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$NotificationPreferencesImplCopyWith<_$NotificationPreferencesImpl>
      get copyWith => throw _privateConstructorUsedError;
}

QuietHourTime _$QuietHourTimeFromJson(Map<String, dynamic> json) {
  return _QuietHourTime.fromJson(json);
}

/// @nodoc
mixin _$QuietHourTime {
  int get hour => throw _privateConstructorUsedError;
  int get minute => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuietHourTimeCopyWith<QuietHourTime> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuietHourTimeCopyWith<$Res> {
  factory $QuietHourTimeCopyWith(
          QuietHourTime value, $Res Function(QuietHourTime) then) =
      _$QuietHourTimeCopyWithImpl<$Res, QuietHourTime>;
  @useResult
  $Res call({int hour, int minute});
}

/// @nodoc
class _$QuietHourTimeCopyWithImpl<$Res, $Val extends QuietHourTime>
    implements $QuietHourTimeCopyWith<$Res> {
  _$QuietHourTimeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hour = null,
    Object? minute = null,
  }) {
    return _then(_value.copyWith(
      hour: null == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
      minute: null == minute
          ? _value.minute
          : minute // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuietHourTimeImplCopyWith<$Res>
    implements $QuietHourTimeCopyWith<$Res> {
  factory _$$QuietHourTimeImplCopyWith(
          _$QuietHourTimeImpl value, $Res Function(_$QuietHourTimeImpl) then) =
      __$$QuietHourTimeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int hour, int minute});
}

/// @nodoc
class __$$QuietHourTimeImplCopyWithImpl<$Res>
    extends _$QuietHourTimeCopyWithImpl<$Res, _$QuietHourTimeImpl>
    implements _$$QuietHourTimeImplCopyWith<$Res> {
  __$$QuietHourTimeImplCopyWithImpl(
      _$QuietHourTimeImpl _value, $Res Function(_$QuietHourTimeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hour = null,
    Object? minute = null,
  }) {
    return _then(_$QuietHourTimeImpl(
      hour: null == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
      minute: null == minute
          ? _value.minute
          : minute // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuietHourTimeImpl implements _QuietHourTime {
  const _$QuietHourTimeImpl({required this.hour, required this.minute});

  factory _$QuietHourTimeImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuietHourTimeImplFromJson(json);

  @override
  final int hour;
  @override
  final int minute;

  @override
  String toString() {
    return 'QuietHourTime(hour: $hour, minute: $minute)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuietHourTimeImpl &&
            (identical(other.hour, hour) || other.hour == hour) &&
            (identical(other.minute, minute) || other.minute == minute));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, hour, minute);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuietHourTimeImplCopyWith<_$QuietHourTimeImpl> get copyWith =>
      __$$QuietHourTimeImplCopyWithImpl<_$QuietHourTimeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuietHourTimeImplToJson(
      this,
    );
  }
}

abstract class _QuietHourTime implements QuietHourTime {
  const factory _QuietHourTime(
      {required final int hour,
      required final int minute}) = _$QuietHourTimeImpl;

  factory _QuietHourTime.fromJson(Map<String, dynamic> json) =
      _$QuietHourTimeImpl.fromJson;

  @override
  int get hour;
  @override
  int get minute;
  @override
  @JsonKey(ignore: true)
  _$$QuietHourTimeImplCopyWith<_$QuietHourTimeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NotificationTemplate _$NotificationTemplateFromJson(Map<String, dynamic> json) {
  return _NotificationTemplate.fromJson(json);
}

/// @nodoc
mixin _$NotificationTemplate {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  NotificationType get type => throw _privateConstructorUsedError;
  String get titleTemplate => throw _privateConstructorUsedError;
  String get messageTemplate => throw _privateConstructorUsedError;
  NotificationPriority get defaultPriority =>
      throw _privateConstructorUsedError;
  List<NotificationChannel> get defaultChannels =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> get defaultData => throw _privateConstructorUsedError;
  List<String> get requiredVariables => throw _privateConstructorUsedError;
  bool? get isActive => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationTemplateCopyWith<NotificationTemplate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationTemplateCopyWith<$Res> {
  factory $NotificationTemplateCopyWith(NotificationTemplate value,
          $Res Function(NotificationTemplate) then) =
      _$NotificationTemplateCopyWithImpl<$Res, NotificationTemplate>;
  @useResult
  $Res call(
      {String id,
      String name,
      NotificationType type,
      String titleTemplate,
      String messageTemplate,
      NotificationPriority defaultPriority,
      List<NotificationChannel> defaultChannels,
      Map<String, dynamic> defaultData,
      List<String> requiredVariables,
      bool? isActive,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$NotificationTemplateCopyWithImpl<$Res,
        $Val extends NotificationTemplate>
    implements $NotificationTemplateCopyWith<$Res> {
  _$NotificationTemplateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? titleTemplate = null,
    Object? messageTemplate = null,
    Object? defaultPriority = null,
    Object? defaultChannels = null,
    Object? defaultData = null,
    Object? requiredVariables = null,
    Object? isActive = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType,
      titleTemplate: null == titleTemplate
          ? _value.titleTemplate
          : titleTemplate // ignore: cast_nullable_to_non_nullable
              as String,
      messageTemplate: null == messageTemplate
          ? _value.messageTemplate
          : messageTemplate // ignore: cast_nullable_to_non_nullable
              as String,
      defaultPriority: null == defaultPriority
          ? _value.defaultPriority
          : defaultPriority // ignore: cast_nullable_to_non_nullable
              as NotificationPriority,
      defaultChannels: null == defaultChannels
          ? _value.defaultChannels
          : defaultChannels // ignore: cast_nullable_to_non_nullable
              as List<NotificationChannel>,
      defaultData: null == defaultData
          ? _value.defaultData
          : defaultData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      requiredVariables: null == requiredVariables
          ? _value.requiredVariables
          : requiredVariables // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationTemplateImplCopyWith<$Res>
    implements $NotificationTemplateCopyWith<$Res> {
  factory _$$NotificationTemplateImplCopyWith(_$NotificationTemplateImpl value,
          $Res Function(_$NotificationTemplateImpl) then) =
      __$$NotificationTemplateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      NotificationType type,
      String titleTemplate,
      String messageTemplate,
      NotificationPriority defaultPriority,
      List<NotificationChannel> defaultChannels,
      Map<String, dynamic> defaultData,
      List<String> requiredVariables,
      bool? isActive,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$NotificationTemplateImplCopyWithImpl<$Res>
    extends _$NotificationTemplateCopyWithImpl<$Res, _$NotificationTemplateImpl>
    implements _$$NotificationTemplateImplCopyWith<$Res> {
  __$$NotificationTemplateImplCopyWithImpl(_$NotificationTemplateImpl _value,
      $Res Function(_$NotificationTemplateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? titleTemplate = null,
    Object? messageTemplate = null,
    Object? defaultPriority = null,
    Object? defaultChannels = null,
    Object? defaultData = null,
    Object? requiredVariables = null,
    Object? isActive = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$NotificationTemplateImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType,
      titleTemplate: null == titleTemplate
          ? _value.titleTemplate
          : titleTemplate // ignore: cast_nullable_to_non_nullable
              as String,
      messageTemplate: null == messageTemplate
          ? _value.messageTemplate
          : messageTemplate // ignore: cast_nullable_to_non_nullable
              as String,
      defaultPriority: null == defaultPriority
          ? _value.defaultPriority
          : defaultPriority // ignore: cast_nullable_to_non_nullable
              as NotificationPriority,
      defaultChannels: null == defaultChannels
          ? _value._defaultChannels
          : defaultChannels // ignore: cast_nullable_to_non_nullable
              as List<NotificationChannel>,
      defaultData: null == defaultData
          ? _value._defaultData
          : defaultData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      requiredVariables: null == requiredVariables
          ? _value._requiredVariables
          : requiredVariables // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationTemplateImpl implements _NotificationTemplate {
  const _$NotificationTemplateImpl(
      {required this.id,
      required this.name,
      required this.type,
      required this.titleTemplate,
      required this.messageTemplate,
      required this.defaultPriority,
      final List<NotificationChannel> defaultChannels = const [
        NotificationChannel.inApp
      ],
      final Map<String, dynamic> defaultData = const {},
      final List<String> requiredVariables = const [],
      this.isActive,
      this.createdAt,
      this.updatedAt})
      : _defaultChannels = defaultChannels,
        _defaultData = defaultData,
        _requiredVariables = requiredVariables;

  factory _$NotificationTemplateImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationTemplateImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final NotificationType type;
  @override
  final String titleTemplate;
  @override
  final String messageTemplate;
  @override
  final NotificationPriority defaultPriority;
  final List<NotificationChannel> _defaultChannels;
  @override
  @JsonKey()
  List<NotificationChannel> get defaultChannels {
    if (_defaultChannels is EqualUnmodifiableListView) return _defaultChannels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_defaultChannels);
  }

  final Map<String, dynamic> _defaultData;
  @override
  @JsonKey()
  Map<String, dynamic> get defaultData {
    if (_defaultData is EqualUnmodifiableMapView) return _defaultData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_defaultData);
  }

  final List<String> _requiredVariables;
  @override
  @JsonKey()
  List<String> get requiredVariables {
    if (_requiredVariables is EqualUnmodifiableListView)
      return _requiredVariables;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_requiredVariables);
  }

  @override
  final bool? isActive;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'NotificationTemplate(id: $id, name: $name, type: $type, titleTemplate: $titleTemplate, messageTemplate: $messageTemplate, defaultPriority: $defaultPriority, defaultChannels: $defaultChannels, defaultData: $defaultData, requiredVariables: $requiredVariables, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationTemplateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.titleTemplate, titleTemplate) ||
                other.titleTemplate == titleTemplate) &&
            (identical(other.messageTemplate, messageTemplate) ||
                other.messageTemplate == messageTemplate) &&
            (identical(other.defaultPriority, defaultPriority) ||
                other.defaultPriority == defaultPriority) &&
            const DeepCollectionEquality()
                .equals(other._defaultChannels, _defaultChannels) &&
            const DeepCollectionEquality()
                .equals(other._defaultData, _defaultData) &&
            const DeepCollectionEquality()
                .equals(other._requiredVariables, _requiredVariables) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      type,
      titleTemplate,
      messageTemplate,
      defaultPriority,
      const DeepCollectionEquality().hash(_defaultChannels),
      const DeepCollectionEquality().hash(_defaultData),
      const DeepCollectionEquality().hash(_requiredVariables),
      isActive,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationTemplateImplCopyWith<_$NotificationTemplateImpl>
      get copyWith =>
          __$$NotificationTemplateImplCopyWithImpl<_$NotificationTemplateImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationTemplateImplToJson(
      this,
    );
  }
}

abstract class _NotificationTemplate implements NotificationTemplate {
  const factory _NotificationTemplate(
      {required final String id,
      required final String name,
      required final NotificationType type,
      required final String titleTemplate,
      required final String messageTemplate,
      required final NotificationPriority defaultPriority,
      final List<NotificationChannel> defaultChannels,
      final Map<String, dynamic> defaultData,
      final List<String> requiredVariables,
      final bool? isActive,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$NotificationTemplateImpl;

  factory _NotificationTemplate.fromJson(Map<String, dynamic> json) =
      _$NotificationTemplateImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  NotificationType get type;
  @override
  String get titleTemplate;
  @override
  String get messageTemplate;
  @override
  NotificationPriority get defaultPriority;
  @override
  List<NotificationChannel> get defaultChannels;
  @override
  Map<String, dynamic> get defaultData;
  @override
  List<String> get requiredVariables;
  @override
  bool? get isActive;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$NotificationTemplateImplCopyWith<_$NotificationTemplateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

NotificationCampaign _$NotificationCampaignFromJson(Map<String, dynamic> json) {
  return _NotificationCampaign.fromJson(json);
}

/// @nodoc
mixin _$NotificationCampaign {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  CampaignType get type => throw _privateConstructorUsedError;
  CampaignStatus get status => throw _privateConstructorUsedError;
  DateTime get scheduledAt => throw _privateConstructorUsedError;
  NotificationTemplate get template => throw _privateConstructorUsedError;
  Map<String, dynamic> get templateVariables =>
      throw _privateConstructorUsedError;
  List<String> get targetUserIds => throw _privateConstructorUsedError;
  List<UserSegment> get targetSegments => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get startedAt => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;
  String? get createdBy => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationCampaignCopyWith<NotificationCampaign> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationCampaignCopyWith<$Res> {
  factory $NotificationCampaignCopyWith(NotificationCampaign value,
          $Res Function(NotificationCampaign) then) =
      _$NotificationCampaignCopyWithImpl<$Res, NotificationCampaign>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      CampaignType type,
      CampaignStatus status,
      DateTime scheduledAt,
      NotificationTemplate template,
      Map<String, dynamic> templateVariables,
      List<String> targetUserIds,
      List<UserSegment> targetSegments,
      DateTime? createdAt,
      DateTime? startedAt,
      DateTime? completedAt,
      String? createdBy,
      Map<String, dynamic>? metadata});

  $NotificationTemplateCopyWith<$Res> get template;
}

/// @nodoc
class _$NotificationCampaignCopyWithImpl<$Res,
        $Val extends NotificationCampaign>
    implements $NotificationCampaignCopyWith<$Res> {
  _$NotificationCampaignCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? type = null,
    Object? status = null,
    Object? scheduledAt = null,
    Object? template = null,
    Object? templateVariables = null,
    Object? targetUserIds = null,
    Object? targetSegments = null,
    Object? createdAt = freezed,
    Object? startedAt = freezed,
    Object? completedAt = freezed,
    Object? createdBy = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CampaignType,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CampaignStatus,
      scheduledAt: null == scheduledAt
          ? _value.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      template: null == template
          ? _value.template
          : template // ignore: cast_nullable_to_non_nullable
              as NotificationTemplate,
      templateVariables: null == templateVariables
          ? _value.templateVariables
          : templateVariables // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      targetUserIds: null == targetUserIds
          ? _value.targetUserIds
          : targetUserIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      targetSegments: null == targetSegments
          ? _value.targetSegments
          : targetSegments // ignore: cast_nullable_to_non_nullable
              as List<UserSegment>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NotificationTemplateCopyWith<$Res> get template {
    return $NotificationTemplateCopyWith<$Res>(_value.template, (value) {
      return _then(_value.copyWith(template: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NotificationCampaignImplCopyWith<$Res>
    implements $NotificationCampaignCopyWith<$Res> {
  factory _$$NotificationCampaignImplCopyWith(_$NotificationCampaignImpl value,
          $Res Function(_$NotificationCampaignImpl) then) =
      __$$NotificationCampaignImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      CampaignType type,
      CampaignStatus status,
      DateTime scheduledAt,
      NotificationTemplate template,
      Map<String, dynamic> templateVariables,
      List<String> targetUserIds,
      List<UserSegment> targetSegments,
      DateTime? createdAt,
      DateTime? startedAt,
      DateTime? completedAt,
      String? createdBy,
      Map<String, dynamic>? metadata});

  @override
  $NotificationTemplateCopyWith<$Res> get template;
}

/// @nodoc
class __$$NotificationCampaignImplCopyWithImpl<$Res>
    extends _$NotificationCampaignCopyWithImpl<$Res, _$NotificationCampaignImpl>
    implements _$$NotificationCampaignImplCopyWith<$Res> {
  __$$NotificationCampaignImplCopyWithImpl(_$NotificationCampaignImpl _value,
      $Res Function(_$NotificationCampaignImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? type = null,
    Object? status = null,
    Object? scheduledAt = null,
    Object? template = null,
    Object? templateVariables = null,
    Object? targetUserIds = null,
    Object? targetSegments = null,
    Object? createdAt = freezed,
    Object? startedAt = freezed,
    Object? completedAt = freezed,
    Object? createdBy = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_$NotificationCampaignImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CampaignType,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CampaignStatus,
      scheduledAt: null == scheduledAt
          ? _value.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      template: null == template
          ? _value.template
          : template // ignore: cast_nullable_to_non_nullable
              as NotificationTemplate,
      templateVariables: null == templateVariables
          ? _value._templateVariables
          : templateVariables // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      targetUserIds: null == targetUserIds
          ? _value._targetUserIds
          : targetUserIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      targetSegments: null == targetSegments
          ? _value._targetSegments
          : targetSegments // ignore: cast_nullable_to_non_nullable
              as List<UserSegment>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationCampaignImpl implements _NotificationCampaign {
  const _$NotificationCampaignImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.type,
      required this.status,
      required this.scheduledAt,
      required this.template,
      required final Map<String, dynamic> templateVariables,
      final List<String> targetUserIds = const [],
      final List<UserSegment> targetSegments = const [],
      this.createdAt,
      this.startedAt,
      this.completedAt,
      this.createdBy,
      final Map<String, dynamic>? metadata})
      : _templateVariables = templateVariables,
        _targetUserIds = targetUserIds,
        _targetSegments = targetSegments,
        _metadata = metadata;

  factory _$NotificationCampaignImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationCampaignImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final CampaignType type;
  @override
  final CampaignStatus status;
  @override
  final DateTime scheduledAt;
  @override
  final NotificationTemplate template;
  final Map<String, dynamic> _templateVariables;
  @override
  Map<String, dynamic> get templateVariables {
    if (_templateVariables is EqualUnmodifiableMapView)
      return _templateVariables;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_templateVariables);
  }

  final List<String> _targetUserIds;
  @override
  @JsonKey()
  List<String> get targetUserIds {
    if (_targetUserIds is EqualUnmodifiableListView) return _targetUserIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_targetUserIds);
  }

  final List<UserSegment> _targetSegments;
  @override
  @JsonKey()
  List<UserSegment> get targetSegments {
    if (_targetSegments is EqualUnmodifiableListView) return _targetSegments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_targetSegments);
  }

  @override
  final DateTime? createdAt;
  @override
  final DateTime? startedAt;
  @override
  final DateTime? completedAt;
  @override
  final String? createdBy;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'NotificationCampaign(id: $id, name: $name, description: $description, type: $type, status: $status, scheduledAt: $scheduledAt, template: $template, templateVariables: $templateVariables, targetUserIds: $targetUserIds, targetSegments: $targetSegments, createdAt: $createdAt, startedAt: $startedAt, completedAt: $completedAt, createdBy: $createdBy, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationCampaignImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.scheduledAt, scheduledAt) ||
                other.scheduledAt == scheduledAt) &&
            (identical(other.template, template) ||
                other.template == template) &&
            const DeepCollectionEquality()
                .equals(other._templateVariables, _templateVariables) &&
            const DeepCollectionEquality()
                .equals(other._targetUserIds, _targetUserIds) &&
            const DeepCollectionEquality()
                .equals(other._targetSegments, _targetSegments) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      type,
      status,
      scheduledAt,
      template,
      const DeepCollectionEquality().hash(_templateVariables),
      const DeepCollectionEquality().hash(_targetUserIds),
      const DeepCollectionEquality().hash(_targetSegments),
      createdAt,
      startedAt,
      completedAt,
      createdBy,
      const DeepCollectionEquality().hash(_metadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationCampaignImplCopyWith<_$NotificationCampaignImpl>
      get copyWith =>
          __$$NotificationCampaignImplCopyWithImpl<_$NotificationCampaignImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationCampaignImplToJson(
      this,
    );
  }
}

abstract class _NotificationCampaign implements NotificationCampaign {
  const factory _NotificationCampaign(
      {required final String id,
      required final String name,
      required final String description,
      required final CampaignType type,
      required final CampaignStatus status,
      required final DateTime scheduledAt,
      required final NotificationTemplate template,
      required final Map<String, dynamic> templateVariables,
      final List<String> targetUserIds,
      final List<UserSegment> targetSegments,
      final DateTime? createdAt,
      final DateTime? startedAt,
      final DateTime? completedAt,
      final String? createdBy,
      final Map<String, dynamic>? metadata}) = _$NotificationCampaignImpl;

  factory _NotificationCampaign.fromJson(Map<String, dynamic> json) =
      _$NotificationCampaignImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  CampaignType get type;
  @override
  CampaignStatus get status;
  @override
  DateTime get scheduledAt;
  @override
  NotificationTemplate get template;
  @override
  Map<String, dynamic> get templateVariables;
  @override
  List<String> get targetUserIds;
  @override
  List<UserSegment> get targetSegments;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get startedAt;
  @override
  DateTime? get completedAt;
  @override
  String? get createdBy;
  @override
  Map<String, dynamic>? get metadata;
  @override
  @JsonKey(ignore: true)
  _$$NotificationCampaignImplCopyWith<_$NotificationCampaignImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UserSegment _$UserSegmentFromJson(Map<String, dynamic> json) {
  return _UserSegment.fromJson(json);
}

/// @nodoc
mixin _$UserSegment {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  SegmentType get type => throw _privateConstructorUsedError;
  Map<String, dynamic> get criteria => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserSegmentCopyWith<UserSegment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSegmentCopyWith<$Res> {
  factory $UserSegmentCopyWith(
          UserSegment value, $Res Function(UserSegment) then) =
      _$UserSegmentCopyWithImpl<$Res, UserSegment>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      SegmentType type,
      Map<String, dynamic> criteria,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$UserSegmentCopyWithImpl<$Res, $Val extends UserSegment>
    implements $UserSegmentCopyWith<$Res> {
  _$UserSegmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? type = null,
    Object? criteria = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SegmentType,
      criteria: null == criteria
          ? _value.criteria
          : criteria // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserSegmentImplCopyWith<$Res>
    implements $UserSegmentCopyWith<$Res> {
  factory _$$UserSegmentImplCopyWith(
          _$UserSegmentImpl value, $Res Function(_$UserSegmentImpl) then) =
      __$$UserSegmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      SegmentType type,
      Map<String, dynamic> criteria,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$UserSegmentImplCopyWithImpl<$Res>
    extends _$UserSegmentCopyWithImpl<$Res, _$UserSegmentImpl>
    implements _$$UserSegmentImplCopyWith<$Res> {
  __$$UserSegmentImplCopyWithImpl(
      _$UserSegmentImpl _value, $Res Function(_$UserSegmentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? type = null,
    Object? criteria = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$UserSegmentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SegmentType,
      criteria: null == criteria
          ? _value._criteria
          : criteria // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserSegmentImpl implements _UserSegment {
  const _$UserSegmentImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.type,
      required final Map<String, dynamic> criteria,
      this.createdAt,
      this.updatedAt})
      : _criteria = criteria;

  factory _$UserSegmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserSegmentImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final SegmentType type;
  final Map<String, dynamic> _criteria;
  @override
  Map<String, dynamic> get criteria {
    if (_criteria is EqualUnmodifiableMapView) return _criteria;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_criteria);
  }

  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'UserSegment(id: $id, name: $name, description: $description, type: $type, criteria: $criteria, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserSegmentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._criteria, _criteria) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description, type,
      const DeepCollectionEquality().hash(_criteria), createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserSegmentImplCopyWith<_$UserSegmentImpl> get copyWith =>
      __$$UserSegmentImplCopyWithImpl<_$UserSegmentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserSegmentImplToJson(
      this,
    );
  }
}

abstract class _UserSegment implements UserSegment {
  const factory _UserSegment(
      {required final String id,
      required final String name,
      required final String description,
      required final SegmentType type,
      required final Map<String, dynamic> criteria,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$UserSegmentImpl;

  factory _UserSegment.fromJson(Map<String, dynamic> json) =
      _$UserSegmentImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  SegmentType get type;
  @override
  Map<String, dynamic> get criteria;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$UserSegmentImplCopyWith<_$UserSegmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NotificationAnalytics _$NotificationAnalyticsFromJson(
    Map<String, dynamic> json) {
  return _NotificationAnalytics.fromJson(json);
}

/// @nodoc
mixin _$NotificationAnalytics {
  String get notificationId => throw _privateConstructorUsedError;
  int get delivered => throw _privateConstructorUsedError;
  int get opened => throw _privateConstructorUsedError;
  int get clicked => throw _privateConstructorUsedError;
  int get dismissed => throw _privateConstructorUsedError;
  int get failed => throw _privateConstructorUsedError;
  DateTime get periodStart => throw _privateConstructorUsedError;
  DateTime get periodEnd => throw _privateConstructorUsedError;
  Map<NotificationChannel, ChannelAnalytics> get channelBreakdown =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationAnalyticsCopyWith<NotificationAnalytics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationAnalyticsCopyWith<$Res> {
  factory $NotificationAnalyticsCopyWith(NotificationAnalytics value,
          $Res Function(NotificationAnalytics) then) =
      _$NotificationAnalyticsCopyWithImpl<$Res, NotificationAnalytics>;
  @useResult
  $Res call(
      {String notificationId,
      int delivered,
      int opened,
      int clicked,
      int dismissed,
      int failed,
      DateTime periodStart,
      DateTime periodEnd,
      Map<NotificationChannel, ChannelAnalytics> channelBreakdown,
      Map<String, dynamic> metadata});
}

/// @nodoc
class _$NotificationAnalyticsCopyWithImpl<$Res,
        $Val extends NotificationAnalytics>
    implements $NotificationAnalyticsCopyWith<$Res> {
  _$NotificationAnalyticsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationId = null,
    Object? delivered = null,
    Object? opened = null,
    Object? clicked = null,
    Object? dismissed = null,
    Object? failed = null,
    Object? periodStart = null,
    Object? periodEnd = null,
    Object? channelBreakdown = null,
    Object? metadata = null,
  }) {
    return _then(_value.copyWith(
      notificationId: null == notificationId
          ? _value.notificationId
          : notificationId // ignore: cast_nullable_to_non_nullable
              as String,
      delivered: null == delivered
          ? _value.delivered
          : delivered // ignore: cast_nullable_to_non_nullable
              as int,
      opened: null == opened
          ? _value.opened
          : opened // ignore: cast_nullable_to_non_nullable
              as int,
      clicked: null == clicked
          ? _value.clicked
          : clicked // ignore: cast_nullable_to_non_nullable
              as int,
      dismissed: null == dismissed
          ? _value.dismissed
          : dismissed // ignore: cast_nullable_to_non_nullable
              as int,
      failed: null == failed
          ? _value.failed
          : failed // ignore: cast_nullable_to_non_nullable
              as int,
      periodStart: null == periodStart
          ? _value.periodStart
          : periodStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      periodEnd: null == periodEnd
          ? _value.periodEnd
          : periodEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
      channelBreakdown: null == channelBreakdown
          ? _value.channelBreakdown
          : channelBreakdown // ignore: cast_nullable_to_non_nullable
              as Map<NotificationChannel, ChannelAnalytics>,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationAnalyticsImplCopyWith<$Res>
    implements $NotificationAnalyticsCopyWith<$Res> {
  factory _$$NotificationAnalyticsImplCopyWith(
          _$NotificationAnalyticsImpl value,
          $Res Function(_$NotificationAnalyticsImpl) then) =
      __$$NotificationAnalyticsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String notificationId,
      int delivered,
      int opened,
      int clicked,
      int dismissed,
      int failed,
      DateTime periodStart,
      DateTime periodEnd,
      Map<NotificationChannel, ChannelAnalytics> channelBreakdown,
      Map<String, dynamic> metadata});
}

/// @nodoc
class __$$NotificationAnalyticsImplCopyWithImpl<$Res>
    extends _$NotificationAnalyticsCopyWithImpl<$Res,
        _$NotificationAnalyticsImpl>
    implements _$$NotificationAnalyticsImplCopyWith<$Res> {
  __$$NotificationAnalyticsImplCopyWithImpl(_$NotificationAnalyticsImpl _value,
      $Res Function(_$NotificationAnalyticsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationId = null,
    Object? delivered = null,
    Object? opened = null,
    Object? clicked = null,
    Object? dismissed = null,
    Object? failed = null,
    Object? periodStart = null,
    Object? periodEnd = null,
    Object? channelBreakdown = null,
    Object? metadata = null,
  }) {
    return _then(_$NotificationAnalyticsImpl(
      notificationId: null == notificationId
          ? _value.notificationId
          : notificationId // ignore: cast_nullable_to_non_nullable
              as String,
      delivered: null == delivered
          ? _value.delivered
          : delivered // ignore: cast_nullable_to_non_nullable
              as int,
      opened: null == opened
          ? _value.opened
          : opened // ignore: cast_nullable_to_non_nullable
              as int,
      clicked: null == clicked
          ? _value.clicked
          : clicked // ignore: cast_nullable_to_non_nullable
              as int,
      dismissed: null == dismissed
          ? _value.dismissed
          : dismissed // ignore: cast_nullable_to_non_nullable
              as int,
      failed: null == failed
          ? _value.failed
          : failed // ignore: cast_nullable_to_non_nullable
              as int,
      periodStart: null == periodStart
          ? _value.periodStart
          : periodStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      periodEnd: null == periodEnd
          ? _value.periodEnd
          : periodEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
      channelBreakdown: null == channelBreakdown
          ? _value._channelBreakdown
          : channelBreakdown // ignore: cast_nullable_to_non_nullable
              as Map<NotificationChannel, ChannelAnalytics>,
      metadata: null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationAnalyticsImpl implements _NotificationAnalytics {
  const _$NotificationAnalyticsImpl(
      {required this.notificationId,
      required this.delivered,
      required this.opened,
      required this.clicked,
      required this.dismissed,
      required this.failed,
      required this.periodStart,
      required this.periodEnd,
      final Map<NotificationChannel, ChannelAnalytics> channelBreakdown =
          const {},
      final Map<String, dynamic> metadata = const {}})
      : _channelBreakdown = channelBreakdown,
        _metadata = metadata;

  factory _$NotificationAnalyticsImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationAnalyticsImplFromJson(json);

  @override
  final String notificationId;
  @override
  final int delivered;
  @override
  final int opened;
  @override
  final int clicked;
  @override
  final int dismissed;
  @override
  final int failed;
  @override
  final DateTime periodStart;
  @override
  final DateTime periodEnd;
  final Map<NotificationChannel, ChannelAnalytics> _channelBreakdown;
  @override
  @JsonKey()
  Map<NotificationChannel, ChannelAnalytics> get channelBreakdown {
    if (_channelBreakdown is EqualUnmodifiableMapView) return _channelBreakdown;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_channelBreakdown);
  }

  final Map<String, dynamic> _metadata;
  @override
  @JsonKey()
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  @override
  String toString() {
    return 'NotificationAnalytics(notificationId: $notificationId, delivered: $delivered, opened: $opened, clicked: $clicked, dismissed: $dismissed, failed: $failed, periodStart: $periodStart, periodEnd: $periodEnd, channelBreakdown: $channelBreakdown, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationAnalyticsImpl &&
            (identical(other.notificationId, notificationId) ||
                other.notificationId == notificationId) &&
            (identical(other.delivered, delivered) ||
                other.delivered == delivered) &&
            (identical(other.opened, opened) || other.opened == opened) &&
            (identical(other.clicked, clicked) || other.clicked == clicked) &&
            (identical(other.dismissed, dismissed) ||
                other.dismissed == dismissed) &&
            (identical(other.failed, failed) || other.failed == failed) &&
            (identical(other.periodStart, periodStart) ||
                other.periodStart == periodStart) &&
            (identical(other.periodEnd, periodEnd) ||
                other.periodEnd == periodEnd) &&
            const DeepCollectionEquality()
                .equals(other._channelBreakdown, _channelBreakdown) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      notificationId,
      delivered,
      opened,
      clicked,
      dismissed,
      failed,
      periodStart,
      periodEnd,
      const DeepCollectionEquality().hash(_channelBreakdown),
      const DeepCollectionEquality().hash(_metadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationAnalyticsImplCopyWith<_$NotificationAnalyticsImpl>
      get copyWith => __$$NotificationAnalyticsImplCopyWithImpl<
          _$NotificationAnalyticsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationAnalyticsImplToJson(
      this,
    );
  }
}

abstract class _NotificationAnalytics implements NotificationAnalytics {
  const factory _NotificationAnalytics(
      {required final String notificationId,
      required final int delivered,
      required final int opened,
      required final int clicked,
      required final int dismissed,
      required final int failed,
      required final DateTime periodStart,
      required final DateTime periodEnd,
      final Map<NotificationChannel, ChannelAnalytics> channelBreakdown,
      final Map<String, dynamic> metadata}) = _$NotificationAnalyticsImpl;

  factory _NotificationAnalytics.fromJson(Map<String, dynamic> json) =
      _$NotificationAnalyticsImpl.fromJson;

  @override
  String get notificationId;
  @override
  int get delivered;
  @override
  int get opened;
  @override
  int get clicked;
  @override
  int get dismissed;
  @override
  int get failed;
  @override
  DateTime get periodStart;
  @override
  DateTime get periodEnd;
  @override
  Map<NotificationChannel, ChannelAnalytics> get channelBreakdown;
  @override
  Map<String, dynamic> get metadata;
  @override
  @JsonKey(ignore: true)
  _$$NotificationAnalyticsImplCopyWith<_$NotificationAnalyticsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ChannelAnalytics _$ChannelAnalyticsFromJson(Map<String, dynamic> json) {
  return _ChannelAnalytics.fromJson(json);
}

/// @nodoc
mixin _$ChannelAnalytics {
  int get sent => throw _privateConstructorUsedError;
  int get delivered => throw _privateConstructorUsedError;
  int get opened => throw _privateConstructorUsedError;
  int get clicked => throw _privateConstructorUsedError;
  int get failed => throw _privateConstructorUsedError;
  double get deliveryRate => throw _privateConstructorUsedError;
  double get openRate => throw _privateConstructorUsedError;
  double get clickThroughRate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChannelAnalyticsCopyWith<ChannelAnalytics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChannelAnalyticsCopyWith<$Res> {
  factory $ChannelAnalyticsCopyWith(
          ChannelAnalytics value, $Res Function(ChannelAnalytics) then) =
      _$ChannelAnalyticsCopyWithImpl<$Res, ChannelAnalytics>;
  @useResult
  $Res call(
      {int sent,
      int delivered,
      int opened,
      int clicked,
      int failed,
      double deliveryRate,
      double openRate,
      double clickThroughRate});
}

/// @nodoc
class _$ChannelAnalyticsCopyWithImpl<$Res, $Val extends ChannelAnalytics>
    implements $ChannelAnalyticsCopyWith<$Res> {
  _$ChannelAnalyticsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sent = null,
    Object? delivered = null,
    Object? opened = null,
    Object? clicked = null,
    Object? failed = null,
    Object? deliveryRate = null,
    Object? openRate = null,
    Object? clickThroughRate = null,
  }) {
    return _then(_value.copyWith(
      sent: null == sent
          ? _value.sent
          : sent // ignore: cast_nullable_to_non_nullable
              as int,
      delivered: null == delivered
          ? _value.delivered
          : delivered // ignore: cast_nullable_to_non_nullable
              as int,
      opened: null == opened
          ? _value.opened
          : opened // ignore: cast_nullable_to_non_nullable
              as int,
      clicked: null == clicked
          ? _value.clicked
          : clicked // ignore: cast_nullable_to_non_nullable
              as int,
      failed: null == failed
          ? _value.failed
          : failed // ignore: cast_nullable_to_non_nullable
              as int,
      deliveryRate: null == deliveryRate
          ? _value.deliveryRate
          : deliveryRate // ignore: cast_nullable_to_non_nullable
              as double,
      openRate: null == openRate
          ? _value.openRate
          : openRate // ignore: cast_nullable_to_non_nullable
              as double,
      clickThroughRate: null == clickThroughRate
          ? _value.clickThroughRate
          : clickThroughRate // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChannelAnalyticsImplCopyWith<$Res>
    implements $ChannelAnalyticsCopyWith<$Res> {
  factory _$$ChannelAnalyticsImplCopyWith(_$ChannelAnalyticsImpl value,
          $Res Function(_$ChannelAnalyticsImpl) then) =
      __$$ChannelAnalyticsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int sent,
      int delivered,
      int opened,
      int clicked,
      int failed,
      double deliveryRate,
      double openRate,
      double clickThroughRate});
}

/// @nodoc
class __$$ChannelAnalyticsImplCopyWithImpl<$Res>
    extends _$ChannelAnalyticsCopyWithImpl<$Res, _$ChannelAnalyticsImpl>
    implements _$$ChannelAnalyticsImplCopyWith<$Res> {
  __$$ChannelAnalyticsImplCopyWithImpl(_$ChannelAnalyticsImpl _value,
      $Res Function(_$ChannelAnalyticsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sent = null,
    Object? delivered = null,
    Object? opened = null,
    Object? clicked = null,
    Object? failed = null,
    Object? deliveryRate = null,
    Object? openRate = null,
    Object? clickThroughRate = null,
  }) {
    return _then(_$ChannelAnalyticsImpl(
      sent: null == sent
          ? _value.sent
          : sent // ignore: cast_nullable_to_non_nullable
              as int,
      delivered: null == delivered
          ? _value.delivered
          : delivered // ignore: cast_nullable_to_non_nullable
              as int,
      opened: null == opened
          ? _value.opened
          : opened // ignore: cast_nullable_to_non_nullable
              as int,
      clicked: null == clicked
          ? _value.clicked
          : clicked // ignore: cast_nullable_to_non_nullable
              as int,
      failed: null == failed
          ? _value.failed
          : failed // ignore: cast_nullable_to_non_nullable
              as int,
      deliveryRate: null == deliveryRate
          ? _value.deliveryRate
          : deliveryRate // ignore: cast_nullable_to_non_nullable
              as double,
      openRate: null == openRate
          ? _value.openRate
          : openRate // ignore: cast_nullable_to_non_nullable
              as double,
      clickThroughRate: null == clickThroughRate
          ? _value.clickThroughRate
          : clickThroughRate // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChannelAnalyticsImpl implements _ChannelAnalytics {
  const _$ChannelAnalyticsImpl(
      {required this.sent,
      required this.delivered,
      required this.opened,
      required this.clicked,
      required this.failed,
      required this.deliveryRate,
      required this.openRate,
      required this.clickThroughRate});

  factory _$ChannelAnalyticsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChannelAnalyticsImplFromJson(json);

  @override
  final int sent;
  @override
  final int delivered;
  @override
  final int opened;
  @override
  final int clicked;
  @override
  final int failed;
  @override
  final double deliveryRate;
  @override
  final double openRate;
  @override
  final double clickThroughRate;

  @override
  String toString() {
    return 'ChannelAnalytics(sent: $sent, delivered: $delivered, opened: $opened, clicked: $clicked, failed: $failed, deliveryRate: $deliveryRate, openRate: $openRate, clickThroughRate: $clickThroughRate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChannelAnalyticsImpl &&
            (identical(other.sent, sent) || other.sent == sent) &&
            (identical(other.delivered, delivered) ||
                other.delivered == delivered) &&
            (identical(other.opened, opened) || other.opened == opened) &&
            (identical(other.clicked, clicked) || other.clicked == clicked) &&
            (identical(other.failed, failed) || other.failed == failed) &&
            (identical(other.deliveryRate, deliveryRate) ||
                other.deliveryRate == deliveryRate) &&
            (identical(other.openRate, openRate) ||
                other.openRate == openRate) &&
            (identical(other.clickThroughRate, clickThroughRate) ||
                other.clickThroughRate == clickThroughRate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, sent, delivered, opened, clicked,
      failed, deliveryRate, openRate, clickThroughRate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChannelAnalyticsImplCopyWith<_$ChannelAnalyticsImpl> get copyWith =>
      __$$ChannelAnalyticsImplCopyWithImpl<_$ChannelAnalyticsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChannelAnalyticsImplToJson(
      this,
    );
  }
}

abstract class _ChannelAnalytics implements ChannelAnalytics {
  const factory _ChannelAnalytics(
      {required final int sent,
      required final int delivered,
      required final int opened,
      required final int clicked,
      required final int failed,
      required final double deliveryRate,
      required final double openRate,
      required final double clickThroughRate}) = _$ChannelAnalyticsImpl;

  factory _ChannelAnalytics.fromJson(Map<String, dynamic> json) =
      _$ChannelAnalyticsImpl.fromJson;

  @override
  int get sent;
  @override
  int get delivered;
  @override
  int get opened;
  @override
  int get clicked;
  @override
  int get failed;
  @override
  double get deliveryRate;
  @override
  double get openRate;
  @override
  double get clickThroughRate;
  @override
  @JsonKey(ignore: true)
  _$$ChannelAnalyticsImplCopyWith<_$ChannelAnalyticsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PushNotificationPayload _$PushNotificationPayloadFromJson(
    Map<String, dynamic> json) {
  return _PushNotificationPayload.fromJson(json);
}

/// @nodoc
mixin _$PushNotificationPayload {
  String get title => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get sound => throw _privateConstructorUsedError;
  String? get clickAction => throw _privateConstructorUsedError;
  Map<String, String> get data => throw _privateConstructorUsedError;
  PushNotificationAndroid? get android => throw _privateConstructorUsedError;
  PushNotificationIOS? get ios => throw _privateConstructorUsedError;
  PushNotificationWeb? get web => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PushNotificationPayloadCopyWith<PushNotificationPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PushNotificationPayloadCopyWith<$Res> {
  factory $PushNotificationPayloadCopyWith(PushNotificationPayload value,
          $Res Function(PushNotificationPayload) then) =
      _$PushNotificationPayloadCopyWithImpl<$Res, PushNotificationPayload>;
  @useResult
  $Res call(
      {String title,
      String body,
      String? icon,
      String? image,
      String? sound,
      String? clickAction,
      Map<String, String> data,
      PushNotificationAndroid? android,
      PushNotificationIOS? ios,
      PushNotificationWeb? web});

  $PushNotificationAndroidCopyWith<$Res>? get android;
  $PushNotificationIOSCopyWith<$Res>? get ios;
  $PushNotificationWebCopyWith<$Res>? get web;
}

/// @nodoc
class _$PushNotificationPayloadCopyWithImpl<$Res,
        $Val extends PushNotificationPayload>
    implements $PushNotificationPayloadCopyWith<$Res> {
  _$PushNotificationPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? body = null,
    Object? icon = freezed,
    Object? image = freezed,
    Object? sound = freezed,
    Object? clickAction = freezed,
    Object? data = null,
    Object? android = freezed,
    Object? ios = freezed,
    Object? web = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      sound: freezed == sound
          ? _value.sound
          : sound // ignore: cast_nullable_to_non_nullable
              as String?,
      clickAction: freezed == clickAction
          ? _value.clickAction
          : clickAction // ignore: cast_nullable_to_non_nullable
              as String?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      android: freezed == android
          ? _value.android
          : android // ignore: cast_nullable_to_non_nullable
              as PushNotificationAndroid?,
      ios: freezed == ios
          ? _value.ios
          : ios // ignore: cast_nullable_to_non_nullable
              as PushNotificationIOS?,
      web: freezed == web
          ? _value.web
          : web // ignore: cast_nullable_to_non_nullable
              as PushNotificationWeb?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PushNotificationAndroidCopyWith<$Res>? get android {
    if (_value.android == null) {
      return null;
    }

    return $PushNotificationAndroidCopyWith<$Res>(_value.android!, (value) {
      return _then(_value.copyWith(android: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PushNotificationIOSCopyWith<$Res>? get ios {
    if (_value.ios == null) {
      return null;
    }

    return $PushNotificationIOSCopyWith<$Res>(_value.ios!, (value) {
      return _then(_value.copyWith(ios: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PushNotificationWebCopyWith<$Res>? get web {
    if (_value.web == null) {
      return null;
    }

    return $PushNotificationWebCopyWith<$Res>(_value.web!, (value) {
      return _then(_value.copyWith(web: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PushNotificationPayloadImplCopyWith<$Res>
    implements $PushNotificationPayloadCopyWith<$Res> {
  factory _$$PushNotificationPayloadImplCopyWith(
          _$PushNotificationPayloadImpl value,
          $Res Function(_$PushNotificationPayloadImpl) then) =
      __$$PushNotificationPayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String body,
      String? icon,
      String? image,
      String? sound,
      String? clickAction,
      Map<String, String> data,
      PushNotificationAndroid? android,
      PushNotificationIOS? ios,
      PushNotificationWeb? web});

  @override
  $PushNotificationAndroidCopyWith<$Res>? get android;
  @override
  $PushNotificationIOSCopyWith<$Res>? get ios;
  @override
  $PushNotificationWebCopyWith<$Res>? get web;
}

/// @nodoc
class __$$PushNotificationPayloadImplCopyWithImpl<$Res>
    extends _$PushNotificationPayloadCopyWithImpl<$Res,
        _$PushNotificationPayloadImpl>
    implements _$$PushNotificationPayloadImplCopyWith<$Res> {
  __$$PushNotificationPayloadImplCopyWithImpl(
      _$PushNotificationPayloadImpl _value,
      $Res Function(_$PushNotificationPayloadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? body = null,
    Object? icon = freezed,
    Object? image = freezed,
    Object? sound = freezed,
    Object? clickAction = freezed,
    Object? data = null,
    Object? android = freezed,
    Object? ios = freezed,
    Object? web = freezed,
  }) {
    return _then(_$PushNotificationPayloadImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      sound: freezed == sound
          ? _value.sound
          : sound // ignore: cast_nullable_to_non_nullable
              as String?,
      clickAction: freezed == clickAction
          ? _value.clickAction
          : clickAction // ignore: cast_nullable_to_non_nullable
              as String?,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      android: freezed == android
          ? _value.android
          : android // ignore: cast_nullable_to_non_nullable
              as PushNotificationAndroid?,
      ios: freezed == ios
          ? _value.ios
          : ios // ignore: cast_nullable_to_non_nullable
              as PushNotificationIOS?,
      web: freezed == web
          ? _value.web
          : web // ignore: cast_nullable_to_non_nullable
              as PushNotificationWeb?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PushNotificationPayloadImpl implements _PushNotificationPayload {
  const _$PushNotificationPayloadImpl(
      {required this.title,
      required this.body,
      this.icon,
      this.image,
      this.sound,
      this.clickAction,
      final Map<String, String> data = const {},
      this.android,
      this.ios,
      this.web})
      : _data = data;

  factory _$PushNotificationPayloadImpl.fromJson(Map<String, dynamic> json) =>
      _$$PushNotificationPayloadImplFromJson(json);

  @override
  final String title;
  @override
  final String body;
  @override
  final String? icon;
  @override
  final String? image;
  @override
  final String? sound;
  @override
  final String? clickAction;
  final Map<String, String> _data;
  @override
  @JsonKey()
  Map<String, String> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  final PushNotificationAndroid? android;
  @override
  final PushNotificationIOS? ios;
  @override
  final PushNotificationWeb? web;

  @override
  String toString() {
    return 'PushNotificationPayload(title: $title, body: $body, icon: $icon, image: $image, sound: $sound, clickAction: $clickAction, data: $data, android: $android, ios: $ios, web: $web)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PushNotificationPayloadImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.sound, sound) || other.sound == sound) &&
            (identical(other.clickAction, clickAction) ||
                other.clickAction == clickAction) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.android, android) || other.android == android) &&
            (identical(other.ios, ios) || other.ios == ios) &&
            (identical(other.web, web) || other.web == web));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      body,
      icon,
      image,
      sound,
      clickAction,
      const DeepCollectionEquality().hash(_data),
      android,
      ios,
      web);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PushNotificationPayloadImplCopyWith<_$PushNotificationPayloadImpl>
      get copyWith => __$$PushNotificationPayloadImplCopyWithImpl<
          _$PushNotificationPayloadImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PushNotificationPayloadImplToJson(
      this,
    );
  }
}

abstract class _PushNotificationPayload implements PushNotificationPayload {
  const factory _PushNotificationPayload(
      {required final String title,
      required final String body,
      final String? icon,
      final String? image,
      final String? sound,
      final String? clickAction,
      final Map<String, String> data,
      final PushNotificationAndroid? android,
      final PushNotificationIOS? ios,
      final PushNotificationWeb? web}) = _$PushNotificationPayloadImpl;

  factory _PushNotificationPayload.fromJson(Map<String, dynamic> json) =
      _$PushNotificationPayloadImpl.fromJson;

  @override
  String get title;
  @override
  String get body;
  @override
  String? get icon;
  @override
  String? get image;
  @override
  String? get sound;
  @override
  String? get clickAction;
  @override
  Map<String, String> get data;
  @override
  PushNotificationAndroid? get android;
  @override
  PushNotificationIOS? get ios;
  @override
  PushNotificationWeb? get web;
  @override
  @JsonKey(ignore: true)
  _$$PushNotificationPayloadImplCopyWith<_$PushNotificationPayloadImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PushNotificationAndroid _$PushNotificationAndroidFromJson(
    Map<String, dynamic> json) {
  return _PushNotificationAndroid.fromJson(json);
}

/// @nodoc
mixin _$PushNotificationAndroid {
  String? get channelId => throw _privateConstructorUsedError;
  String? get smallIcon => throw _privateConstructorUsedError;
  String? get color => throw _privateConstructorUsedError;
  String? get tag => throw _privateConstructorUsedError;
  AndroidNotificationPriority? get priority =>
      throw _privateConstructorUsedError;
  AndroidVisibility? get visibility => throw _privateConstructorUsedError;
  List<AndroidAction> get actions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PushNotificationAndroidCopyWith<PushNotificationAndroid> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PushNotificationAndroidCopyWith<$Res> {
  factory $PushNotificationAndroidCopyWith(PushNotificationAndroid value,
          $Res Function(PushNotificationAndroid) then) =
      _$PushNotificationAndroidCopyWithImpl<$Res, PushNotificationAndroid>;
  @useResult
  $Res call(
      {String? channelId,
      String? smallIcon,
      String? color,
      String? tag,
      AndroidNotificationPriority? priority,
      AndroidVisibility? visibility,
      List<AndroidAction> actions});
}

/// @nodoc
class _$PushNotificationAndroidCopyWithImpl<$Res,
        $Val extends PushNotificationAndroid>
    implements $PushNotificationAndroidCopyWith<$Res> {
  _$PushNotificationAndroidCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelId = freezed,
    Object? smallIcon = freezed,
    Object? color = freezed,
    Object? tag = freezed,
    Object? priority = freezed,
    Object? visibility = freezed,
    Object? actions = null,
  }) {
    return _then(_value.copyWith(
      channelId: freezed == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String?,
      smallIcon: freezed == smallIcon
          ? _value.smallIcon
          : smallIcon // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String?,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as AndroidNotificationPriority?,
      visibility: freezed == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as AndroidVisibility?,
      actions: null == actions
          ? _value.actions
          : actions // ignore: cast_nullable_to_non_nullable
              as List<AndroidAction>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PushNotificationAndroidImplCopyWith<$Res>
    implements $PushNotificationAndroidCopyWith<$Res> {
  factory _$$PushNotificationAndroidImplCopyWith(
          _$PushNotificationAndroidImpl value,
          $Res Function(_$PushNotificationAndroidImpl) then) =
      __$$PushNotificationAndroidImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? channelId,
      String? smallIcon,
      String? color,
      String? tag,
      AndroidNotificationPriority? priority,
      AndroidVisibility? visibility,
      List<AndroidAction> actions});
}

/// @nodoc
class __$$PushNotificationAndroidImplCopyWithImpl<$Res>
    extends _$PushNotificationAndroidCopyWithImpl<$Res,
        _$PushNotificationAndroidImpl>
    implements _$$PushNotificationAndroidImplCopyWith<$Res> {
  __$$PushNotificationAndroidImplCopyWithImpl(
      _$PushNotificationAndroidImpl _value,
      $Res Function(_$PushNotificationAndroidImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelId = freezed,
    Object? smallIcon = freezed,
    Object? color = freezed,
    Object? tag = freezed,
    Object? priority = freezed,
    Object? visibility = freezed,
    Object? actions = null,
  }) {
    return _then(_$PushNotificationAndroidImpl(
      channelId: freezed == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String?,
      smallIcon: freezed == smallIcon
          ? _value.smallIcon
          : smallIcon // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String?,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as AndroidNotificationPriority?,
      visibility: freezed == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as AndroidVisibility?,
      actions: null == actions
          ? _value._actions
          : actions // ignore: cast_nullable_to_non_nullable
              as List<AndroidAction>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PushNotificationAndroidImpl implements _PushNotificationAndroid {
  const _$PushNotificationAndroidImpl(
      {this.channelId,
      this.smallIcon,
      this.color,
      this.tag,
      this.priority,
      this.visibility,
      final List<AndroidAction> actions = const []})
      : _actions = actions;

  factory _$PushNotificationAndroidImpl.fromJson(Map<String, dynamic> json) =>
      _$$PushNotificationAndroidImplFromJson(json);

  @override
  final String? channelId;
  @override
  final String? smallIcon;
  @override
  final String? color;
  @override
  final String? tag;
  @override
  final AndroidNotificationPriority? priority;
  @override
  final AndroidVisibility? visibility;
  final List<AndroidAction> _actions;
  @override
  @JsonKey()
  List<AndroidAction> get actions {
    if (_actions is EqualUnmodifiableListView) return _actions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_actions);
  }

  @override
  String toString() {
    return 'PushNotificationAndroid(channelId: $channelId, smallIcon: $smallIcon, color: $color, tag: $tag, priority: $priority, visibility: $visibility, actions: $actions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PushNotificationAndroidImpl &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.smallIcon, smallIcon) ||
                other.smallIcon == smallIcon) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility) &&
            const DeepCollectionEquality().equals(other._actions, _actions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, channelId, smallIcon, color, tag,
      priority, visibility, const DeepCollectionEquality().hash(_actions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PushNotificationAndroidImplCopyWith<_$PushNotificationAndroidImpl>
      get copyWith => __$$PushNotificationAndroidImplCopyWithImpl<
          _$PushNotificationAndroidImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PushNotificationAndroidImplToJson(
      this,
    );
  }
}

abstract class _PushNotificationAndroid implements PushNotificationAndroid {
  const factory _PushNotificationAndroid(
      {final String? channelId,
      final String? smallIcon,
      final String? color,
      final String? tag,
      final AndroidNotificationPriority? priority,
      final AndroidVisibility? visibility,
      final List<AndroidAction> actions}) = _$PushNotificationAndroidImpl;

  factory _PushNotificationAndroid.fromJson(Map<String, dynamic> json) =
      _$PushNotificationAndroidImpl.fromJson;

  @override
  String? get channelId;
  @override
  String? get smallIcon;
  @override
  String? get color;
  @override
  String? get tag;
  @override
  AndroidNotificationPriority? get priority;
  @override
  AndroidVisibility? get visibility;
  @override
  List<AndroidAction> get actions;
  @override
  @JsonKey(ignore: true)
  _$$PushNotificationAndroidImplCopyWith<_$PushNotificationAndroidImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AndroidAction _$AndroidActionFromJson(Map<String, dynamic> json) {
  return _AndroidAction.fromJson(json);
}

/// @nodoc
mixin _$AndroidAction {
  String get title => throw _privateConstructorUsedError;
  String get action => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AndroidActionCopyWith<AndroidAction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AndroidActionCopyWith<$Res> {
  factory $AndroidActionCopyWith(
          AndroidAction value, $Res Function(AndroidAction) then) =
      _$AndroidActionCopyWithImpl<$Res, AndroidAction>;
  @useResult
  $Res call({String title, String action, String? icon});
}

/// @nodoc
class _$AndroidActionCopyWithImpl<$Res, $Val extends AndroidAction>
    implements $AndroidActionCopyWith<$Res> {
  _$AndroidActionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? action = null,
    Object? icon = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AndroidActionImplCopyWith<$Res>
    implements $AndroidActionCopyWith<$Res> {
  factory _$$AndroidActionImplCopyWith(
          _$AndroidActionImpl value, $Res Function(_$AndroidActionImpl) then) =
      __$$AndroidActionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String action, String? icon});
}

/// @nodoc
class __$$AndroidActionImplCopyWithImpl<$Res>
    extends _$AndroidActionCopyWithImpl<$Res, _$AndroidActionImpl>
    implements _$$AndroidActionImplCopyWith<$Res> {
  __$$AndroidActionImplCopyWithImpl(
      _$AndroidActionImpl _value, $Res Function(_$AndroidActionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? action = null,
    Object? icon = freezed,
  }) {
    return _then(_$AndroidActionImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AndroidActionImpl implements _AndroidAction {
  const _$AndroidActionImpl(
      {required this.title, required this.action, this.icon});

  factory _$AndroidActionImpl.fromJson(Map<String, dynamic> json) =>
      _$$AndroidActionImplFromJson(json);

  @override
  final String title;
  @override
  final String action;
  @override
  final String? icon;

  @override
  String toString() {
    return 'AndroidAction(title: $title, action: $action, icon: $icon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AndroidActionImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, action, icon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AndroidActionImplCopyWith<_$AndroidActionImpl> get copyWith =>
      __$$AndroidActionImplCopyWithImpl<_$AndroidActionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AndroidActionImplToJson(
      this,
    );
  }
}

abstract class _AndroidAction implements AndroidAction {
  const factory _AndroidAction(
      {required final String title,
      required final String action,
      final String? icon}) = _$AndroidActionImpl;

  factory _AndroidAction.fromJson(Map<String, dynamic> json) =
      _$AndroidActionImpl.fromJson;

  @override
  String get title;
  @override
  String get action;
  @override
  String? get icon;
  @override
  @JsonKey(ignore: true)
  _$$AndroidActionImplCopyWith<_$AndroidActionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PushNotificationIOS _$PushNotificationIOSFromJson(Map<String, dynamic> json) {
  return _PushNotificationIOS.fromJson(json);
}

/// @nodoc
mixin _$PushNotificationIOS {
  String? get sound => throw _privateConstructorUsedError;
  int? get badge => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  String? get threadId => throw _privateConstructorUsedError;
  Map<String, dynamic> get customData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PushNotificationIOSCopyWith<PushNotificationIOS> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PushNotificationIOSCopyWith<$Res> {
  factory $PushNotificationIOSCopyWith(
          PushNotificationIOS value, $Res Function(PushNotificationIOS) then) =
      _$PushNotificationIOSCopyWithImpl<$Res, PushNotificationIOS>;
  @useResult
  $Res call(
      {String? sound,
      int? badge,
      String? category,
      String? threadId,
      Map<String, dynamic> customData});
}

/// @nodoc
class _$PushNotificationIOSCopyWithImpl<$Res, $Val extends PushNotificationIOS>
    implements $PushNotificationIOSCopyWith<$Res> {
  _$PushNotificationIOSCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sound = freezed,
    Object? badge = freezed,
    Object? category = freezed,
    Object? threadId = freezed,
    Object? customData = null,
  }) {
    return _then(_value.copyWith(
      sound: freezed == sound
          ? _value.sound
          : sound // ignore: cast_nullable_to_non_nullable
              as String?,
      badge: freezed == badge
          ? _value.badge
          : badge // ignore: cast_nullable_to_non_nullable
              as int?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      threadId: freezed == threadId
          ? _value.threadId
          : threadId // ignore: cast_nullable_to_non_nullable
              as String?,
      customData: null == customData
          ? _value.customData
          : customData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PushNotificationIOSImplCopyWith<$Res>
    implements $PushNotificationIOSCopyWith<$Res> {
  factory _$$PushNotificationIOSImplCopyWith(_$PushNotificationIOSImpl value,
          $Res Function(_$PushNotificationIOSImpl) then) =
      __$$PushNotificationIOSImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? sound,
      int? badge,
      String? category,
      String? threadId,
      Map<String, dynamic> customData});
}

/// @nodoc
class __$$PushNotificationIOSImplCopyWithImpl<$Res>
    extends _$PushNotificationIOSCopyWithImpl<$Res, _$PushNotificationIOSImpl>
    implements _$$PushNotificationIOSImplCopyWith<$Res> {
  __$$PushNotificationIOSImplCopyWithImpl(_$PushNotificationIOSImpl _value,
      $Res Function(_$PushNotificationIOSImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sound = freezed,
    Object? badge = freezed,
    Object? category = freezed,
    Object? threadId = freezed,
    Object? customData = null,
  }) {
    return _then(_$PushNotificationIOSImpl(
      sound: freezed == sound
          ? _value.sound
          : sound // ignore: cast_nullable_to_non_nullable
              as String?,
      badge: freezed == badge
          ? _value.badge
          : badge // ignore: cast_nullable_to_non_nullable
              as int?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      threadId: freezed == threadId
          ? _value.threadId
          : threadId // ignore: cast_nullable_to_non_nullable
              as String?,
      customData: null == customData
          ? _value._customData
          : customData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PushNotificationIOSImpl implements _PushNotificationIOS {
  const _$PushNotificationIOSImpl(
      {this.sound,
      this.badge,
      this.category,
      this.threadId,
      final Map<String, dynamic> customData = const {}})
      : _customData = customData;

  factory _$PushNotificationIOSImpl.fromJson(Map<String, dynamic> json) =>
      _$$PushNotificationIOSImplFromJson(json);

  @override
  final String? sound;
  @override
  final int? badge;
  @override
  final String? category;
  @override
  final String? threadId;
  final Map<String, dynamic> _customData;
  @override
  @JsonKey()
  Map<String, dynamic> get customData {
    if (_customData is EqualUnmodifiableMapView) return _customData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_customData);
  }

  @override
  String toString() {
    return 'PushNotificationIOS(sound: $sound, badge: $badge, category: $category, threadId: $threadId, customData: $customData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PushNotificationIOSImpl &&
            (identical(other.sound, sound) || other.sound == sound) &&
            (identical(other.badge, badge) || other.badge == badge) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.threadId, threadId) ||
                other.threadId == threadId) &&
            const DeepCollectionEquality()
                .equals(other._customData, _customData));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, sound, badge, category, threadId,
      const DeepCollectionEquality().hash(_customData));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PushNotificationIOSImplCopyWith<_$PushNotificationIOSImpl> get copyWith =>
      __$$PushNotificationIOSImplCopyWithImpl<_$PushNotificationIOSImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PushNotificationIOSImplToJson(
      this,
    );
  }
}

abstract class _PushNotificationIOS implements PushNotificationIOS {
  const factory _PushNotificationIOS(
      {final String? sound,
      final int? badge,
      final String? category,
      final String? threadId,
      final Map<String, dynamic> customData}) = _$PushNotificationIOSImpl;

  factory _PushNotificationIOS.fromJson(Map<String, dynamic> json) =
      _$PushNotificationIOSImpl.fromJson;

  @override
  String? get sound;
  @override
  int? get badge;
  @override
  String? get category;
  @override
  String? get threadId;
  @override
  Map<String, dynamic> get customData;
  @override
  @JsonKey(ignore: true)
  _$$PushNotificationIOSImplCopyWith<_$PushNotificationIOSImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PushNotificationWeb _$PushNotificationWebFromJson(Map<String, dynamic> json) {
  return _PushNotificationWeb.fromJson(json);
}

/// @nodoc
mixin _$PushNotificationWeb {
  String? get icon => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get badge => throw _privateConstructorUsedError;
  String? get tag => throw _privateConstructorUsedError;
  bool? get requireInteraction => throw _privateConstructorUsedError;
  List<WebAction> get actions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PushNotificationWebCopyWith<PushNotificationWeb> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PushNotificationWebCopyWith<$Res> {
  factory $PushNotificationWebCopyWith(
          PushNotificationWeb value, $Res Function(PushNotificationWeb) then) =
      _$PushNotificationWebCopyWithImpl<$Res, PushNotificationWeb>;
  @useResult
  $Res call(
      {String? icon,
      String? image,
      String? badge,
      String? tag,
      bool? requireInteraction,
      List<WebAction> actions});
}

/// @nodoc
class _$PushNotificationWebCopyWithImpl<$Res, $Val extends PushNotificationWeb>
    implements $PushNotificationWebCopyWith<$Res> {
  _$PushNotificationWebCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? icon = freezed,
    Object? image = freezed,
    Object? badge = freezed,
    Object? tag = freezed,
    Object? requireInteraction = freezed,
    Object? actions = null,
  }) {
    return _then(_value.copyWith(
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      badge: freezed == badge
          ? _value.badge
          : badge // ignore: cast_nullable_to_non_nullable
              as String?,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String?,
      requireInteraction: freezed == requireInteraction
          ? _value.requireInteraction
          : requireInteraction // ignore: cast_nullable_to_non_nullable
              as bool?,
      actions: null == actions
          ? _value.actions
          : actions // ignore: cast_nullable_to_non_nullable
              as List<WebAction>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PushNotificationWebImplCopyWith<$Res>
    implements $PushNotificationWebCopyWith<$Res> {
  factory _$$PushNotificationWebImplCopyWith(_$PushNotificationWebImpl value,
          $Res Function(_$PushNotificationWebImpl) then) =
      __$$PushNotificationWebImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? icon,
      String? image,
      String? badge,
      String? tag,
      bool? requireInteraction,
      List<WebAction> actions});
}

/// @nodoc
class __$$PushNotificationWebImplCopyWithImpl<$Res>
    extends _$PushNotificationWebCopyWithImpl<$Res, _$PushNotificationWebImpl>
    implements _$$PushNotificationWebImplCopyWith<$Res> {
  __$$PushNotificationWebImplCopyWithImpl(_$PushNotificationWebImpl _value,
      $Res Function(_$PushNotificationWebImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? icon = freezed,
    Object? image = freezed,
    Object? badge = freezed,
    Object? tag = freezed,
    Object? requireInteraction = freezed,
    Object? actions = null,
  }) {
    return _then(_$PushNotificationWebImpl(
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      badge: freezed == badge
          ? _value.badge
          : badge // ignore: cast_nullable_to_non_nullable
              as String?,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String?,
      requireInteraction: freezed == requireInteraction
          ? _value.requireInteraction
          : requireInteraction // ignore: cast_nullable_to_non_nullable
              as bool?,
      actions: null == actions
          ? _value._actions
          : actions // ignore: cast_nullable_to_non_nullable
              as List<WebAction>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PushNotificationWebImpl implements _PushNotificationWeb {
  const _$PushNotificationWebImpl(
      {this.icon,
      this.image,
      this.badge,
      this.tag,
      this.requireInteraction,
      final List<WebAction> actions = const []})
      : _actions = actions;

  factory _$PushNotificationWebImpl.fromJson(Map<String, dynamic> json) =>
      _$$PushNotificationWebImplFromJson(json);

  @override
  final String? icon;
  @override
  final String? image;
  @override
  final String? badge;
  @override
  final String? tag;
  @override
  final bool? requireInteraction;
  final List<WebAction> _actions;
  @override
  @JsonKey()
  List<WebAction> get actions {
    if (_actions is EqualUnmodifiableListView) return _actions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_actions);
  }

  @override
  String toString() {
    return 'PushNotificationWeb(icon: $icon, image: $image, badge: $badge, tag: $tag, requireInteraction: $requireInteraction, actions: $actions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PushNotificationWebImpl &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.badge, badge) || other.badge == badge) &&
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.requireInteraction, requireInteraction) ||
                other.requireInteraction == requireInteraction) &&
            const DeepCollectionEquality().equals(other._actions, _actions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, icon, image, badge, tag,
      requireInteraction, const DeepCollectionEquality().hash(_actions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PushNotificationWebImplCopyWith<_$PushNotificationWebImpl> get copyWith =>
      __$$PushNotificationWebImplCopyWithImpl<_$PushNotificationWebImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PushNotificationWebImplToJson(
      this,
    );
  }
}

abstract class _PushNotificationWeb implements PushNotificationWeb {
  const factory _PushNotificationWeb(
      {final String? icon,
      final String? image,
      final String? badge,
      final String? tag,
      final bool? requireInteraction,
      final List<WebAction> actions}) = _$PushNotificationWebImpl;

  factory _PushNotificationWeb.fromJson(Map<String, dynamic> json) =
      _$PushNotificationWebImpl.fromJson;

  @override
  String? get icon;
  @override
  String? get image;
  @override
  String? get badge;
  @override
  String? get tag;
  @override
  bool? get requireInteraction;
  @override
  List<WebAction> get actions;
  @override
  @JsonKey(ignore: true)
  _$$PushNotificationWebImplCopyWith<_$PushNotificationWebImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WebAction _$WebActionFromJson(Map<String, dynamic> json) {
  return _WebAction.fromJson(json);
}

/// @nodoc
mixin _$WebAction {
  String get action => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WebActionCopyWith<WebAction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WebActionCopyWith<$Res> {
  factory $WebActionCopyWith(WebAction value, $Res Function(WebAction) then) =
      _$WebActionCopyWithImpl<$Res, WebAction>;
  @useResult
  $Res call({String action, String title, String? icon});
}

/// @nodoc
class _$WebActionCopyWithImpl<$Res, $Val extends WebAction>
    implements $WebActionCopyWith<$Res> {
  _$WebActionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = null,
    Object? title = null,
    Object? icon = freezed,
  }) {
    return _then(_value.copyWith(
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WebActionImplCopyWith<$Res>
    implements $WebActionCopyWith<$Res> {
  factory _$$WebActionImplCopyWith(
          _$WebActionImpl value, $Res Function(_$WebActionImpl) then) =
      __$$WebActionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String action, String title, String? icon});
}

/// @nodoc
class __$$WebActionImplCopyWithImpl<$Res>
    extends _$WebActionCopyWithImpl<$Res, _$WebActionImpl>
    implements _$$WebActionImplCopyWith<$Res> {
  __$$WebActionImplCopyWithImpl(
      _$WebActionImpl _value, $Res Function(_$WebActionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = null,
    Object? title = null,
    Object? icon = freezed,
  }) {
    return _then(_$WebActionImpl(
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WebActionImpl implements _WebAction {
  const _$WebActionImpl({required this.action, required this.title, this.icon});

  factory _$WebActionImpl.fromJson(Map<String, dynamic> json) =>
      _$$WebActionImplFromJson(json);

  @override
  final String action;
  @override
  final String title;
  @override
  final String? icon;

  @override
  String toString() {
    return 'WebAction(action: $action, title: $title, icon: $icon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WebActionImpl &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, action, title, icon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WebActionImplCopyWith<_$WebActionImpl> get copyWith =>
      __$$WebActionImplCopyWithImpl<_$WebActionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WebActionImplToJson(
      this,
    );
  }
}

abstract class _WebAction implements WebAction {
  const factory _WebAction(
      {required final String action,
      required final String title,
      final String? icon}) = _$WebActionImpl;

  factory _WebAction.fromJson(Map<String, dynamic> json) =
      _$WebActionImpl.fromJson;

  @override
  String get action;
  @override
  String get title;
  @override
  String? get icon;
  @override
  @JsonKey(ignore: true)
  _$$WebActionImplCopyWith<_$WebActionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EmailNotification _$EmailNotificationFromJson(Map<String, dynamic> json) {
  return _EmailNotification.fromJson(json);
}

/// @nodoc
mixin _$EmailNotification {
  String get to => throw _privateConstructorUsedError;
  String get subject => throw _privateConstructorUsedError;
  String get htmlContent => throw _privateConstructorUsedError;
  String? get textContent => throw _privateConstructorUsedError;
  String? get from => throw _privateConstructorUsedError;
  String? get replyTo => throw _privateConstructorUsedError;
  List<String> get cc => throw _privateConstructorUsedError;
  List<String> get bcc => throw _privateConstructorUsedError;
  List<EmailAttachment> get attachments => throw _privateConstructorUsedError;
  Map<String, String> get headers => throw _privateConstructorUsedError;
  String? get templateId => throw _privateConstructorUsedError;
  Map<String, dynamic> get templateData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmailNotificationCopyWith<EmailNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailNotificationCopyWith<$Res> {
  factory $EmailNotificationCopyWith(
          EmailNotification value, $Res Function(EmailNotification) then) =
      _$EmailNotificationCopyWithImpl<$Res, EmailNotification>;
  @useResult
  $Res call(
      {String to,
      String subject,
      String htmlContent,
      String? textContent,
      String? from,
      String? replyTo,
      List<String> cc,
      List<String> bcc,
      List<EmailAttachment> attachments,
      Map<String, String> headers,
      String? templateId,
      Map<String, dynamic> templateData});
}

/// @nodoc
class _$EmailNotificationCopyWithImpl<$Res, $Val extends EmailNotification>
    implements $EmailNotificationCopyWith<$Res> {
  _$EmailNotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? to = null,
    Object? subject = null,
    Object? htmlContent = null,
    Object? textContent = freezed,
    Object? from = freezed,
    Object? replyTo = freezed,
    Object? cc = null,
    Object? bcc = null,
    Object? attachments = null,
    Object? headers = null,
    Object? templateId = freezed,
    Object? templateData = null,
  }) {
    return _then(_value.copyWith(
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      htmlContent: null == htmlContent
          ? _value.htmlContent
          : htmlContent // ignore: cast_nullable_to_non_nullable
              as String,
      textContent: freezed == textContent
          ? _value.textContent
          : textContent // ignore: cast_nullable_to_non_nullable
              as String?,
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String?,
      replyTo: freezed == replyTo
          ? _value.replyTo
          : replyTo // ignore: cast_nullable_to_non_nullable
              as String?,
      cc: null == cc
          ? _value.cc
          : cc // ignore: cast_nullable_to_non_nullable
              as List<String>,
      bcc: null == bcc
          ? _value.bcc
          : bcc // ignore: cast_nullable_to_non_nullable
              as List<String>,
      attachments: null == attachments
          ? _value.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<EmailAttachment>,
      headers: null == headers
          ? _value.headers
          : headers // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      templateId: freezed == templateId
          ? _value.templateId
          : templateId // ignore: cast_nullable_to_non_nullable
              as String?,
      templateData: null == templateData
          ? _value.templateData
          : templateData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmailNotificationImplCopyWith<$Res>
    implements $EmailNotificationCopyWith<$Res> {
  factory _$$EmailNotificationImplCopyWith(_$EmailNotificationImpl value,
          $Res Function(_$EmailNotificationImpl) then) =
      __$$EmailNotificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String to,
      String subject,
      String htmlContent,
      String? textContent,
      String? from,
      String? replyTo,
      List<String> cc,
      List<String> bcc,
      List<EmailAttachment> attachments,
      Map<String, String> headers,
      String? templateId,
      Map<String, dynamic> templateData});
}

/// @nodoc
class __$$EmailNotificationImplCopyWithImpl<$Res>
    extends _$EmailNotificationCopyWithImpl<$Res, _$EmailNotificationImpl>
    implements _$$EmailNotificationImplCopyWith<$Res> {
  __$$EmailNotificationImplCopyWithImpl(_$EmailNotificationImpl _value,
      $Res Function(_$EmailNotificationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? to = null,
    Object? subject = null,
    Object? htmlContent = null,
    Object? textContent = freezed,
    Object? from = freezed,
    Object? replyTo = freezed,
    Object? cc = null,
    Object? bcc = null,
    Object? attachments = null,
    Object? headers = null,
    Object? templateId = freezed,
    Object? templateData = null,
  }) {
    return _then(_$EmailNotificationImpl(
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      htmlContent: null == htmlContent
          ? _value.htmlContent
          : htmlContent // ignore: cast_nullable_to_non_nullable
              as String,
      textContent: freezed == textContent
          ? _value.textContent
          : textContent // ignore: cast_nullable_to_non_nullable
              as String?,
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String?,
      replyTo: freezed == replyTo
          ? _value.replyTo
          : replyTo // ignore: cast_nullable_to_non_nullable
              as String?,
      cc: null == cc
          ? _value._cc
          : cc // ignore: cast_nullable_to_non_nullable
              as List<String>,
      bcc: null == bcc
          ? _value._bcc
          : bcc // ignore: cast_nullable_to_non_nullable
              as List<String>,
      attachments: null == attachments
          ? _value._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<EmailAttachment>,
      headers: null == headers
          ? _value._headers
          : headers // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      templateId: freezed == templateId
          ? _value.templateId
          : templateId // ignore: cast_nullable_to_non_nullable
              as String?,
      templateData: null == templateData
          ? _value._templateData
          : templateData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EmailNotificationImpl implements _EmailNotification {
  const _$EmailNotificationImpl(
      {required this.to,
      required this.subject,
      required this.htmlContent,
      this.textContent,
      this.from,
      this.replyTo,
      final List<String> cc = const [],
      final List<String> bcc = const [],
      final List<EmailAttachment> attachments = const [],
      final Map<String, String> headers = const {},
      this.templateId,
      final Map<String, dynamic> templateData = const {}})
      : _cc = cc,
        _bcc = bcc,
        _attachments = attachments,
        _headers = headers,
        _templateData = templateData;

  factory _$EmailNotificationImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmailNotificationImplFromJson(json);

  @override
  final String to;
  @override
  final String subject;
  @override
  final String htmlContent;
  @override
  final String? textContent;
  @override
  final String? from;
  @override
  final String? replyTo;
  final List<String> _cc;
  @override
  @JsonKey()
  List<String> get cc {
    if (_cc is EqualUnmodifiableListView) return _cc;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cc);
  }

  final List<String> _bcc;
  @override
  @JsonKey()
  List<String> get bcc {
    if (_bcc is EqualUnmodifiableListView) return _bcc;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bcc);
  }

  final List<EmailAttachment> _attachments;
  @override
  @JsonKey()
  List<EmailAttachment> get attachments {
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attachments);
  }

  final Map<String, String> _headers;
  @override
  @JsonKey()
  Map<String, String> get headers {
    if (_headers is EqualUnmodifiableMapView) return _headers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_headers);
  }

  @override
  final String? templateId;
  final Map<String, dynamic> _templateData;
  @override
  @JsonKey()
  Map<String, dynamic> get templateData {
    if (_templateData is EqualUnmodifiableMapView) return _templateData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_templateData);
  }

  @override
  String toString() {
    return 'EmailNotification(to: $to, subject: $subject, htmlContent: $htmlContent, textContent: $textContent, from: $from, replyTo: $replyTo, cc: $cc, bcc: $bcc, attachments: $attachments, headers: $headers, templateId: $templateId, templateData: $templateData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailNotificationImpl &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.htmlContent, htmlContent) ||
                other.htmlContent == htmlContent) &&
            (identical(other.textContent, textContent) ||
                other.textContent == textContent) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.replyTo, replyTo) || other.replyTo == replyTo) &&
            const DeepCollectionEquality().equals(other._cc, _cc) &&
            const DeepCollectionEquality().equals(other._bcc, _bcc) &&
            const DeepCollectionEquality()
                .equals(other._attachments, _attachments) &&
            const DeepCollectionEquality().equals(other._headers, _headers) &&
            (identical(other.templateId, templateId) ||
                other.templateId == templateId) &&
            const DeepCollectionEquality()
                .equals(other._templateData, _templateData));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      to,
      subject,
      htmlContent,
      textContent,
      from,
      replyTo,
      const DeepCollectionEquality().hash(_cc),
      const DeepCollectionEquality().hash(_bcc),
      const DeepCollectionEquality().hash(_attachments),
      const DeepCollectionEquality().hash(_headers),
      templateId,
      const DeepCollectionEquality().hash(_templateData));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailNotificationImplCopyWith<_$EmailNotificationImpl> get copyWith =>
      __$$EmailNotificationImplCopyWithImpl<_$EmailNotificationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmailNotificationImplToJson(
      this,
    );
  }
}

abstract class _EmailNotification implements EmailNotification {
  const factory _EmailNotification(
      {required final String to,
      required final String subject,
      required final String htmlContent,
      final String? textContent,
      final String? from,
      final String? replyTo,
      final List<String> cc,
      final List<String> bcc,
      final List<EmailAttachment> attachments,
      final Map<String, String> headers,
      final String? templateId,
      final Map<String, dynamic> templateData}) = _$EmailNotificationImpl;

  factory _EmailNotification.fromJson(Map<String, dynamic> json) =
      _$EmailNotificationImpl.fromJson;

  @override
  String get to;
  @override
  String get subject;
  @override
  String get htmlContent;
  @override
  String? get textContent;
  @override
  String? get from;
  @override
  String? get replyTo;
  @override
  List<String> get cc;
  @override
  List<String> get bcc;
  @override
  List<EmailAttachment> get attachments;
  @override
  Map<String, String> get headers;
  @override
  String? get templateId;
  @override
  Map<String, dynamic> get templateData;
  @override
  @JsonKey(ignore: true)
  _$$EmailNotificationImplCopyWith<_$EmailNotificationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EmailAttachment _$EmailAttachmentFromJson(Map<String, dynamic> json) {
  return _EmailAttachment.fromJson(json);
}

/// @nodoc
mixin _$EmailAttachment {
  String get filename => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get contentType => throw _privateConstructorUsedError;
  String? get disposition => throw _privateConstructorUsedError;
  String? get contentId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmailAttachmentCopyWith<EmailAttachment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailAttachmentCopyWith<$Res> {
  factory $EmailAttachmentCopyWith(
          EmailAttachment value, $Res Function(EmailAttachment) then) =
      _$EmailAttachmentCopyWithImpl<$Res, EmailAttachment>;
  @useResult
  $Res call(
      {String filename,
      String content,
      String contentType,
      String? disposition,
      String? contentId});
}

/// @nodoc
class _$EmailAttachmentCopyWithImpl<$Res, $Val extends EmailAttachment>
    implements $EmailAttachmentCopyWith<$Res> {
  _$EmailAttachmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filename = null,
    Object? content = null,
    Object? contentType = null,
    Object? disposition = freezed,
    Object? contentId = freezed,
  }) {
    return _then(_value.copyWith(
      filename: null == filename
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      contentType: null == contentType
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as String,
      disposition: freezed == disposition
          ? _value.disposition
          : disposition // ignore: cast_nullable_to_non_nullable
              as String?,
      contentId: freezed == contentId
          ? _value.contentId
          : contentId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmailAttachmentImplCopyWith<$Res>
    implements $EmailAttachmentCopyWith<$Res> {
  factory _$$EmailAttachmentImplCopyWith(_$EmailAttachmentImpl value,
          $Res Function(_$EmailAttachmentImpl) then) =
      __$$EmailAttachmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String filename,
      String content,
      String contentType,
      String? disposition,
      String? contentId});
}

/// @nodoc
class __$$EmailAttachmentImplCopyWithImpl<$Res>
    extends _$EmailAttachmentCopyWithImpl<$Res, _$EmailAttachmentImpl>
    implements _$$EmailAttachmentImplCopyWith<$Res> {
  __$$EmailAttachmentImplCopyWithImpl(
      _$EmailAttachmentImpl _value, $Res Function(_$EmailAttachmentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filename = null,
    Object? content = null,
    Object? contentType = null,
    Object? disposition = freezed,
    Object? contentId = freezed,
  }) {
    return _then(_$EmailAttachmentImpl(
      filename: null == filename
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      contentType: null == contentType
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as String,
      disposition: freezed == disposition
          ? _value.disposition
          : disposition // ignore: cast_nullable_to_non_nullable
              as String?,
      contentId: freezed == contentId
          ? _value.contentId
          : contentId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EmailAttachmentImpl implements _EmailAttachment {
  const _$EmailAttachmentImpl(
      {required this.filename,
      required this.content,
      required this.contentType,
      this.disposition,
      this.contentId});

  factory _$EmailAttachmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmailAttachmentImplFromJson(json);

  @override
  final String filename;
  @override
  final String content;
  @override
  final String contentType;
  @override
  final String? disposition;
  @override
  final String? contentId;

  @override
  String toString() {
    return 'EmailAttachment(filename: $filename, content: $content, contentType: $contentType, disposition: $disposition, contentId: $contentId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailAttachmentImpl &&
            (identical(other.filename, filename) ||
                other.filename == filename) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.contentType, contentType) ||
                other.contentType == contentType) &&
            (identical(other.disposition, disposition) ||
                other.disposition == disposition) &&
            (identical(other.contentId, contentId) ||
                other.contentId == contentId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, filename, content, contentType, disposition, contentId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailAttachmentImplCopyWith<_$EmailAttachmentImpl> get copyWith =>
      __$$EmailAttachmentImplCopyWithImpl<_$EmailAttachmentImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmailAttachmentImplToJson(
      this,
    );
  }
}

abstract class _EmailAttachment implements EmailAttachment {
  const factory _EmailAttachment(
      {required final String filename,
      required final String content,
      required final String contentType,
      final String? disposition,
      final String? contentId}) = _$EmailAttachmentImpl;

  factory _EmailAttachment.fromJson(Map<String, dynamic> json) =
      _$EmailAttachmentImpl.fromJson;

  @override
  String get filename;
  @override
  String get content;
  @override
  String get contentType;
  @override
  String? get disposition;
  @override
  String? get contentId;
  @override
  @JsonKey(ignore: true)
  _$$EmailAttachmentImplCopyWith<_$EmailAttachmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SMSNotification _$SMSNotificationFromJson(Map<String, dynamic> json) {
  return _SMSNotification.fromJson(json);
}

/// @nodoc
mixin _$SMSNotification {
  String get to => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String? get from => throw _privateConstructorUsedError;
  String? get mediaUrl => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SMSNotificationCopyWith<SMSNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SMSNotificationCopyWith<$Res> {
  factory $SMSNotificationCopyWith(
          SMSNotification value, $Res Function(SMSNotification) then) =
      _$SMSNotificationCopyWithImpl<$Res, SMSNotification>;
  @useResult
  $Res call(
      {String to,
      String message,
      String? from,
      String? mediaUrl,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class _$SMSNotificationCopyWithImpl<$Res, $Val extends SMSNotification>
    implements $SMSNotificationCopyWith<$Res> {
  _$SMSNotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? to = null,
    Object? message = null,
    Object? from = freezed,
    Object? mediaUrl = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaUrl: freezed == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SMSNotificationImplCopyWith<$Res>
    implements $SMSNotificationCopyWith<$Res> {
  factory _$$SMSNotificationImplCopyWith(_$SMSNotificationImpl value,
          $Res Function(_$SMSNotificationImpl) then) =
      __$$SMSNotificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String to,
      String message,
      String? from,
      String? mediaUrl,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class __$$SMSNotificationImplCopyWithImpl<$Res>
    extends _$SMSNotificationCopyWithImpl<$Res, _$SMSNotificationImpl>
    implements _$$SMSNotificationImplCopyWith<$Res> {
  __$$SMSNotificationImplCopyWithImpl(
      _$SMSNotificationImpl _value, $Res Function(_$SMSNotificationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? to = null,
    Object? message = null,
    Object? from = freezed,
    Object? mediaUrl = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_$SMSNotificationImpl(
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaUrl: freezed == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SMSNotificationImpl implements _SMSNotification {
  const _$SMSNotificationImpl(
      {required this.to,
      required this.message,
      this.from,
      this.mediaUrl,
      final Map<String, dynamic>? metadata})
      : _metadata = metadata;

  factory _$SMSNotificationImpl.fromJson(Map<String, dynamic> json) =>
      _$$SMSNotificationImplFromJson(json);

  @override
  final String to;
  @override
  final String message;
  @override
  final String? from;
  @override
  final String? mediaUrl;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'SMSNotification(to: $to, message: $message, from: $from, mediaUrl: $mediaUrl, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SMSNotificationImpl &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.mediaUrl, mediaUrl) ||
                other.mediaUrl == mediaUrl) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, to, message, from, mediaUrl,
      const DeepCollectionEquality().hash(_metadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SMSNotificationImplCopyWith<_$SMSNotificationImpl> get copyWith =>
      __$$SMSNotificationImplCopyWithImpl<_$SMSNotificationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SMSNotificationImplToJson(
      this,
    );
  }
}

abstract class _SMSNotification implements SMSNotification {
  const factory _SMSNotification(
      {required final String to,
      required final String message,
      final String? from,
      final String? mediaUrl,
      final Map<String, dynamic>? metadata}) = _$SMSNotificationImpl;

  factory _SMSNotification.fromJson(Map<String, dynamic> json) =
      _$SMSNotificationImpl.fromJson;

  @override
  String get to;
  @override
  String get message;
  @override
  String? get from;
  @override
  String? get mediaUrl;
  @override
  Map<String, dynamic>? get metadata;
  @override
  @JsonKey(ignore: true)
  _$$SMSNotificationImplCopyWith<_$SMSNotificationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
