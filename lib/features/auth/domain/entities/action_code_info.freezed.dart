// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'action_code_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ActionCodeInfo _$ActionCodeInfoFromJson(Map<String, dynamic> json) {
  return _ActionCodeInfo.fromJson(json);
}

/// @nodoc
mixin _$ActionCodeInfo {
  String get operation => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get previousEmail => throw _privateConstructorUsedError;
  Map<String, dynamic> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ActionCodeInfoCopyWith<ActionCodeInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActionCodeInfoCopyWith<$Res> {
  factory $ActionCodeInfoCopyWith(
          ActionCodeInfo value, $Res Function(ActionCodeInfo) then) =
      _$ActionCodeInfoCopyWithImpl<$Res, ActionCodeInfo>;
  @useResult
  $Res call(
      {String operation,
      String email,
      String? previousEmail,
      Map<String, dynamic> data});
}

/// @nodoc
class _$ActionCodeInfoCopyWithImpl<$Res, $Val extends ActionCodeInfo>
    implements $ActionCodeInfoCopyWith<$Res> {
  _$ActionCodeInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? operation = null,
    Object? email = null,
    Object? previousEmail = freezed,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      operation: null == operation
          ? _value.operation
          : operation // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      previousEmail: freezed == previousEmail
          ? _value.previousEmail
          : previousEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActionCodeInfoImplCopyWith<$Res>
    implements $ActionCodeInfoCopyWith<$Res> {
  factory _$$ActionCodeInfoImplCopyWith(_$ActionCodeInfoImpl value,
          $Res Function(_$ActionCodeInfoImpl) then) =
      __$$ActionCodeInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String operation,
      String email,
      String? previousEmail,
      Map<String, dynamic> data});
}

/// @nodoc
class __$$ActionCodeInfoImplCopyWithImpl<$Res>
    extends _$ActionCodeInfoCopyWithImpl<$Res, _$ActionCodeInfoImpl>
    implements _$$ActionCodeInfoImplCopyWith<$Res> {
  __$$ActionCodeInfoImplCopyWithImpl(
      _$ActionCodeInfoImpl _value, $Res Function(_$ActionCodeInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? operation = null,
    Object? email = null,
    Object? previousEmail = freezed,
    Object? data = null,
  }) {
    return _then(_$ActionCodeInfoImpl(
      operation: null == operation
          ? _value.operation
          : operation // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      previousEmail: freezed == previousEmail
          ? _value.previousEmail
          : previousEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ActionCodeInfoImpl implements _ActionCodeInfo {
  const _$ActionCodeInfoImpl(
      {required this.operation,
      required this.email,
      this.previousEmail,
      final Map<String, dynamic> data = const {}})
      : _data = data;

  factory _$ActionCodeInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActionCodeInfoImplFromJson(json);

  @override
  final String operation;
  @override
  final String email;
  @override
  final String? previousEmail;
  final Map<String, dynamic> _data;
  @override
  @JsonKey()
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  String toString() {
    return 'ActionCodeInfo(operation: $operation, email: $email, previousEmail: $previousEmail, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActionCodeInfoImpl &&
            (identical(other.operation, operation) ||
                other.operation == operation) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.previousEmail, previousEmail) ||
                other.previousEmail == previousEmail) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, operation, email, previousEmail,
      const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ActionCodeInfoImplCopyWith<_$ActionCodeInfoImpl> get copyWith =>
      __$$ActionCodeInfoImplCopyWithImpl<_$ActionCodeInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActionCodeInfoImplToJson(
      this,
    );
  }
}

abstract class _ActionCodeInfo implements ActionCodeInfo {
  const factory _ActionCodeInfo(
      {required final String operation,
      required final String email,
      final String? previousEmail,
      final Map<String, dynamic> data}) = _$ActionCodeInfoImpl;

  factory _ActionCodeInfo.fromJson(Map<String, dynamic> json) =
      _$ActionCodeInfoImpl.fromJson;

  @override
  String get operation;
  @override
  String get email;
  @override
  String? get previousEmail;
  @override
  Map<String, dynamic> get data;
  @override
  @JsonKey(ignore: true)
  _$$ActionCodeInfoImplCopyWith<_$ActionCodeInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
