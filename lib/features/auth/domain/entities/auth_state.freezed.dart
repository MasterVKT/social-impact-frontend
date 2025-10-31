// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function() loading,
    required TResult Function(String message, String? code) error,
    required TResult Function() initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function()? loading,
    TResult? Function(String message, String? code)? error,
    TResult? Function()? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function()? loading,
    TResult Function(String message, String? code)? error,
    TResult Function()? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStateAuthenticated value) authenticated,
    required TResult Function(AuthStateUnauthenticated value) unauthenticated,
    required TResult Function(AuthStateLoading value) loading,
    required TResult Function(AuthStateError value) error,
    required TResult Function(AuthStateInitial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStateAuthenticated value)? authenticated,
    TResult? Function(AuthStateUnauthenticated value)? unauthenticated,
    TResult? Function(AuthStateLoading value)? loading,
    TResult? Function(AuthStateError value)? error,
    TResult? Function(AuthStateInitial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateAuthenticated value)? authenticated,
    TResult Function(AuthStateUnauthenticated value)? unauthenticated,
    TResult Function(AuthStateLoading value)? loading,
    TResult Function(AuthStateError value)? error,
    TResult Function(AuthStateInitial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AuthStateAuthenticatedImplCopyWith<$Res> {
  factory _$$AuthStateAuthenticatedImplCopyWith(
          _$AuthStateAuthenticatedImpl value,
          $Res Function(_$AuthStateAuthenticatedImpl) then) =
      __$$AuthStateAuthenticatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$AuthStateAuthenticatedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateAuthenticatedImpl>
    implements _$$AuthStateAuthenticatedImplCopyWith<$Res> {
  __$$AuthStateAuthenticatedImplCopyWithImpl(
      _$AuthStateAuthenticatedImpl _value,
      $Res Function(_$AuthStateAuthenticatedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$AuthStateAuthenticatedImpl(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$AuthStateAuthenticatedImpl implements AuthStateAuthenticated {
  const _$AuthStateAuthenticatedImpl(this.user);

  @override
  final User user;

  @override
  String toString() {
    return 'AuthState.authenticated(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateAuthenticatedImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateAuthenticatedImplCopyWith<_$AuthStateAuthenticatedImpl>
      get copyWith => __$$AuthStateAuthenticatedImplCopyWithImpl<
          _$AuthStateAuthenticatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function() loading,
    required TResult Function(String message, String? code) error,
    required TResult Function() initial,
  }) {
    return authenticated(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function()? loading,
    TResult? Function(String message, String? code)? error,
    TResult? Function()? initial,
  }) {
    return authenticated?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function()? loading,
    TResult Function(String message, String? code)? error,
    TResult Function()? initial,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStateAuthenticated value) authenticated,
    required TResult Function(AuthStateUnauthenticated value) unauthenticated,
    required TResult Function(AuthStateLoading value) loading,
    required TResult Function(AuthStateError value) error,
    required TResult Function(AuthStateInitial value) initial,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStateAuthenticated value)? authenticated,
    TResult? Function(AuthStateUnauthenticated value)? unauthenticated,
    TResult? Function(AuthStateLoading value)? loading,
    TResult? Function(AuthStateError value)? error,
    TResult? Function(AuthStateInitial value)? initial,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateAuthenticated value)? authenticated,
    TResult Function(AuthStateUnauthenticated value)? unauthenticated,
    TResult Function(AuthStateLoading value)? loading,
    TResult Function(AuthStateError value)? error,
    TResult Function(AuthStateInitial value)? initial,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class AuthStateAuthenticated implements AuthState {
  const factory AuthStateAuthenticated(final User user) =
      _$AuthStateAuthenticatedImpl;

  User get user;
  @JsonKey(ignore: true)
  _$$AuthStateAuthenticatedImplCopyWith<_$AuthStateAuthenticatedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthStateUnauthenticatedImplCopyWith<$Res> {
  factory _$$AuthStateUnauthenticatedImplCopyWith(
          _$AuthStateUnauthenticatedImpl value,
          $Res Function(_$AuthStateUnauthenticatedImpl) then) =
      __$$AuthStateUnauthenticatedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthStateUnauthenticatedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateUnauthenticatedImpl>
    implements _$$AuthStateUnauthenticatedImplCopyWith<$Res> {
  __$$AuthStateUnauthenticatedImplCopyWithImpl(
      _$AuthStateUnauthenticatedImpl _value,
      $Res Function(_$AuthStateUnauthenticatedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthStateUnauthenticatedImpl implements AuthStateUnauthenticated {
  const _$AuthStateUnauthenticatedImpl();

  @override
  String toString() {
    return 'AuthState.unauthenticated()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateUnauthenticatedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function() loading,
    required TResult Function(String message, String? code) error,
    required TResult Function() initial,
  }) {
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function()? loading,
    TResult? Function(String message, String? code)? error,
    TResult? Function()? initial,
  }) {
    return unauthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function()? loading,
    TResult Function(String message, String? code)? error,
    TResult Function()? initial,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStateAuthenticated value) authenticated,
    required TResult Function(AuthStateUnauthenticated value) unauthenticated,
    required TResult Function(AuthStateLoading value) loading,
    required TResult Function(AuthStateError value) error,
    required TResult Function(AuthStateInitial value) initial,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStateAuthenticated value)? authenticated,
    TResult? Function(AuthStateUnauthenticated value)? unauthenticated,
    TResult? Function(AuthStateLoading value)? loading,
    TResult? Function(AuthStateError value)? error,
    TResult? Function(AuthStateInitial value)? initial,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateAuthenticated value)? authenticated,
    TResult Function(AuthStateUnauthenticated value)? unauthenticated,
    TResult Function(AuthStateLoading value)? loading,
    TResult Function(AuthStateError value)? error,
    TResult Function(AuthStateInitial value)? initial,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class AuthStateUnauthenticated implements AuthState {
  const factory AuthStateUnauthenticated() = _$AuthStateUnauthenticatedImpl;
}

/// @nodoc
abstract class _$$AuthStateLoadingImplCopyWith<$Res> {
  factory _$$AuthStateLoadingImplCopyWith(_$AuthStateLoadingImpl value,
          $Res Function(_$AuthStateLoadingImpl) then) =
      __$$AuthStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthStateLoadingImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateLoadingImpl>
    implements _$$AuthStateLoadingImplCopyWith<$Res> {
  __$$AuthStateLoadingImplCopyWithImpl(_$AuthStateLoadingImpl _value,
      $Res Function(_$AuthStateLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthStateLoadingImpl implements AuthStateLoading {
  const _$AuthStateLoadingImpl();

  @override
  String toString() {
    return 'AuthState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function() loading,
    required TResult Function(String message, String? code) error,
    required TResult Function() initial,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function()? loading,
    TResult? Function(String message, String? code)? error,
    TResult? Function()? initial,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function()? loading,
    TResult Function(String message, String? code)? error,
    TResult Function()? initial,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStateAuthenticated value) authenticated,
    required TResult Function(AuthStateUnauthenticated value) unauthenticated,
    required TResult Function(AuthStateLoading value) loading,
    required TResult Function(AuthStateError value) error,
    required TResult Function(AuthStateInitial value) initial,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStateAuthenticated value)? authenticated,
    TResult? Function(AuthStateUnauthenticated value)? unauthenticated,
    TResult? Function(AuthStateLoading value)? loading,
    TResult? Function(AuthStateError value)? error,
    TResult? Function(AuthStateInitial value)? initial,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateAuthenticated value)? authenticated,
    TResult Function(AuthStateUnauthenticated value)? unauthenticated,
    TResult Function(AuthStateLoading value)? loading,
    TResult Function(AuthStateError value)? error,
    TResult Function(AuthStateInitial value)? initial,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AuthStateLoading implements AuthState {
  const factory AuthStateLoading() = _$AuthStateLoadingImpl;
}

/// @nodoc
abstract class _$$AuthStateErrorImplCopyWith<$Res> {
  factory _$$AuthStateErrorImplCopyWith(_$AuthStateErrorImpl value,
          $Res Function(_$AuthStateErrorImpl) then) =
      __$$AuthStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message, String? code});
}

/// @nodoc
class __$$AuthStateErrorImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateErrorImpl>
    implements _$$AuthStateErrorImplCopyWith<$Res> {
  __$$AuthStateErrorImplCopyWithImpl(
      _$AuthStateErrorImpl _value, $Res Function(_$AuthStateErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? code = freezed,
  }) {
    return _then(_$AuthStateErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AuthStateErrorImpl implements AuthStateError {
  const _$AuthStateErrorImpl(this.message, {this.code});

  @override
  final String message;
  @override
  final String? code;

  @override
  String toString() {
    return 'AuthState.error(message: $message, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateErrorImplCopyWith<_$AuthStateErrorImpl> get copyWith =>
      __$$AuthStateErrorImplCopyWithImpl<_$AuthStateErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function() loading,
    required TResult Function(String message, String? code) error,
    required TResult Function() initial,
  }) {
    return error(message, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function()? loading,
    TResult? Function(String message, String? code)? error,
    TResult? Function()? initial,
  }) {
    return error?.call(message, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function()? loading,
    TResult Function(String message, String? code)? error,
    TResult Function()? initial,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStateAuthenticated value) authenticated,
    required TResult Function(AuthStateUnauthenticated value) unauthenticated,
    required TResult Function(AuthStateLoading value) loading,
    required TResult Function(AuthStateError value) error,
    required TResult Function(AuthStateInitial value) initial,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStateAuthenticated value)? authenticated,
    TResult? Function(AuthStateUnauthenticated value)? unauthenticated,
    TResult? Function(AuthStateLoading value)? loading,
    TResult? Function(AuthStateError value)? error,
    TResult? Function(AuthStateInitial value)? initial,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateAuthenticated value)? authenticated,
    TResult Function(AuthStateUnauthenticated value)? unauthenticated,
    TResult Function(AuthStateLoading value)? loading,
    TResult Function(AuthStateError value)? error,
    TResult Function(AuthStateInitial value)? initial,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class AuthStateError implements AuthState {
  const factory AuthStateError(final String message, {final String? code}) =
      _$AuthStateErrorImpl;

  String get message;
  String? get code;
  @JsonKey(ignore: true)
  _$$AuthStateErrorImplCopyWith<_$AuthStateErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthStateInitialImplCopyWith<$Res> {
  factory _$$AuthStateInitialImplCopyWith(_$AuthStateInitialImpl value,
          $Res Function(_$AuthStateInitialImpl) then) =
      __$$AuthStateInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthStateInitialImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateInitialImpl>
    implements _$$AuthStateInitialImplCopyWith<$Res> {
  __$$AuthStateInitialImplCopyWithImpl(_$AuthStateInitialImpl _value,
      $Res Function(_$AuthStateInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthStateInitialImpl implements AuthStateInitial {
  const _$AuthStateInitialImpl();

  @override
  String toString() {
    return 'AuthState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthStateInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function() loading,
    required TResult Function(String message, String? code) error,
    required TResult Function() initial,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function()? loading,
    TResult? Function(String message, String? code)? error,
    TResult? Function()? initial,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function()? loading,
    TResult Function(String message, String? code)? error,
    TResult Function()? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStateAuthenticated value) authenticated,
    required TResult Function(AuthStateUnauthenticated value) unauthenticated,
    required TResult Function(AuthStateLoading value) loading,
    required TResult Function(AuthStateError value) error,
    required TResult Function(AuthStateInitial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStateAuthenticated value)? authenticated,
    TResult? Function(AuthStateUnauthenticated value)? unauthenticated,
    TResult? Function(AuthStateLoading value)? loading,
    TResult? Function(AuthStateError value)? error,
    TResult? Function(AuthStateInitial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateAuthenticated value)? authenticated,
    TResult Function(AuthStateUnauthenticated value)? unauthenticated,
    TResult Function(AuthStateLoading value)? loading,
    TResult Function(AuthStateError value)? error,
    TResult Function(AuthStateInitial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class AuthStateInitial implements AuthState {
  const factory AuthStateInitial() = _$AuthStateInitialImpl;
}

/// @nodoc
mixin _$AuthResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) success,
    required TResult Function(AuthFailure failure) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? success,
    TResult? Function(AuthFailure failure)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? success,
    TResult Function(AuthFailure failure)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthResultSuccess value) success,
    required TResult Function(AuthResultFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthResultSuccess value)? success,
    TResult? Function(AuthResultFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthResultSuccess value)? success,
    TResult Function(AuthResultFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthResultCopyWith<$Res> {
  factory $AuthResultCopyWith(
          AuthResult value, $Res Function(AuthResult) then) =
      _$AuthResultCopyWithImpl<$Res, AuthResult>;
}

/// @nodoc
class _$AuthResultCopyWithImpl<$Res, $Val extends AuthResult>
    implements $AuthResultCopyWith<$Res> {
  _$AuthResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AuthResultSuccessImplCopyWith<$Res> {
  factory _$$AuthResultSuccessImplCopyWith(_$AuthResultSuccessImpl value,
          $Res Function(_$AuthResultSuccessImpl) then) =
      __$$AuthResultSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$AuthResultSuccessImplCopyWithImpl<$Res>
    extends _$AuthResultCopyWithImpl<$Res, _$AuthResultSuccessImpl>
    implements _$$AuthResultSuccessImplCopyWith<$Res> {
  __$$AuthResultSuccessImplCopyWithImpl(_$AuthResultSuccessImpl _value,
      $Res Function(_$AuthResultSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$AuthResultSuccessImpl(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$AuthResultSuccessImpl implements AuthResultSuccess {
  const _$AuthResultSuccessImpl(this.user);

  @override
  final User user;

  @override
  String toString() {
    return 'AuthResult.success(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthResultSuccessImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthResultSuccessImplCopyWith<_$AuthResultSuccessImpl> get copyWith =>
      __$$AuthResultSuccessImplCopyWithImpl<_$AuthResultSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) success,
    required TResult Function(AuthFailure failure) failure,
  }) {
    return success(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? success,
    TResult? Function(AuthFailure failure)? failure,
  }) {
    return success?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? success,
    TResult Function(AuthFailure failure)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthResultSuccess value) success,
    required TResult Function(AuthResultFailure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthResultSuccess value)? success,
    TResult? Function(AuthResultFailure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthResultSuccess value)? success,
    TResult Function(AuthResultFailure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class AuthResultSuccess implements AuthResult {
  const factory AuthResultSuccess(final User user) = _$AuthResultSuccessImpl;

  User get user;
  @JsonKey(ignore: true)
  _$$AuthResultSuccessImplCopyWith<_$AuthResultSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthResultFailureImplCopyWith<$Res> {
  factory _$$AuthResultFailureImplCopyWith(_$AuthResultFailureImpl value,
          $Res Function(_$AuthResultFailureImpl) then) =
      __$$AuthResultFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AuthFailure failure});

  $AuthFailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$AuthResultFailureImplCopyWithImpl<$Res>
    extends _$AuthResultCopyWithImpl<$Res, _$AuthResultFailureImpl>
    implements _$$AuthResultFailureImplCopyWith<$Res> {
  __$$AuthResultFailureImplCopyWithImpl(_$AuthResultFailureImpl _value,
      $Res Function(_$AuthResultFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$AuthResultFailureImpl(
      null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as AuthFailure,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $AuthFailureCopyWith<$Res> get failure {
    return $AuthFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$AuthResultFailureImpl implements AuthResultFailure {
  const _$AuthResultFailureImpl(this.failure);

  @override
  final AuthFailure failure;

  @override
  String toString() {
    return 'AuthResult.failure(failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthResultFailureImpl &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthResultFailureImplCopyWith<_$AuthResultFailureImpl> get copyWith =>
      __$$AuthResultFailureImplCopyWithImpl<_$AuthResultFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) success,
    required TResult Function(AuthFailure failure) failure,
  }) {
    return failure(this.failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? success,
    TResult? Function(AuthFailure failure)? failure,
  }) {
    return failure?.call(this.failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? success,
    TResult Function(AuthFailure failure)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this.failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthResultSuccess value) success,
    required TResult Function(AuthResultFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthResultSuccess value)? success,
    TResult? Function(AuthResultFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthResultSuccess value)? success,
    TResult Function(AuthResultFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class AuthResultFailure implements AuthResult {
  const factory AuthResultFailure(final AuthFailure failure) =
      _$AuthResultFailureImpl;

  AuthFailure get failure;
  @JsonKey(ignore: true)
  _$$AuthResultFailureImplCopyWith<_$AuthResultFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AuthFailure {
  String get message => throw _privateConstructorUsedError;
  AuthFailureType get type => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  Map<String, dynamic>? get details => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthFailureCopyWith<AuthFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthFailureCopyWith<$Res> {
  factory $AuthFailureCopyWith(
          AuthFailure value, $Res Function(AuthFailure) then) =
      _$AuthFailureCopyWithImpl<$Res, AuthFailure>;
  @useResult
  $Res call(
      {String message,
      AuthFailureType type,
      String? code,
      Map<String, dynamic>? details});
}

/// @nodoc
class _$AuthFailureCopyWithImpl<$Res, $Val extends AuthFailure>
    implements $AuthFailureCopyWith<$Res> {
  _$AuthFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? type = null,
    Object? code = freezed,
    Object? details = freezed,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AuthFailureType,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthFailureImplCopyWith<$Res>
    implements $AuthFailureCopyWith<$Res> {
  factory _$$AuthFailureImplCopyWith(
          _$AuthFailureImpl value, $Res Function(_$AuthFailureImpl) then) =
      __$$AuthFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String message,
      AuthFailureType type,
      String? code,
      Map<String, dynamic>? details});
}

/// @nodoc
class __$$AuthFailureImplCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res, _$AuthFailureImpl>
    implements _$$AuthFailureImplCopyWith<$Res> {
  __$$AuthFailureImplCopyWithImpl(
      _$AuthFailureImpl _value, $Res Function(_$AuthFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? type = null,
    Object? code = freezed,
    Object? details = freezed,
  }) {
    return _then(_$AuthFailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AuthFailureType,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      details: freezed == details
          ? _value._details
          : details // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc

class _$AuthFailureImpl implements _AuthFailure {
  const _$AuthFailureImpl(
      {required this.message,
      required this.type,
      this.code,
      final Map<String, dynamic>? details})
      : _details = details;

  @override
  final String message;
  @override
  final AuthFailureType type;
  @override
  final String? code;
  final Map<String, dynamic>? _details;
  @override
  Map<String, dynamic>? get details {
    final value = _details;
    if (value == null) return null;
    if (_details is EqualUnmodifiableMapView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'AuthFailure(message: $message, type: $type, code: $code, details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthFailureImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.code, code) || other.code == code) &&
            const DeepCollectionEquality().equals(other._details, _details));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, type, code,
      const DeepCollectionEquality().hash(_details));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthFailureImplCopyWith<_$AuthFailureImpl> get copyWith =>
      __$$AuthFailureImplCopyWithImpl<_$AuthFailureImpl>(this, _$identity);
}

abstract class _AuthFailure implements AuthFailure {
  const factory _AuthFailure(
      {required final String message,
      required final AuthFailureType type,
      final String? code,
      final Map<String, dynamic>? details}) = _$AuthFailureImpl;

  @override
  String get message;
  @override
  AuthFailureType get type;
  @override
  String? get code;
  @override
  Map<String, dynamic>? get details;
  @override
  @JsonKey(ignore: true)
  _$$AuthFailureImplCopyWith<_$AuthFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LoginCredentials {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password, bool rememberMe)
        emailPassword,
    required TResult Function(String? idToken, String? accessToken) google,
    required TResult Function(
            String? idToken, String? authorizationCode, String? nonce)
        apple,
    required TResult Function(String userId, BiometricType type) biometric,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password, bool rememberMe)?
        emailPassword,
    TResult? Function(String? idToken, String? accessToken)? google,
    TResult? Function(
            String? idToken, String? authorizationCode, String? nonce)?
        apple,
    TResult? Function(String userId, BiometricType type)? biometric,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password, bool rememberMe)?
        emailPassword,
    TResult Function(String? idToken, String? accessToken)? google,
    TResult Function(String? idToken, String? authorizationCode, String? nonce)?
        apple,
    TResult Function(String userId, BiometricType type)? biometric,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailPasswordCredentials value) emailPassword,
    required TResult Function(GoogleCredentials value) google,
    required TResult Function(AppleCredentials value) apple,
    required TResult Function(BiometricCredentials value) biometric,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailPasswordCredentials value)? emailPassword,
    TResult? Function(GoogleCredentials value)? google,
    TResult? Function(AppleCredentials value)? apple,
    TResult? Function(BiometricCredentials value)? biometric,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailPasswordCredentials value)? emailPassword,
    TResult Function(GoogleCredentials value)? google,
    TResult Function(AppleCredentials value)? apple,
    TResult Function(BiometricCredentials value)? biometric,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginCredentialsCopyWith<$Res> {
  factory $LoginCredentialsCopyWith(
          LoginCredentials value, $Res Function(LoginCredentials) then) =
      _$LoginCredentialsCopyWithImpl<$Res, LoginCredentials>;
}

/// @nodoc
class _$LoginCredentialsCopyWithImpl<$Res, $Val extends LoginCredentials>
    implements $LoginCredentialsCopyWith<$Res> {
  _$LoginCredentialsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$EmailPasswordCredentialsImplCopyWith<$Res> {
  factory _$$EmailPasswordCredentialsImplCopyWith(
          _$EmailPasswordCredentialsImpl value,
          $Res Function(_$EmailPasswordCredentialsImpl) then) =
      __$$EmailPasswordCredentialsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, String password, bool rememberMe});
}

/// @nodoc
class __$$EmailPasswordCredentialsImplCopyWithImpl<$Res>
    extends _$LoginCredentialsCopyWithImpl<$Res, _$EmailPasswordCredentialsImpl>
    implements _$$EmailPasswordCredentialsImplCopyWith<$Res> {
  __$$EmailPasswordCredentialsImplCopyWithImpl(
      _$EmailPasswordCredentialsImpl _value,
      $Res Function(_$EmailPasswordCredentialsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? rememberMe = null,
  }) {
    return _then(_$EmailPasswordCredentialsImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      rememberMe: null == rememberMe
          ? _value.rememberMe
          : rememberMe // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$EmailPasswordCredentialsImpl implements EmailPasswordCredentials {
  const _$EmailPasswordCredentialsImpl(
      {required this.email, required this.password, this.rememberMe = false});

  @override
  final String email;
  @override
  final String password;
  @override
  @JsonKey()
  final bool rememberMe;

  @override
  String toString() {
    return 'LoginCredentials.emailPassword(email: $email, password: $password, rememberMe: $rememberMe)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailPasswordCredentialsImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.rememberMe, rememberMe) ||
                other.rememberMe == rememberMe));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password, rememberMe);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailPasswordCredentialsImplCopyWith<_$EmailPasswordCredentialsImpl>
      get copyWith => __$$EmailPasswordCredentialsImplCopyWithImpl<
          _$EmailPasswordCredentialsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password, bool rememberMe)
        emailPassword,
    required TResult Function(String? idToken, String? accessToken) google,
    required TResult Function(
            String? idToken, String? authorizationCode, String? nonce)
        apple,
    required TResult Function(String userId, BiometricType type) biometric,
  }) {
    return emailPassword(email, password, rememberMe);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password, bool rememberMe)?
        emailPassword,
    TResult? Function(String? idToken, String? accessToken)? google,
    TResult? Function(
            String? idToken, String? authorizationCode, String? nonce)?
        apple,
    TResult? Function(String userId, BiometricType type)? biometric,
  }) {
    return emailPassword?.call(email, password, rememberMe);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password, bool rememberMe)?
        emailPassword,
    TResult Function(String? idToken, String? accessToken)? google,
    TResult Function(String? idToken, String? authorizationCode, String? nonce)?
        apple,
    TResult Function(String userId, BiometricType type)? biometric,
    required TResult orElse(),
  }) {
    if (emailPassword != null) {
      return emailPassword(email, password, rememberMe);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailPasswordCredentials value) emailPassword,
    required TResult Function(GoogleCredentials value) google,
    required TResult Function(AppleCredentials value) apple,
    required TResult Function(BiometricCredentials value) biometric,
  }) {
    return emailPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailPasswordCredentials value)? emailPassword,
    TResult? Function(GoogleCredentials value)? google,
    TResult? Function(AppleCredentials value)? apple,
    TResult? Function(BiometricCredentials value)? biometric,
  }) {
    return emailPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailPasswordCredentials value)? emailPassword,
    TResult Function(GoogleCredentials value)? google,
    TResult Function(AppleCredentials value)? apple,
    TResult Function(BiometricCredentials value)? biometric,
    required TResult orElse(),
  }) {
    if (emailPassword != null) {
      return emailPassword(this);
    }
    return orElse();
  }
}

abstract class EmailPasswordCredentials implements LoginCredentials {
  const factory EmailPasswordCredentials(
      {required final String email,
      required final String password,
      final bool rememberMe}) = _$EmailPasswordCredentialsImpl;

  String get email;
  String get password;
  bool get rememberMe;
  @JsonKey(ignore: true)
  _$$EmailPasswordCredentialsImplCopyWith<_$EmailPasswordCredentialsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GoogleCredentialsImplCopyWith<$Res> {
  factory _$$GoogleCredentialsImplCopyWith(_$GoogleCredentialsImpl value,
          $Res Function(_$GoogleCredentialsImpl) then) =
      __$$GoogleCredentialsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? idToken, String? accessToken});
}

/// @nodoc
class __$$GoogleCredentialsImplCopyWithImpl<$Res>
    extends _$LoginCredentialsCopyWithImpl<$Res, _$GoogleCredentialsImpl>
    implements _$$GoogleCredentialsImplCopyWith<$Res> {
  __$$GoogleCredentialsImplCopyWithImpl(_$GoogleCredentialsImpl _value,
      $Res Function(_$GoogleCredentialsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idToken = freezed,
    Object? accessToken = freezed,
  }) {
    return _then(_$GoogleCredentialsImpl(
      idToken: freezed == idToken
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String?,
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$GoogleCredentialsImpl implements GoogleCredentials {
  const _$GoogleCredentialsImpl({this.idToken, this.accessToken});

  @override
  final String? idToken;
  @override
  final String? accessToken;

  @override
  String toString() {
    return 'LoginCredentials.google(idToken: $idToken, accessToken: $accessToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoogleCredentialsImpl &&
            (identical(other.idToken, idToken) || other.idToken == idToken) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken));
  }

  @override
  int get hashCode => Object.hash(runtimeType, idToken, accessToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GoogleCredentialsImplCopyWith<_$GoogleCredentialsImpl> get copyWith =>
      __$$GoogleCredentialsImplCopyWithImpl<_$GoogleCredentialsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password, bool rememberMe)
        emailPassword,
    required TResult Function(String? idToken, String? accessToken) google,
    required TResult Function(
            String? idToken, String? authorizationCode, String? nonce)
        apple,
    required TResult Function(String userId, BiometricType type) biometric,
  }) {
    return google(idToken, accessToken);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password, bool rememberMe)?
        emailPassword,
    TResult? Function(String? idToken, String? accessToken)? google,
    TResult? Function(
            String? idToken, String? authorizationCode, String? nonce)?
        apple,
    TResult? Function(String userId, BiometricType type)? biometric,
  }) {
    return google?.call(idToken, accessToken);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password, bool rememberMe)?
        emailPassword,
    TResult Function(String? idToken, String? accessToken)? google,
    TResult Function(String? idToken, String? authorizationCode, String? nonce)?
        apple,
    TResult Function(String userId, BiometricType type)? biometric,
    required TResult orElse(),
  }) {
    if (google != null) {
      return google(idToken, accessToken);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailPasswordCredentials value) emailPassword,
    required TResult Function(GoogleCredentials value) google,
    required TResult Function(AppleCredentials value) apple,
    required TResult Function(BiometricCredentials value) biometric,
  }) {
    return google(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailPasswordCredentials value)? emailPassword,
    TResult? Function(GoogleCredentials value)? google,
    TResult? Function(AppleCredentials value)? apple,
    TResult? Function(BiometricCredentials value)? biometric,
  }) {
    return google?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailPasswordCredentials value)? emailPassword,
    TResult Function(GoogleCredentials value)? google,
    TResult Function(AppleCredentials value)? apple,
    TResult Function(BiometricCredentials value)? biometric,
    required TResult orElse(),
  }) {
    if (google != null) {
      return google(this);
    }
    return orElse();
  }
}

abstract class GoogleCredentials implements LoginCredentials {
  const factory GoogleCredentials(
      {final String? idToken,
      final String? accessToken}) = _$GoogleCredentialsImpl;

  String? get idToken;
  String? get accessToken;
  @JsonKey(ignore: true)
  _$$GoogleCredentialsImplCopyWith<_$GoogleCredentialsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AppleCredentialsImplCopyWith<$Res> {
  factory _$$AppleCredentialsImplCopyWith(_$AppleCredentialsImpl value,
          $Res Function(_$AppleCredentialsImpl) then) =
      __$$AppleCredentialsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? idToken, String? authorizationCode, String? nonce});
}

/// @nodoc
class __$$AppleCredentialsImplCopyWithImpl<$Res>
    extends _$LoginCredentialsCopyWithImpl<$Res, _$AppleCredentialsImpl>
    implements _$$AppleCredentialsImplCopyWith<$Res> {
  __$$AppleCredentialsImplCopyWithImpl(_$AppleCredentialsImpl _value,
      $Res Function(_$AppleCredentialsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idToken = freezed,
    Object? authorizationCode = freezed,
    Object? nonce = freezed,
  }) {
    return _then(_$AppleCredentialsImpl(
      idToken: freezed == idToken
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String?,
      authorizationCode: freezed == authorizationCode
          ? _value.authorizationCode
          : authorizationCode // ignore: cast_nullable_to_non_nullable
              as String?,
      nonce: freezed == nonce
          ? _value.nonce
          : nonce // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AppleCredentialsImpl implements AppleCredentials {
  const _$AppleCredentialsImpl(
      {this.idToken, this.authorizationCode, this.nonce});

  @override
  final String? idToken;
  @override
  final String? authorizationCode;
  @override
  final String? nonce;

  @override
  String toString() {
    return 'LoginCredentials.apple(idToken: $idToken, authorizationCode: $authorizationCode, nonce: $nonce)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppleCredentialsImpl &&
            (identical(other.idToken, idToken) || other.idToken == idToken) &&
            (identical(other.authorizationCode, authorizationCode) ||
                other.authorizationCode == authorizationCode) &&
            (identical(other.nonce, nonce) || other.nonce == nonce));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, idToken, authorizationCode, nonce);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppleCredentialsImplCopyWith<_$AppleCredentialsImpl> get copyWith =>
      __$$AppleCredentialsImplCopyWithImpl<_$AppleCredentialsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password, bool rememberMe)
        emailPassword,
    required TResult Function(String? idToken, String? accessToken) google,
    required TResult Function(
            String? idToken, String? authorizationCode, String? nonce)
        apple,
    required TResult Function(String userId, BiometricType type) biometric,
  }) {
    return apple(idToken, authorizationCode, nonce);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password, bool rememberMe)?
        emailPassword,
    TResult? Function(String? idToken, String? accessToken)? google,
    TResult? Function(
            String? idToken, String? authorizationCode, String? nonce)?
        apple,
    TResult? Function(String userId, BiometricType type)? biometric,
  }) {
    return apple?.call(idToken, authorizationCode, nonce);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password, bool rememberMe)?
        emailPassword,
    TResult Function(String? idToken, String? accessToken)? google,
    TResult Function(String? idToken, String? authorizationCode, String? nonce)?
        apple,
    TResult Function(String userId, BiometricType type)? biometric,
    required TResult orElse(),
  }) {
    if (apple != null) {
      return apple(idToken, authorizationCode, nonce);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailPasswordCredentials value) emailPassword,
    required TResult Function(GoogleCredentials value) google,
    required TResult Function(AppleCredentials value) apple,
    required TResult Function(BiometricCredentials value) biometric,
  }) {
    return apple(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailPasswordCredentials value)? emailPassword,
    TResult? Function(GoogleCredentials value)? google,
    TResult? Function(AppleCredentials value)? apple,
    TResult? Function(BiometricCredentials value)? biometric,
  }) {
    return apple?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailPasswordCredentials value)? emailPassword,
    TResult Function(GoogleCredentials value)? google,
    TResult Function(AppleCredentials value)? apple,
    TResult Function(BiometricCredentials value)? biometric,
    required TResult orElse(),
  }) {
    if (apple != null) {
      return apple(this);
    }
    return orElse();
  }
}

