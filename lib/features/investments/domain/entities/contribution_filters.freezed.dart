// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contribution_filters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ContributionFilters _$ContributionFiltersFromJson(Map<String, dynamic> json) {
  return _ContributionFilters.fromJson(json);
}

/// @nodoc
mixin _$ContributionFilters {
  DateTime? get from => throw _privateConstructorUsedError;
  DateTime? get to => throw _privateConstructorUsedError;
  List<ContributionStatus>? get statuses => throw _privateConstructorUsedError;
  String? get projectId => throw _privateConstructorUsedError;
  int? get minAmountCents => throw _privateConstructorUsedError;
  int? get maxAmountCents => throw _privateConstructorUsedError;
  String? get searchText => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContributionFiltersCopyWith<ContributionFilters> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContributionFiltersCopyWith<$Res> {
  factory $ContributionFiltersCopyWith(
          ContributionFilters value, $Res Function(ContributionFilters) then) =
      _$ContributionFiltersCopyWithImpl<$Res, ContributionFilters>;
  @useResult
  $Res call(
      {DateTime? from,
      DateTime? to,
      List<ContributionStatus>? statuses,
      String? projectId,
      int? minAmountCents,
      int? maxAmountCents,
      String? searchText});
}

/// @nodoc
class _$ContributionFiltersCopyWithImpl<$Res, $Val extends ContributionFilters>
    implements $ContributionFiltersCopyWith<$Res> {
  _$ContributionFiltersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = freezed,
    Object? to = freezed,
    Object? statuses = freezed,
    Object? projectId = freezed,
    Object? minAmountCents = freezed,
    Object? maxAmountCents = freezed,
    Object? searchText = freezed,
  }) {
    return _then(_value.copyWith(
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      statuses: freezed == statuses
          ? _value.statuses
          : statuses // ignore: cast_nullable_to_non_nullable
              as List<ContributionStatus>?,
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String?,
      minAmountCents: freezed == minAmountCents
          ? _value.minAmountCents
          : minAmountCents // ignore: cast_nullable_to_non_nullable
              as int?,
      maxAmountCents: freezed == maxAmountCents
          ? _value.maxAmountCents
          : maxAmountCents // ignore: cast_nullable_to_non_nullable
              as int?,
      searchText: freezed == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContributionFiltersImplCopyWith<$Res>
    implements $ContributionFiltersCopyWith<$Res> {
  factory _$$ContributionFiltersImplCopyWith(_$ContributionFiltersImpl value,
          $Res Function(_$ContributionFiltersImpl) then) =
      __$$ContributionFiltersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime? from,
      DateTime? to,
      List<ContributionStatus>? statuses,
      String? projectId,
      int? minAmountCents,
      int? maxAmountCents,
      String? searchText});
}

/// @nodoc
class __$$ContributionFiltersImplCopyWithImpl<$Res>
    extends _$ContributionFiltersCopyWithImpl<$Res, _$ContributionFiltersImpl>
    implements _$$ContributionFiltersImplCopyWith<$Res> {
  __$$ContributionFiltersImplCopyWithImpl(_$ContributionFiltersImpl _value,
      $Res Function(_$ContributionFiltersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = freezed,
    Object? to = freezed,
    Object? statuses = freezed,
    Object? projectId = freezed,
    Object? minAmountCents = freezed,
    Object? maxAmountCents = freezed,
    Object? searchText = freezed,
  }) {
    return _then(_$ContributionFiltersImpl(
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      statuses: freezed == statuses
          ? _value._statuses
          : statuses // ignore: cast_nullable_to_non_nullable
              as List<ContributionStatus>?,
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String?,
      minAmountCents: freezed == minAmountCents
          ? _value.minAmountCents
          : minAmountCents // ignore: cast_nullable_to_non_nullable
              as int?,
      maxAmountCents: freezed == maxAmountCents
          ? _value.maxAmountCents
          : maxAmountCents // ignore: cast_nullable_to_non_nullable
              as int?,
      searchText: freezed == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContributionFiltersImpl implements _ContributionFilters {
  const _$ContributionFiltersImpl(
      {this.from,
      this.to,
      final List<ContributionStatus>? statuses,
      this.projectId,
      this.minAmountCents,
      this.maxAmountCents,
      this.searchText})
      : _statuses = statuses;

  factory _$ContributionFiltersImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContributionFiltersImplFromJson(json);

  @override
  final DateTime? from;
  @override
  final DateTime? to;
  final List<ContributionStatus>? _statuses;
  @override
  List<ContributionStatus>? get statuses {
    final value = _statuses;
    if (value == null) return null;
    if (_statuses is EqualUnmodifiableListView) return _statuses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? projectId;
  @override
  final int? minAmountCents;
  @override
  final int? maxAmountCents;
  @override
  final String? searchText;

  @override
  String toString() {
    return 'ContributionFilters(from: $from, to: $to, statuses: $statuses, projectId: $projectId, minAmountCents: $minAmountCents, maxAmountCents: $maxAmountCents, searchText: $searchText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContributionFiltersImpl &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            const DeepCollectionEquality().equals(other._statuses, _statuses) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.minAmountCents, minAmountCents) ||
                other.minAmountCents == minAmountCents) &&
            (identical(other.maxAmountCents, maxAmountCents) ||
                other.maxAmountCents == maxAmountCents) &&
            (identical(other.searchText, searchText) ||
                other.searchText == searchText));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      from,
      to,
      const DeepCollectionEquality().hash(_statuses),
      projectId,
      minAmountCents,
      maxAmountCents,
      searchText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContributionFiltersImplCopyWith<_$ContributionFiltersImpl> get copyWith =>
      __$$ContributionFiltersImplCopyWithImpl<_$ContributionFiltersImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContributionFiltersImplToJson(
      this,
    );
  }
}

abstract class _ContributionFilters implements ContributionFilters {
  const factory _ContributionFilters(
      {final DateTime? from,
      final DateTime? to,
      final List<ContributionStatus>? statuses,
      final String? projectId,
      final int? minAmountCents,
      final int? maxAmountCents,
      final String? searchText}) = _$ContributionFiltersImpl;

  factory _ContributionFilters.fromJson(Map<String, dynamic> json) =
      _$ContributionFiltersImpl.fromJson;

  @override
  DateTime? get from;
  @override
  DateTime? get to;
  @override
  List<ContributionStatus>? get statuses;
  @override
  String? get projectId;
  @override
  int? get minAmountCents;
  @override
  int? get maxAmountCents;
  @override
  String? get searchText;
  @override
  @JsonKey(ignore: true)
  _$$ContributionFiltersImplCopyWith<_$ContributionFiltersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
