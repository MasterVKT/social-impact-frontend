// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'impact_measurement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ImpactMeasurement _$ImpactMeasurementFromJson(Map<String, dynamic> json) {
  return _ImpactMeasurement.fromJson(json);
}

/// @nodoc
mixin _$ImpactMeasurement {
  String get id => throw _privateConstructorUsedError;
  String get projectId => throw _privateConstructorUsedError;
  String get organizationId => throw _privateConstructorUsedError;
  String get metricName => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  ImpactCategory get category => throw _privateConstructorUsedError;
  MeasurementUnit get unit => throw _privateConstructorUsedError;
  double get targetValue => throw _privateConstructorUsedError;
  double get currentValue => throw _privateConstructorUsedError;
  DateTime get measurementDate => throw _privateConstructorUsedError;
  MeasurementStatus get status => throw _privateConstructorUsedError;
  VerificationLevel get verificationLevel => throw _privateConstructorUsedError;
  List<String> get evidenceUrls => throw _privateConstructorUsedError;
  List<ImpactDataPoint> get dataPoints => throw _privateConstructorUsedError;
  String? get verifierName => throw _privateConstructorUsedError;
  String? get verificationNotes => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;
  DateTime? get lastVerified => throw _privateConstructorUsedError;
  DateTime? get nextReviewDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImpactMeasurementCopyWith<ImpactMeasurement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImpactMeasurementCopyWith<$Res> {
  factory $ImpactMeasurementCopyWith(
          ImpactMeasurement value, $Res Function(ImpactMeasurement) then) =
      _$ImpactMeasurementCopyWithImpl<$Res, ImpactMeasurement>;
  @useResult
  $Res call(
      {String id,
      String projectId,
      String organizationId,
      String metricName,
      String description,
      ImpactCategory category,
      MeasurementUnit unit,
      double targetValue,
      double currentValue,
      DateTime measurementDate,
      MeasurementStatus status,
      VerificationLevel verificationLevel,
      List<String> evidenceUrls,
      List<ImpactDataPoint> dataPoints,
      String? verifierName,
      String? verificationNotes,
      Map<String, dynamic>? metadata,
      DateTime? lastVerified,
      DateTime? nextReviewDate});
}

/// @nodoc
class _$ImpactMeasurementCopyWithImpl<$Res, $Val extends ImpactMeasurement>
    implements $ImpactMeasurementCopyWith<$Res> {
  _$ImpactMeasurementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? projectId = null,
    Object? organizationId = null,
    Object? metricName = null,
    Object? description = null,
    Object? category = null,
    Object? unit = null,
    Object? targetValue = null,
    Object? currentValue = null,
    Object? measurementDate = null,
    Object? status = null,
    Object? verificationLevel = null,
    Object? evidenceUrls = null,
    Object? dataPoints = null,
    Object? verifierName = freezed,
    Object? verificationNotes = freezed,
    Object? metadata = freezed,
    Object? lastVerified = freezed,
    Object? nextReviewDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      organizationId: null == organizationId
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as String,
      metricName: null == metricName
          ? _value.metricName
          : metricName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ImpactCategory,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as MeasurementUnit,
      targetValue: null == targetValue
          ? _value.targetValue
          : targetValue // ignore: cast_nullable_to_non_nullable
              as double,
      currentValue: null == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as double,
      measurementDate: null == measurementDate
          ? _value.measurementDate
          : measurementDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MeasurementStatus,
      verificationLevel: null == verificationLevel
          ? _value.verificationLevel
          : verificationLevel // ignore: cast_nullable_to_non_nullable
              as VerificationLevel,
      evidenceUrls: null == evidenceUrls
          ? _value.evidenceUrls
          : evidenceUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      dataPoints: null == dataPoints
          ? _value.dataPoints
          : dataPoints // ignore: cast_nullable_to_non_nullable
              as List<ImpactDataPoint>,
      verifierName: freezed == verifierName
          ? _value.verifierName
          : verifierName // ignore: cast_nullable_to_non_nullable
              as String?,
      verificationNotes: freezed == verificationNotes
          ? _value.verificationNotes
          : verificationNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      lastVerified: freezed == lastVerified
          ? _value.lastVerified
          : lastVerified // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      nextReviewDate: freezed == nextReviewDate
          ? _value.nextReviewDate
          : nextReviewDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImpactMeasurementImplCopyWith<$Res>
    implements $ImpactMeasurementCopyWith<$Res> {
  factory _$$ImpactMeasurementImplCopyWith(_$ImpactMeasurementImpl value,
          $Res Function(_$ImpactMeasurementImpl) then) =
      __$$ImpactMeasurementImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String projectId,
      String organizationId,
      String metricName,
      String description,
      ImpactCategory category,
      MeasurementUnit unit,
      double targetValue,
      double currentValue,
      DateTime measurementDate,
      MeasurementStatus status,
      VerificationLevel verificationLevel,
      List<String> evidenceUrls,
      List<ImpactDataPoint> dataPoints,
      String? verifierName,
      String? verificationNotes,
      Map<String, dynamic>? metadata,
      DateTime? lastVerified,
      DateTime? nextReviewDate});
}

/// @nodoc
class __$$ImpactMeasurementImplCopyWithImpl<$Res>
    extends _$ImpactMeasurementCopyWithImpl<$Res, _$ImpactMeasurementImpl>
    implements _$$ImpactMeasurementImplCopyWith<$Res> {
  __$$ImpactMeasurementImplCopyWithImpl(_$ImpactMeasurementImpl _value,
      $Res Function(_$ImpactMeasurementImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? projectId = null,
    Object? organizationId = null,
    Object? metricName = null,
    Object? description = null,
    Object? category = null,
    Object? unit = null,
    Object? targetValue = null,
    Object? currentValue = null,
    Object? measurementDate = null,
    Object? status = null,
    Object? verificationLevel = null,
    Object? evidenceUrls = null,
    Object? dataPoints = null,
    Object? verifierName = freezed,
    Object? verificationNotes = freezed,
    Object? metadata = freezed,
    Object? lastVerified = freezed,
    Object? nextReviewDate = freezed,
  }) {
    return _then(_$ImpactMeasurementImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      organizationId: null == organizationId
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as String,
      metricName: null == metricName
          ? _value.metricName
          : metricName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ImpactCategory,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as MeasurementUnit,
      targetValue: null == targetValue
          ? _value.targetValue
          : targetValue // ignore: cast_nullable_to_non_nullable
              as double,
      currentValue: null == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as double,
      measurementDate: null == measurementDate
          ? _value.measurementDate
          : measurementDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MeasurementStatus,
      verificationLevel: null == verificationLevel
          ? _value.verificationLevel
          : verificationLevel // ignore: cast_nullable_to_non_nullable
              as VerificationLevel,
      evidenceUrls: null == evidenceUrls
          ? _value._evidenceUrls
          : evidenceUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      dataPoints: null == dataPoints
          ? _value._dataPoints
          : dataPoints // ignore: cast_nullable_to_non_nullable
              as List<ImpactDataPoint>,
      verifierName: freezed == verifierName
          ? _value.verifierName
          : verifierName // ignore: cast_nullable_to_non_nullable
              as String?,
      verificationNotes: freezed == verificationNotes
          ? _value.verificationNotes
          : verificationNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      lastVerified: freezed == lastVerified
          ? _value.lastVerified
          : lastVerified // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      nextReviewDate: freezed == nextReviewDate
          ? _value.nextReviewDate
          : nextReviewDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImpactMeasurementImpl implements _ImpactMeasurement {
  const _$ImpactMeasurementImpl(
      {required this.id,
      required this.projectId,
      required this.organizationId,
      required this.metricName,
      required this.description,
      required this.category,
      required this.unit,
      required this.targetValue,
      required this.currentValue,
      required this.measurementDate,
      required this.status,
      required this.verificationLevel,
      final List<String> evidenceUrls = const [],
      final List<ImpactDataPoint> dataPoints = const [],
      this.verifierName,
      this.verificationNotes,
      final Map<String, dynamic>? metadata,
      this.lastVerified,
      this.nextReviewDate})
      : _evidenceUrls = evidenceUrls,
        _dataPoints = dataPoints,
        _metadata = metadata;

  factory _$ImpactMeasurementImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImpactMeasurementImplFromJson(json);

  @override
  final String id;
  @override
  final String projectId;
  @override
  final String organizationId;
  @override
  final String metricName;
  @override
  final String description;
  @override
  final ImpactCategory category;
  @override
  final MeasurementUnit unit;
  @override
  final double targetValue;
  @override
  final double currentValue;
  @override
  final DateTime measurementDate;
  @override
  final MeasurementStatus status;
  @override
  final VerificationLevel verificationLevel;
  final List<String> _evidenceUrls;
  @override
  @JsonKey()
  List<String> get evidenceUrls {
    if (_evidenceUrls is EqualUnmodifiableListView) return _evidenceUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_evidenceUrls);
  }

  final List<ImpactDataPoint> _dataPoints;
  @override
  @JsonKey()
  List<ImpactDataPoint> get dataPoints {
    if (_dataPoints is EqualUnmodifiableListView) return _dataPoints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dataPoints);
  }

  @override
  final String? verifierName;
  @override
  final String? verificationNotes;
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
  final DateTime? lastVerified;
  @override
  final DateTime? nextReviewDate;

  @override
  String toString() {
    return 'ImpactMeasurement(id: $id, projectId: $projectId, organizationId: $organizationId, metricName: $metricName, description: $description, category: $category, unit: $unit, targetValue: $targetValue, currentValue: $currentValue, measurementDate: $measurementDate, status: $status, verificationLevel: $verificationLevel, evidenceUrls: $evidenceUrls, dataPoints: $dataPoints, verifierName: $verifierName, verificationNotes: $verificationNotes, metadata: $metadata, lastVerified: $lastVerified, nextReviewDate: $nextReviewDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImpactMeasurementImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.metricName, metricName) ||
                other.metricName == metricName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.targetValue, targetValue) ||
                other.targetValue == targetValue) &&
            (identical(other.currentValue, currentValue) ||
                other.currentValue == currentValue) &&
            (identical(other.measurementDate, measurementDate) ||
                other.measurementDate == measurementDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.verificationLevel, verificationLevel) ||
                other.verificationLevel == verificationLevel) &&
            const DeepCollectionEquality()
                .equals(other._evidenceUrls, _evidenceUrls) &&
            const DeepCollectionEquality()
                .equals(other._dataPoints, _dataPoints) &&
            (identical(other.verifierName, verifierName) ||
                other.verifierName == verifierName) &&
            (identical(other.verificationNotes, verificationNotes) ||
                other.verificationNotes == verificationNotes) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.lastVerified, lastVerified) ||
                other.lastVerified == lastVerified) &&
            (identical(other.nextReviewDate, nextReviewDate) ||
                other.nextReviewDate == nextReviewDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        projectId,
        organizationId,
        metricName,
        description,
        category,
        unit,
        targetValue,
        currentValue,
        measurementDate,
        status,
        verificationLevel,
        const DeepCollectionEquality().hash(_evidenceUrls),
        const DeepCollectionEquality().hash(_dataPoints),
        verifierName,
        verificationNotes,
        const DeepCollectionEquality().hash(_metadata),
        lastVerified,
        nextReviewDate
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImpactMeasurementImplCopyWith<_$ImpactMeasurementImpl> get copyWith =>
      __$$ImpactMeasurementImplCopyWithImpl<_$ImpactMeasurementImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImpactMeasurementImplToJson(
      this,
    );
  }
}

