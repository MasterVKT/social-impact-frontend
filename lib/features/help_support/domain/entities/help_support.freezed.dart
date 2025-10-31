// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'help_support.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HelpArticle _$HelpArticleFromJson(Map<String, dynamic> json) {
  return _HelpArticle.fromJson(json);
}

/// @nodoc
mixin _$HelpArticle {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get categoryId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  HelpArticleStatus get status => throw _privateConstructorUsedError;
  int get viewCount => throw _privateConstructorUsedError;
  int get helpfulCount => throw _privateConstructorUsedError;
  int get notHelpfulCount => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  List<String> get relatedArticleIds => throw _privateConstructorUsedError;
  String? get summary => throw _privateConstructorUsedError;
  String? get authorId => throw _privateConstructorUsedError;
  String? get thumbnailUrl => throw _privateConstructorUsedError;
  int get estimatedReadingTime =>
      throw _privateConstructorUsedError; // in minutes
  bool get isFeatured => throw _privateConstructorUsedError;
  bool get allowComments => throw _privateConstructorUsedError;
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HelpArticleCopyWith<HelpArticle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HelpArticleCopyWith<$Res> {
  factory $HelpArticleCopyWith(
          HelpArticle value, $Res Function(HelpArticle) then) =
      _$HelpArticleCopyWithImpl<$Res, HelpArticle>;
  @useResult
  $Res call(
      {String id,
      String title,
      String content,
      String categoryId,
      DateTime createdAt,
      DateTime updatedAt,
      HelpArticleStatus status,
      int viewCount,
      int helpfulCount,
      int notHelpfulCount,
      List<String> tags,
      List<String> relatedArticleIds,
      String? summary,
      String? authorId,
      String? thumbnailUrl,
      int estimatedReadingTime,
      bool isFeatured,
      bool allowComments,
      Map<String, dynamic> metadata});
}

/// @nodoc
class _$HelpArticleCopyWithImpl<$Res, $Val extends HelpArticle>
    implements $HelpArticleCopyWith<$Res> {
  _$HelpArticleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? categoryId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? status = null,
    Object? viewCount = null,
    Object? helpfulCount = null,
    Object? notHelpfulCount = null,
    Object? tags = null,
    Object? relatedArticleIds = null,
    Object? summary = freezed,
    Object? authorId = freezed,
    Object? thumbnailUrl = freezed,
    Object? estimatedReadingTime = null,
    Object? isFeatured = null,
    Object? allowComments = null,
    Object? metadata = null,
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
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as HelpArticleStatus,
      viewCount: null == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int,
      helpfulCount: null == helpfulCount
          ? _value.helpfulCount
          : helpfulCount // ignore: cast_nullable_to_non_nullable
              as int,
      notHelpfulCount: null == notHelpfulCount
          ? _value.notHelpfulCount
          : notHelpfulCount // ignore: cast_nullable_to_non_nullable
              as int,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      relatedArticleIds: null == relatedArticleIds
          ? _value.relatedArticleIds
          : relatedArticleIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String?,
      authorId: freezed == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnailUrl: freezed == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      estimatedReadingTime: null == estimatedReadingTime
          ? _value.estimatedReadingTime
          : estimatedReadingTime // ignore: cast_nullable_to_non_nullable
              as int,
      isFeatured: null == isFeatured
          ? _value.isFeatured
          : isFeatured // ignore: cast_nullable_to_non_nullable
              as bool,
      allowComments: null == allowComments
          ? _value.allowComments
          : allowComments // ignore: cast_nullable_to_non_nullable
              as bool,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HelpArticleImplCopyWith<$Res>
    implements $HelpArticleCopyWith<$Res> {
  factory _$$HelpArticleImplCopyWith(
          _$HelpArticleImpl value, $Res Function(_$HelpArticleImpl) then) =
      __$$HelpArticleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String content,
      String categoryId,
      DateTime createdAt,
      DateTime updatedAt,
      HelpArticleStatus status,
      int viewCount,
      int helpfulCount,
      int notHelpfulCount,
      List<String> tags,
      List<String> relatedArticleIds,
      String? summary,
      String? authorId,
      String? thumbnailUrl,
      int estimatedReadingTime,
      bool isFeatured,
      bool allowComments,
      Map<String, dynamic> metadata});
}

/// @nodoc
class __$$HelpArticleImplCopyWithImpl<$Res>
    extends _$HelpArticleCopyWithImpl<$Res, _$HelpArticleImpl>
    implements _$$HelpArticleImplCopyWith<$Res> {
  __$$HelpArticleImplCopyWithImpl(
      _$HelpArticleImpl _value, $Res Function(_$HelpArticleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? categoryId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? status = null,
    Object? viewCount = null,
    Object? helpfulCount = null,
    Object? notHelpfulCount = null,
    Object? tags = null,
    Object? relatedArticleIds = null,
    Object? summary = freezed,
    Object? authorId = freezed,
    Object? thumbnailUrl = freezed,
    Object? estimatedReadingTime = null,
    Object? isFeatured = null,
    Object? allowComments = null,
    Object? metadata = null,
  }) {
    return _then(_$HelpArticleImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as HelpArticleStatus,
      viewCount: null == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int,
      helpfulCount: null == helpfulCount
          ? _value.helpfulCount
          : helpfulCount // ignore: cast_nullable_to_non_nullable
              as int,
      notHelpfulCount: null == notHelpfulCount
          ? _value.notHelpfulCount
          : notHelpfulCount // ignore: cast_nullable_to_non_nullable
              as int,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      relatedArticleIds: null == relatedArticleIds
          ? _value._relatedArticleIds
          : relatedArticleIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String?,
      authorId: freezed == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnailUrl: freezed == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      estimatedReadingTime: null == estimatedReadingTime
          ? _value.estimatedReadingTime
          : estimatedReadingTime // ignore: cast_nullable_to_non_nullable
              as int,
      isFeatured: null == isFeatured
          ? _value.isFeatured
          : isFeatured // ignore: cast_nullable_to_non_nullable
              as bool,
      allowComments: null == allowComments
          ? _value.allowComments
          : allowComments // ignore: cast_nullable_to_non_nullable
              as bool,
      metadata: null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HelpArticleImpl implements _HelpArticle {
  const _$HelpArticleImpl(
      {required this.id,
      required this.title,
      required this.content,
      required this.categoryId,
      required this.createdAt,
      required this.updatedAt,
      this.status = HelpArticleStatus.published,
      this.viewCount = 0,
      this.helpfulCount = 0,
      this.notHelpfulCount = 0,
      final List<String> tags = const [],
      final List<String> relatedArticleIds = const [],
      this.summary,
      this.authorId,
      this.thumbnailUrl,
      this.estimatedReadingTime = 0,
      this.isFeatured = false,
      this.allowComments = false,
      final Map<String, dynamic> metadata = const {}})
      : _tags = tags,
        _relatedArticleIds = relatedArticleIds,
        _metadata = metadata;

  factory _$HelpArticleImpl.fromJson(Map<String, dynamic> json) =>
      _$$HelpArticleImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String content;
  @override
  final String categoryId;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  @JsonKey()
  final HelpArticleStatus status;
  @override
  @JsonKey()
  final int viewCount;
  @override
  @JsonKey()
  final int helpfulCount;
  @override
  @JsonKey()
  final int notHelpfulCount;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  final List<String> _relatedArticleIds;
  @override
  @JsonKey()
  List<String> get relatedArticleIds {
    if (_relatedArticleIds is EqualUnmodifiableListView)
      return _relatedArticleIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_relatedArticleIds);
  }

  @override
  final String? summary;
  @override
  final String? authorId;
  @override
  final String? thumbnailUrl;
  @override
  @JsonKey()
  final int estimatedReadingTime;
// in minutes
  @override
  @JsonKey()
  final bool isFeatured;
  @override
  @JsonKey()
  final bool allowComments;
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
    return 'HelpArticle(id: $id, title: $title, content: $content, categoryId: $categoryId, createdAt: $createdAt, updatedAt: $updatedAt, status: $status, viewCount: $viewCount, helpfulCount: $helpfulCount, notHelpfulCount: $notHelpfulCount, tags: $tags, relatedArticleIds: $relatedArticleIds, summary: $summary, authorId: $authorId, thumbnailUrl: $thumbnailUrl, estimatedReadingTime: $estimatedReadingTime, isFeatured: $isFeatured, allowComments: $allowComments, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HelpArticleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.viewCount, viewCount) ||
                other.viewCount == viewCount) &&
            (identical(other.helpfulCount, helpfulCount) ||
                other.helpfulCount == helpfulCount) &&
            (identical(other.notHelpfulCount, notHelpfulCount) ||
                other.notHelpfulCount == notHelpfulCount) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality()
                .equals(other._relatedArticleIds, _relatedArticleIds) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.authorId, authorId) ||
                other.authorId == authorId) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            (identical(other.estimatedReadingTime, estimatedReadingTime) ||
                other.estimatedReadingTime == estimatedReadingTime) &&
            (identical(other.isFeatured, isFeatured) ||
                other.isFeatured == isFeatured) &&
            (identical(other.allowComments, allowComments) ||
                other.allowComments == allowComments) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        title,
        content,
        categoryId,
        createdAt,
        updatedAt,
        status,
        viewCount,
        helpfulCount,
        notHelpfulCount,
        const DeepCollectionEquality().hash(_tags),
        const DeepCollectionEquality().hash(_relatedArticleIds),
        summary,
        authorId,
        thumbnailUrl,
        estimatedReadingTime,
        isFeatured,
        allowComments,
        const DeepCollectionEquality().hash(_metadata)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HelpArticleImplCopyWith<_$HelpArticleImpl> get copyWith =>
      __$$HelpArticleImplCopyWithImpl<_$HelpArticleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HelpArticleImplToJson(
      this,
    );
  }
}

abstract class _HelpArticle implements HelpArticle {
  const factory _HelpArticle(
      {required final String id,
      required final String title,
      required final String content,
      required final String categoryId,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final HelpArticleStatus status,
      final int viewCount,
      final int helpfulCount,
      final int notHelpfulCount,
      final List<String> tags,
      final List<String> relatedArticleIds,
      final String? summary,
      final String? authorId,
      final String? thumbnailUrl,
      final int estimatedReadingTime,
      final bool isFeatured,
      final bool allowComments,
      final Map<String, dynamic> metadata}) = _$HelpArticleImpl;

  factory _HelpArticle.fromJson(Map<String, dynamic> json) =
      _$HelpArticleImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get content;
  @override
  String get categoryId;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  HelpArticleStatus get status;
  @override
  int get viewCount;
  @override
  int get helpfulCount;
  @override
  int get notHelpfulCount;
  @override
  List<String> get tags;
  @override
  List<String> get relatedArticleIds;
  @override
  String? get summary;
  @override
  String? get authorId;
  @override
  String? get thumbnailUrl;
  @override
  int get estimatedReadingTime;
  @override // in minutes
  bool get isFeatured;
  @override
  bool get allowComments;
  @override
  Map<String, dynamic> get metadata;
  @override
  @JsonKey(ignore: true)
  _$$HelpArticleImplCopyWith<_$HelpArticleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HelpCategory _$HelpCategoryFromJson(Map<String, dynamic> json) {
  return _HelpCategory.fromJson(json);
}

/// @nodoc
mixin _$HelpCategory {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get sortOrder => throw _privateConstructorUsedError;
  List<String> get articleIds => throw _privateConstructorUsedError;
  String? get parentCategoryId => throw _privateConstructorUsedError;
  String? get iconName => throw _privateConstructorUsedError;
  String? get color => throw _privateConstructorUsedError;
  bool get isVisible => throw _privateConstructorUsedError;
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HelpCategoryCopyWith<HelpCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HelpCategoryCopyWith<$Res> {
  factory $HelpCategoryCopyWith(
          HelpCategory value, $Res Function(HelpCategory) then) =
      _$HelpCategoryCopyWithImpl<$Res, HelpCategory>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      int sortOrder,
      List<String> articleIds,
      String? parentCategoryId,
      String? iconName,
      String? color,
      bool isVisible,
      Map<String, dynamic> metadata});
}

