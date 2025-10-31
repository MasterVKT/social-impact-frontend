// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contribution.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Contribution _$ContributionFromJson(Map<String, dynamic> json) {
  return _Contribution.fromJson(json);
}

/// @nodoc
mixin _$Contribution {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get projectId => throw _privateConstructorUsedError;
  int get amountCents => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  ContributionStatus get status => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String? get paymentMethod =>
      throw _privateConstructorUsedError; // 'card'|'apple_pay'|'google_pay'
  bool get anonymous => throw _privateConstructorUsedError;
  ContributionFees? get fees => throw _privateConstructorUsedError;
  String? get receiptUrl => throw _privateConstructorUsedError;
  String? get paymentIntentId => throw _privateConstructorUsedError;
  String? get stripeClientSecret => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContributionCopyWith<Contribution> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContributionCopyWith<$Res> {
  factory $ContributionCopyWith(
          Contribution value, $Res Function(Contribution) then) =
      _$ContributionCopyWithImpl<$Res, Contribution>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String projectId,
      int amountCents,
      String currency,
      ContributionStatus status,
      DateTime createdAt,
      String? paymentMethod,
      bool anonymous,
      ContributionFees? fees,
      String? receiptUrl,
      String? paymentIntentId,
      String? stripeClientSecret});

  $ContributionFeesCopyWith<$Res>? get fees;
}