abstract class _ImpactMeasurement implements ImpactMeasurement {
  const factory _ImpactMeasurement(
      {required final String id,
      required final String projectId,
      required final String organizationId,
      required final String metricName,
      required final String description,
      required final ImpactCategory category,
      required final MeasurementUnit unit,
      required final double targetValue,
      required final double currentValue,
      required final DateTime measurementDate,
      required final MeasurementStatus status,
      required final VerificationLevel verificationLevel,
      final List<String> evidenceUrls,
      final List<ImpactDataPoint> dataPoints,
      final String? verifierName,
      final String? verificationNotes,
      final Map<String, dynamic>? metadata,
      final DateTime? lastVerified,
      final DateTime? nextReviewDate}) = _$ImpactMeasurementImpl;

  factory _ImpactMeasurement.fromJson(Map<String, dynamic> json) =
      _$ImpactMeasurementImpl.fromJson;

  @override
  String get id;
  @override
  String get projectId;
  @override
  String get organizationId;
  @override
  String get metricName;
  @override
  String get description;
  @override
  ImpactCategory get category;
  @override
  MeasurementUnit get unit;
  @override
  double get targetValue;
  @override
  double get currentValue;
  @override
  DateTime get measurementDate;
  @override
  MeasurementStatus get status;
  @override
  VerificationLevel get verificationLevel;
  @override
  List<String> get evidenceUrls;
  @override
  List<ImpactDataPoint> get dataPoints;
  @override
  String? get verifierName;
  @override
  String? get verificationNotes;
  @override
  Map<String, dynamic>? get metadata;
  @override
  DateTime? get lastVerified;
  @override
  DateTime? get nextReviewDate;
  @override
  @JsonKey(ignore: true)
  _$$ImpactMeasurementImplCopyWith<_$ImpactMeasurementImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ImpactDataPoint _$ImpactDataPointFromJson(Map<String, dynamic> json) {
  return _ImpactDataPoint.fromJson(json);
}

/// @nodoc
mixin _$ImpactDataPoint {
  String get id => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;
  String get source => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImpactDataPointCopyWith<ImpactDataPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImpactDataPointCopyWith<$Res> {
  factory $ImpactDataPointCopyWith(
          ImpactDataPoint value, $Res Function(ImpactDataPoint) then) =
      _$ImpactDataPointCopyWithImpl<$Res, ImpactDataPoint>;
  @useResult
  $Res call(
      {String id,
      DateTime timestamp,
      double value,
      String source,
      String? notes,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class _$ImpactDataPointCopyWithImpl<$Res, $Val extends ImpactDataPoint>
    implements $ImpactDataPointCopyWith<$Res> {
  _$ImpactDataPointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? timestamp = null,
    Object? value = null,
    Object? source = null,
    Object? notes = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImpactDataPointImplCopyWith<$Res>
    implements $ImpactDataPointCopyWith<$Res> {
  factory _$$ImpactDataPointImplCopyWith(_$ImpactDataPointImpl value,
          $Res Function(_$ImpactDataPointImpl) then) =
      __$$ImpactDataPointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime timestamp,
      double value,
      String source,
      String? notes,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class __$$ImpactDataPointImplCopyWithImpl<$Res>
    extends _$ImpactDataPointCopyWithImpl<$Res, _$ImpactDataPointImpl>
    implements _$$ImpactDataPointImplCopyWith<$Res> {
  __$$ImpactDataPointImplCopyWithImpl(
      _$ImpactDataPointImpl _value, $Res Function(_$ImpactDataPointImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? timestamp = null,
    Object? value = null,
    Object? source = null,
    Object? notes = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_$ImpactDataPointImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
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
class _$ImpactDataPointImpl implements _ImpactDataPoint {
  const _$ImpactDataPointImpl(
      {required this.id,
      required this.timestamp,
      required this.value,
      required this.source,
      this.notes,
      final Map<String, dynamic>? metadata})
      : _metadata = metadata;

  factory _$ImpactDataPointImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImpactDataPointImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime timestamp;
  @override
  final double value;
  @override
  final String source;
  @override
  final String? notes;
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
    return 'ImpactDataPoint(id: $id, timestamp: $timestamp, value: $value, source: $source, notes: $notes, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImpactDataPointImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, timestamp, value, source,
      notes, const DeepCollectionEquality().hash(_metadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImpactDataPointImplCopyWith<_$ImpactDataPointImpl> get copyWith =>
      __$$ImpactDataPointImplCopyWithImpl<_$ImpactDataPointImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImpactDataPointImplToJson(
      this,
    );
  }
}

abstract class _ImpactDataPoint implements ImpactDataPoint {
  const factory _ImpactDataPoint(
      {required final String id,
      required final DateTime timestamp,
      required final double value,
      required final String source,
      final String? notes,
      final Map<String, dynamic>? metadata}) = _$ImpactDataPointImpl;

  factory _ImpactDataPoint.fromJson(Map<String, dynamic> json) =
      _$ImpactDataPointImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get timestamp;
  @override
  double get value;
  @override
  String get source;
  @override
  String? get notes;
  @override
  Map<String, dynamic>? get metadata;
  @override
  @JsonKey(ignore: true)
  _$$ImpactDataPointImplCopyWith<_$ImpactDataPointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ImpactReport _$ImpactReportFromJson(Map<String, dynamic> json) {
  return _ImpactReport.fromJson(json);
}

/// @nodoc
mixin _$ImpactReport {
  String get id => throw _privateConstructorUsedError;
  String get projectId => throw _privateConstructorUsedError;
  String get organizationId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  ReportType get type => throw _privateConstructorUsedError;
  ReportPeriod get period => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;
  DateTime get generatedAt => throw _privateConstructorUsedError;
  ReportStatus get status => throw _privateConstructorUsedError;
  List<String> get measurementIds => throw _privateConstructorUsedError;
  List<ImpactSummary> get summaries => throw _privateConstructorUsedError;
  List<String> get attachmentUrls => throw _privateConstructorUsedError;
  String? get generatedBy => throw _privateConstructorUsedError;
  String? get reviewedBy => throw _privateConstructorUsedError;
  DateTime? get reviewedAt => throw _privateConstructorUsedError;
  String? get publicUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImpactReportCopyWith<ImpactReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImpactReportCopyWith<$Res> {
  factory $ImpactReportCopyWith(
          ImpactReport value, $Res Function(ImpactReport) then) =
      _$ImpactReportCopyWithImpl<$Res, ImpactReport>;
  @useResult
  $Res call(
      {String id,
      String projectId,
      String organizationId,
      String title,
      String description,
      ReportType type,
      ReportPeriod period,
      DateTime startDate,
      DateTime endDate,
      DateTime generatedAt,
      ReportStatus status,
      List<String> measurementIds,
      List<ImpactSummary> summaries,
      List<String> attachmentUrls,
      String? generatedBy,
      String? reviewedBy,
      DateTime? reviewedAt,
      String? publicUrl});
}

/// @nodoc
class _$ImpactReportCopyWithImpl<$Res, $Val extends ImpactReport>
    implements $ImpactReportCopyWith<$Res> {
  _$ImpactReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? projectId = null,
    Object? organizationId = null,
    Object? title = null,
    Object? description = null,
    Object? type = null,
    Object? period = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? generatedAt = null,
    Object? status = null,
    Object? measurementIds = null,
    Object? summaries = null,
    Object? attachmentUrls = null,
    Object? generatedBy = freezed,
    Object? reviewedBy = freezed,
    Object? reviewedAt = freezed,
    Object? publicUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      organizationId: null == organizationId
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
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
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as ReportPeriod,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      generatedAt: null == generatedAt
          ? _value.generatedAt
          : generatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ReportStatus,
      measurementIds: null == measurementIds
          ? _value.measurementIds
          : measurementIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      summaries: null == summaries
          ? _value.summaries
          : summaries // ignore: cast_nullable_to_non_nullable
              as List<ImpactSummary>,
      attachmentUrls: null == attachmentUrls
          ? _value.attachmentUrls
          : attachmentUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      generatedBy: freezed == generatedBy
          ? _value.generatedBy
          : generatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      reviewedBy: freezed == reviewedBy
          ? _value.reviewedBy
          : reviewedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      reviewedAt: freezed == reviewedAt
          ? _value.reviewedAt
          : reviewedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      publicUrl: freezed == publicUrl
          ? _value.publicUrl
          : publicUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImpactReportImplCopyWith<$Res>
    implements $ImpactReportCopyWith<$Res> {
  factory _$$ImpactReportImplCopyWith(
          _$ImpactReportImpl value, $Res Function(_$ImpactReportImpl) then) =
      __$$ImpactReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String projectId,
      String organizationId,
      String title,
      String description,
      ReportType type,
      ReportPeriod period,
      DateTime startDate,
      DateTime endDate,
      DateTime generatedAt,
      ReportStatus status,
      List<String> measurementIds,
      List<ImpactSummary> summaries,
      List<String> attachmentUrls,
      String? generatedBy,
      String? reviewedBy,
      DateTime? reviewedAt,
      String? publicUrl});
}

/// @nodoc
class __$$ImpactReportImplCopyWithImpl<$Res>
    extends _$ImpactReportCopyWithImpl<$Res, _$ImpactReportImpl>
    implements _$$ImpactReportImplCopyWith<$Res> {
  __$$ImpactReportImplCopyWithImpl(
      _$ImpactReportImpl _value, $Res Function(_$ImpactReportImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? projectId = null,
    Object? organizationId = null,
    Object? title = null,
    Object? description = null,
    Object? type = null,
    Object? period = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? generatedAt = null,
    Object? status = null,
    Object? measurementIds = null,
    Object? summaries = null,
    Object? attachmentUrls = null,
    Object? generatedBy = freezed,
    Object? reviewedBy = freezed,
    Object? reviewedAt = freezed,
    Object? publicUrl = freezed,
  }) {
    return _then(_$ImpactReportImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      organizationId: null == organizationId
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
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
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as ReportPeriod,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      generatedAt: null == generatedAt
          ? _value.generatedAt
          : generatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ReportStatus,
      measurementIds: null == measurementIds
          ? _value._measurementIds
          : measurementIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      summaries: null == summaries
          ? _value._summaries
          : summaries // ignore: cast_nullable_to_non_nullable
              as List<ImpactSummary>,
      attachmentUrls: null == attachmentUrls
          ? _value._attachmentUrls
          : attachmentUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      generatedBy: freezed == generatedBy
          ? _value.generatedBy
          : generatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      reviewedBy: freezed == reviewedBy
          ? _value.reviewedBy
          : reviewedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      reviewedAt: freezed == reviewedAt
          ? _value.reviewedAt
          : reviewedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      publicUrl: freezed == publicUrl
          ? _value.publicUrl
          : publicUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImpactReportImpl implements _ImpactReport {
  const _$ImpactReportImpl(
      {required this.id,
      required this.projectId,
      required this.organizationId,
      required this.title,
      required this.description,
      required this.type,
      required this.period,
      required this.startDate,
      required this.endDate,
      required this.generatedAt,
      required this.status,
      final List<String> measurementIds = const [],
      final List<ImpactSummary> summaries = const [],
      final List<String> attachmentUrls = const [],
      this.generatedBy,
      this.reviewedBy,
      this.reviewedAt,
      this.publicUrl})
      : _measurementIds = measurementIds,
        _summaries = summaries,
        _attachmentUrls = attachmentUrls;

  factory _$ImpactReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImpactReportImplFromJson(json);

  @override
  final String id;
  @override
  final String projectId;
  @override
  final String organizationId;
  @override
  final String title;
  @override
  final String description;
  @override
  final ReportType type;
  @override
  final ReportPeriod period;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  @override
  final DateTime generatedAt;
  @override
  final ReportStatus status;
  final List<String> _measurementIds;
  @override
  @JsonKey()
  List<String> get measurementIds {
    if (_measurementIds is EqualUnmodifiableListView) return _measurementIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_measurementIds);
  }

  final List<ImpactSummary> _summaries;
  @override
  @JsonKey()
  List<ImpactSummary> get summaries {
    if (_summaries is EqualUnmodifiableListView) return _summaries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_summaries);
  }

  final List<String> _attachmentUrls;
  @override
  @JsonKey()
  List<String> get attachmentUrls {
    if (_attachmentUrls is EqualUnmodifiableListView) return _attachmentUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attachmentUrls);
  }

  @override
  final String? generatedBy;
  @override
  final String? reviewedBy;
  @override
  final DateTime? reviewedAt;
  @override
  final String? publicUrl;

  @override
  String toString() {
    return 'ImpactReport(id: $id, projectId: $projectId, organizationId: $organizationId, title: $title, description: $description, type: $type, period: $period, startDate: $startDate, endDate: $endDate, generatedAt: $generatedAt, status: $status, measurementIds: $measurementIds, summaries: $summaries, attachmentUrls: $attachmentUrls, generatedBy: $generatedBy, reviewedBy: $reviewedBy, reviewedAt: $reviewedAt, publicUrl: $publicUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImpactReportImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.generatedAt, generatedAt) ||
                other.generatedAt == generatedAt) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._measurementIds, _measurementIds) &&
            const DeepCollectionEquality()
                .equals(other._summaries, _summaries) &&
            const DeepCollectionEquality()
                .equals(other._attachmentUrls, _attachmentUrls) &&
            (identical(other.generatedBy, generatedBy) ||
                other.generatedBy == generatedBy) &&
            (identical(other.reviewedBy, reviewedBy) ||
                other.reviewedBy == reviewedBy) &&
            (identical(other.reviewedAt, reviewedAt) ||
                other.reviewedAt == reviewedAt) &&
            (identical(other.publicUrl, publicUrl) ||
                other.publicUrl == publicUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      projectId,
      organizationId,
      title,
      description,
      type,
      period,
      startDate,
      endDate,
      generatedAt,
      status,
      const DeepCollectionEquality().hash(_measurementIds),
      const DeepCollectionEquality().hash(_summaries),
      const DeepCollectionEquality().hash(_attachmentUrls),
      generatedBy,
      reviewedBy,
      reviewedAt,
      publicUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImpactReportImplCopyWith<_$ImpactReportImpl> get copyWith =>
      __$$ImpactReportImplCopyWithImpl<_$ImpactReportImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImpactReportImplToJson(
      this,
    );
  }
}

abstract class _ImpactReport implements ImpactReport {
  const factory _ImpactReport(
      {required final String id,
      required final String projectId,
      required final String organizationId,
      required final String title,
      required final String description,
      required final ReportType type,
      required final ReportPeriod period,
      required final DateTime startDate,
      required final DateTime endDate,
      required final DateTime generatedAt,
      required final ReportStatus status,
      final List<String> measurementIds,
      final List<ImpactSummary> summaries,
      final List<String> attachmentUrls,
      final String? generatedBy,
      final String? reviewedBy,
      final DateTime? reviewedAt,
      final String? publicUrl}) = _$ImpactReportImpl;

  factory _ImpactReport.fromJson(Map<String, dynamic> json) =
      _$ImpactReportImpl.fromJson;

  @override
  String get id;
  @override
  String get projectId;
  @override
  String get organizationId;
  @override
  String get title;
  @override
  String get description;
  @override
  ReportType get type;
  @override
  ReportPeriod get period;
  @override
  DateTime get startDate;
  @override
  DateTime get endDate;
  @override
  DateTime get generatedAt;
  @override
  ReportStatus get status;
  @override
  List<String> get measurementIds;
  @override
  List<ImpactSummary> get summaries;
  @override
  List<String> get attachmentUrls;
  @override
  String? get generatedBy;
  @override
  String? get reviewedBy;
  @override
  DateTime? get reviewedAt;
  @override
  String? get publicUrl;
  @override
  @JsonKey(ignore: true)
  _$$ImpactReportImplCopyWith<_$ImpactReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ImpactSummary _$ImpactSummaryFromJson(Map<String, dynamic> json) {
  return _ImpactSummary.fromJson(json);
}

/// @nodoc
mixin _$ImpactSummary {
  ImpactCategory get category => throw _privateConstructorUsedError;
  String get metricName => throw _privateConstructorUsedError;
  double get targetValue => throw _privateConstructorUsedError;
  double get achievedValue => throw _privateConstructorUsedError;
  double get progressPercentage => throw _privateConstructorUsedError;
  int get beneficiariesCount => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  double? get investmentAmount => throw _privateConstructorUsedError;
  double? get costPerBeneficiary => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImpactSummaryCopyWith<ImpactSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImpactSummaryCopyWith<$Res> {
  factory $ImpactSummaryCopyWith(
          ImpactSummary value, $Res Function(ImpactSummary) then) =
      _$ImpactSummaryCopyWithImpl<$Res, ImpactSummary>;
  @useResult
  $Res call(
      {ImpactCategory category,
      String metricName,
      double targetValue,
      double achievedValue,
      double progressPercentage,
      int beneficiariesCount,
      String currency,
      double? investmentAmount,
      double? costPerBeneficiary});
}

/// @nodoc
class _$ImpactSummaryCopyWithImpl<$Res, $Val extends ImpactSummary>
    implements $ImpactSummaryCopyWith<$Res> {
  _$ImpactSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? metricName = null,
    Object? targetValue = null,
    Object? achievedValue = null,
    Object? progressPercentage = null,
    Object? beneficiariesCount = null,
    Object? currency = null,
    Object? investmentAmount = freezed,
    Object? costPerBeneficiary = freezed,
  }) {
    return _then(_value.copyWith(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ImpactCategory,
      metricName: null == metricName
          ? _value.metricName
          : metricName // ignore: cast_nullable_to_non_nullable
              as String,
      targetValue: null == targetValue
          ? _value.targetValue
          : targetValue // ignore: cast_nullable_to_non_nullable
              as double,
      achievedValue: null == achievedValue
          ? _value.achievedValue
          : achievedValue // ignore: cast_nullable_to_non_nullable
              as double,
      progressPercentage: null == progressPercentage
          ? _value.progressPercentage
          : progressPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      beneficiariesCount: null == beneficiariesCount
          ? _value.beneficiariesCount
          : beneficiariesCount // ignore: cast_nullable_to_non_nullable
              as int,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      investmentAmount: freezed == investmentAmount
          ? _value.investmentAmount
          : investmentAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      costPerBeneficiary: freezed == costPerBeneficiary
          ? _value.costPerBeneficiary
          : costPerBeneficiary // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImpactSummaryImplCopyWith<$Res>
    implements $ImpactSummaryCopyWith<$Res> {
  factory _$$ImpactSummaryImplCopyWith(
          _$ImpactSummaryImpl value, $Res Function(_$ImpactSummaryImpl) then) =
      __$$ImpactSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ImpactCategory category,
      String metricName,
      double targetValue,
      double achievedValue,
      double progressPercentage,
      int beneficiariesCount,
      String currency,
      double? investmentAmount,
      double? costPerBeneficiary});
}

/// @nodoc
class __$$ImpactSummaryImplCopyWithImpl<$Res>
    extends _$ImpactSummaryCopyWithImpl<$Res, _$ImpactSummaryImpl>
    implements _$$ImpactSummaryImplCopyWith<$Res> {
  __$$ImpactSummaryImplCopyWithImpl(
      _$ImpactSummaryImpl _value, $Res Function(_$ImpactSummaryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? metricName = null,
    Object? targetValue = null,
    Object? achievedValue = null,
    Object? progressPercentage = null,
    Object? beneficiariesCount = null,
    Object? currency = null,
    Object? investmentAmount = freezed,
    Object? costPerBeneficiary = freezed,
  }) {
    return _then(_$ImpactSummaryImpl(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ImpactCategory,
      metricName: null == metricName
          ? _value.metricName
          : metricName // ignore: cast_nullable_to_non_nullable
              as String,
      targetValue: null == targetValue
          ? _value.targetValue
          : targetValue // ignore: cast_nullable_to_non_nullable
              as double,
      achievedValue: null == achievedValue
          ? _value.achievedValue
          : achievedValue // ignore: cast_nullable_to_non_nullable
              as double,
      progressPercentage: null == progressPercentage
          ? _value.progressPercentage
          : progressPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      beneficiariesCount: null == beneficiariesCount
          ? _value.beneficiariesCount
          : beneficiariesCount // ignore: cast_nullable_to_non_nullable
              as int,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      investmentAmount: freezed == investmentAmount
          ? _value.investmentAmount
          : investmentAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      costPerBeneficiary: freezed == costPerBeneficiary
          ? _value.costPerBeneficiary
          : costPerBeneficiary // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImpactSummaryImpl implements _ImpactSummary {
  const _$ImpactSummaryImpl(
      {required this.category,
      required this.metricName,
      required this.targetValue,
      required this.achievedValue,
      required this.progressPercentage,
      required this.beneficiariesCount,
      required this.currency,
      this.investmentAmount,
      this.costPerBeneficiary});

  factory _$ImpactSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImpactSummaryImplFromJson(json);

  @override
  final ImpactCategory category;
  @override
  final String metricName;
  @override
  final double targetValue;
  @override
  final double achievedValue;
  @override
  final double progressPercentage;
  @override
  final int beneficiariesCount;
  @override
  final String currency;
  @override
  final double? investmentAmount;
  @override
  final double? costPerBeneficiary;

  @override
  String toString() {
    return 'ImpactSummary(category: $category, metricName: $metricName, targetValue: $targetValue, achievedValue: $achievedValue, progressPercentage: $progressPercentage, beneficiariesCount: $beneficiariesCount, currency: $currency, investmentAmount: $investmentAmount, costPerBeneficiary: $costPerBeneficiary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImpactSummaryImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.metricName, metricName) ||
                other.metricName == metricName) &&
            (identical(other.targetValue, targetValue) ||
                other.targetValue == targetValue) &&
            (identical(other.achievedValue, achievedValue) ||
                other.achievedValue == achievedValue) &&
            (identical(other.progressPercentage, progressPercentage) ||
                other.progressPercentage == progressPercentage) &&
            (identical(other.beneficiariesCount, beneficiariesCount) ||
                other.beneficiariesCount == beneficiariesCount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.investmentAmount, investmentAmount) ||
                other.investmentAmount == investmentAmount) &&
            (identical(other.costPerBeneficiary, costPerBeneficiary) ||
                other.costPerBeneficiary == costPerBeneficiary));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      category,
      metricName,
      targetValue,
      achievedValue,
      progressPercentage,
      beneficiariesCount,
      currency,
      investmentAmount,
      costPerBeneficiary);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImpactSummaryImplCopyWith<_$ImpactSummaryImpl> get copyWith =>
      __$$ImpactSummaryImplCopyWithImpl<_$ImpactSummaryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImpactSummaryImplToJson(
      this,
    );
  }
}

abstract class _ImpactSummary implements ImpactSummary {
  const factory _ImpactSummary(
      {required final ImpactCategory category,
      required final String metricName,
      required final double targetValue,
      required final double achievedValue,
      required final double progressPercentage,
      required final int beneficiariesCount,
      required final String currency,
      final double? investmentAmount,
      final double? costPerBeneficiary}) = _$ImpactSummaryImpl;

  factory _ImpactSummary.fromJson(Map<String, dynamic> json) =
      _$ImpactSummaryImpl.fromJson;

  @override
  ImpactCategory get category;
  @override
  String get metricName;
  @override
  double get targetValue;
  @override
  double get achievedValue;
  @override
  double get progressPercentage;
  @override
  int get beneficiariesCount;
  @override
  String get currency;
  @override
  double? get investmentAmount;
  @override
  double? get costPerBeneficiary;
  @override
  @JsonKey(ignore: true)
  _$$ImpactSummaryImplCopyWith<_$ImpactSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ImpactAssessmentTemplate _$ImpactAssessmentTemplateFromJson(
    Map<String, dynamic> json) {
  return _ImpactAssessmentTemplate.fromJson(json);
}

/// @nodoc
mixin _$ImpactAssessmentTemplate {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  ImpactCategory get category => throw _privateConstructorUsedError;
  TemplateType get type => throw _privateConstructorUsedError;
  List<MetricTemplate> get metricTemplates =>
      throw _privateConstructorUsedError;
  List<String> get requiredDocuments => throw _privateConstructorUsedError;
  Map<String, dynamic>? get configuration => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImpactAssessmentTemplateCopyWith<ImpactAssessmentTemplate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImpactAssessmentTemplateCopyWith<$Res> {
  factory $ImpactAssessmentTemplateCopyWith(ImpactAssessmentTemplate value,
          $Res Function(ImpactAssessmentTemplate) then) =
      _$ImpactAssessmentTemplateCopyWithImpl<$Res, ImpactAssessmentTemplate>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      ImpactCategory category,
      TemplateType type,
      List<MetricTemplate> metricTemplates,
      List<String> requiredDocuments,
      Map<String, dynamic>? configuration,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$ImpactAssessmentTemplateCopyWithImpl<$Res,
        $Val extends ImpactAssessmentTemplate>
    implements $ImpactAssessmentTemplateCopyWith<$Res> {
  _$ImpactAssessmentTemplateCopyWithImpl(this._value, this._then);

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
    Object? type = null,
    Object? metricTemplates = null,
    Object? requiredDocuments = null,
    Object? configuration = freezed,
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
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ImpactCategory,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TemplateType,
      metricTemplates: null == metricTemplates
          ? _value.metricTemplates
          : metricTemplates // ignore: cast_nullable_to_non_nullable
              as List<MetricTemplate>,
      requiredDocuments: null == requiredDocuments
          ? _value.requiredDocuments
          : requiredDocuments // ignore: cast_nullable_to_non_nullable
              as List<String>,
      configuration: freezed == configuration
          ? _value.configuration
          : configuration // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
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
abstract class _$$ImpactAssessmentTemplateImplCopyWith<$Res>
    implements $ImpactAssessmentTemplateCopyWith<$Res> {
  factory _$$ImpactAssessmentTemplateImplCopyWith(
          _$ImpactAssessmentTemplateImpl value,
          $Res Function(_$ImpactAssessmentTemplateImpl) then) =
      __$$ImpactAssessmentTemplateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      ImpactCategory category,
      TemplateType type,
      List<MetricTemplate> metricTemplates,
      List<String> requiredDocuments,
      Map<String, dynamic>? configuration,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$ImpactAssessmentTemplateImplCopyWithImpl<$Res>
    extends _$ImpactAssessmentTemplateCopyWithImpl<$Res,
        _$ImpactAssessmentTemplateImpl>
    implements _$$ImpactAssessmentTemplateImplCopyWith<$Res> {
  __$$ImpactAssessmentTemplateImplCopyWithImpl(
      _$ImpactAssessmentTemplateImpl _value,
      $Res Function(_$ImpactAssessmentTemplateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? category = null,
    Object? type = null,
    Object? metricTemplates = null,
    Object? requiredDocuments = null,
    Object? configuration = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$ImpactAssessmentTemplateImpl(
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
              as ImpactCategory,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TemplateType,
      metricTemplates: null == metricTemplates
          ? _value._metricTemplates
          : metricTemplates // ignore: cast_nullable_to_non_nullable
              as List<MetricTemplate>,
      requiredDocuments: null == requiredDocuments
          ? _value._requiredDocuments
          : requiredDocuments // ignore: cast_nullable_to_non_nullable
              as List<String>,
      configuration: freezed == configuration
          ? _value._configuration
          : configuration // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
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
class _$ImpactAssessmentTemplateImpl implements _ImpactAssessmentTemplate {
  const _$ImpactAssessmentTemplateImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.category,
      required this.type,
      final List<MetricTemplate> metricTemplates = const [],
      final List<String> requiredDocuments = const [],
      final Map<String, dynamic>? configuration,
      this.createdAt,
      this.updatedAt})
      : _metricTemplates = metricTemplates,
        _requiredDocuments = requiredDocuments,
        _configuration = configuration;

  factory _$ImpactAssessmentTemplateImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImpactAssessmentTemplateImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final ImpactCategory category;
  @override
  final TemplateType type;
  final List<MetricTemplate> _metricTemplates;
  @override
  @JsonKey()
  List<MetricTemplate> get metricTemplates {
    if (_metricTemplates is EqualUnmodifiableListView) return _metricTemplates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_metricTemplates);
  }

  final List<String> _requiredDocuments;
  @override
  @JsonKey()
  List<String> get requiredDocuments {
    if (_requiredDocuments is EqualUnmodifiableListView)
      return _requiredDocuments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_requiredDocuments);
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
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'ImpactAssessmentTemplate(id: $id, name: $name, description: $description, category: $category, type: $type, metricTemplates: $metricTemplates, requiredDocuments: $requiredDocuments, configuration: $configuration, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImpactAssessmentTemplateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other._metricTemplates, _metricTemplates) &&
            const DeepCollectionEquality()
                .equals(other._requiredDocuments, _requiredDocuments) &&
            const DeepCollectionEquality()
                .equals(other._configuration, _configuration) &&
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
      description,
      category,
      type,
      const DeepCollectionEquality().hash(_metricTemplates),
      const DeepCollectionEquality().hash(_requiredDocuments),
      const DeepCollectionEquality().hash(_configuration),
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImpactAssessmentTemplateImplCopyWith<_$ImpactAssessmentTemplateImpl>
      get copyWith => __$$ImpactAssessmentTemplateImplCopyWithImpl<
          _$ImpactAssessmentTemplateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImpactAssessmentTemplateImplToJson(
      this,
    );
  }
}

abstract class _ImpactAssessmentTemplate implements ImpactAssessmentTemplate {
  const factory _ImpactAssessmentTemplate(
      {required final String id,
      required final String name,
      required final String description,
      required final ImpactCategory category,
      required final TemplateType type,
      final List<MetricTemplate> metricTemplates,
      final List<String> requiredDocuments,
      final Map<String, dynamic>? configuration,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$ImpactAssessmentTemplateImpl;

  factory _ImpactAssessmentTemplate.fromJson(Map<String, dynamic> json) =
      _$ImpactAssessmentTemplateImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  ImpactCategory get category;
  @override
  TemplateType get type;
  @override
  List<MetricTemplate> get metricTemplates;
  @override
  List<String> get requiredDocuments;
  @override
  Map<String, dynamic>? get configuration;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$ImpactAssessmentTemplateImplCopyWith<_$ImpactAssessmentTemplateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

MetricTemplate _$MetricTemplateFromJson(Map<String, dynamic> json) {
  return _MetricTemplate.fromJson(json);
}

/// @nodoc
mixin _$MetricTemplate {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  MeasurementUnit get unit => throw _privateConstructorUsedError;
  MetricType get metricType => throw _privateConstructorUsedError;
  bool get isRequired => throw _privateConstructorUsedError;
  double? get minValue => throw _privateConstructorUsedError;
  double? get maxValue => throw _privateConstructorUsedError;
  String? get calculationFormula => throw _privateConstructorUsedError;
  List<String> get validationRules => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MetricTemplateCopyWith<MetricTemplate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetricTemplateCopyWith<$Res> {
  factory $MetricTemplateCopyWith(
          MetricTemplate value, $Res Function(MetricTemplate) then) =
      _$MetricTemplateCopyWithImpl<$Res, MetricTemplate>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      MeasurementUnit unit,
      MetricType metricType,
      bool isRequired,
      double? minValue,
      double? maxValue,
      String? calculationFormula,
      List<String> validationRules});
}

/// @nodoc
class _$MetricTemplateCopyWithImpl<$Res, $Val extends MetricTemplate>
    implements $MetricTemplateCopyWith<$Res> {
  _$MetricTemplateCopyWithImpl(this._value, this._then);

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
    Object? unit = null,
    Object? metricType = null,
    Object? isRequired = null,
    Object? minValue = freezed,
    Object? maxValue = freezed,
    Object? calculationFormula = freezed,
    Object? validationRules = null,
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
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as MeasurementUnit,
      metricType: null == metricType
          ? _value.metricType
          : metricType // ignore: cast_nullable_to_non_nullable
              as MetricType,
      isRequired: null == isRequired
          ? _value.isRequired
          : isRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      minValue: freezed == minValue
          ? _value.minValue
          : minValue // ignore: cast_nullable_to_non_nullable
              as double?,
      maxValue: freezed == maxValue
          ? _value.maxValue
          : maxValue // ignore: cast_nullable_to_non_nullable
              as double?,
      calculationFormula: freezed == calculationFormula
          ? _value.calculationFormula
          : calculationFormula // ignore: cast_nullable_to_non_nullable
              as String?,
      validationRules: null == validationRules
          ? _value.validationRules
          : validationRules // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MetricTemplateImplCopyWith<$Res>
    implements $MetricTemplateCopyWith<$Res> {
  factory _$$MetricTemplateImplCopyWith(_$MetricTemplateImpl value,
          $Res Function(_$MetricTemplateImpl) then) =
      __$$MetricTemplateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      MeasurementUnit unit,
      MetricType metricType,
      bool isRequired,
      double? minValue,
      double? maxValue,
      String? calculationFormula,
      List<String> validationRules});
}

/// @nodoc
class __$$MetricTemplateImplCopyWithImpl<$Res>
    extends _$MetricTemplateCopyWithImpl<$Res, _$MetricTemplateImpl>
    implements _$$MetricTemplateImplCopyWith<$Res> {
  __$$MetricTemplateImplCopyWithImpl(
      _$MetricTemplateImpl _value, $Res Function(_$MetricTemplateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? unit = null,
    Object? metricType = null,
    Object? isRequired = null,
    Object? minValue = freezed,
    Object? maxValue = freezed,
    Object? calculationFormula = freezed,
    Object? validationRules = null,
  }) {
    return _then(_$MetricTemplateImpl(
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
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as MeasurementUnit,
      metricType: null == metricType
          ? _value.metricType
          : metricType // ignore: cast_nullable_to_non_nullable
              as MetricType,
      isRequired: null == isRequired
          ? _value.isRequired
          : isRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      minValue: freezed == minValue
          ? _value.minValue
          : minValue // ignore: cast_nullable_to_non_nullable
              as double?,
      maxValue: freezed == maxValue
          ? _value.maxValue
          : maxValue // ignore: cast_nullable_to_non_nullable
              as double?,
      calculationFormula: freezed == calculationFormula
          ? _value.calculationFormula
          : calculationFormula // ignore: cast_nullable_to_non_nullable
              as String?,
      validationRules: null == validationRules
          ? _value._validationRules
          : validationRules // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MetricTemplateImpl implements _MetricTemplate {
  const _$MetricTemplateImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.unit,
      required this.metricType,
      required this.isRequired,
      this.minValue,
      this.maxValue,
      this.calculationFormula,
      final List<String> validationRules = const []})
      : _validationRules = validationRules;

  factory _$MetricTemplateImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetricTemplateImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final MeasurementUnit unit;
  @override
  final MetricType metricType;
  @override
  final bool isRequired;
  @override
  final double? minValue;
  @override
  final double? maxValue;
  @override
  final String? calculationFormula;
  final List<String> _validationRules;
  @override
  @JsonKey()
  List<String> get validationRules {
    if (_validationRules is EqualUnmodifiableListView) return _validationRules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_validationRules);
  }

  @override
  String toString() {
    return 'MetricTemplate(id: $id, name: $name, description: $description, unit: $unit, metricType: $metricType, isRequired: $isRequired, minValue: $minValue, maxValue: $maxValue, calculationFormula: $calculationFormula, validationRules: $validationRules)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetricTemplateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.metricType, metricType) ||
                other.metricType == metricType) &&
            (identical(other.isRequired, isRequired) ||
                other.isRequired == isRequired) &&
            (identical(other.minValue, minValue) ||
                other.minValue == minValue) &&
            (identical(other.maxValue, maxValue) ||
                other.maxValue == maxValue) &&
            (identical(other.calculationFormula, calculationFormula) ||
                other.calculationFormula == calculationFormula) &&
            const DeepCollectionEquality()
                .equals(other._validationRules, _validationRules));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      unit,
      metricType,
      isRequired,
      minValue,
      maxValue,
      calculationFormula,
      const DeepCollectionEquality().hash(_validationRules));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MetricTemplateImplCopyWith<_$MetricTemplateImpl> get copyWith =>
      __$$MetricTemplateImplCopyWithImpl<_$MetricTemplateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MetricTemplateImplToJson(
      this,
    );
  }
}

abstract class _MetricTemplate implements MetricTemplate {
  const factory _MetricTemplate(
      {required final String id,
      required final String name,
      required final String description,
      required final MeasurementUnit unit,
      required final MetricType metricType,
      required final bool isRequired,
      final double? minValue,
      final double? maxValue,
      final String? calculationFormula,
      final List<String> validationRules}) = _$MetricTemplateImpl;

  factory _MetricTemplate.fromJson(Map<String, dynamic> json) =
      _$MetricTemplateImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  MeasurementUnit get unit;
  @override
  MetricType get metricType;
  @override
  bool get isRequired;
  @override
  double? get minValue;
  @override
  double? get maxValue;
  @override
  String? get calculationFormula;
  @override
  List<String> get validationRules;
  @override
  @JsonKey(ignore: true)
  _$$MetricTemplateImplCopyWith<_$MetricTemplateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ImpactDashboardConfig _$ImpactDashboardConfigFromJson(
    Map<String, dynamic> json) {
  return _ImpactDashboardConfig.fromJson(json);
}

/// @nodoc
mixin _$ImpactDashboardConfig {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DashboardType get dashboardType => throw _privateConstructorUsedError;
  List<String> get selectedProjects => throw _privateConstructorUsedError;
  List<ImpactCategory> get selectedCategories =>
      throw _privateConstructorUsedError;
  List<String> get selectedMetrics => throw _privateConstructorUsedError;
  DateRange get dateRange => throw _privateConstructorUsedError;
  List<ChartConfiguration> get charts => throw _privateConstructorUsedError;
  Map<String, dynamic>? get filters => throw _privateConstructorUsedError;
  DateTime? get lastModified => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImpactDashboardConfigCopyWith<ImpactDashboardConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImpactDashboardConfigCopyWith<$Res> {
  factory $ImpactDashboardConfigCopyWith(ImpactDashboardConfig value,
          $Res Function(ImpactDashboardConfig) then) =
      _$ImpactDashboardConfigCopyWithImpl<$Res, ImpactDashboardConfig>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String name,
      DashboardType dashboardType,
      List<String> selectedProjects,
      List<ImpactCategory> selectedCategories,
      List<String> selectedMetrics,
      DateRange dateRange,
      List<ChartConfiguration> charts,
      Map<String, dynamic>? filters,
      DateTime? lastModified});

  $DateRangeCopyWith<$Res> get dateRange;
}

/// @nodoc
class _$ImpactDashboardConfigCopyWithImpl<$Res,
        $Val extends ImpactDashboardConfig>
    implements $ImpactDashboardConfigCopyWith<$Res> {
  _$ImpactDashboardConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? name = null,
    Object? dashboardType = null,
    Object? selectedProjects = null,
    Object? selectedCategories = null,
    Object? selectedMetrics = null,
    Object? dateRange = null,
    Object? charts = null,
    Object? filters = freezed,
    Object? lastModified = freezed,
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
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      dashboardType: null == dashboardType
          ? _value.dashboardType
          : dashboardType // ignore: cast_nullable_to_non_nullable
              as DashboardType,
      selectedProjects: null == selectedProjects
          ? _value.selectedProjects
          : selectedProjects // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedCategories: null == selectedCategories
          ? _value.selectedCategories
          : selectedCategories // ignore: cast_nullable_to_non_nullable
              as List<ImpactCategory>,
      selectedMetrics: null == selectedMetrics
          ? _value.selectedMetrics
          : selectedMetrics // ignore: cast_nullable_to_non_nullable
              as List<String>,
      dateRange: null == dateRange
          ? _value.dateRange
          : dateRange // ignore: cast_nullable_to_non_nullable
              as DateRange,
      charts: null == charts
          ? _value.charts
          : charts // ignore: cast_nullable_to_non_nullable
              as List<ChartConfiguration>,
      filters: freezed == filters
          ? _value.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      lastModified: freezed == lastModified
          ? _value.lastModified
          : lastModified // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DateRangeCopyWith<$Res> get dateRange {
    return $DateRangeCopyWith<$Res>(_value.dateRange, (value) {
      return _then(_value.copyWith(dateRange: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ImpactDashboardConfigImplCopyWith<$Res>
    implements $ImpactDashboardConfigCopyWith<$Res> {
  factory _$$ImpactDashboardConfigImplCopyWith(
          _$ImpactDashboardConfigImpl value,
          $Res Function(_$ImpactDashboardConfigImpl) then) =
      __$$ImpactDashboardConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String name,
      DashboardType dashboardType,
      List<String> selectedProjects,
      List<ImpactCategory> selectedCategories,
      List<String> selectedMetrics,
      DateRange dateRange,
      List<ChartConfiguration> charts,
      Map<String, dynamic>? filters,
      DateTime? lastModified});

  @override
  $DateRangeCopyWith<$Res> get dateRange;
}

/// @nodoc
class __$$ImpactDashboardConfigImplCopyWithImpl<$Res>
    extends _$ImpactDashboardConfigCopyWithImpl<$Res,
        _$ImpactDashboardConfigImpl>
    implements _$$ImpactDashboardConfigImplCopyWith<$Res> {
  __$$ImpactDashboardConfigImplCopyWithImpl(_$ImpactDashboardConfigImpl _value,
      $Res Function(_$ImpactDashboardConfigImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? name = null,
    Object? dashboardType = null,
    Object? selectedProjects = null,
    Object? selectedCategories = null,
    Object? selectedMetrics = null,
    Object? dateRange = null,
    Object? charts = null,
    Object? filters = freezed,
    Object? lastModified = freezed,
  }) {
    return _then(_$ImpactDashboardConfigImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      dashboardType: null == dashboardType
          ? _value.dashboardType
          : dashboardType // ignore: cast_nullable_to_non_nullable
              as DashboardType,
      selectedProjects: null == selectedProjects
          ? _value._selectedProjects
          : selectedProjects // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedCategories: null == selectedCategories
          ? _value._selectedCategories
          : selectedCategories // ignore: cast_nullable_to_non_nullable
              as List<ImpactCategory>,
      selectedMetrics: null == selectedMetrics
          ? _value._selectedMetrics
          : selectedMetrics // ignore: cast_nullable_to_non_nullable
              as List<String>,
      dateRange: null == dateRange
          ? _value.dateRange
          : dateRange // ignore: cast_nullable_to_non_nullable
              as DateRange,
      charts: null == charts
          ? _value._charts
          : charts // ignore: cast_nullable_to_non_nullable
              as List<ChartConfiguration>,
      filters: freezed == filters
          ? _value._filters
          : filters // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      lastModified: freezed == lastModified
          ? _value.lastModified
          : lastModified // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImpactDashboardConfigImpl implements _ImpactDashboardConfig {
  const _$ImpactDashboardConfigImpl(
      {required this.id,
      required this.userId,
      required this.name,
      required this.dashboardType,
      final List<String> selectedProjects = const [],
      final List<ImpactCategory> selectedCategories = const [],
      final List<String> selectedMetrics = const [],
      required this.dateRange,
      final List<ChartConfiguration> charts = const [],
      final Map<String, dynamic>? filters,
      this.lastModified})
      : _selectedProjects = selectedProjects,
        _selectedCategories = selectedCategories,
        _selectedMetrics = selectedMetrics,
        _charts = charts,
        _filters = filters;

  factory _$ImpactDashboardConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImpactDashboardConfigImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String name;
  @override
  final DashboardType dashboardType;
  final List<String> _selectedProjects;
  @override
  @JsonKey()
  List<String> get selectedProjects {
    if (_selectedProjects is EqualUnmodifiableListView)
      return _selectedProjects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedProjects);
  }

  final List<ImpactCategory> _selectedCategories;
  @override
  @JsonKey()
  List<ImpactCategory> get selectedCategories {
    if (_selectedCategories is EqualUnmodifiableListView)
      return _selectedCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedCategories);
  }

  final List<String> _selectedMetrics;
  @override
  @JsonKey()
  List<String> get selectedMetrics {
    if (_selectedMetrics is EqualUnmodifiableListView) return _selectedMetrics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedMetrics);
  }

  @override
  final DateRange dateRange;
  final List<ChartConfiguration> _charts;
  @override
  @JsonKey()
  List<ChartConfiguration> get charts {
    if (_charts is EqualUnmodifiableListView) return _charts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_charts);
  }

  final Map<String, dynamic>? _filters;
  @override
  Map<String, dynamic>? get filters {
    final value = _filters;
    if (value == null) return null;
    if (_filters is EqualUnmodifiableMapView) return _filters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final DateTime? lastModified;

  @override
  String toString() {
    return 'ImpactDashboardConfig(id: $id, userId: $userId, name: $name, dashboardType: $dashboardType, selectedProjects: $selectedProjects, selectedCategories: $selectedCategories, selectedMetrics: $selectedMetrics, dateRange: $dateRange, charts: $charts, filters: $filters, lastModified: $lastModified)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImpactDashboardConfigImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.dashboardType, dashboardType) ||
                other.dashboardType == dashboardType) &&
            const DeepCollectionEquality()
                .equals(other._selectedProjects, _selectedProjects) &&
            const DeepCollectionEquality()
                .equals(other._selectedCategories, _selectedCategories) &&
            const DeepCollectionEquality()
                .equals(other._selectedMetrics, _selectedMetrics) &&
            (identical(other.dateRange, dateRange) ||
                other.dateRange == dateRange) &&
            const DeepCollectionEquality().equals(other._charts, _charts) &&
            const DeepCollectionEquality().equals(other._filters, _filters) &&
            (identical(other.lastModified, lastModified) ||
                other.lastModified == lastModified));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      name,
      dashboardType,
      const DeepCollectionEquality().hash(_selectedProjects),
      const DeepCollectionEquality().hash(_selectedCategories),
      const DeepCollectionEquality().hash(_selectedMetrics),
      dateRange,
      const DeepCollectionEquality().hash(_charts),
      const DeepCollectionEquality().hash(_filters),
      lastModified);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImpactDashboardConfigImplCopyWith<_$ImpactDashboardConfigImpl>
      get copyWith => __$$ImpactDashboardConfigImplCopyWithImpl<
          _$ImpactDashboardConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImpactDashboardConfigImplToJson(
      this,
    );
  }
}

abstract class _ImpactDashboardConfig implements ImpactDashboardConfig {
  const factory _ImpactDashboardConfig(
      {required final String id,
      required final String userId,
      required final String name,
      required final DashboardType dashboardType,
      final List<String> selectedProjects,
      final List<ImpactCategory> selectedCategories,
      final List<String> selectedMetrics,
      required final DateRange dateRange,
      final List<ChartConfiguration> charts,
      final Map<String, dynamic>? filters,
      final DateTime? lastModified}) = _$ImpactDashboardConfigImpl;

  factory _ImpactDashboardConfig.fromJson(Map<String, dynamic> json) =
      _$ImpactDashboardConfigImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get name;
  @override
  DashboardType get dashboardType;
  @override
  List<String> get selectedProjects;
  @override
  List<ImpactCategory> get selectedCategories;
  @override
  List<String> get selectedMetrics;
  @override
  DateRange get dateRange;
  @override
  List<ChartConfiguration> get charts;
  @override
  Map<String, dynamic>? get filters;
  @override
  DateTime? get lastModified;
  @override
  @JsonKey(ignore: true)
  _$$ImpactDashboardConfigImplCopyWith<_$ImpactDashboardConfigImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DateRange _$DateRangeFromJson(Map<String, dynamic> json) {
  return _DateRange.fromJson(json);
}

/// @nodoc
mixin _$DateRange {
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;
  String? get label => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DateRangeCopyWith<DateRange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DateRangeCopyWith<$Res> {
  factory $DateRangeCopyWith(DateRange value, $Res Function(DateRange) then) =
      _$DateRangeCopyWithImpl<$Res, DateRange>;
  @useResult
  $Res call({DateTime startDate, DateTime endDate, String? label});
}

/// @nodoc
class _$DateRangeCopyWithImpl<$Res, $Val extends DateRange>
    implements $DateRangeCopyWith<$Res> {
  _$DateRangeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = null,
    Object? endDate = null,
    Object? label = freezed,
  }) {
    return _then(_value.copyWith(
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DateRangeImplCopyWith<$Res>
    implements $DateRangeCopyWith<$Res> {
  factory _$$DateRangeImplCopyWith(
          _$DateRangeImpl value, $Res Function(_$DateRangeImpl) then) =
      __$$DateRangeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime startDate, DateTime endDate, String? label});
}

/// @nodoc
class __$$DateRangeImplCopyWithImpl<$Res>
    extends _$DateRangeCopyWithImpl<$Res, _$DateRangeImpl>
    implements _$$DateRangeImplCopyWith<$Res> {
  __$$DateRangeImplCopyWithImpl(
      _$DateRangeImpl _value, $Res Function(_$DateRangeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = null,
    Object? endDate = null,
    Object? label = freezed,
  }) {
    return _then(_$DateRangeImpl(
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DateRangeImpl implements _DateRange {
  const _$DateRangeImpl(
      {required this.startDate, required this.endDate, this.label});

  factory _$DateRangeImpl.fromJson(Map<String, dynamic> json) =>
      _$$DateRangeImplFromJson(json);

  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  @override
  final String? label;

  @override
  String toString() {
    return 'DateRange(startDate: $startDate, endDate: $endDate, label: $label)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DateRangeImpl &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.label, label) || other.label == label));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, startDate, endDate, label);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DateRangeImplCopyWith<_$DateRangeImpl> get copyWith =>
      __$$DateRangeImplCopyWithImpl<_$DateRangeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DateRangeImplToJson(
      this,
    );
  }
}

abstract class _DateRange implements DateRange {
  const factory _DateRange(
      {required final DateTime startDate,
      required final DateTime endDate,
      final String? label}) = _$DateRangeImpl;

  factory _DateRange.fromJson(Map<String, dynamic> json) =
      _$DateRangeImpl.fromJson;

  @override
  DateTime get startDate;
  @override
  DateTime get endDate;
  @override
  String? get label;
  @override
  @JsonKey(ignore: true)
  _$$DateRangeImplCopyWith<_$DateRangeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChartConfiguration _$ChartConfigurationFromJson(Map<String, dynamic> json) {
  return _ChartConfiguration.fromJson(json);
}

/// @nodoc
mixin _$ChartConfiguration {
  String get id => throw _privateConstructorUsedError;
  ChartType get chartType => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get dataSource => throw _privateConstructorUsedError;
  List<String> get metrics => throw _privateConstructorUsedError;
  Map<String, dynamic>? get options => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChartConfigurationCopyWith<ChartConfiguration> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChartConfigurationCopyWith<$Res> {
  factory $ChartConfigurationCopyWith(
          ChartConfiguration value, $Res Function(ChartConfiguration) then) =
      _$ChartConfigurationCopyWithImpl<$Res, ChartConfiguration>;
  @useResult
  $Res call(
      {String id,
      ChartType chartType,
      String title,
      String dataSource,
      List<String> metrics,
      Map<String, dynamic>? options});
}

/// @nodoc
class _$ChartConfigurationCopyWithImpl<$Res, $Val extends ChartConfiguration>
    implements $ChartConfigurationCopyWith<$Res> {
  _$ChartConfigurationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? chartType = null,
    Object? title = null,
    Object? dataSource = null,
    Object? metrics = null,
    Object? options = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      chartType: null == chartType
          ? _value.chartType
          : chartType // ignore: cast_nullable_to_non_nullable
              as ChartType,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      dataSource: null == dataSource
          ? _value.dataSource
          : dataSource // ignore: cast_nullable_to_non_nullable
              as String,
      metrics: null == metrics
          ? _value.metrics
          : metrics // ignore: cast_nullable_to_non_nullable
              as List<String>,
      options: freezed == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChartConfigurationImplCopyWith<$Res>
    implements $ChartConfigurationCopyWith<$Res> {
  factory _$$ChartConfigurationImplCopyWith(_$ChartConfigurationImpl value,
          $Res Function(_$ChartConfigurationImpl) then) =
      __$$ChartConfigurationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      ChartType chartType,
      String title,
      String dataSource,
      List<String> metrics,
      Map<String, dynamic>? options});
}

/// @nodoc
class __$$ChartConfigurationImplCopyWithImpl<$Res>
    extends _$ChartConfigurationCopyWithImpl<$Res, _$ChartConfigurationImpl>
    implements _$$ChartConfigurationImplCopyWith<$Res> {
  __$$ChartConfigurationImplCopyWithImpl(_$ChartConfigurationImpl _value,
      $Res Function(_$ChartConfigurationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? chartType = null,
    Object? title = null,
    Object? dataSource = null,
    Object? metrics = null,
    Object? options = freezed,
  }) {
    return _then(_$ChartConfigurationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      chartType: null == chartType
          ? _value.chartType
          : chartType // ignore: cast_nullable_to_non_nullable
              as ChartType,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      dataSource: null == dataSource
          ? _value.dataSource
          : dataSource // ignore: cast_nullable_to_non_nullable
              as String,
      metrics: null == metrics
          ? _value._metrics
          : metrics // ignore: cast_nullable_to_non_nullable
              as List<String>,
      options: freezed == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChartConfigurationImpl implements _ChartConfiguration {
  const _$ChartConfigurationImpl(
      {required this.id,
      required this.chartType,
      required this.title,
      required this.dataSource,
      final List<String> metrics = const [],
      final Map<String, dynamic>? options})
      : _metrics = metrics,
        _options = options;

  factory _$ChartConfigurationImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChartConfigurationImplFromJson(json);

  @override
  final String id;
  @override
  final ChartType chartType;
  @override
  final String title;
  @override
  final String dataSource;
  final List<String> _metrics;
  @override
  @JsonKey()
  List<String> get metrics {
    if (_metrics is EqualUnmodifiableListView) return _metrics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_metrics);
  }

  final Map<String, dynamic>? _options;
  @override
  Map<String, dynamic>? get options {
    final value = _options;
    if (value == null) return null;
    if (_options is EqualUnmodifiableMapView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'ChartConfiguration(id: $id, chartType: $chartType, title: $title, dataSource: $dataSource, metrics: $metrics, options: $options)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChartConfigurationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.chartType, chartType) ||
                other.chartType == chartType) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.dataSource, dataSource) ||
                other.dataSource == dataSource) &&
            const DeepCollectionEquality().equals(other._metrics, _metrics) &&
            const DeepCollectionEquality().equals(other._options, _options));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      chartType,
      title,
      dataSource,
      const DeepCollectionEquality().hash(_metrics),
      const DeepCollectionEquality().hash(_options));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChartConfigurationImplCopyWith<_$ChartConfigurationImpl> get copyWith =>
      __$$ChartConfigurationImplCopyWithImpl<_$ChartConfigurationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChartConfigurationImplToJson(
      this,
    );
  }
}

abstract class _ChartConfiguration implements ChartConfiguration {
  const factory _ChartConfiguration(
      {required final String id,
      required final ChartType chartType,
      required final String title,
      required final String dataSource,
      final List<String> metrics,
      final Map<String, dynamic>? options}) = _$ChartConfigurationImpl;

  factory _ChartConfiguration.fromJson(Map<String, dynamic> json) =
      _$ChartConfigurationImpl.fromJson;

  @override
  String get id;
  @override
  ChartType get chartType;
  @override
  String get title;
  @override
  String get dataSource;
  @override
  List<String> get metrics;
  @override
  Map<String, dynamic>? get options;
  @override
  @JsonKey(ignore: true)
  _$$ChartConfigurationImplCopyWith<_$ChartConfigurationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