/// @nodoc
class _$HelpCategoryCopyWithImpl<$Res, $Val extends HelpCategory>
    implements $HelpCategoryCopyWith<$Res> {
  _$HelpCategoryCopyWithImpl(this._value, this._then);

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
    Object? sortOrder = null,
    Object? articleIds = null,
    Object? parentCategoryId = freezed,
    Object? iconName = freezed,
    Object? color = freezed,
    Object? isVisible = null,
    Object? metadata = null,
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
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
      articleIds: null == articleIds
          ? _value.articleIds
          : articleIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      parentCategoryId: freezed == parentCategoryId
          ? _value.parentCategoryId
          : parentCategoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      iconName: freezed == iconName
          ? _value.iconName
          : iconName // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      isVisible: null == isVisible
          ? _value.isVisible
          : isVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HelpCategoryImplCopyWith<$Res>
    implements $HelpCategoryCopyWith<$Res> {
  factory _$$HelpCategoryImplCopyWith(
          _$HelpCategoryImpl value, $Res Function(_$HelpCategoryImpl) then) =
      __$$HelpCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      int sortOrder,
      List<String> articleIds,
      String? parentCategoryId,
      String? iconName,
      String? color,
      bool isVisible,
      Map<String, dynamic> metadata});
}

/// @nodoc
class __$$HelpCategoryImplCopyWithImpl<$Res>
    extends _$HelpCategoryCopyWithImpl<$Res, _$HelpCategoryImpl>
    implements _$$HelpCategoryImplCopyWith<$Res> {
  __$$HelpCategoryImplCopyWithImpl(
      _$HelpCategoryImpl _value, $Res Function(_$HelpCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? sortOrder = null,
    Object? articleIds = null,
    Object? parentCategoryId = freezed,
    Object? iconName = freezed,
    Object? color = freezed,
    Object? isVisible = null,
    Object? metadata = null,
  }) {
    return _then(_$HelpCategoryImpl(
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
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
      articleIds: null == articleIds
          ? _value._articleIds
          : articleIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      parentCategoryId: freezed == parentCategoryId
          ? _value.parentCategoryId
          : parentCategoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      iconName: freezed == iconName
          ? _value.iconName
          : iconName // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      isVisible: null == isVisible
          ? _value.isVisible
          : isVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      metadata: null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HelpCategoryImpl implements _HelpCategory {
  const _$HelpCategoryImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.sortOrder,
      final List<String> articleIds = const [],
      this.parentCategoryId,
      this.iconName,
      this.color,
      this.isVisible = true,
      final Map<String, dynamic> metadata = const {}})
      : _articleIds = articleIds,
        _metadata = metadata;

  factory _$HelpCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$HelpCategoryImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final int sortOrder;
  final List<String> _articleIds;
  @override
  @JsonKey()
  List<String> get articleIds {
    if (_articleIds is EqualUnmodifiableListView) return _articleIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_articleIds);
  }

  @override
  final String? parentCategoryId;
  @override
  final String? iconName;
  @override
  final String? color;
  @override
  @JsonKey()
  final bool isVisible;
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
    return 'HelpCategory(id: $id, name: $name, description: $description, sortOrder: $sortOrder, articleIds: $articleIds, parentCategoryId: $parentCategoryId, iconName: $iconName, color: $color, isVisible: $isVisible, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HelpCategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            const DeepCollectionEquality()
                .equals(other._articleIds, _articleIds) &&
            (identical(other.parentCategoryId, parentCategoryId) ||
                other.parentCategoryId == parentCategoryId) &&
            (identical(other.iconName, iconName) ||
                other.iconName == iconName) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.isVisible, isVisible) ||
                other.isVisible == isVisible) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      sortOrder,
      const DeepCollectionEquality().hash(_articleIds),
      parentCategoryId,
      iconName,
      color,
      isVisible,
      const DeepCollectionEquality().hash(_metadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HelpCategoryImplCopyWith<_$HelpCategoryImpl> get copyWith =>
      __$$HelpCategoryImplCopyWithImpl<_$HelpCategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HelpCategoryImplToJson(
      this,
    );
  }
}

abstract class _HelpCategory implements HelpCategory {
  const factory _HelpCategory(
      {required final String id,
      required final String name,
      required final String description,
      required final int sortOrder,
      final List<String> articleIds,
      final String? parentCategoryId,
      final String? iconName,
      final String? color,
      final bool isVisible,
      final Map<String, dynamic> metadata}) = _$HelpCategoryImpl;

  factory _HelpCategory.fromJson(Map<String, dynamic> json) =
      _$HelpCategoryImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  int get sortOrder;
  @override
  List<String> get articleIds;
  @override
  String? get parentCategoryId;
  @override
  String? get iconName;
  @override
  String? get color;
  @override
  bool get isVisible;
  @override
  Map<String, dynamic> get metadata;
  @override
  @JsonKey(ignore: true)
  _$$HelpCategoryImplCopyWith<_$HelpCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SupportTicket _$SupportTicketFromJson(Map<String, dynamic> json) {
  return _SupportTicket.fromJson(json);
}

/// @nodoc
mixin _$SupportTicket {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get subject => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  TicketPriority get priority => throw _privateConstructorUsedError;
  TicketStatus get status => throw _privateConstructorUsedError;
  TicketCategory get category => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String? get assignedAgentId => throw _privateConstructorUsedError;
  DateTime? get resolvedAt => throw _privateConstructorUsedError;
  DateTime? get closedAt => throw _privateConstructorUsedError;
  List<String> get attachmentIds => throw _privateConstructorUsedError;
  List<TicketMessage> get messages => throw _privateConstructorUsedError;
  Map<String, String> get customFields => throw _privateConstructorUsedError;
  String? get resolution => throw _privateConstructorUsedError;
  int? get satisfactionRating => throw _privateConstructorUsedError;
  String? get satisfactionFeedback => throw _privateConstructorUsedError;
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SupportTicketCopyWith<SupportTicket> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SupportTicketCopyWith<$Res> {
  factory $SupportTicketCopyWith(
          SupportTicket value, $Res Function(SupportTicket) then) =
      _$SupportTicketCopyWithImpl<$Res, SupportTicket>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String subject,
      String description,
      TicketPriority priority,
      TicketStatus status,
      TicketCategory category,
      DateTime createdAt,
      DateTime updatedAt,
      String? assignedAgentId,
      DateTime? resolvedAt,
      DateTime? closedAt,
      List<String> attachmentIds,
      List<TicketMessage> messages,
      Map<String, String> customFields,
      String? resolution,
      int? satisfactionRating,
      String? satisfactionFeedback,
      Map<String, dynamic> metadata});
}

/// @nodoc
class _$SupportTicketCopyWithImpl<$Res, $Val extends SupportTicket>
    implements $SupportTicketCopyWith<$Res> {
  _$SupportTicketCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? subject = null,
    Object? description = null,
    Object? priority = null,
    Object? status = null,
    Object? category = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? assignedAgentId = freezed,
    Object? resolvedAt = freezed,
    Object? closedAt = freezed,
    Object? attachmentIds = null,
    Object? messages = null,
    Object? customFields = null,
    Object? resolution = freezed,
    Object? satisfactionRating = freezed,
    Object? satisfactionFeedback = freezed,
    Object? metadata = null,
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
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as TicketPriority,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TicketStatus,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as TicketCategory,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      assignedAgentId: freezed == assignedAgentId
          ? _value.assignedAgentId
          : assignedAgentId // ignore: cast_nullable_to_non_nullable
              as String?,
      resolvedAt: freezed == resolvedAt
          ? _value.resolvedAt
          : resolvedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      closedAt: freezed == closedAt
          ? _value.closedAt
          : closedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      attachmentIds: null == attachmentIds
          ? _value.attachmentIds
          : attachmentIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<TicketMessage>,
      customFields: null == customFields
          ? _value.customFields
          : customFields // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      resolution: freezed == resolution
          ? _value.resolution
          : resolution // ignore: cast_nullable_to_non_nullable
              as String?,
      satisfactionRating: freezed == satisfactionRating
          ? _value.satisfactionRating
          : satisfactionRating // ignore: cast_nullable_to_non_nullable
              as int?,
      satisfactionFeedback: freezed == satisfactionFeedback
          ? _value.satisfactionFeedback
          : satisfactionFeedback // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SupportTicketImplCopyWith<$Res>
    implements $SupportTicketCopyWith<$Res> {
  factory _$$SupportTicketImplCopyWith(
          _$SupportTicketImpl value, $Res Function(_$SupportTicketImpl) then) =
      __$$SupportTicketImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String subject,
      String description,
      TicketPriority priority,
      TicketStatus status,
      TicketCategory category,
      DateTime createdAt,
      DateTime updatedAt,
      String? assignedAgentId,
      DateTime? resolvedAt,
      DateTime? closedAt,
      List<String> attachmentIds,
      List<TicketMessage> messages,
      Map<String, String> customFields,
      String? resolution,
      int? satisfactionRating,
      String? satisfactionFeedback,
      Map<String, dynamic> metadata});
}

/// @nodoc
class __$$SupportTicketImplCopyWithImpl<$Res>
    extends _$SupportTicketCopyWithImpl<$Res, _$SupportTicketImpl>
    implements _$$SupportTicketImplCopyWith<$Res> {
  __$$SupportTicketImplCopyWithImpl(
      _$SupportTicketImpl _value, $Res Function(_$SupportTicketImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? subject = null,
    Object? description = null,
    Object? priority = null,
    Object? status = null,
    Object? category = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? assignedAgentId = freezed,
    Object? resolvedAt = freezed,
    Object? closedAt = freezed,
    Object? attachmentIds = null,
    Object? messages = null,
    Object? customFields = null,
    Object? resolution = freezed,
    Object? satisfactionRating = freezed,
    Object? satisfactionFeedback = freezed,
    Object? metadata = null,
  }) {
    return _then(_$SupportTicketImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as TicketPriority,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TicketStatus,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as TicketCategory,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      assignedAgentId: freezed == assignedAgentId
          ? _value.assignedAgentId
          : assignedAgentId // ignore: cast_nullable_to_non_nullable
              as String?,
      resolvedAt: freezed == resolvedAt
          ? _value.resolvedAt
          : resolvedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      closedAt: freezed == closedAt
          ? _value.closedAt
          : closedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      attachmentIds: null == attachmentIds
          ? _value._attachmentIds
          : attachmentIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<TicketMessage>,
      customFields: null == customFields
          ? _value._customFields
          : customFields // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      resolution: freezed == resolution
          ? _value.resolution
          : resolution // ignore: cast_nullable_to_non_nullable
              as String?,
      satisfactionRating: freezed == satisfactionRating
          ? _value.satisfactionRating
          : satisfactionRating // ignore: cast_nullable_to_non_nullable
              as int?,
      satisfactionFeedback: freezed == satisfactionFeedback
          ? _value.satisfactionFeedback
          : satisfactionFeedback // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SupportTicketImpl implements _SupportTicket {
  const _$SupportTicketImpl(
      {required this.id,
      required this.userId,
      required this.subject,
      required this.description,
      required this.priority,
      required this.status,
      required this.category,
      required this.createdAt,
      required this.updatedAt,
      this.assignedAgentId,
      this.resolvedAt,
      this.closedAt,
      final List<String> attachmentIds = const [],
      final List<TicketMessage> messages = const [],
      final Map<String, String> customFields = const {},
      this.resolution,
      this.satisfactionRating,
      this.satisfactionFeedback,
      final Map<String, dynamic> metadata = const {}})
      : _attachmentIds = attachmentIds,
        _messages = messages,
        _customFields = customFields,
        _metadata = metadata;

  factory _$SupportTicketImpl.fromJson(Map<String, dynamic> json) =>
      _$$SupportTicketImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String subject;
  @override
  final String description;
  @override
  final TicketPriority priority;
  @override
  final TicketStatus status;
  @override
  final TicketCategory category;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final String? assignedAgentId;
  @override
  final DateTime? resolvedAt;
  @override
  final DateTime? closedAt;
  final List<String> _attachmentIds;
  @override
  @JsonKey()
  List<String> get attachmentIds {
    if (_attachmentIds is EqualUnmodifiableListView) return _attachmentIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attachmentIds);
  }

  final List<TicketMessage> _messages;
  @override
  @JsonKey()
  List<TicketMessage> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  final Map<String, String> _customFields;
  @override
  @JsonKey()
  Map<String, String> get customFields {
    if (_customFields is EqualUnmodifiableMapView) return _customFields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_customFields);
  }

  @override
  final String? resolution;
  @override
  final int? satisfactionRating;
  @override
  final String? satisfactionFeedback;
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
    return 'SupportTicket(id: $id, userId: $userId, subject: $subject, description: $description, priority: $priority, status: $status, category: $category, createdAt: $createdAt, updatedAt: $updatedAt, assignedAgentId: $assignedAgentId, resolvedAt: $resolvedAt, closedAt: $closedAt, attachmentIds: $attachmentIds, messages: $messages, customFields: $customFields, resolution: $resolution, satisfactionRating: $satisfactionRating, satisfactionFeedback: $satisfactionFeedback, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SupportTicketImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.assignedAgentId, assignedAgentId) ||
                other.assignedAgentId == assignedAgentId) &&
            (identical(other.resolvedAt, resolvedAt) ||
                other.resolvedAt == resolvedAt) &&
            (identical(other.closedAt, closedAt) ||
                other.closedAt == closedAt) &&
            const DeepCollectionEquality()
                .equals(other._attachmentIds, _attachmentIds) &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            const DeepCollectionEquality()
                .equals(other._customFields, _customFields) &&
            (identical(other.resolution, resolution) ||
                other.resolution == resolution) &&
            (identical(other.satisfactionRating, satisfactionRating) ||
                other.satisfactionRating == satisfactionRating) &&
            (identical(other.satisfactionFeedback, satisfactionFeedback) ||
                other.satisfactionFeedback == satisfactionFeedback) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        userId,
        subject,
        description,
        priority,
        status,
        category,
        createdAt,
        updatedAt,
        assignedAgentId,
        resolvedAt,
        closedAt,
        const DeepCollectionEquality().hash(_attachmentIds),
        const DeepCollectionEquality().hash(_messages),
        const DeepCollectionEquality().hash(_customFields),
        resolution,
        satisfactionRating,
        satisfactionFeedback,
        const DeepCollectionEquality().hash(_metadata)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SupportTicketImplCopyWith<_$SupportTicketImpl> get copyWith =>
      __$$SupportTicketImplCopyWithImpl<_$SupportTicketImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SupportTicketImplToJson(
      this,
    );
  }
}