abstract class AppleCredentials implements LoginCredentials {
  const factory AppleCredentials(
      {final String? idToken,
      final String? authorizationCode,
      final String? nonce}) = _$AppleCredentialsImpl;

  String? get idToken;
  String? get authorizationCode;
  String? get nonce;
  @JsonKey(ignore: true)
  _$$AppleCredentialsImplCopyWith<_$AppleCredentialsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BiometricCredentialsImplCopyWith<$Res> {
  factory _$$BiometricCredentialsImplCopyWith(_$BiometricCredentialsImpl value,
          $Res Function(_$BiometricCredentialsImpl) then) =
      __$$BiometricCredentialsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId, BiometricType type});
}

/// @nodoc
class __$$BiometricCredentialsImplCopyWithImpl<$Res>
    extends _$LoginCredentialsCopyWithImpl<$Res, _$BiometricCredentialsImpl>
    implements _$$BiometricCredentialsImplCopyWith<$Res> {
  __$$BiometricCredentialsImplCopyWithImpl(_$BiometricCredentialsImpl _value,
      $Res Function(_$BiometricCredentialsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? type = null,
  }) {
    return _then(_$BiometricCredentialsImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as BiometricType,
    ));
  }
}

/// @nodoc

class _$BiometricCredentialsImpl implements BiometricCredentials {
  const _$BiometricCredentialsImpl(
      {required this.userId, this.type = BiometricType.fingerprint});

