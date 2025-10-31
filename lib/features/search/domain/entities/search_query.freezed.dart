// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_query.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SearchQuery _$SearchQueryFromJson(Map<String, dynamic> json) {
  return _SearchQuery.fromJson(json);
}

/// @nodoc
mixin _$SearchQuery {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get query => throw _privateConstructorUsedError;
  SearchScope get scope => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  List<SearchFilter> get filters => throw _privateConstructorUsedError;
  List<SearchSort> get sorting => throw _privateConstructorUsedError;
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  bool? get isSaved => throw _privateConstructorUsedError;
  DateTime? get lastUsedAt => throw _privateConstructorUsedError;
  int? get resultCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchQueryCopyWith<SearchQuery> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchQueryCopyWith<$Res> {
  factory $SearchQueryCopyWith(
          SearchQuery value, $Res Function(SearchQuery) then) =
      _$SearchQueryCopyWithImpl<$Res, SearchQuery>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String query,
      SearchScope scope,
      DateTime createdAt,
      List<SearchFilter> filters,
      List<SearchSort> sorting,
      Map<String, dynamic> metadata,
      String? name,
      bool? isSaved,
      DateTime? lastUsedAt,
      int? resultCount});
}

/// @nodoc
class _$SearchQueryCopyWithImpl<$Res, $Val extends SearchQuery>
    implements $SearchQueryCopyWith<$Res> {
  _$SearchQueryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? query = null,
    Object? scope = null,
    Object? createdAt = null,
    Object? filters = null,
    Object? sorting = null,
    Object? metadata = null,
    Object? name = freezed,
    Object? isSaved = freezed,
    Object? lastUsedAt = freezed,
    Object? resultCount = freezed,
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
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      scope: null == scope
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as SearchScope,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      filters: null == filters
          ? _value.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as List<SearchFilter>,
      sorting: null == sorting
          ? _value.sorting
          : sorting // ignore: cast_nullable_to_non_nullable
              as List<SearchSort>,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      isSaved: freezed == isSaved
          ? _value.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastUsedAt: freezed == lastUsedAt
          ? _value.lastUsedAt
          : lastUsedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      resultCount: freezed == resultCount
          ? _value.resultCount
          : resultCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchQueryImplCopyWith<$Res>
    implements $SearchQueryCopyWith<$Res> {
  factory _$$SearchQueryImplCopyWith(
          _$SearchQueryImpl value, $Res Function(_$SearchQueryImpl) then) =
      __$$SearchQueryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String query,
      SearchScope scope,
      DateTime createdAt,
      List<SearchFilter> filters,
      List<SearchSort> sorting,
      Map<String, dynamic> metadata,
      String? name,
      bool? isSaved,
      DateTime? lastUsedAt,
      int? resultCount});
}

