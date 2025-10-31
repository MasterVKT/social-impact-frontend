// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audit_trail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuditTrailEntry _$AuditTrailEntryFromJson(Map<String, dynamic> json) {
  return _AuditTrailEntry.fromJson(json);
}

/// @nodoc
mixin _$AuditTrailEntry {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get action => throw _privateConstructorUsedError;
  AuditCategory get category => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  String get resourceId => throw _privateConstructorUsedError;
  String get resourceType => throw _privateConstructorUsedError;
  Map<String, dynamic> get oldValues => throw _privateConstructorUsedError;
  Map<String, dynamic> get newValues => throw _privateConstructorUsedError;
  String get ipAddress => throw _privateConstructorUsedError;
  String get userAgent => throw _privateConstructorUsedError;
  AuditSeverity get severity => throw _privateConstructorUsedError;
  String? get sessionId => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;
  String? get complianceNote => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuditTrailEntryCopyWith<AuditTrailEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuditTrailEntryCopyWith<$Res> {
  factory $AuditTrailEntryCopyWith(
          AuditTrailEntry value, $Res Function(AuditTrailEntry) then) =
      _$AuditTrailEntryCopyWithImpl<$Res, AuditTrailEntry>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String action,
      AuditCategory category,
      DateTime timestamp,
      String resourceId,
      String resourceType,
      Map<String, dynamic> oldValues,
      Map<String, dynamic> newValues,
      String ipAddress,
      String userAgent,
      AuditSeverity severity,
      String? sessionId,
      String? description,
      Map<String, dynamic>? metadata,
      String? complianceNote});
}

/// @nodoc
class _$AuditTrailEntryCopyWithImpl<$Res, $Val extends AuditTrailEntry>
    implements $AuditTrailEntryCopyWith<$Res> {
  _$AuditTrailEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? action = null,
    Object? category = null,
    Object? timestamp = null,
    Object? resourceId = null,
    Object? resourceType = null,
    Object? oldValues = null,
    Object? newValues = null,
    Object? ipAddress = null,
    Object? userAgent = null,
    Object? severity = null,
    Object? sessionId = freezed,
    Object? description = freezed,
    Object? metadata = freezed,
    Object? complianceNote = freezed,
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
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as AuditCategory,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      resourceId: null == resourceId
          ? _value.resourceId
          : resourceId // ignore: cast_nullable_to_non_nullable
              as String,
      resourceType: null == resourceType
          ? _value.resourceType
          : resourceType // ignore: cast_nullable_to_non_nullable
              as String,
      oldValues: null == oldValues
          ? _value.oldValues
          : oldValues // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      newValues: null == newValues
          ? _value.newValues
          : newValues // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      ipAddress: null == ipAddress
          ? _value.ipAddress
          : ipAddress // ignore: cast_nullable_to_non_nullable
              as String,
      userAgent: null == userAgent
          ? _value.userAgent
          : userAgent // ignore: cast_nullable_to_non_nullable
              as String,
      severity: null == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as AuditSeverity,
      sessionId: freezed == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      complianceNote: freezed == complianceNote
          ? _value.complianceNote
          : complianceNote // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuditTrailEntryImplCopyWith<$Res>
    implements $AuditTrailEntryCopyWith<$Res> {
  factory _$$AuditTrailEntryImplCopyWith(_$AuditTrailEntryImpl value,
          $Res Function(_$AuditTrailEntryImpl) then) =
      __$$AuditTrailEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String action,
      AuditCategory category,
      DateTime timestamp,
      String resourceId,
      String resourceType,
      Map<String, dynamic> oldValues,
      Map<String, dynamic> newValues,
      String ipAddress,
      String userAgent,
      AuditSeverity severity,
      String? sessionId,
      String? description,
      Map<String, dynamic>? metadata,
      String? complianceNote});
}

/// @nodoc
class __$$AuditTrailEntryImplCopyWithImpl<$Res>
    extends _$AuditTrailEntryCopyWithImpl<$Res, _$AuditTrailEntryImpl>
    implements _$$AuditTrailEntryImplCopyWith<$Res> {
  __$$AuditTrailEntryImplCopyWithImpl(
      _$AuditTrailEntryImpl _value, $Res Function(_$AuditTrailEntryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? action = null,
    Object? category = null,
    Object? timestamp = null,
    Object? resourceId = null,
    Object? resourceType = null,
    Object? oldValues = null,
    Object? newValues = null,
    Object? ipAddress = null,
    Object? userAgent = null,
    Object? severity = null,
    Object? sessionId = freezed,
    Object? description = freezed,
    Object? metadata = freezed,
    Object? complianceNote = freezed,
  }) {
    return _then(_$AuditTrailEntryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as AuditCategory,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      resourceId: null == resourceId
          ? _value.resourceId
          : resourceId // ignore: cast_nullable_to_non_nullable
              as String,
      resourceType: null == resourceType
          ? _value.resourceType
          : resourceType // ignore: cast_nullable_to_non_nullable
              as String,
      oldValues: null == oldValues
          ? _value._oldValues
          : oldValues // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      newValues: null == newValues
          ? _value._newValues
          : newValues // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      ipAddress: null == ipAddress
          ? _value.ipAddress
          : ipAddress // ignore: cast_nullable_to_non_nullable
              as String,
      userAgent: null == userAgent
          ? _value.userAgent
          : userAgent // ignore: cast_nullable_to_non_nullable
              as String,
      severity: null == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as AuditSeverity,
      sessionId: freezed == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      complianceNote: freezed == complianceNote
          ? _value.complianceNote
          : complianceNote // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuditTrailEntryImpl implements _AuditTrailEntry {
  const _$AuditTrailEntryImpl(
      {required this.id,
      required this.userId,
      required this.action,
      required this.category,
      required this.timestamp,
      required this.resourceId,
      required this.resourceType,
      required final Map<String, dynamic> oldValues,
      required final Map<String, dynamic> newValues,
      required this.ipAddress,
      required this.userAgent,
      required this.severity,
      this.sessionId,
      this.description,
      final Map<String, dynamic>? metadata,
      this.complianceNote})
      : _oldValues = oldValues,
        _newValues = newValues,
        _metadata = metadata;

  factory _$AuditTrailEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuditTrailEntryImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String action;
  @override
  final AuditCategory category;
  @override
  final DateTime timestamp;
  @override
  final String resourceId;
  @override
  final String resourceType;
  final Map<String, dynamic> _oldValues;
  @override
  Map<String, dynamic> get oldValues {
    if (_oldValues is EqualUnmodifiableMapView) return _oldValues;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_oldValues);
  }

  final Map<String, dynamic> _newValues;
  @override
  Map<String, dynamic> get newValues {
    if (_newValues is EqualUnmodifiableMapView) return _newValues;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_newValues);
  }

  @override
  final String ipAddress;
  @override
  final String userAgent;
  @override
  final AuditSeverity severity;
  @override
  final String? sessionId;
  @override
  final String? description;
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
  final String? complianceNote;

  @override
  String toString() {
    return 'AuditTrailEntry(id: $id, userId: $userId, action: $action, category: $category, timestamp: $timestamp, resourceId: $resourceId, resourceType: $resourceType, oldValues: $oldValues, newValues: $newValues, ipAddress: $ipAddress, userAgent: $userAgent, severity: $severity, sessionId: $sessionId, description: $description, metadata: $metadata, complianceNote: $complianceNote)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuditTrailEntryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.resourceId, resourceId) ||
                other.resourceId == resourceId) &&
            (identical(other.resourceType, resourceType) ||
                other.resourceType == resourceType) &&
            const DeepCollectionEquality()
                .equals(other._oldValues, _oldValues) &&
            const DeepCollectionEquality()
                .equals(other._newValues, _newValues) &&
            (identical(other.ipAddress, ipAddress) ||
                other.ipAddress == ipAddress) &&
            (identical(other.userAgent, userAgent) ||
                other.userAgent == userAgent) &&
            (identical(other.severity, severity) ||
                other.severity == severity) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.complianceNote, complianceNote) ||
                other.complianceNote == complianceNote));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      action,
      category,
      timestamp,
      resourceId,
      resourceType,
      const DeepCollectionEquality().hash(_oldValues),
      const DeepCollectionEquality().hash(_newValues),
      ipAddress,
      userAgent,
      severity,
      sessionId,
      description,
      const DeepCollectionEquality().hash(_metadata),
      complianceNote);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuditTrailEntryImplCopyWith<_$AuditTrailEntryImpl> get copyWith =>
      __$$AuditTrailEntryImplCopyWithImpl<_$AuditTrailEntryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuditTrailEntryImplToJson(
      this,
    );
  }
}

abstract class _AuditTrailEntry implements AuditTrailEntry {
  const factory _AuditTrailEntry(
      {required final String id,
      required final String userId,
      required final String action,
      required final AuditCategory category,
      required final DateTime timestamp,
      required final String resourceId,
      required final String resourceType,
      required final Map<String, dynamic> oldValues,
      required final Map<String, dynamic> newValues,
      required final String ipAddress,
      required final String userAgent,
      required final AuditSeverity severity,
      final String? sessionId,
      final String? description,
      final Map<String, dynamic>? metadata,
      final String? complianceNote}) = _$AuditTrailEntryImpl;