abstract class _SupportTicket implements SupportTicket {
  const factory _SupportTicket(
      {required final String id,
      required final String userId,
      required final String subject,
      required final String description,
      required final TicketPriority priority,
      required final TicketStatus status,
      required final TicketCategory category,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final String? assignedAgentId,
      final DateTime? resolvedAt,
      final DateTime? closedAt,
      final List<String> attachmentIds,
      final List<TicketMessage> messages,
      final Map<String, String> customFields,
      final String? resolution,
      final int? satisfactionRating,
      final String? satisfactionFeedback,
      final Map<String, dynamic> metadata}) = _$SupportTicketImpl;

  factory _SupportTicket.fromJson(Map<String, dynamic> json) =
      _$SupportTicketImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get subject;
  @override
  String get description;
  @override
  TicketPriority get priority;
  @override
  TicketStatus get status;
  @override
  TicketCategory get category;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  String? get assignedAgentId;
  @override
  DateTime? get resolvedAt;
  @override
  DateTime? get closedAt;
  @override
  List<String> get attachmentIds;
  @override
  List<TicketMessage> get messages;
  @override
  Map<String, String> get customFields;
  @override
  String? get resolution;
  @override
  int? get satisfactionRating;
  @override
  String? get satisfactionFeedback;
  @override
  Map<String, dynamic> get metadata;
  @override
  @JsonKey(ignore: true)
  _$$SupportTicketImplCopyWith<_$SupportTicketImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TicketMessage _$TicketMessageFromJson(Map<String, dynamic> json) {
  return _TicketMessage.fromJson(json);
}

/// @nodoc
mixin _$TicketMessage {
  String get id => throw _privateConstructorUsedError;
  String get ticketId => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  MessageSender get sender => throw _privateConstructorUsedError;
  String? get senderId => throw _privateConstructorUsedError;
  String? get senderName => throw _privateConstructorUsedError;
  List<String> get attachmentIds => throw _privateConstructorUsedError;
  bool get isInternal => throw _privateConstructorUsedError;
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TicketMessageCopyWith<TicketMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketMessageCopyWith<$Res> {
  factory $TicketMessageCopyWith(
          TicketMessage value, $Res Function(TicketMessage) then) =
      _$TicketMessageCopyWithImpl<$Res, TicketMessage>;
  @useResult
  $Res call(
      {String id,
      String ticketId,
      String content,
      DateTime createdAt,
      MessageSender sender,
      String? senderId,
      String? senderName,
      List<String> attachmentIds,
      bool isInternal,
      Map<String, dynamic> metadata});
}

/// @nodoc
class _$TicketMessageCopyWithImpl<$Res, $Val extends TicketMessage>
    implements $TicketMessageCopyWith<$Res> {
  _$TicketMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ticketId = null,
    Object? content = null,
    Object? createdAt = null,
    Object? sender = null,
    Object? senderId = freezed,
    Object? senderName = freezed,
    Object? attachmentIds = null,
    Object? isInternal = null,
    Object? metadata = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ticketId: null == ticketId
          ? _value.ticketId
          : ticketId // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sender: null == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as MessageSender,
      senderId: freezed == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String?,
      senderName: freezed == senderName
          ? _value.senderName
          : senderName // ignore: cast_nullable_to_non_nullable
              as String?,
      attachmentIds: null == attachmentIds
          ? _value.attachmentIds
          : attachmentIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isInternal: null == isInternal
          ? _value.isInternal
          : isInternal // ignore: cast_nullable_to_non_nullable
              as bool,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TicketMessageImplCopyWith<$Res>
    implements $TicketMessageCopyWith<$Res> {
  factory _$$TicketMessageImplCopyWith(
          _$TicketMessageImpl value, $Res Function(_$TicketMessageImpl) then) =
      __$$TicketMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String ticketId,
      String content,
      DateTime createdAt,
      MessageSender sender,
      String? senderId,
      String? senderName,
      List<String> attachmentIds,
      bool isInternal,
      Map<String, dynamic> metadata});
}

/// @nodoc
class __$$TicketMessageImplCopyWithImpl<$Res>
    extends _$TicketMessageCopyWithImpl<$Res, _$TicketMessageImpl>
    implements _$$TicketMessageImplCopyWith<$Res> {
  __$$TicketMessageImplCopyWithImpl(
      _$TicketMessageImpl _value, $Res Function(_$TicketMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ticketId = null,
    Object? content = null,
    Object? createdAt = null,
    Object? sender = null,
    Object? senderId = freezed,
    Object? senderName = freezed,
    Object? attachmentIds = null,
    Object? isInternal = null,
    Object? metadata = null,
  }) {
    return _then(_$TicketMessageImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ticketId: null == ticketId
          ? _value.ticketId
          : ticketId // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sender: null == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as MessageSender,
      senderId: freezed == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String?,
      senderName: freezed == senderName
          ? _value.senderName
          : senderName // ignore: cast_nullable_to_non_nullable
              as String?,
      attachmentIds: null == attachmentIds
          ? _value._attachmentIds
          : attachmentIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isInternal: null == isInternal
          ? _value.isInternal
          : isInternal // ignore: cast_nullable_to_non_nullable
              as bool,
      metadata: null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TicketMessageImpl implements _TicketMessage {
  const _$TicketMessageImpl(
      {required this.id,
      required this.ticketId,
      required this.content,
      required this.createdAt,
      required this.sender,
      this.senderId,
      this.senderName,
      final List<String> attachmentIds = const [],
      this.isInternal = false,
      final Map<String, dynamic> metadata = const {}})
      : _attachmentIds = attachmentIds,
        _metadata = metadata;

  factory _$TicketMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$TicketMessageImplFromJson(json);

  @override
  final String id;
  @override
  final String ticketId;
  @override
  final String content;
  @override
  final DateTime createdAt;
  @override
  final MessageSender sender;
  @override
  final String? senderId;
  @override
  final String? senderName;
  final List<String> _attachmentIds;
  @override
  @JsonKey()
  List<String> get attachmentIds {
    if (_attachmentIds is EqualUnmodifiableListView) return _attachmentIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attachmentIds);
  }

  @override
  @JsonKey()
  final bool isInternal;
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
    return 'TicketMessage(id: $id, ticketId: $ticketId, content: $content, createdAt: $createdAt, sender: $sender, senderId: $senderId, senderName: $senderName, attachmentIds: $attachmentIds, isInternal: $isInternal, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketMessageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ticketId, ticketId) ||
                other.ticketId == ticketId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.sender, sender) || other.sender == sender) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.senderName, senderName) ||
                other.senderName == senderName) &&
            const DeepCollectionEquality()
                .equals(other._attachmentIds, _attachmentIds) &&
            (identical(other.isInternal, isInternal) ||
                other.isInternal == isInternal) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      ticketId,
      content,
      createdAt,
      sender,
      senderId,
      senderName,
      const DeepCollectionEquality().hash(_attachmentIds),
      isInternal,
      const DeepCollectionEquality().hash(_metadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TicketMessageImplCopyWith<_$TicketMessageImpl> get copyWith =>
      __$$TicketMessageImplCopyWithImpl<_$TicketMessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TicketMessageImplToJson(
      this,
    );
  }
}

abstract class _TicketMessage implements TicketMessage {
  const factory _TicketMessage(
      {required final String id,
      required final String ticketId,
      required final String content,
      required final DateTime createdAt,
      required final MessageSender sender,
      final String? senderId,
      final String? senderName,
      final List<String> attachmentIds,
      final bool isInternal,
      final Map<String, dynamic> metadata}) = _$TicketMessageImpl;

  factory _TicketMessage.fromJson(Map<String, dynamic> json) =
      _$TicketMessageImpl.fromJson;