  @override
  final String userId;
  @override
  @JsonKey()
  final BiometricType type;

  @override
  String toString() {
    return 'LoginCredentials.biometric(userId: $userId, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BiometricCredentialsImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BiometricCredentialsImplCopyWith<_$BiometricCredentialsImpl>
      get copyWith =>
          __$$BiometricCredentialsImplCopyWithImpl<_$BiometricCredentialsImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password, bool rememberMe)
        emailPassword,
    required TResult Function(String? idToken, String? accessToken) google,
    required TResult Function(
            String? idToken, String? authorizationCode, String? nonce)
        apple,
    required TResult Function(String userId, BiometricType type) biometric,
  }) {
    return biometric(userId, type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password, bool rememberMe)?
        emailPassword,
    TResult? Function(String? idToken, String? accessToken)? google,
    TResult? Function(
            String? idToken, String? authorizationCode, String? nonce)?
        apple,
    TResult? Function(String userId, BiometricType type)? biometric,
  }) {
    return biometric?.call(userId, type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password, bool rememberMe)?
        emailPassword,
    TResult Function(String? idToken, String? accessToken)? google,
    TResult Function(String? idToken, String? authorizationCode, String? nonce)?
        apple,
    TResult Function(String userId, BiometricType type)? biometric,
    required TResult orElse(),
  }) {
    if (biometric != null) {
      return biometric(userId, type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailPasswordCredentials value) emailPassword,
    required TResult Function(GoogleCredentials value) google,
    required TResult Function(AppleCredentials value) apple,
    required TResult Function(BiometricCredentials value) biometric,
  }) {
    return biometric(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailPasswordCredentials value)? emailPassword,
    TResult? Function(GoogleCredentials value)? google,
    TResult? Function(AppleCredentials value)? apple,
    TResult? Function(BiometricCredentials value)? biometric,
  }) {
    return biometric?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailPasswordCredentials value)? emailPassword,
    TResult Function(GoogleCredentials value)? google,
    TResult Function(AppleCredentials value)? apple,
    TResult Function(BiometricCredentials value)? biometric,
    required TResult orElse(),
  }) {
    if (biometric != null) {
      return biometric(this);
    }
    return orElse();
  }
}

