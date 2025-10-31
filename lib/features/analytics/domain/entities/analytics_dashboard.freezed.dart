// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analytics_dashboard.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AnalyticsDashboard _$AnalyticsDashboardFromJson(Map<String, dynamic> json) {
  return _AnalyticsDashboard.fromJson(json);
}

/// @nodoc
mixin _$AnalyticsDashboard {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get organizationId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  DashboardType get type => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  List<AnalyticsWidget> get widgets => throw _privateConstructorUsedError;
  Map<String, dynamic> get configuration => throw _privateConstructorUsedError;
  List<String> get sharedWith => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  bool? get isDefault => throw _privateConstructorUsedError;
  DateTime? get lastViewedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnalyticsDashboardCopyWith<AnalyticsDashboard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyticsDashboardCopyWith<$Res> {
  factory $AnalyticsDashboardCopyWith(
          AnalyticsDashboard value, $Res Function(AnalyticsDashboard) then) =
      _$AnalyticsDashboardCopyWithImpl<$Res, AnalyticsDashboard>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String organizationId,
      String title,
      DashboardType type,
      DateTime createdAt,
      DateTime updatedAt,
      List<AnalyticsWidget> widgets,
      Map<String, dynamic> configuration,
      List<String> sharedWith,
      String? description,
      bool? isDefault,
      DateTime? lastViewedAt});
}

/// @nodoc
class _$AnalyticsDashboardCopyWithImpl<$Res, $Val extends AnalyticsDashboard>
    implements $AnalyticsDashboardCopyWith<$Res> {
  _$AnalyticsDashboardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? organizationId = null,
    Object? title = null,
    Object? type = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? widgets = null,
    Object? configuration = null,
    Object? sharedWith = null,
    Object? description = freezed,
    Object? isDefault = freezed,
    Object? lastViewedAt = freezed,
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
      organizationId: null == organizationId
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DashboardType,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      widgets: null == widgets
          ? _value.widgets
          : widgets // ignore: cast_nullable_to_non_nullable
              as List<AnalyticsWidget>,
      configuration: null == configuration
          ? _value.configuration
          : configuration // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      sharedWith: null == sharedWith
          ? _value.sharedWith
          : sharedWith // ignore: cast_nullable_to_non_nullable
              as List<String>,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isDefault: freezed == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastViewedAt: freezed == lastViewedAt
          ? _value.lastViewedAt
          : lastViewedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnalyticsDashboardImplCopyWith<$Res>
    implements $AnalyticsDashboardCopyWith<$Res> {
  factory _$$AnalyticsDashboardImplCopyWith(_$AnalyticsDashboardImpl value,
          $Res Function(_$AnalyticsDashboardImpl) then) =
      __$$AnalyticsDashboardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String organizationId,
      String title,
      DashboardType type,
      DateTime createdAt,
      DateTime updatedAt,
      List<AnalyticsWidget> widgets,
      Map<String, dynamic> configuration,
      List<String> sharedWith,
      String? description,
      bool? isDefault,
      DateTime? lastViewedAt});
}