  @override
  String get id;
  @override
  String get ticketId;
  @override
  String get content;
  @override
  DateTime get createdAt;
  @override
  MessageSender get sender;
  @override
  String? get senderId;
  @override
  String? get senderName;
  @override
  List<String> get attachmentIds;
  @override
  bool get isInternal;
  @override
  Map<String, dynamic> get metadata;
  @override
  @JsonKey(ignore: true)
  _$$TicketMessageImplCopyWith<_$TicketMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FAQ _$FAQFromJson(Map<String, dynamic> json) {
  return _FAQ.fromJson(json);
}

/// @nodoc
mixin _$FAQ {
  String get id => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;
  String get answer => throw _privateConstructorUsedError;
  String get categoryId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  int get viewCount => throw _privateConstructorUsedError;
  int get helpfulCount => throw _privateConstructorUsedError;
  int get notHelpfulCount => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  List<String> get relatedFaqIds => throw _privateConstructorUsedError;
  int get sortOrder => throw _privateConstructorUsedError;
  bool get isPublished => throw _privateConstructorUsedError;
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FAQCopyWith<FAQ> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FAQCopyWith<$Res> {
  factory $FAQCopyWith(FAQ value, $Res Function(FAQ) then) =
      _$FAQCopyWithImpl<$Res, FAQ>;
  @useResult
  $Res call(
      {String id,
      String question,
      String answer,
      String categoryId,
      DateTime createdAt,
      DateTime updatedAt,
      int viewCount,
      int helpfulCount,
      int notHelpfulCount,
      List<String> tags,
      List<String> relatedFaqIds,
      int sortOrder,
      bool isPublished,
      Map<String, dynamic> metadata});
}

/// @nodoc
class _$FAQCopyWithImpl<$Res, $Val extends FAQ> implements $FAQCopyWith<$Res> {
  _$FAQCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? question = null,
    Object? answer = null,
    Object? categoryId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? viewCount = null,
    Object? helpfulCount = null,
    Object? notHelpfulCount = null,
    Object? tags = null,
    Object? relatedFaqIds = null,
    Object? sortOrder = null,
    Object? isPublished = null,
    Object? metadata = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      viewCount: null == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int,
      helpfulCount: null == helpfulCount
          ? _value.helpfulCount
          : helpfulCount // ignore: cast_nullable_to_non_nullable
              as int,
      notHelpfulCount: null == notHelpfulCount
          ? _value.notHelpfulCount
          : notHelpfulCount // ignore: cast_nullable_to_non_nullable
              as int,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      relatedFaqIds: null == relatedFaqIds
          ? _value.relatedFaqIds
          : relatedFaqIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
      isPublished: null == isPublished
          ? _value.isPublished
          : isPublished // ignore: cast_nullable_to_non_nullable
              as bool,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FAQImplCopyWith<$Res> implements $FAQCopyWith<$Res> {
  factory _$$FAQImplCopyWith(_$FAQImpl value, $Res Function(_$FAQImpl) then) =
      __$$FAQImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String question,
      String answer,
      String categoryId,
      DateTime createdAt,
      DateTime updatedAt,
      int viewCount,
      int helpfulCount,
      int notHelpfulCount,
      List<String> tags,
      List<String> relatedFaqIds,
      int sortOrder,
      bool isPublished,
      Map<String, dynamic> metadata});
}

/// @nodoc
class __$$FAQImplCopyWithImpl<$Res> extends _$FAQCopyWithImpl<$Res, _$FAQImpl>
    implements _$$FAQImplCopyWith<$Res> {
  __$$FAQImplCopyWithImpl(_$FAQImpl _value, $Res Function(_$FAQImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? question = null,
    Object? answer = null,
    Object? categoryId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? viewCount = null,
    Object? helpfulCount = null,
    Object? notHelpfulCount = null,
    Object? tags = null,
    Object? relatedFaqIds = null,
    Object? sortOrder = null,
    Object? isPublished = null,
    Object? metadata = null,
  }) {
    return _then(_$FAQImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      viewCount: null == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int,
      helpfulCount: null == helpfulCount
          ? _value.helpfulCount
          : helpfulCount // ignore: cast_nullable_to_non_nullable
              as int,
      notHelpfulCount: null == notHelpfulCount
          ? _value.notHelpfulCount
          : notHelpfulCount // ignore: cast_nullable_to_non_nullable
              as int,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      relatedFaqIds: null == relatedFaqIds
          ? _value._relatedFaqIds
          : relatedFaqIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
      isPublished: null == isPublished
          ? _value.isPublished
          : isPublished // ignore: cast_nullable_to_non_nullable
              as bool,
      metadata: null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FAQImpl implements _FAQ {
  const _$FAQImpl(
      {required this.id,
      required this.question,
      required this.answer,
      required this.categoryId,
      required this.createdAt,
      required this.updatedAt,
      this.viewCount = 0,
      this.helpfulCount = 0,
      this.notHelpfulCount = 0,
      final List<String> tags = const [],
      final List<String> relatedFaqIds = const [],
      this.sortOrder = 0,
      this.isPublished = true,
      final Map<String, dynamic> metadata = const {}})
      : _tags = tags,
        _relatedFaqIds = relatedFaqIds,
        _metadata = metadata;

  factory _$FAQImpl.fromJson(Map<String, dynamic> json) =>
      _$$FAQImplFromJson(json);

  @override
  final String id;
  @override
  final String question;
  @override
  final String answer;
  @override
  final String categoryId;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  @JsonKey()
  final int viewCount;
  @override
  @JsonKey()
  final int helpfulCount;
  @override
  @JsonKey()
  final int notHelpfulCount;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  final List<String> _relatedFaqIds;
  @override
  @JsonKey()
  List<String> get relatedFaqIds {
    if (_relatedFaqIds is EqualUnmodifiableListView) return _relatedFaqIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_relatedFaqIds);
  }

  @override
  @JsonKey()
  final int sortOrder;
  @override
  @JsonKey()
  final bool isPublished;
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
    return 'FAQ(id: $id, question: $question, answer: $answer, categoryId: $categoryId, createdAt: $createdAt, updatedAt: $updatedAt, viewCount: $viewCount, helpfulCount: $helpfulCount, notHelpfulCount: $notHelpfulCount, tags: $tags, relatedFaqIds: $relatedFaqIds, sortOrder: $sortOrder, isPublished: $isPublished, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FAQImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.viewCount, viewCount) ||
                other.viewCount == viewCount) &&
            (identical(other.helpfulCount, helpfulCount) ||
                other.helpfulCount == helpfulCount) &&
            (identical(other.notHelpfulCount, notHelpfulCount) ||
                other.notHelpfulCount == notHelpfulCount) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality()
                .equals(other._relatedFaqIds, _relatedFaqIds) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            (identical(other.isPublished, isPublished) ||
                other.isPublished == isPublished) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      question,
      answer,
      categoryId,
      createdAt,
      updatedAt,
      viewCount,
      helpfulCount,
      notHelpfulCount,
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_relatedFaqIds),
      sortOrder,
      isPublished,
      const DeepCollectionEquality().hash(_metadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FAQImplCopyWith<_$FAQImpl> get copyWith =>
      __$$FAQImplCopyWithImpl<_$FAQImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FAQImplToJson(
      this,
    );
  }
}

abstract class _FAQ implements FAQ {
  const factory _FAQ(
      {required final String id,
      required final String question,
      required final String answer,
      required final String categoryId,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final int viewCount,
      final int helpfulCount,
      final int notHelpfulCount,
      final List<String> tags,
      final List<String> relatedFaqIds,
      final int sortOrder,
      final bool isPublished,
      final Map<String, dynamic> metadata}) = _$FAQImpl;

  factory _FAQ.fromJson(Map<String, dynamic> json) = _$FAQImpl.fromJson;

  @override
  String get id;
  @override
  String get question;
  @override
  String get answer;
  @override
  String get categoryId;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  int get viewCount;
  @override
  int get helpfulCount;
  @override
  int get notHelpfulCount;
  @override
  List<String> get tags;
  @override
  List<String> get relatedFaqIds;
  @override
  int get sortOrder;
  @override
  bool get isPublished;
  @override
  Map<String, dynamic> get metadata;
  @override
  @JsonKey(ignore: true)
  _$$FAQImplCopyWith<_$FAQImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LiveChatSession _$LiveChatSessionFromJson(Map<String, dynamic> json) {
  return _LiveChatSession.fromJson(json);
}

/// @nodoc
mixin _$LiveChatSession {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  DateTime get startedAt => throw _privateConstructorUsedError;
  ChatSessionStatus get status => throw _privateConstructorUsedError;
  String? get agentId => throw _privateConstructorUsedError;
  String? get agentName => throw _privateConstructorUsedError;
  DateTime? get endedAt => throw _privateConstructorUsedError;
  List<ChatMessage> get messages => throw _privateConstructorUsedError;
  int get waitTime => throw _privateConstructorUsedError; // in seconds
  int? get satisfactionRating => throw _privateConstructorUsedError;
  String? get satisfactionFeedback => throw _privateConstructorUsedError;
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LiveChatSessionCopyWith<LiveChatSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiveChatSessionCopyWith<$Res> {
  factory $LiveChatSessionCopyWith(
          LiveChatSession value, $Res Function(LiveChatSession) then) =
      _$LiveChatSessionCopyWithImpl<$Res, LiveChatSession>;
  @useResult
  $Res call(
      {String id,
      String userId,
      DateTime startedAt,
      ChatSessionStatus status,
      String? agentId,
      String? agentName,
      DateTime? endedAt,
      List<ChatMessage> messages,
      int waitTime,
      int? satisfactionRating,
      String? satisfactionFeedback,
      Map<String, dynamic> metadata});
}

/// @nodoc
class _$LiveChatSessionCopyWithImpl<$Res, $Val extends LiveChatSession>
    implements $LiveChatSessionCopyWith<$Res> {
  _$LiveChatSessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? startedAt = null,
    Object? status = null,
    Object? agentId = freezed,
    Object? agentName = freezed,
    Object? endedAt = freezed,
    Object? messages = null,
    Object? waitTime = null,
    Object? satisfactionRating = freezed,
    Object? satisfactionFeedback = freezed,
    Object? metadata = null,
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
      startedAt: null == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ChatSessionStatus,
      agentId: freezed == agentId
          ? _value.agentId
          : agentId // ignore: cast_nullable_to_non_nullable
              as String?,
      agentName: freezed == agentName
          ? _value.agentName
          : agentName // ignore: cast_nullable_to_non_nullable
              as String?,
      endedAt: freezed == endedAt
          ? _value.endedAt
          : endedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<ChatMessage>,
      waitTime: null == waitTime
          ? _value.waitTime
          : waitTime // ignore: cast_nullable_to_non_nullable
              as int,
      satisfactionRating: freezed == satisfactionRating
          ? _value.satisfactionRating
          : satisfactionRating // ignore: cast_nullable_to_non_nullable
              as int?,
      satisfactionFeedback: freezed == satisfactionFeedback
          ? _value.satisfactionFeedback
          : satisfactionFeedback // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LiveChatSessionImplCopyWith<$Res>
    implements $LiveChatSessionCopyWith<$Res> {
  factory _$$LiveChatSessionImplCopyWith(_$LiveChatSessionImpl value,
          $Res Function(_$LiveChatSessionImpl) then) =
      __$$LiveChatSessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      DateTime startedAt,
      ChatSessionStatus status,
      String? agentId,
      String? agentName,
      DateTime? endedAt,
      List<ChatMessage> messages,
      int waitTime,
      int? satisfactionRating,
      String? satisfactionFeedback,
      Map<String, dynamic> metadata});
}

/// @nodoc
class __$$LiveChatSessionImplCopyWithImpl<$Res>
    extends _$LiveChatSessionCopyWithImpl<$Res, _$LiveChatSessionImpl>
    implements _$$LiveChatSessionImplCopyWith<$Res> {
  __$$LiveChatSessionImplCopyWithImpl(
      _$LiveChatSessionImpl _value, $Res Function(_$LiveChatSessionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? startedAt = null,
    Object? status = null,
    Object? agentId = freezed,
    Object? agentName = freezed,
    Object? endedAt = freezed,
    Object? messages = null,
    Object? waitTime = null,
    Object? satisfactionRating = freezed,
    Object? satisfactionFeedback = freezed,
    Object? metadata = null,
  }) {
    return _then(_$LiveChatSessionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      startedAt: null == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ChatSessionStatus,
      agentId: freezed == agentId
          ? _value.agentId
          : agentId // ignore: cast_nullable_to_non_nullable
              as String?,
      agentName: freezed == agentName
          ? _value.agentName
          : agentName // ignore: cast_nullable_to_non_nullable
              as String?,
      endedAt: freezed == endedAt
          ? _value.endedAt
          : endedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<ChatMessage>,
      waitTime: null == waitTime
          ? _value.waitTime
          : waitTime // ignore: cast_nullable_to_non_nullable
              as int,
      satisfactionRating: freezed == satisfactionRating
          ? _value.satisfactionRating
          : satisfactionRating // ignore: cast_nullable_to_non_nullable
              as int?,
      satisfactionFeedback: freezed == satisfactionFeedback
          ? _value.satisfactionFeedback
          : satisfactionFeedback // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LiveChatSessionImpl implements _LiveChatSession {
  const _$LiveChatSessionImpl(
      {required this.id,
      required this.userId,
      required this.startedAt,
      required this.status,
      this.agentId,
      this.agentName,
      this.endedAt,
      final List<ChatMessage> messages = const [],
      this.waitTime = 0,
      this.satisfactionRating,
      this.satisfactionFeedback,
      final Map<String, dynamic> metadata = const {}})
      : _messages = messages,
        _metadata = metadata;

  factory _$LiveChatSessionImpl.fromJson(Map<String, dynamic> json) =>
      _$$LiveChatSessionImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final DateTime startedAt;
  @override
  final ChatSessionStatus status;
  @override
  final String? agentId;
  @override
  final String? agentName;
  @override
  final DateTime? endedAt;
  final List<ChatMessage> _messages;
  @override
  @JsonKey()
  List<ChatMessage> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  @JsonKey()
  final int waitTime;
// in seconds
  @override
  final int? satisfactionRating;
  @override
  final String? satisfactionFeedback;
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
    return 'LiveChatSession(id: $id, userId: $userId, startedAt: $startedAt, status: $status, agentId: $agentId, agentName: $agentName, endedAt: $endedAt, messages: $messages, waitTime: $waitTime, satisfactionRating: $satisfactionRating, satisfactionFeedback: $satisfactionFeedback, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiveChatSessionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.agentId, agentId) || other.agentId == agentId) &&
            (identical(other.agentName, agentName) ||
                other.agentName == agentName) &&
            (identical(other.endedAt, endedAt) || other.endedAt == endedAt) &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.waitTime, waitTime) ||
                other.waitTime == waitTime) &&
            (identical(other.satisfactionRating, satisfactionRating) ||
                other.satisfactionRating == satisfactionRating) &&
            (identical(other.satisfactionFeedback, satisfactionFeedback) ||
                other.satisfactionFeedback == satisfactionFeedback) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      startedAt,
      status,
      agentId,
      agentName,
      endedAt,
      const DeepCollectionEquality().hash(_messages),
      waitTime,
      satisfactionRating,
      satisfactionFeedback,
      const DeepCollectionEquality().hash(_metadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LiveChatSessionImplCopyWith<_$LiveChatSessionImpl> get copyWith =>
      __$$LiveChatSessionImplCopyWithImpl<_$LiveChatSessionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LiveChatSessionImplToJson(
      this,
    );
  }
}

abstract class _LiveChatSession implements LiveChatSession {
  const factory _LiveChatSession(
      {required final String id,
      required final String userId,
      required final DateTime startedAt,
      required final ChatSessionStatus status,
      final String? agentId,
      final String? agentName,
      final DateTime? endedAt,
      final List<ChatMessage> messages,
      final int waitTime,
      final int? satisfactionRating,
      final String? satisfactionFeedback,
      final Map<String, dynamic> metadata}) = _$LiveChatSessionImpl;