abstract class BiometricCredentials implements LoginCredentials {
  const factory BiometricCredentials(
      {required final String userId,
      final BiometricType type}) = _$BiometricCredentialsImpl;

  String get userId;
  BiometricType get type;
  @JsonKey(ignore: true)
  _$$BiometricCredentialsImplCopyWith<_$BiometricCredentialsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RegistrationData {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  UserRole get role => throw _privateConstructorUsedError;
  bool get acceptTerms => throw _privateConstructorUsedError;
  bool get acceptPrivacy => throw _privateConstructorUsedError;
  bool get acceptMarketing => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegistrationDataCopyWith<RegistrationData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegistrationDataCopyWith<$Res> {
  factory $RegistrationDataCopyWith(
          RegistrationData value, $Res Function(RegistrationData) then) =
      _$RegistrationDataCopyWithImpl<$Res, RegistrationData>;
  @useResult
  $Res call(
      {String email,
      String password,
      String? displayName,
      String? firstName,
      String? lastName,
      String? phoneNumber,
      UserRole role,
      bool acceptTerms,
      bool acceptPrivacy,
      bool acceptMarketing});
}

/// @nodoc
class _$RegistrationDataCopyWithImpl<$Res, $Val extends RegistrationData>
    implements $RegistrationDataCopyWith<$Res> {
  _$RegistrationDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? displayName = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? phoneNumber = freezed,
    Object? role = null,
    Object? acceptTerms = null,
    Object? acceptPrivacy = null,
    Object? acceptMarketing = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole,
      acceptTerms: null == acceptTerms
          ? _value.acceptTerms
          : acceptTerms // ignore: cast_nullable_to_non_nullable
              as bool,
      acceptPrivacy: null == acceptPrivacy
          ? _value.acceptPrivacy
          : acceptPrivacy // ignore: cast_nullable_to_non_nullable
              as bool,
      acceptMarketing: null == acceptMarketing
          ? _value.acceptMarketing
          : acceptMarketing // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegistrationDataImplCopyWith<$Res>
    implements $RegistrationDataCopyWith<$Res> {
  factory _$$RegistrationDataImplCopyWith(_$RegistrationDataImpl value,
          $Res Function(_$RegistrationDataImpl) then) =
      __$$RegistrationDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      String password,
      String? displayName,
      String? firstName,
      String? lastName,
      String? phoneNumber,
      UserRole role,
      bool acceptTerms,
      bool acceptPrivacy,
      bool acceptMarketing});
}

/// @nodoc
class __$$RegistrationDataImplCopyWithImpl<$Res>
    extends _$RegistrationDataCopyWithImpl<$Res, _$RegistrationDataImpl>
    implements _$$RegistrationDataImplCopyWith<$Res> {
  __$$RegistrationDataImplCopyWithImpl(_$RegistrationDataImpl _value,
      $Res Function(_$RegistrationDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? displayName = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? phoneNumber = freezed,
    Object? role = null,
    Object? acceptTerms = null,
    Object? acceptPrivacy = null,
    Object? acceptMarketing = null,
  }) {
    return _then(_$RegistrationDataImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole,
      acceptTerms: null == acceptTerms
          ? _value.acceptTerms
          : acceptTerms // ignore: cast_nullable_to_non_nullable
              as bool,
      acceptPrivacy: null == acceptPrivacy
          ? _value.acceptPrivacy
          : acceptPrivacy // ignore: cast_nullable_to_non_nullable
              as bool,
      acceptMarketing: null == acceptMarketing
          ? _value.acceptMarketing
          : acceptMarketing // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$RegistrationDataImpl implements _RegistrationData {
  const _$RegistrationDataImpl(
      {required this.email,
      required this.password,
      this.displayName,
      this.firstName,
      this.lastName,
      this.phoneNumber,
      this.role = UserRole.investor,
      this.acceptTerms = false,
      this.acceptPrivacy = false,
      this.acceptMarketing = true});

  @override
  final String email;
  @override
  final String password;
  @override
  final String? displayName;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? phoneNumber;
  @override
  @JsonKey()
  final UserRole role;
  @override
  @JsonKey()
  final bool acceptTerms;
  @override
  @JsonKey()
  final bool acceptPrivacy;
  @override
  @JsonKey()
  final bool acceptMarketing;

  @override
  String toString() {
    return 'RegistrationData(email: $email, password: $password, displayName: $displayName, firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber, role: $role, acceptTerms: $acceptTerms, acceptPrivacy: $acceptPrivacy, acceptMarketing: $acceptMarketing)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegistrationDataImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.acceptTerms, acceptTerms) ||
                other.acceptTerms == acceptTerms) &&
            (identical(other.acceptPrivacy, acceptPrivacy) ||
                other.acceptPrivacy == acceptPrivacy) &&
            (identical(other.acceptMarketing, acceptMarketing) ||
                other.acceptMarketing == acceptMarketing));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      email,
      password,
      displayName,
      firstName,
      lastName,
      phoneNumber,
      role,
      acceptTerms,
      acceptPrivacy,
      acceptMarketing);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegistrationDataImplCopyWith<_$RegistrationDataImpl> get copyWith =>
      __$$RegistrationDataImplCopyWithImpl<_$RegistrationDataImpl>(
          this, _$identity);
}

abstract class _RegistrationData implements RegistrationData {
  const factory _RegistrationData(
      {required final String email,
      required final String password,
      final String? displayName,
      final String? firstName,
      final String? lastName,
      final String? phoneNumber,
      final UserRole role,
      final bool acceptTerms,
      final bool acceptPrivacy,
      final bool acceptMarketing}) = _$RegistrationDataImpl;