/// @nodoc
class __$$SearchQueryImplCopyWithImpl<$Res>
    extends _$SearchQueryCopyWithImpl<$Res, _$SearchQueryImpl>
    implements _$$SearchQueryImplCopyWith<$Res> {
  __$$SearchQueryImplCopyWithImpl(
      _$SearchQueryImpl _value, $Res Function(_$SearchQueryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? query = null,
    Object? scope = null,
    Object? createdAt = null,
    Object? filters = null,
    Object? sorting = null,
    Object? metadata = null,
    Object? name = freezed,
    Object? isSaved = freezed,
    Object? lastUsedAt = freezed,
    Object? resultCount = freezed,
  }) {
    return _then(_$SearchQueryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      scope: null == scope
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as SearchScope,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      filters: null == filters
          ? _value._filters
          : filters // ignore: cast_nullable_to_non_nullable
              as List<SearchFilter>,
      sorting: null == sorting
          ? _value._sorting
          : sorting // ignore: cast_nullable_to_non_nullable
              as List<SearchSort>,
      metadata: null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      isSaved: freezed == isSaved
          ? _value.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastUsedAt: freezed == lastUsedAt
          ? _value.lastUsedAt
          : lastUsedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      resultCount: freezed == resultCount
          ? _value.resultCount
          : resultCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchQueryImpl implements _SearchQuery {
  const _$SearchQueryImpl(
      {required this.id,
      required this.userId,
      required this.query,
      required this.scope,
      required this.createdAt,
      final List<SearchFilter> filters = const [],
      final List<SearchSort> sorting = const [],
      final Map<String, dynamic> metadata = const {},
      this.name,
      this.isSaved,
      this.lastUsedAt,
      this.resultCount})
      : _filters = filters,
        _sorting = sorting,
        _metadata = metadata;

  factory _$SearchQueryImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchQueryImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String query;
  @override
  final SearchScope scope;
  @override
  final DateTime createdAt;
  final List<SearchFilter> _filters;
  @override
  @JsonKey()
  List<SearchFilter> get filters {
    if (_filters is EqualUnmodifiableListView) return _filters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filters);
  }

  final List<SearchSort> _sorting;
  @override
  @JsonKey()
  List<SearchSort> get sorting {
    if (_sorting is EqualUnmodifiableListView) return _sorting;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sorting);
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
  final String? name;
  @override
  final bool? isSaved;
  @override
  final DateTime? lastUsedAt;
  @override
  final int? resultCount;

  @override
  String toString() {
    return 'SearchQuery(id: $id, userId: $userId, query: $query, scope: $scope, createdAt: $createdAt, filters: $filters, sorting: $sorting, metadata: $metadata, name: $name, isSaved: $isSaved, lastUsedAt: $lastUsedAt, resultCount: $resultCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchQueryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.scope, scope) || other.scope == scope) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other._filters, _filters) &&
            const DeepCollectionEquality().equals(other._sorting, _sorting) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isSaved, isSaved) || other.isSaved == isSaved) &&
            (identical(other.lastUsedAt, lastUsedAt) ||
                other.lastUsedAt == lastUsedAt) &&
            (identical(other.resultCount, resultCount) ||
                other.resultCount == resultCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      query,
      scope,
      createdAt,
      const DeepCollectionEquality().hash(_filters),
      const DeepCollectionEquality().hash(_sorting),
      const DeepCollectionEquality().hash(_metadata),
      name,
      isSaved,
      lastUsedAt,
      resultCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchQueryImplCopyWith<_$SearchQueryImpl> get copyWith =>
      __$$SearchQueryImplCopyWithImpl<_$SearchQueryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchQueryImplToJson(
      this,
    );
  }
}

abstract class _SearchQuery implements SearchQuery {
  const factory _SearchQuery(
      {required final String id,
      required final String userId,
      required final String query,
      required final SearchScope scope,
      required final DateTime createdAt,
      final List<SearchFilter> filters,
      final List<SearchSort> sorting,
      final Map<String, dynamic> metadata,
      final String? name,
      final bool? isSaved,
      final DateTime? lastUsedAt,
      final int? resultCount}) = _$SearchQueryImpl;

  factory _SearchQuery.fromJson(Map<String, dynamic> json) =
      _$SearchQueryImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get query;
  @override
  SearchScope get scope;
  @override
  DateTime get createdAt;
  @override
  List<SearchFilter> get filters;
  @override
  List<SearchSort> get sorting;
  @override
  Map<String, dynamic> get metadata;
  @override
  String? get name;
  @override
  bool? get isSaved;
  @override
  DateTime? get lastUsedAt;
  @override
  int? get resultCount;
  @override
  @JsonKey(ignore: true)
  _$$SearchQueryImplCopyWith<_$SearchQueryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SearchFilter _$SearchFilterFromJson(Map<String, dynamic> json) {
  return _SearchFilter.fromJson(json);
}

/// @nodoc
mixin _$SearchFilter {
  String get field => throw _privateConstructorUsedError;
  FilterType get type => throw _privateConstructorUsedError;
  FilterOperator get operator => throw _privateConstructorUsedError;
  dynamic get value => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;
  bool? get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchFilterCopyWith<SearchFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchFilterCopyWith<$Res> {
  factory $SearchFilterCopyWith(
          SearchFilter value, $Res Function(SearchFilter) then) =
      _$SearchFilterCopyWithImpl<$Res, SearchFilter>;
  @useResult
  $Res call(
      {String field,
      FilterType type,
      FilterOperator operator,
      dynamic value,
      String? displayName,
      bool? isActive});
}

/// @nodoc
class _$SearchFilterCopyWithImpl<$Res, $Val extends SearchFilter>
    implements $SearchFilterCopyWith<$Res> {
  _$SearchFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field = null,
    Object? type = null,
    Object? operator = null,
    Object? value = freezed,
    Object? displayName = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_value.copyWith(
      field: null == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FilterType,
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
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchFilterImplCopyWith<$Res>
    implements $SearchFilterCopyWith<$Res> {
  factory _$$SearchFilterImplCopyWith(
          _$SearchFilterImpl value, $Res Function(_$SearchFilterImpl) then) =
      __$$SearchFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String field,
      FilterType type,
      FilterOperator operator,
      dynamic value,
      String? displayName,
      bool? isActive});
}

/// @nodoc
class __$$SearchFilterImplCopyWithImpl<$Res>
    extends _$SearchFilterCopyWithImpl<$Res, _$SearchFilterImpl>
    implements _$$SearchFilterImplCopyWith<$Res> {
  __$$SearchFilterImplCopyWithImpl(
      _$SearchFilterImpl _value, $Res Function(_$SearchFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field = null,
    Object? type = null,
    Object? operator = null,
    Object? value = freezed,
    Object? displayName = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_$SearchFilterImpl(
      field: null == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FilterType,
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
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchFilterImpl implements _SearchFilter {
  const _$SearchFilterImpl(
      {required this.field,
      required this.type,
      required this.operator,
      required this.value,
      this.displayName,
      this.isActive});

  factory _$SearchFilterImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchFilterImplFromJson(json);

  @override
  final String field;
  @override
  final FilterType type;
  @override
  final FilterOperator operator;
  @override
  final dynamic value;
  @override
  final String? displayName;
  @override
  final bool? isActive;

  @override
  String toString() {
    return 'SearchFilter(field: $field, type: $type, operator: $operator, value: $value, displayName: $displayName, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchFilterImpl &&
            (identical(other.field, field) || other.field == field) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.operator, operator) ||
                other.operator == operator) &&
            const DeepCollectionEquality().equals(other.value, value) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, field, type, operator,
      const DeepCollectionEquality().hash(value), displayName, isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchFilterImplCopyWith<_$SearchFilterImpl> get copyWith =>
      __$$SearchFilterImplCopyWithImpl<_$SearchFilterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchFilterImplToJson(
      this,
    );
  }
}

abstract class _SearchFilter implements SearchFilter {
  const factory _SearchFilter(
      {required final String field,
      required final FilterType type,
      required final FilterOperator operator,
      required final dynamic value,
      final String? displayName,
      final bool? isActive}) = _$SearchFilterImpl;

  factory _SearchFilter.fromJson(Map<String, dynamic> json) =
      _$SearchFilterImpl.fromJson;

  @override
  String get field;
  @override
  FilterType get type;
  @override
  FilterOperator get operator;
  @override
  dynamic get value;
  @override
  String? get displayName;
  @override
  bool? get isActive;
  @override
  @JsonKey(ignore: true)
  _$$SearchFilterImplCopyWith<_$SearchFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SearchSort _$SearchSortFromJson(Map<String, dynamic> json) {
  return _SearchSort.fromJson(json);
}

/// @nodoc
mixin _$SearchSort {
  String get field => throw _privateConstructorUsedError;
  SortDirection get direction => throw _privateConstructorUsedError;
  int get priority => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchSortCopyWith<SearchSort> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchSortCopyWith<$Res> {
  factory $SearchSortCopyWith(
          SearchSort value, $Res Function(SearchSort) then) =
      _$SearchSortCopyWithImpl<$Res, SearchSort>;
  @useResult
  $Res call(
      {String field,
      SortDirection direction,
      int priority,
      String? displayName});
}

/// @nodoc
class _$SearchSortCopyWithImpl<$Res, $Val extends SearchSort>
    implements $SearchSortCopyWith<$Res> {
  _$SearchSortCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field = null,
    Object? direction = null,
    Object? priority = null,
    Object? displayName = freezed,
  }) {
    return _then(_value.copyWith(
      field: null == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as String,
      direction: null == direction
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as SortDirection,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchSortImplCopyWith<$Res>
    implements $SearchSortCopyWith<$Res> {
  factory _$$SearchSortImplCopyWith(
          _$SearchSortImpl value, $Res Function(_$SearchSortImpl) then) =
      __$$SearchSortImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String field,
      SortDirection direction,
      int priority,
      String? displayName});
}

/// @nodoc
class __$$SearchSortImplCopyWithImpl<$Res>
    extends _$SearchSortCopyWithImpl<$Res, _$SearchSortImpl>
    implements _$$SearchSortImplCopyWith<$Res> {
  __$$SearchSortImplCopyWithImpl(
      _$SearchSortImpl _value, $Res Function(_$SearchSortImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field = null,
    Object? direction = null,
    Object? priority = null,
    Object? displayName = freezed,
  }) {
    return _then(_$SearchSortImpl(
      field: null == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as String,
      direction: null == direction
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as SortDirection,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchSortImpl implements _SearchSort {
  const _$SearchSortImpl(
      {required this.field,
      required this.direction,
      required this.priority,
      this.displayName});

  factory _$SearchSortImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchSortImplFromJson(json);

  @override
  final String field;
  @override
  final SortDirection direction;
  @override
  final int priority;
  @override
  final String? displayName;

  @override
  String toString() {
    return 'SearchSort(field: $field, direction: $direction, priority: $priority, displayName: $displayName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchSortImpl &&
            (identical(other.field, field) || other.field == field) &&
            (identical(other.direction, direction) ||
                other.direction == direction) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, field, direction, priority, displayName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchSortImplCopyWith<_$SearchSortImpl> get copyWith =>
      __$$SearchSortImplCopyWithImpl<_$SearchSortImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchSortImplToJson(
      this,
    );
  }
}

abstract class _SearchSort implements SearchSort {
  const factory _SearchSort(
      {required final String field,
      required final SortDirection direction,
      required final int priority,
      final String? displayName}) = _$SearchSortImpl;

  factory _SearchSort.fromJson(Map<String, dynamic> json) =
      _$SearchSortImpl.fromJson;

  @override
  String get field;
  @override
  SortDirection get direction;
  @override
  int get priority;
  @override
  String? get displayName;
  @override
  @JsonKey(ignore: true)
  _$$SearchSortImplCopyWith<_$SearchSortImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SearchResult _$SearchResultFromJson(Map<String, dynamic> json) {
  return _SearchResult.fromJson(json);
}

/// @nodoc
mixin _$SearchResult {
  String get id => throw _privateConstructorUsedError;
  SearchResultType get type => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  Map<String, dynamic> get data => throw _privateConstructorUsedError;
  double get relevanceScore => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  Map<String, String> get highlights => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchResultCopyWith<SearchResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchResultCopyWith<$Res> {
  factory $SearchResultCopyWith(
          SearchResult value, $Res Function(SearchResult) then) =
      _$SearchResultCopyWithImpl<$Res, SearchResult>;
  @useResult
  $Res call(
      {String id,
      SearchResultType type,
      String title,
      String description,
      Map<String, dynamic> data,
      double relevanceScore,
      DateTime timestamp,
      String? imageUrl,
      String? url,
      List<String> tags,
      Map<String, String> highlights,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class _$SearchResultCopyWithImpl<$Res, $Val extends SearchResult>
    implements $SearchResultCopyWith<$Res> {
  _$SearchResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? title = null,
    Object? description = null,
    Object? data = null,
    Object? relevanceScore = null,
    Object? timestamp = null,
    Object? imageUrl = freezed,
    Object? url = freezed,
    Object? tags = null,
    Object? highlights = null,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SearchResultType,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      relevanceScore: null == relevanceScore
          ? _value.relevanceScore
          : relevanceScore // ignore: cast_nullable_to_non_nullable
              as double,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      highlights: null == highlights
          ? _value.highlights
          : highlights // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchResultImplCopyWith<$Res>
    implements $SearchResultCopyWith<$Res> {
  factory _$$SearchResultImplCopyWith(
          _$SearchResultImpl value, $Res Function(_$SearchResultImpl) then) =
      __$$SearchResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      SearchResultType type,
      String title,
      String description,
      Map<String, dynamic> data,
      double relevanceScore,
      DateTime timestamp,
      String? imageUrl,
      String? url,
      List<String> tags,
      Map<String, String> highlights,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class __$$SearchResultImplCopyWithImpl<$Res>
    extends _$SearchResultCopyWithImpl<$Res, _$SearchResultImpl>
    implements _$$SearchResultImplCopyWith<$Res> {
  __$$SearchResultImplCopyWithImpl(
      _$SearchResultImpl _value, $Res Function(_$SearchResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? title = null,
    Object? description = null,
    Object? data = null,
    Object? relevanceScore = null,
    Object? timestamp = null,
    Object? imageUrl = freezed,
    Object? url = freezed,
    Object? tags = null,
    Object? highlights = null,
    Object? metadata = freezed,
  }) {
    return _then(_$SearchResultImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SearchResultType,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      relevanceScore: null == relevanceScore
          ? _value.relevanceScore
          : relevanceScore // ignore: cast_nullable_to_non_nullable
              as double,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      highlights: null == highlights
          ? _value._highlights
          : highlights // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchResultImpl implements _SearchResult {
  const _$SearchResultImpl(
      {required this.id,
      required this.type,
      required this.title,
      required this.description,
      required final Map<String, dynamic> data,
      required this.relevanceScore,
      required this.timestamp,
      this.imageUrl,
      this.url,
      final List<String> tags = const [],
      final Map<String, String> highlights = const {},
      final Map<String, dynamic>? metadata})
      : _data = data,
        _tags = tags,
        _highlights = highlights,
        _metadata = metadata;

  factory _$SearchResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchResultImplFromJson(json);

  @override
  final String id;
  @override
  final SearchResultType type;
  @override
  final String title;
  @override
  final String description;
  final Map<String, dynamic> _data;
  @override
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  final double relevanceScore;
  @override
  final DateTime timestamp;
  @override
  final String? imageUrl;
  @override
  final String? url;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  final Map<String, String> _highlights;
  @override
  @JsonKey()
  Map<String, String> get highlights {
    if (_highlights is EqualUnmodifiableMapView) return _highlights;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_highlights);
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
    return 'SearchResult(id: $id, type: $type, title: $title, description: $description, data: $data, relevanceScore: $relevanceScore, timestamp: $timestamp, imageUrl: $imageUrl, url: $url, tags: $tags, highlights: $highlights, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchResultImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.relevanceScore, relevanceScore) ||
                other.relevanceScore == relevanceScore) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.url, url) || other.url == url) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality()
                .equals(other._highlights, _highlights) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      type,
      title,
      description,
      const DeepCollectionEquality().hash(_data),
      relevanceScore,
      timestamp,
      imageUrl,
      url,
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_highlights),
      const DeepCollectionEquality().hash(_metadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchResultImplCopyWith<_$SearchResultImpl> get copyWith =>
      __$$SearchResultImplCopyWithImpl<_$SearchResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchResultImplToJson(
      this,
    );
  }
}

abstract class _SearchResult implements SearchResult {
  const factory _SearchResult(
      {required final String id,
      required final SearchResultType type,
      required final String title,
      required final String description,
      required final Map<String, dynamic> data,
      required final double relevanceScore,
      required final DateTime timestamp,
      final String? imageUrl,
      final String? url,
      final List<String> tags,
      final Map<String, String> highlights,
      final Map<String, dynamic>? metadata}) = _$SearchResultImpl;

  factory _SearchResult.fromJson(Map<String, dynamic> json) =
      _$SearchResultImpl.fromJson;

  @override
  String get id;
  @override
  SearchResultType get type;
  @override
  String get title;
  @override
  String get description;
  @override
  Map<String, dynamic> get data;
  @override
  double get relevanceScore;
  @override
  DateTime get timestamp;
  @override
  String? get imageUrl;
  @override
  String? get url;
  @override
  List<String> get tags;
  @override
  Map<String, String> get highlights;
  @override
  Map<String, dynamic>? get metadata;
  @override
  @JsonKey(ignore: true)
  _$$SearchResultImplCopyWith<_$SearchResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SearchSuggestion _$SearchSuggestionFromJson(Map<String, dynamic> json) {
  return _SearchSuggestion.fromJson(json);
}

/// @nodoc
mixin _$SearchSuggestion {
  String get text => throw _privateConstructorUsedError;
  SuggestionType get type => throw _privateConstructorUsedError;
  int get frequency => throw _privateConstructorUsedError;
  double? get score => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchSuggestionCopyWith<SearchSuggestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchSuggestionCopyWith<$Res> {
  factory $SearchSuggestionCopyWith(
          SearchSuggestion value, $Res Function(SearchSuggestion) then) =
      _$SearchSuggestionCopyWithImpl<$Res, SearchSuggestion>;
  @useResult
  $Res call(
      {String text,
      SuggestionType type,
      int frequency,
      double? score,
      String? category,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class _$SearchSuggestionCopyWithImpl<$Res, $Val extends SearchSuggestion>
    implements $SearchSuggestionCopyWith<$Res> {
  _$SearchSuggestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? type = null,
    Object? frequency = null,
    Object? score = freezed,
    Object? category = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SuggestionType,
      frequency: null == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as int,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchSuggestionImplCopyWith<$Res>
    implements $SearchSuggestionCopyWith<$Res> {
  factory _$$SearchSuggestionImplCopyWith(_$SearchSuggestionImpl value,
          $Res Function(_$SearchSuggestionImpl) then) =
      __$$SearchSuggestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String text,
      SuggestionType type,
      int frequency,
      double? score,
      String? category,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class __$$SearchSuggestionImplCopyWithImpl<$Res>
    extends _$SearchSuggestionCopyWithImpl<$Res, _$SearchSuggestionImpl>
    implements _$$SearchSuggestionImplCopyWith<$Res> {
  __$$SearchSuggestionImplCopyWithImpl(_$SearchSuggestionImpl _value,
      $Res Function(_$SearchSuggestionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? type = null,
    Object? frequency = null,
    Object? score = freezed,
    Object? category = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_$SearchSuggestionImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SuggestionType,
      frequency: null == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as int,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
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
class _$SearchSuggestionImpl implements _SearchSuggestion {
  const _$SearchSuggestionImpl(
      {required this.text,
      required this.type,
      required this.frequency,
      this.score,
      this.category,
      final Map<String, dynamic>? metadata})
      : _metadata = metadata;

  factory _$SearchSuggestionImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchSuggestionImplFromJson(json);

  @override
  final String text;
  @override
  final SuggestionType type;
  @override
  final int frequency;
  @override
  final double? score;
  @override
  final String? category;
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
    return 'SearchSuggestion(text: $text, type: $type, frequency: $frequency, score: $score, category: $category, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchSuggestionImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, text, type, frequency, score,
      category, const DeepCollectionEquality().hash(_metadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchSuggestionImplCopyWith<_$SearchSuggestionImpl> get copyWith =>
      __$$SearchSuggestionImplCopyWithImpl<_$SearchSuggestionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchSuggestionImplToJson(
      this,
    );
  }
}

abstract class _SearchSuggestion implements SearchSuggestion {
  const factory _SearchSuggestion(
      {required final String text,
      required final SuggestionType type,
      required final int frequency,
      final double? score,
      final String? category,
      final Map<String, dynamic>? metadata}) = _$SearchSuggestionImpl;

  factory _SearchSuggestion.fromJson(Map<String, dynamic> json) =
      _$SearchSuggestionImpl.fromJson;

  @override
  String get text;
  @override
  SuggestionType get type;
  @override
  int get frequency;
  @override
  double? get score;
  @override
  String? get category;
  @override
  Map<String, dynamic>? get metadata;
  @override
  @JsonKey(ignore: true)
  _$$SearchSuggestionImplCopyWith<_$SearchSuggestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SavedSearch _$SavedSearchFromJson(Map<String, dynamic> json) {
  return _SavedSearch.fromJson(json);
}

/// @nodoc
mixin _$SavedSearch {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  SearchQuery get query => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  bool get isDefault => throw _privateConstructorUsedError;
  List<String> get sharedWith => throw _privateConstructorUsedError;
  Map<String, dynamic> get alertSettings => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  int? get usageCount => throw _privateConstructorUsedError;
  DateTime? get lastUsedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SavedSearchCopyWith<SavedSearch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavedSearchCopyWith<$Res> {
  factory $SavedSearchCopyWith(
          SavedSearch value, $Res Function(SavedSearch) then) =
      _$SavedSearchCopyWithImpl<$Res, SavedSearch>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String name,
      String description,
      SearchQuery query,
      DateTime createdAt,
      DateTime updatedAt,
      bool isDefault,
      List<String> sharedWith,
      Map<String, dynamic> alertSettings,
      String? category,
      int? usageCount,
      DateTime? lastUsedAt});

  $SearchQueryCopyWith<$Res> get query;
}

/// @nodoc
class _$SavedSearchCopyWithImpl<$Res, $Val extends SavedSearch>
    implements $SavedSearchCopyWith<$Res> {
  _$SavedSearchCopyWithImpl(this._value, this._then);

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
    Object? description = null,
    Object? query = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isDefault = null,
    Object? sharedWith = null,
    Object? alertSettings = null,
    Object? category = freezed,
    Object? usageCount = freezed,
    Object? lastUsedAt = freezed,
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
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as SearchQuery,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      sharedWith: null == sharedWith
          ? _value.sharedWith
          : sharedWith // ignore: cast_nullable_to_non_nullable
              as List<String>,
      alertSettings: null == alertSettings
          ? _value.alertSettings
          : alertSettings // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      usageCount: freezed == usageCount
          ? _value.usageCount
          : usageCount // ignore: cast_nullable_to_non_nullable
              as int?,
      lastUsedAt: freezed == lastUsedAt
          ? _value.lastUsedAt
          : lastUsedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SearchQueryCopyWith<$Res> get query {
    return $SearchQueryCopyWith<$Res>(_value.query, (value) {
      return _then(_value.copyWith(query: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SavedSearchImplCopyWith<$Res>
    implements $SavedSearchCopyWith<$Res> {
  factory _$$SavedSearchImplCopyWith(
          _$SavedSearchImpl value, $Res Function(_$SavedSearchImpl) then) =
      __$$SavedSearchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String name,
      String description,
      SearchQuery query,
      DateTime createdAt,
      DateTime updatedAt,
      bool isDefault,
      List<String> sharedWith,
      Map<String, dynamic> alertSettings,
      String? category,
      int? usageCount,
      DateTime? lastUsedAt});

  @override
  $SearchQueryCopyWith<$Res> get query;
}

/// @nodoc
class __$$SavedSearchImplCopyWithImpl<$Res>
    extends _$SavedSearchCopyWithImpl<$Res, _$SavedSearchImpl>
    implements _$$SavedSearchImplCopyWith<$Res> {
  __$$SavedSearchImplCopyWithImpl(
      _$SavedSearchImpl _value, $Res Function(_$SavedSearchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? name = null,
    Object? description = null,
    Object? query = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isDefault = null,
    Object? sharedWith = null,
    Object? alertSettings = null,
    Object? category = freezed,
    Object? usageCount = freezed,
    Object? lastUsedAt = freezed,
  }) {
    return _then(_$SavedSearchImpl(
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
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as SearchQuery,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      sharedWith: null == sharedWith
          ? _value._sharedWith
          : sharedWith // ignore: cast_nullable_to_non_nullable
              as List<String>,
      alertSettings: null == alertSettings
          ? _value._alertSettings
          : alertSettings // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      usageCount: freezed == usageCount
          ? _value.usageCount
          : usageCount // ignore: cast_nullable_to_non_nullable
              as int?,
      lastUsedAt: freezed == lastUsedAt
          ? _value.lastUsedAt
          : lastUsedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SavedSearchImpl implements _SavedSearch {
  const _$SavedSearchImpl(
      {required this.id,
      required this.userId,
      required this.name,
      required this.description,
      required this.query,
      required this.createdAt,
      required this.updatedAt,
      this.isDefault = false,
      final List<String> sharedWith = const [],
      final Map<String, dynamic> alertSettings = const {},
      this.category,
      this.usageCount,
      this.lastUsedAt})
      : _sharedWith = sharedWith,
        _alertSettings = alertSettings;

  factory _$SavedSearchImpl.fromJson(Map<String, dynamic> json) =>
      _$$SavedSearchImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String name;
  @override
  final String description;
  @override
  final SearchQuery query;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  @JsonKey()
  final bool isDefault;
  final List<String> _sharedWith;
  @override
  @JsonKey()
  List<String> get sharedWith {
    if (_sharedWith is EqualUnmodifiableListView) return _sharedWith;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sharedWith);
  }

  final Map<String, dynamic> _alertSettings;
  @override
  @JsonKey()
  Map<String, dynamic> get alertSettings {
    if (_alertSettings is EqualUnmodifiableMapView) return _alertSettings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_alertSettings);
  }

  @override
  final String? category;
  @override
  final int? usageCount;
  @override
  final DateTime? lastUsedAt;

  @override
  String toString() {
    return 'SavedSearch(id: $id, userId: $userId, name: $name, description: $description, query: $query, createdAt: $createdAt, updatedAt: $updatedAt, isDefault: $isDefault, sharedWith: $sharedWith, alertSettings: $alertSettings, category: $category, usageCount: $usageCount, lastUsedAt: $lastUsedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SavedSearchImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            const DeepCollectionEquality()
                .equals(other._sharedWith, _sharedWith) &&
            const DeepCollectionEquality()
                .equals(other._alertSettings, _alertSettings) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.usageCount, usageCount) ||
                other.usageCount == usageCount) &&
            (identical(other.lastUsedAt, lastUsedAt) ||
                other.lastUsedAt == lastUsedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      name,
      description,
      query,
      createdAt,
      updatedAt,
      isDefault,
      const DeepCollectionEquality().hash(_sharedWith),
      const DeepCollectionEquality().hash(_alertSettings),
      category,
      usageCount,
      lastUsedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SavedSearchImplCopyWith<_$SavedSearchImpl> get copyWith =>
      __$$SavedSearchImplCopyWithImpl<_$SavedSearchImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SavedSearchImplToJson(
      this,
    );
  }
}

abstract class _SavedSearch implements SavedSearch {
  const factory _SavedSearch(
      {required final String id,
      required final String userId,
      required final String name,
      required final String description,
      required final SearchQuery query,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final bool isDefault,
      final List<String> sharedWith,
      final Map<String, dynamic> alertSettings,
      final String? category,
      final int? usageCount,
      final DateTime? lastUsedAt}) = _$SavedSearchImpl;

  factory _SavedSearch.fromJson(Map<String, dynamic> json) =
      _$SavedSearchImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get name;
  @override
  String get description;
  @override
  SearchQuery get query;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  bool get isDefault;
  @override
  List<String> get sharedWith;
  @override
  Map<String, dynamic> get alertSettings;
  @override
  String? get category;
  @override
  int? get usageCount;
  @override
  DateTime? get lastUsedAt;
  @override
  @JsonKey(ignore: true)
  _$$SavedSearchImplCopyWith<_$SavedSearchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SearchAnalytics _$SearchAnalyticsFromJson(Map<String, dynamic> json) {
  return _SearchAnalytics.fromJson(json);
}

/// @nodoc
mixin _$SearchAnalytics {
  String get id => throw _privateConstructorUsedError;
  DateTime get periodStart => throw _privateConstructorUsedError;
  DateTime get periodEnd => throw _privateConstructorUsedError;
  int get totalSearches => throw _privateConstructorUsedError;
  int get uniqueUsers => throw _privateConstructorUsedError;
  double get averageResultsPerSearch => throw _privateConstructorUsedError;
  List<SearchTrendData> get trends => throw _privateConstructorUsedError;
  List<PopularQuery> get popularQueries => throw _privateConstructorUsedError;
  List<SearchPerformanceMetric> get performanceMetrics =>
      throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchAnalyticsCopyWith<SearchAnalytics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchAnalyticsCopyWith<$Res> {
  factory $SearchAnalyticsCopyWith(
          SearchAnalytics value, $Res Function(SearchAnalytics) then) =
      _$SearchAnalyticsCopyWithImpl<$Res, SearchAnalytics>;
  @useResult
  $Res call(
      {String id,
      DateTime periodStart,
      DateTime periodEnd,
      int totalSearches,
      int uniqueUsers,
      double averageResultsPerSearch,
      List<SearchTrendData> trends,
      List<PopularQuery> popularQueries,
      List<SearchPerformanceMetric> performanceMetrics,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class _$SearchAnalyticsCopyWithImpl<$Res, $Val extends SearchAnalytics>
    implements $SearchAnalyticsCopyWith<$Res> {
  _$SearchAnalyticsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? periodStart = null,
    Object? periodEnd = null,
    Object? totalSearches = null,
    Object? uniqueUsers = null,
    Object? averageResultsPerSearch = null,
    Object? trends = null,
    Object? popularQueries = null,
    Object? performanceMetrics = null,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      periodStart: null == periodStart
          ? _value.periodStart
          : periodStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      periodEnd: null == periodEnd
          ? _value.periodEnd
          : periodEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalSearches: null == totalSearches
          ? _value.totalSearches
          : totalSearches // ignore: cast_nullable_to_non_nullable
              as int,
      uniqueUsers: null == uniqueUsers
          ? _value.uniqueUsers
          : uniqueUsers // ignore: cast_nullable_to_non_nullable
              as int,
      averageResultsPerSearch: null == averageResultsPerSearch
          ? _value.averageResultsPerSearch
          : averageResultsPerSearch // ignore: cast_nullable_to_non_nullable
              as double,
      trends: null == trends
          ? _value.trends
          : trends // ignore: cast_nullable_to_non_nullable
              as List<SearchTrendData>,
      popularQueries: null == popularQueries
          ? _value.popularQueries
          : popularQueries // ignore: cast_nullable_to_non_nullable
              as List<PopularQuery>,
      performanceMetrics: null == performanceMetrics
          ? _value.performanceMetrics
          : performanceMetrics // ignore: cast_nullable_to_non_nullable
              as List<SearchPerformanceMetric>,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchAnalyticsImplCopyWith<$Res>
    implements $SearchAnalyticsCopyWith<$Res> {
  factory _$$SearchAnalyticsImplCopyWith(_$SearchAnalyticsImpl value,
          $Res Function(_$SearchAnalyticsImpl) then) =
      __$$SearchAnalyticsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime periodStart,
      DateTime periodEnd,
      int totalSearches,
      int uniqueUsers,
      double averageResultsPerSearch,
      List<SearchTrendData> trends,
      List<PopularQuery> popularQueries,
      List<SearchPerformanceMetric> performanceMetrics,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class __$$SearchAnalyticsImplCopyWithImpl<$Res>
    extends _$SearchAnalyticsCopyWithImpl<$Res, _$SearchAnalyticsImpl>
    implements _$$SearchAnalyticsImplCopyWith<$Res> {
  __$$SearchAnalyticsImplCopyWithImpl(
      _$SearchAnalyticsImpl _value, $Res Function(_$SearchAnalyticsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? periodStart = null,
    Object? periodEnd = null,
    Object? totalSearches = null,
    Object? uniqueUsers = null,
    Object? averageResultsPerSearch = null,
    Object? trends = null,
    Object? popularQueries = null,
    Object? performanceMetrics = null,
    Object? metadata = freezed,
  }) {
    return _then(_$SearchAnalyticsImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      periodStart: null == periodStart
          ? _value.periodStart
          : periodStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      periodEnd: null == periodEnd
          ? _value.periodEnd
          : periodEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalSearches: null == totalSearches
          ? _value.totalSearches
          : totalSearches // ignore: cast_nullable_to_non_nullable
              as int,
      uniqueUsers: null == uniqueUsers
          ? _value.uniqueUsers
          : uniqueUsers // ignore: cast_nullable_to_non_nullable
              as int,
      averageResultsPerSearch: null == averageResultsPerSearch
          ? _value.averageResultsPerSearch
          : averageResultsPerSearch // ignore: cast_nullable_to_non_nullable
              as double,
      trends: null == trends
          ? _value._trends
          : trends // ignore: cast_nullable_to_non_nullable
              as List<SearchTrendData>,
      popularQueries: null == popularQueries
          ? _value._popularQueries
          : popularQueries // ignore: cast_nullable_to_non_nullable
              as List<PopularQuery>,
      performanceMetrics: null == performanceMetrics
          ? _value._performanceMetrics
          : performanceMetrics // ignore: cast_nullable_to_non_nullable
              as List<SearchPerformanceMetric>,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchAnalyticsImpl implements _SearchAnalytics {
  const _$SearchAnalyticsImpl(
      {required this.id,
      required this.periodStart,
      required this.periodEnd,
      required this.totalSearches,
      required this.uniqueUsers,
      required this.averageResultsPerSearch,
      final List<SearchTrendData> trends = const [],
      final List<PopularQuery> popularQueries = const [],
      final List<SearchPerformanceMetric> performanceMetrics = const [],
      final Map<String, dynamic>? metadata})
      : _trends = trends,
        _popularQueries = popularQueries,
        _performanceMetrics = performanceMetrics,
        _metadata = metadata;

  factory _$SearchAnalyticsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchAnalyticsImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime periodStart;
  @override
  final DateTime periodEnd;
  @override
  final int totalSearches;
  @override
  final int uniqueUsers;
  @override
  final double averageResultsPerSearch;
  final List<SearchTrendData> _trends;
  @override
  @JsonKey()
  List<SearchTrendData> get trends {
    if (_trends is EqualUnmodifiableListView) return _trends;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_trends);
  }

  final List<PopularQuery> _popularQueries;
  @override
  @JsonKey()
  List<PopularQuery> get popularQueries {
    if (_popularQueries is EqualUnmodifiableListView) return _popularQueries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_popularQueries);
  }

  final List<SearchPerformanceMetric> _performanceMetrics;
  @override
  @JsonKey()
  List<SearchPerformanceMetric> get performanceMetrics {
    if (_performanceMetrics is EqualUnmodifiableListView)
      return _performanceMetrics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_performanceMetrics);
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
    return 'SearchAnalytics(id: $id, periodStart: $periodStart, periodEnd: $periodEnd, totalSearches: $totalSearches, uniqueUsers: $uniqueUsers, averageResultsPerSearch: $averageResultsPerSearch, trends: $trends, popularQueries: $popularQueries, performanceMetrics: $performanceMetrics, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchAnalyticsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.periodStart, periodStart) ||
                other.periodStart == periodStart) &&
            (identical(other.periodEnd, periodEnd) ||
                other.periodEnd == periodEnd) &&
            (identical(other.totalSearches, totalSearches) ||
                other.totalSearches == totalSearches) &&
            (identical(other.uniqueUsers, uniqueUsers) ||
                other.uniqueUsers == uniqueUsers) &&
            (identical(
                    other.averageResultsPerSearch, averageResultsPerSearch) ||
                other.averageResultsPerSearch == averageResultsPerSearch) &&
            const DeepCollectionEquality().equals(other._trends, _trends) &&
            const DeepCollectionEquality()
                .equals(other._popularQueries, _popularQueries) &&
            const DeepCollectionEquality()
                .equals(other._performanceMetrics, _performanceMetrics) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      periodStart,
      periodEnd,
      totalSearches,
      uniqueUsers,
      averageResultsPerSearch,
      const DeepCollectionEquality().hash(_trends),
      const DeepCollectionEquality().hash(_popularQueries),
      const DeepCollectionEquality().hash(_performanceMetrics),
      const DeepCollectionEquality().hash(_metadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchAnalyticsImplCopyWith<_$SearchAnalyticsImpl> get copyWith =>
      __$$SearchAnalyticsImplCopyWithImpl<_$SearchAnalyticsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchAnalyticsImplToJson(
      this,
    );
  }
}

abstract class _SearchAnalytics implements SearchAnalytics {
  const factory _SearchAnalytics(
      {required final String id,
      required final DateTime periodStart,
      required final DateTime periodEnd,
      required final int totalSearches,
      required final int uniqueUsers,
      required final double averageResultsPerSearch,
      final List<SearchTrendData> trends,
      final List<PopularQuery> popularQueries,
      final List<SearchPerformanceMetric> performanceMetrics,
      final Map<String, dynamic>? metadata}) = _$SearchAnalyticsImpl;

  factory _SearchAnalytics.fromJson(Map<String, dynamic> json) =
      _$SearchAnalyticsImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get periodStart;
  @override
  DateTime get periodEnd;
  @override
  int get totalSearches;
  @override
  int get uniqueUsers;
  @override
  double get averageResultsPerSearch;
  @override
  List<SearchTrendData> get trends;
  @override
  List<PopularQuery> get popularQueries;
  @override
  List<SearchPerformanceMetric> get performanceMetrics;
  @override
  Map<String, dynamic>? get metadata;
  @override
  @JsonKey(ignore: true)
  _$$SearchAnalyticsImplCopyWith<_$SearchAnalyticsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SearchTrendData _$SearchTrendDataFromJson(Map<String, dynamic> json) {
  return _SearchTrendData.fromJson(json);
}

/// @nodoc
mixin _$SearchTrendData {
  DateTime get timestamp => throw _privateConstructorUsedError;
  int get searchCount => throw _privateConstructorUsedError;
  String get mostPopularQuery => throw _privateConstructorUsedError;
  SearchScope get mostPopularScope => throw _privateConstructorUsedError;
  double get averageRelevanceScore => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchTrendDataCopyWith<SearchTrendData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchTrendDataCopyWith<$Res> {
  factory $SearchTrendDataCopyWith(
          SearchTrendData value, $Res Function(SearchTrendData) then) =
      _$SearchTrendDataCopyWithImpl<$Res, SearchTrendData>;
  @useResult
  $Res call(
      {DateTime timestamp,
      int searchCount,
      String mostPopularQuery,
      SearchScope mostPopularScope,
      double averageRelevanceScore});
}

/// @nodoc
class _$SearchTrendDataCopyWithImpl<$Res, $Val extends SearchTrendData>
    implements $SearchTrendDataCopyWith<$Res> {
  _$SearchTrendDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? searchCount = null,
    Object? mostPopularQuery = null,
    Object? mostPopularScope = null,
    Object? averageRelevanceScore = null,
  }) {
    return _then(_value.copyWith(
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      searchCount: null == searchCount
          ? _value.searchCount
          : searchCount // ignore: cast_nullable_to_non_nullable
              as int,
      mostPopularQuery: null == mostPopularQuery
          ? _value.mostPopularQuery
          : mostPopularQuery // ignore: cast_nullable_to_non_nullable
              as String,
      mostPopularScope: null == mostPopularScope
          ? _value.mostPopularScope
          : mostPopularScope // ignore: cast_nullable_to_non_nullable
              as SearchScope,
      averageRelevanceScore: null == averageRelevanceScore
          ? _value.averageRelevanceScore
          : averageRelevanceScore // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchTrendDataImplCopyWith<$Res>
    implements $SearchTrendDataCopyWith<$Res> {
  factory _$$SearchTrendDataImplCopyWith(_$SearchTrendDataImpl value,
          $Res Function(_$SearchTrendDataImpl) then) =
      __$$SearchTrendDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime timestamp,
      int searchCount,
      String mostPopularQuery,
      SearchScope mostPopularScope,
      double averageRelevanceScore});
}

/// @nodoc
class __$$SearchTrendDataImplCopyWithImpl<$Res>
    extends _$SearchTrendDataCopyWithImpl<$Res, _$SearchTrendDataImpl>
    implements _$$SearchTrendDataImplCopyWith<$Res> {
  __$$SearchTrendDataImplCopyWithImpl(
      _$SearchTrendDataImpl _value, $Res Function(_$SearchTrendDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? searchCount = null,
    Object? mostPopularQuery = null,
    Object? mostPopularScope = null,
    Object? averageRelevanceScore = null,
  }) {
    return _then(_$SearchTrendDataImpl(
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      searchCount: null == searchCount
          ? _value.searchCount
          : searchCount // ignore: cast_nullable_to_non_nullable
              as int,
      mostPopularQuery: null == mostPopularQuery
          ? _value.mostPopularQuery
          : mostPopularQuery // ignore: cast_nullable_to_non_nullable
              as String,
      mostPopularScope: null == mostPopularScope
          ? _value.mostPopularScope
          : mostPopularScope // ignore: cast_nullable_to_non_nullable
              as SearchScope,
      averageRelevanceScore: null == averageRelevanceScore
          ? _value.averageRelevanceScore
          : averageRelevanceScore // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchTrendDataImpl implements _SearchTrendData {
  const _$SearchTrendDataImpl(
      {required this.timestamp,
      required this.searchCount,
      required this.mostPopularQuery,
      required this.mostPopularScope,
      required this.averageRelevanceScore});

  factory _$SearchTrendDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchTrendDataImplFromJson(json);

  @override
  final DateTime timestamp;
  @override
  final int searchCount;
  @override
  final String mostPopularQuery;
  @override
  final SearchScope mostPopularScope;
  @override
  final double averageRelevanceScore;

  @override
  String toString() {
    return 'SearchTrendData(timestamp: $timestamp, searchCount: $searchCount, mostPopularQuery: $mostPopularQuery, mostPopularScope: $mostPopularScope, averageRelevanceScore: $averageRelevanceScore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchTrendDataImpl &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.searchCount, searchCount) ||
                other.searchCount == searchCount) &&
            (identical(other.mostPopularQuery, mostPopularQuery) ||
                other.mostPopularQuery == mostPopularQuery) &&
            (identical(other.mostPopularScope, mostPopularScope) ||
                other.mostPopularScope == mostPopularScope) &&
            (identical(other.averageRelevanceScore, averageRelevanceScore) ||
                other.averageRelevanceScore == averageRelevanceScore));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, timestamp, searchCount,
      mostPopularQuery, mostPopularScope, averageRelevanceScore);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchTrendDataImplCopyWith<_$SearchTrendDataImpl> get copyWith =>
      __$$SearchTrendDataImplCopyWithImpl<_$SearchTrendDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchTrendDataImplToJson(
      this,
    );
  }
}

abstract class _SearchTrendData implements SearchTrendData {
  const factory _SearchTrendData(
      {required final DateTime timestamp,
      required final int searchCount,
      required final String mostPopularQuery,
      required final SearchScope mostPopularScope,
      required final double averageRelevanceScore}) = _$SearchTrendDataImpl;

  factory _SearchTrendData.fromJson(Map<String, dynamic> json) =
      _$SearchTrendDataImpl.fromJson;

  @override
  DateTime get timestamp;
  @override
  int get searchCount;
  @override
  String get mostPopularQuery;
  @override
  SearchScope get mostPopularScope;
  @override
  double get averageRelevanceScore;
  @override
  @JsonKey(ignore: true)
  _$$SearchTrendDataImplCopyWith<_$SearchTrendDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PopularQuery _$PopularQueryFromJson(Map<String, dynamic> json) {
  return _PopularQuery.fromJson(json);
}

/// @nodoc
mixin _$PopularQuery {
  String get query => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  SearchScope get scope => throw _privateConstructorUsedError;
  double get averageClickThroughRate => throw _privateConstructorUsedError;
  List<String> get commonFilters => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PopularQueryCopyWith<PopularQuery> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PopularQueryCopyWith<$Res> {
  factory $PopularQueryCopyWith(
          PopularQuery value, $Res Function(PopularQuery) then) =
      _$PopularQueryCopyWithImpl<$Res, PopularQuery>;
  @useResult
  $Res call(
      {String query,
      int count,
      SearchScope scope,
      double averageClickThroughRate,
      List<String> commonFilters});
}

/// @nodoc
class _$PopularQueryCopyWithImpl<$Res, $Val extends PopularQuery>
    implements $PopularQueryCopyWith<$Res> {
  _$PopularQueryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? count = null,
    Object? scope = null,
    Object? averageClickThroughRate = null,
    Object? commonFilters = null,
  }) {
    return _then(_value.copyWith(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      scope: null == scope
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as SearchScope,
      averageClickThroughRate: null == averageClickThroughRate
          ? _value.averageClickThroughRate
          : averageClickThroughRate // ignore: cast_nullable_to_non_nullable
              as double,
      commonFilters: null == commonFilters
          ? _value.commonFilters
          : commonFilters // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PopularQueryImplCopyWith<$Res>
    implements $PopularQueryCopyWith<$Res> {
  factory _$$PopularQueryImplCopyWith(
          _$PopularQueryImpl value, $Res Function(_$PopularQueryImpl) then) =
      __$$PopularQueryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String query,
      int count,
      SearchScope scope,
      double averageClickThroughRate,
      List<String> commonFilters});
}

/// @nodoc
class __$$PopularQueryImplCopyWithImpl<$Res>
    extends _$PopularQueryCopyWithImpl<$Res, _$PopularQueryImpl>
    implements _$$PopularQueryImplCopyWith<$Res> {
  __$$PopularQueryImplCopyWithImpl(
      _$PopularQueryImpl _value, $Res Function(_$PopularQueryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? count = null,
    Object? scope = null,
    Object? averageClickThroughRate = null,
    Object? commonFilters = null,
  }) {
    return _then(_$PopularQueryImpl(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      scope: null == scope
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as SearchScope,
      averageClickThroughRate: null == averageClickThroughRate
          ? _value.averageClickThroughRate
          : averageClickThroughRate // ignore: cast_nullable_to_non_nullable
              as double,
      commonFilters: null == commonFilters
          ? _value._commonFilters
          : commonFilters // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PopularQueryImpl implements _PopularQuery {
  const _$PopularQueryImpl(
      {required this.query,
      required this.count,
      required this.scope,
      required this.averageClickThroughRate,
      final List<String> commonFilters = const []})
      : _commonFilters = commonFilters;

  factory _$PopularQueryImpl.fromJson(Map<String, dynamic> json) =>
      _$$PopularQueryImplFromJson(json);

  @override
  final String query;
  @override
  final int count;
  @override
  final SearchScope scope;
  @override
  final double averageClickThroughRate;
  final List<String> _commonFilters;
  @override
  @JsonKey()
  List<String> get commonFilters {
    if (_commonFilters is EqualUnmodifiableListView) return _commonFilters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_commonFilters);
  }

  @override
  String toString() {
    return 'PopularQuery(query: $query, count: $count, scope: $scope, averageClickThroughRate: $averageClickThroughRate, commonFilters: $commonFilters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PopularQueryImpl &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.scope, scope) || other.scope == scope) &&
            (identical(
                    other.averageClickThroughRate, averageClickThroughRate) ||
                other.averageClickThroughRate == averageClickThroughRate) &&
            const DeepCollectionEquality()
                .equals(other._commonFilters, _commonFilters));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      query,
      count,
      scope,
      averageClickThroughRate,
      const DeepCollectionEquality().hash(_commonFilters));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PopularQueryImplCopyWith<_$PopularQueryImpl> get copyWith =>
      __$$PopularQueryImplCopyWithImpl<_$PopularQueryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PopularQueryImplToJson(
      this,
    );
  }
}

abstract class _PopularQuery implements PopularQuery {
  const factory _PopularQuery(
      {required final String query,
      required final int count,
      required final SearchScope scope,
      required final double averageClickThroughRate,
      final List<String> commonFilters}) = _$PopularQueryImpl;

  factory _PopularQuery.fromJson(Map<String, dynamic> json) =
      _$PopularQueryImpl.fromJson;

  @override
  String get query;
  @override
  int get count;
  @override
  SearchScope get scope;
  @override
  double get averageClickThroughRate;
  @override
  List<String> get commonFilters;
  @override
  @JsonKey(ignore: true)
  _$$PopularQueryImplCopyWith<_$PopularQueryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SearchPerformanceMetric _$SearchPerformanceMetricFromJson(
    Map<String, dynamic> json) {
  return _SearchPerformanceMetric.fromJson(json);
}

/// @nodoc
mixin _$SearchPerformanceMetric {
  String get metricName => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  MetricType get type => throw _privateConstructorUsedError;
  DateTime? get timestamp => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchPerformanceMetricCopyWith<SearchPerformanceMetric> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchPerformanceMetricCopyWith<$Res> {
  factory $SearchPerformanceMetricCopyWith(SearchPerformanceMetric value,
          $Res Function(SearchPerformanceMetric) then) =
      _$SearchPerformanceMetricCopyWithImpl<$Res, SearchPerformanceMetric>;
  @useResult
  $Res call(
      {String metricName,
      double value,
      String unit,
      MetricType type,
      DateTime? timestamp,
      String? description});
}

/// @nodoc
class _$SearchPerformanceMetricCopyWithImpl<$Res,
        $Val extends SearchPerformanceMetric>
    implements $SearchPerformanceMetricCopyWith<$Res> {
  _$SearchPerformanceMetricCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? metricName = null,
    Object? value = null,
    Object? unit = null,
    Object? type = null,
    Object? timestamp = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      metricName: null == metricName
          ? _value.metricName
          : metricName // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MetricType,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchPerformanceMetricImplCopyWith<$Res>
    implements $SearchPerformanceMetricCopyWith<$Res> {
  factory _$$SearchPerformanceMetricImplCopyWith(
          _$SearchPerformanceMetricImpl value,
          $Res Function(_$SearchPerformanceMetricImpl) then) =
      __$$SearchPerformanceMetricImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String metricName,
      double value,
      String unit,
      MetricType type,
      DateTime? timestamp,
      String? description});
}

/// @nodoc
class __$$SearchPerformanceMetricImplCopyWithImpl<$Res>
    extends _$SearchPerformanceMetricCopyWithImpl<$Res,
        _$SearchPerformanceMetricImpl>
    implements _$$SearchPerformanceMetricImplCopyWith<$Res> {
  __$$SearchPerformanceMetricImplCopyWithImpl(
      _$SearchPerformanceMetricImpl _value,
      $Res Function(_$SearchPerformanceMetricImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? metricName = null,
    Object? value = null,
    Object? unit = null,
    Object? type = null,
    Object? timestamp = freezed,
    Object? description = freezed,
  }) {
    return _then(_$SearchPerformanceMetricImpl(
      metricName: null == metricName
          ? _value.metricName
          : metricName // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MetricType,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchPerformanceMetricImpl implements _SearchPerformanceMetric {
  const _$SearchPerformanceMetricImpl(
      {required this.metricName,
      required this.value,
      required this.unit,
      required this.type,
      this.timestamp,
      this.description});

  factory _$SearchPerformanceMetricImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchPerformanceMetricImplFromJson(json);

  @override
  final String metricName;
  @override
  final double value;
  @override
  final String unit;
  @override
  final MetricType type;
  @override
  final DateTime? timestamp;
  @override
  final String? description;

  @override
  String toString() {
    return 'SearchPerformanceMetric(metricName: $metricName, value: $value, unit: $unit, type: $type, timestamp: $timestamp, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchPerformanceMetricImpl &&
            (identical(other.metricName, metricName) ||
                other.metricName == metricName) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, metricName, value, unit, type, timestamp, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchPerformanceMetricImplCopyWith<_$SearchPerformanceMetricImpl>
      get copyWith => __$$SearchPerformanceMetricImplCopyWithImpl<
          _$SearchPerformanceMetricImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchPerformanceMetricImplToJson(
      this,
    );
  }
}

abstract class _SearchPerformanceMetric implements SearchPerformanceMetric {
  const factory _SearchPerformanceMetric(
      {required final String metricName,
      required final double value,
      required final String unit,
      required final MetricType type,
      final DateTime? timestamp,
      final String? description}) = _$SearchPerformanceMetricImpl;

  factory _SearchPerformanceMetric.fromJson(Map<String, dynamic> json) =
      _$SearchPerformanceMetricImpl.fromJson;

  @override
  String get metricName;
  @override
  double get value;
  @override
  String get unit;
  @override
  MetricType get type;
  @override
  DateTime? get timestamp;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$SearchPerformanceMetricImplCopyWith<_$SearchPerformanceMetricImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SearchConfiguration _$SearchConfigurationFromJson(Map<String, dynamic> json) {
  return _SearchConfiguration.fromJson(json);
}

/// @nodoc
mixin _$SearchConfiguration {
  String get id => throw _privateConstructorUsedError;
  String get organizationId => throw _privateConstructorUsedError;
  List<SearchIndex> get indices => throw _privateConstructorUsedError;
  List<SearchFieldConfig> get fieldConfigs =>
      throw _privateConstructorUsedError;
  Map<String, double> get boostingRules => throw _privateConstructorUsedError;
  List<String> get stopWords => throw _privateConstructorUsedError;
  List<String> get synonyms => throw _privateConstructorUsedError;
  Map<String, dynamic>? get customSettings =>
      throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  String? get updatedBy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchConfigurationCopyWith<SearchConfiguration> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchConfigurationCopyWith<$Res> {
  factory $SearchConfigurationCopyWith(
          SearchConfiguration value, $Res Function(SearchConfiguration) then) =
      _$SearchConfigurationCopyWithImpl<$Res, SearchConfiguration>;
  @useResult
  $Res call(
      {String id,
      String organizationId,
      List<SearchIndex> indices,
      List<SearchFieldConfig> fieldConfigs,
      Map<String, double> boostingRules,
      List<String> stopWords,
      List<String> synonyms,
      Map<String, dynamic>? customSettings,
      DateTime? updatedAt,
      String? updatedBy});
}

/// @nodoc
class _$SearchConfigurationCopyWithImpl<$Res, $Val extends SearchConfiguration>
    implements $SearchConfigurationCopyWith<$Res> {
  _$SearchConfigurationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? organizationId = null,
    Object? indices = null,
    Object? fieldConfigs = null,
    Object? boostingRules = null,
    Object? stopWords = null,
    Object? synonyms = null,
    Object? customSettings = freezed,
    Object? updatedAt = freezed,
    Object? updatedBy = freezed,
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
      indices: null == indices
          ? _value.indices
          : indices // ignore: cast_nullable_to_non_nullable
              as List<SearchIndex>,
      fieldConfigs: null == fieldConfigs
          ? _value.fieldConfigs
          : fieldConfigs // ignore: cast_nullable_to_non_nullable
              as List<SearchFieldConfig>,
      boostingRules: null == boostingRules
          ? _value.boostingRules
          : boostingRules // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      stopWords: null == stopWords
          ? _value.stopWords
          : stopWords // ignore: cast_nullable_to_non_nullable
              as List<String>,
      synonyms: null == synonyms
          ? _value.synonyms
          : synonyms // ignore: cast_nullable_to_non_nullable
              as List<String>,
      customSettings: freezed == customSettings
          ? _value.customSettings
          : customSettings // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchConfigurationImplCopyWith<$Res>
    implements $SearchConfigurationCopyWith<$Res> {
  factory _$$SearchConfigurationImplCopyWith(_$SearchConfigurationImpl value,
          $Res Function(_$SearchConfigurationImpl) then) =
      __$$SearchConfigurationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String organizationId,
      List<SearchIndex> indices,
      List<SearchFieldConfig> fieldConfigs,
      Map<String, double> boostingRules,
      List<String> stopWords,
      List<String> synonyms,
      Map<String, dynamic>? customSettings,
      DateTime? updatedAt,
      String? updatedBy});
}

/// @nodoc
class __$$SearchConfigurationImplCopyWithImpl<$Res>
    extends _$SearchConfigurationCopyWithImpl<$Res, _$SearchConfigurationImpl>
    implements _$$SearchConfigurationImplCopyWith<$Res> {
  __$$SearchConfigurationImplCopyWithImpl(_$SearchConfigurationImpl _value,
      $Res Function(_$SearchConfigurationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? organizationId = null,
    Object? indices = null,
    Object? fieldConfigs = null,
    Object? boostingRules = null,
    Object? stopWords = null,
    Object? synonyms = null,
    Object? customSettings = freezed,
    Object? updatedAt = freezed,
    Object? updatedBy = freezed,
  }) {
    return _then(_$SearchConfigurationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      organizationId: null == organizationId
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as String,
      indices: null == indices
          ? _value._indices
          : indices // ignore: cast_nullable_to_non_nullable
              as List<SearchIndex>,
      fieldConfigs: null == fieldConfigs
          ? _value._fieldConfigs
          : fieldConfigs // ignore: cast_nullable_to_non_nullable
              as List<SearchFieldConfig>,
      boostingRules: null == boostingRules
          ? _value._boostingRules
          : boostingRules // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      stopWords: null == stopWords
          ? _value._stopWords
          : stopWords // ignore: cast_nullable_to_non_nullable
              as List<String>,
      synonyms: null == synonyms
          ? _value._synonyms
          : synonyms // ignore: cast_nullable_to_non_nullable
              as List<String>,
      customSettings: freezed == customSettings
          ? _value._customSettings
          : customSettings // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchConfigurationImpl implements _SearchConfiguration {
  const _$SearchConfigurationImpl(
      {required this.id,
      required this.organizationId,
      final List<SearchIndex> indices = const [],
      final List<SearchFieldConfig> fieldConfigs = const [],
      final Map<String, double> boostingRules = const {},
      final List<String> stopWords = const [],
      final List<String> synonyms = const [],
      final Map<String, dynamic>? customSettings,
      this.updatedAt,
      this.updatedBy})
      : _indices = indices,
        _fieldConfigs = fieldConfigs,
        _boostingRules = boostingRules,
        _stopWords = stopWords,
        _synonyms = synonyms,
        _customSettings = customSettings;

  factory _$SearchConfigurationImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchConfigurationImplFromJson(json);

  @override
  final String id;
  @override
  final String organizationId;
  final List<SearchIndex> _indices;
  @override
  @JsonKey()
  List<SearchIndex> get indices {
    if (_indices is EqualUnmodifiableListView) return _indices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_indices);
  }

  final List<SearchFieldConfig> _fieldConfigs;
  @override
  @JsonKey()
  List<SearchFieldConfig> get fieldConfigs {
    if (_fieldConfigs is EqualUnmodifiableListView) return _fieldConfigs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fieldConfigs);
  }

  final Map<String, double> _boostingRules;
  @override
  @JsonKey()
  Map<String, double> get boostingRules {
    if (_boostingRules is EqualUnmodifiableMapView) return _boostingRules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_boostingRules);
  }

  final List<String> _stopWords;
  @override
  @JsonKey()
  List<String> get stopWords {
    if (_stopWords is EqualUnmodifiableListView) return _stopWords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stopWords);
  }

  final List<String> _synonyms;
  @override
  @JsonKey()
  List<String> get synonyms {
    if (_synonyms is EqualUnmodifiableListView) return _synonyms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_synonyms);
  }

  final Map<String, dynamic>? _customSettings;
  @override
  Map<String, dynamic>? get customSettings {
    final value = _customSettings;
    if (value == null) return null;
    if (_customSettings is EqualUnmodifiableMapView) return _customSettings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final DateTime? updatedAt;
  @override
  final String? updatedBy;

  @override
  String toString() {
    return 'SearchConfiguration(id: $id, organizationId: $organizationId, indices: $indices, fieldConfigs: $fieldConfigs, boostingRules: $boostingRules, stopWords: $stopWords, synonyms: $synonyms, customSettings: $customSettings, updatedAt: $updatedAt, updatedBy: $updatedBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchConfigurationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            const DeepCollectionEquality().equals(other._indices, _indices) &&
            const DeepCollectionEquality()
                .equals(other._fieldConfigs, _fieldConfigs) &&
            const DeepCollectionEquality()
                .equals(other._boostingRules, _boostingRules) &&
            const DeepCollectionEquality()
                .equals(other._stopWords, _stopWords) &&
            const DeepCollectionEquality().equals(other._synonyms, _synonyms) &&
            const DeepCollectionEquality()
                .equals(other._customSettings, _customSettings) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      organizationId,
      const DeepCollectionEquality().hash(_indices),
      const DeepCollectionEquality().hash(_fieldConfigs),
      const DeepCollectionEquality().hash(_boostingRules),
      const DeepCollectionEquality().hash(_stopWords),
      const DeepCollectionEquality().hash(_synonyms),
      const DeepCollectionEquality().hash(_customSettings),
      updatedAt,
      updatedBy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchConfigurationImplCopyWith<_$SearchConfigurationImpl> get copyWith =>
      __$$SearchConfigurationImplCopyWithImpl<_$SearchConfigurationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchConfigurationImplToJson(
      this,
    );
  }
}

abstract class _SearchConfiguration implements SearchConfiguration {
  const factory _SearchConfiguration(
      {required final String id,
      required final String organizationId,
      final List<SearchIndex> indices,
      final List<SearchFieldConfig> fieldConfigs,
      final Map<String, double> boostingRules,
      final List<String> stopWords,
      final List<String> synonyms,
      final Map<String, dynamic>? customSettings,
      final DateTime? updatedAt,
      final String? updatedBy}) = _$SearchConfigurationImpl;

  factory _SearchConfiguration.fromJson(Map<String, dynamic> json) =
      _$SearchConfigurationImpl.fromJson;

  @override
  String get id;
  @override
  String get organizationId;
  @override
  List<SearchIndex> get indices;
  @override
  List<SearchFieldConfig> get fieldConfigs;
  @override
  Map<String, double> get boostingRules;
  @override
  List<String> get stopWords;
  @override
  List<String> get synonyms;
  @override
  Map<String, dynamic>? get customSettings;
  @override
  DateTime? get updatedAt;
  @override
  String? get updatedBy;
  @override
  @JsonKey(ignore: true)
  _$$SearchConfigurationImplCopyWith<_$SearchConfigurationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SearchIndex _$SearchIndexFromJson(Map<String, dynamic> json) {
  return _SearchIndex.fromJson(json);
}

/// @nodoc
mixin _$SearchIndex {
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  SearchScope get scope => throw _privateConstructorUsedError;
  List<String> get fields => throw _privateConstructorUsedError;
  Map<String, dynamic> get settings => throw _privateConstructorUsedError;
  bool? get isActive => throw _privateConstructorUsedError;
  DateTime? get lastUpdated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchIndexCopyWith<SearchIndex> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchIndexCopyWith<$Res> {
  factory $SearchIndexCopyWith(
          SearchIndex value, $Res Function(SearchIndex) then) =
      _$SearchIndexCopyWithImpl<$Res, SearchIndex>;
  @useResult
  $Res call(
      {String name,
      String description,
      SearchScope scope,
      List<String> fields,
      Map<String, dynamic> settings,
      bool? isActive,
      DateTime? lastUpdated});
}

/// @nodoc
class _$SearchIndexCopyWithImpl<$Res, $Val extends SearchIndex>
    implements $SearchIndexCopyWith<$Res> {
  _$SearchIndexCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? scope = null,
    Object? fields = null,
    Object? settings = null,
    Object? isActive = freezed,
    Object? lastUpdated = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      scope: null == scope
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as SearchScope,
      fields: null == fields
          ? _value.fields
          : fields // ignore: cast_nullable_to_non_nullable
              as List<String>,
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchIndexImplCopyWith<$Res>
    implements $SearchIndexCopyWith<$Res> {
  factory _$$SearchIndexImplCopyWith(
          _$SearchIndexImpl value, $Res Function(_$SearchIndexImpl) then) =
      __$$SearchIndexImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String description,
      SearchScope scope,
      List<String> fields,
      Map<String, dynamic> settings,
      bool? isActive,
      DateTime? lastUpdated});
}

/// @nodoc
class __$$SearchIndexImplCopyWithImpl<$Res>
    extends _$SearchIndexCopyWithImpl<$Res, _$SearchIndexImpl>
    implements _$$SearchIndexImplCopyWith<$Res> {
  __$$SearchIndexImplCopyWithImpl(
      _$SearchIndexImpl _value, $Res Function(_$SearchIndexImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? scope = null,
    Object? fields = null,
    Object? settings = null,
    Object? isActive = freezed,
    Object? lastUpdated = freezed,
  }) {
    return _then(_$SearchIndexImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      scope: null == scope
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as SearchScope,
      fields: null == fields
          ? _value._fields
          : fields // ignore: cast_nullable_to_non_nullable
              as List<String>,
      settings: null == settings
          ? _value._settings
          : settings // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchIndexImpl implements _SearchIndex {
  const _$SearchIndexImpl(
      {required this.name,
      required this.description,
      required this.scope,
      final List<String> fields = const [],
      final Map<String, dynamic> settings = const {},
      this.isActive,
      this.lastUpdated})
      : _fields = fields,
        _settings = settings;

  factory _$SearchIndexImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchIndexImplFromJson(json);

  @override
  final String name;
  @override
  final String description;
  @override
  final SearchScope scope;
  final List<String> _fields;
  @override
  @JsonKey()
  List<String> get fields {
    if (_fields is EqualUnmodifiableListView) return _fields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fields);
  }

  final Map<String, dynamic> _settings;
  @override
  @JsonKey()
  Map<String, dynamic> get settings {
    if (_settings is EqualUnmodifiableMapView) return _settings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_settings);
  }

  @override
  final bool? isActive;
  @override
  final DateTime? lastUpdated;

  @override
  String toString() {
    return 'SearchIndex(name: $name, description: $description, scope: $scope, fields: $fields, settings: $settings, isActive: $isActive, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchIndexImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.scope, scope) || other.scope == scope) &&
            const DeepCollectionEquality().equals(other._fields, _fields) &&
            const DeepCollectionEquality().equals(other._settings, _settings) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      description,
      scope,
      const DeepCollectionEquality().hash(_fields),
      const DeepCollectionEquality().hash(_settings),
      isActive,
      lastUpdated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchIndexImplCopyWith<_$SearchIndexImpl> get copyWith =>
      __$$SearchIndexImplCopyWithImpl<_$SearchIndexImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchIndexImplToJson(
      this,
    );
  }
}

abstract class _SearchIndex implements SearchIndex {
  const factory _SearchIndex(
      {required final String name,
      required final String description,
      required final SearchScope scope,
      final List<String> fields,
      final Map<String, dynamic> settings,
      final bool? isActive,
      final DateTime? lastUpdated}) = _$SearchIndexImpl;

  factory _SearchIndex.fromJson(Map<String, dynamic> json) =
      _$SearchIndexImpl.fromJson;

  @override
  String get name;
  @override
  String get description;
  @override
  SearchScope get scope;
  @override
  List<String> get fields;
  @override
  Map<String, dynamic> get settings;
  @override
  bool? get isActive;
  @override
  DateTime? get lastUpdated;
  @override
  @JsonKey(ignore: true)
  _$$SearchIndexImplCopyWith<_$SearchIndexImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SearchFieldConfig _$SearchFieldConfigFromJson(Map<String, dynamic> json) {
  return _SearchFieldConfig.fromJson(json);
}

/// @nodoc
mixin _$SearchFieldConfig {
  String get fieldName => throw _privateConstructorUsedError;
  FieldDataType get dataType => throw _privateConstructorUsedError;
  bool get isSearchable => throw _privateConstructorUsedError;
  bool get isFilterable => throw _privateConstructorUsedError;
  bool get isSortable => throw _privateConstructorUsedError;
  double get boost => throw _privateConstructorUsedError;
  bool get isFaceted => throw _privateConstructorUsedError;
  String? get analyzer => throw _privateConstructorUsedError;
  Map<String, dynamic>? get customConfig => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchFieldConfigCopyWith<SearchFieldConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchFieldConfigCopyWith<$Res> {
  factory $SearchFieldConfigCopyWith(
          SearchFieldConfig value, $Res Function(SearchFieldConfig) then) =
      _$SearchFieldConfigCopyWithImpl<$Res, SearchFieldConfig>;
  @useResult
  $Res call(
      {String fieldName,
      FieldDataType dataType,
      bool isSearchable,
      bool isFilterable,
      bool isSortable,
      double boost,
      bool isFaceted,
      String? analyzer,
      Map<String, dynamic>? customConfig});
}

/// @nodoc
class _$SearchFieldConfigCopyWithImpl<$Res, $Val extends SearchFieldConfig>
    implements $SearchFieldConfigCopyWith<$Res> {
  _$SearchFieldConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fieldName = null,
    Object? dataType = null,
    Object? isSearchable = null,
    Object? isFilterable = null,
    Object? isSortable = null,
    Object? boost = null,
    Object? isFaceted = null,
    Object? analyzer = freezed,
    Object? customConfig = freezed,
  }) {
    return _then(_value.copyWith(
      fieldName: null == fieldName
          ? _value.fieldName
          : fieldName // ignore: cast_nullable_to_non_nullable
              as String,
      dataType: null == dataType
          ? _value.dataType
          : dataType // ignore: cast_nullable_to_non_nullable
              as FieldDataType,
      isSearchable: null == isSearchable
          ? _value.isSearchable
          : isSearchable // ignore: cast_nullable_to_non_nullable
              as bool,
      isFilterable: null == isFilterable
          ? _value.isFilterable
          : isFilterable // ignore: cast_nullable_to_non_nullable
              as bool,
      isSortable: null == isSortable
          ? _value.isSortable
          : isSortable // ignore: cast_nullable_to_non_nullable
              as bool,
      boost: null == boost
          ? _value.boost
          : boost // ignore: cast_nullable_to_non_nullable
              as double,
      isFaceted: null == isFaceted
          ? _value.isFaceted
          : isFaceted // ignore: cast_nullable_to_non_nullable
              as bool,
      analyzer: freezed == analyzer
          ? _value.analyzer
          : analyzer // ignore: cast_nullable_to_non_nullable
              as String?,
      customConfig: freezed == customConfig
          ? _value.customConfig
          : customConfig // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchFieldConfigImplCopyWith<$Res>
    implements $SearchFieldConfigCopyWith<$Res> {
  factory _$$SearchFieldConfigImplCopyWith(_$SearchFieldConfigImpl value,
          $Res Function(_$SearchFieldConfigImpl) then) =
      __$$SearchFieldConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String fieldName,
      FieldDataType dataType,
      bool isSearchable,
      bool isFilterable,
      bool isSortable,
      double boost,
      bool isFaceted,
      String? analyzer,
      Map<String, dynamic>? customConfig});
}

/// @nodoc
class __$$SearchFieldConfigImplCopyWithImpl<$Res>
    extends _$SearchFieldConfigCopyWithImpl<$Res, _$SearchFieldConfigImpl>
    implements _$$SearchFieldConfigImplCopyWith<$Res> {
  __$$SearchFieldConfigImplCopyWithImpl(_$SearchFieldConfigImpl _value,
      $Res Function(_$SearchFieldConfigImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fieldName = null,
    Object? dataType = null,
    Object? isSearchable = null,
    Object? isFilterable = null,
    Object? isSortable = null,
    Object? boost = null,
    Object? isFaceted = null,
    Object? analyzer = freezed,
    Object? customConfig = freezed,
  }) {
    return _then(_$SearchFieldConfigImpl(
      fieldName: null == fieldName
          ? _value.fieldName
          : fieldName // ignore: cast_nullable_to_non_nullable
              as String,
      dataType: null == dataType
          ? _value.dataType
          : dataType // ignore: cast_nullable_to_non_nullable
              as FieldDataType,
      isSearchable: null == isSearchable
          ? _value.isSearchable
          : isSearchable // ignore: cast_nullable_to_non_nullable
              as bool,
      isFilterable: null == isFilterable
          ? _value.isFilterable
          : isFilterable // ignore: cast_nullable_to_non_nullable
              as bool,
      isSortable: null == isSortable
          ? _value.isSortable
          : isSortable // ignore: cast_nullable_to_non_nullable
              as bool,
      boost: null == boost
          ? _value.boost
          : boost // ignore: cast_nullable_to_non_nullable
              as double,
      isFaceted: null == isFaceted
          ? _value.isFaceted
          : isFaceted // ignore: cast_nullable_to_non_nullable
              as bool,
      analyzer: freezed == analyzer
          ? _value.analyzer
          : analyzer // ignore: cast_nullable_to_non_nullable
              as String?,
      customConfig: freezed == customConfig
          ? _value._customConfig
          : customConfig // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchFieldConfigImpl implements _SearchFieldConfig {
  const _$SearchFieldConfigImpl(
      {required this.fieldName,
      required this.dataType,
      required this.isSearchable,
      required this.isFilterable,
      required this.isSortable,
      this.boost = 1.0,
      this.isFaceted = false,
      this.analyzer,
      final Map<String, dynamic>? customConfig})
      : _customConfig = customConfig;

  factory _$SearchFieldConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchFieldConfigImplFromJson(json);

  @override
  final String fieldName;
  @override
  final FieldDataType dataType;
  @override
  final bool isSearchable;
  @override
  final bool isFilterable;
  @override
  final bool isSortable;
  @override
  @JsonKey()
  final double boost;
  @override
  @JsonKey()
  final bool isFaceted;
  @override
  final String? analyzer;
  final Map<String, dynamic>? _customConfig;
  @override
  Map<String, dynamic>? get customConfig {
    final value = _customConfig;
    if (value == null) return null;
    if (_customConfig is EqualUnmodifiableMapView) return _customConfig;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'SearchFieldConfig(fieldName: $fieldName, dataType: $dataType, isSearchable: $isSearchable, isFilterable: $isFilterable, isSortable: $isSortable, boost: $boost, isFaceted: $isFaceted, analyzer: $analyzer, customConfig: $customConfig)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchFieldConfigImpl &&
            (identical(other.fieldName, fieldName) ||
                other.fieldName == fieldName) &&
            (identical(other.dataType, dataType) ||
                other.dataType == dataType) &&
            (identical(other.isSearchable, isSearchable) ||
                other.isSearchable == isSearchable) &&
            (identical(other.isFilterable, isFilterable) ||
                other.isFilterable == isFilterable) &&
            (identical(other.isSortable, isSortable) ||
                other.isSortable == isSortable) &&
            (identical(other.boost, boost) || other.boost == boost) &&
            (identical(other.isFaceted, isFaceted) ||
                other.isFaceted == isFaceted) &&
            (identical(other.analyzer, analyzer) ||
                other.analyzer == analyzer) &&
            const DeepCollectionEquality()
                .equals(other._customConfig, _customConfig));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      fieldName,
      dataType,
      isSearchable,
      isFilterable,
      isSortable,
      boost,
      isFaceted,
      analyzer,
      const DeepCollectionEquality().hash(_customConfig));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchFieldConfigImplCopyWith<_$SearchFieldConfigImpl> get copyWith =>
      __$$SearchFieldConfigImplCopyWithImpl<_$SearchFieldConfigImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchFieldConfigImplToJson(
      this,
    );
  }
}

abstract class _SearchFieldConfig implements SearchFieldConfig {
  const factory _SearchFieldConfig(
      {required final String fieldName,
      required final FieldDataType dataType,
      required final bool isSearchable,
      required final bool isFilterable,
      required final bool isSortable,
      final double boost,
      final bool isFaceted,
      final String? analyzer,
      final Map<String, dynamic>? customConfig}) = _$SearchFieldConfigImpl;

  factory _SearchFieldConfig.fromJson(Map<String, dynamic> json) =
      _$SearchFieldConfigImpl.fromJson;

  @override
  String get fieldName;
  @override
  FieldDataType get dataType;
  @override
  bool get isSearchable;
  @override
  bool get isFilterable;
  @override
  bool get isSortable;
  @override
  double get boost;
  @override
  bool get isFaceted;
  @override
  String? get analyzer;
  @override
  Map<String, dynamic>? get customConfig;
  @override
  @JsonKey(ignore: true)
  _$$SearchFieldConfigImplCopyWith<_$SearchFieldConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FacetResult _$FacetResultFromJson(Map<String, dynamic> json) {
  return _FacetResult.fromJson(json);
}

/// @nodoc
mixin _$FacetResult {
  String get field => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  List<FacetValue> get values => throw _privateConstructorUsedError;
  FacetType get type => throw _privateConstructorUsedError;
  int? get totalCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FacetResultCopyWith<FacetResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FacetResultCopyWith<$Res> {
  factory $FacetResultCopyWith(
          FacetResult value, $Res Function(FacetResult) then) =
      _$FacetResultCopyWithImpl<$Res, FacetResult>;
  @useResult
  $Res call(
      {String field,
      String displayName,
      List<FacetValue> values,
      FacetType type,
      int? totalCount});
}

/// @nodoc
class _$FacetResultCopyWithImpl<$Res, $Val extends FacetResult>
    implements $FacetResultCopyWith<$Res> {
  _$FacetResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field = null,
    Object? displayName = null,
    Object? values = null,
    Object? type = null,
    Object? totalCount = freezed,
  }) {
    return _then(_value.copyWith(
      field: null == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      values: null == values
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as List<FacetValue>,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FacetType,
      totalCount: freezed == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FacetResultImplCopyWith<$Res>
    implements $FacetResultCopyWith<$Res> {
  factory _$$FacetResultImplCopyWith(
          _$FacetResultImpl value, $Res Function(_$FacetResultImpl) then) =
      __$$FacetResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String field,
      String displayName,
      List<FacetValue> values,
      FacetType type,
      int? totalCount});
}

/// @nodoc
class __$$FacetResultImplCopyWithImpl<$Res>
    extends _$FacetResultCopyWithImpl<$Res, _$FacetResultImpl>
    implements _$$FacetResultImplCopyWith<$Res> {
  __$$FacetResultImplCopyWithImpl(
      _$FacetResultImpl _value, $Res Function(_$FacetResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field = null,
    Object? displayName = null,
    Object? values = null,
    Object? type = null,
    Object? totalCount = freezed,
  }) {
    return _then(_$FacetResultImpl(
      field: null == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      values: null == values
          ? _value._values
          : values // ignore: cast_nullable_to_non_nullable
              as List<FacetValue>,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FacetType,
      totalCount: freezed == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FacetResultImpl implements _FacetResult {
  const _$FacetResultImpl(
      {required this.field,
      required this.displayName,
      final List<FacetValue> values = const [],
      required this.type,
      this.totalCount})
      : _values = values;

  factory _$FacetResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$FacetResultImplFromJson(json);

  @override
  final String field;
  @override
  final String displayName;
  final List<FacetValue> _values;
  @override
  @JsonKey()
  List<FacetValue> get values {
    if (_values is EqualUnmodifiableListView) return _values;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_values);
  }

  @override
  final FacetType type;
  @override
  final int? totalCount;

  @override
  String toString() {
    return 'FacetResult(field: $field, displayName: $displayName, values: $values, type: $type, totalCount: $totalCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FacetResultImpl &&
            (identical(other.field, field) || other.field == field) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            const DeepCollectionEquality().equals(other._values, _values) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, field, displayName,
      const DeepCollectionEquality().hash(_values), type, totalCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FacetResultImplCopyWith<_$FacetResultImpl> get copyWith =>
      __$$FacetResultImplCopyWithImpl<_$FacetResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FacetResultImplToJson(
      this,
    );
  }
}

abstract class _FacetResult implements FacetResult {
  const factory _FacetResult(
      {required final String field,
      required final String displayName,
      final List<FacetValue> values,
      required final FacetType type,
      final int? totalCount}) = _$FacetResultImpl;

  factory _FacetResult.fromJson(Map<String, dynamic> json) =
      _$FacetResultImpl.fromJson;

  @override
  String get field;
  @override
  String get displayName;
  @override
  List<FacetValue> get values;
  @override
  FacetType get type;
  @override
  int? get totalCount;
  @override
  @JsonKey(ignore: true)
  _$$FacetResultImplCopyWith<_$FacetResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FacetValue _$FacetValueFromJson(Map<String, dynamic> json) {
  return _FacetValue.fromJson(json);
}

/// @nodoc
mixin _$FacetValue {
  String get value => throw _privateConstructorUsedError;
  String get displayValue => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  bool get isSelected => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FacetValueCopyWith<FacetValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FacetValueCopyWith<$Res> {
  factory $FacetValueCopyWith(
          FacetValue value, $Res Function(FacetValue) then) =
      _$FacetValueCopyWithImpl<$Res, FacetValue>;
  @useResult
  $Res call(
      {String value,
      String displayValue,
      int count,
      bool isSelected,
      String? description});
}

/// @nodoc
class _$FacetValueCopyWithImpl<$Res, $Val extends FacetValue>
    implements $FacetValueCopyWith<$Res> {
  _$FacetValueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? displayValue = null,
    Object? count = null,
    Object? isSelected = null,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      displayValue: null == displayValue
          ? _value.displayValue
          : displayValue // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FacetValueImplCopyWith<$Res>
    implements $FacetValueCopyWith<$Res> {
  factory _$$FacetValueImplCopyWith(
          _$FacetValueImpl value, $Res Function(_$FacetValueImpl) then) =
      __$$FacetValueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String value,
      String displayValue,
      int count,
      bool isSelected,
      String? description});
}

/// @nodoc
class __$$FacetValueImplCopyWithImpl<$Res>
    extends _$FacetValueCopyWithImpl<$Res, _$FacetValueImpl>
    implements _$$FacetValueImplCopyWith<$Res> {
  __$$FacetValueImplCopyWithImpl(
      _$FacetValueImpl _value, $Res Function(_$FacetValueImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? displayValue = null,
    Object? count = null,
    Object? isSelected = null,
    Object? description = freezed,
  }) {
    return _then(_$FacetValueImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      displayValue: null == displayValue
          ? _value.displayValue
          : displayValue // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FacetValueImpl implements _FacetValue {
  const _$FacetValueImpl(
      {required this.value,
      required this.displayValue,
      required this.count,
      required this.isSelected,
      this.description});

  factory _$FacetValueImpl.fromJson(Map<String, dynamic> json) =>
      _$$FacetValueImplFromJson(json);

  @override
  final String value;
  @override
  final String displayValue;
  @override
  final int count;
  @override
  final bool isSelected;
  @override
  final String? description;

  @override
  String toString() {
    return 'FacetValue(value: $value, displayValue: $displayValue, count: $count, isSelected: $isSelected, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FacetValueImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.displayValue, displayValue) ||
                other.displayValue == displayValue) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, value, displayValue, count, isSelected, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FacetValueImplCopyWith<_$FacetValueImpl> get copyWith =>
      __$$FacetValueImplCopyWithImpl<_$FacetValueImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FacetValueImplToJson(
      this,
    );
  }
}

abstract class _FacetValue implements FacetValue {
  const factory _FacetValue(
      {required final String value,
      required final String displayValue,
      required final int count,
      required final bool isSelected,
      final String? description}) = _$FacetValueImpl;

  factory _FacetValue.fromJson(Map<String, dynamic> json) =
      _$FacetValueImpl.fromJson;

  @override
  String get value;
  @override
  String get displayValue;
  @override
  int get count;
  @override
  bool get isSelected;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$FacetValueImplCopyWith<_$FacetValueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