/// @nodoc
class _$ContributionCopyWithImpl<$Res, $Val extends Contribution>
    implements $ContributionCopyWith<$Res> {
  _$ContributionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? projectId = null,
    Object? amountCents = null,
    Object? currency = null,
    Object? status = null,
    Object? createdAt = null,
    Object? paymentMethod = freezed,
    Object? anonymous = null,
    Object? fees = freezed,
    Object? receiptUrl = freezed,
    Object? paymentIntentId = freezed,
    Object? stripeClientSecret = freezed,
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
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      amountCents: null == amountCents
          ? _value.amountCents
          : amountCents // ignore: cast_nullable_to_non_nullable
              as int,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ContributionStatus,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      anonymous: null == anonymous
          ? _value.anonymous
          : anonymous // ignore: cast_nullable_to_non_nullable
              as bool,
      fees: freezed == fees
          ? _value.fees
          : fees // ignore: cast_nullable_to_non_nullable
              as ContributionFees?,
      receiptUrl: freezed == receiptUrl
          ? _value.receiptUrl
          : receiptUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentIntentId: freezed == paymentIntentId
          ? _value.paymentIntentId
          : paymentIntentId // ignore: cast_nullable_to_non_nullable
              as String?,
      stripeClientSecret: freezed == stripeClientSecret
          ? _value.stripeClientSecret
          : stripeClientSecret // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ContributionFeesCopyWith<$Res>? get fees {
    if (_value.fees == null) {
      return null;
    }

    return $ContributionFeesCopyWith<$Res>(_value.fees!, (value) {
      return _then(_value.copyWith(fees: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ContributionImplCopyWith<$Res>
    implements $ContributionCopyWith<$Res> {
  factory _$$ContributionImplCopyWith(
          _$ContributionImpl value, $Res Function(_$ContributionImpl) then) =
      __$$ContributionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String projectId,
      int amountCents,
      String currency,
      ContributionStatus status,
      DateTime createdAt,
      String? paymentMethod,
      bool anonymous,
      ContributionFees? fees,
      String? receiptUrl,
      String? paymentIntentId,
      String? stripeClientSecret});

  @override
  $ContributionFeesCopyWith<$Res>? get fees;
}

/// @nodoc
class __$$ContributionImplCopyWithImpl<$Res>
    extends _$ContributionCopyWithImpl<$Res, _$ContributionImpl>
    implements _$$ContributionImplCopyWith<$Res> {
  __$$ContributionImplCopyWithImpl(
      _$ContributionImpl _value, $Res Function(_$ContributionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? projectId = null,
    Object? amountCents = null,
    Object? currency = null,
    Object? status = null,
    Object? createdAt = null,
    Object? paymentMethod = freezed,
    Object? anonymous = null,
    Object? fees = freezed,
    Object? receiptUrl = freezed,
    Object? paymentIntentId = freezed,
    Object? stripeClientSecret = freezed,
  }) {
    return _then(_$ContributionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      amountCents: null == amountCents
          ? _value.amountCents
          : amountCents // ignore: cast_nullable_to_non_nullable
              as int,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ContributionStatus,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      anonymous: null == anonymous
          ? _value.anonymous
          : anonymous // ignore: cast_nullable_to_non_nullable
              as bool,
      fees: freezed == fees
          ? _value.fees
          : fees // ignore: cast_nullable_to_non_nullable
              as ContributionFees?,
      receiptUrl: freezed == receiptUrl
          ? _value.receiptUrl
          : receiptUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentIntentId: freezed == paymentIntentId
          ? _value.paymentIntentId
          : paymentIntentId // ignore: cast_nullable_to_non_nullable
              as String?,
      stripeClientSecret: freezed == stripeClientSecret
          ? _value.stripeClientSecret
          : stripeClientSecret // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContributionImpl implements _Contribution {
  const _$ContributionImpl(
      {required this.id,
      required this.userId,
      required this.projectId,
      required this.amountCents,
      this.currency = 'EUR',
      this.status = ContributionStatus.pending,
      required this.createdAt,
      this.paymentMethod,
      this.anonymous = false,
      this.fees,
      this.receiptUrl,
      this.paymentIntentId,
      this.stripeClientSecret});

  factory _$ContributionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContributionImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String projectId;
  @override
  final int amountCents;
  @override
  @JsonKey()
  final String currency;
  @override
  @JsonKey()
  final ContributionStatus status;
  @override
  final DateTime createdAt;
  @override
  final String? paymentMethod;
// 'card'|'apple_pay'|'google_pay'
  @override
  @JsonKey()
  final bool anonymous;
  @override
  final ContributionFees? fees;
  @override
  final String? receiptUrl;
  @override
  final String? paymentIntentId;
  @override
  final String? stripeClientSecret;

  @override
  String toString() {
    return 'Contribution(id: $id, userId: $userId, projectId: $projectId, amountCents: $amountCents, currency: $currency, status: $status, createdAt: $createdAt, paymentMethod: $paymentMethod, anonymous: $anonymous, fees: $fees, receiptUrl: $receiptUrl, paymentIntentId: $paymentIntentId, stripeClientSecret: $stripeClientSecret)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContributionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.amountCents, amountCents) ||
                other.amountCents == amountCents) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.anonymous, anonymous) ||
                other.anonymous == anonymous) &&
            (identical(other.fees, fees) || other.fees == fees) &&
            (identical(other.receiptUrl, receiptUrl) ||
                other.receiptUrl == receiptUrl) &&
            (identical(other.paymentIntentId, paymentIntentId) ||
                other.paymentIntentId == paymentIntentId) &&
            (identical(other.stripeClientSecret, stripeClientSecret) ||
                other.stripeClientSecret == stripeClientSecret));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      projectId,
      amountCents,
      currency,
      status,
      createdAt,
      paymentMethod,
      anonymous,
      fees,
      receiptUrl,
      paymentIntentId,
      stripeClientSecret);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContributionImplCopyWith<_$ContributionImpl> get copyWith =>
      __$$ContributionImplCopyWithImpl<_$ContributionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContributionImplToJson(
      this,
    );
  }
}

abstract class _Contribution implements Contribution {
  const factory _Contribution(
      {required final String id,
      required final String userId,
      required final String projectId,
      required final int amountCents,
      final String currency,
      final ContributionStatus status,
      required final DateTime createdAt,
      final String? paymentMethod,
      final bool anonymous,
      final ContributionFees? fees,
      final String? receiptUrl,
      final String? paymentIntentId,
      final String? stripeClientSecret}) = _$ContributionImpl;