  factory _AuditTrailEntry.fromJson(Map<String, dynamic> json) =
      _$AuditTrailEntryImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get action;
  @override
  AuditCategory get category;
  @override
  DateTime get timestamp;
  @override
  String get resourceId;
  @override
  String get resourceType;
  @override
  Map<String, dynamic> get oldValues;
  @override
  Map<String, dynamic> get newValues;
  @override
  String get ipAddress;
  @override
  String get userAgent;
  @override
  AuditSeverity get severity;
  @override
  String? get sessionId;
  @override
  String? get description;
  @override
  Map<String, dynamic>? get metadata;
  @override
  String? get complianceNote;
  @override
  @JsonKey(ignore: true)
  _$$AuditTrailEntryImplCopyWith<_$AuditTrailEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ComplianceReport _$ComplianceReportFromJson(Map<String, dynamic> json) {
  return _ComplianceReport.fromJson(json);
}

/// @nodoc
mixin _$ComplianceReport {
  String get id => throw _privateConstructorUsedError;
  String get organizationId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  ComplianceFramework get framework => throw _privateConstructorUsedError;
  ReportingPeriod get period => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;
  ComplianceStatus get status => throw _privateConstructorUsedError;
  DateTime get generatedAt => throw _privateConstructorUsedError;
  List<ComplianceRequirement> get requirements =>
      throw _privateConstructorUsedError;
  List<ComplianceFinding> get findings => throw _privateConstructorUsedError;
  List<String> get evidenceUrls => throw _privateConstructorUsedError;
  String? get generatedBy => throw _privateConstructorUsedError;
  String? get reviewedBy => throw _privateConstructorUsedError;
  DateTime? get reviewedAt => throw _privateConstructorUsedError;
  DateTime? get submittedAt => throw _privateConstructorUsedError;
  String? get submissionReference => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ComplianceReportCopyWith<ComplianceReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComplianceReportCopyWith<$Res> {
  factory $ComplianceReportCopyWith(
          ComplianceReport value, $Res Function(ComplianceReport) then) =
      _$ComplianceReportCopyWithImpl<$Res, ComplianceReport>;
  @useResult
  $Res call(
      {String id,
      String organizationId,
      String title,
      ComplianceFramework framework,
      ReportingPeriod period,
      DateTime startDate,
      DateTime endDate,
      ComplianceStatus status,
      DateTime generatedAt,
      List<ComplianceRequirement> requirements,
      List<ComplianceFinding> findings,
      List<String> evidenceUrls,
      String? generatedBy,
      String? reviewedBy,
      DateTime? reviewedAt,
      DateTime? submittedAt,
      String? submissionReference,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class _$ComplianceReportCopyWithImpl<$Res, $Val extends ComplianceReport>
    implements $ComplianceReportCopyWith<$Res> {
  _$ComplianceReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? organizationId = null,
    Object? title = null,
    Object? framework = null,
    Object? period = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? status = null,
    Object? generatedAt = null,
    Object? requirements = null,
    Object? findings = null,
    Object? evidenceUrls = null,
    Object? generatedBy = freezed,
    Object? reviewedBy = freezed,
    Object? reviewedAt = freezed,
    Object? submittedAt = freezed,
    Object? submissionReference = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      organizationId: null == organizationId
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      framework: null == framework
          ? _value.framework
          : framework // ignore: cast_nullable_to_non_nullable
              as ComplianceFramework,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as ReportingPeriod,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ComplianceStatus,
      generatedAt: null == generatedAt
          ? _value.generatedAt
          : generatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      requirements: null == requirements
          ? _value.requirements
          : requirements // ignore: cast_nullable_to_non_nullable
              as List<ComplianceRequirement>,
      findings: null == findings
          ? _value.findings
          : findings // ignore: cast_nullable_to_non_nullable
              as List<ComplianceFinding>,
      evidenceUrls: null == evidenceUrls
          ? _value.evidenceUrls
          : evidenceUrls // ignore: cast_nullable_to_non_nullable
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
      submittedAt: freezed == submittedAt
          ? _value.submittedAt
          : submittedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      submissionReference: freezed == submissionReference
          ? _value.submissionReference
          : submissionReference // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ComplianceReportImplCopyWith<$Res>
    implements $ComplianceReportCopyWith<$Res> {
  factory _$$ComplianceReportImplCopyWith(_$ComplianceReportImpl value,
          $Res Function(_$ComplianceReportImpl) then) =
      __$$ComplianceReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String organizationId,
      String title,
      ComplianceFramework framework,
      ReportingPeriod period,
      DateTime startDate,
      DateTime endDate,
      ComplianceStatus status,
      DateTime generatedAt,
      List<ComplianceRequirement> requirements,
      List<ComplianceFinding> findings,
      List<String> evidenceUrls,
      String? generatedBy,
      String? reviewedBy,
      DateTime? reviewedAt,
      DateTime? submittedAt,
      String? submissionReference,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class __$$ComplianceReportImplCopyWithImpl<$Res>
    extends _$ComplianceReportCopyWithImpl<$Res, _$ComplianceReportImpl>
    implements _$$ComplianceReportImplCopyWith<$Res> {
  __$$ComplianceReportImplCopyWithImpl(_$ComplianceReportImpl _value,
      $Res Function(_$ComplianceReportImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? organizationId = null,
    Object? title = null,
    Object? framework = null,
    Object? period = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? status = null,
    Object? generatedAt = null,
    Object? requirements = null,
    Object? findings = null,
    Object? evidenceUrls = null,
    Object? generatedBy = freezed,
    Object? reviewedBy = freezed,
    Object? reviewedAt = freezed,
    Object? submittedAt = freezed,
    Object? submissionReference = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_$ComplianceReportImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      organizationId: null == organizationId
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      framework: null == framework
          ? _value.framework
          : framework // ignore: cast_nullable_to_non_nullable
              as ComplianceFramework,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as ReportingPeriod,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ComplianceStatus,
      generatedAt: null == generatedAt
          ? _value.generatedAt
          : generatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      requirements: null == requirements
          ? _value._requirements
          : requirements // ignore: cast_nullable_to_non_nullable
              as List<ComplianceRequirement>,
      findings: null == findings
          ? _value._findings
          : findings // ignore: cast_nullable_to_non_nullable
              as List<ComplianceFinding>,
      evidenceUrls: null == evidenceUrls
          ? _value._evidenceUrls
          : evidenceUrls // ignore: cast_nullable_to_non_nullable
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
      submittedAt: freezed == submittedAt
          ? _value.submittedAt
          : submittedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      submissionReference: freezed == submissionReference
          ? _value.submissionReference
          : submissionReference // ignore: cast_nullable_to_non_nullable
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
class _$ComplianceReportImpl implements _ComplianceReport {
  const _$ComplianceReportImpl(
      {required this.id,
      required this.organizationId,
      required this.title,
      required this.framework,
      required this.period,
      required this.startDate,
      required this.endDate,
      required this.status,
      required this.generatedAt,
      final List<ComplianceRequirement> requirements = const [],
      final List<ComplianceFinding> findings = const [],
      final List<String> evidenceUrls = const [],
      this.generatedBy,
      this.reviewedBy,
      this.reviewedAt,
      this.submittedAt,
      this.submissionReference,
      final Map<String, dynamic>? metadata})
      : _requirements = requirements,
        _findings = findings,
        _evidenceUrls = evidenceUrls,
        _metadata = metadata;

  factory _$ComplianceReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$ComplianceReportImplFromJson(json);

  @override
  final String id;
  @override
  final String organizationId;
  @override
  final String title;
  @override
  final ComplianceFramework framework;
  @override
  final ReportingPeriod period;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  @override
  final ComplianceStatus status;
  @override
  final DateTime generatedAt;
  final List<ComplianceRequirement> _requirements;
  @override
  @JsonKey()
  List<ComplianceRequirement> get requirements {
    if (_requirements is EqualUnmodifiableListView) return _requirements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_requirements);
  }

  final List<ComplianceFinding> _findings;
  @override
  @JsonKey()
  List<ComplianceFinding> get findings {
    if (_findings is EqualUnmodifiableListView) return _findings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_findings);
  }

  final List<String> _evidenceUrls;
  @override
  @JsonKey()
  List<String> get evidenceUrls {
    if (_evidenceUrls is EqualUnmodifiableListView) return _evidenceUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_evidenceUrls);
  }

  @override
  final String? generatedBy;
  @override
  final String? reviewedBy;
  @override
  final DateTime? reviewedAt;
  @override
  final DateTime? submittedAt;
  @override
  final String? submissionReference;
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
    return 'ComplianceReport(id: $id, organizationId: $organizationId, title: $title, framework: $framework, period: $period, startDate: $startDate, endDate: $endDate, status: $status, generatedAt: $generatedAt, requirements: $requirements, findings: $findings, evidenceUrls: $evidenceUrls, generatedBy: $generatedBy, reviewedBy: $reviewedBy, reviewedAt: $reviewedAt, submittedAt: $submittedAt, submissionReference: $submissionReference, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComplianceReportImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.framework, framework) ||
                other.framework == framework) &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.generatedAt, generatedAt) ||
                other.generatedAt == generatedAt) &&
            const DeepCollectionEquality()
                .equals(other._requirements, _requirements) &&
            const DeepCollectionEquality().equals(other._findings, _findings) &&
            const DeepCollectionEquality()
                .equals(other._evidenceUrls, _evidenceUrls) &&
            (identical(other.generatedBy, generatedBy) ||
                other.generatedBy == generatedBy) &&
            (identical(other.reviewedBy, reviewedBy) ||
                other.reviewedBy == reviewedBy) &&
            (identical(other.reviewedAt, reviewedAt) ||
                other.reviewedAt == reviewedAt) &&
            (identical(other.submittedAt, submittedAt) ||
                other.submittedAt == submittedAt) &&
            (identical(other.submissionReference, submissionReference) ||
                other.submissionReference == submissionReference) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      organizationId,
      title,
      framework,
      period,
      startDate,
      endDate,
      status,
      generatedAt,
      const DeepCollectionEquality().hash(_requirements),
      const DeepCollectionEquality().hash(_findings),
      const DeepCollectionEquality().hash(_evidenceUrls),
      generatedBy,
      reviewedBy,
      reviewedAt,
      submittedAt,
      submissionReference,
      const DeepCollectionEquality().hash(_metadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ComplianceReportImplCopyWith<_$ComplianceReportImpl> get copyWith =>
      __$$ComplianceReportImplCopyWithImpl<_$ComplianceReportImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ComplianceReportImplToJson(
      this,
    );
  }
}

abstract class _ComplianceReport implements ComplianceReport {
  const factory _ComplianceReport(
      {required final String id,
      required final String organizationId,
      required final String title,
      required final ComplianceFramework framework,
      required final ReportingPeriod period,
      required final DateTime startDate,
      required final DateTime endDate,
      required final ComplianceStatus status,
      required final DateTime generatedAt,
      final List<ComplianceRequirement> requirements,
      final List<ComplianceFinding> findings,
      final List<String> evidenceUrls,
      final String? generatedBy,
      final String? reviewedBy,
      final DateTime? reviewedAt,
      final DateTime? submittedAt,
      final String? submissionReference,
      final Map<String, dynamic>? metadata}) = _$ComplianceReportImpl;

  factory _ComplianceReport.fromJson(Map<String, dynamic> json) =
      _$ComplianceReportImpl.fromJson;

  @override
  String get id;
  @override
  String get organizationId;
  @override
  String get title;
  @override
  ComplianceFramework get framework;
  @override
  ReportingPeriod get period;
  @override
  DateTime get startDate;
  @override
  DateTime get endDate;
  @override
  ComplianceStatus get status;
  @override
  DateTime get generatedAt;
  @override
  List<ComplianceRequirement> get requirements;
  @override
  List<ComplianceFinding> get findings;
  @override
  List<String> get evidenceUrls;
  @override
  String? get generatedBy;
  @override
  String? get reviewedBy;
  @override
  DateTime? get reviewedAt;
  @override
  DateTime? get submittedAt;
  @override
  String? get submissionReference;
  @override
  Map<String, dynamic>? get metadata;
  @override
  @JsonKey(ignore: true)
  _$$ComplianceReportImplCopyWith<_$ComplianceReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ComplianceRequirement _$ComplianceRequirementFromJson(
    Map<String, dynamic> json) {
  return _ComplianceRequirement.fromJson(json);
}

/// @nodoc
mixin _$ComplianceRequirement {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  RequirementType get type => throw _privateConstructorUsedError;
  ComplianceStatus get status => throw _privateConstructorUsedError;
  Priority get priority => throw _privateConstructorUsedError;
  DateTime get dueDate => throw _privateConstructorUsedError;
  String? get assignedTo => throw _privateConstructorUsedError;
  String? get evidenceUrl => throw _privateConstructorUsedError;
  DateTime? get completedDate => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ComplianceRequirementCopyWith<ComplianceRequirement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComplianceRequirementCopyWith<$Res> {
  factory $ComplianceRequirementCopyWith(ComplianceRequirement value,
          $Res Function(ComplianceRequirement) then) =
      _$ComplianceRequirementCopyWithImpl<$Res, ComplianceRequirement>;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      RequirementType type,
      ComplianceStatus status,
      Priority priority,
      DateTime dueDate,
      String? assignedTo,
      String? evidenceUrl,
      DateTime? completedDate,
      String? notes,
      List<String> tags});
}

/// @nodoc
class _$ComplianceRequirementCopyWithImpl<$Res,
        $Val extends ComplianceRequirement>
    implements $ComplianceRequirementCopyWith<$Res> {
  _$ComplianceRequirementCopyWithImpl(this._value, this._then);

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
    Object? priority = null,
    Object? dueDate = null,
    Object? assignedTo = freezed,
    Object? evidenceUrl = freezed,
    Object? completedDate = freezed,
    Object? notes = freezed,
    Object? tags = null,
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
              as RequirementType,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ComplianceStatus,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as Priority,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      assignedTo: freezed == assignedTo
          ? _value.assignedTo
          : assignedTo // ignore: cast_nullable_to_non_nullable
              as String?,
      evidenceUrl: freezed == evidenceUrl
          ? _value.evidenceUrl
          : evidenceUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      completedDate: freezed == completedDate
          ? _value.completedDate
          : completedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ComplianceRequirementImplCopyWith<$Res>
    implements $ComplianceRequirementCopyWith<$Res> {
  factory _$$ComplianceRequirementImplCopyWith(
          _$ComplianceRequirementImpl value,
          $Res Function(_$ComplianceRequirementImpl) then) =
      __$$ComplianceRequirementImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      RequirementType type,
      ComplianceStatus status,
      Priority priority,
      DateTime dueDate,
      String? assignedTo,
      String? evidenceUrl,
      DateTime? completedDate,
      String? notes,
      List<String> tags});
}

/// @nodoc
class __$$ComplianceRequirementImplCopyWithImpl<$Res>
    extends _$ComplianceRequirementCopyWithImpl<$Res,
        _$ComplianceRequirementImpl>
    implements _$$ComplianceRequirementImplCopyWith<$Res> {
  __$$ComplianceRequirementImplCopyWithImpl(_$ComplianceRequirementImpl _value,
      $Res Function(_$ComplianceRequirementImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? type = null,
    Object? status = null,
    Object? priority = null,
    Object? dueDate = null,
    Object? assignedTo = freezed,
    Object? evidenceUrl = freezed,
    Object? completedDate = freezed,
    Object? notes = freezed,
    Object? tags = null,
  }) {
    return _then(_$ComplianceRequirementImpl(
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
              as RequirementType,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ComplianceStatus,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as Priority,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      assignedTo: freezed == assignedTo
          ? _value.assignedTo
          : assignedTo // ignore: cast_nullable_to_non_nullable
              as String?,
      evidenceUrl: freezed == evidenceUrl
          ? _value.evidenceUrl
          : evidenceUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      completedDate: freezed == completedDate
          ? _value.completedDate
          : completedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ComplianceRequirementImpl implements _ComplianceRequirement {
  const _$ComplianceRequirementImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.type,
      required this.status,
      required this.priority,
      required this.dueDate,
      this.assignedTo,
      this.evidenceUrl,
      this.completedDate,
      this.notes,
      final List<String> tags = const []})
      : _tags = tags;

  factory _$ComplianceRequirementImpl.fromJson(Map<String, dynamic> json) =>
      _$$ComplianceRequirementImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final RequirementType type;
  @override
  final ComplianceStatus status;
  @override
  final Priority priority;
  @override
  final DateTime dueDate;
  @override
  final String? assignedTo;
  @override
  final String? evidenceUrl;
  @override
  final DateTime? completedDate;
  @override
  final String? notes;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  String toString() {
    return 'ComplianceRequirement(id: $id, title: $title, description: $description, type: $type, status: $status, priority: $priority, dueDate: $dueDate, assignedTo: $assignedTo, evidenceUrl: $evidenceUrl, completedDate: $completedDate, notes: $notes, tags: $tags)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComplianceRequirementImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.assignedTo, assignedTo) ||
                other.assignedTo == assignedTo) &&
            (identical(other.evidenceUrl, evidenceUrl) ||
                other.evidenceUrl == evidenceUrl) &&
            (identical(other.completedDate, completedDate) ||
                other.completedDate == completedDate) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
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
      priority,
      dueDate,
      assignedTo,
      evidenceUrl,
      completedDate,
      notes,
      const DeepCollectionEquality().hash(_tags));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ComplianceRequirementImplCopyWith<_$ComplianceRequirementImpl>
      get copyWith => __$$ComplianceRequirementImplCopyWithImpl<
          _$ComplianceRequirementImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ComplianceRequirementImplToJson(
      this,
    );
  }
}

abstract class _ComplianceRequirement implements ComplianceRequirement {
  const factory _ComplianceRequirement(
      {required final String id,
      required final String title,
      required final String description,
      required final RequirementType type,
      required final ComplianceStatus status,
      required final Priority priority,
      required final DateTime dueDate,
      final String? assignedTo,
      final String? evidenceUrl,
      final DateTime? completedDate,
      final String? notes,
      final List<String> tags}) = _$ComplianceRequirementImpl;

  factory _ComplianceRequirement.fromJson(Map<String, dynamic> json) =
      _$ComplianceRequirementImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  RequirementType get type;
  @override
  ComplianceStatus get status;
  @override
  Priority get priority;
  @override
  DateTime get dueDate;
  @override
  String? get assignedTo;
  @override
  String? get evidenceUrl;
  @override
  DateTime? get completedDate;
  @override
  String? get notes;
  @override
  List<String> get tags;
  @override
  @JsonKey(ignore: true)
  _$$ComplianceRequirementImplCopyWith<_$ComplianceRequirementImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ComplianceFinding _$ComplianceFindingFromJson(Map<String, dynamic> json) {
  return _ComplianceFinding.fromJson(json);
}

/// @nodoc
mixin _$ComplianceFinding {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  FindingSeverity get severity => throw _privateConstructorUsedError;
  FindingType get type => throw _privateConstructorUsedError;
  FindingStatus get status => throw _privateConstructorUsedError;
  DateTime get discoveredAt => throw _privateConstructorUsedError;
  String? get discoveredBy => throw _privateConstructorUsedError;
  DateTime? get resolvedAt => throw _privateConstructorUsedError;
  String? get resolvedBy => throw _privateConstructorUsedError;
  String? get resolution => throw _privateConstructorUsedError;
  List<String> get affectedSystems => throw _privateConstructorUsedError;
  List<String> get evidenceUrls => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ComplianceFindingCopyWith<ComplianceFinding> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComplianceFindingCopyWith<$Res> {
  factory $ComplianceFindingCopyWith(
          ComplianceFinding value, $Res Function(ComplianceFinding) then) =
      _$ComplianceFindingCopyWithImpl<$Res, ComplianceFinding>;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      FindingSeverity severity,
      FindingType type,
      FindingStatus status,
      DateTime discoveredAt,
      String? discoveredBy,
      DateTime? resolvedAt,
      String? resolvedBy,
      String? resolution,
      List<String> affectedSystems,
      List<String> evidenceUrls,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class _$ComplianceFindingCopyWithImpl<$Res, $Val extends ComplianceFinding>
    implements $ComplianceFindingCopyWith<$Res> {
  _$ComplianceFindingCopyWithImpl(this._value, this._then);

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
    Object? severity = null,
    Object? type = null,
    Object? status = null,
    Object? discoveredAt = null,
    Object? discoveredBy = freezed,
    Object? resolvedAt = freezed,
    Object? resolvedBy = freezed,
    Object? resolution = freezed,
    Object? affectedSystems = null,
    Object? evidenceUrls = null,
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
      severity: null == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as FindingSeverity,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FindingType,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FindingStatus,
      discoveredAt: null == discoveredAt
          ? _value.discoveredAt
          : discoveredAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      discoveredBy: freezed == discoveredBy
          ? _value.discoveredBy
          : discoveredBy // ignore: cast_nullable_to_non_nullable
              as String?,
      resolvedAt: freezed == resolvedAt
          ? _value.resolvedAt
          : resolvedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      resolvedBy: freezed == resolvedBy
          ? _value.resolvedBy
          : resolvedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      resolution: freezed == resolution
          ? _value.resolution
          : resolution // ignore: cast_nullable_to_non_nullable
              as String?,
      affectedSystems: null == affectedSystems
          ? _value.affectedSystems
          : affectedSystems // ignore: cast_nullable_to_non_nullable
              as List<String>,
      evidenceUrls: null == evidenceUrls
          ? _value.evidenceUrls
          : evidenceUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ComplianceFindingImplCopyWith<$Res>
    implements $ComplianceFindingCopyWith<$Res> {
  factory _$$ComplianceFindingImplCopyWith(_$ComplianceFindingImpl value,
          $Res Function(_$ComplianceFindingImpl) then) =
      __$$ComplianceFindingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      FindingSeverity severity,
      FindingType type,
      FindingStatus status,
      DateTime discoveredAt,
      String? discoveredBy,
      DateTime? resolvedAt,
      String? resolvedBy,
      String? resolution,
      List<String> affectedSystems,
      List<String> evidenceUrls,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class __$$ComplianceFindingImplCopyWithImpl<$Res>
    extends _$ComplianceFindingCopyWithImpl<$Res, _$ComplianceFindingImpl>
    implements _$$ComplianceFindingImplCopyWith<$Res> {
  __$$ComplianceFindingImplCopyWithImpl(_$ComplianceFindingImpl _value,
      $Res Function(_$ComplianceFindingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? severity = null,
    Object? type = null,
    Object? status = null,
    Object? discoveredAt = null,
    Object? discoveredBy = freezed,
    Object? resolvedAt = freezed,
    Object? resolvedBy = freezed,
    Object? resolution = freezed,
    Object? affectedSystems = null,
    Object? evidenceUrls = null,
    Object? metadata = freezed,
  }) {
    return _then(_$ComplianceFindingImpl(
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
      severity: null == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as FindingSeverity,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FindingType,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FindingStatus,
      discoveredAt: null == discoveredAt
          ? _value.discoveredAt
          : discoveredAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      discoveredBy: freezed == discoveredBy
          ? _value.discoveredBy
          : discoveredBy // ignore: cast_nullable_to_non_nullable
              as String?,
      resolvedAt: freezed == resolvedAt
          ? _value.resolvedAt
          : resolvedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      resolvedBy: freezed == resolvedBy
          ? _value.resolvedBy
          : resolvedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      resolution: freezed == resolution
          ? _value.resolution
          : resolution // ignore: cast_nullable_to_non_nullable
              as String?,
      affectedSystems: null == affectedSystems
          ? _value._affectedSystems
          : affectedSystems // ignore: cast_nullable_to_non_nullable
              as List<String>,
      evidenceUrls: null == evidenceUrls
          ? _value._evidenceUrls
          : evidenceUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ComplianceFindingImpl implements _ComplianceFinding {
  const _$ComplianceFindingImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.severity,
      required this.type,
      required this.status,
      required this.discoveredAt,
      this.discoveredBy,
      this.resolvedAt,
      this.resolvedBy,
      this.resolution,
      final List<String> affectedSystems = const [],
      final List<String> evidenceUrls = const [],
      final Map<String, dynamic>? metadata})
      : _affectedSystems = affectedSystems,
        _evidenceUrls = evidenceUrls,
        _metadata = metadata;

  factory _$ComplianceFindingImpl.fromJson(Map<String, dynamic> json) =>
      _$$ComplianceFindingImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final FindingSeverity severity;
  @override
  final FindingType type;
  @override
  final FindingStatus status;
  @override
  final DateTime discoveredAt;
  @override
  final String? discoveredBy;
  @override
  final DateTime? resolvedAt;
  @override
  final String? resolvedBy;
  @override
  final String? resolution;
  final List<String> _affectedSystems;
  @override
  @JsonKey()
  List<String> get affectedSystems {
    if (_affectedSystems is EqualUnmodifiableListView) return _affectedSystems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_affectedSystems);
  }

  final List<String> _evidenceUrls;
  @override
  @JsonKey()
  List<String> get evidenceUrls {
    if (_evidenceUrls is EqualUnmodifiableListView) return _evidenceUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_evidenceUrls);
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
    return 'ComplianceFinding(id: $id, title: $title, description: $description, severity: $severity, type: $type, status: $status, discoveredAt: $discoveredAt, discoveredBy: $discoveredBy, resolvedAt: $resolvedAt, resolvedBy: $resolvedBy, resolution: $resolution, affectedSystems: $affectedSystems, evidenceUrls: $evidenceUrls, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComplianceFindingImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.severity, severity) ||
                other.severity == severity) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.discoveredAt, discoveredAt) ||
                other.discoveredAt == discoveredAt) &&
            (identical(other.discoveredBy, discoveredBy) ||
                other.discoveredBy == discoveredBy) &&
            (identical(other.resolvedAt, resolvedAt) ||
                other.resolvedAt == resolvedAt) &&
            (identical(other.resolvedBy, resolvedBy) ||
                other.resolvedBy == resolvedBy) &&
            (identical(other.resolution, resolution) ||
                other.resolution == resolution) &&
            const DeepCollectionEquality()
                .equals(other._affectedSystems, _affectedSystems) &&
            const DeepCollectionEquality()
                .equals(other._evidenceUrls, _evidenceUrls) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      severity,
      type,
      status,
      discoveredAt,
      discoveredBy,
      resolvedAt,
      resolvedBy,
      resolution,
      const DeepCollectionEquality().hash(_affectedSystems),
      const DeepCollectionEquality().hash(_evidenceUrls),
      const DeepCollectionEquality().hash(_metadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ComplianceFindingImplCopyWith<_$ComplianceFindingImpl> get copyWith =>
      __$$ComplianceFindingImplCopyWithImpl<_$ComplianceFindingImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ComplianceFindingImplToJson(
      this,
    );
  }
}

abstract class _ComplianceFinding implements ComplianceFinding {
  const factory _ComplianceFinding(
      {required final String id,
      required final String title,
      required final String description,
      required final FindingSeverity severity,
      required final FindingType type,
      required final FindingStatus status,
      required final DateTime discoveredAt,
      final String? discoveredBy,
      final DateTime? resolvedAt,
      final String? resolvedBy,
      final String? resolution,
      final List<String> affectedSystems,
      final List<String> evidenceUrls,
      final Map<String, dynamic>? metadata}) = _$ComplianceFindingImpl;

  factory _ComplianceFinding.fromJson(Map<String, dynamic> json) =
      _$ComplianceFindingImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  FindingSeverity get severity;
  @override
  FindingType get type;
  @override
  FindingStatus get status;
  @override
  DateTime get discoveredAt;
  @override
  String? get discoveredBy;
  @override
  DateTime? get resolvedAt;
  @override
  String? get resolvedBy;
  @override
  String? get resolution;
  @override
  List<String> get affectedSystems;
  @override
  List<String> get evidenceUrls;
  @override
  Map<String, dynamic>? get metadata;
  @override
  @JsonKey(ignore: true)
  _$$ComplianceFindingImplCopyWith<_$ComplianceFindingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DataRetentionPolicy _$DataRetentionPolicyFromJson(Map<String, dynamic> json) {
  return _DataRetentionPolicy.fromJson(json);
}

/// @nodoc
mixin _$DataRetentionPolicy {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DataCategory get dataCategory => throw _privateConstructorUsedError;
  Duration get retentionPeriod => throw _privateConstructorUsedError;
  RetentionAction get actionAfterExpiry => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  List<String> get applicableRegions => throw _privateConstructorUsedError;
  List<String> get exemptions => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataRetentionPolicyCopyWith<DataRetentionPolicy> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataRetentionPolicyCopyWith<$Res> {
  factory $DataRetentionPolicyCopyWith(
          DataRetentionPolicy value, $Res Function(DataRetentionPolicy) then) =
      _$DataRetentionPolicyCopyWithImpl<$Res, DataRetentionPolicy>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      DataCategory dataCategory,
      Duration retentionPeriod,
      RetentionAction actionAfterExpiry,
      bool isActive,
      List<String> applicableRegions,
      List<String> exemptions,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$DataRetentionPolicyCopyWithImpl<$Res, $Val extends DataRetentionPolicy>
    implements $DataRetentionPolicyCopyWith<$Res> {
  _$DataRetentionPolicyCopyWithImpl(this._value, this._then);

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
    Object? dataCategory = null,
    Object? retentionPeriod = null,
    Object? actionAfterExpiry = null,
    Object? isActive = null,
    Object? applicableRegions = null,
    Object? exemptions = null,
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
      dataCategory: null == dataCategory
          ? _value.dataCategory
          : dataCategory // ignore: cast_nullable_to_non_nullable
              as DataCategory,
      retentionPeriod: null == retentionPeriod
          ? _value.retentionPeriod
          : retentionPeriod // ignore: cast_nullable_to_non_nullable
              as Duration,
      actionAfterExpiry: null == actionAfterExpiry
          ? _value.actionAfterExpiry
          : actionAfterExpiry // ignore: cast_nullable_to_non_nullable
              as RetentionAction,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      applicableRegions: null == applicableRegions
          ? _value.applicableRegions
          : applicableRegions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      exemptions: null == exemptions
          ? _value.exemptions
          : exemptions // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
abstract class _$$DataRetentionPolicyImplCopyWith<$Res>
    implements $DataRetentionPolicyCopyWith<$Res> {
  factory _$$DataRetentionPolicyImplCopyWith(_$DataRetentionPolicyImpl value,
          $Res Function(_$DataRetentionPolicyImpl) then) =
      __$$DataRetentionPolicyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      DataCategory dataCategory,
      Duration retentionPeriod,
      RetentionAction actionAfterExpiry,
      bool isActive,
      List<String> applicableRegions,
      List<String> exemptions,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$DataRetentionPolicyImplCopyWithImpl<$Res>
    extends _$DataRetentionPolicyCopyWithImpl<$Res, _$DataRetentionPolicyImpl>
    implements _$$DataRetentionPolicyImplCopyWith<$Res> {
  __$$DataRetentionPolicyImplCopyWithImpl(_$DataRetentionPolicyImpl _value,
      $Res Function(_$DataRetentionPolicyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? dataCategory = null,
    Object? retentionPeriod = null,
    Object? actionAfterExpiry = null,
    Object? isActive = null,
    Object? applicableRegions = null,
    Object? exemptions = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$DataRetentionPolicyImpl(
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
      dataCategory: null == dataCategory
          ? _value.dataCategory
          : dataCategory // ignore: cast_nullable_to_non_nullable
              as DataCategory,
      retentionPeriod: null == retentionPeriod
          ? _value.retentionPeriod
          : retentionPeriod // ignore: cast_nullable_to_non_nullable
              as Duration,
      actionAfterExpiry: null == actionAfterExpiry
          ? _value.actionAfterExpiry
          : actionAfterExpiry // ignore: cast_nullable_to_non_nullable
              as RetentionAction,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      applicableRegions: null == applicableRegions
          ? _value._applicableRegions
          : applicableRegions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      exemptions: null == exemptions
          ? _value._exemptions
          : exemptions // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
class _$DataRetentionPolicyImpl implements _DataRetentionPolicy {
  const _$DataRetentionPolicyImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.dataCategory,
      required this.retentionPeriod,
      required this.actionAfterExpiry,
      required this.isActive,
      final List<String> applicableRegions = const [],
      final List<String> exemptions = const [],
      this.createdAt,
      this.updatedAt})
      : _applicableRegions = applicableRegions,
        _exemptions = exemptions;

  factory _$DataRetentionPolicyImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataRetentionPolicyImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final DataCategory dataCategory;
  @override
  final Duration retentionPeriod;
  @override
  final RetentionAction actionAfterExpiry;
  @override
  final bool isActive;
  final List<String> _applicableRegions;
  @override
  @JsonKey()
  List<String> get applicableRegions {
    if (_applicableRegions is EqualUnmodifiableListView)
      return _applicableRegions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_applicableRegions);
  }

  final List<String> _exemptions;
  @override
  @JsonKey()
  List<String> get exemptions {
    if (_exemptions is EqualUnmodifiableListView) return _exemptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exemptions);
  }

  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'DataRetentionPolicy(id: $id, name: $name, description: $description, dataCategory: $dataCategory, retentionPeriod: $retentionPeriod, actionAfterExpiry: $actionAfterExpiry, isActive: $isActive, applicableRegions: $applicableRegions, exemptions: $exemptions, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataRetentionPolicyImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.dataCategory, dataCategory) ||
                other.dataCategory == dataCategory) &&
            (identical(other.retentionPeriod, retentionPeriod) ||
                other.retentionPeriod == retentionPeriod) &&
            (identical(other.actionAfterExpiry, actionAfterExpiry) ||
                other.actionAfterExpiry == actionAfterExpiry) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            const DeepCollectionEquality()
                .equals(other._applicableRegions, _applicableRegions) &&
            const DeepCollectionEquality()
                .equals(other._exemptions, _exemptions) &&
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
      dataCategory,
      retentionPeriod,
      actionAfterExpiry,
      isActive,
      const DeepCollectionEquality().hash(_applicableRegions),
      const DeepCollectionEquality().hash(_exemptions),
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataRetentionPolicyImplCopyWith<_$DataRetentionPolicyImpl> get copyWith =>
      __$$DataRetentionPolicyImplCopyWithImpl<_$DataRetentionPolicyImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataRetentionPolicyImplToJson(
      this,
    );
  }
}

abstract class _DataRetentionPolicy implements DataRetentionPolicy {
  const factory _DataRetentionPolicy(
      {required final String id,
      required final String name,
      required final String description,
      required final DataCategory dataCategory,
      required final Duration retentionPeriod,
      required final RetentionAction actionAfterExpiry,
      required final bool isActive,
      final List<String> applicableRegions,
      final List<String> exemptions,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$DataRetentionPolicyImpl;

  factory _DataRetentionPolicy.fromJson(Map<String, dynamic> json) =
      _$DataRetentionPolicyImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  DataCategory get dataCategory;
  @override
  Duration get retentionPeriod;
  @override
  RetentionAction get actionAfterExpiry;
  @override
  bool get isActive;
  @override
  List<String> get applicableRegions;
  @override
  List<String> get exemptions;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$DataRetentionPolicyImplCopyWith<_$DataRetentionPolicyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PrivacyImpactAssessment _$PrivacyImpactAssessmentFromJson(
    Map<String, dynamic> json) {
  return _PrivacyImpactAssessment.fromJson(json);
}

/// @nodoc
mixin _$PrivacyImpactAssessment {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get projectId => throw _privateConstructorUsedError;
  PIAStatus get status => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime? get completedDate => throw _privateConstructorUsedError;
  String get conductedBy => throw _privateConstructorUsedError;
  List<DataProcessingActivity> get dataProcessingActivities =>
      throw _privateConstructorUsedError;
  List<PrivacyRisk> get identifiedRisks => throw _privateConstructorUsedError;
  List<Mitigation> get mitigationMeasures => throw _privateConstructorUsedError;
  String? get conclusion => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PrivacyImpactAssessmentCopyWith<PrivacyImpactAssessment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrivacyImpactAssessmentCopyWith<$Res> {
  factory $PrivacyImpactAssessmentCopyWith(PrivacyImpactAssessment value,
          $Res Function(PrivacyImpactAssessment) then) =
      _$PrivacyImpactAssessmentCopyWithImpl<$Res, PrivacyImpactAssessment>;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      String projectId,
      PIAStatus status,
      DateTime startDate,
      DateTime? completedDate,
      String conductedBy,
      List<DataProcessingActivity> dataProcessingActivities,
      List<PrivacyRisk> identifiedRisks,
      List<Mitigation> mitigationMeasures,
      String? conclusion,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class _$PrivacyImpactAssessmentCopyWithImpl<$Res,
        $Val extends PrivacyImpactAssessment>
    implements $PrivacyImpactAssessmentCopyWith<$Res> {
  _$PrivacyImpactAssessmentCopyWithImpl(this._value, this._then);

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
    Object? projectId = null,
    Object? status = null,
    Object? startDate = null,
    Object? completedDate = freezed,
    Object? conductedBy = null,
    Object? dataProcessingActivities = null,
    Object? identifiedRisks = null,
    Object? mitigationMeasures = null,
    Object? conclusion = freezed,
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
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PIAStatus,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      completedDate: freezed == completedDate
          ? _value.completedDate
          : completedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      conductedBy: null == conductedBy
          ? _value.conductedBy
          : conductedBy // ignore: cast_nullable_to_non_nullable
              as String,
      dataProcessingActivities: null == dataProcessingActivities
          ? _value.dataProcessingActivities
          : dataProcessingActivities // ignore: cast_nullable_to_non_nullable
              as List<DataProcessingActivity>,
      identifiedRisks: null == identifiedRisks
          ? _value.identifiedRisks
          : identifiedRisks // ignore: cast_nullable_to_non_nullable
              as List<PrivacyRisk>,
      mitigationMeasures: null == mitigationMeasures
          ? _value.mitigationMeasures
          : mitigationMeasures // ignore: cast_nullable_to_non_nullable
              as List<Mitigation>,
      conclusion: freezed == conclusion
          ? _value.conclusion
          : conclusion // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PrivacyImpactAssessmentImplCopyWith<$Res>
    implements $PrivacyImpactAssessmentCopyWith<$Res> {
  factory _$$PrivacyImpactAssessmentImplCopyWith(
          _$PrivacyImpactAssessmentImpl value,
          $Res Function(_$PrivacyImpactAssessmentImpl) then) =
      __$$PrivacyImpactAssessmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      String projectId,
      PIAStatus status,
      DateTime startDate,
      DateTime? completedDate,
      String conductedBy,
      List<DataProcessingActivity> dataProcessingActivities,
      List<PrivacyRisk> identifiedRisks,
      List<Mitigation> mitigationMeasures,
      String? conclusion,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class __$$PrivacyImpactAssessmentImplCopyWithImpl<$Res>
    extends _$PrivacyImpactAssessmentCopyWithImpl<$Res,
        _$PrivacyImpactAssessmentImpl>
    implements _$$PrivacyImpactAssessmentImplCopyWith<$Res> {
  __$$PrivacyImpactAssessmentImplCopyWithImpl(
      _$PrivacyImpactAssessmentImpl _value,
      $Res Function(_$PrivacyImpactAssessmentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? projectId = null,
    Object? status = null,
    Object? startDate = null,
    Object? completedDate = freezed,
    Object? conductedBy = null,
    Object? dataProcessingActivities = null,
    Object? identifiedRisks = null,
    Object? mitigationMeasures = null,
    Object? conclusion = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_$PrivacyImpactAssessmentImpl(
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
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PIAStatus,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      completedDate: freezed == completedDate
          ? _value.completedDate
          : completedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      conductedBy: null == conductedBy
          ? _value.conductedBy
          : conductedBy // ignore: cast_nullable_to_non_nullable
              as String,
      dataProcessingActivities: null == dataProcessingActivities
          ? _value._dataProcessingActivities
          : dataProcessingActivities // ignore: cast_nullable_to_non_nullable
              as List<DataProcessingActivity>,
      identifiedRisks: null == identifiedRisks
          ? _value._identifiedRisks
          : identifiedRisks // ignore: cast_nullable_to_non_nullable
              as List<PrivacyRisk>,
      mitigationMeasures: null == mitigationMeasures
          ? _value._mitigationMeasures
          : mitigationMeasures // ignore: cast_nullable_to_non_nullable
              as List<Mitigation>,
      conclusion: freezed == conclusion
          ? _value.conclusion
          : conclusion // ignore: cast_nullable_to_non_nullable
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
class _$PrivacyImpactAssessmentImpl implements _PrivacyImpactAssessment {
  const _$PrivacyImpactAssessmentImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.projectId,
      required this.status,
      required this.startDate,
      this.completedDate,
      required this.conductedBy,
      final List<DataProcessingActivity> dataProcessingActivities = const [],
      final List<PrivacyRisk> identifiedRisks = const [],
      final List<Mitigation> mitigationMeasures = const [],
      this.conclusion,
      final Map<String, dynamic>? metadata})
      : _dataProcessingActivities = dataProcessingActivities,
        _identifiedRisks = identifiedRisks,
        _mitigationMeasures = mitigationMeasures,
        _metadata = metadata;

  factory _$PrivacyImpactAssessmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrivacyImpactAssessmentImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String projectId;
  @override
  final PIAStatus status;
  @override
  final DateTime startDate;
  @override
  final DateTime? completedDate;
  @override
  final String conductedBy;
  final List<DataProcessingActivity> _dataProcessingActivities;
  @override
  @JsonKey()
  List<DataProcessingActivity> get dataProcessingActivities {
    if (_dataProcessingActivities is EqualUnmodifiableListView)
      return _dataProcessingActivities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dataProcessingActivities);
  }

  final List<PrivacyRisk> _identifiedRisks;
  @override
  @JsonKey()
  List<PrivacyRisk> get identifiedRisks {
    if (_identifiedRisks is EqualUnmodifiableListView) return _identifiedRisks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_identifiedRisks);
  }

  final List<Mitigation> _mitigationMeasures;
  @override
  @JsonKey()
  List<Mitigation> get mitigationMeasures {
    if (_mitigationMeasures is EqualUnmodifiableListView)
      return _mitigationMeasures;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mitigationMeasures);
  }

  @override
  final String? conclusion;
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
    return 'PrivacyImpactAssessment(id: $id, title: $title, description: $description, projectId: $projectId, status: $status, startDate: $startDate, completedDate: $completedDate, conductedBy: $conductedBy, dataProcessingActivities: $dataProcessingActivities, identifiedRisks: $identifiedRisks, mitigationMeasures: $mitigationMeasures, conclusion: $conclusion, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrivacyImpactAssessmentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.completedDate, completedDate) ||
                other.completedDate == completedDate) &&
            (identical(other.conductedBy, conductedBy) ||
                other.conductedBy == conductedBy) &&
            const DeepCollectionEquality().equals(
                other._dataProcessingActivities, _dataProcessingActivities) &&
            const DeepCollectionEquality()
                .equals(other._identifiedRisks, _identifiedRisks) &&
            const DeepCollectionEquality()
                .equals(other._mitigationMeasures, _mitigationMeasures) &&
            (identical(other.conclusion, conclusion) ||
                other.conclusion == conclusion) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      projectId,
      status,
      startDate,
      completedDate,
      conductedBy,
      const DeepCollectionEquality().hash(_dataProcessingActivities),
      const DeepCollectionEquality().hash(_identifiedRisks),
      const DeepCollectionEquality().hash(_mitigationMeasures),
      conclusion,
      const DeepCollectionEquality().hash(_metadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PrivacyImpactAssessmentImplCopyWith<_$PrivacyImpactAssessmentImpl>
      get copyWith => __$$PrivacyImpactAssessmentImplCopyWithImpl<
          _$PrivacyImpactAssessmentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PrivacyImpactAssessmentImplToJson(
      this,
    );
  }
}

abstract class _PrivacyImpactAssessment implements PrivacyImpactAssessment {
  const factory _PrivacyImpactAssessment(
      {required final String id,
      required final String title,
      required final String description,
      required final String projectId,
      required final PIAStatus status,
      required final DateTime startDate,
      final DateTime? completedDate,
      required final String conductedBy,
      final List<DataProcessingActivity> dataProcessingActivities,
      final List<PrivacyRisk> identifiedRisks,
      final List<Mitigation> mitigationMeasures,
      final String? conclusion,
      final Map<String, dynamic>? metadata}) = _$PrivacyImpactAssessmentImpl;

  factory _PrivacyImpactAssessment.fromJson(Map<String, dynamic> json) =
      _$PrivacyImpactAssessmentImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  String get projectId;
  @override
  PIAStatus get status;
  @override
  DateTime get startDate;
  @override
  DateTime? get completedDate;
  @override
  String get conductedBy;
  @override
  List<DataProcessingActivity> get dataProcessingActivities;
  @override
  List<PrivacyRisk> get identifiedRisks;
  @override
  List<Mitigation> get mitigationMeasures;
  @override
  String? get conclusion;
  @override
  Map<String, dynamic>? get metadata;
  @override
  @JsonKey(ignore: true)
  _$$PrivacyImpactAssessmentImplCopyWith<_$PrivacyImpactAssessmentImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DataProcessingActivity _$DataProcessingActivityFromJson(
    Map<String, dynamic> json) {
  return _DataProcessingActivity.fromJson(json);
}

/// @nodoc
mixin _$DataProcessingActivity {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get purpose => throw _privateConstructorUsedError;
  LegalBasis get legalBasis => throw _privateConstructorUsedError;
  List<String> get dataTypes => throw _privateConstructorUsedError;
  List<String> get dataSubjects => throw _privateConstructorUsedError;
  List<String> get recipients => throw _privateConstructorUsedError;
  Duration? get retentionPeriod => throw _privateConstructorUsedError;
  bool? get isAutomatedDecisionMaking => throw _privateConstructorUsedError;
  String? get transferMechanism => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataProcessingActivityCopyWith<DataProcessingActivity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataProcessingActivityCopyWith<$Res> {
  factory $DataProcessingActivityCopyWith(DataProcessingActivity value,
          $Res Function(DataProcessingActivity) then) =
      _$DataProcessingActivityCopyWithImpl<$Res, DataProcessingActivity>;
  @useResult
  $Res call(
      {String id,
      String name,
      String purpose,
      LegalBasis legalBasis,
      List<String> dataTypes,
      List<String> dataSubjects,
      List<String> recipients,
      Duration? retentionPeriod,
      bool? isAutomatedDecisionMaking,
      String? transferMechanism});
}

/// @nodoc
class _$DataProcessingActivityCopyWithImpl<$Res,
        $Val extends DataProcessingActivity>
    implements $DataProcessingActivityCopyWith<$Res> {
  _$DataProcessingActivityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? purpose = null,
    Object? legalBasis = null,
    Object? dataTypes = null,
    Object? dataSubjects = null,
    Object? recipients = null,
    Object? retentionPeriod = freezed,
    Object? isAutomatedDecisionMaking = freezed,
    Object? transferMechanism = freezed,
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
      purpose: null == purpose
          ? _value.purpose
          : purpose // ignore: cast_nullable_to_non_nullable
              as String,
      legalBasis: null == legalBasis
          ? _value.legalBasis
          : legalBasis // ignore: cast_nullable_to_non_nullable
              as LegalBasis,
      dataTypes: null == dataTypes
          ? _value.dataTypes
          : dataTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      dataSubjects: null == dataSubjects
          ? _value.dataSubjects
          : dataSubjects // ignore: cast_nullable_to_non_nullable
              as List<String>,
      recipients: null == recipients
          ? _value.recipients
          : recipients // ignore: cast_nullable_to_non_nullable
              as List<String>,
      retentionPeriod: freezed == retentionPeriod
          ? _value.retentionPeriod
          : retentionPeriod // ignore: cast_nullable_to_non_nullable
              as Duration?,
      isAutomatedDecisionMaking: freezed == isAutomatedDecisionMaking
          ? _value.isAutomatedDecisionMaking
          : isAutomatedDecisionMaking // ignore: cast_nullable_to_non_nullable
              as bool?,
      transferMechanism: freezed == transferMechanism
          ? _value.transferMechanism
          : transferMechanism // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataProcessingActivityImplCopyWith<$Res>
    implements $DataProcessingActivityCopyWith<$Res> {
  factory _$$DataProcessingActivityImplCopyWith(
          _$DataProcessingActivityImpl value,
          $Res Function(_$DataProcessingActivityImpl) then) =
      __$$DataProcessingActivityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String purpose,
      LegalBasis legalBasis,
      List<String> dataTypes,
      List<String> dataSubjects,
      List<String> recipients,
      Duration? retentionPeriod,
      bool? isAutomatedDecisionMaking,
      String? transferMechanism});
}

/// @nodoc
class __$$DataProcessingActivityImplCopyWithImpl<$Res>
    extends _$DataProcessingActivityCopyWithImpl<$Res,
        _$DataProcessingActivityImpl>
    implements _$$DataProcessingActivityImplCopyWith<$Res> {
  __$$DataProcessingActivityImplCopyWithImpl(
      _$DataProcessingActivityImpl _value,
      $Res Function(_$DataProcessingActivityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? purpose = null,
    Object? legalBasis = null,
    Object? dataTypes = null,
    Object? dataSubjects = null,
    Object? recipients = null,
    Object? retentionPeriod = freezed,
    Object? isAutomatedDecisionMaking = freezed,
    Object? transferMechanism = freezed,
  }) {
    return _then(_$DataProcessingActivityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      purpose: null == purpose
          ? _value.purpose
          : purpose // ignore: cast_nullable_to_non_nullable
              as String,
      legalBasis: null == legalBasis
          ? _value.legalBasis
          : legalBasis // ignore: cast_nullable_to_non_nullable
              as LegalBasis,
      dataTypes: null == dataTypes
          ? _value._dataTypes
          : dataTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      dataSubjects: null == dataSubjects
          ? _value._dataSubjects
          : dataSubjects // ignore: cast_nullable_to_non_nullable
              as List<String>,
      recipients: null == recipients
          ? _value._recipients
          : recipients // ignore: cast_nullable_to_non_nullable
              as List<String>,
      retentionPeriod: freezed == retentionPeriod
          ? _value.retentionPeriod
          : retentionPeriod // ignore: cast_nullable_to_non_nullable
              as Duration?,
      isAutomatedDecisionMaking: freezed == isAutomatedDecisionMaking
          ? _value.isAutomatedDecisionMaking
          : isAutomatedDecisionMaking // ignore: cast_nullable_to_non_nullable
              as bool?,
      transferMechanism: freezed == transferMechanism
          ? _value.transferMechanism
          : transferMechanism // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataProcessingActivityImpl implements _DataProcessingActivity {
  const _$DataProcessingActivityImpl(
      {required this.id,
      required this.name,
      required this.purpose,
      required this.legalBasis,
      final List<String> dataTypes = const [],
      final List<String> dataSubjects = const [],
      final List<String> recipients = const [],
      this.retentionPeriod,
      this.isAutomatedDecisionMaking,
      this.transferMechanism})
      : _dataTypes = dataTypes,
        _dataSubjects = dataSubjects,
        _recipients = recipients;

  factory _$DataProcessingActivityImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataProcessingActivityImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String purpose;
  @override
  final LegalBasis legalBasis;
  final List<String> _dataTypes;
  @override
  @JsonKey()
  List<String> get dataTypes {
    if (_dataTypes is EqualUnmodifiableListView) return _dataTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dataTypes);
  }

  final List<String> _dataSubjects;
  @override
  @JsonKey()
  List<String> get dataSubjects {
    if (_dataSubjects is EqualUnmodifiableListView) return _dataSubjects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dataSubjects);
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
  final Duration? retentionPeriod;
  @override
  final bool? isAutomatedDecisionMaking;
  @override
  final String? transferMechanism;

  @override
  String toString() {
    return 'DataProcessingActivity(id: $id, name: $name, purpose: $purpose, legalBasis: $legalBasis, dataTypes: $dataTypes, dataSubjects: $dataSubjects, recipients: $recipients, retentionPeriod: $retentionPeriod, isAutomatedDecisionMaking: $isAutomatedDecisionMaking, transferMechanism: $transferMechanism)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataProcessingActivityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.purpose, purpose) || other.purpose == purpose) &&
            (identical(other.legalBasis, legalBasis) ||
                other.legalBasis == legalBasis) &&
            const DeepCollectionEquality()
                .equals(other._dataTypes, _dataTypes) &&
            const DeepCollectionEquality()
                .equals(other._dataSubjects, _dataSubjects) &&
            const DeepCollectionEquality()
                .equals(other._recipients, _recipients) &&
            (identical(other.retentionPeriod, retentionPeriod) ||
                other.retentionPeriod == retentionPeriod) &&
            (identical(other.isAutomatedDecisionMaking,
                    isAutomatedDecisionMaking) ||
                other.isAutomatedDecisionMaking == isAutomatedDecisionMaking) &&
            (identical(other.transferMechanism, transferMechanism) ||
                other.transferMechanism == transferMechanism));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      purpose,
      legalBasis,
      const DeepCollectionEquality().hash(_dataTypes),
      const DeepCollectionEquality().hash(_dataSubjects),
      const DeepCollectionEquality().hash(_recipients),
      retentionPeriod,
      isAutomatedDecisionMaking,
      transferMechanism);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataProcessingActivityImplCopyWith<_$DataProcessingActivityImpl>
      get copyWith => __$$DataProcessingActivityImplCopyWithImpl<
          _$DataProcessingActivityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataProcessingActivityImplToJson(
      this,
    );
  }
}

abstract class _DataProcessingActivity implements DataProcessingActivity {
  const factory _DataProcessingActivity(
      {required final String id,
      required final String name,
      required final String purpose,
      required final LegalBasis legalBasis,
      final List<String> dataTypes,
      final List<String> dataSubjects,
      final List<String> recipients,
      final Duration? retentionPeriod,
      final bool? isAutomatedDecisionMaking,
      final String? transferMechanism}) = _$DataProcessingActivityImpl;

  factory _DataProcessingActivity.fromJson(Map<String, dynamic> json) =
      _$DataProcessingActivityImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get purpose;
  @override
  LegalBasis get legalBasis;
  @override
  List<String> get dataTypes;
  @override
  List<String> get dataSubjects;
  @override
  List<String> get recipients;
  @override
  Duration? get retentionPeriod;
  @override
  bool? get isAutomatedDecisionMaking;
  @override
  String? get transferMechanism;
  @override
  @JsonKey(ignore: true)
  _$$DataProcessingActivityImplCopyWith<_$DataProcessingActivityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PrivacyRisk _$PrivacyRiskFromJson(Map<String, dynamic> json) {
  return _PrivacyRisk.fromJson(json);
}

/// @nodoc
mixin _$PrivacyRisk {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  RiskLevel get likelihood => throw _privateConstructorUsedError;
  RiskLevel get impact => throw _privateConstructorUsedError;
  RiskLevel get overallRisk => throw _privateConstructorUsedError;
  List<String> get affectedDataSubjects => throw _privateConstructorUsedError;
  String? get potentialHarm => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PrivacyRiskCopyWith<PrivacyRisk> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrivacyRiskCopyWith<$Res> {
  factory $PrivacyRiskCopyWith(
          PrivacyRisk value, $Res Function(PrivacyRisk) then) =
      _$PrivacyRiskCopyWithImpl<$Res, PrivacyRisk>;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      RiskLevel likelihood,
      RiskLevel impact,
      RiskLevel overallRisk,
      List<String> affectedDataSubjects,
      String? potentialHarm});
}

/// @nodoc
class _$PrivacyRiskCopyWithImpl<$Res, $Val extends PrivacyRisk>
    implements $PrivacyRiskCopyWith<$Res> {
  _$PrivacyRiskCopyWithImpl(this._value, this._then);

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
    Object? likelihood = null,
    Object? impact = null,
    Object? overallRisk = null,
    Object? affectedDataSubjects = null,
    Object? potentialHarm = freezed,
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
      likelihood: null == likelihood
          ? _value.likelihood
          : likelihood // ignore: cast_nullable_to_non_nullable
              as RiskLevel,
      impact: null == impact
          ? _value.impact
          : impact // ignore: cast_nullable_to_non_nullable
              as RiskLevel,
      overallRisk: null == overallRisk
          ? _value.overallRisk
          : overallRisk // ignore: cast_nullable_to_non_nullable
              as RiskLevel,
      affectedDataSubjects: null == affectedDataSubjects
          ? _value.affectedDataSubjects
          : affectedDataSubjects // ignore: cast_nullable_to_non_nullable
              as List<String>,
      potentialHarm: freezed == potentialHarm
          ? _value.potentialHarm
          : potentialHarm // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PrivacyRiskImplCopyWith<$Res>
    implements $PrivacyRiskCopyWith<$Res> {
  factory _$$PrivacyRiskImplCopyWith(
          _$PrivacyRiskImpl value, $Res Function(_$PrivacyRiskImpl) then) =
      __$$PrivacyRiskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      RiskLevel likelihood,
      RiskLevel impact,
      RiskLevel overallRisk,
      List<String> affectedDataSubjects,
      String? potentialHarm});
}

/// @nodoc
class __$$PrivacyRiskImplCopyWithImpl<$Res>
    extends _$PrivacyRiskCopyWithImpl<$Res, _$PrivacyRiskImpl>
    implements _$$PrivacyRiskImplCopyWith<$Res> {
  __$$PrivacyRiskImplCopyWithImpl(
      _$PrivacyRiskImpl _value, $Res Function(_$PrivacyRiskImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? likelihood = null,
    Object? impact = null,
    Object? overallRisk = null,
    Object? affectedDataSubjects = null,
    Object? potentialHarm = freezed,
  }) {
    return _then(_$PrivacyRiskImpl(
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
      likelihood: null == likelihood
          ? _value.likelihood
          : likelihood // ignore: cast_nullable_to_non_nullable
              as RiskLevel,
      impact: null == impact
          ? _value.impact
          : impact // ignore: cast_nullable_to_non_nullable
              as RiskLevel,
      overallRisk: null == overallRisk
          ? _value.overallRisk
          : overallRisk // ignore: cast_nullable_to_non_nullable
              as RiskLevel,
      affectedDataSubjects: null == affectedDataSubjects
          ? _value._affectedDataSubjects
          : affectedDataSubjects // ignore: cast_nullable_to_non_nullable
              as List<String>,
      potentialHarm: freezed == potentialHarm
          ? _value.potentialHarm
          : potentialHarm // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PrivacyRiskImpl implements _PrivacyRisk {
  const _$PrivacyRiskImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.likelihood,
      required this.impact,
      required this.overallRisk,
      final List<String> affectedDataSubjects = const [],
      this.potentialHarm})
      : _affectedDataSubjects = affectedDataSubjects;

  factory _$PrivacyRiskImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrivacyRiskImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final RiskLevel likelihood;
  @override
  final RiskLevel impact;
  @override
  final RiskLevel overallRisk;
  final List<String> _affectedDataSubjects;
  @override
  @JsonKey()
  List<String> get affectedDataSubjects {
    if (_affectedDataSubjects is EqualUnmodifiableListView)
      return _affectedDataSubjects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_affectedDataSubjects);
  }

  @override
  final String? potentialHarm;

  @override
  String toString() {
    return 'PrivacyRisk(id: $id, title: $title, description: $description, likelihood: $likelihood, impact: $impact, overallRisk: $overallRisk, affectedDataSubjects: $affectedDataSubjects, potentialHarm: $potentialHarm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrivacyRiskImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.likelihood, likelihood) ||
                other.likelihood == likelihood) &&
            (identical(other.impact, impact) || other.impact == impact) &&
            (identical(other.overallRisk, overallRisk) ||
                other.overallRisk == overallRisk) &&
            const DeepCollectionEquality()
                .equals(other._affectedDataSubjects, _affectedDataSubjects) &&
            (identical(other.potentialHarm, potentialHarm) ||
                other.potentialHarm == potentialHarm));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      likelihood,
      impact,
      overallRisk,
      const DeepCollectionEquality().hash(_affectedDataSubjects),
      potentialHarm);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PrivacyRiskImplCopyWith<_$PrivacyRiskImpl> get copyWith =>
      __$$PrivacyRiskImplCopyWithImpl<_$PrivacyRiskImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PrivacyRiskImplToJson(
      this,
    );
  }
}

abstract class _PrivacyRisk implements PrivacyRisk {
  const factory _PrivacyRisk(
      {required final String id,
      required final String title,
      required final String description,
      required final RiskLevel likelihood,
      required final RiskLevel impact,
      required final RiskLevel overallRisk,
      final List<String> affectedDataSubjects,
      final String? potentialHarm}) = _$PrivacyRiskImpl;

  factory _PrivacyRisk.fromJson(Map<String, dynamic> json) =
      _$PrivacyRiskImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  RiskLevel get likelihood;
  @override
  RiskLevel get impact;
  @override
  RiskLevel get overallRisk;
  @override
  List<String> get affectedDataSubjects;
  @override
  String? get potentialHarm;
  @override
  @JsonKey(ignore: true)
  _$$PrivacyRiskImplCopyWith<_$PrivacyRiskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Mitigation _$MitigationFromJson(Map<String, dynamic> json) {
  return _Mitigation.fromJson(json);
}

/// @nodoc
mixin _$Mitigation {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  MitigationStatus get status => throw _privateConstructorUsedError;
  String get responsiblePerson => throw _privateConstructorUsedError;
  DateTime get targetDate => throw _privateConstructorUsedError;
  DateTime? get completedDate => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MitigationCopyWith<Mitigation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MitigationCopyWith<$Res> {
  factory $MitigationCopyWith(
          Mitigation value, $Res Function(Mitigation) then) =
      _$MitigationCopyWithImpl<$Res, Mitigation>;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      MitigationStatus status,
      String responsiblePerson,
      DateTime targetDate,
      DateTime? completedDate,
      String? notes});
}

/// @nodoc
class _$MitigationCopyWithImpl<$Res, $Val extends Mitigation>
    implements $MitigationCopyWith<$Res> {
  _$MitigationCopyWithImpl(this._value, this._then);

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
    Object? status = null,
    Object? responsiblePerson = null,
    Object? targetDate = null,
    Object? completedDate = freezed,
    Object? notes = freezed,
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
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MitigationStatus,
      responsiblePerson: null == responsiblePerson
          ? _value.responsiblePerson
          : responsiblePerson // ignore: cast_nullable_to_non_nullable
              as String,
      targetDate: null == targetDate
          ? _value.targetDate
          : targetDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      completedDate: freezed == completedDate
          ? _value.completedDate
          : completedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MitigationImplCopyWith<$Res>
    implements $MitigationCopyWith<$Res> {
  factory _$$MitigationImplCopyWith(
          _$MitigationImpl value, $Res Function(_$MitigationImpl) then) =
      __$$MitigationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      MitigationStatus status,
      String responsiblePerson,
      DateTime targetDate,
      DateTime? completedDate,
      String? notes});
}

/// @nodoc
class __$$MitigationImplCopyWithImpl<$Res>
    extends _$MitigationCopyWithImpl<$Res, _$MitigationImpl>
    implements _$$MitigationImplCopyWith<$Res> {
  __$$MitigationImplCopyWithImpl(
      _$MitigationImpl _value, $Res Function(_$MitigationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? status = null,
    Object? responsiblePerson = null,
    Object? targetDate = null,
    Object? completedDate = freezed,
    Object? notes = freezed,
  }) {
    return _then(_$MitigationImpl(
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
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MitigationStatus,
      responsiblePerson: null == responsiblePerson
          ? _value.responsiblePerson
          : responsiblePerson // ignore: cast_nullable_to_non_nullable
              as String,
      targetDate: null == targetDate
          ? _value.targetDate
          : targetDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      completedDate: freezed == completedDate
          ? _value.completedDate
          : completedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MitigationImpl implements _Mitigation {
  const _$MitigationImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.status,
      required this.responsiblePerson,
      required this.targetDate,
      this.completedDate,
      this.notes});

  factory _$MitigationImpl.fromJson(Map<String, dynamic> json) =>
      _$$MitigationImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final MitigationStatus status;
  @override
  final String responsiblePerson;
  @override
  final DateTime targetDate;
  @override
  final DateTime? completedDate;
  @override
  final String? notes;

  @override
  String toString() {
    return 'Mitigation(id: $id, title: $title, description: $description, status: $status, responsiblePerson: $responsiblePerson, targetDate: $targetDate, completedDate: $completedDate, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MitigationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.responsiblePerson, responsiblePerson) ||
                other.responsiblePerson == responsiblePerson) &&
            (identical(other.targetDate, targetDate) ||
                other.targetDate == targetDate) &&
            (identical(other.completedDate, completedDate) ||
                other.completedDate == completedDate) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description, status,
      responsiblePerson, targetDate, completedDate, notes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MitigationImplCopyWith<_$MitigationImpl> get copyWith =>
      __$$MitigationImplCopyWithImpl<_$MitigationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MitigationImplToJson(
      this,
    );
  }
}

abstract class _Mitigation implements Mitigation {
  const factory _Mitigation(
      {required final String id,
      required final String title,
      required final String description,
      required final MitigationStatus status,
      required final String responsiblePerson,
      required final DateTime targetDate,
      final DateTime? completedDate,
      final String? notes}) = _$MitigationImpl;

  factory _Mitigation.fromJson(Map<String, dynamic> json) =
      _$MitigationImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  MitigationStatus get status;
  @override
  String get responsiblePerson;
  @override
  DateTime get targetDate;
  @override
  DateTime? get completedDate;
  @override
  String? get notes;
  @override
  @JsonKey(ignore: true)
  _$$MitigationImplCopyWith<_$MitigationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