  factory _LiveChatSession.fromJson(Map<String, dynamic> json) =
      _$LiveChatSessionImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  DateTime get startedAt;
  @override
  ChatSessionStatus get status;
  @override
  String? get agentId;
  @override
  String? get agentName;
  @override
  DateTime? get endedAt;
  @override
  List<ChatMessage> get messages;
  @override
  int get waitTime;
  @override // in seconds
  int? get satisfactionRating;
  @override
  String? get satisfactionFeedback;
  @override
  Map<String, dynamic> get metadata;
  @override
  @JsonKey(ignore: true)
  _$$LiveChatSessionImplCopyWith<_$LiveChatSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) {
  return _ChatMessage.fromJson(json);
}

/// @nodoc
mixin _$ChatMessage {
  String get id => throw _privateConstructorUsedError;
  String get sessionId => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  MessageSender get sender => throw _privateConstructorUsedError;
  String? get senderId => throw _privateConstructorUsedError;
  String? get senderName => throw _privateConstructorUsedError;
  MessageType get type => throw _privateConstructorUsedError;
  List<String> get attachmentIds => throw _privateConstructorUsedError;
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatMessageCopyWith<ChatMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatMessageCopyWith<$Res> {
  factory $ChatMessageCopyWith(
          ChatMessage value, $Res Function(ChatMessage) then) =
      _$ChatMessageCopyWithImpl<$Res, ChatMessage>;
  @useResult
  $Res call(
      {String id,
      String sessionId,
      String content,
      DateTime timestamp,
      MessageSender sender,
      String? senderId,
      String? senderName,
      MessageType type,
      List<String> attachmentIds,
      Map<String, dynamic> metadata});
}

/// @nodoc
class _$ChatMessageCopyWithImpl<$Res, $Val extends ChatMessage>
    implements $ChatMessageCopyWith<$Res> {
  _$ChatMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sessionId = null,
    Object? content = null,
    Object? timestamp = null,
    Object? sender = null,
    Object? senderId = freezed,
    Object? senderName = freezed,
    Object? type = null,
    Object? attachmentIds = null,
    Object? metadata = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sender: null == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as MessageSender,
      senderId: freezed == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String?,
      senderName: freezed == senderName
          ? _value.senderName
          : senderName // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MessageType,
      attachmentIds: null == attachmentIds
          ? _value.attachmentIds
          : attachmentIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatMessageImplCopyWith<$Res>
    implements $ChatMessageCopyWith<$Res> {
  factory _$$ChatMessageImplCopyWith(
          _$ChatMessageImpl value, $Res Function(_$ChatMessageImpl) then) =
      __$$ChatMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String sessionId,
      String content,
      DateTime timestamp,
      MessageSender sender,
      String? senderId,
      String? senderName,
      MessageType type,
      List<String> attachmentIds,
      Map<String, dynamic> metadata});
}

/// @nodoc
class __$$ChatMessageImplCopyWithImpl<$Res>
    extends _$ChatMessageCopyWithImpl<$Res, _$ChatMessageImpl>
    implements _$$ChatMessageImplCopyWith<$Res> {
  __$$ChatMessageImplCopyWithImpl(
      _$ChatMessageImpl _value, $Res Function(_$ChatMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sessionId = null,
    Object? content = null,
    Object? timestamp = null,
    Object? sender = null,
    Object? senderId = freezed,
    Object? senderName = freezed,
    Object? type = null,
    Object? attachmentIds = null,
    Object? metadata = null,
  }) {
    return _then(_$ChatMessageImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sender: null == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as MessageSender,
      senderId: freezed == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String?,
      senderName: freezed == senderName
          ? _value.senderName
          : senderName // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MessageType,
      attachmentIds: null == attachmentIds
          ? _value._attachmentIds
          : attachmentIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      metadata: null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatMessageImpl implements _ChatMessage {
  const _$ChatMessageImpl(
      {required this.id,
      required this.sessionId,
      required this.content,
      required this.timestamp,
      required this.sender,
      this.senderId,
      this.senderName,
      this.type = MessageType.text,
      final List<String> attachmentIds = const [],
      final Map<String, dynamic> metadata = const {}})
      : _attachmentIds = attachmentIds,
        _metadata = metadata;

  factory _$ChatMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatMessageImplFromJson(json);

  @override
  final String id;
  @override
  final String sessionId;
  @override
  final String content;
  @override
  final DateTime timestamp;
  @override
  final MessageSender sender;
  @override
  final String? senderId;
  @override
  final String? senderName;
  @override
  @JsonKey()
  final MessageType type;
  final List<String> _attachmentIds;
  @override
  @JsonKey()
  List<String> get attachmentIds {
    if (_attachmentIds is EqualUnmodifiableListView) return _attachmentIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attachmentIds);
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
    return 'ChatMessage(id: $id, sessionId: $sessionId, content: $content, timestamp: $timestamp, sender: $sender, senderId: $senderId, senderName: $senderName, type: $type, attachmentIds: $attachmentIds, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatMessageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.sender, sender) || other.sender == sender) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.senderName, senderName) ||
                other.senderName == senderName) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other._attachmentIds, _attachmentIds) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      sessionId,
      content,
      timestamp,
      sender,
      senderId,
      senderName,
      type,
      const DeepCollectionEquality().hash(_attachmentIds),
      const DeepCollectionEquality().hash(_metadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatMessageImplCopyWith<_$ChatMessageImpl> get copyWith =>
      __$$ChatMessageImplCopyWithImpl<_$ChatMessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatMessageImplToJson(
      this,
    );
  }
}

abstract class _ChatMessage implements ChatMessage {
  const factory _ChatMessage(
      {required final String id,
      required final String sessionId,
      required final String content,
      required final DateTime timestamp,
      required final MessageSender sender,
      final String? senderId,
      final String? senderName,
      final MessageType type,
      final List<String> attachmentIds,
      final Map<String, dynamic> metadata}) = _$ChatMessageImpl;

  factory _ChatMessage.fromJson(Map<String, dynamic> json) =
      _$ChatMessageImpl.fromJson;

  @override
  String get id;
  @override
  String get sessionId;
  @override
  String get content;
  @override
  DateTime get timestamp;
  @override
  MessageSender get sender;
  @override
  String? get senderId;
  @override
  String? get senderName;
  @override
  MessageType get type;
  @override
  List<String> get attachmentIds;
  @override
  Map<String, dynamic> get metadata;
  @override
  @JsonKey(ignore: true)
  _$$ChatMessageImplCopyWith<_$ChatMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ContactInfo _$ContactInfoFromJson(Map<String, dynamic> json) {
  return _ContactInfo.fromJson(json);
}

/// @nodoc
mixin _$ContactInfo {
  String get email => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get businessHours => throw _privateConstructorUsedError;
  int get averageResponseTime =>
      throw _privateConstructorUsedError; // in minutes
  List<SocialMediaContact> get socialMedia =>
      throw _privateConstructorUsedError;
  Map<String, String> get emergencyContacts =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContactInfoCopyWith<ContactInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactInfoCopyWith<$Res> {
  factory $ContactInfoCopyWith(
          ContactInfo value, $Res Function(ContactInfo) then) =
      _$ContactInfoCopyWithImpl<$Res, ContactInfo>;
  @useResult
  $Res call(
      {String email,
      String phone,
      String address,
      String businessHours,
      int averageResponseTime,
      List<SocialMediaContact> socialMedia,
      Map<String, String> emergencyContacts});
}

/// @nodoc
class _$ContactInfoCopyWithImpl<$Res, $Val extends ContactInfo>
    implements $ContactInfoCopyWith<$Res> {
  _$ContactInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? phone = null,
    Object? address = null,
    Object? businessHours = null,
    Object? averageResponseTime = null,
    Object? socialMedia = null,
    Object? emergencyContacts = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      businessHours: null == businessHours
          ? _value.businessHours
          : businessHours // ignore: cast_nullable_to_non_nullable
              as String,
      averageResponseTime: null == averageResponseTime
          ? _value.averageResponseTime
          : averageResponseTime // ignore: cast_nullable_to_non_nullable
              as int,
      socialMedia: null == socialMedia
          ? _value.socialMedia
          : socialMedia // ignore: cast_nullable_to_non_nullable
              as List<SocialMediaContact>,
      emergencyContacts: null == emergencyContacts
          ? _value.emergencyContacts
          : emergencyContacts // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContactInfoImplCopyWith<$Res>
    implements $ContactInfoCopyWith<$Res> {
  factory _$$ContactInfoImplCopyWith(
          _$ContactInfoImpl value, $Res Function(_$ContactInfoImpl) then) =
      __$$ContactInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      String phone,
      String address,
      String businessHours,
      int averageResponseTime,
      List<SocialMediaContact> socialMedia,
      Map<String, String> emergencyContacts});
}

/// @nodoc
class __$$ContactInfoImplCopyWithImpl<$Res>
    extends _$ContactInfoCopyWithImpl<$Res, _$ContactInfoImpl>
    implements _$$ContactInfoImplCopyWith<$Res> {
  __$$ContactInfoImplCopyWithImpl(
      _$ContactInfoImpl _value, $Res Function(_$ContactInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? phone = null,
    Object? address = null,
    Object? businessHours = null,
    Object? averageResponseTime = null,
    Object? socialMedia = null,
    Object? emergencyContacts = null,
  }) {
    return _then(_$ContactInfoImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      businessHours: null == businessHours
          ? _value.businessHours
          : businessHours // ignore: cast_nullable_to_non_nullable
              as String,
      averageResponseTime: null == averageResponseTime
          ? _value.averageResponseTime
          : averageResponseTime // ignore: cast_nullable_to_non_nullable
              as int,
      socialMedia: null == socialMedia
          ? _value._socialMedia
          : socialMedia // ignore: cast_nullable_to_non_nullable
              as List<SocialMediaContact>,
      emergencyContacts: null == emergencyContacts
          ? _value._emergencyContacts
          : emergencyContacts // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContactInfoImpl implements _ContactInfo {
  const _$ContactInfoImpl(
      {this.email = 'support@socialimpact.app',
      this.phone = '+44 20 7123 4567',
      this.address = 'Social Impact Platform, London, UK',
      this.businessHours = 'Monday - Friday: 9:00 AM - 6:00 PM GMT',
      this.averageResponseTime = 30,
      final List<SocialMediaContact> socialMedia = const [],
      final Map<String, String> emergencyContacts = const {}})
      : _socialMedia = socialMedia,
        _emergencyContacts = emergencyContacts;

  factory _$ContactInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContactInfoImplFromJson(json);

  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String phone;
  @override
  @JsonKey()
  final String address;
  @override
  @JsonKey()
  final String businessHours;
  @override
  @JsonKey()
  final int averageResponseTime;
// in minutes
  final List<SocialMediaContact> _socialMedia;
// in minutes
  @override
  @JsonKey()
  List<SocialMediaContact> get socialMedia {
    if (_socialMedia is EqualUnmodifiableListView) return _socialMedia;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_socialMedia);
  }

  final Map<String, String> _emergencyContacts;
  @override
  @JsonKey()
  Map<String, String> get emergencyContacts {
    if (_emergencyContacts is EqualUnmodifiableMapView)
      return _emergencyContacts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_emergencyContacts);
  }

  @override
  String toString() {
    return 'ContactInfo(email: $email, phone: $phone, address: $address, businessHours: $businessHours, averageResponseTime: $averageResponseTime, socialMedia: $socialMedia, emergencyContacts: $emergencyContacts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactInfoImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.businessHours, businessHours) ||
                other.businessHours == businessHours) &&
            (identical(other.averageResponseTime, averageResponseTime) ||
                other.averageResponseTime == averageResponseTime) &&
            const DeepCollectionEquality()
                .equals(other._socialMedia, _socialMedia) &&
            const DeepCollectionEquality()
                .equals(other._emergencyContacts, _emergencyContacts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      email,
      phone,
      address,
      businessHours,
      averageResponseTime,
      const DeepCollectionEquality().hash(_socialMedia),
      const DeepCollectionEquality().hash(_emergencyContacts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContactInfoImplCopyWith<_$ContactInfoImpl> get copyWith =>
      __$$ContactInfoImplCopyWithImpl<_$ContactInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContactInfoImplToJson(
      this,
    );
  }
}

abstract class _ContactInfo implements ContactInfo {
  const factory _ContactInfo(
      {final String email,
      final String phone,
      final String address,
      final String businessHours,
      final int averageResponseTime,
      final List<SocialMediaContact> socialMedia,
      final Map<String, String> emergencyContacts}) = _$ContactInfoImpl;

  factory _ContactInfo.fromJson(Map<String, dynamic> json) =
      _$ContactInfoImpl.fromJson;

  @override
  String get email;
  @override
  String get phone;
  @override
  String get address;
  @override
  String get businessHours;
  @override
  int get averageResponseTime;
  @override // in minutes
  List<SocialMediaContact> get socialMedia;
  @override
  Map<String, String> get emergencyContacts;
  @override
  @JsonKey(ignore: true)
  _$$ContactInfoImplCopyWith<_$ContactInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SocialMediaContact _$SocialMediaContactFromJson(Map<String, dynamic> json) {
  return _SocialMediaContact.fromJson(json);
}

/// @nodoc
mixin _$SocialMediaContact {
  String get platform => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SocialMediaContactCopyWith<SocialMediaContact> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SocialMediaContactCopyWith<$Res> {
  factory $SocialMediaContactCopyWith(
          SocialMediaContact value, $Res Function(SocialMediaContact) then) =
      _$SocialMediaContactCopyWithImpl<$Res, SocialMediaContact>;
  @useResult
  $Res call({String platform, String username, String url, bool isActive});
}

/// @nodoc
class _$SocialMediaContactCopyWithImpl<$Res, $Val extends SocialMediaContact>
    implements $SocialMediaContactCopyWith<$Res> {
  _$SocialMediaContactCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? platform = null,
    Object? username = null,
    Object? url = null,
    Object? isActive = null,
  }) {
    return _then(_value.copyWith(
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SocialMediaContactImplCopyWith<$Res>
    implements $SocialMediaContactCopyWith<$Res> {
  factory _$$SocialMediaContactImplCopyWith(_$SocialMediaContactImpl value,
          $Res Function(_$SocialMediaContactImpl) then) =
      __$$SocialMediaContactImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String platform, String username, String url, bool isActive});
}

/// @nodoc
class __$$SocialMediaContactImplCopyWithImpl<$Res>
    extends _$SocialMediaContactCopyWithImpl<$Res, _$SocialMediaContactImpl>
    implements _$$SocialMediaContactImplCopyWith<$Res> {
  __$$SocialMediaContactImplCopyWithImpl(_$SocialMediaContactImpl _value,
      $Res Function(_$SocialMediaContactImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? platform = null,
    Object? username = null,
    Object? url = null,
    Object? isActive = null,
  }) {
    return _then(_$SocialMediaContactImpl(
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SocialMediaContactImpl implements _SocialMediaContact {
  const _$SocialMediaContactImpl(
      {required this.platform,
      required this.username,
      required this.url,
      this.isActive = true});

  factory _$SocialMediaContactImpl.fromJson(Map<String, dynamic> json) =>
      _$$SocialMediaContactImplFromJson(json);

  @override
  final String platform;
  @override
  final String username;
  @override
  final String url;
  @override
  @JsonKey()
  final bool isActive;

  @override
  String toString() {
    return 'SocialMediaContact(platform: $platform, username: $username, url: $url, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SocialMediaContactImpl &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, platform, username, url, isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SocialMediaContactImplCopyWith<_$SocialMediaContactImpl> get copyWith =>
      __$$SocialMediaContactImplCopyWithImpl<_$SocialMediaContactImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SocialMediaContactImplToJson(
      this,
    );
  }
}

abstract class _SocialMediaContact implements SocialMediaContact {
  const factory _SocialMediaContact(
      {required final String platform,
      required final String username,
      required final String url,
      final bool isActive}) = _$SocialMediaContactImpl;

  factory _SocialMediaContact.fromJson(Map<String, dynamic> json) =
      _$SocialMediaContactImpl.fromJson;

  @override
  String get platform;
  @override
  String get username;
  @override
  String get url;
  @override
  bool get isActive;
  @override
  @JsonKey(ignore: true)
  _$$SocialMediaContactImplCopyWith<_$SocialMediaContactImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserFeedback _$UserFeedbackFromJson(Map<String, dynamic> json) {
  return _UserFeedback.fromJson(json);
}

/// @nodoc
mixin _$UserFeedback {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  FeedbackType get type => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  FeedbackStatus get status => throw _privateConstructorUsedError;
  String? get categoryId => throw _privateConstructorUsedError;
  List<String> get attachmentIds => throw _privateConstructorUsedError;
  String? get adminResponse => throw _privateConstructorUsedError;
  DateTime? get respondedAt => throw _privateConstructorUsedError;
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserFeedbackCopyWith<UserFeedback> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserFeedbackCopyWith<$Res> {
  factory $UserFeedbackCopyWith(
          UserFeedback value, $Res Function(UserFeedback) then) =
      _$UserFeedbackCopyWithImpl<$Res, UserFeedback>;
  @useResult
  $Res call(
      {String id,
      String userId,
      FeedbackType type,
      String title,
      String content,
      DateTime createdAt,
      FeedbackStatus status,
      String? categoryId,
      List<String> attachmentIds,
      String? adminResponse,
      DateTime? respondedAt,
      Map<String, dynamic> metadata});
}

/// @nodoc
class _$UserFeedbackCopyWithImpl<$Res, $Val extends UserFeedback>
    implements $UserFeedbackCopyWith<$Res> {
  _$UserFeedbackCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? type = null,
    Object? title = null,
    Object? content = null,
    Object? createdAt = null,
    Object? status = null,
    Object? categoryId = freezed,
    Object? attachmentIds = null,
    Object? adminResponse = freezed,
    Object? respondedAt = freezed,
    Object? metadata = null,
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
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FeedbackType,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FeedbackStatus,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      attachmentIds: null == attachmentIds
          ? _value.attachmentIds
          : attachmentIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      adminResponse: freezed == adminResponse
          ? _value.adminResponse
          : adminResponse // ignore: cast_nullable_to_non_nullable
              as String?,
      respondedAt: freezed == respondedAt
          ? _value.respondedAt
          : respondedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserFeedbackImplCopyWith<$Res>
    implements $UserFeedbackCopyWith<$Res> {
  factory _$$UserFeedbackImplCopyWith(
          _$UserFeedbackImpl value, $Res Function(_$UserFeedbackImpl) then) =
      __$$UserFeedbackImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      FeedbackType type,
      String title,
      String content,
      DateTime createdAt,
      FeedbackStatus status,
      String? categoryId,
      List<String> attachmentIds,
      String? adminResponse,
      DateTime? respondedAt,
      Map<String, dynamic> metadata});
}

/// @nodoc
class __$$UserFeedbackImplCopyWithImpl<$Res>
    extends _$UserFeedbackCopyWithImpl<$Res, _$UserFeedbackImpl>
    implements _$$UserFeedbackImplCopyWith<$Res> {
  __$$UserFeedbackImplCopyWithImpl(
      _$UserFeedbackImpl _value, $Res Function(_$UserFeedbackImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? type = null,
    Object? title = null,
    Object? content = null,
    Object? createdAt = null,
    Object? status = null,
    Object? categoryId = freezed,
    Object? attachmentIds = null,
    Object? adminResponse = freezed,
    Object? respondedAt = freezed,
    Object? metadata = null,
  }) {
    return _then(_$UserFeedbackImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FeedbackType,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FeedbackStatus,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      attachmentIds: null == attachmentIds
          ? _value._attachmentIds
          : attachmentIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      adminResponse: freezed == adminResponse
          ? _value.adminResponse
          : adminResponse // ignore: cast_nullable_to_non_nullable
              as String?,
      respondedAt: freezed == respondedAt
          ? _value.respondedAt
          : respondedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      metadata: null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserFeedbackImpl implements _UserFeedback {
  const _$UserFeedbackImpl(
      {required this.id,
      required this.userId,
      required this.type,
      required this.title,
      required this.content,
      required this.createdAt,
      this.status = FeedbackStatus.open,
      this.categoryId,
      final List<String> attachmentIds = const [],
      this.adminResponse,
      this.respondedAt,
      final Map<String, dynamic> metadata = const {}})
      : _attachmentIds = attachmentIds,
        _metadata = metadata;

  factory _$UserFeedbackImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserFeedbackImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final FeedbackType type;
  @override
  final String title;
  @override
  final String content;
  @override
  final DateTime createdAt;
  @override
  @JsonKey()
  final FeedbackStatus status;
  @override
  final String? categoryId;
  final List<String> _attachmentIds;
  @override
  @JsonKey()
  List<String> get attachmentIds {
    if (_attachmentIds is EqualUnmodifiableListView) return _attachmentIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attachmentIds);
  }

  @override
  final String? adminResponse;
  @override
  final DateTime? respondedAt;
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
    return 'UserFeedback(id: $id, userId: $userId, type: $type, title: $title, content: $content, createdAt: $createdAt, status: $status, categoryId: $categoryId, attachmentIds: $attachmentIds, adminResponse: $adminResponse, respondedAt: $respondedAt, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserFeedbackImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            const DeepCollectionEquality()
                .equals(other._attachmentIds, _attachmentIds) &&
            (identical(other.adminResponse, adminResponse) ||
                other.adminResponse == adminResponse) &&
            (identical(other.respondedAt, respondedAt) ||
                other.respondedAt == respondedAt) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      type,
      title,
      content,
      createdAt,
      status,
      categoryId,
      const DeepCollectionEquality().hash(_attachmentIds),
      adminResponse,
      respondedAt,
      const DeepCollectionEquality().hash(_metadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserFeedbackImplCopyWith<_$UserFeedbackImpl> get copyWith =>
      __$$UserFeedbackImplCopyWithImpl<_$UserFeedbackImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserFeedbackImplToJson(
      this,
    );
  }
}

abstract class _UserFeedback implements UserFeedback {
  const factory _UserFeedback(
      {required final String id,
      required final String userId,
      required final FeedbackType type,
      required final String title,
      required final String content,
      required final DateTime createdAt,
      final FeedbackStatus status,
      final String? categoryId,
      final List<String> attachmentIds,
      final String? adminResponse,
      final DateTime? respondedAt,
      final Map<String, dynamic> metadata}) = _$UserFeedbackImpl;

  factory _UserFeedback.fromJson(Map<String, dynamic> json) =
      _$UserFeedbackImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  FeedbackType get type;
  @override
  String get title;
  @override
  String get content;
  @override
  DateTime get createdAt;
  @override
  FeedbackStatus get status;
  @override
  String? get categoryId;
  @override
  List<String> get attachmentIds;
  @override
  String? get adminResponse;
  @override
  DateTime? get respondedAt;
  @override
  Map<String, dynamic> get metadata;
  @override
  @JsonKey(ignore: true)
  _$$UserFeedbackImplCopyWith<_$UserFeedbackImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HelpSearchResult _$HelpSearchResultFromJson(Map<String, dynamic> json) {
  return _HelpSearchResult.fromJson(json);
}

/// @nodoc
mixin _$HelpSearchResult {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get excerpt => throw _privateConstructorUsedError;
  HelpResultType get type => throw _privateConstructorUsedError;
  double get relevanceScore => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  String? get categoryName => throw _privateConstructorUsedError;
  List<String> get highlightedTerms => throw _privateConstructorUsedError;
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HelpSearchResultCopyWith<HelpSearchResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HelpSearchResultCopyWith<$Res> {
  factory $HelpSearchResultCopyWith(
          HelpSearchResult value, $Res Function(HelpSearchResult) then) =
      _$HelpSearchResultCopyWithImpl<$Res, HelpSearchResult>;
  @useResult
  $Res call(
      {String id,
      String title,
      String excerpt,
      HelpResultType type,
      double relevanceScore,
      String? url,
      String? categoryName,
      List<String> highlightedTerms,
      Map<String, dynamic> metadata});
}

/// @nodoc
class _$HelpSearchResultCopyWithImpl<$Res, $Val extends HelpSearchResult>
    implements $HelpSearchResultCopyWith<$Res> {
  _$HelpSearchResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? excerpt = null,
    Object? type = null,
    Object? relevanceScore = null,
    Object? url = freezed,
    Object? categoryName = freezed,
    Object? highlightedTerms = null,
    Object? metadata = null,
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
      excerpt: null == excerpt
          ? _value.excerpt
          : excerpt // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as HelpResultType,
      relevanceScore: null == relevanceScore
          ? _value.relevanceScore
          : relevanceScore // ignore: cast_nullable_to_non_nullable
              as double,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      highlightedTerms: null == highlightedTerms
          ? _value.highlightedTerms
          : highlightedTerms // ignore: cast_nullable_to_non_nullable
              as List<String>,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HelpSearchResultImplCopyWith<$Res>
    implements $HelpSearchResultCopyWith<$Res> {
  factory _$$HelpSearchResultImplCopyWith(_$HelpSearchResultImpl value,
          $Res Function(_$HelpSearchResultImpl) then) =
      __$$HelpSearchResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String excerpt,
      HelpResultType type,
      double relevanceScore,
      String? url,
      String? categoryName,
      List<String> highlightedTerms,
      Map<String, dynamic> metadata});
}

/// @nodoc
class __$$HelpSearchResultImplCopyWithImpl<$Res>
    extends _$HelpSearchResultCopyWithImpl<$Res, _$HelpSearchResultImpl>
    implements _$$HelpSearchResultImplCopyWith<$Res> {
  __$$HelpSearchResultImplCopyWithImpl(_$HelpSearchResultImpl _value,
      $Res Function(_$HelpSearchResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? excerpt = null,
    Object? type = null,
    Object? relevanceScore = null,
    Object? url = freezed,
    Object? categoryName = freezed,
    Object? highlightedTerms = null,
    Object? metadata = null,
  }) {
    return _then(_$HelpSearchResultImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      excerpt: null == excerpt
          ? _value.excerpt
          : excerpt // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as HelpResultType,
      relevanceScore: null == relevanceScore
          ? _value.relevanceScore
          : relevanceScore // ignore: cast_nullable_to_non_nullable
              as double,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      highlightedTerms: null == highlightedTerms
          ? _value._highlightedTerms
          : highlightedTerms // ignore: cast_nullable_to_non_nullable
              as List<String>,
      metadata: null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HelpSearchResultImpl implements _HelpSearchResult {
  const _$HelpSearchResultImpl(
      {required this.id,
      required this.title,
      required this.excerpt,
      required this.type,
      required this.relevanceScore,
      this.url,
      this.categoryName,
      final List<String> highlightedTerms = const [],
      final Map<String, dynamic> metadata = const {}})
      : _highlightedTerms = highlightedTerms,
        _metadata = metadata;

  factory _$HelpSearchResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$HelpSearchResultImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String excerpt;
  @override
  final HelpResultType type;
  @override
  final double relevanceScore;
  @override
  final String? url;
  @override
  final String? categoryName;
  final List<String> _highlightedTerms;
  @override
  @JsonKey()
  List<String> get highlightedTerms {
    if (_highlightedTerms is EqualUnmodifiableListView)
      return _highlightedTerms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_highlightedTerms);
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
    return 'HelpSearchResult(id: $id, title: $title, excerpt: $excerpt, type: $type, relevanceScore: $relevanceScore, url: $url, categoryName: $categoryName, highlightedTerms: $highlightedTerms, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HelpSearchResultImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.excerpt, excerpt) || other.excerpt == excerpt) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.relevanceScore, relevanceScore) ||
                other.relevanceScore == relevanceScore) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            const DeepCollectionEquality()
                .equals(other._highlightedTerms, _highlightedTerms) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      excerpt,
      type,
      relevanceScore,
      url,
      categoryName,
      const DeepCollectionEquality().hash(_highlightedTerms),
      const DeepCollectionEquality().hash(_metadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HelpSearchResultImplCopyWith<_$HelpSearchResultImpl> get copyWith =>
      __$$HelpSearchResultImplCopyWithImpl<_$HelpSearchResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HelpSearchResultImplToJson(
      this,
    );
  }
}

abstract class _HelpSearchResult implements HelpSearchResult {
  const factory _HelpSearchResult(
      {required final String id,
      required final String title,
      required final String excerpt,
      required final HelpResultType type,
      required final double relevanceScore,
      final String? url,
      final String? categoryName,
      final List<String> highlightedTerms,
      final Map<String, dynamic> metadata}) = _$HelpSearchResultImpl;

  factory _HelpSearchResult.fromJson(Map<String, dynamic> json) =
      _$HelpSearchResultImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get excerpt;
  @override
  HelpResultType get type;
  @override
  double get relevanceScore;
  @override
  String? get url;
  @override
  String? get categoryName;
  @override
  List<String> get highlightedTerms;
  @override
  Map<String, dynamic> get metadata;
  @override
  @JsonKey(ignore: true)
  _$$HelpSearchResultImplCopyWith<_$HelpSearchResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SystemStatus _$SystemStatusFromJson(Map<String, dynamic> json) {
  return _SystemStatus.fromJson(json);
}

/// @nodoc
mixin _$SystemStatus {
  String get id => throw _privateConstructorUsedError;
  String get serviceName => throw _privateConstructorUsedError;
  ServiceStatus get status => throw _privateConstructorUsedError;
  DateTime get lastUpdated => throw _privateConstructorUsedError;
  String? get statusMessage => throw _privateConstructorUsedError;
  List<StatusIncident> get recentIncidents =>
      throw _privateConstructorUsedError;
  Map<String, double> get performanceMetrics =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SystemStatusCopyWith<SystemStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SystemStatusCopyWith<$Res> {
  factory $SystemStatusCopyWith(
          SystemStatus value, $Res Function(SystemStatus) then) =
      _$SystemStatusCopyWithImpl<$Res, SystemStatus>;
  @useResult
  $Res call(
      {String id,
      String serviceName,
      ServiceStatus status,
      DateTime lastUpdated,
      String? statusMessage,
      List<StatusIncident> recentIncidents,
      Map<String, double> performanceMetrics});
}

/// @nodoc
class _$SystemStatusCopyWithImpl<$Res, $Val extends SystemStatus>
    implements $SystemStatusCopyWith<$Res> {
  _$SystemStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? serviceName = null,
    Object? status = null,
    Object? lastUpdated = null,
    Object? statusMessage = freezed,
    Object? recentIncidents = null,
    Object? performanceMetrics = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      serviceName: null == serviceName
          ? _value.serviceName
          : serviceName // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ServiceStatus,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      statusMessage: freezed == statusMessage
          ? _value.statusMessage
          : statusMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      recentIncidents: null == recentIncidents
          ? _value.recentIncidents
          : recentIncidents // ignore: cast_nullable_to_non_nullable
              as List<StatusIncident>,
      performanceMetrics: null == performanceMetrics
          ? _value.performanceMetrics
          : performanceMetrics // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SystemStatusImplCopyWith<$Res>
    implements $SystemStatusCopyWith<$Res> {
  factory _$$SystemStatusImplCopyWith(
          _$SystemStatusImpl value, $Res Function(_$SystemStatusImpl) then) =
      __$$SystemStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String serviceName,
      ServiceStatus status,
      DateTime lastUpdated,
      String? statusMessage,
      List<StatusIncident> recentIncidents,
      Map<String, double> performanceMetrics});
}

/// @nodoc
class __$$SystemStatusImplCopyWithImpl<$Res>
    extends _$SystemStatusCopyWithImpl<$Res, _$SystemStatusImpl>
    implements _$$SystemStatusImplCopyWith<$Res> {
  __$$SystemStatusImplCopyWithImpl(
      _$SystemStatusImpl _value, $Res Function(_$SystemStatusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? serviceName = null,
    Object? status = null,
    Object? lastUpdated = null,
    Object? statusMessage = freezed,
    Object? recentIncidents = null,
    Object? performanceMetrics = null,
  }) {
    return _then(_$SystemStatusImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      serviceName: null == serviceName
          ? _value.serviceName
          : serviceName // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ServiceStatus,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      statusMessage: freezed == statusMessage
          ? _value.statusMessage
          : statusMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      recentIncidents: null == recentIncidents
          ? _value._recentIncidents
          : recentIncidents // ignore: cast_nullable_to_non_nullable
              as List<StatusIncident>,
      performanceMetrics: null == performanceMetrics
          ? _value._performanceMetrics
          : performanceMetrics // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SystemStatusImpl implements _SystemStatus {
  const _$SystemStatusImpl(
      {required this.id,
      required this.serviceName,
      required this.status,
      required this.lastUpdated,
      this.statusMessage,
      final List<StatusIncident> recentIncidents = const [],
      final Map<String, double> performanceMetrics = const {}})
      : _recentIncidents = recentIncidents,
        _performanceMetrics = performanceMetrics;

  factory _$SystemStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$SystemStatusImplFromJson(json);

  @override
  final String id;
  @override
  final String serviceName;
  @override
  final ServiceStatus status;
  @override
  final DateTime lastUpdated;
  @override
  final String? statusMessage;
  final List<StatusIncident> _recentIncidents;
  @override
  @JsonKey()
  List<StatusIncident> get recentIncidents {
    if (_recentIncidents is EqualUnmodifiableListView) return _recentIncidents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentIncidents);
  }

  final Map<String, double> _performanceMetrics;
  @override
  @JsonKey()
  Map<String, double> get performanceMetrics {
    if (_performanceMetrics is EqualUnmodifiableMapView)
      return _performanceMetrics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_performanceMetrics);
  }

  @override
  String toString() {
    return 'SystemStatus(id: $id, serviceName: $serviceName, status: $status, lastUpdated: $lastUpdated, statusMessage: $statusMessage, recentIncidents: $recentIncidents, performanceMetrics: $performanceMetrics)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SystemStatusImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.serviceName, serviceName) ||
                other.serviceName == serviceName) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated) &&
            (identical(other.statusMessage, statusMessage) ||
                other.statusMessage == statusMessage) &&
            const DeepCollectionEquality()
                .equals(other._recentIncidents, _recentIncidents) &&
            const DeepCollectionEquality()
                .equals(other._performanceMetrics, _performanceMetrics));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      serviceName,
      status,
      lastUpdated,
      statusMessage,
      const DeepCollectionEquality().hash(_recentIncidents),
      const DeepCollectionEquality().hash(_performanceMetrics));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SystemStatusImplCopyWith<_$SystemStatusImpl> get copyWith =>
      __$$SystemStatusImplCopyWithImpl<_$SystemStatusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SystemStatusImplToJson(
      this,
    );
  }
}

abstract class _SystemStatus implements SystemStatus {
  const factory _SystemStatus(
      {required final String id,
      required final String serviceName,
      required final ServiceStatus status,
      required final DateTime lastUpdated,
      final String? statusMessage,
      final List<StatusIncident> recentIncidents,
      final Map<String, double> performanceMetrics}) = _$SystemStatusImpl;

  factory _SystemStatus.fromJson(Map<String, dynamic> json) =
      _$SystemStatusImpl.fromJson;

  @override
  String get id;
  @override
  String get serviceName;
  @override
  ServiceStatus get status;
  @override
  DateTime get lastUpdated;
  @override
  String? get statusMessage;
  @override
  List<StatusIncident> get recentIncidents;
  @override
  Map<String, double> get performanceMetrics;
  @override
  @JsonKey(ignore: true)
  _$$SystemStatusImplCopyWith<_$SystemStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StatusIncident _$StatusIncidentFromJson(Map<String, dynamic> json) {
  return _StatusIncident.fromJson(json);
}

/// @nodoc
mixin _$StatusIncident {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  IncidentStatus get status => throw _privateConstructorUsedError;
  IncidentSeverity get severity => throw _privateConstructorUsedError;
  DateTime get startedAt => throw _privateConstructorUsedError;
  DateTime? get resolvedAt => throw _privateConstructorUsedError;
  List<String> get affectedServices => throw _privateConstructorUsedError;
  List<IncidentUpdate> get updates => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatusIncidentCopyWith<StatusIncident> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatusIncidentCopyWith<$Res> {
  factory $StatusIncidentCopyWith(
          StatusIncident value, $Res Function(StatusIncident) then) =
      _$StatusIncidentCopyWithImpl<$Res, StatusIncident>;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      IncidentStatus status,
      IncidentSeverity severity,
      DateTime startedAt,
      DateTime? resolvedAt,
      List<String> affectedServices,
      List<IncidentUpdate> updates});
}

/// @nodoc
class _$StatusIncidentCopyWithImpl<$Res, $Val extends StatusIncident>
    implements $StatusIncidentCopyWith<$Res> {
  _$StatusIncidentCopyWithImpl(this._value, this._then);

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
    Object? severity = null,
    Object? startedAt = null,
    Object? resolvedAt = freezed,
    Object? affectedServices = null,
    Object? updates = null,
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
              as IncidentStatus,
      severity: null == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as IncidentSeverity,
      startedAt: null == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      resolvedAt: freezed == resolvedAt
          ? _value.resolvedAt
          : resolvedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      affectedServices: null == affectedServices
          ? _value.affectedServices
          : affectedServices // ignore: cast_nullable_to_non_nullable
              as List<String>,
      updates: null == updates
          ? _value.updates
          : updates // ignore: cast_nullable_to_non_nullable
              as List<IncidentUpdate>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StatusIncidentImplCopyWith<$Res>
    implements $StatusIncidentCopyWith<$Res> {
  factory _$$StatusIncidentImplCopyWith(_$StatusIncidentImpl value,
          $Res Function(_$StatusIncidentImpl) then) =
      __$$StatusIncidentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      IncidentStatus status,
      IncidentSeverity severity,
      DateTime startedAt,
      DateTime? resolvedAt,
      List<String> affectedServices,
      List<IncidentUpdate> updates});
}

/// @nodoc
class __$$StatusIncidentImplCopyWithImpl<$Res>
    extends _$StatusIncidentCopyWithImpl<$Res, _$StatusIncidentImpl>
    implements _$$StatusIncidentImplCopyWith<$Res> {
  __$$StatusIncidentImplCopyWithImpl(
      _$StatusIncidentImpl _value, $Res Function(_$StatusIncidentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? status = null,
    Object? severity = null,
    Object? startedAt = null,
    Object? resolvedAt = freezed,
    Object? affectedServices = null,
    Object? updates = null,
  }) {
    return _then(_$StatusIncidentImpl(
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
              as IncidentStatus,
      severity: null == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as IncidentSeverity,
      startedAt: null == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      resolvedAt: freezed == resolvedAt
          ? _value.resolvedAt
          : resolvedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      affectedServices: null == affectedServices
          ? _value._affectedServices
          : affectedServices // ignore: cast_nullable_to_non_nullable
              as List<String>,
      updates: null == updates
          ? _value._updates
          : updates // ignore: cast_nullable_to_non_nullable
              as List<IncidentUpdate>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StatusIncidentImpl implements _StatusIncident {
  const _$StatusIncidentImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.status,
      required this.severity,
      required this.startedAt,
      this.resolvedAt,
      final List<String> affectedServices = const [],
      final List<IncidentUpdate> updates = const []})
      : _affectedServices = affectedServices,
        _updates = updates;

  factory _$StatusIncidentImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatusIncidentImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final IncidentStatus status;
  @override
  final IncidentSeverity severity;
  @override
  final DateTime startedAt;
  @override
  final DateTime? resolvedAt;
  final List<String> _affectedServices;
  @override
  @JsonKey()
  List<String> get affectedServices {
    if (_affectedServices is EqualUnmodifiableListView)
      return _affectedServices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_affectedServices);
  }

  final List<IncidentUpdate> _updates;
  @override
  @JsonKey()
  List<IncidentUpdate> get updates {
    if (_updates is EqualUnmodifiableListView) return _updates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_updates);
  }

  @override
  String toString() {
    return 'StatusIncident(id: $id, title: $title, description: $description, status: $status, severity: $severity, startedAt: $startedAt, resolvedAt: $resolvedAt, affectedServices: $affectedServices, updates: $updates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatusIncidentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.severity, severity) ||
                other.severity == severity) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.resolvedAt, resolvedAt) ||
                other.resolvedAt == resolvedAt) &&
            const DeepCollectionEquality()
                .equals(other._affectedServices, _affectedServices) &&
            const DeepCollectionEquality().equals(other._updates, _updates));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      status,
      severity,
      startedAt,
      resolvedAt,
      const DeepCollectionEquality().hash(_affectedServices),
      const DeepCollectionEquality().hash(_updates));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StatusIncidentImplCopyWith<_$StatusIncidentImpl> get copyWith =>
      __$$StatusIncidentImplCopyWithImpl<_$StatusIncidentImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StatusIncidentImplToJson(
      this,
    );
  }
}

abstract class _StatusIncident implements StatusIncident {
  const factory _StatusIncident(
      {required final String id,
      required final String title,
      required final String description,
      required final IncidentStatus status,
      required final IncidentSeverity severity,
      required final DateTime startedAt,
      final DateTime? resolvedAt,
      final List<String> affectedServices,
      final List<IncidentUpdate> updates}) = _$StatusIncidentImpl;

  factory _StatusIncident.fromJson(Map<String, dynamic> json) =
      _$StatusIncidentImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  IncidentStatus get status;
  @override
  IncidentSeverity get severity;
  @override
  DateTime get startedAt;
  @override
  DateTime? get resolvedAt;
  @override
  List<String> get affectedServices;
  @override
  List<IncidentUpdate> get updates;
  @override
  @JsonKey(ignore: true)
  _$$StatusIncidentImplCopyWith<_$StatusIncidentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

IncidentUpdate _$IncidentUpdateFromJson(Map<String, dynamic> json) {
  return _IncidentUpdate.fromJson(json);
}

/// @nodoc
mixin _$IncidentUpdate {
  String get id => throw _privateConstructorUsedError;
  String get incidentId => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  IncidentStatus get status => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  String? get authorId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IncidentUpdateCopyWith<IncidentUpdate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IncidentUpdateCopyWith<$Res> {
  factory $IncidentUpdateCopyWith(
          IncidentUpdate value, $Res Function(IncidentUpdate) then) =
      _$IncidentUpdateCopyWithImpl<$Res, IncidentUpdate>;
  @useResult
  $Res call(
      {String id,
      String incidentId,
      String message,
      IncidentStatus status,
      DateTime timestamp,
      String? authorId});
}

/// @nodoc
class _$IncidentUpdateCopyWithImpl<$Res, $Val extends IncidentUpdate>
    implements $IncidentUpdateCopyWith<$Res> {
  _$IncidentUpdateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? incidentId = null,
    Object? message = null,
    Object? status = null,
    Object? timestamp = null,
    Object? authorId = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      incidentId: null == incidentId
          ? _value.incidentId
          : incidentId // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as IncidentStatus,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      authorId: freezed == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IncidentUpdateImplCopyWith<$Res>
    implements $IncidentUpdateCopyWith<$Res> {
  factory _$$IncidentUpdateImplCopyWith(_$IncidentUpdateImpl value,
          $Res Function(_$IncidentUpdateImpl) then) =
      __$$IncidentUpdateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String incidentId,
      String message,
      IncidentStatus status,
      DateTime timestamp,
      String? authorId});
}

/// @nodoc
class __$$IncidentUpdateImplCopyWithImpl<$Res>
    extends _$IncidentUpdateCopyWithImpl<$Res, _$IncidentUpdateImpl>
    implements _$$IncidentUpdateImplCopyWith<$Res> {
  __$$IncidentUpdateImplCopyWithImpl(
      _$IncidentUpdateImpl _value, $Res Function(_$IncidentUpdateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? incidentId = null,
    Object? message = null,
    Object? status = null,
    Object? timestamp = null,
    Object? authorId = freezed,
  }) {
    return _then(_$IncidentUpdateImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      incidentId: null == incidentId
          ? _value.incidentId
          : incidentId // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as IncidentStatus,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      authorId: freezed == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IncidentUpdateImpl implements _IncidentUpdate {
  const _$IncidentUpdateImpl(
      {required this.id,
      required this.incidentId,
      required this.message,
      required this.status,
      required this.timestamp,
      this.authorId});

  factory _$IncidentUpdateImpl.fromJson(Map<String, dynamic> json) =>
      _$$IncidentUpdateImplFromJson(json);

  @override
  final String id;
  @override
  final String incidentId;
  @override
  final String message;
  @override
  final IncidentStatus status;
  @override
  final DateTime timestamp;
  @override
  final String? authorId;

  @override
  String toString() {
    return 'IncidentUpdate(id: $id, incidentId: $incidentId, message: $message, status: $status, timestamp: $timestamp, authorId: $authorId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IncidentUpdateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.incidentId, incidentId) ||
                other.incidentId == incidentId) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.authorId, authorId) ||
                other.authorId == authorId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, incidentId, message, status, timestamp, authorId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IncidentUpdateImplCopyWith<_$IncidentUpdateImpl> get copyWith =>
      __$$IncidentUpdateImplCopyWithImpl<_$IncidentUpdateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IncidentUpdateImplToJson(
      this,
    );
  }
}

abstract class _IncidentUpdate implements IncidentUpdate {
  const factory _IncidentUpdate(
      {required final String id,
      required final String incidentId,
      required final String message,
      required final IncidentStatus status,
      required final DateTime timestamp,
      final String? authorId}) = _$IncidentUpdateImpl;

  factory _IncidentUpdate.fromJson(Map<String, dynamic> json) =
      _$IncidentUpdateImpl.fromJson;

  @override
  String get id;
  @override
  String get incidentId;
  @override
  String get message;
  @override
  IncidentStatus get status;
  @override
  DateTime get timestamp;
  @override
  String? get authorId;
  @override
  @JsonKey(ignore: true)
  _$$IncidentUpdateImplCopyWith<_$IncidentUpdateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