/// @nodoc
class __$$AnalyticsDashboardImplCopyWithImpl<$Res>
    extends _$AnalyticsDashboardCopyWithImpl<$Res, _$AnalyticsDashboardImpl>
    implements _$$AnalyticsDashboardImplCopyWith<$Res> {
  __$$AnalyticsDashboardImplCopyWithImpl(_$AnalyticsDashboardImpl _value,
      $Res Function(_$AnalyticsDashboardImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? organizationId = null,
    Object? title = null,
    Object? type = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? widgets = null,
    Object? configuration = null,
    Object? sharedWith = null,
    Object? description = freezed,
    Object? isDefault = freezed,
    Object? lastViewedAt = freezed,
  }) {
    return _then(_$AnalyticsDashboardImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      organizationId: null == organizationId
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DashboardType,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      widgets: null == widgets
          ? _value._widgets
          : widgets // ignore: cast_nullable_to_non_nullable
              as List<AnalyticsWidget>,
      configuration: null == configuration
          ? _value._configuration
          : configuration // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      sharedWith: null == sharedWith
          ? _value._sharedWith
          : sharedWith // ignore: cast_nullable_to_non_nullable
              as List<String>,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isDefault: freezed == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastViewedAt: freezed == lastViewedAt
          ? _value.lastViewedAt
          : lastViewedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnalyticsDashboardImpl implements _AnalyticsDashboard {
  const _$AnalyticsDashboardImpl(
      {required this.id,
      required this.userId,
      required this.organizationId,
      required this.title,
      required this.type,
      required this.createdAt,
      required this.updatedAt,
      final List<AnalyticsWidget> widgets = const [],
      final Map<String, dynamic> configuration = const {},
      final List<String> sharedWith = const [],
      this.description,
      this.isDefault,
      this.lastViewedAt})
      : _widgets = widgets,
        _configuration = configuration,
        _sharedWith = sharedWith;

  factory _$AnalyticsDashboardImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnalyticsDashboardImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String organizationId;
  @override
  final String title;
  @override
  final DashboardType type;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  final List<AnalyticsWidget> _widgets;
  @override
  @JsonKey()
  List<AnalyticsWidget> get widgets {
    if (_widgets is EqualUnmodifiableListView) return _widgets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_widgets);
  }

  final Map<String, dynamic> _configuration;
  @override
  @JsonKey()
  Map<String, dynamic> get configuration {
    if (_configuration is EqualUnmodifiableMapView) return _configuration;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_configuration);
  }

  final List<String> _sharedWith;
  @override
  @JsonKey()
  List<String> get sharedWith {
    if (_sharedWith is EqualUnmodifiableListView) return _sharedWith;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sharedWith);
  }

  @override
  final String? description;
  @override
  final bool? isDefault;
  @override
  final DateTime? lastViewedAt;

  @override
  String toString() {
    return 'AnalyticsDashboard(id: $id, userId: $userId, organizationId: $organizationId, title: $title, type: $type, createdAt: $createdAt, updatedAt: $updatedAt, widgets: $widgets, configuration: $configuration, sharedWith: $sharedWith, description: $description, isDefault: $isDefault, lastViewedAt: $lastViewedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalyticsDashboardImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._widgets, _widgets) &&
            const DeepCollectionEquality()
                .equals(other._configuration, _configuration) &&
            const DeepCollectionEquality()
                .equals(other._sharedWith, _sharedWith) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            (identical(other.lastViewedAt, lastViewedAt) ||
                other.lastViewedAt == lastViewedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      organizationId,
      title,
      type,
      createdAt,
      updatedAt,
      const DeepCollectionEquality().hash(_widgets),
      const DeepCollectionEquality().hash(_configuration),
      const DeepCollectionEquality().hash(_sharedWith),
      description,
      isDefault,
      lastViewedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalyticsDashboardImplCopyWith<_$AnalyticsDashboardImpl> get copyWith =>
      __$$AnalyticsDashboardImplCopyWithImpl<_$AnalyticsDashboardImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnalyticsDashboardImplToJson(
      this,
    );
  }
}

abstract class _AnalyticsDashboard implements AnalyticsDashboard {
  const factory _AnalyticsDashboard(
      {required final String id,
      required final String userId,
      required final String organizationId,
      required final String title,
      required final DashboardType type,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final List<AnalyticsWidget> widgets,
      final Map<String, dynamic> configuration,
      final List<String> sharedWith,
      final String? description,
      final bool? isDefault,
      final DateTime? lastViewedAt}) = _$AnalyticsDashboardImpl;

  factory _AnalyticsDashboard.fromJson(Map<String, dynamic> json) =
      _$AnalyticsDashboardImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get organizationId;
  @override
  String get title;
  @override
  DashboardType get type;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  List<AnalyticsWidget> get widgets;
  @override
  Map<String, dynamic> get configuration;
  @override
  List<String> get sharedWith;
  @override
  String? get description;
  @override
  bool? get isDefault;
  @override
  DateTime? get lastViewedAt;
  @override
  @JsonKey(ignore: true)
  _$$AnalyticsDashboardImplCopyWith<_$AnalyticsDashboardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AnalyticsWidget _$AnalyticsWidgetFromJson(Map<String, dynamic> json) {
  return _AnalyticsWidget.fromJson(json);
}

/// @nodoc
mixin _$AnalyticsWidget {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  WidgetType get type => throw _privateConstructorUsedError;
  int get positionX => throw _privateConstructorUsedError;
  int get positionY => throw _privateConstructorUsedError;
  int get width => throw _privateConstructorUsedError;
  int get height => throw _privateConstructorUsedError;
  Map<String, dynamic> get configuration => throw _privateConstructorUsedError;
  Map<String, dynamic> get data => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnalyticsWidgetCopyWith<AnalyticsWidget> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyticsWidgetCopyWith<$Res> {
  factory $AnalyticsWidgetCopyWith(
          AnalyticsWidget value, $Res Function(AnalyticsWidget) then) =
      _$AnalyticsWidgetCopyWithImpl<$Res, AnalyticsWidget>;
  @useResult
  $Res call(
      {String id,
      String title,
      WidgetType type,
      int positionX,
      int positionY,
      int width,
      int height,
      Map<String, dynamic> configuration,
      Map<String, dynamic> data,
      String? description,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$AnalyticsWidgetCopyWithImpl<$Res, $Val extends AnalyticsWidget>
    implements $AnalyticsWidgetCopyWith<$Res> {
  _$AnalyticsWidgetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? type = null,
    Object? positionX = null,
    Object? positionY = null,
    Object? width = null,
    Object? height = null,
    Object? configuration = null,
    Object? data = null,
    Object? description = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as WidgetType,
      positionX: null == positionX
          ? _value.positionX
          : positionX // ignore: cast_nullable_to_non_nullable
              as int,
      positionY: null == positionY
          ? _value.positionY
          : positionY // ignore: cast_nullable_to_non_nullable
              as int,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      configuration: null == configuration
          ? _value.configuration
          : configuration // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$AnalyticsWidgetImplCopyWith<$Res>
    implements $AnalyticsWidgetCopyWith<$Res> {
  factory _$$AnalyticsWidgetImplCopyWith(_$AnalyticsWidgetImpl value,
          $Res Function(_$AnalyticsWidgetImpl) then) =
      __$$AnalyticsWidgetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      WidgetType type,
      int positionX,
      int positionY,
      int width,
      int height,
      Map<String, dynamic> configuration,
      Map<String, dynamic> data,
      String? description,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$AnalyticsWidgetImplCopyWithImpl<$Res>
    extends _$AnalyticsWidgetCopyWithImpl<$Res, _$AnalyticsWidgetImpl>
    implements _$$AnalyticsWidgetImplCopyWith<$Res> {
  __$$AnalyticsWidgetImplCopyWithImpl(
      _$AnalyticsWidgetImpl _value, $Res Function(_$AnalyticsWidgetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? type = null,
    Object? positionX = null,
    Object? positionY = null,
    Object? width = null,
    Object? height = null,
    Object? configuration = null,
    Object? data = null,
    Object? description = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$AnalyticsWidgetImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as WidgetType,
      positionX: null == positionX
          ? _value.positionX
          : positionX // ignore: cast_nullable_to_non_nullable
              as int,
      positionY: null == positionY
          ? _value.positionY
          : positionY // ignore: cast_nullable_to_non_nullable
              as int,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      configuration: null == configuration
          ? _value._configuration
          : configuration // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$AnalyticsWidgetImpl implements _AnalyticsWidget {
  const _$AnalyticsWidgetImpl(
      {required this.id,
      required this.title,
      required this.type,
      required this.positionX,
      required this.positionY,
      required this.width,
      required this.height,
      required final Map<String, dynamic> configuration,
      final Map<String, dynamic> data = const {},
      this.description,
      this.createdAt,
      this.updatedAt})
      : _configuration = configuration,
        _data = data;

  factory _$AnalyticsWidgetImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnalyticsWidgetImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final WidgetType type;
  @override
  final int positionX;
  @override
  final int positionY;
  @override
  final int width;
  @override
  final int height;
  final Map<String, dynamic> _configuration;
  @override
  Map<String, dynamic> get configuration {
    if (_configuration is EqualUnmodifiableMapView) return _configuration;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_configuration);
  }

  final Map<String, dynamic> _data;
  @override
  @JsonKey()
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  final String? description;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'AnalyticsWidget(id: $id, title: $title, type: $type, positionX: $positionX, positionY: $positionY, width: $width, height: $height, configuration: $configuration, data: $data, description: $description, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalyticsWidgetImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.positionX, positionX) ||
                other.positionX == positionX) &&
            (identical(other.positionY, positionY) ||
                other.positionY == positionY) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            const DeepCollectionEquality()
                .equals(other._configuration, _configuration) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.description, description) ||
                other.description == description) &&
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
      title,
      type,
      positionX,
      positionY,
      width,
      height,
      const DeepCollectionEquality().hash(_configuration),
      const DeepCollectionEquality().hash(_data),
      description,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalyticsWidgetImplCopyWith<_$AnalyticsWidgetImpl> get copyWith =>
      __$$AnalyticsWidgetImplCopyWithImpl<_$AnalyticsWidgetImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnalyticsWidgetImplToJson(
      this,
    );
  }
}

abstract class _AnalyticsWidget implements AnalyticsWidget {
  const factory _AnalyticsWidget(
      {required final String id,
      required final String title,
      required final WidgetType type,
      required final int positionX,
      required final int positionY,
      required final int width,
      required final int height,
      required final Map<String, dynamic> configuration,
      final Map<String, dynamic> data,
      final String? description,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$AnalyticsWidgetImpl;

  factory _AnalyticsWidget.fromJson(Map<String, dynamic> json) =
      _$AnalyticsWidgetImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  WidgetType get type;
  @override
  int get positionX;
  @override
  int get positionY;
  @override
  int get width;
  @override
  int get height;
  @override
  Map<String, dynamic> get configuration;
  @override
  Map<String, dynamic> get data;
  @override
  String? get description;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$AnalyticsWidgetImplCopyWith<_$AnalyticsWidgetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

KPI _$KPIFromJson(Map<String, dynamic> json) {
  return _KPI.fromJson(json);
}

/// @nodoc
mixin _$KPI {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  KPICategory get category => throw _privateConstructorUsedError;
  double get currentValue => throw _privateConstructorUsedError;
  double get targetValue => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  KPIDirection get direction => throw _privateConstructorUsedError;
  DateTime? get previousValue => throw _privateConstructorUsedError;
  DateTime? get lastUpdated => throw _privateConstructorUsedError;
  List<KPIDataPoint> get historicalData => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KPICopyWith<KPI> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KPICopyWith<$Res> {
  factory $KPICopyWith(KPI value, $Res Function(KPI) then) =
      _$KPICopyWithImpl<$Res, KPI>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      KPICategory category,
      double currentValue,
      double targetValue,
      String unit,
      KPIDirection direction,
      DateTime? previousValue,
      DateTime? lastUpdated,
      List<KPIDataPoint> historicalData,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class _$KPICopyWithImpl<$Res, $Val extends KPI> implements $KPICopyWith<$Res> {
  _$KPICopyWithImpl(this._value, this._then);

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
    Object? category = null,
    Object? currentValue = null,
    Object? targetValue = null,
    Object? unit = null,
    Object? direction = null,
    Object? previousValue = freezed,
    Object? lastUpdated = freezed,
    Object? historicalData = null,
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
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as KPICategory,
      currentValue: null == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as double,
      targetValue: null == targetValue
          ? _value.targetValue
          : targetValue // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      direction: null == direction
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as KPIDirection,
      previousValue: freezed == previousValue
          ? _value.previousValue
          : previousValue // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      historicalData: null == historicalData
          ? _value.historicalData
          : historicalData // ignore: cast_nullable_to_non_nullable
              as List<KPIDataPoint>,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KPIImplCopyWith<$Res> implements $KPICopyWith<$Res> {
  factory _$$KPIImplCopyWith(_$KPIImpl value, $Res Function(_$KPIImpl) then) =
      __$$KPIImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      KPICategory category,
      double currentValue,
      double targetValue,
      String unit,
      KPIDirection direction,
      DateTime? previousValue,
      DateTime? lastUpdated,
      List<KPIDataPoint> historicalData,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class __$$KPIImplCopyWithImpl<$Res> extends _$KPICopyWithImpl<$Res, _$KPIImpl>
    implements _$$KPIImplCopyWith<$Res> {
  __$$KPIImplCopyWithImpl(_$KPIImpl _value, $Res Function(_$KPIImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? category = null,
    Object? currentValue = null,
    Object? targetValue = null,
    Object? unit = null,
    Object? direction = null,
    Object? previousValue = freezed,
    Object? lastUpdated = freezed,
    Object? historicalData = null,
    Object? metadata = freezed,
  }) {
    return _then(_$KPIImpl(
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
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as KPICategory,
      currentValue: null == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as double,
      targetValue: null == targetValue
          ? _value.targetValue
          : targetValue // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      direction: null == direction
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as KPIDirection,
      previousValue: freezed == previousValue
          ? _value.previousValue
          : previousValue // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      historicalData: null == historicalData
          ? _value._historicalData
          : historicalData // ignore: cast_nullable_to_non_nullable
              as List<KPIDataPoint>,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KPIImpl implements _KPI {
  const _$KPIImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.category,
      required this.currentValue,
      required this.targetValue,
      required this.unit,
      required this.direction,
      this.previousValue,
      this.lastUpdated,
      final List<KPIDataPoint> historicalData = const [],
      final Map<String, dynamic>? metadata})
      : _historicalData = historicalData,
        _metadata = metadata;

  factory _$KPIImpl.fromJson(Map<String, dynamic> json) =>
      _$$KPIImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final KPICategory category;
  @override
  final double currentValue;
  @override
  final double targetValue;
  @override
  final String unit;
  @override
  final KPIDirection direction;
  @override
  final DateTime? previousValue;
  @override
  final DateTime? lastUpdated;
  final List<KPIDataPoint> _historicalData;
  @override
  @JsonKey()
  List<KPIDataPoint> get historicalData {
    if (_historicalData is EqualUnmodifiableListView) return _historicalData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_historicalData);
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
  String toString() {
    return 'KPI(id: $id, name: $name, description: $description, category: $category, currentValue: $currentValue, targetValue: $targetValue, unit: $unit, direction: $direction, previousValue: $previousValue, lastUpdated: $lastUpdated, historicalData: $historicalData, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KPIImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.currentValue, currentValue) ||
                other.currentValue == currentValue) &&
            (identical(other.targetValue, targetValue) ||
                other.targetValue == targetValue) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.direction, direction) ||
                other.direction == direction) &&
            (identical(other.previousValue, previousValue) ||
                other.previousValue == previousValue) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated) &&
            const DeepCollectionEquality()
                .equals(other._historicalData, _historicalData) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      category,
      currentValue,
      targetValue,
      unit,
      direction,
      previousValue,
      lastUpdated,
      const DeepCollectionEquality().hash(_historicalData),
      const DeepCollectionEquality().hash(_metadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KPIImplCopyWith<_$KPIImpl> get copyWith =>
      __$$KPIImplCopyWithImpl<_$KPIImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KPIImplToJson(
      this,
    );
  }
}

abstract class _KPI implements KPI {
  const factory _KPI(
      {required final String id,
      required final String name,
      required final String description,
      required final KPICategory category,
      required final double currentValue,
      required final double targetValue,
      required final String unit,
      required final KPIDirection direction,
      final DateTime? previousValue,
      final DateTime? lastUpdated,
      final List<KPIDataPoint> historicalData,
      final Map<String, dynamic>? metadata}) = _$KPIImpl;

  factory _KPI.fromJson(Map<String, dynamic> json) = _$KPIImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  KPICategory get category;
  @override
  double get currentValue;
  @override
  double get targetValue;
  @override
  String get unit;
  @override
  KPIDirection get direction;
  @override
  DateTime? get previousValue;
  @override
  DateTime? get lastUpdated;
  @override
  List<KPIDataPoint> get historicalData;
  @override
  Map<String, dynamic>? get metadata;
  @override
  @JsonKey(ignore: true)
  _$$KPIImplCopyWith<_$KPIImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

KPIDataPoint _$KPIDataPointFromJson(Map<String, dynamic> json) {
  return _KPIDataPoint.fromJson(json);
}

/// @nodoc
mixin _$KPIDataPoint {
  DateTime get timestamp => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  Map<String, dynamic>? get context => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KPIDataPointCopyWith<KPIDataPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KPIDataPointCopyWith<$Res> {
  factory $KPIDataPointCopyWith(
          KPIDataPoint value, $Res Function(KPIDataPoint) then) =
      _$KPIDataPointCopyWithImpl<$Res, KPIDataPoint>;
  @useResult
  $Res call(
      {DateTime timestamp,
      double value,
      String? note,
      Map<String, dynamic>? context});
}

/// @nodoc
class _$KPIDataPointCopyWithImpl<$Res, $Val extends KPIDataPoint>
    implements $KPIDataPointCopyWith<$Res> {
  _$KPIDataPointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? value = null,
    Object? note = freezed,
    Object? context = freezed,
  }) {
    return _then(_value.copyWith(
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      context: freezed == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KPIDataPointImplCopyWith<$Res>
    implements $KPIDataPointCopyWith<$Res> {
  factory _$$KPIDataPointImplCopyWith(
          _$KPIDataPointImpl value, $Res Function(_$KPIDataPointImpl) then) =
      __$$KPIDataPointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime timestamp,
      double value,
      String? note,
      Map<String, dynamic>? context});
}

/// @nodoc
class __$$KPIDataPointImplCopyWithImpl<$Res>
    extends _$KPIDataPointCopyWithImpl<$Res, _$KPIDataPointImpl>
    implements _$$KPIDataPointImplCopyWith<$Res> {
  __$$KPIDataPointImplCopyWithImpl(
      _$KPIDataPointImpl _value, $Res Function(_$KPIDataPointImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? value = null,
    Object? note = freezed,
    Object? context = freezed,
  }) {
    return _then(_$KPIDataPointImpl(
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      context: freezed == context
          ? _value._context
          : context // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KPIDataPointImpl implements _KPIDataPoint {
  const _$KPIDataPointImpl(
      {required this.timestamp,
      required this.value,
      this.note,
      final Map<String, dynamic>? context})
      : _context = context;

  factory _$KPIDataPointImpl.fromJson(Map<String, dynamic> json) =>
      _$$KPIDataPointImplFromJson(json);

  @override
  final DateTime timestamp;
  @override
  final double value;
  @override
  final String? note;
  final Map<String, dynamic>? _context;
  @override
  Map<String, dynamic>? get context {
    final value = _context;
    if (value == null) return null;
    if (_context is EqualUnmodifiableMapView) return _context;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'KPIDataPoint(timestamp: $timestamp, value: $value, note: $note, context: $context)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KPIDataPointImpl &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.note, note) || other.note == note) &&
            const DeepCollectionEquality().equals(other._context, _context));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, timestamp, value, note,
      const DeepCollectionEquality().hash(_context));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KPIDataPointImplCopyWith<_$KPIDataPointImpl> get copyWith =>
      __$$KPIDataPointImplCopyWithImpl<_$KPIDataPointImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KPIDataPointImplToJson(
      this,
    );
  }
}

abstract class _KPIDataPoint implements KPIDataPoint {
  const factory _KPIDataPoint(
      {required final DateTime timestamp,
      required final double value,
      final String? note,
      final Map<String, dynamic>? context}) = _$KPIDataPointImpl;

  factory _KPIDataPoint.fromJson(Map<String, dynamic> json) =
      _$KPIDataPointImpl.fromJson;

  @override
  DateTime get timestamp;
  @override
  double get value;
  @override
  String? get note;
  @override
  Map<String, dynamic>? get context;
  @override
  @JsonKey(ignore: true)
  _$$KPIDataPointImplCopyWith<_$KPIDataPointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AnalyticsReport _$AnalyticsReportFromJson(Map<String, dynamic> json) {
  return _AnalyticsReport.fromJson(json);
}

/// @nodoc
mixin _$AnalyticsReport {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  ReportType get type => throw _privateConstructorUsedError;
  ReportStatus get status => throw _privateConstructorUsedError;
  DateTime get periodStart => throw _privateConstructorUsedError;
  DateTime get periodEnd => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  List<ReportSection> get sections => throw _privateConstructorUsedError;
  List<String> get recipients => throw _privateConstructorUsedError;
  String? get createdBy => throw _privateConstructorUsedError;
  DateTime? get scheduledAt => throw _privateConstructorUsedError;
  String? get templateId => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnalyticsReportCopyWith<AnalyticsReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyticsReportCopyWith<$Res> {
  factory $AnalyticsReportCopyWith(
          AnalyticsReport value, $Res Function(AnalyticsReport) then) =
      _$AnalyticsReportCopyWithImpl<$Res, AnalyticsReport>;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      ReportType type,
      ReportStatus status,
      DateTime periodStart,
      DateTime periodEnd,
      DateTime createdAt,
      List<ReportSection> sections,
      List<String> recipients,
      String? createdBy,
      DateTime? scheduledAt,
      String? templateId,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class _$AnalyticsReportCopyWithImpl<$Res, $Val extends AnalyticsReport>
    implements $AnalyticsReportCopyWith<$Res> {
  _$AnalyticsReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? type = null,
    Object? status = null,
    Object? periodStart = null,
    Object? periodEnd = null,
    Object? createdAt = null,
    Object? sections = null,
    Object? recipients = null,
    Object? createdBy = freezed,
    Object? scheduledAt = freezed,
    Object? templateId = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ReportType,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ReportStatus,
      periodStart: null == periodStart
          ? _value.periodStart
          : periodStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      periodEnd: null == periodEnd
          ? _value.periodEnd
          : periodEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sections: null == sections
          ? _value.sections
          : sections // ignore: cast_nullable_to_non_nullable
              as List<ReportSection>,
      recipients: null == recipients
          ? _value.recipients
          : recipients // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      scheduledAt: freezed == scheduledAt
          ? _value.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      templateId: freezed == templateId
          ? _value.templateId
          : templateId // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnalyticsReportImplCopyWith<$Res>
    implements $AnalyticsReportCopyWith<$Res> {
  factory _$$AnalyticsReportImplCopyWith(_$AnalyticsReportImpl value,
          $Res Function(_$AnalyticsReportImpl) then) =
      __$$AnalyticsReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      ReportType type,
      ReportStatus status,
      DateTime periodStart,
      DateTime periodEnd,
      DateTime createdAt,
      List<ReportSection> sections,
      List<String> recipients,
      String? createdBy,
      DateTime? scheduledAt,
      String? templateId,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class __$$AnalyticsReportImplCopyWithImpl<$Res>
    extends _$AnalyticsReportCopyWithImpl<$Res, _$AnalyticsReportImpl>
    implements _$$AnalyticsReportImplCopyWith<$Res> {
  __$$AnalyticsReportImplCopyWithImpl(
      _$AnalyticsReportImpl _value, $Res Function(_$AnalyticsReportImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? type = null,
    Object? status = null,
    Object? periodStart = null,
    Object? periodEnd = null,
    Object? createdAt = null,
    Object? sections = null,
    Object? recipients = null,
    Object? createdBy = freezed,
    Object? scheduledAt = freezed,
    Object? templateId = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_$AnalyticsReportImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ReportType,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ReportStatus,
      periodStart: null == periodStart
          ? _value.periodStart
          : periodStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      periodEnd: null == periodEnd
          ? _value.periodEnd
          : periodEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sections: null == sections
          ? _value._sections
          : sections // ignore: cast_nullable_to_non_nullable
              as List<ReportSection>,
      recipients: null == recipients
          ? _value._recipients
          : recipients // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      scheduledAt: freezed == scheduledAt
          ? _value.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      templateId: freezed == templateId
          ? _value.templateId
          : templateId // ignore: cast_nullable_to_non_nullable
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
class _$AnalyticsReportImpl implements _AnalyticsReport {
  const _$AnalyticsReportImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.type,
      required this.status,
      required this.periodStart,
      required this.periodEnd,
      required this.createdAt,
      final List<ReportSection> sections = const [],
      final List<String> recipients = const [],
      this.createdBy,
      this.scheduledAt,
      this.templateId,
      final Map<String, dynamic>? metadata})
      : _sections = sections,
        _recipients = recipients,
        _metadata = metadata;

  factory _$AnalyticsReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnalyticsReportImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final ReportType type;
  @override
  final ReportStatus status;
  @override
  final DateTime periodStart;
  @override
  final DateTime periodEnd;
  @override
  final DateTime createdAt;
  final List<ReportSection> _sections;
  @override
  @JsonKey()
  List<ReportSection> get sections {
    if (_sections is EqualUnmodifiableListView) return _sections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sections);
  }

  final List<String> _recipients;
  @override
  @JsonKey()
  List<String> get recipients {
    if (_recipients is EqualUnmodifiableListView) return _recipients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recipients);
  }

  @override
  final String? createdBy;
  @override
  final DateTime? scheduledAt;
  @override
  final String? templateId;
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
    return 'AnalyticsReport(id: $id, title: $title, description: $description, type: $type, status: $status, periodStart: $periodStart, periodEnd: $periodEnd, createdAt: $createdAt, sections: $sections, recipients: $recipients, createdBy: $createdBy, scheduledAt: $scheduledAt, templateId: $templateId, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalyticsReportImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.periodStart, periodStart) ||
                other.periodStart == periodStart) &&
            (identical(other.periodEnd, periodEnd) ||
                other.periodEnd == periodEnd) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other._sections, _sections) &&
            const DeepCollectionEquality()
                .equals(other._recipients, _recipients) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.scheduledAt, scheduledAt) ||
                other.scheduledAt == scheduledAt) &&
            (identical(other.templateId, templateId) ||
                other.templateId == templateId) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      type,
      status,
      periodStart,
      periodEnd,
      createdAt,
      const DeepCollectionEquality().hash(_sections),
      const DeepCollectionEquality().hash(_recipients),
      createdBy,
      scheduledAt,
      templateId,
      const DeepCollectionEquality().hash(_metadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalyticsReportImplCopyWith<_$AnalyticsReportImpl> get copyWith =>
      __$$AnalyticsReportImplCopyWithImpl<_$AnalyticsReportImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnalyticsReportImplToJson(
      this,
    );
  }
}

abstract class _AnalyticsReport implements AnalyticsReport {
  const factory _AnalyticsReport(
      {required final String id,
      required final String title,
      required final String description,
      required final ReportType type,
      required final ReportStatus status,
      required final DateTime periodStart,
      required final DateTime periodEnd,
      required final DateTime createdAt,
      final List<ReportSection> sections,
      final List<String> recipients,
      final String? createdBy,
      final DateTime? scheduledAt,
      final String? templateId,
      final Map<String, dynamic>? metadata}) = _$AnalyticsReportImpl;

  factory _AnalyticsReport.fromJson(Map<String, dynamic> json) =
      _$AnalyticsReportImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  ReportType get type;
  @override
  ReportStatus get status;
  @override
  DateTime get periodStart;
  @override
  DateTime get periodEnd;
  @override
  DateTime get createdAt;
  @override
  List<ReportSection> get sections;
  @override
  List<String> get recipients;
  @override
  String? get createdBy;
  @override
  DateTime? get scheduledAt;
  @override
  String? get templateId;
  @override
  Map<String, dynamic>? get metadata;
  @override
  @JsonKey(ignore: true)
  _$$AnalyticsReportImplCopyWith<_$AnalyticsReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReportSection _$ReportSectionFromJson(Map<String, dynamic> json) {
  return _ReportSection.fromJson(json);
}

/// @nodoc
mixin _$ReportSection {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  SectionType get type => throw _privateConstructorUsedError;
  int get order => throw _privateConstructorUsedError;
  Map<String, dynamic> get content => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<ReportChart> get charts => throw _privateConstructorUsedError;
  List<ReportTable> get tables => throw _privateConstructorUsedError;
  Map<String, dynamic>? get configuration => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportSectionCopyWith<ReportSection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportSectionCopyWith<$Res> {
  factory $ReportSectionCopyWith(
          ReportSection value, $Res Function(ReportSection) then) =
      _$ReportSectionCopyWithImpl<$Res, ReportSection>;
  @useResult
  $Res call(
      {String id,
      String title,
      SectionType type,
      int order,
      Map<String, dynamic> content,
      String? description,
      List<ReportChart> charts,
      List<ReportTable> tables,
      Map<String, dynamic>? configuration});
}

/// @nodoc
class _$ReportSectionCopyWithImpl<$Res, $Val extends ReportSection>
    implements $ReportSectionCopyWith<$Res> {
  _$ReportSectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? type = null,
    Object? order = null,
    Object? content = null,
    Object? description = freezed,
    Object? charts = null,
    Object? tables = null,
    Object? configuration = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SectionType,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      charts: null == charts
          ? _value.charts
          : charts // ignore: cast_nullable_to_non_nullable
              as List<ReportChart>,
      tables: null == tables
          ? _value.tables
          : tables // ignore: cast_nullable_to_non_nullable
              as List<ReportTable>,
      configuration: freezed == configuration
          ? _value.configuration
          : configuration // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReportSectionImplCopyWith<$Res>
    implements $ReportSectionCopyWith<$Res> {
  factory _$$ReportSectionImplCopyWith(
          _$ReportSectionImpl value, $Res Function(_$ReportSectionImpl) then) =
      __$$ReportSectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      SectionType type,
      int order,
      Map<String, dynamic> content,
      String? description,
      List<ReportChart> charts,
      List<ReportTable> tables,
      Map<String, dynamic>? configuration});
}

/// @nodoc
class __$$ReportSectionImplCopyWithImpl<$Res>
    extends _$ReportSectionCopyWithImpl<$Res, _$ReportSectionImpl>
    implements _$$ReportSectionImplCopyWith<$Res> {
  __$$ReportSectionImplCopyWithImpl(
      _$ReportSectionImpl _value, $Res Function(_$ReportSectionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? type = null,
    Object? order = null,
    Object? content = null,
    Object? description = freezed,
    Object? charts = null,
    Object? tables = null,
    Object? configuration = freezed,
  }) {
    return _then(_$ReportSectionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SectionType,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value._content
          : content // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      charts: null == charts
          ? _value._charts
          : charts // ignore: cast_nullable_to_non_nullable
              as List<ReportChart>,
      tables: null == tables
          ? _value._tables
          : tables // ignore: cast_nullable_to_non_nullable
              as List<ReportTable>,
      configuration: freezed == configuration
          ? _value._configuration
          : configuration // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReportSectionImpl implements _ReportSection {
  const _$ReportSectionImpl(
      {required this.id,
      required this.title,
      required this.type,
      required this.order,
      required final Map<String, dynamic> content,
      this.description,
      final List<ReportChart> charts = const [],
      final List<ReportTable> tables = const [],
      final Map<String, dynamic>? configuration})
      : _content = content,
        _charts = charts,
        _tables = tables,
        _configuration = configuration;

  factory _$ReportSectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportSectionImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final SectionType type;
  @override
  final int order;
  final Map<String, dynamic> _content;
  @override
  Map<String, dynamic> get content {
    if (_content is EqualUnmodifiableMapView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_content);
  }

  @override
  final String? description;
  final List<ReportChart> _charts;
  @override
  @JsonKey()
  List<ReportChart> get charts {
    if (_charts is EqualUnmodifiableListView) return _charts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_charts);
  }

  final List<ReportTable> _tables;
  @override
  @JsonKey()
  List<ReportTable> get tables {
    if (_tables is EqualUnmodifiableListView) return _tables;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tables);
  }

  final Map<String, dynamic>? _configuration;
  @override
  Map<String, dynamic>? get configuration {
    final value = _configuration;
    if (value == null) return null;
    if (_configuration is EqualUnmodifiableMapView) return _configuration;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'ReportSection(id: $id, title: $title, type: $type, order: $order, content: $content, description: $description, charts: $charts, tables: $tables, configuration: $configuration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportSectionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.order, order) || other.order == order) &&
            const DeepCollectionEquality().equals(other._content, _content) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._charts, _charts) &&
            const DeepCollectionEquality().equals(other._tables, _tables) &&
            const DeepCollectionEquality()
                .equals(other._configuration, _configuration));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      type,
      order,
      const DeepCollectionEquality().hash(_content),
      description,
      const DeepCollectionEquality().hash(_charts),
      const DeepCollectionEquality().hash(_tables),
      const DeepCollectionEquality().hash(_configuration));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportSectionImplCopyWith<_$ReportSectionImpl> get copyWith =>
      __$$ReportSectionImplCopyWithImpl<_$ReportSectionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportSectionImplToJson(
      this,
    );
  }
}

abstract class _ReportSection implements ReportSection {
  const factory _ReportSection(
      {required final String id,
      required final String title,
      required final SectionType type,
      required final int order,
      required final Map<String, dynamic> content,
      final String? description,
      final List<ReportChart> charts,
      final List<ReportTable> tables,
      final Map<String, dynamic>? configuration}) = _$ReportSectionImpl;

  factory _ReportSection.fromJson(Map<String, dynamic> json) =
      _$ReportSectionImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  SectionType get type;
  @override
  int get order;
  @override
  Map<String, dynamic> get content;
  @override
  String? get description;
  @override
  List<ReportChart> get charts;
  @override
  List<ReportTable> get tables;
  @override
  Map<String, dynamic>? get configuration;
  @override
  @JsonKey(ignore: true)
  _$$ReportSectionImplCopyWith<_$ReportSectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReportChart _$ReportChartFromJson(Map<String, dynamic> json) {
  return _ReportChart.fromJson(json);
}

/// @nodoc
mixin _$ReportChart {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  ChartType get type => throw _privateConstructorUsedError;
  Map<String, dynamic> get data => throw _privateConstructorUsedError;
  Map<String, dynamic> get configuration => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get xAxisLabel => throw _privateConstructorUsedError;
  String? get yAxisLabel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportChartCopyWith<ReportChart> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportChartCopyWith<$Res> {
  factory $ReportChartCopyWith(
          ReportChart value, $Res Function(ReportChart) then) =
      _$ReportChartCopyWithImpl<$Res, ReportChart>;
  @useResult
  $Res call(
      {String id,
      String title,
      ChartType type,
      Map<String, dynamic> data,
      Map<String, dynamic> configuration,
      String? description,
      String? xAxisLabel,
      String? yAxisLabel});
}

/// @nodoc
class _$ReportChartCopyWithImpl<$Res, $Val extends ReportChart>
    implements $ReportChartCopyWith<$Res> {
  _$ReportChartCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? type = null,
    Object? data = null,
    Object? configuration = null,
    Object? description = freezed,
    Object? xAxisLabel = freezed,
    Object? yAxisLabel = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ChartType,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      configuration: null == configuration
          ? _value.configuration
          : configuration // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      xAxisLabel: freezed == xAxisLabel
          ? _value.xAxisLabel
          : xAxisLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      yAxisLabel: freezed == yAxisLabel
          ? _value.yAxisLabel
          : yAxisLabel // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReportChartImplCopyWith<$Res>
    implements $ReportChartCopyWith<$Res> {
  factory _$$ReportChartImplCopyWith(
          _$ReportChartImpl value, $Res Function(_$ReportChartImpl) then) =
      __$$ReportChartImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      ChartType type,
      Map<String, dynamic> data,
      Map<String, dynamic> configuration,
      String? description,
      String? xAxisLabel,
      String? yAxisLabel});
}

/// @nodoc
class __$$ReportChartImplCopyWithImpl<$Res>
    extends _$ReportChartCopyWithImpl<$Res, _$ReportChartImpl>
    implements _$$ReportChartImplCopyWith<$Res> {
  __$$ReportChartImplCopyWithImpl(
      _$ReportChartImpl _value, $Res Function(_$ReportChartImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? type = null,
    Object? data = null,
    Object? configuration = null,
    Object? description = freezed,
    Object? xAxisLabel = freezed,
    Object? yAxisLabel = freezed,
  }) {
    return _then(_$ReportChartImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ChartType,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      configuration: null == configuration
          ? _value._configuration
          : configuration // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      xAxisLabel: freezed == xAxisLabel
          ? _value.xAxisLabel
          : xAxisLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      yAxisLabel: freezed == yAxisLabel
          ? _value.yAxisLabel
          : yAxisLabel // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReportChartImpl implements _ReportChart {
  const _$ReportChartImpl(
      {required this.id,
      required this.title,
      required this.type,
      required final Map<String, dynamic> data,
      final Map<String, dynamic> configuration = const {},
      this.description,
      this.xAxisLabel,
      this.yAxisLabel})
      : _data = data,
        _configuration = configuration;

  factory _$ReportChartImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportChartImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final ChartType type;
  final Map<String, dynamic> _data;
  @override
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  final Map<String, dynamic> _configuration;
  @override
  @JsonKey()
  Map<String, dynamic> get configuration {
    if (_configuration is EqualUnmodifiableMapView) return _configuration;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_configuration);
  }

  @override
  final String? description;
  @override
  final String? xAxisLabel;
  @override
  final String? yAxisLabel;

  @override
  String toString() {
    return 'ReportChart(id: $id, title: $title, type: $type, data: $data, configuration: $configuration, description: $description, xAxisLabel: $xAxisLabel, yAxisLabel: $yAxisLabel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportChartImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            const DeepCollectionEquality()
                .equals(other._configuration, _configuration) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.xAxisLabel, xAxisLabel) ||
                other.xAxisLabel == xAxisLabel) &&
            (identical(other.yAxisLabel, yAxisLabel) ||
                other.yAxisLabel == yAxisLabel));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      type,
      const DeepCollectionEquality().hash(_data),
      const DeepCollectionEquality().hash(_configuration),
      description,
      xAxisLabel,
      yAxisLabel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportChartImplCopyWith<_$ReportChartImpl> get copyWith =>
      __$$ReportChartImplCopyWithImpl<_$ReportChartImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportChartImplToJson(
      this,
    );
  }
}

abstract class _ReportChart implements ReportChart {
  const factory _ReportChart(
      {required final String id,
      required final String title,
      required final ChartType type,
      required final Map<String, dynamic> data,
      final Map<String, dynamic> configuration,
      final String? description,
      final String? xAxisLabel,
      final String? yAxisLabel}) = _$ReportChartImpl;

  factory _ReportChart.fromJson(Map<String, dynamic> json) =
      _$ReportChartImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  ChartType get type;
  @override
  Map<String, dynamic> get data;
  @override
  Map<String, dynamic> get configuration;
  @override
  String? get description;
  @override
  String? get xAxisLabel;
  @override
  String? get yAxisLabel;
  @override
  @JsonKey(ignore: true)
  _$$ReportChartImplCopyWith<_$ReportChartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReportTable _$ReportTableFromJson(Map<String, dynamic> json) {
  return _ReportTable.fromJson(json);
}

/// @nodoc
mixin _$ReportTable {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<String> get headers => throw _privateConstructorUsedError;
  List<List<dynamic>> get rows => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  Map<String, dynamic> get formatting => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportTableCopyWith<ReportTable> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportTableCopyWith<$Res> {
  factory $ReportTableCopyWith(
          ReportTable value, $Res Function(ReportTable) then) =
      _$ReportTableCopyWithImpl<$Res, ReportTable>;
  @useResult
  $Res call(
      {String id,
      String title,
      List<String> headers,
      List<List<dynamic>> rows,
      String? description,
      Map<String, dynamic> formatting});
}

/// @nodoc
class _$ReportTableCopyWithImpl<$Res, $Val extends ReportTable>
    implements $ReportTableCopyWith<$Res> {
  _$ReportTableCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? headers = null,
    Object? rows = null,
    Object? description = freezed,
    Object? formatting = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      headers: null == headers
          ? _value.headers
          : headers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      rows: null == rows
          ? _value.rows
          : rows // ignore: cast_nullable_to_non_nullable
              as List<List<dynamic>>,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      formatting: null == formatting
          ? _value.formatting
          : formatting // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReportTableImplCopyWith<$Res>
    implements $ReportTableCopyWith<$Res> {
  factory _$$ReportTableImplCopyWith(
          _$ReportTableImpl value, $Res Function(_$ReportTableImpl) then) =
      __$$ReportTableImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      List<String> headers,
      List<List<dynamic>> rows,
      String? description,
      Map<String, dynamic> formatting});
}

/// @nodoc
class __$$ReportTableImplCopyWithImpl<$Res>
    extends _$ReportTableCopyWithImpl<$Res, _$ReportTableImpl>
    implements _$$ReportTableImplCopyWith<$Res> {
  __$$ReportTableImplCopyWithImpl(
      _$ReportTableImpl _value, $Res Function(_$ReportTableImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? headers = null,
    Object? rows = null,
    Object? description = freezed,
    Object? formatting = null,
  }) {
    return _then(_$ReportTableImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      headers: null == headers
          ? _value._headers
          : headers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      rows: null == rows
          ? _value._rows
          : rows // ignore: cast_nullable_to_non_nullable
              as List<List<dynamic>>,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      formatting: null == formatting
          ? _value._formatting
          : formatting // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReportTableImpl implements _ReportTable {
  const _$ReportTableImpl(
      {required this.id,
      required this.title,
      required final List<String> headers,
      required final List<List<dynamic>> rows,
      this.description,
      final Map<String, dynamic> formatting = const {}})
      : _headers = headers,
        _rows = rows,
        _formatting = formatting;

  factory _$ReportTableImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportTableImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  final List<String> _headers;
  @override
  List<String> get headers {
    if (_headers is EqualUnmodifiableListView) return _headers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_headers);
  }

  final List<List<dynamic>> _rows;
  @override
  List<List<dynamic>> get rows {
    if (_rows is EqualUnmodifiableListView) return _rows;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rows);
  }

  @override
  final String? description;
  final Map<String, dynamic> _formatting;
  @override
  @JsonKey()
  Map<String, dynamic> get formatting {
    if (_formatting is EqualUnmodifiableMapView) return _formatting;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_formatting);
  }

  @override
  String toString() {
    return 'ReportTable(id: $id, title: $title, headers: $headers, rows: $rows, description: $description, formatting: $formatting)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportTableImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._headers, _headers) &&
            const DeepCollectionEquality().equals(other._rows, _rows) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._formatting, _formatting));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      const DeepCollectionEquality().hash(_headers),
      const DeepCollectionEquality().hash(_rows),
      description,
      const DeepCollectionEquality().hash(_formatting));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportTableImplCopyWith<_$ReportTableImpl> get copyWith =>
      __$$ReportTableImplCopyWithImpl<_$ReportTableImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportTableImplToJson(
      this,
    );
  }
}

abstract class _ReportTable implements ReportTable {
  const factory _ReportTable(
      {required final String id,
      required final String title,
      required final List<String> headers,
      required final List<List<dynamic>> rows,
      final String? description,
      final Map<String, dynamic> formatting}) = _$ReportTableImpl;

  factory _ReportTable.fromJson(Map<String, dynamic> json) =
      _$ReportTableImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  List<String> get headers;
  @override
  List<List<dynamic>> get rows;
  @override
  String? get description;
  @override
  Map<String, dynamic> get formatting;
  @override
  @JsonKey(ignore: true)
  _$$ReportTableImplCopyWith<_$ReportTableImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AnalyticsInsight _$AnalyticsInsightFromJson(Map<String, dynamic> json) {
  return _AnalyticsInsight.fromJson(json);
}

/// @nodoc
mixin _$AnalyticsInsight {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  InsightType get type => throw _privateConstructorUsedError;
  InsightPriority get priority => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  List<String> get affectedMetrics => throw _privateConstructorUsedError;
  List<InsightAction> get recommendedActions =>
      throw _privateConstructorUsedError;
  String? get sourceQuery => throw _privateConstructorUsedError;
  double? get confidence => throw _privateConstructorUsedError;
  Map<String, dynamic>? get evidence => throw _privateConstructorUsedError;
  DateTime? get validUntil => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnalyticsInsightCopyWith<AnalyticsInsight> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyticsInsightCopyWith<$Res> {
  factory $AnalyticsInsightCopyWith(
          AnalyticsInsight value, $Res Function(AnalyticsInsight) then) =
      _$AnalyticsInsightCopyWithImpl<$Res, AnalyticsInsight>;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      InsightType type,
      InsightPriority priority,
      DateTime createdAt,
      List<String> affectedMetrics,
      List<InsightAction> recommendedActions,
      String? sourceQuery,
      double? confidence,
      Map<String, dynamic>? evidence,
      DateTime? validUntil});
}

/// @nodoc
class _$AnalyticsInsightCopyWithImpl<$Res, $Val extends AnalyticsInsight>
    implements $AnalyticsInsightCopyWith<$Res> {
  _$AnalyticsInsightCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? type = null,
    Object? priority = null,
    Object? createdAt = null,
    Object? affectedMetrics = null,
    Object? recommendedActions = null,
    Object? sourceQuery = freezed,
    Object? confidence = freezed,
    Object? evidence = freezed,
    Object? validUntil = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as InsightType,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as InsightPriority,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      affectedMetrics: null == affectedMetrics
          ? _value.affectedMetrics
          : affectedMetrics // ignore: cast_nullable_to_non_nullable
              as List<String>,
      recommendedActions: null == recommendedActions
          ? _value.recommendedActions
          : recommendedActions // ignore: cast_nullable_to_non_nullable
              as List<InsightAction>,
      sourceQuery: freezed == sourceQuery
          ? _value.sourceQuery
          : sourceQuery // ignore: cast_nullable_to_non_nullable
              as String?,
      confidence: freezed == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double?,
      evidence: freezed == evidence
          ? _value.evidence
          : evidence // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      validUntil: freezed == validUntil
          ? _value.validUntil
          : validUntil // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnalyticsInsightImplCopyWith<$Res>
    implements $AnalyticsInsightCopyWith<$Res> {
  factory _$$AnalyticsInsightImplCopyWith(_$AnalyticsInsightImpl value,
          $Res Function(_$AnalyticsInsightImpl) then) =
      __$$AnalyticsInsightImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      InsightType type,
      InsightPriority priority,
      DateTime createdAt,
      List<String> affectedMetrics,
      List<InsightAction> recommendedActions,
      String? sourceQuery,
      double? confidence,
      Map<String, dynamic>? evidence,
      DateTime? validUntil});
}

/// @nodoc
class __$$AnalyticsInsightImplCopyWithImpl<$Res>
    extends _$AnalyticsInsightCopyWithImpl<$Res, _$AnalyticsInsightImpl>
    implements _$$AnalyticsInsightImplCopyWith<$Res> {
  __$$AnalyticsInsightImplCopyWithImpl(_$AnalyticsInsightImpl _value,
      $Res Function(_$AnalyticsInsightImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? type = null,
    Object? priority = null,
    Object? createdAt = null,
    Object? affectedMetrics = null,
    Object? recommendedActions = null,
    Object? sourceQuery = freezed,
    Object? confidence = freezed,
    Object? evidence = freezed,
    Object? validUntil = freezed,
  }) {
    return _then(_$AnalyticsInsightImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as InsightType,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as InsightPriority,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      affectedMetrics: null == affectedMetrics
          ? _value._affectedMetrics
          : affectedMetrics // ignore: cast_nullable_to_non_nullable
              as List<String>,
      recommendedActions: null == recommendedActions
          ? _value._recommendedActions
          : recommendedActions // ignore: cast_nullable_to_non_nullable
              as List<InsightAction>,
      sourceQuery: freezed == sourceQuery
          ? _value.sourceQuery
          : sourceQuery // ignore: cast_nullable_to_non_nullable
              as String?,
      confidence: freezed == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double?,
      evidence: freezed == evidence
          ? _value._evidence
          : evidence // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      validUntil: freezed == validUntil
          ? _value.validUntil
          : validUntil // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnalyticsInsightImpl implements _AnalyticsInsight {
  const _$AnalyticsInsightImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.type,
      required this.priority,
      required this.createdAt,
      final List<String> affectedMetrics = const [],
      final List<InsightAction> recommendedActions = const [],
      this.sourceQuery,
      this.confidence,
      final Map<String, dynamic>? evidence,
      this.validUntil})
      : _affectedMetrics = affectedMetrics,
        _recommendedActions = recommendedActions,
        _evidence = evidence;

  factory _$AnalyticsInsightImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnalyticsInsightImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final InsightType type;
  @override
  final InsightPriority priority;
  @override
  final DateTime createdAt;
  final List<String> _affectedMetrics;
  @override
  @JsonKey()
  List<String> get affectedMetrics {
    if (_affectedMetrics is EqualUnmodifiableListView) return _affectedMetrics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_affectedMetrics);
  }

  final List<InsightAction> _recommendedActions;
  @override
  @JsonKey()
  List<InsightAction> get recommendedActions {
    if (_recommendedActions is EqualUnmodifiableListView)
      return _recommendedActions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recommendedActions);
  }

  @override
  final String? sourceQuery;
  @override
  final double? confidence;
  final Map<String, dynamic>? _evidence;
  @override
  Map<String, dynamic>? get evidence {
    final value = _evidence;
    if (value == null) return null;
    if (_evidence is EqualUnmodifiableMapView) return _evidence;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final DateTime? validUntil;

  @override
  String toString() {
    return 'AnalyticsInsight(id: $id, title: $title, description: $description, type: $type, priority: $priority, createdAt: $createdAt, affectedMetrics: $affectedMetrics, recommendedActions: $recommendedActions, sourceQuery: $sourceQuery, confidence: $confidence, evidence: $evidence, validUntil: $validUntil)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalyticsInsightImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality()
                .equals(other._affectedMetrics, _affectedMetrics) &&
            const DeepCollectionEquality()
                .equals(other._recommendedActions, _recommendedActions) &&
            (identical(other.sourceQuery, sourceQuery) ||
                other.sourceQuery == sourceQuery) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            const DeepCollectionEquality().equals(other._evidence, _evidence) &&
            (identical(other.validUntil, validUntil) ||
                other.validUntil == validUntil));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      type,
      priority,
      createdAt,
      const DeepCollectionEquality().hash(_affectedMetrics),
      const DeepCollectionEquality().hash(_recommendedActions),
      sourceQuery,
      confidence,
      const DeepCollectionEquality().hash(_evidence),
      validUntil);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalyticsInsightImplCopyWith<_$AnalyticsInsightImpl> get copyWith =>
      __$$AnalyticsInsightImplCopyWithImpl<_$AnalyticsInsightImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnalyticsInsightImplToJson(
      this,
    );
  }
}

abstract class _AnalyticsInsight implements AnalyticsInsight {
  const factory _AnalyticsInsight(
      {required final String id,
      required final String title,
      required final String description,
      required final InsightType type,
      required final InsightPriority priority,
      required final DateTime createdAt,
      final List<String> affectedMetrics,
      final List<InsightAction> recommendedActions,
      final String? sourceQuery,
      final double? confidence,
      final Map<String, dynamic>? evidence,
      final DateTime? validUntil}) = _$AnalyticsInsightImpl;

  factory _AnalyticsInsight.fromJson(Map<String, dynamic> json) =
      _$AnalyticsInsightImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  InsightType get type;
  @override
  InsightPriority get priority;
  @override
  DateTime get createdAt;
  @override
  List<String> get affectedMetrics;
  @override
  List<InsightAction> get recommendedActions;
  @override
  String? get sourceQuery;
  @override
  double? get confidence;
  @override
  Map<String, dynamic>? get evidence;
  @override
  DateTime? get validUntil;
  @override
  @JsonKey(ignore: true)
  _$$AnalyticsInsightImplCopyWith<_$AnalyticsInsightImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InsightAction _$InsightActionFromJson(Map<String, dynamic> json) {
  return _InsightAction.fromJson(json);
}

/// @nodoc
mixin _$InsightAction {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  ActionType get type => throw _privateConstructorUsedError;
  String? get estimatedImpact => throw _privateConstructorUsedError;
  String? get timeframe => throw _privateConstructorUsedError;
  List<String> get prerequisites => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InsightActionCopyWith<InsightAction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InsightActionCopyWith<$Res> {
  factory $InsightActionCopyWith(
          InsightAction value, $Res Function(InsightAction) then) =
      _$InsightActionCopyWithImpl<$Res, InsightAction>;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      ActionType type,
      String? estimatedImpact,
      String? timeframe,
      List<String> prerequisites});
}

/// @nodoc
class _$InsightActionCopyWithImpl<$Res, $Val extends InsightAction>
    implements $InsightActionCopyWith<$Res> {
  _$InsightActionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? type = null,
    Object? estimatedImpact = freezed,
    Object? timeframe = freezed,
    Object? prerequisites = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ActionType,
      estimatedImpact: freezed == estimatedImpact
          ? _value.estimatedImpact
          : estimatedImpact // ignore: cast_nullable_to_non_nullable
              as String?,
      timeframe: freezed == timeframe
          ? _value.timeframe
          : timeframe // ignore: cast_nullable_to_non_nullable
              as String?,
      prerequisites: null == prerequisites
          ? _value.prerequisites
          : prerequisites // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InsightActionImplCopyWith<$Res>
    implements $InsightActionCopyWith<$Res> {
  factory _$$InsightActionImplCopyWith(
          _$InsightActionImpl value, $Res Function(_$InsightActionImpl) then) =
      __$$InsightActionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      ActionType type,
      String? estimatedImpact,
      String? timeframe,
      List<String> prerequisites});
}

/// @nodoc
class __$$InsightActionImplCopyWithImpl<$Res>
    extends _$InsightActionCopyWithImpl<$Res, _$InsightActionImpl>
    implements _$$InsightActionImplCopyWith<$Res> {
  __$$InsightActionImplCopyWithImpl(
      _$InsightActionImpl _value, $Res Function(_$InsightActionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? type = null,
    Object? estimatedImpact = freezed,
    Object? timeframe = freezed,
    Object? prerequisites = null,
  }) {
    return _then(_$InsightActionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ActionType,
      estimatedImpact: freezed == estimatedImpact
          ? _value.estimatedImpact
          : estimatedImpact // ignore: cast_nullable_to_non_nullable
              as String?,
      timeframe: freezed == timeframe
          ? _value.timeframe
          : timeframe // ignore: cast_nullable_to_non_nullable
              as String?,
      prerequisites: null == prerequisites
          ? _value._prerequisites
          : prerequisites // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InsightActionImpl implements _InsightAction {
  const _$InsightActionImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.type,
      this.estimatedImpact,
      this.timeframe,
      final List<String> prerequisites = const []})
      : _prerequisites = prerequisites;

  factory _$InsightActionImpl.fromJson(Map<String, dynamic> json) =>
      _$$InsightActionImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final ActionType type;
  @override
  final String? estimatedImpact;
  @override
  final String? timeframe;
  final List<String> _prerequisites;
  @override
  @JsonKey()
  List<String> get prerequisites {
    if (_prerequisites is EqualUnmodifiableListView) return _prerequisites;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_prerequisites);
  }

  @override
  String toString() {
    return 'InsightAction(id: $id, title: $title, description: $description, type: $type, estimatedImpact: $estimatedImpact, timeframe: $timeframe, prerequisites: $prerequisites)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InsightActionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.estimatedImpact, estimatedImpact) ||
                other.estimatedImpact == estimatedImpact) &&
            (identical(other.timeframe, timeframe) ||
                other.timeframe == timeframe) &&
            const DeepCollectionEquality()
                .equals(other._prerequisites, _prerequisites));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      type,
      estimatedImpact,
      timeframe,
      const DeepCollectionEquality().hash(_prerequisites));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InsightActionImplCopyWith<_$InsightActionImpl> get copyWith =>
      __$$InsightActionImplCopyWithImpl<_$InsightActionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InsightActionImplToJson(
      this,
    );
  }
}