  @override
  String get email;
  @override
  String get password;
  @override
  String? get displayName;
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  String? get phoneNumber;
  @override
  UserRole get role;
  @override
  bool get acceptTerms;
  @override
  bool get acceptPrivacy;
  @override
  bool get acceptMarketing;
  @override
  @JsonKey(ignore: true)
  _$$RegistrationDataImplCopyWith<_$RegistrationDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PasswordResetData {
  String get email => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PasswordResetDataCopyWith<PasswordResetData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasswordResetDataCopyWith<$Res> {
  factory $PasswordResetDataCopyWith(
          PasswordResetData value, $Res Function(PasswordResetData) then) =
      _$PasswordResetDataCopyWithImpl<$Res, PasswordResetData>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class _$PasswordResetDataCopyWithImpl<$Res, $Val extends PasswordResetData>
    implements $PasswordResetDataCopyWith<$Res> {
  _$PasswordResetDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PasswordResetDataImplCopyWith<$Res>
    implements $PasswordResetDataCopyWith<$Res> {
  factory _$$PasswordResetDataImplCopyWith(_$PasswordResetDataImpl value,
          $Res Function(_$PasswordResetDataImpl) then) =
      __$$PasswordResetDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$PasswordResetDataImplCopyWithImpl<$Res>
    extends _$PasswordResetDataCopyWithImpl<$Res, _$PasswordResetDataImpl>
    implements _$$PasswordResetDataImplCopyWith<$Res> {
  __$$PasswordResetDataImplCopyWithImpl(_$PasswordResetDataImpl _value,
      $Res Function(_$PasswordResetDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$PasswordResetDataImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PasswordResetDataImpl implements _PasswordResetData {
  const _$PasswordResetDataImpl({required this.email});

  @override
  final String email;

  @override
  String toString() {
    return 'PasswordResetData(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasswordResetDataImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PasswordResetDataImplCopyWith<_$PasswordResetDataImpl> get copyWith =>
      __$$PasswordResetDataImplCopyWithImpl<_$PasswordResetDataImpl>(
          this, _$identity);
}

abstract class _PasswordResetData implements PasswordResetData {
  const factory _PasswordResetData({required final String email}) =
      _$PasswordResetDataImpl;

  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$PasswordResetDataImplCopyWith<_$PasswordResetDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PasswordChangeData {
  String get currentPassword => throw _privateConstructorUsedError;
  String get newPassword => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PasswordChangeDataCopyWith<PasswordChangeData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasswordChangeDataCopyWith<$Res> {
  factory $PasswordChangeDataCopyWith(
          PasswordChangeData value, $Res Function(PasswordChangeData) then) =
      _$PasswordChangeDataCopyWithImpl<$Res, PasswordChangeData>;
  @useResult
  $Res call({String currentPassword, String newPassword});
}

/// @nodoc
class _$PasswordChangeDataCopyWithImpl<$Res, $Val extends PasswordChangeData>
    implements $PasswordChangeDataCopyWith<$Res> {
  _$PasswordChangeDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPassword = null,
    Object? newPassword = null,
  }) {
    return _then(_value.copyWith(
      currentPassword: null == currentPassword
          ? _value.currentPassword
          : currentPassword // ignore: cast_nullable_to_non_nullable
              as String,
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PasswordChangeDataImplCopyWith<$Res>
    implements $PasswordChangeDataCopyWith<$Res> {
  factory _$$PasswordChangeDataImplCopyWith(_$PasswordChangeDataImpl value,
          $Res Function(_$PasswordChangeDataImpl) then) =
      __$$PasswordChangeDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String currentPassword, String newPassword});
}

/// @nodoc
class __$$PasswordChangeDataImplCopyWithImpl<$Res>
    extends _$PasswordChangeDataCopyWithImpl<$Res, _$PasswordChangeDataImpl>
    implements _$$PasswordChangeDataImplCopyWith<$Res> {
  __$$PasswordChangeDataImplCopyWithImpl(_$PasswordChangeDataImpl _value,
      $Res Function(_$PasswordChangeDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPassword = null,
    Object? newPassword = null,
  }) {
    return _then(_$PasswordChangeDataImpl(
      currentPassword: null == currentPassword
          ? _value.currentPassword
          : currentPassword // ignore: cast_nullable_to_non_nullable
              as String,
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PasswordChangeDataImpl implements _PasswordChangeData {
  const _$PasswordChangeDataImpl(
      {required this.currentPassword, required this.newPassword});

  @override
  final String currentPassword;
  @override
  final String newPassword;

  @override
  String toString() {
    return 'PasswordChangeData(currentPassword: $currentPassword, newPassword: $newPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasswordChangeDataImpl &&
            (identical(other.currentPassword, currentPassword) ||
                other.currentPassword == currentPassword) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentPassword, newPassword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PasswordChangeDataImplCopyWith<_$PasswordChangeDataImpl> get copyWith =>
      __$$PasswordChangeDataImplCopyWithImpl<_$PasswordChangeDataImpl>(
          this, _$identity);
}

abstract class _PasswordChangeData implements PasswordChangeData {
  const factory _PasswordChangeData(
      {required final String currentPassword,
      required final String newPassword}) = _$PasswordChangeDataImpl;

  @override
  String get currentPassword;
  @override
  String get newPassword;
  @override
  @JsonKey(ignore: true)
  _$$PasswordChangeDataImplCopyWith<_$PasswordChangeDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$EmailVerificationData {
  String get code => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EmailVerificationDataCopyWith<EmailVerificationData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailVerificationDataCopyWith<$Res> {
  factory $EmailVerificationDataCopyWith(EmailVerificationData value,
          $Res Function(EmailVerificationData) then) =
      _$EmailVerificationDataCopyWithImpl<$Res, EmailVerificationData>;
  @useResult
  $Res call({String code});
}

/// @nodoc
class _$EmailVerificationDataCopyWithImpl<$Res,
        $Val extends EmailVerificationData>
    implements $EmailVerificationDataCopyWith<$Res> {
  _$EmailVerificationDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmailVerificationDataImplCopyWith<$Res>
    implements $EmailVerificationDataCopyWith<$Res> {
  factory _$$EmailVerificationDataImplCopyWith(
          _$EmailVerificationDataImpl value,
          $Res Function(_$EmailVerificationDataImpl) then) =
      __$$EmailVerificationDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code});
}

/// @nodoc
class __$$EmailVerificationDataImplCopyWithImpl<$Res>
    extends _$EmailVerificationDataCopyWithImpl<$Res,
        _$EmailVerificationDataImpl>
    implements _$$EmailVerificationDataImplCopyWith<$Res> {
  __$$EmailVerificationDataImplCopyWithImpl(_$EmailVerificationDataImpl _value,
      $Res Function(_$EmailVerificationDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
  }) {
    return _then(_$EmailVerificationDataImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EmailVerificationDataImpl implements _EmailVerificationData {
  const _$EmailVerificationDataImpl({required this.code});

  @override
  final String code;

  @override
  String toString() {
    return 'EmailVerificationData(code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailVerificationDataImpl &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailVerificationDataImplCopyWith<_$EmailVerificationDataImpl>
      get copyWith => __$$EmailVerificationDataImplCopyWithImpl<
          _$EmailVerificationDataImpl>(this, _$identity);
}

abstract class _EmailVerificationData implements EmailVerificationData {
  const factory _EmailVerificationData({required final String code}) =
      _$EmailVerificationDataImpl;

  @override
  String get code;
  @override
  @JsonKey(ignore: true)
  _$$EmailVerificationDataImplCopyWith<_$EmailVerificationDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AuthSession {
  String get sessionId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get expiresAt => throw _privateConstructorUsedError;
  String? get deviceId => throw _privateConstructorUsedError;
  String? get deviceName => throw _privateConstructorUsedError;
  String? get ipAddress => throw _privateConstructorUsedError;
  String? get userAgent => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthSessionCopyWith<AuthSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthSessionCopyWith<$Res> {
  factory $AuthSessionCopyWith(
          AuthSession value, $Res Function(AuthSession) then) =
      _$AuthSessionCopyWithImpl<$Res, AuthSession>;
  @useResult
  $Res call(
      {String sessionId,
      String userId,
      DateTime createdAt,
      DateTime expiresAt,
      String? deviceId,
      String? deviceName,
      String? ipAddress,
      String? userAgent,
      bool isActive});
}

/// @nodoc
class _$AuthSessionCopyWithImpl<$Res, $Val extends AuthSession>
    implements $AuthSessionCopyWith<$Res> {
  _$AuthSessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? userId = null,
    Object? createdAt = null,
    Object? expiresAt = null,
    Object? deviceId = freezed,
    Object? deviceName = freezed,
    Object? ipAddress = freezed,
    Object? userAgent = freezed,
    Object? isActive = null,
  }) {
    return _then(_value.copyWith(
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceName: freezed == deviceName
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String?,
      ipAddress: freezed == ipAddress
          ? _value.ipAddress
          : ipAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      userAgent: freezed == userAgent
          ? _value.userAgent
          : userAgent // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthSessionImplCopyWith<$Res>
    implements $AuthSessionCopyWith<$Res> {
  factory _$$AuthSessionImplCopyWith(
          _$AuthSessionImpl value, $Res Function(_$AuthSessionImpl) then) =
      __$$AuthSessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String sessionId,
      String userId,
      DateTime createdAt,
      DateTime expiresAt,
      String? deviceId,
      String? deviceName,
      String? ipAddress,
      String? userAgent,
      bool isActive});
}

/// @nodoc
class __$$AuthSessionImplCopyWithImpl<$Res>
    extends _$AuthSessionCopyWithImpl<$Res, _$AuthSessionImpl>
    implements _$$AuthSessionImplCopyWith<$Res> {
  __$$AuthSessionImplCopyWithImpl(
      _$AuthSessionImpl _value, $Res Function(_$AuthSessionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? userId = null,
    Object? createdAt = null,
    Object? expiresAt = null,
    Object? deviceId = freezed,
    Object? deviceName = freezed,
    Object? ipAddress = freezed,
    Object? userAgent = freezed,
    Object? isActive = null,
  }) {
    return _then(_$AuthSessionImpl(
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceName: freezed == deviceName
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String?,
      ipAddress: freezed == ipAddress
          ? _value.ipAddress
          : ipAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      userAgent: freezed == userAgent
          ? _value.userAgent
          : userAgent // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AuthSessionImpl implements _AuthSession {
  const _$AuthSessionImpl(
      {required this.sessionId,
      required this.userId,
      required this.createdAt,
      required this.expiresAt,
      this.deviceId,
      this.deviceName,
      this.ipAddress,
      this.userAgent,
      this.isActive = false});

  @override
  final String sessionId;
  @override
  final String userId;
  @override
  final DateTime createdAt;
  @override
  final DateTime expiresAt;
  @override
  final String? deviceId;
  @override
  final String? deviceName;
  @override
  final String? ipAddress;
  @override
  final String? userAgent;
  @override
  @JsonKey()
  final bool isActive;

  @override
  String toString() {
    return 'AuthSession(sessionId: $sessionId, userId: $userId, createdAt: $createdAt, expiresAt: $expiresAt, deviceId: $deviceId, deviceName: $deviceName, ipAddress: $ipAddress, userAgent: $userAgent, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthSessionImpl &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.deviceName, deviceName) ||
                other.deviceName == deviceName) &&
            (identical(other.ipAddress, ipAddress) ||
                other.ipAddress == ipAddress) &&
            (identical(other.userAgent, userAgent) ||
                other.userAgent == userAgent) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sessionId, userId, createdAt,
      expiresAt, deviceId, deviceName, ipAddress, userAgent, isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthSessionImplCopyWith<_$AuthSessionImpl> get copyWith =>
      __$$AuthSessionImplCopyWithImpl<_$AuthSessionImpl>(this, _$identity);
}

abstract class _AuthSession implements AuthSession {
  const factory _AuthSession(
      {required final String sessionId,
      required final String userId,
      required final DateTime createdAt,
      required final DateTime expiresAt,
      final String? deviceId,
      final String? deviceName,
      final String? ipAddress,
      final String? userAgent,
      final bool isActive}) = _$AuthSessionImpl;

  @override
  String get sessionId;
  @override
  String get userId;
  @override
  DateTime get createdAt;
  @override
  DateTime get expiresAt;
  @override
  String? get deviceId;
  @override
  String? get deviceName;
  @override
  String? get ipAddress;
  @override
  String? get userAgent;
  @override
  bool get isActive;
  @override
  @JsonKey(ignore: true)
  _$$AuthSessionImplCopyWith<_$AuthSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
