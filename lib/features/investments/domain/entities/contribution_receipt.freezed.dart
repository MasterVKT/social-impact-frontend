// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contribution_receipt.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ContributionReceipt _$ContributionReceiptFromJson(Map<String, dynamic> json) {
  return _ContributionReceipt.fromJson(json);
}

/// @nodoc
mixin _$ContributionReceipt {
  String get id => throw _privateConstructorUsedError;
  String get contributionId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get kind => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContributionReceiptCopyWith<ContributionReceipt> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContributionReceiptCopyWith<$Res> {
  factory $ContributionReceiptCopyWith(
          ContributionReceipt value, $Res Function(ContributionReceipt) then) =
      _$ContributionReceiptCopyWithImpl<$Res, ContributionReceipt>;
  @useResult
  $Res call(
      {String id,
      String contributionId,
      String userId,
      String url,
      DateTime createdAt,
      String kind});
}

/// @nodoc
class _$ContributionReceiptCopyWithImpl<$Res, $Val extends ContributionReceipt>
    implements $ContributionReceiptCopyWith<$Res> {
  _$ContributionReceiptCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? contributionId = null,
    Object? userId = null,
    Object? url = null,
    Object? createdAt = null,
    Object? kind = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      contributionId: null == contributionId
          ? _value.contributionId
          : contributionId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      kind: null == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContributionReceiptImplCopyWith<$Res>
    implements $ContributionReceiptCopyWith<$Res> {
  factory _$$ContributionReceiptImplCopyWith(_$ContributionReceiptImpl value,
          $Res Function(_$ContributionReceiptImpl) then) =
      __$$ContributionReceiptImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String contributionId,
      String userId,
      String url,
      DateTime createdAt,
      String kind});
}

/// @nodoc
class __$$ContributionReceiptImplCopyWithImpl<$Res>
    extends _$ContributionReceiptCopyWithImpl<$Res, _$ContributionReceiptImpl>
    implements _$$ContributionReceiptImplCopyWith<$Res> {
  __$$ContributionReceiptImplCopyWithImpl(_$ContributionReceiptImpl _value,
      $Res Function(_$ContributionReceiptImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? contributionId = null,
    Object? userId = null,
    Object? url = null,
    Object? createdAt = null,
    Object? kind = null,
  }) {
    return _then(_$ContributionReceiptImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      contributionId: null == contributionId
          ? _value.contributionId
          : contributionId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      kind: null == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContributionReceiptImpl implements _ContributionReceipt {
  const _$ContributionReceiptImpl(
      {required this.id,
      required this.contributionId,
      required this.userId,
      required this.url,
      required this.createdAt,
      this.kind = 'contribution'});

  factory _$ContributionReceiptImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContributionReceiptImplFromJson(json);

  @override
  final String id;
  @override
  final String contributionId;
  @override
  final String userId;
  @override
  final String url;
  @override
  final DateTime createdAt;
  @override
  @JsonKey()
  final String kind;

  @override
  String toString() {
    return 'ContributionReceipt(id: $id, contributionId: $contributionId, userId: $userId, url: $url, createdAt: $createdAt, kind: $kind)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContributionReceiptImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.contributionId, contributionId) ||
                other.contributionId == contributionId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.kind, kind) || other.kind == kind));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, contributionId, userId, url, createdAt, kind);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContributionReceiptImplCopyWith<_$ContributionReceiptImpl> get copyWith =>
      __$$ContributionReceiptImplCopyWithImpl<_$ContributionReceiptImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContributionReceiptImplToJson(
      this,
    );
  }
}

abstract class _ContributionReceipt implements ContributionReceipt {
  const factory _ContributionReceipt(
      {required final String id,
      required final String contributionId,
      required final String userId,
      required final String url,
      required final DateTime createdAt,
      final String kind}) = _$ContributionReceiptImpl;

  factory _ContributionReceipt.fromJson(Map<String, dynamic> json) =
      _$ContributionReceiptImpl.fromJson;

  @override
  String get id;
  @override
  String get contributionId;
  @override
  String get userId;
  @override
  String get url;
  @override
  DateTime get createdAt;
  @override
  String get kind;
  @override
  @JsonKey(ignore: true)
  _$$ContributionReceiptImplCopyWith<_$ContributionReceiptImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
