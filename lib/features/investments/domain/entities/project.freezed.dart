// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Project _$ProjectFromJson(Map<String, dynamic> json) {
  return _Project.fromJson(json);
}

/// @nodoc
mixin _$Project {
  String get id => throw _privateConstructorUsedError;
  String get organizationId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  ProjectCategory get category => throw _privateConstructorUsedError;
  ProjectStatus get status => throw _privateConstructorUsedError;
  double get fundingGoal => throw _privateConstructorUsedError;
  double get currentFunding => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;
  List<String> get documents => throw _privateConstructorUsedError;
  List<ProjectMilestone> get milestones => throw _privateConstructorUsedError;
  List<ImpactMetric> get impactMetrics => throw _privateConstructorUsedError;
  String? get videoUrl => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectCopyWith<Project> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectCopyWith<$Res> {
  factory $ProjectCopyWith(Project value, $Res Function(Project) then) =
      _$ProjectCopyWithImpl<$Res, Project>;
  @useResult
  $Res call(
      {String id,
      String organizationId,
      String name,
      String description,
      ProjectCategory category,
      ProjectStatus status,
      double fundingGoal,
      double currentFunding,
      String currency,
      DateTime startDate,
      DateTime endDate,
      String location,
      List<String> images,
      List<String> documents,
      List<ProjectMilestone> milestones,
      List<ImpactMetric> impactMetrics,
      String? videoUrl,
      Map<String, dynamic>? metadata,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$ProjectCopyWithImpl<$Res, $Val extends Project>
    implements $ProjectCopyWith<$Res> {
  _$ProjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? organizationId = null,
    Object? name = null,
    Object? description = null,
    Object? category = null,
    Object? status = null,
    Object? fundingGoal = null,
    Object? currentFunding = null,
    Object? currency = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? location = null,
    Object? images = null,
    Object? documents = null,
    Object? milestones = null,
    Object? impactMetrics = null,
    Object? videoUrl = freezed,
    Object? metadata = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
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
              as ProjectCategory,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProjectStatus,
      fundingGoal: null == fundingGoal
          ? _value.fundingGoal
          : fundingGoal // ignore: cast_nullable_to_non_nullable
              as double,
      currentFunding: null == currentFunding
          ? _value.currentFunding
          : currentFunding // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      documents: null == documents
          ? _value.documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<String>,
      milestones: null == milestones
          ? _value.milestones
          : milestones // ignore: cast_nullable_to_non_nullable
              as List<ProjectMilestone>,
      impactMetrics: null == impactMetrics
          ? _value.impactMetrics
          : impactMetrics // ignore: cast_nullable_to_non_nullable
              as List<ImpactMetric>,
      videoUrl: freezed == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
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
abstract class _$$ProjectImplCopyWith<$Res> implements $ProjectCopyWith<$Res> {
  factory _$$ProjectImplCopyWith(
          _$ProjectImpl value, $Res Function(_$ProjectImpl) then) =
      __$$ProjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String organizationId,
      String name,
      String description,
      ProjectCategory category,
      ProjectStatus status,
      double fundingGoal,
      double currentFunding,
      String currency,
      DateTime startDate,
      DateTime endDate,
      String location,
      List<String> images,
      List<String> documents,
      List<ProjectMilestone> milestones,
      List<ImpactMetric> impactMetrics,
      String? videoUrl,
      Map<String, dynamic>? metadata,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$ProjectImplCopyWithImpl<$Res>
    extends _$ProjectCopyWithImpl<$Res, _$ProjectImpl>
    implements _$$ProjectImplCopyWith<$Res> {
  __$$ProjectImplCopyWithImpl(
      _$ProjectImpl _value, $Res Function(_$ProjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? organizationId = null,
    Object? name = null,
    Object? description = null,
    Object? category = null,
    Object? status = null,
    Object? fundingGoal = null,
    Object? currentFunding = null,
    Object? currency = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? location = null,
    Object? images = null,
    Object? documents = null,
    Object? milestones = null,
    Object? impactMetrics = null,
    Object? videoUrl = freezed,
    Object? metadata = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$ProjectImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      organizationId: null == organizationId
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
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
              as ProjectCategory,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProjectStatus,
      fundingGoal: null == fundingGoal
          ? _value.fundingGoal
          : fundingGoal // ignore: cast_nullable_to_non_nullable
              as double,
      currentFunding: null == currentFunding
          ? _value.currentFunding
          : currentFunding // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      documents: null == documents
          ? _value._documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<String>,
      milestones: null == milestones
          ? _value._milestones
          : milestones // ignore: cast_nullable_to_non_nullable
              as List<ProjectMilestone>,
      impactMetrics: null == impactMetrics
          ? _value._impactMetrics
          : impactMetrics // ignore: cast_nullable_to_non_nullable
              as List<ImpactMetric>,
      videoUrl: freezed == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
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
class _$ProjectImpl implements _Project {
  const _$ProjectImpl(
      {required this.id,
      required this.organizationId,
      required this.name,
      required this.description,
      required this.category,
      required this.status,
      required this.fundingGoal,
      required this.currentFunding,
      required this.currency,
      required this.startDate,
      required this.endDate,
      required this.location,
      final List<String> images = const [],
      final List<String> documents = const [],
      final List<ProjectMilestone> milestones = const [],
      final List<ImpactMetric> impactMetrics = const [],
      this.videoUrl,
      final Map<String, dynamic>? metadata,
      this.createdAt,
      this.updatedAt})
      : _images = images,
        _documents = documents,
        _milestones = milestones,
        _impactMetrics = impactMetrics,
        _metadata = metadata;

  factory _$ProjectImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectImplFromJson(json);

  @override
  final String id;
  @override
  final String organizationId;
  @override
  final String name;
  @override
  final String description;
  @override
  final ProjectCategory category;
  @override
  final ProjectStatus status;
  @override
  final double fundingGoal;
  @override
  final double currentFunding;
  @override
  final String currency;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  @override
  final String location;
  final List<String> _images;
  @override
  @JsonKey()
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  final List<String> _documents;
  @override
  @JsonKey()
  List<String> get documents {
    if (_documents is EqualUnmodifiableListView) return _documents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_documents);
  }

  final List<ProjectMilestone> _milestones;
  @override
  @JsonKey()
  List<ProjectMilestone> get milestones {
    if (_milestones is EqualUnmodifiableListView) return _milestones;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_milestones);
  }

  final List<ImpactMetric> _impactMetrics;
  @override
  @JsonKey()
  List<ImpactMetric> get impactMetrics {
    if (_impactMetrics is EqualUnmodifiableListView) return _impactMetrics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_impactMetrics);
  }

  @override
  final String? videoUrl;
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
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Project(id: $id, organizationId: $organizationId, name: $name, description: $description, category: $category, status: $status, fundingGoal: $fundingGoal, currentFunding: $currentFunding, currency: $currency, startDate: $startDate, endDate: $endDate, location: $location, images: $images, documents: $documents, milestones: $milestones, impactMetrics: $impactMetrics, videoUrl: $videoUrl, metadata: $metadata, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.fundingGoal, fundingGoal) ||
                other.fundingGoal == fundingGoal) &&
            (identical(other.currentFunding, currentFunding) ||
                other.currentFunding == currentFunding) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.location, location) ||
                other.location == location) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality()
                .equals(other._documents, _documents) &&
            const DeepCollectionEquality()
                .equals(other._milestones, _milestones) &&
            const DeepCollectionEquality()
                .equals(other._impactMetrics, _impactMetrics) &&
            (identical(other.videoUrl, videoUrl) ||
                other.videoUrl == videoUrl) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        organizationId,
        name,
        description,
        category,
        status,
        fundingGoal,
        currentFunding,
        currency,
        startDate,
        endDate,
        location,
        const DeepCollectionEquality().hash(_images),
        const DeepCollectionEquality().hash(_documents),
        const DeepCollectionEquality().hash(_milestones),
        const DeepCollectionEquality().hash(_impactMetrics),
        videoUrl,
        const DeepCollectionEquality().hash(_metadata),
        createdAt,
        updatedAt
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectImplCopyWith<_$ProjectImpl> get copyWith =>
      __$$ProjectImplCopyWithImpl<_$ProjectImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectImplToJson(
      this,
    );
  }
}

abstract class _Project implements Project {
  const factory _Project(
      {required final String id,
      required final String organizationId,
      required final String name,
      required final String description,
      required final ProjectCategory category,
      required final ProjectStatus status,
      required final double fundingGoal,
      required final double currentFunding,
      required final String currency,
      required final DateTime startDate,
      required final DateTime endDate,
      required final String location,
      final List<String> images,
      final List<String> documents,
      final List<ProjectMilestone> milestones,
      final List<ImpactMetric> impactMetrics,
      final String? videoUrl,
      final Map<String, dynamic>? metadata,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$ProjectImpl;

  factory _Project.fromJson(Map<String, dynamic> json) = _$ProjectImpl.fromJson;

  @override
  String get id;
  @override
  String get organizationId;
  @override
  String get name;
  @override
  String get description;
  @override
  ProjectCategory get category;
  @override
  ProjectStatus get status;
  @override
  double get fundingGoal;
  @override
  double get currentFunding;
  @override
  String get currency;
  @override
  DateTime get startDate;
  @override
  DateTime get endDate;
  @override
  String get location;
  @override
  List<String> get images;
  @override
  List<String> get documents;
  @override
  List<ProjectMilestone> get milestones;
  @override
  List<ImpactMetric> get impactMetrics;
  @override
  String? get videoUrl;
  @override
  Map<String, dynamic>? get metadata;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$ProjectImplCopyWith<_$ProjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProjectMilestone _$ProjectMilestoneFromJson(Map<String, dynamic> json) {
  return _ProjectMilestone.fromJson(json);
}

/// @nodoc
mixin _$ProjectMilestone {
  String get id => throw _privateConstructorUsedError;
  String get projectId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime get targetDate => throw _privateConstructorUsedError;
  MilestoneStatus get status => throw _privateConstructorUsedError;
  double? get fundingRequired => throw _privateConstructorUsedError;
  String? get evidenceUrl => throw _privateConstructorUsedError;
  DateTime? get completedDate => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectMilestoneCopyWith<ProjectMilestone> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectMilestoneCopyWith<$Res> {
  factory $ProjectMilestoneCopyWith(
          ProjectMilestone value, $Res Function(ProjectMilestone) then) =
      _$ProjectMilestoneCopyWithImpl<$Res, ProjectMilestone>;
  @useResult
  $Res call(
      {String id,
      String projectId,
      String title,
      String description,
      DateTime targetDate,
      MilestoneStatus status,
      double? fundingRequired,
      String? evidenceUrl,
      DateTime? completedDate,
      String? notes});
}

/// @nodoc
class _$ProjectMilestoneCopyWithImpl<$Res, $Val extends ProjectMilestone>
    implements $ProjectMilestoneCopyWith<$Res> {
  _$ProjectMilestoneCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? projectId = null,
    Object? title = null,
    Object? description = null,
    Object? targetDate = null,
    Object? status = null,
    Object? fundingRequired = freezed,
    Object? evidenceUrl = freezed,
    Object? completedDate = freezed,
    Object? notes = freezed,
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
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      targetDate: null == targetDate
          ? _value.targetDate
          : targetDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MilestoneStatus,
      fundingRequired: freezed == fundingRequired
          ? _value.fundingRequired
          : fundingRequired // ignore: cast_nullable_to_non_nullable
              as double?,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProjectMilestoneImplCopyWith<$Res>
    implements $ProjectMilestoneCopyWith<$Res> {
  factory _$$ProjectMilestoneImplCopyWith(_$ProjectMilestoneImpl value,
          $Res Function(_$ProjectMilestoneImpl) then) =
      __$$ProjectMilestoneImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String projectId,
      String title,
      String description,
      DateTime targetDate,
      MilestoneStatus status,
      double? fundingRequired,
      String? evidenceUrl,
      DateTime? completedDate,
      String? notes});
}

/// @nodoc
class __$$ProjectMilestoneImplCopyWithImpl<$Res>
    extends _$ProjectMilestoneCopyWithImpl<$Res, _$ProjectMilestoneImpl>
    implements _$$ProjectMilestoneImplCopyWith<$Res> {
  __$$ProjectMilestoneImplCopyWithImpl(_$ProjectMilestoneImpl _value,
      $Res Function(_$ProjectMilestoneImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? projectId = null,
    Object? title = null,
    Object? description = null,
    Object? targetDate = null,
    Object? status = null,
    Object? fundingRequired = freezed,
    Object? evidenceUrl = freezed,
    Object? completedDate = freezed,
    Object? notes = freezed,
  }) {
    return _then(_$ProjectMilestoneImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      targetDate: null == targetDate
          ? _value.targetDate
          : targetDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MilestoneStatus,
      fundingRequired: freezed == fundingRequired
          ? _value.fundingRequired
          : fundingRequired // ignore: cast_nullable_to_non_nullable
              as double?,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectMilestoneImpl implements _ProjectMilestone {
  const _$ProjectMilestoneImpl(
      {required this.id,
      required this.projectId,
      required this.title,
      required this.description,
      required this.targetDate,
      required this.status,
      this.fundingRequired,
      this.evidenceUrl,
      this.completedDate,
      this.notes});

  factory _$ProjectMilestoneImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectMilestoneImplFromJson(json);

  @override
  final String id;
  @override
  final String projectId;
  @override
  final String title;
  @override
  final String description;
  @override
  final DateTime targetDate;
  @override
  final MilestoneStatus status;
  @override
  final double? fundingRequired;
  @override
  final String? evidenceUrl;
  @override
  final DateTime? completedDate;
  @override
  final String? notes;

  @override
  String toString() {
    return 'ProjectMilestone(id: $id, projectId: $projectId, title: $title, description: $description, targetDate: $targetDate, status: $status, fundingRequired: $fundingRequired, evidenceUrl: $evidenceUrl, completedDate: $completedDate, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectMilestoneImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.targetDate, targetDate) ||
                other.targetDate == targetDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.fundingRequired, fundingRequired) ||
                other.fundingRequired == fundingRequired) &&
            (identical(other.evidenceUrl, evidenceUrl) ||
                other.evidenceUrl == evidenceUrl) &&
            (identical(other.completedDate, completedDate) ||
                other.completedDate == completedDate) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      projectId,
      title,
      description,
      targetDate,
      status,
      fundingRequired,
      evidenceUrl,
      completedDate,
      notes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectMilestoneImplCopyWith<_$ProjectMilestoneImpl> get copyWith =>
      __$$ProjectMilestoneImplCopyWithImpl<_$ProjectMilestoneImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectMilestoneImplToJson(
      this,
    );
  }
}

abstract class _ProjectMilestone implements ProjectMilestone {
  const factory _ProjectMilestone(
      {required final String id,
      required final String projectId,
      required final String title,
      required final String description,
      required final DateTime targetDate,
      required final MilestoneStatus status,
      final double? fundingRequired,
      final String? evidenceUrl,
      final DateTime? completedDate,
      final String? notes}) = _$ProjectMilestoneImpl;

  factory _ProjectMilestone.fromJson(Map<String, dynamic> json) =
      _$ProjectMilestoneImpl.fromJson;

  @override
  String get id;
  @override
  String get projectId;
  @override
  String get title;
  @override
  String get description;
  @override
  DateTime get targetDate;
  @override
  MilestoneStatus get status;
  @override
  double? get fundingRequired;
  @override
  String? get evidenceUrl;
  @override
  DateTime? get completedDate;
  @override
  String? get notes;
  @override
  @JsonKey(ignore: true)
  _$$ProjectMilestoneImplCopyWith<_$ProjectMilestoneImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ImpactMetric _$ImpactMetricFromJson(Map<String, dynamic> json) {
  return _ImpactMetric.fromJson(json);
}

/// @nodoc
mixin _$ImpactMetric {
  String get id => throw _privateConstructorUsedError;
  String get projectId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  double get targetValue => throw _privateConstructorUsedError;
  double get currentValue => throw _privateConstructorUsedError;
  MetricType get type => throw _privateConstructorUsedError;
  String? get verificationMethod => throw _privateConstructorUsedError;
  DateTime? get lastUpdated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImpactMetricCopyWith<ImpactMetric> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImpactMetricCopyWith<$Res> {
  factory $ImpactMetricCopyWith(
          ImpactMetric value, $Res Function(ImpactMetric) then) =
      _$ImpactMetricCopyWithImpl<$Res, ImpactMetric>;
  @useResult
  $Res call(
      {String id,
      String projectId,
      String name,
      String description,
      String unit,
      double targetValue,
      double currentValue,
      MetricType type,
      String? verificationMethod,
      DateTime? lastUpdated});
}

/// @nodoc
class _$ImpactMetricCopyWithImpl<$Res, $Val extends ImpactMetric>
    implements $ImpactMetricCopyWith<$Res> {
  _$ImpactMetricCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? projectId = null,
    Object? name = null,
    Object? description = null,
    Object? unit = null,
    Object? targetValue = null,
    Object? currentValue = null,
    Object? type = null,
    Object? verificationMethod = freezed,
    Object? lastUpdated = freezed,
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
              as String,
      targetValue: null == targetValue
          ? _value.targetValue
          : targetValue // ignore: cast_nullable_to_non_nullable
              as double,
      currentValue: null == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MetricType,
      verificationMethod: freezed == verificationMethod
          ? _value.verificationMethod
          : verificationMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImpactMetricImplCopyWith<$Res>
    implements $ImpactMetricCopyWith<$Res> {
  factory _$$ImpactMetricImplCopyWith(
          _$ImpactMetricImpl value, $Res Function(_$ImpactMetricImpl) then) =
      __$$ImpactMetricImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String projectId,
      String name,
      String description,
      String unit,
      double targetValue,
      double currentValue,
      MetricType type,
      String? verificationMethod,
      DateTime? lastUpdated});
}

/// @nodoc
class __$$ImpactMetricImplCopyWithImpl<$Res>
    extends _$ImpactMetricCopyWithImpl<$Res, _$ImpactMetricImpl>
    implements _$$ImpactMetricImplCopyWith<$Res> {
  __$$ImpactMetricImplCopyWithImpl(
      _$ImpactMetricImpl _value, $Res Function(_$ImpactMetricImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? projectId = null,
    Object? name = null,
    Object? description = null,
    Object? unit = null,
    Object? targetValue = null,
    Object? currentValue = null,
    Object? type = null,
    Object? verificationMethod = freezed,
    Object? lastUpdated = freezed,
  }) {
    return _then(_$ImpactMetricImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
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
              as String,
      targetValue: null == targetValue
          ? _value.targetValue
          : targetValue // ignore: cast_nullable_to_non_nullable
              as double,
      currentValue: null == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MetricType,
      verificationMethod: freezed == verificationMethod
          ? _value.verificationMethod
          : verificationMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImpactMetricImpl implements _ImpactMetric {
  const _$ImpactMetricImpl(
      {required this.id,
      required this.projectId,
      required this.name,
      required this.description,
      required this.unit,
      required this.targetValue,
      required this.currentValue,
      required this.type,
      this.verificationMethod,
      this.lastUpdated});

  factory _$ImpactMetricImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImpactMetricImplFromJson(json);

  @override
  final String id;
  @override
  final String projectId;
  @override
  final String name;
  @override
  final String description;
  @override
  final String unit;
  @override
  final double targetValue;
  @override
  final double currentValue;
  @override
  final MetricType type;
  @override
  final String? verificationMethod;
  @override
  final DateTime? lastUpdated;

  @override
  String toString() {
    return 'ImpactMetric(id: $id, projectId: $projectId, name: $name, description: $description, unit: $unit, targetValue: $targetValue, currentValue: $currentValue, type: $type, verificationMethod: $verificationMethod, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImpactMetricImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.targetValue, targetValue) ||
                other.targetValue == targetValue) &&
            (identical(other.currentValue, currentValue) ||
                other.currentValue == currentValue) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.verificationMethod, verificationMethod) ||
                other.verificationMethod == verificationMethod) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, projectId, name, description,
      unit, targetValue, currentValue, type, verificationMethod, lastUpdated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImpactMetricImplCopyWith<_$ImpactMetricImpl> get copyWith =>
      __$$ImpactMetricImplCopyWithImpl<_$ImpactMetricImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImpactMetricImplToJson(
      this,
    );
  }
}

abstract class _ImpactMetric implements ImpactMetric {
  const factory _ImpactMetric(
      {required final String id,
      required final String projectId,
      required final String name,
      required final String description,
      required final String unit,
      required final double targetValue,
      required final double currentValue,
      required final MetricType type,
      final String? verificationMethod,
      final DateTime? lastUpdated}) = _$ImpactMetricImpl;

  factory _ImpactMetric.fromJson(Map<String, dynamic> json) =
      _$ImpactMetricImpl.fromJson;

  @override
  String get id;
  @override
  String get projectId;
  @override
  String get name;
  @override
  String get description;
  @override
  String get unit;
  @override
  double get targetValue;
  @override
  double get currentValue;
  @override
  MetricType get type;
  @override
  String? get verificationMethod;
  @override
  DateTime? get lastUpdated;
  @override
  @JsonKey(ignore: true)
  _$$ImpactMetricImplCopyWith<_$ImpactMetricImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProjectSearchCriteria _$ProjectSearchCriteriaFromJson(
    Map<String, dynamic> json) {
  return _ProjectSearchCriteria.fromJson(json);
}

/// @nodoc
mixin _$ProjectSearchCriteria {
  String? get query => throw _privateConstructorUsedError;
  List<ProjectCategory>? get categories => throw _privateConstructorUsedError;
  List<ProjectStatus>? get statuses => throw _privateConstructorUsedError;
  double? get minFunding => throw _privateConstructorUsedError;
  double? get maxFunding => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  String? get organizationId => throw _privateConstructorUsedError;
  ProjectSortBy? get sortBy => throw _privateConstructorUsedError;
  SortOrder? get sortOrder => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectSearchCriteriaCopyWith<ProjectSearchCriteria> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectSearchCriteriaCopyWith<$Res> {
  factory $ProjectSearchCriteriaCopyWith(ProjectSearchCriteria value,
          $Res Function(ProjectSearchCriteria) then) =
      _$ProjectSearchCriteriaCopyWithImpl<$Res, ProjectSearchCriteria>;
  @useResult
  $Res call(
      {String? query,
      List<ProjectCategory>? categories,
      List<ProjectStatus>? statuses,
      double? minFunding,
      double? maxFunding,
      String? location,
      String? organizationId,
      ProjectSortBy? sortBy,
      SortOrder? sortOrder});
}

/// @nodoc
class _$ProjectSearchCriteriaCopyWithImpl<$Res,
        $Val extends ProjectSearchCriteria>
    implements $ProjectSearchCriteriaCopyWith<$Res> {
  _$ProjectSearchCriteriaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = freezed,
    Object? categories = freezed,
    Object? statuses = freezed,
    Object? minFunding = freezed,
    Object? maxFunding = freezed,
    Object? location = freezed,
    Object? organizationId = freezed,
    Object? sortBy = freezed,
    Object? sortOrder = freezed,
  }) {
    return _then(_value.copyWith(
      query: freezed == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
      categories: freezed == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<ProjectCategory>?,
      statuses: freezed == statuses
          ? _value.statuses
          : statuses // ignore: cast_nullable_to_non_nullable
              as List<ProjectStatus>?,
      minFunding: freezed == minFunding
          ? _value.minFunding
          : minFunding // ignore: cast_nullable_to_non_nullable
              as double?,
      maxFunding: freezed == maxFunding
          ? _value.maxFunding
          : maxFunding // ignore: cast_nullable_to_non_nullable
              as double?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      organizationId: freezed == organizationId
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as String?,
      sortBy: freezed == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as ProjectSortBy?,
      sortOrder: freezed == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as SortOrder?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProjectSearchCriteriaImplCopyWith<$Res>
    implements $ProjectSearchCriteriaCopyWith<$Res> {
  factory _$$ProjectSearchCriteriaImplCopyWith(
          _$ProjectSearchCriteriaImpl value,
          $Res Function(_$ProjectSearchCriteriaImpl) then) =
      __$$ProjectSearchCriteriaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? query,
      List<ProjectCategory>? categories,
      List<ProjectStatus>? statuses,
      double? minFunding,
      double? maxFunding,
      String? location,
      String? organizationId,
      ProjectSortBy? sortBy,
      SortOrder? sortOrder});
}

/// @nodoc
class __$$ProjectSearchCriteriaImplCopyWithImpl<$Res>
    extends _$ProjectSearchCriteriaCopyWithImpl<$Res,
        _$ProjectSearchCriteriaImpl>
    implements _$$ProjectSearchCriteriaImplCopyWith<$Res> {
  __$$ProjectSearchCriteriaImplCopyWithImpl(_$ProjectSearchCriteriaImpl _value,
      $Res Function(_$ProjectSearchCriteriaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = freezed,
    Object? categories = freezed,
    Object? statuses = freezed,
    Object? minFunding = freezed,
    Object? maxFunding = freezed,
    Object? location = freezed,
    Object? organizationId = freezed,
    Object? sortBy = freezed,
    Object? sortOrder = freezed,
  }) {
    return _then(_$ProjectSearchCriteriaImpl(
      query: freezed == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
      categories: freezed == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<ProjectCategory>?,
      statuses: freezed == statuses
          ? _value._statuses
          : statuses // ignore: cast_nullable_to_non_nullable
              as List<ProjectStatus>?,
      minFunding: freezed == minFunding
          ? _value.minFunding
          : minFunding // ignore: cast_nullable_to_non_nullable
              as double?,
      maxFunding: freezed == maxFunding
          ? _value.maxFunding
          : maxFunding // ignore: cast_nullable_to_non_nullable
              as double?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      organizationId: freezed == organizationId
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as String?,
      sortBy: freezed == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as ProjectSortBy?,
      sortOrder: freezed == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as SortOrder?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectSearchCriteriaImpl implements _ProjectSearchCriteria {
  const _$ProjectSearchCriteriaImpl(
      {this.query,
      final List<ProjectCategory>? categories,
      final List<ProjectStatus>? statuses,
      this.minFunding,
      this.maxFunding,
      this.location,
      this.organizationId,
      this.sortBy,
      this.sortOrder})
      : _categories = categories,
        _statuses = statuses;

  factory _$ProjectSearchCriteriaImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectSearchCriteriaImplFromJson(json);

  @override
  final String? query;
  final List<ProjectCategory>? _categories;
  @override
  List<ProjectCategory>? get categories {
    final value = _categories;
    if (value == null) return null;
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ProjectStatus>? _statuses;
  @override
  List<ProjectStatus>? get statuses {
    final value = _statuses;
    if (value == null) return null;
    if (_statuses is EqualUnmodifiableListView) return _statuses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final double? minFunding;
  @override
  final double? maxFunding;
  @override
  final String? location;
  @override
  final String? organizationId;
  @override
  final ProjectSortBy? sortBy;
  @override
  final SortOrder? sortOrder;

  @override
  String toString() {
    return 'ProjectSearchCriteria(query: $query, categories: $categories, statuses: $statuses, minFunding: $minFunding, maxFunding: $maxFunding, location: $location, organizationId: $organizationId, sortBy: $sortBy, sortOrder: $sortOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectSearchCriteriaImpl &&
            (identical(other.query, query) || other.query == query) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality().equals(other._statuses, _statuses) &&
            (identical(other.minFunding, minFunding) ||
                other.minFunding == minFunding) &&
            (identical(other.maxFunding, maxFunding) ||
                other.maxFunding == maxFunding) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.sortBy, sortBy) || other.sortBy == sortBy) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      query,
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_statuses),
      minFunding,
      maxFunding,
      location,
      organizationId,
      sortBy,
      sortOrder);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectSearchCriteriaImplCopyWith<_$ProjectSearchCriteriaImpl>
      get copyWith => __$$ProjectSearchCriteriaImplCopyWithImpl<
          _$ProjectSearchCriteriaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectSearchCriteriaImplToJson(
      this,
    );
  }
}

abstract class _ProjectSearchCriteria implements ProjectSearchCriteria {
  const factory _ProjectSearchCriteria(
      {final String? query,
      final List<ProjectCategory>? categories,
      final List<ProjectStatus>? statuses,
      final double? minFunding,
      final double? maxFunding,
      final String? location,
      final String? organizationId,
      final ProjectSortBy? sortBy,
      final SortOrder? sortOrder}) = _$ProjectSearchCriteriaImpl;

  factory _ProjectSearchCriteria.fromJson(Map<String, dynamic> json) =
      _$ProjectSearchCriteriaImpl.fromJson;

  @override
  String? get query;
  @override
  List<ProjectCategory>? get categories;
  @override
  List<ProjectStatus>? get statuses;
  @override
  double? get minFunding;
  @override
  double? get maxFunding;
  @override
  String? get location;
  @override
  String? get organizationId;
  @override
  ProjectSortBy? get sortBy;
  @override
  SortOrder? get sortOrder;
  @override
  @JsonKey(ignore: true)
  _$$ProjectSearchCriteriaImplCopyWith<_$ProjectSearchCriteriaImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ProjectFundingSummary _$ProjectFundingSummaryFromJson(
    Map<String, dynamic> json) {
  return _ProjectFundingSummary.fromJson(json);
}

/// @nodoc
mixin _$ProjectFundingSummary {
  String get projectId => throw _privateConstructorUsedError;
  double get totalFunding => throw _privateConstructorUsedError;
  double get fundingGoal => throw _privateConstructorUsedError;
  double get fundingPercentage => throw _privateConstructorUsedError;
  int get investorCount => throw _privateConstructorUsedError;
  double get averageInvestment => throw _privateConstructorUsedError;
  DateTime get lastInvestmentDate => throw _privateConstructorUsedError;
  List<FundingBreakdown> get breakdown => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectFundingSummaryCopyWith<ProjectFundingSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectFundingSummaryCopyWith<$Res> {
  factory $ProjectFundingSummaryCopyWith(ProjectFundingSummary value,
          $Res Function(ProjectFundingSummary) then) =
      _$ProjectFundingSummaryCopyWithImpl<$Res, ProjectFundingSummary>;
  @useResult
  $Res call(
      {String projectId,
      double totalFunding,
      double fundingGoal,
      double fundingPercentage,
      int investorCount,
      double averageInvestment,
      DateTime lastInvestmentDate,
      List<FundingBreakdown> breakdown});
}

/// @nodoc
class _$ProjectFundingSummaryCopyWithImpl<$Res,
        $Val extends ProjectFundingSummary>
    implements $ProjectFundingSummaryCopyWith<$Res> {
  _$ProjectFundingSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = null,
    Object? totalFunding = null,
    Object? fundingGoal = null,
    Object? fundingPercentage = null,
    Object? investorCount = null,
    Object? averageInvestment = null,
    Object? lastInvestmentDate = null,
    Object? breakdown = null,
  }) {
    return _then(_value.copyWith(
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      totalFunding: null == totalFunding
          ? _value.totalFunding
          : totalFunding // ignore: cast_nullable_to_non_nullable
              as double,
      fundingGoal: null == fundingGoal
          ? _value.fundingGoal
          : fundingGoal // ignore: cast_nullable_to_non_nullable
              as double,
      fundingPercentage: null == fundingPercentage
          ? _value.fundingPercentage
          : fundingPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      investorCount: null == investorCount
          ? _value.investorCount
          : investorCount // ignore: cast_nullable_to_non_nullable
              as int,
      averageInvestment: null == averageInvestment
          ? _value.averageInvestment
          : averageInvestment // ignore: cast_nullable_to_non_nullable
              as double,
      lastInvestmentDate: null == lastInvestmentDate
          ? _value.lastInvestmentDate
          : lastInvestmentDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      breakdown: null == breakdown
          ? _value.breakdown
          : breakdown // ignore: cast_nullable_to_non_nullable
              as List<FundingBreakdown>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProjectFundingSummaryImplCopyWith<$Res>
    implements $ProjectFundingSummaryCopyWith<$Res> {
  factory _$$ProjectFundingSummaryImplCopyWith(
          _$ProjectFundingSummaryImpl value,
          $Res Function(_$ProjectFundingSummaryImpl) then) =
      __$$ProjectFundingSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String projectId,
      double totalFunding,
      double fundingGoal,
      double fundingPercentage,
      int investorCount,
      double averageInvestment,
      DateTime lastInvestmentDate,
      List<FundingBreakdown> breakdown});
}

/// @nodoc
class __$$ProjectFundingSummaryImplCopyWithImpl<$Res>
    extends _$ProjectFundingSummaryCopyWithImpl<$Res,
        _$ProjectFundingSummaryImpl>
    implements _$$ProjectFundingSummaryImplCopyWith<$Res> {
  __$$ProjectFundingSummaryImplCopyWithImpl(_$ProjectFundingSummaryImpl _value,
      $Res Function(_$ProjectFundingSummaryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = null,
    Object? totalFunding = null,
    Object? fundingGoal = null,
    Object? fundingPercentage = null,
    Object? investorCount = null,
    Object? averageInvestment = null,
    Object? lastInvestmentDate = null,
    Object? breakdown = null,
  }) {
    return _then(_$ProjectFundingSummaryImpl(
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      totalFunding: null == totalFunding
          ? _value.totalFunding
          : totalFunding // ignore: cast_nullable_to_non_nullable
              as double,
      fundingGoal: null == fundingGoal
          ? _value.fundingGoal
          : fundingGoal // ignore: cast_nullable_to_non_nullable
              as double,
      fundingPercentage: null == fundingPercentage
          ? _value.fundingPercentage
          : fundingPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      investorCount: null == investorCount
          ? _value.investorCount
          : investorCount // ignore: cast_nullable_to_non_nullable
              as int,
      averageInvestment: null == averageInvestment
          ? _value.averageInvestment
          : averageInvestment // ignore: cast_nullable_to_non_nullable
              as double,
      lastInvestmentDate: null == lastInvestmentDate
          ? _value.lastInvestmentDate
          : lastInvestmentDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      breakdown: null == breakdown
          ? _value._breakdown
          : breakdown // ignore: cast_nullable_to_non_nullable
              as List<FundingBreakdown>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectFundingSummaryImpl implements _ProjectFundingSummary {
  const _$ProjectFundingSummaryImpl(
      {required this.projectId,
      required this.totalFunding,
      required this.fundingGoal,
      required this.fundingPercentage,
      required this.investorCount,
      required this.averageInvestment,
      required this.lastInvestmentDate,
      final List<FundingBreakdown> breakdown = const []})
      : _breakdown = breakdown;

  factory _$ProjectFundingSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectFundingSummaryImplFromJson(json);

  @override
  final String projectId;
  @override
  final double totalFunding;
  @override
  final double fundingGoal;
  @override
  final double fundingPercentage;
  @override
  final int investorCount;
  @override
  final double averageInvestment;
  @override
  final DateTime lastInvestmentDate;
  final List<FundingBreakdown> _breakdown;
  @override
  @JsonKey()
  List<FundingBreakdown> get breakdown {
    if (_breakdown is EqualUnmodifiableListView) return _breakdown;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_breakdown);
  }

  @override
  String toString() {
    return 'ProjectFundingSummary(projectId: $projectId, totalFunding: $totalFunding, fundingGoal: $fundingGoal, fundingPercentage: $fundingPercentage, investorCount: $investorCount, averageInvestment: $averageInvestment, lastInvestmentDate: $lastInvestmentDate, breakdown: $breakdown)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectFundingSummaryImpl &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.totalFunding, totalFunding) ||
                other.totalFunding == totalFunding) &&
            (identical(other.fundingGoal, fundingGoal) ||
                other.fundingGoal == fundingGoal) &&
            (identical(other.fundingPercentage, fundingPercentage) ||
                other.fundingPercentage == fundingPercentage) &&
            (identical(other.investorCount, investorCount) ||
                other.investorCount == investorCount) &&
            (identical(other.averageInvestment, averageInvestment) ||
                other.averageInvestment == averageInvestment) &&
            (identical(other.lastInvestmentDate, lastInvestmentDate) ||
                other.lastInvestmentDate == lastInvestmentDate) &&
            const DeepCollectionEquality()
                .equals(other._breakdown, _breakdown));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      projectId,
      totalFunding,
      fundingGoal,
      fundingPercentage,
      investorCount,
      averageInvestment,
      lastInvestmentDate,
      const DeepCollectionEquality().hash(_breakdown));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectFundingSummaryImplCopyWith<_$ProjectFundingSummaryImpl>
      get copyWith => __$$ProjectFundingSummaryImplCopyWithImpl<
          _$ProjectFundingSummaryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectFundingSummaryImplToJson(
      this,
    );
  }
}

abstract class _ProjectFundingSummary implements ProjectFundingSummary {
  const factory _ProjectFundingSummary(
      {required final String projectId,
      required final double totalFunding,
      required final double fundingGoal,
      required final double fundingPercentage,
      required final int investorCount,
      required final double averageInvestment,
      required final DateTime lastInvestmentDate,
      final List<FundingBreakdown> breakdown}) = _$ProjectFundingSummaryImpl;

  factory _ProjectFundingSummary.fromJson(Map<String, dynamic> json) =
      _$ProjectFundingSummaryImpl.fromJson;

  @override
  String get projectId;
  @override
  double get totalFunding;
  @override
  double get fundingGoal;
  @override
  double get fundingPercentage;
  @override
  int get investorCount;
  @override
  double get averageInvestment;
  @override
  DateTime get lastInvestmentDate;
  @override
  List<FundingBreakdown> get breakdown;
  @override
  @JsonKey(ignore: true)
  _$$ProjectFundingSummaryImplCopyWith<_$ProjectFundingSummaryImpl>
      get copyWith => throw _privateConstructorUsedError;
}

FundingBreakdown _$FundingBreakdownFromJson(Map<String, dynamic> json) {
  return _FundingBreakdown.fromJson(json);
}

/// @nodoc
mixin _$FundingBreakdown {
  InvestmentType get type => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  double get percentage => throw _privateConstructorUsedError;
  int get investmentCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FundingBreakdownCopyWith<FundingBreakdown> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FundingBreakdownCopyWith<$Res> {
  factory $FundingBreakdownCopyWith(
          FundingBreakdown value, $Res Function(FundingBreakdown) then) =
      _$FundingBreakdownCopyWithImpl<$Res, FundingBreakdown>;
  @useResult
  $Res call(
      {InvestmentType type,
      double amount,
      double percentage,
      int investmentCount});
}

/// @nodoc
class _$FundingBreakdownCopyWithImpl<$Res, $Val extends FundingBreakdown>
    implements $FundingBreakdownCopyWith<$Res> {
  _$FundingBreakdownCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? amount = null,
    Object? percentage = null,
    Object? investmentCount = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as InvestmentType,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
      investmentCount: null == investmentCount
          ? _value.investmentCount
          : investmentCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FundingBreakdownImplCopyWith<$Res>
    implements $FundingBreakdownCopyWith<$Res> {
  factory _$$FundingBreakdownImplCopyWith(_$FundingBreakdownImpl value,
          $Res Function(_$FundingBreakdownImpl) then) =
      __$$FundingBreakdownImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {InvestmentType type,
      double amount,
      double percentage,
      int investmentCount});
}

/// @nodoc
class __$$FundingBreakdownImplCopyWithImpl<$Res>
    extends _$FundingBreakdownCopyWithImpl<$Res, _$FundingBreakdownImpl>
    implements _$$FundingBreakdownImplCopyWith<$Res> {
  __$$FundingBreakdownImplCopyWithImpl(_$FundingBreakdownImpl _value,
      $Res Function(_$FundingBreakdownImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? amount = null,
    Object? percentage = null,
    Object? investmentCount = null,
  }) {
    return _then(_$FundingBreakdownImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as InvestmentType,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
      investmentCount: null == investmentCount
          ? _value.investmentCount
          : investmentCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FundingBreakdownImpl implements _FundingBreakdown {
  const _$FundingBreakdownImpl(
      {required this.type,
      required this.amount,
      required this.percentage,
      required this.investmentCount});

  factory _$FundingBreakdownImpl.fromJson(Map<String, dynamic> json) =>
      _$$FundingBreakdownImplFromJson(json);

  @override
  final InvestmentType type;
  @override
  final double amount;
  @override
  final double percentage;
  @override
  final int investmentCount;

  @override
  String toString() {
    return 'FundingBreakdown(type: $type, amount: $amount, percentage: $percentage, investmentCount: $investmentCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FundingBreakdownImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage) &&
            (identical(other.investmentCount, investmentCount) ||
                other.investmentCount == investmentCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, type, amount, percentage, investmentCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FundingBreakdownImplCopyWith<_$FundingBreakdownImpl> get copyWith =>
      __$$FundingBreakdownImplCopyWithImpl<_$FundingBreakdownImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FundingBreakdownImplToJson(
      this,
    );
  }
}

abstract class _FundingBreakdown implements FundingBreakdown {
  const factory _FundingBreakdown(
      {required final InvestmentType type,
      required final double amount,
      required final double percentage,
      required final int investmentCount}) = _$FundingBreakdownImpl;

  factory _FundingBreakdown.fromJson(Map<String, dynamic> json) =
      _$FundingBreakdownImpl.fromJson;

  @override
  InvestmentType get type;
  @override
  double get amount;
  @override
  double get percentage;
  @override
  int get investmentCount;
  @override
  @JsonKey(ignore: true)
  _$$FundingBreakdownImplCopyWith<_$FundingBreakdownImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Organization _$OrganizationFromJson(Map<String, dynamic> json) {
  return _Organization.fromJson(json);
}

/// @nodoc
mixin _$Organization {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get website => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  OrganizationType get type => throw _privateConstructorUsedError;
  OrganizationStatus get status => throw _privateConstructorUsedError;
  String? get logoUrl => throw _privateConstructorUsedError;
  List<String> get certifications => throw _privateConstructorUsedError;
  List<Project> get projects => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrganizationCopyWith<Organization> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrganizationCopyWith<$Res> {
  factory $OrganizationCopyWith(
          Organization value, $Res Function(Organization) then) =
      _$OrganizationCopyWithImpl<$Res, Organization>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String email,
      String? phone,
      String? website,
      String address,
      OrganizationType type,
      OrganizationStatus status,
      String? logoUrl,
      List<String> certifications,
      List<Project> projects,
      Map<String, dynamic>? metadata,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$OrganizationCopyWithImpl<$Res, $Val extends Organization>
    implements $OrganizationCopyWith<$Res> {
  _$OrganizationCopyWithImpl(this._value, this._then);

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
    Object? email = null,
    Object? phone = freezed,
    Object? website = freezed,
    Object? address = null,
    Object? type = null,
    Object? status = null,
    Object? logoUrl = freezed,
    Object? certifications = null,
    Object? projects = null,
    Object? metadata = freezed,
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
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      website: freezed == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as OrganizationType,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrganizationStatus,
      logoUrl: freezed == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      certifications: null == certifications
          ? _value.certifications
          : certifications // ignore: cast_nullable_to_non_nullable
              as List<String>,
      projects: null == projects
          ? _value.projects
          : projects // ignore: cast_nullable_to_non_nullable
              as List<Project>,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
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
abstract class _$$OrganizationImplCopyWith<$Res>
    implements $OrganizationCopyWith<$Res> {
  factory _$$OrganizationImplCopyWith(
          _$OrganizationImpl value, $Res Function(_$OrganizationImpl) then) =
      __$$OrganizationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String email,
      String? phone,
      String? website,
      String address,
      OrganizationType type,
      OrganizationStatus status,
      String? logoUrl,
      List<String> certifications,
      List<Project> projects,
      Map<String, dynamic>? metadata,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$OrganizationImplCopyWithImpl<$Res>
    extends _$OrganizationCopyWithImpl<$Res, _$OrganizationImpl>
    implements _$$OrganizationImplCopyWith<$Res> {
  __$$OrganizationImplCopyWithImpl(
      _$OrganizationImpl _value, $Res Function(_$OrganizationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? email = null,
    Object? phone = freezed,
    Object? website = freezed,
    Object? address = null,
    Object? type = null,
    Object? status = null,
    Object? logoUrl = freezed,
    Object? certifications = null,
    Object? projects = null,
    Object? metadata = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$OrganizationImpl(
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
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      website: freezed == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as OrganizationType,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrganizationStatus,
      logoUrl: freezed == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      certifications: null == certifications
          ? _value._certifications
          : certifications // ignore: cast_nullable_to_non_nullable
              as List<String>,
      projects: null == projects
          ? _value._projects
          : projects // ignore: cast_nullable_to_non_nullable
              as List<Project>,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
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
class _$OrganizationImpl implements _Organization {
  const _$OrganizationImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.email,
      this.phone,
      this.website,
      required this.address,
      required this.type,
      required this.status,
      this.logoUrl,
      final List<String> certifications = const [],
      final List<Project> projects = const [],
      final Map<String, dynamic>? metadata,
      this.createdAt,
      this.updatedAt})
      : _certifications = certifications,
        _projects = projects,
        _metadata = metadata;

  factory _$OrganizationImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrganizationImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String email;
  @override
  final String? phone;
  @override
  final String? website;
  @override
  final String address;
  @override
  final OrganizationType type;
  @override
  final OrganizationStatus status;
  @override
  final String? logoUrl;
  final List<String> _certifications;
  @override
  @JsonKey()
  List<String> get certifications {
    if (_certifications is EqualUnmodifiableListView) return _certifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_certifications);
  }

  final List<Project> _projects;
  @override
  @JsonKey()
  List<Project> get projects {
    if (_projects is EqualUnmodifiableListView) return _projects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_projects);
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
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Organization(id: $id, name: $name, description: $description, email: $email, phone: $phone, website: $website, address: $address, type: $type, status: $status, logoUrl: $logoUrl, certifications: $certifications, projects: $projects, metadata: $metadata, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrganizationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.website, website) || other.website == website) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl) &&
            const DeepCollectionEquality()
                .equals(other._certifications, _certifications) &&
            const DeepCollectionEquality().equals(other._projects, _projects) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
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
      email,
      phone,
      website,
      address,
      type,
      status,
      logoUrl,
      const DeepCollectionEquality().hash(_certifications),
      const DeepCollectionEquality().hash(_projects),
      const DeepCollectionEquality().hash(_metadata),
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrganizationImplCopyWith<_$OrganizationImpl> get copyWith =>
      __$$OrganizationImplCopyWithImpl<_$OrganizationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrganizationImplToJson(
      this,
    );
  }
}

abstract class _Organization implements Organization {
  const factory _Organization(
      {required final String id,
      required final String name,
      required final String description,
      required final String email,
      final String? phone,
      final String? website,
      required final String address,
      required final OrganizationType type,
      required final OrganizationStatus status,
      final String? logoUrl,
      final List<String> certifications,
      final List<Project> projects,
      final Map<String, dynamic>? metadata,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$OrganizationImpl;

  factory _Organization.fromJson(Map<String, dynamic> json) =
      _$OrganizationImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get email;
  @override
  String? get phone;
  @override
  String? get website;
  @override
  String get address;
  @override
  OrganizationType get type;
  @override
  OrganizationStatus get status;
  @override
  String? get logoUrl;
  @override
  List<String> get certifications;
  @override
  List<Project> get projects;
  @override
  Map<String, dynamic>? get metadata;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$OrganizationImplCopyWith<_$OrganizationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