abstract class _InsightAction implements InsightAction {
  const factory _InsightAction(
      {required final String id,
      required final String title,
      required final String description,
      required final ActionType type,
      final String? estimatedImpact,
      final String? timeframe,
      final List<String> prerequisites}) = _$InsightActionImpl;

  factory _InsightAction.fromJson(Map<String, dynamic> json) =
      _$InsightActionImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  ActionType get type;
  @override
  String? get estimatedImpact;
  @override
  String? get timeframe;
  @override
  List<String> get prerequisites;
  @override
  @JsonKey(ignore: true)
  _$$InsightActionImplCopyWith<_$InsightActionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DataSource _$DataSourceFromJson(Map<String, dynamic> json) {
  return _DataSource.fromJson(json);
}

/// @nodoc
mixin _$DataSource {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DataSourceType get type => throw _privateConstructorUsedError;
  Map<String, dynamic> get connectionConfig =>
      throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  List<String> get availableMetrics => throw _privateConstructorUsedError;
  DateTime? get lastSyncAt => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  String? get createdBy => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataSourceCopyWith<DataSource> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataSourceCopyWith<$Res> {
  factory $DataSourceCopyWith(
          DataSource value, $Res Function(DataSource) then) =
      _$DataSourceCopyWithImpl<$Res, DataSource>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      DataSourceType type,
      Map<String, dynamic> connectionConfig,
      bool isActive,
      List<String> availableMetrics,
      DateTime? lastSyncAt,
      DateTime? createdAt,
      String? createdBy,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class _$DataSourceCopyWithImpl<$Res, $Val extends DataSource>
    implements $DataSourceCopyWith<$Res> {
  _$DataSourceCopyWithImpl(this._value, this._then);

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
    Object? connectionConfig = null,
    Object? isActive = null,
    Object? availableMetrics = null,
    Object? lastSyncAt = freezed,
    Object? createdAt = freezed,
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
              as DataSourceType,
      connectionConfig: null == connectionConfig
          ? _value.connectionConfig
          : connectionConfig // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      availableMetrics: null == availableMetrics
          ? _value.availableMetrics
          : availableMetrics // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lastSyncAt: freezed == lastSyncAt
          ? _value.lastSyncAt
          : lastSyncAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
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
}

/// @nodoc
abstract class _$$DataSourceImplCopyWith<$Res>
    implements $DataSourceCopyWith<$Res> {
  factory _$$DataSourceImplCopyWith(
          _$DataSourceImpl value, $Res Function(_$DataSourceImpl) then) =
      __$$DataSourceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      DataSourceType type,
      Map<String, dynamic> connectionConfig,
      bool isActive,
      List<String> availableMetrics,
      DateTime? lastSyncAt,
      DateTime? createdAt,
      String? createdBy,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class __$$DataSourceImplCopyWithImpl<$Res>
    extends _$DataSourceCopyWithImpl<$Res, _$DataSourceImpl>
    implements _$$DataSourceImplCopyWith<$Res> {
  __$$DataSourceImplCopyWithImpl(
      _$DataSourceImpl _value, $Res Function(_$DataSourceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? type = null,
    Object? connectionConfig = null,
    Object? isActive = null,
    Object? availableMetrics = null,
    Object? lastSyncAt = freezed,
    Object? createdAt = freezed,
    Object? createdBy = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_$DataSourceImpl(
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
              as DataSourceType,
      connectionConfig: null == connectionConfig
          ? _value._connectionConfig
          : connectionConfig // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      availableMetrics: null == availableMetrics
          ? _value._availableMetrics
          : availableMetrics // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lastSyncAt: freezed == lastSyncAt
          ? _value.lastSyncAt
          : lastSyncAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
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
class _$DataSourceImpl implements _DataSource {
  const _$DataSourceImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.type,
      required final Map<String, dynamic> connectionConfig,
      required this.isActive,
      final List<String> availableMetrics = const [],
      this.lastSyncAt,
      this.createdAt,
      this.createdBy,
      final Map<String, dynamic>? metadata})
      : _connectionConfig = connectionConfig,
        _availableMetrics = availableMetrics,
        _metadata = metadata;

  factory _$DataSourceImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataSourceImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final DataSourceType type;
  final Map<String, dynamic> _connectionConfig;
  @override
  Map<String, dynamic> get connectionConfig {
    if (_connectionConfig is EqualUnmodifiableMapView) return _connectionConfig;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_connectionConfig);
  }

  @override
  final bool isActive;
  final List<String> _availableMetrics;
  @override
  @JsonKey()
  List<String> get availableMetrics {
    if (_availableMetrics is EqualUnmodifiableListView)
      return _availableMetrics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableMetrics);
  }

  @override
  final DateTime? lastSyncAt;
  @override
  final DateTime? createdAt;
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
    return 'DataSource(id: $id, name: $name, description: $description, type: $type, connectionConfig: $connectionConfig, isActive: $isActive, availableMetrics: $availableMetrics, lastSyncAt: $lastSyncAt, createdAt: $createdAt, createdBy: $createdBy, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataSourceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other._connectionConfig, _connectionConfig) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            const DeepCollectionEquality()
                .equals(other._availableMetrics, _availableMetrics) &&
            (identical(other.lastSyncAt, lastSyncAt) ||
                other.lastSyncAt == lastSyncAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
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
      const DeepCollectionEquality().hash(_connectionConfig),
      isActive,
      const DeepCollectionEquality().hash(_availableMetrics),
      lastSyncAt,
      createdAt,
      createdBy,
      const DeepCollectionEquality().hash(_metadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataSourceImplCopyWith<_$DataSourceImpl> get copyWith =>
      __$$DataSourceImplCopyWithImpl<_$DataSourceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataSourceImplToJson(
      this,
    );
  }
}

abstract class _DataSource implements DataSource {
  const factory _DataSource(
      {required final String id,
      required final String name,
      required final String description,
      required final DataSourceType type,
      required final Map<String, dynamic> connectionConfig,
      required final bool isActive,
      final List<String> availableMetrics,
      final DateTime? lastSyncAt,
      final DateTime? createdAt,
      final String? createdBy,
      final Map<String, dynamic>? metadata}) = _$DataSourceImpl;

  factory _DataSource.fromJson(Map<String, dynamic> json) =
      _$DataSourceImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  DataSourceType get type;
  @override
  Map<String, dynamic> get connectionConfig;
  @override
  bool get isActive;
  @override
  List<String> get availableMetrics;
  @override
  DateTime? get lastSyncAt;
  @override
  DateTime? get createdAt;
  @override
  String? get createdBy;
  @override
  Map<String, dynamic>? get metadata;
  @override
  @JsonKey(ignore: true)
  _$$DataSourceImplCopyWith<_$DataSourceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AnalyticsQuery _$AnalyticsQueryFromJson(Map<String, dynamic> json) {
  return _AnalyticsQuery.fromJson(json);
}

/// @nodoc
mixin _$AnalyticsQuery {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  QueryType get type => throw _privateConstructorUsedError;
  Map<String, dynamic> get queryConfig => throw _privateConstructorUsedError;
  List<String> get dataSources => throw _privateConstructorUsedError;
  List<QueryFilter> get filters => throw _privateConstructorUsedError;
  List<QueryGrouping> get groupings => throw _privateConstructorUsedError;
  List<QueryAggregation> get aggregations => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  String? get createdBy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnalyticsQueryCopyWith<AnalyticsQuery> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyticsQueryCopyWith<$Res> {
  factory $AnalyticsQueryCopyWith(
          AnalyticsQuery value, $Res Function(AnalyticsQuery) then) =
      _$AnalyticsQueryCopyWithImpl<$Res, AnalyticsQuery>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      QueryType type,
      Map<String, dynamic> queryConfig,
      List<String> dataSources,
      List<QueryFilter> filters,
      List<QueryGrouping> groupings,
      List<QueryAggregation> aggregations,
      DateTime? createdAt,
      String? createdBy});
}

/// @nodoc
class _$AnalyticsQueryCopyWithImpl<$Res, $Val extends AnalyticsQuery>
    implements $AnalyticsQueryCopyWith<$Res> {
  _$AnalyticsQueryCopyWithImpl(this._value, this._then);

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
    Object? queryConfig = null,
    Object? dataSources = null,
    Object? filters = null,
    Object? groupings = null,
    Object? aggregations = null,
    Object? createdAt = freezed,
    Object? createdBy = freezed,
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
              as QueryType,
      queryConfig: null == queryConfig
          ? _value.queryConfig
          : queryConfig // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      dataSources: null == dataSources
          ? _value.dataSources
          : dataSources // ignore: cast_nullable_to_non_nullable
              as List<String>,
      filters: null == filters
          ? _value.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as List<QueryFilter>,
      groupings: null == groupings
          ? _value.groupings
          : groupings // ignore: cast_nullable_to_non_nullable
              as List<QueryGrouping>,
      aggregations: null == aggregations
          ? _value.aggregations
          : aggregations // ignore: cast_nullable_to_non_nullable
              as List<QueryAggregation>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnalyticsQueryImplCopyWith<$Res>
    implements $AnalyticsQueryCopyWith<$Res> {
  factory _$$AnalyticsQueryImplCopyWith(_$AnalyticsQueryImpl value,
          $Res Function(_$AnalyticsQueryImpl) then) =
      __$$AnalyticsQueryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      QueryType type,
      Map<String, dynamic> queryConfig,
      List<String> dataSources,
      List<QueryFilter> filters,
      List<QueryGrouping> groupings,
      List<QueryAggregation> aggregations,
      DateTime? createdAt,
      String? createdBy});
}

/// @nodoc
class __$$AnalyticsQueryImplCopyWithImpl<$Res>
    extends _$AnalyticsQueryCopyWithImpl<$Res, _$AnalyticsQueryImpl>
    implements _$$AnalyticsQueryImplCopyWith<$Res> {
  __$$AnalyticsQueryImplCopyWithImpl(
      _$AnalyticsQueryImpl _value, $Res Function(_$AnalyticsQueryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? type = null,
    Object? queryConfig = null,
    Object? dataSources = null,
    Object? filters = null,
    Object? groupings = null,
    Object? aggregations = null,
    Object? createdAt = freezed,
    Object? createdBy = freezed,
  }) {
    return _then(_$AnalyticsQueryImpl(
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
              as QueryType,
      queryConfig: null == queryConfig
          ? _value._queryConfig
          : queryConfig // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      dataSources: null == dataSources
          ? _value._dataSources
          : dataSources // ignore: cast_nullable_to_non_nullable
              as List<String>,
      filters: null == filters
          ? _value._filters
          : filters // ignore: cast_nullable_to_non_nullable
              as List<QueryFilter>,
      groupings: null == groupings
          ? _value._groupings
          : groupings // ignore: cast_nullable_to_non_nullable
              as List<QueryGrouping>,
      aggregations: null == aggregations
          ? _value._aggregations
          : aggregations // ignore: cast_nullable_to_non_nullable
              as List<QueryAggregation>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnalyticsQueryImpl implements _AnalyticsQuery {
  const _$AnalyticsQueryImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.type,
      required final Map<String, dynamic> queryConfig,
      final List<String> dataSources = const [],
      final List<QueryFilter> filters = const [],
      final List<QueryGrouping> groupings = const [],
      final List<QueryAggregation> aggregations = const [],
      this.createdAt,
      this.createdBy})
      : _queryConfig = queryConfig,
        _dataSources = dataSources,
        _filters = filters,
        _groupings = groupings,
        _aggregations = aggregations;

  factory _$AnalyticsQueryImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnalyticsQueryImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final QueryType type;
  final Map<String, dynamic> _queryConfig;
  @override
  Map<String, dynamic> get queryConfig {
    if (_queryConfig is EqualUnmodifiableMapView) return _queryConfig;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_queryConfig);
  }

  final List<String> _dataSources;
  @override
  @JsonKey()
  List<String> get dataSources {
    if (_dataSources is EqualUnmodifiableListView) return _dataSources;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dataSources);
  }

  final List<QueryFilter> _filters;
  @override
  @JsonKey()
  List<QueryFilter> get filters {
    if (_filters is EqualUnmodifiableListView) return _filters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filters);
  }

  final List<QueryGrouping> _groupings;
  @override
  @JsonKey()
  List<QueryGrouping> get groupings {
    if (_groupings is EqualUnmodifiableListView) return _groupings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_groupings);
  }

  final List<QueryAggregation> _aggregations;
  @override
  @JsonKey()
  List<QueryAggregation> get aggregations {
    if (_aggregations is EqualUnmodifiableListView) return _aggregations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_aggregations);
  }

  @override
  final DateTime? createdAt;
  @override
  final String? createdBy;

  @override
  String toString() {
    return 'AnalyticsQuery(id: $id, name: $name, description: $description, type: $type, queryConfig: $queryConfig, dataSources: $dataSources, filters: $filters, groupings: $groupings, aggregations: $aggregations, createdAt: $createdAt, createdBy: $createdBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalyticsQueryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other._queryConfig, _queryConfig) &&
            const DeepCollectionEquality()
                .equals(other._dataSources, _dataSources) &&
            const DeepCollectionEquality().equals(other._filters, _filters) &&
            const DeepCollectionEquality()
                .equals(other._groupings, _groupings) &&
            const DeepCollectionEquality()
                .equals(other._aggregations, _aggregations) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      type,
      const DeepCollectionEquality().hash(_queryConfig),
      const DeepCollectionEquality().hash(_dataSources),
      const DeepCollectionEquality().hash(_filters),
      const DeepCollectionEquality().hash(_groupings),
      const DeepCollectionEquality().hash(_aggregations),
      createdAt,
      createdBy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalyticsQueryImplCopyWith<_$AnalyticsQueryImpl> get copyWith =>
      __$$AnalyticsQueryImplCopyWithImpl<_$AnalyticsQueryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnalyticsQueryImplToJson(
      this,
    );
  }
}

abstract class _AnalyticsQuery implements AnalyticsQuery {
  const factory _AnalyticsQuery(
      {required final String id,
      required final String name,
      required final String description,
      required final QueryType type,
      required final Map<String, dynamic> queryConfig,
      final List<String> dataSources,
      final List<QueryFilter> filters,
      final List<QueryGrouping> groupings,
      final List<QueryAggregation> aggregations,
      final DateTime? createdAt,
      final String? createdBy}) = _$AnalyticsQueryImpl;