  factory _Contribution.fromJson(Map<String, dynamic> json) =
      _$ContributionImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get projectId;
  @override
  int get amountCents;
  @override
  String get currency;
  @override
  ContributionStatus get status;
  @override
  DateTime get createdAt;
  @override
  String? get paymentMethod;
  @override // 'card'|'apple_pay'|'google_pay'
  bool get anonymous;
  @override
  ContributionFees? get fees;
  @override
  String? get receiptUrl;
  @override
  String? get paymentIntentId;
  @override
  String? get stripeClientSecret;
  @override
  @JsonKey(ignore: true)
  _$$ContributionImplCopyWith<_$ContributionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ContributionFees _$ContributionFeesFromJson(Map<String, dynamic> json) {
  return _ContributionFees.fromJson(json);
}

/// @nodoc
mixin _$ContributionFees {
  int get platformCents => throw _privateConstructorUsedError;
  int get auditCents => throw _privateConstructorUsedError;
  int get stripeCents => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContributionFeesCopyWith<ContributionFees> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContributionFeesCopyWith<$Res> {
  factory $ContributionFeesCopyWith(
          ContributionFees value, $Res Function(ContributionFees) then) =
      _$ContributionFeesCopyWithImpl<$Res, ContributionFees>;
  @useResult
  $Res call({int platformCents, int auditCents, int stripeCents});
}

/// @nodoc
class _$ContributionFeesCopyWithImpl<$Res, $Val extends ContributionFees>
    implements $ContributionFeesCopyWith<$Res> {
  _$ContributionFeesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? platformCents = null,
    Object? auditCents = null,
    Object? stripeCents = null,
  }) {
    return _then(_value.copyWith(
      platformCents: null == platformCents
          ? _value.platformCents
          : platformCents // ignore: cast_nullable_to_non_nullable
              as int,
      auditCents: null == auditCents
          ? _value.auditCents
          : auditCents // ignore: cast_nullable_to_non_nullable
              as int,
      stripeCents: null == stripeCents
          ? _value.stripeCents
          : stripeCents // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContributionFeesImplCopyWith<$Res>
    implements $ContributionFeesCopyWith<$Res> {
  factory _$$ContributionFeesImplCopyWith(_$ContributionFeesImpl value,
          $Res Function(_$ContributionFeesImpl) then) =
      __$$ContributionFeesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int platformCents, int auditCents, int stripeCents});
}

/// @nodoc
class __$$ContributionFeesImplCopyWithImpl<$Res>
    extends _$ContributionFeesCopyWithImpl<$Res, _$ContributionFeesImpl>
    implements _$$ContributionFeesImplCopyWith<$Res> {
  __$$ContributionFeesImplCopyWithImpl(_$ContributionFeesImpl _value,
      $Res Function(_$ContributionFeesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? platformCents = null,
    Object? auditCents = null,
    Object? stripeCents = null,
  }) {
    return _then(_$ContributionFeesImpl(
      platformCents: null == platformCents
          ? _value.platformCents
          : platformCents // ignore: cast_nullable_to_non_nullable
              as int,
      auditCents: null == auditCents
          ? _value.auditCents
          : auditCents // ignore: cast_nullable_to_non_nullable
              as int,
      stripeCents: null == stripeCents
          ? _value.stripeCents
          : stripeCents // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContributionFeesImpl implements _ContributionFees {
  const _$ContributionFeesImpl(
      {this.platformCents = 0, this.auditCents = 0, this.stripeCents = 0});

  factory _$ContributionFeesImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContributionFeesImplFromJson(json);

  @override
  @JsonKey()
  final int platformCents;
  @override
  @JsonKey()
  final int auditCents;
  @override
  @JsonKey()
  final int stripeCents;

  @override
  String toString() {
    return 'ContributionFees(platformCents: $platformCents, auditCents: $auditCents, stripeCents: $stripeCents)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContributionFeesImpl &&
            (identical(other.platformCents, platformCents) ||
                other.platformCents == platformCents) &&
            (identical(other.auditCents, auditCents) ||
                other.auditCents == auditCents) &&
            (identical(other.stripeCents, stripeCents) ||
                other.stripeCents == stripeCents));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, platformCents, auditCents, stripeCents);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContributionFeesImplCopyWith<_$ContributionFeesImpl> get copyWith =>
      __$$ContributionFeesImplCopyWithImpl<_$ContributionFeesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContributionFeesImplToJson(
      this,
    );
  }
}

abstract class _ContributionFees implements ContributionFees {
  const factory _ContributionFees(
      {final int platformCents,
      final int auditCents,
      final int stripeCents}) = _$ContributionFeesImpl;

  factory _ContributionFees.fromJson(Map<String, dynamic> json) =
      _$ContributionFeesImpl.fromJson;

  @override
  int get platformCents;
  @override
  int get auditCents;
  @override
  int get stripeCents;
  @override
  @JsonKey(ignore: true)
  _$$ContributionFeesImplCopyWith<_$ContributionFeesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