  factory _AnalyticsQuery.fromJson(Map<String, dynamic> json) =
      _$AnalyticsQueryImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  QueryType get type;
  @override
  Map<String, dynamic> get queryConfig;
  @override
  List<String> get dataSources;
  @override
  List<QueryFilter> get filters;
  @override
  List<QueryGrouping> get groupings;
  @override
  List<QueryAggregation> get aggregations;
  @override
  DateTime? get createdAt;
  @override
  String? get createdBy;
  @override
  @JsonKey(ignore: true)
  _$$AnalyticsQueryImplCopyWith<_$AnalyticsQueryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QueryFilter _$QueryFilterFromJson(Map<String, dynamic> json) {
  return _QueryFilter.fromJson(json);
}

/// @nodoc
mixin _$QueryFilter {
  String get field => throw _privateConstructorUsedError;
  FilterOperator get operator => throw _privateConstructorUsedError;
  dynamic get value => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QueryFilterCopyWith<QueryFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QueryFilterCopyWith<$Res> {
  factory $QueryFilterCopyWith(
          QueryFilter value, $Res Function(QueryFilter) then) =
      _$QueryFilterCopyWithImpl<$Res, QueryFilter>;
  @useResult
  $Res call(
      {String field,
      FilterOperator operator,
      dynamic value,
      String? displayName});
}

/// @nodoc
class _$QueryFilterCopyWithImpl<$Res, $Val extends QueryFilter>
    implements $QueryFilterCopyWith<$Res> {
  _$QueryFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field = null,
    Object? operator = null,
    Object? value = freezed,
    Object? displayName = freezed,
  }) {
    return _then(_value.copyWith(
      field: null == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as String,
      operator: null == operator
          ? _value.operator
          : operator // ignore: cast_nullable_to_non_nullable
              as FilterOperator,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as dynamic,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QueryFilterImplCopyWith<$Res>
    implements $QueryFilterCopyWith<$Res> {
  factory _$$QueryFilterImplCopyWith(
          _$QueryFilterImpl value, $Res Function(_$QueryFilterImpl) then) =
      __$$QueryFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String field,
      FilterOperator operator,
      dynamic value,
      String? displayName});
}

/// @nodoc
class __$$QueryFilterImplCopyWithImpl<$Res>
    extends _$QueryFilterCopyWithImpl<$Res, _$QueryFilterImpl>
    implements _$$QueryFilterImplCopyWith<$Res> {
  __$$QueryFilterImplCopyWithImpl(
      _$QueryFilterImpl _value, $Res Function(_$QueryFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field = null,
    Object? operator = null,
    Object? value = freezed,
    Object? displayName = freezed,
  }) {
    return _then(_$QueryFilterImpl(
      field: null == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as String,
      operator: null == operator
          ? _value.operator
          : operator // ignore: cast_nullable_to_non_nullable
              as FilterOperator,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as dynamic,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QueryFilterImpl implements _QueryFilter {
  const _$QueryFilterImpl(
      {required this.field,
      required this.operator,
      required this.value,
      this.displayName});

  factory _$QueryFilterImpl.fromJson(Map<String, dynamic> json) =>
      _$$QueryFilterImplFromJson(json);

  @override
  final String field;
  @override
  final FilterOperator operator;
  @override
  final dynamic value;
  @override
  final String? displayName;

  @override
  String toString() {
    return 'QueryFilter(field: $field, operator: $operator, value: $value, displayName: $displayName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QueryFilterImpl &&
            (identical(other.field, field) || other.field == field) &&
            (identical(other.operator, operator) ||
                other.operator == operator) &&
            const DeepCollectionEquality().equals(other.value, value) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, field, operator,
      const DeepCollectionEquality().hash(value), displayName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QueryFilterImplCopyWith<_$QueryFilterImpl> get copyWith =>
      __$$QueryFilterImplCopyWithImpl<_$QueryFilterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QueryFilterImplToJson(
      this,
    );
  }
}

abstract class _QueryFilter implements QueryFilter {
  const factory _QueryFilter(
      {required final String field,
      required final FilterOperator operator,
      required final dynamic value,
      final String? displayName}) = _$QueryFilterImpl;

  factory _QueryFilter.fromJson(Map<String, dynamic> json) =
      _$QueryFilterImpl.fromJson;

  @override
  String get field;
  @override
  FilterOperator get operator;
  @override
  dynamic get value;
  @override
  String? get displayName;
  @override
  @JsonKey(ignore: true)
  _$$QueryFilterImplCopyWith<_$QueryFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QueryGrouping _$QueryGroupingFromJson(Map<String, dynamic> json) {
  return _QueryGrouping.fromJson(json);
}

/// @nodoc
mixin _$QueryGrouping {
  String get field => throw _privateConstructorUsedError;
  GroupingType get type => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QueryGroupingCopyWith<QueryGrouping> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QueryGroupingCopyWith<$Res> {
  factory $QueryGroupingCopyWith(
          QueryGrouping value, $Res Function(QueryGrouping) then) =
      _$QueryGroupingCopyWithImpl<$Res, QueryGrouping>;
  @useResult
  $Res call({String field, GroupingType type, String? displayName});
}

/// @nodoc
class _$QueryGroupingCopyWithImpl<$Res, $Val extends QueryGrouping>
    implements $QueryGroupingCopyWith<$Res> {
  _$QueryGroupingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field = null,
    Object? type = null,
    Object? displayName = freezed,
  }) {
    return _then(_value.copyWith(
      field: null == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as GroupingType,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QueryGroupingImplCopyWith<$Res>
    implements $QueryGroupingCopyWith<$Res> {
  factory _$$QueryGroupingImplCopyWith(
          _$QueryGroupingImpl value, $Res Function(_$QueryGroupingImpl) then) =
      __$$QueryGroupingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String field, GroupingType type, String? displayName});
}

/// @nodoc
class __$$QueryGroupingImplCopyWithImpl<$Res>
    extends _$QueryGroupingCopyWithImpl<$Res, _$QueryGroupingImpl>
    implements _$$QueryGroupingImplCopyWith<$Res> {
  __$$QueryGroupingImplCopyWithImpl(
      _$QueryGroupingImpl _value, $Res Function(_$QueryGroupingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field = null,
    Object? type = null,
    Object? displayName = freezed,
  }) {
    return _then(_$QueryGroupingImpl(
      field: null == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as GroupingType,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QueryGroupingImpl implements _QueryGrouping {
  const _$QueryGroupingImpl(
      {required this.field, required this.type, this.displayName});

  factory _$QueryGroupingImpl.fromJson(Map<String, dynamic> json) =>
      _$$QueryGroupingImplFromJson(json);

  @override
  final String field;
  @override
  final GroupingType type;
  @override
  final String? displayName;

  @override
  String toString() {
    return 'QueryGrouping(field: $field, type: $type, displayName: $displayName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QueryGroupingImpl &&
            (identical(other.field, field) || other.field == field) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, field, type, displayName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QueryGroupingImplCopyWith<_$QueryGroupingImpl> get copyWith =>
      __$$QueryGroupingImplCopyWithImpl<_$QueryGroupingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QueryGroupingImplToJson(
      this,
    );
  }
}

abstract class _QueryGrouping implements QueryGrouping {
  const factory _QueryGrouping(
      {required final String field,
      required final GroupingType type,
      final String? displayName}) = _$QueryGroupingImpl;

  factory _QueryGrouping.fromJson(Map<String, dynamic> json) =
      _$QueryGroupingImpl.fromJson;

  @override
  String get field;
  @override
  GroupingType get type;
  @override
  String? get displayName;
  @override
  @JsonKey(ignore: true)
  _$$QueryGroupingImplCopyWith<_$QueryGroupingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QueryAggregation _$QueryAggregationFromJson(Map<String, dynamic> json) {
  return _QueryAggregation.fromJson(json);
}

/// @nodoc
mixin _$QueryAggregation {
  String get field => throw _privateConstructorUsedError;
  AggregationType get type => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;
  String? get alias => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QueryAggregationCopyWith<QueryAggregation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QueryAggregationCopyWith<$Res> {
  factory $QueryAggregationCopyWith(
          QueryAggregation value, $Res Function(QueryAggregation) then) =
      _$QueryAggregationCopyWithImpl<$Res, QueryAggregation>;
  @useResult
  $Res call(
      {String field, AggregationType type, String? displayName, String? alias});
}

/// @nodoc
class _$QueryAggregationCopyWithImpl<$Res, $Val extends QueryAggregation>
    implements $QueryAggregationCopyWith<$Res> {
  _$QueryAggregationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field = null,
    Object? type = null,
    Object? displayName = freezed,
    Object? alias = freezed,
  }) {
    return _then(_value.copyWith(
      field: null == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AggregationType,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      alias: freezed == alias
          ? _value.alias
          : alias // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QueryAggregationImplCopyWith<$Res>
    implements $QueryAggregationCopyWith<$Res> {
  factory _$$QueryAggregationImplCopyWith(_$QueryAggregationImpl value,
          $Res Function(_$QueryAggregationImpl) then) =
      __$$QueryAggregationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String field, AggregationType type, String? displayName, String? alias});
}

/// @nodoc
class __$$QueryAggregationImplCopyWithImpl<$Res>
    extends _$QueryAggregationCopyWithImpl<$Res, _$QueryAggregationImpl>
    implements _$$QueryAggregationImplCopyWith<$Res> {
  __$$QueryAggregationImplCopyWithImpl(_$QueryAggregationImpl _value,
      $Res Function(_$QueryAggregationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field = null,
    Object? type = null,
    Object? displayName = freezed,
    Object? alias = freezed,
  }) {
    return _then(_$QueryAggregationImpl(
      field: null == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AggregationType,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      alias: freezed == alias
          ? _value.alias
          : alias // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QueryAggregationImpl implements _QueryAggregation {
  const _$QueryAggregationImpl(
      {required this.field, required this.type, this.displayName, this.alias});

  factory _$QueryAggregationImpl.fromJson(Map<String, dynamic> json) =>
      _$$QueryAggregationImplFromJson(json);

  @override
  final String field;
  @override
  final AggregationType type;
  @override
  final String? displayName;
  @override
  final String? alias;

  @override
  String toString() {
    return 'QueryAggregation(field: $field, type: $type, displayName: $displayName, alias: $alias)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QueryAggregationImpl &&
            (identical(other.field, field) || other.field == field) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.alias, alias) || other.alias == alias));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, field, type, displayName, alias);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QueryAggregationImplCopyWith<_$QueryAggregationImpl> get copyWith =>
      __$$QueryAggregationImplCopyWithImpl<_$QueryAggregationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QueryAggregationImplToJson(
      this,
    );
  }
}

abstract class _QueryAggregation implements QueryAggregation {
  const factory _QueryAggregation(
      {required final String field,
      required final AggregationType type,
      final String? displayName,
      final String? alias}) = _$QueryAggregationImpl;

  factory _QueryAggregation.fromJson(Map<String, dynamic> json) =
      _$QueryAggregationImpl.fromJson;

  @override
  String get field;
  @override
  AggregationType get type;
  @override
  String? get displayName;
  @override
  String? get alias;
  @override
  @JsonKey(ignore: true)
  _$$QueryAggregationImplCopyWith<_$QueryAggregationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
