// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Transaction _$TransactionFromJson(Map<String, dynamic> json) {
  return _Transaction.fromJson(json);
}

/// @nodoc
mixin _$Transaction {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  TransactionType get type => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  TransactionStatus get status => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String? get referenceId => throw _privateConstructorUsedError;
  String? get projectId => throw _privateConstructorUsedError;
  String? get organizationId => throw _privateConstructorUsedError;
  PaymentMethod? get paymentMethod => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;
  DateTime? get processedAt => throw _privateConstructorUsedError;
  String? get failureReason => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionCopyWith<Transaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionCopyWith<$Res> {
  factory $TransactionCopyWith(
          Transaction value, $Res Function(Transaction) then) =
      _$TransactionCopyWithImpl<$Res, Transaction>;
  @useResult
  $Res call(
      {String id,
      String userId,
      TransactionType type,
      double amount,
      String currency,
      DateTime timestamp,
      TransactionStatus status,
      String description,
      String? referenceId,
      String? projectId,
      String? organizationId,
      PaymentMethod? paymentMethod,
      Map<String, dynamic>? metadata,
      DateTime? processedAt,
      String? failureReason});

  $PaymentMethodCopyWith<$Res>? get paymentMethod;
}

/// @nodoc
class _$TransactionCopyWithImpl<$Res, $Val extends Transaction>
    implements $TransactionCopyWith<$Res> {
  _$TransactionCopyWithImpl(this._value, this._then);

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
    Object? amount = null,
    Object? currency = null,
    Object? timestamp = null,
    Object? status = null,
    Object? description = null,
    Object? referenceId = freezed,
    Object? projectId = freezed,
    Object? organizationId = freezed,
    Object? paymentMethod = freezed,
    Object? metadata = freezed,
    Object? processedAt = freezed,
    Object? failureReason = freezed,
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
              as TransactionType,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TransactionStatus,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      referenceId: freezed == referenceId
          ? _value.referenceId
          : referenceId // ignore: cast_nullable_to_non_nullable
              as String?,
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String?,
      organizationId: freezed == organizationId
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethod?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      processedAt: freezed == processedAt
          ? _value.processedAt
          : processedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      failureReason: freezed == failureReason
          ? _value.failureReason
          : failureReason // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaymentMethodCopyWith<$Res>? get paymentMethod {
    if (_value.paymentMethod == null) {
      return null;
    }

    return $PaymentMethodCopyWith<$Res>(_value.paymentMethod!, (value) {
      return _then(_value.copyWith(paymentMethod: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TransactionImplCopyWith<$Res>
    implements $TransactionCopyWith<$Res> {
  factory _$$TransactionImplCopyWith(
          _$TransactionImpl value, $Res Function(_$TransactionImpl) then) =
      __$$TransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      TransactionType type,
      double amount,
      String currency,
      DateTime timestamp,
      TransactionStatus status,
      String description,
      String? referenceId,
      String? projectId,
      String? organizationId,
      PaymentMethod? paymentMethod,
      Map<String, dynamic>? metadata,
      DateTime? processedAt,
      String? failureReason});

  @override
  $PaymentMethodCopyWith<$Res>? get paymentMethod;
}

/// @nodoc
class __$$TransactionImplCopyWithImpl<$Res>
    extends _$TransactionCopyWithImpl<$Res, _$TransactionImpl>
    implements _$$TransactionImplCopyWith<$Res> {
  __$$TransactionImplCopyWithImpl(
      _$TransactionImpl _value, $Res Function(_$TransactionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? type = null,
    Object? amount = null,
    Object? currency = null,
    Object? timestamp = null,
    Object? status = null,
    Object? description = null,
    Object? referenceId = freezed,
    Object? projectId = freezed,
    Object? organizationId = freezed,
    Object? paymentMethod = freezed,
    Object? metadata = freezed,
    Object? processedAt = freezed,
    Object? failureReason = freezed,
  }) {
    return _then(_$TransactionImpl(
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
              as TransactionType,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TransactionStatus,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      referenceId: freezed == referenceId
          ? _value.referenceId
          : referenceId // ignore: cast_nullable_to_non_nullable
              as String?,
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String?,
      organizationId: freezed == organizationId
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethod?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      processedAt: freezed == processedAt
          ? _value.processedAt
          : processedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      failureReason: freezed == failureReason
          ? _value.failureReason
          : failureReason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionImpl implements _Transaction {
  const _$TransactionImpl(
      {required this.id,
      required this.userId,
      required this.type,
      required this.amount,
      required this.currency,
      required this.timestamp,
      required this.status,
      required this.description,
      this.referenceId,
      this.projectId,
      this.organizationId,
      this.paymentMethod,
      final Map<String, dynamic>? metadata,
      this.processedAt,
      this.failureReason})
      : _metadata = metadata;

  factory _$TransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final TransactionType type;
  @override
  final double amount;
  @override
  final String currency;
  @override
  final DateTime timestamp;
  @override
  final TransactionStatus status;
  @override
  final String description;
  @override
  final String? referenceId;
  @override
  final String? projectId;
  @override
  final String? organizationId;
  @override
  final PaymentMethod? paymentMethod;
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
  final DateTime? processedAt;
  @override
  final String? failureReason;

  @override
  String toString() {
    return 'Transaction(id: $id, userId: $userId, type: $type, amount: $amount, currency: $currency, timestamp: $timestamp, status: $status, description: $description, referenceId: $referenceId, projectId: $projectId, organizationId: $organizationId, paymentMethod: $paymentMethod, metadata: $metadata, processedAt: $processedAt, failureReason: $failureReason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.referenceId, referenceId) ||
                other.referenceId == referenceId) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.processedAt, processedAt) ||
                other.processedAt == processedAt) &&
            (identical(other.failureReason, failureReason) ||
                other.failureReason == failureReason));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      type,
      amount,
      currency,
      timestamp,
      status,
      description,
      referenceId,
      projectId,
      organizationId,
      paymentMethod,
      const DeepCollectionEquality().hash(_metadata),
      processedAt,
      failureReason);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionImplCopyWith<_$TransactionImpl> get copyWith =>
      __$$TransactionImplCopyWithImpl<_$TransactionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionImplToJson(
      this,
    );
  }
}

abstract class _Transaction implements Transaction {
  const factory _Transaction(
      {required final String id,
      required final String userId,
      required final TransactionType type,
      required final double amount,
      required final String currency,
      required final DateTime timestamp,
      required final TransactionStatus status,
      required final String description,
      final String? referenceId,
      final String? projectId,
      final String? organizationId,
      final PaymentMethod? paymentMethod,
      final Map<String, dynamic>? metadata,
      final DateTime? processedAt,
      final String? failureReason}) = _$TransactionImpl;

  factory _Transaction.fromJson(Map<String, dynamic> json) =
      _$TransactionImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  TransactionType get type;
  @override
  double get amount;
  @override
  String get currency;
  @override
  DateTime get timestamp;
  @override
  TransactionStatus get status;
  @override
  String get description;
  @override
  String? get referenceId;
  @override
  String? get projectId;
  @override
  String? get organizationId;
  @override
  PaymentMethod? get paymentMethod;
  @override
  Map<String, dynamic>? get metadata;
  @override
  DateTime? get processedAt;
  @override
  String? get failureReason;
  @override
  @JsonKey(ignore: true)
  _$$TransactionImplCopyWith<_$TransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaymentMethod _$PaymentMethodFromJson(Map<String, dynamic> json) {
  return _PaymentMethod.fromJson(json);
}

/// @nodoc
mixin _$PaymentMethod {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  PaymentMethodType get type => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  bool get isDefault => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  Map<String, dynamic>? get details => throw _privateConstructorUsedError;
  DateTime? get expiryDate => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get lastUsed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentMethodCopyWith<PaymentMethod> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentMethodCopyWith<$Res> {
  factory $PaymentMethodCopyWith(
          PaymentMethod value, $Res Function(PaymentMethod) then) =
      _$PaymentMethodCopyWithImpl<$Res, PaymentMethod>;
  @useResult
  $Res call(
      {String id,
      String userId,
      PaymentMethodType type,
      String displayName,
      bool isDefault,
      bool isActive,
      Map<String, dynamic>? details,
      DateTime? expiryDate,
      DateTime? createdAt,
      DateTime? lastUsed});
}

/// @nodoc
class _$PaymentMethodCopyWithImpl<$Res, $Val extends PaymentMethod>
    implements $PaymentMethodCopyWith<$Res> {
  _$PaymentMethodCopyWithImpl(this._value, this._then);

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
    Object? displayName = null,
    Object? isDefault = null,
    Object? isActive = null,
    Object? details = freezed,
    Object? expiryDate = freezed,
    Object? createdAt = freezed,
    Object? lastUsed = freezed,
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
              as PaymentMethodType,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      expiryDate: freezed == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastUsed: freezed == lastUsed
          ? _value.lastUsed
          : lastUsed // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentMethodImplCopyWith<$Res>
    implements $PaymentMethodCopyWith<$Res> {
  factory _$$PaymentMethodImplCopyWith(
          _$PaymentMethodImpl value, $Res Function(_$PaymentMethodImpl) then) =
      __$$PaymentMethodImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      PaymentMethodType type,
      String displayName,
      bool isDefault,
      bool isActive,
      Map<String, dynamic>? details,
      DateTime? expiryDate,
      DateTime? createdAt,
      DateTime? lastUsed});
}

/// @nodoc
class __$$PaymentMethodImplCopyWithImpl<$Res>
    extends _$PaymentMethodCopyWithImpl<$Res, _$PaymentMethodImpl>
    implements _$$PaymentMethodImplCopyWith<$Res> {
  __$$PaymentMethodImplCopyWithImpl(
      _$PaymentMethodImpl _value, $Res Function(_$PaymentMethodImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? type = null,
    Object? displayName = null,
    Object? isDefault = null,
    Object? isActive = null,
    Object? details = freezed,
    Object? expiryDate = freezed,
    Object? createdAt = freezed,
    Object? lastUsed = freezed,
  }) {
    return _then(_$PaymentMethodImpl(
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
              as PaymentMethodType,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      details: freezed == details
          ? _value._details
          : details // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      expiryDate: freezed == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastUsed: freezed == lastUsed
          ? _value.lastUsed
          : lastUsed // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentMethodImpl implements _PaymentMethod {
  const _$PaymentMethodImpl(
      {required this.id,
      required this.userId,
      required this.type,
      required this.displayName,
      required this.isDefault,
      required this.isActive,
      final Map<String, dynamic>? details,
      this.expiryDate,
      this.createdAt,
      this.lastUsed})
      : _details = details;

  factory _$PaymentMethodImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentMethodImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final PaymentMethodType type;
  @override
  final String displayName;
  @override
  final bool isDefault;
  @override
  final bool isActive;
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
  final DateTime? expiryDate;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? lastUsed;

  @override
  String toString() {
    return 'PaymentMethod(id: $id, userId: $userId, type: $type, displayName: $displayName, isDefault: $isDefault, isActive: $isActive, details: $details, expiryDate: $expiryDate, createdAt: $createdAt, lastUsed: $lastUsed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentMethodImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            const DeepCollectionEquality().equals(other._details, _details) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.lastUsed, lastUsed) ||
                other.lastUsed == lastUsed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      type,
      displayName,
      isDefault,
      isActive,
      const DeepCollectionEquality().hash(_details),
      expiryDate,
      createdAt,
      lastUsed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentMethodImplCopyWith<_$PaymentMethodImpl> get copyWith =>
      __$$PaymentMethodImplCopyWithImpl<_$PaymentMethodImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentMethodImplToJson(
      this,
    );
  }
}

abstract class _PaymentMethod implements PaymentMethod {
  const factory _PaymentMethod(
      {required final String id,
      required final String userId,
      required final PaymentMethodType type,
      required final String displayName,
      required final bool isDefault,
      required final bool isActive,
      final Map<String, dynamic>? details,
      final DateTime? expiryDate,
      final DateTime? createdAt,
      final DateTime? lastUsed}) = _$PaymentMethodImpl;

  factory _PaymentMethod.fromJson(Map<String, dynamic> json) =
      _$PaymentMethodImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  PaymentMethodType get type;
  @override
  String get displayName;
  @override
  bool get isDefault;
  @override
  bool get isActive;
  @override
  Map<String, dynamic>? get details;
  @override
  DateTime? get expiryDate;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get lastUsed;
  @override
  @JsonKey(ignore: true)
  _$$PaymentMethodImplCopyWith<_$PaymentMethodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InvestmentTransactionDetails _$InvestmentTransactionDetailsFromJson(
    Map<String, dynamic> json) {
  return _InvestmentTransactionDetails.fromJson(json);
}

/// @nodoc
mixin _$InvestmentTransactionDetails {
  String get investmentId => throw _privateConstructorUsedError;
  String get projectId => throw _privateConstructorUsedError;
  String get organizationId => throw _privateConstructorUsedError;
  double get shares => throw _privateConstructorUsedError;
  double get pricePerShare => throw _privateConstructorUsedError;
  InvestmentType get investmentType => throw _privateConstructorUsedError;
  Map<String, dynamic>? get contractTerms => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InvestmentTransactionDetailsCopyWith<InvestmentTransactionDetails>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvestmentTransactionDetailsCopyWith<$Res> {
  factory $InvestmentTransactionDetailsCopyWith(
          InvestmentTransactionDetails value,
          $Res Function(InvestmentTransactionDetails) then) =
      _$InvestmentTransactionDetailsCopyWithImpl<$Res,
          InvestmentTransactionDetails>;
  @useResult
  $Res call(
      {String investmentId,
      String projectId,
      String organizationId,
      double shares,
      double pricePerShare,
      InvestmentType investmentType,
      Map<String, dynamic>? contractTerms});
}

/// @nodoc
class _$InvestmentTransactionDetailsCopyWithImpl<$Res,
        $Val extends InvestmentTransactionDetails>
    implements $InvestmentTransactionDetailsCopyWith<$Res> {
  _$InvestmentTransactionDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? investmentId = null,
    Object? projectId = null,
    Object? organizationId = null,
    Object? shares = null,
    Object? pricePerShare = null,
    Object? investmentType = null,
    Object? contractTerms = freezed,
  }) {
    return _then(_value.copyWith(
      investmentId: null == investmentId
          ? _value.investmentId
          : investmentId // ignore: cast_nullable_to_non_nullable
              as String,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      organizationId: null == organizationId
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as String,
      shares: null == shares
          ? _value.shares
          : shares // ignore: cast_nullable_to_non_nullable
              as double,
      pricePerShare: null == pricePerShare
          ? _value.pricePerShare
          : pricePerShare // ignore: cast_nullable_to_non_nullable
              as double,
      investmentType: null == investmentType
          ? _value.investmentType
          : investmentType // ignore: cast_nullable_to_non_nullable
              as InvestmentType,
      contractTerms: freezed == contractTerms
          ? _value.contractTerms
          : contractTerms // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InvestmentTransactionDetailsImplCopyWith<$Res>
    implements $InvestmentTransactionDetailsCopyWith<$Res> {
  factory _$$InvestmentTransactionDetailsImplCopyWith(
          _$InvestmentTransactionDetailsImpl value,
          $Res Function(_$InvestmentTransactionDetailsImpl) then) =
      __$$InvestmentTransactionDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String investmentId,
      String projectId,
      String organizationId,
      double shares,
      double pricePerShare,
      InvestmentType investmentType,
      Map<String, dynamic>? contractTerms});
}

/// @nodoc
class __$$InvestmentTransactionDetailsImplCopyWithImpl<$Res>
    extends _$InvestmentTransactionDetailsCopyWithImpl<$Res,
        _$InvestmentTransactionDetailsImpl>
    implements _$$InvestmentTransactionDetailsImplCopyWith<$Res> {
  __$$InvestmentTransactionDetailsImplCopyWithImpl(
      _$InvestmentTransactionDetailsImpl _value,
      $Res Function(_$InvestmentTransactionDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? investmentId = null,
    Object? projectId = null,
    Object? organizationId = null,
    Object? shares = null,
    Object? pricePerShare = null,
    Object? investmentType = null,
    Object? contractTerms = freezed,
  }) {
    return _then(_$InvestmentTransactionDetailsImpl(
      investmentId: null == investmentId
          ? _value.investmentId
          : investmentId // ignore: cast_nullable_to_non_nullable
              as String,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      organizationId: null == organizationId
          ? _value.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as String,
      shares: null == shares
          ? _value.shares
          : shares // ignore: cast_nullable_to_non_nullable
              as double,
      pricePerShare: null == pricePerShare
          ? _value.pricePerShare
          : pricePerShare // ignore: cast_nullable_to_non_nullable
              as double,
      investmentType: null == investmentType
          ? _value.investmentType
          : investmentType // ignore: cast_nullable_to_non_nullable
              as InvestmentType,
      contractTerms: freezed == contractTerms
          ? _value._contractTerms
          : contractTerms // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InvestmentTransactionDetailsImpl
    implements _InvestmentTransactionDetails {
  const _$InvestmentTransactionDetailsImpl(
      {required this.investmentId,
      required this.projectId,
      required this.organizationId,
      required this.shares,
      required this.pricePerShare,
      required this.investmentType,
      final Map<String, dynamic>? contractTerms})
      : _contractTerms = contractTerms;

  factory _$InvestmentTransactionDetailsImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$InvestmentTransactionDetailsImplFromJson(json);

  @override
  final String investmentId;
  @override
  final String projectId;
  @override
  final String organizationId;
  @override
  final double shares;
  @override
  final double pricePerShare;
  @override
  final InvestmentType investmentType;
  final Map<String, dynamic>? _contractTerms;
  @override
  Map<String, dynamic>? get contractTerms {
    final value = _contractTerms;
    if (value == null) return null;
    if (_contractTerms is EqualUnmodifiableMapView) return _contractTerms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'InvestmentTransactionDetails(investmentId: $investmentId, projectId: $projectId, organizationId: $organizationId, shares: $shares, pricePerShare: $pricePerShare, investmentType: $investmentType, contractTerms: $contractTerms)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvestmentTransactionDetailsImpl &&
            (identical(other.investmentId, investmentId) ||
                other.investmentId == investmentId) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.shares, shares) || other.shares == shares) &&
            (identical(other.pricePerShare, pricePerShare) ||
                other.pricePerShare == pricePerShare) &&
            (identical(other.investmentType, investmentType) ||
                other.investmentType == investmentType) &&
            const DeepCollectionEquality()
                .equals(other._contractTerms, _contractTerms));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      investmentId,
      projectId,
      organizationId,
      shares,
      pricePerShare,
      investmentType,
      const DeepCollectionEquality().hash(_contractTerms));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvestmentTransactionDetailsImplCopyWith<
          _$InvestmentTransactionDetailsImpl>
      get copyWith => __$$InvestmentTransactionDetailsImplCopyWithImpl<
          _$InvestmentTransactionDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InvestmentTransactionDetailsImplToJson(
      this,
    );
  }
}

abstract class _InvestmentTransactionDetails
    implements InvestmentTransactionDetails {
  const factory _InvestmentTransactionDetails(
          {required final String investmentId,
          required final String projectId,
          required final String organizationId,
          required final double shares,
          required final double pricePerShare,
          required final InvestmentType investmentType,
          final Map<String, dynamic>? contractTerms}) =
      _$InvestmentTransactionDetailsImpl;

  factory _InvestmentTransactionDetails.fromJson(Map<String, dynamic> json) =
      _$InvestmentTransactionDetailsImpl.fromJson;

  @override
  String get investmentId;
  @override
  String get projectId;
  @override
  String get organizationId;
  @override
  double get shares;
  @override
  double get pricePerShare;
  @override
  InvestmentType get investmentType;
  @override
  Map<String, dynamic>? get contractTerms;
  @override
  @JsonKey(ignore: true)
  _$$InvestmentTransactionDetailsImplCopyWith<
          _$InvestmentTransactionDetailsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

TransactionBatch _$TransactionBatchFromJson(Map<String, dynamic> json) {
  return _TransactionBatch.fromJson(json);
}

/// @nodoc
mixin _$TransactionBatch {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  List<String> get transactionIds => throw _privateConstructorUsedError;
  BatchStatus get status => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get processedAt => throw _privateConstructorUsedError;
  String? get failureReason => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionBatchCopyWith<TransactionBatch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionBatchCopyWith<$Res> {
  factory $TransactionBatchCopyWith(
          TransactionBatch value, $Res Function(TransactionBatch) then) =
      _$TransactionBatchCopyWithImpl<$Res, TransactionBatch>;
  @useResult
  $Res call(
      {String id,
      String userId,
      List<String> transactionIds,
      BatchStatus status,
      DateTime createdAt,
      DateTime? processedAt,
      String? failureReason,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class _$TransactionBatchCopyWithImpl<$Res, $Val extends TransactionBatch>
    implements $TransactionBatchCopyWith<$Res> {
  _$TransactionBatchCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? transactionIds = null,
    Object? status = null,
    Object? createdAt = null,
    Object? processedAt = freezed,
    Object? failureReason = freezed,
    Object? metadata = freezed,
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
      transactionIds: null == transactionIds
          ? _value.transactionIds
          : transactionIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BatchStatus,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      processedAt: freezed == processedAt
          ? _value.processedAt
          : processedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      failureReason: freezed == failureReason
          ? _value.failureReason
          : failureReason // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionBatchImplCopyWith<$Res>
    implements $TransactionBatchCopyWith<$Res> {
  factory _$$TransactionBatchImplCopyWith(_$TransactionBatchImpl value,
          $Res Function(_$TransactionBatchImpl) then) =
      __$$TransactionBatchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      List<String> transactionIds,
      BatchStatus status,
      DateTime createdAt,
      DateTime? processedAt,
      String? failureReason,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class __$$TransactionBatchImplCopyWithImpl<$Res>
    extends _$TransactionBatchCopyWithImpl<$Res, _$TransactionBatchImpl>
    implements _$$TransactionBatchImplCopyWith<$Res> {
  __$$TransactionBatchImplCopyWithImpl(_$TransactionBatchImpl _value,
      $Res Function(_$TransactionBatchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? transactionIds = null,
    Object? status = null,
    Object? createdAt = null,
    Object? processedAt = freezed,
    Object? failureReason = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_$TransactionBatchImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      transactionIds: null == transactionIds
          ? _value._transactionIds
          : transactionIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BatchStatus,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      processedAt: freezed == processedAt
          ? _value.processedAt
          : processedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      failureReason: freezed == failureReason
          ? _value.failureReason
          : failureReason // ignore: cast_nullable_to_non_nullable
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
class _$TransactionBatchImpl implements _TransactionBatch {
  const _$TransactionBatchImpl(
      {required this.id,
      required this.userId,
      required final List<String> transactionIds,
      required this.status,
      required this.createdAt,
      this.processedAt,
      this.failureReason,
      final Map<String, dynamic>? metadata})
      : _transactionIds = transactionIds,
        _metadata = metadata;

  factory _$TransactionBatchImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionBatchImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  final List<String> _transactionIds;
  @override
  List<String> get transactionIds {
    if (_transactionIds is EqualUnmodifiableListView) return _transactionIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactionIds);
  }

  @override
  final BatchStatus status;
  @override
  final DateTime createdAt;
  @override
  final DateTime? processedAt;
  @override
  final String? failureReason;
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
    return 'TransactionBatch(id: $id, userId: $userId, transactionIds: $transactionIds, status: $status, createdAt: $createdAt, processedAt: $processedAt, failureReason: $failureReason, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionBatchImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality()
                .equals(other._transactionIds, _transactionIds) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.processedAt, processedAt) ||
                other.processedAt == processedAt) &&
            (identical(other.failureReason, failureReason) ||
                other.failureReason == failureReason) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      const DeepCollectionEquality().hash(_transactionIds),
      status,
      createdAt,
      processedAt,
      failureReason,
      const DeepCollectionEquality().hash(_metadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionBatchImplCopyWith<_$TransactionBatchImpl> get copyWith =>
      __$$TransactionBatchImplCopyWithImpl<_$TransactionBatchImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionBatchImplToJson(
      this,
    );
  }
}

abstract class _TransactionBatch implements TransactionBatch {
  const factory _TransactionBatch(
      {required final String id,
      required final String userId,
      required final List<String> transactionIds,
      required final BatchStatus status,
      required final DateTime createdAt,
      final DateTime? processedAt,
      final String? failureReason,
      final Map<String, dynamic>? metadata}) = _$TransactionBatchImpl;

  factory _TransactionBatch.fromJson(Map<String, dynamic> json) =
      _$TransactionBatchImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  List<String> get transactionIds;
  @override
  BatchStatus get status;
  @override
  DateTime get createdAt;
  @override
  DateTime? get processedAt;
  @override
  String? get failureReason;
  @override
  Map<String, dynamic>? get metadata;
  @override
  @JsonKey(ignore: true)
  _$$TransactionBatchImplCopyWith<_$TransactionBatchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TransactionFee _$TransactionFeeFromJson(Map<String, dynamic> json) {
  return _TransactionFee.fromJson(json);
}

/// @nodoc
mixin _$TransactionFee {
  String get id => throw _privateConstructorUsedError;
  TransactionType get transactionType => throw _privateConstructorUsedError;
  PaymentMethodType get paymentMethodType => throw _privateConstructorUsedError;
  FeeType get feeType => throw _privateConstructorUsedError;
  double get feeAmount => throw _privateConstructorUsedError;
  double? get feePercentage => throw _privateConstructorUsedError;
  double? get minimumFee => throw _privateConstructorUsedError;
  double? get maximumFee => throw _privateConstructorUsedError;
  DateTime? get effectiveFrom => throw _privateConstructorUsedError;
  DateTime? get effectiveTo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionFeeCopyWith<TransactionFee> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionFeeCopyWith<$Res> {
  factory $TransactionFeeCopyWith(
          TransactionFee value, $Res Function(TransactionFee) then) =
      _$TransactionFeeCopyWithImpl<$Res, TransactionFee>;
  @useResult
  $Res call(
      {String id,
      TransactionType transactionType,
      PaymentMethodType paymentMethodType,
      FeeType feeType,
      double feeAmount,
      double? feePercentage,
      double? minimumFee,
      double? maximumFee,
      DateTime? effectiveFrom,
      DateTime? effectiveTo});
}

/// @nodoc
class _$TransactionFeeCopyWithImpl<$Res, $Val extends TransactionFee>
    implements $TransactionFeeCopyWith<$Res> {
  _$TransactionFeeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? transactionType = null,
    Object? paymentMethodType = null,
    Object? feeType = null,
    Object? feeAmount = null,
    Object? feePercentage = freezed,
    Object? minimumFee = freezed,
    Object? maximumFee = freezed,
    Object? effectiveFrom = freezed,
    Object? effectiveTo = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      transactionType: null == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as TransactionType,
      paymentMethodType: null == paymentMethodType
          ? _value.paymentMethodType
          : paymentMethodType // ignore: cast_nullable_to_non_nullable
              as PaymentMethodType,
      feeType: null == feeType
          ? _value.feeType
          : feeType // ignore: cast_nullable_to_non_nullable
              as FeeType,
      feeAmount: null == feeAmount
          ? _value.feeAmount
          : feeAmount // ignore: cast_nullable_to_non_nullable
              as double,
      feePercentage: freezed == feePercentage
          ? _value.feePercentage
          : feePercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      minimumFee: freezed == minimumFee
          ? _value.minimumFee
          : minimumFee // ignore: cast_nullable_to_non_nullable
              as double?,
      maximumFee: freezed == maximumFee
          ? _value.maximumFee
          : maximumFee // ignore: cast_nullable_to_non_nullable
              as double?,
      effectiveFrom: freezed == effectiveFrom
          ? _value.effectiveFrom
          : effectiveFrom // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      effectiveTo: freezed == effectiveTo
          ? _value.effectiveTo
          : effectiveTo // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionFeeImplCopyWith<$Res>
    implements $TransactionFeeCopyWith<$Res> {
  factory _$$TransactionFeeImplCopyWith(_$TransactionFeeImpl value,
          $Res Function(_$TransactionFeeImpl) then) =
      __$$TransactionFeeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      TransactionType transactionType,
      PaymentMethodType paymentMethodType,
      FeeType feeType,
      double feeAmount,
      double? feePercentage,
      double? minimumFee,
      double? maximumFee,
      DateTime? effectiveFrom,
      DateTime? effectiveTo});
}

/// @nodoc
class __$$TransactionFeeImplCopyWithImpl<$Res>
    extends _$TransactionFeeCopyWithImpl<$Res, _$TransactionFeeImpl>
    implements _$$TransactionFeeImplCopyWith<$Res> {
  __$$TransactionFeeImplCopyWithImpl(
      _$TransactionFeeImpl _value, $Res Function(_$TransactionFeeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? transactionType = null,
    Object? paymentMethodType = null,
    Object? feeType = null,
    Object? feeAmount = null,
    Object? feePercentage = freezed,
    Object? minimumFee = freezed,
    Object? maximumFee = freezed,
    Object? effectiveFrom = freezed,
    Object? effectiveTo = freezed,
  }) {
    return _then(_$TransactionFeeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      transactionType: null == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as TransactionType,
      paymentMethodType: null == paymentMethodType
          ? _value.paymentMethodType
          : paymentMethodType // ignore: cast_nullable_to_non_nullable
              as PaymentMethodType,
      feeType: null == feeType
          ? _value.feeType
          : feeType // ignore: cast_nullable_to_non_nullable
              as FeeType,
      feeAmount: null == feeAmount
          ? _value.feeAmount
          : feeAmount // ignore: cast_nullable_to_non_nullable
              as double,
      feePercentage: freezed == feePercentage
          ? _value.feePercentage
          : feePercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      minimumFee: freezed == minimumFee
          ? _value.minimumFee
          : minimumFee // ignore: cast_nullable_to_non_nullable
              as double?,
      maximumFee: freezed == maximumFee
          ? _value.maximumFee
          : maximumFee // ignore: cast_nullable_to_non_nullable
              as double?,
      effectiveFrom: freezed == effectiveFrom
          ? _value.effectiveFrom
          : effectiveFrom // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      effectiveTo: freezed == effectiveTo
          ? _value.effectiveTo
          : effectiveTo // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionFeeImpl implements _TransactionFee {
  const _$TransactionFeeImpl(
      {required this.id,
      required this.transactionType,
      required this.paymentMethodType,
      required this.feeType,
      required this.feeAmount,
      this.feePercentage,
      this.minimumFee,
      this.maximumFee,
      this.effectiveFrom,
      this.effectiveTo});

  factory _$TransactionFeeImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionFeeImplFromJson(json);

  @override
  final String id;
  @override
  final TransactionType transactionType;
  @override
  final PaymentMethodType paymentMethodType;
  @override
  final FeeType feeType;
  @override
  final double feeAmount;
  @override
  final double? feePercentage;
  @override
  final double? minimumFee;
  @override
  final double? maximumFee;
  @override
  final DateTime? effectiveFrom;
  @override
  final DateTime? effectiveTo;

  @override
  String toString() {
    return 'TransactionFee(id: $id, transactionType: $transactionType, paymentMethodType: $paymentMethodType, feeType: $feeType, feeAmount: $feeAmount, feePercentage: $feePercentage, minimumFee: $minimumFee, maximumFee: $maximumFee, effectiveFrom: $effectiveFrom, effectiveTo: $effectiveTo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionFeeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.transactionType, transactionType) ||
                other.transactionType == transactionType) &&
            (identical(other.paymentMethodType, paymentMethodType) ||
                other.paymentMethodType == paymentMethodType) &&
            (identical(other.feeType, feeType) || other.feeType == feeType) &&
            (identical(other.feeAmount, feeAmount) ||
                other.feeAmount == feeAmount) &&
            (identical(other.feePercentage, feePercentage) ||
                other.feePercentage == feePercentage) &&
            (identical(other.minimumFee, minimumFee) ||
                other.minimumFee == minimumFee) &&
            (identical(other.maximumFee, maximumFee) ||
                other.maximumFee == maximumFee) &&
            (identical(other.effectiveFrom, effectiveFrom) ||
                other.effectiveFrom == effectiveFrom) &&
            (identical(other.effectiveTo, effectiveTo) ||
                other.effectiveTo == effectiveTo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      transactionType,
      paymentMethodType,
      feeType,
      feeAmount,
      feePercentage,
      minimumFee,
      maximumFee,
      effectiveFrom,
      effectiveTo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionFeeImplCopyWith<_$TransactionFeeImpl> get copyWith =>
      __$$TransactionFeeImplCopyWithImpl<_$TransactionFeeImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionFeeImplToJson(
      this,
    );
  }
}

abstract class _TransactionFee implements TransactionFee {
  const factory _TransactionFee(
      {required final String id,
      required final TransactionType transactionType,
      required final PaymentMethodType paymentMethodType,
      required final FeeType feeType,
      required final double feeAmount,
      final double? feePercentage,
      final double? minimumFee,
      final double? maximumFee,
      final DateTime? effectiveFrom,
      final DateTime? effectiveTo}) = _$TransactionFeeImpl;

  factory _TransactionFee.fromJson(Map<String, dynamic> json) =
      _$TransactionFeeImpl.fromJson;

  @override
  String get id;
  @override
  TransactionType get transactionType;
  @override
  PaymentMethodType get paymentMethodType;
  @override
  FeeType get feeType;
  @override
  double get feeAmount;
  @override
  double? get feePercentage;
  @override
  double? get minimumFee;
  @override
  double? get maximumFee;
  @override
  DateTime? get effectiveFrom;
  @override
  DateTime? get effectiveTo;
  @override
  @JsonKey(ignore: true)
  _$$TransactionFeeImplCopyWith<_$TransactionFeeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TransactionSummary _$TransactionSummaryFromJson(Map<String, dynamic> json) {
  return _TransactionSummary.fromJson(json);
}

/// @nodoc
mixin _$TransactionSummary {
  String get userId => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  DateTime get periodStart => throw _privateConstructorUsedError;
  DateTime get periodEnd => throw _privateConstructorUsedError;
  double get totalInvestments => throw _privateConstructorUsedError;
  double get totalWithdrawals => throw _privateConstructorUsedError;
  double get totalDividends => throw _privateConstructorUsedError;
  double get totalFees => throw _privateConstructorUsedError;
  int get transactionCount => throw _privateConstructorUsedError;
  List<TransactionCategorySummary> get categorySummaries =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionSummaryCopyWith<TransactionSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionSummaryCopyWith<$Res> {
  factory $TransactionSummaryCopyWith(
          TransactionSummary value, $Res Function(TransactionSummary) then) =
      _$TransactionSummaryCopyWithImpl<$Res, TransactionSummary>;
  @useResult
  $Res call(
      {String userId,
      String currency,
      DateTime periodStart,
      DateTime periodEnd,
      double totalInvestments,
      double totalWithdrawals,
      double totalDividends,
      double totalFees,
      int transactionCount,
      List<TransactionCategorySummary> categorySummaries});
}

/// @nodoc
class _$TransactionSummaryCopyWithImpl<$Res, $Val extends TransactionSummary>
    implements $TransactionSummaryCopyWith<$Res> {
  _$TransactionSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? currency = null,
    Object? periodStart = null,
    Object? periodEnd = null,
    Object? totalInvestments = null,
    Object? totalWithdrawals = null,
    Object? totalDividends = null,
    Object? totalFees = null,
    Object? transactionCount = null,
    Object? categorySummaries = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      periodStart: null == periodStart
          ? _value.periodStart
          : periodStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      periodEnd: null == periodEnd
          ? _value.periodEnd
          : periodEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalInvestments: null == totalInvestments
          ? _value.totalInvestments
          : totalInvestments // ignore: cast_nullable_to_non_nullable
              as double,
      totalWithdrawals: null == totalWithdrawals
          ? _value.totalWithdrawals
          : totalWithdrawals // ignore: cast_nullable_to_non_nullable
              as double,
      totalDividends: null == totalDividends
          ? _value.totalDividends
          : totalDividends // ignore: cast_nullable_to_non_nullable
              as double,
      totalFees: null == totalFees
          ? _value.totalFees
          : totalFees // ignore: cast_nullable_to_non_nullable
              as double,
      transactionCount: null == transactionCount
          ? _value.transactionCount
          : transactionCount // ignore: cast_nullable_to_non_nullable
              as int,
      categorySummaries: null == categorySummaries
          ? _value.categorySummaries
          : categorySummaries // ignore: cast_nullable_to_non_nullable
              as List<TransactionCategorySummary>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionSummaryImplCopyWith<$Res>
    implements $TransactionSummaryCopyWith<$Res> {
  factory _$$TransactionSummaryImplCopyWith(_$TransactionSummaryImpl value,
          $Res Function(_$TransactionSummaryImpl) then) =
      __$$TransactionSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      String currency,
      DateTime periodStart,
      DateTime periodEnd,
      double totalInvestments,
      double totalWithdrawals,
      double totalDividends,
      double totalFees,
      int transactionCount,
      List<TransactionCategorySummary> categorySummaries});
}

/// @nodoc
class __$$TransactionSummaryImplCopyWithImpl<$Res>
    extends _$TransactionSummaryCopyWithImpl<$Res, _$TransactionSummaryImpl>
    implements _$$TransactionSummaryImplCopyWith<$Res> {
  __$$TransactionSummaryImplCopyWithImpl(_$TransactionSummaryImpl _value,
      $Res Function(_$TransactionSummaryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? currency = null,
    Object? periodStart = null,
    Object? periodEnd = null,
    Object? totalInvestments = null,
    Object? totalWithdrawals = null,
    Object? totalDividends = null,
    Object? totalFees = null,
    Object? transactionCount = null,
    Object? categorySummaries = null,
  }) {
    return _then(_$TransactionSummaryImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      periodStart: null == periodStart
          ? _value.periodStart
          : periodStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      periodEnd: null == periodEnd
          ? _value.periodEnd
          : periodEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalInvestments: null == totalInvestments
          ? _value.totalInvestments
          : totalInvestments // ignore: cast_nullable_to_non_nullable
              as double,
      totalWithdrawals: null == totalWithdrawals
          ? _value.totalWithdrawals
          : totalWithdrawals // ignore: cast_nullable_to_non_nullable
              as double,
      totalDividends: null == totalDividends
          ? _value.totalDividends
          : totalDividends // ignore: cast_nullable_to_non_nullable
              as double,
      totalFees: null == totalFees
          ? _value.totalFees
          : totalFees // ignore: cast_nullable_to_non_nullable
              as double,
      transactionCount: null == transactionCount
          ? _value.transactionCount
          : transactionCount // ignore: cast_nullable_to_non_nullable
              as int,
      categorySummaries: null == categorySummaries
          ? _value._categorySummaries
          : categorySummaries // ignore: cast_nullable_to_non_nullable
              as List<TransactionCategorySummary>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionSummaryImpl implements _TransactionSummary {
  const _$TransactionSummaryImpl(
      {required this.userId,
      required this.currency,
      required this.periodStart,
      required this.periodEnd,
      required this.totalInvestments,
      required this.totalWithdrawals,
      required this.totalDividends,
      required this.totalFees,
      required this.transactionCount,
      final List<TransactionCategorySummary> categorySummaries = const []})
      : _categorySummaries = categorySummaries;

  factory _$TransactionSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionSummaryImplFromJson(json);

  @override
  final String userId;
  @override
  final String currency;
  @override
  final DateTime periodStart;
  @override
  final DateTime periodEnd;
  @override
  final double totalInvestments;
  @override
  final double totalWithdrawals;
  @override
  final double totalDividends;
  @override
  final double totalFees;
  @override
  final int transactionCount;
  final List<TransactionCategorySummary> _categorySummaries;
  @override
  @JsonKey()
  List<TransactionCategorySummary> get categorySummaries {
    if (_categorySummaries is EqualUnmodifiableListView)
      return _categorySummaries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categorySummaries);
  }

  @override
  String toString() {
    return 'TransactionSummary(userId: $userId, currency: $currency, periodStart: $periodStart, periodEnd: $periodEnd, totalInvestments: $totalInvestments, totalWithdrawals: $totalWithdrawals, totalDividends: $totalDividends, totalFees: $totalFees, transactionCount: $transactionCount, categorySummaries: $categorySummaries)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionSummaryImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.periodStart, periodStart) ||
                other.periodStart == periodStart) &&
            (identical(other.periodEnd, periodEnd) ||
                other.periodEnd == periodEnd) &&
            (identical(other.totalInvestments, totalInvestments) ||
                other.totalInvestments == totalInvestments) &&
            (identical(other.totalWithdrawals, totalWithdrawals) ||
                other.totalWithdrawals == totalWithdrawals) &&
            (identical(other.totalDividends, totalDividends) ||
                other.totalDividends == totalDividends) &&
            (identical(other.totalFees, totalFees) ||
                other.totalFees == totalFees) &&
            (identical(other.transactionCount, transactionCount) ||
                other.transactionCount == transactionCount) &&
            const DeepCollectionEquality()
                .equals(other._categorySummaries, _categorySummaries));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      currency,
      periodStart,
      periodEnd,
      totalInvestments,
      totalWithdrawals,
      totalDividends,
      totalFees,
      transactionCount,
      const DeepCollectionEquality().hash(_categorySummaries));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionSummaryImplCopyWith<_$TransactionSummaryImpl> get copyWith =>
      __$$TransactionSummaryImplCopyWithImpl<_$TransactionSummaryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionSummaryImplToJson(
      this,
    );
  }
}

abstract class _TransactionSummary implements TransactionSummary {
  const factory _TransactionSummary(
          {required final String userId,
          required final String currency,
          required final DateTime periodStart,
          required final DateTime periodEnd,
          required final double totalInvestments,
          required final double totalWithdrawals,
          required final double totalDividends,
          required final double totalFees,
          required final int transactionCount,
          final List<TransactionCategorySummary> categorySummaries}) =
      _$TransactionSummaryImpl;

  factory _TransactionSummary.fromJson(Map<String, dynamic> json) =
      _$TransactionSummaryImpl.fromJson;

  @override
  String get userId;
  @override
  String get currency;
  @override
  DateTime get periodStart;
  @override
  DateTime get periodEnd;
  @override
  double get totalInvestments;
  @override
  double get totalWithdrawals;
  @override
  double get totalDividends;
  @override
  double get totalFees;
  @override
  int get transactionCount;
  @override
  List<TransactionCategorySummary> get categorySummaries;
  @override
  @JsonKey(ignore: true)
  _$$TransactionSummaryImplCopyWith<_$TransactionSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TransactionCategorySummary _$TransactionCategorySummaryFromJson(
    Map<String, dynamic> json) {
  return _TransactionCategorySummary.fromJson(json);
}

/// @nodoc
mixin _$TransactionCategorySummary {
  TransactionType get type => throw _privateConstructorUsedError;
  double get totalAmount => throw _privateConstructorUsedError;
  int get transactionCount => throw _privateConstructorUsedError;
  double get averageAmount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionCategorySummaryCopyWith<TransactionCategorySummary>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionCategorySummaryCopyWith<$Res> {
  factory $TransactionCategorySummaryCopyWith(TransactionCategorySummary value,
          $Res Function(TransactionCategorySummary) then) =
      _$TransactionCategorySummaryCopyWithImpl<$Res,
          TransactionCategorySummary>;
  @useResult
  $Res call(
      {TransactionType type,
      double totalAmount,
      int transactionCount,
      double averageAmount});
}

/// @nodoc
class _$TransactionCategorySummaryCopyWithImpl<$Res,
        $Val extends TransactionCategorySummary>
    implements $TransactionCategorySummaryCopyWith<$Res> {
  _$TransactionCategorySummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? totalAmount = null,
    Object? transactionCount = null,
    Object? averageAmount = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TransactionType,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      transactionCount: null == transactionCount
          ? _value.transactionCount
          : transactionCount // ignore: cast_nullable_to_non_nullable
              as int,
      averageAmount: null == averageAmount
          ? _value.averageAmount
          : averageAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionCategorySummaryImplCopyWith<$Res>
    implements $TransactionCategorySummaryCopyWith<$Res> {
  factory _$$TransactionCategorySummaryImplCopyWith(
          _$TransactionCategorySummaryImpl value,
          $Res Function(_$TransactionCategorySummaryImpl) then) =
      __$$TransactionCategorySummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TransactionType type,
      double totalAmount,
      int transactionCount,
      double averageAmount});
}

/// @nodoc
class __$$TransactionCategorySummaryImplCopyWithImpl<$Res>
    extends _$TransactionCategorySummaryCopyWithImpl<$Res,
        _$TransactionCategorySummaryImpl>
    implements _$$TransactionCategorySummaryImplCopyWith<$Res> {
  __$$TransactionCategorySummaryImplCopyWithImpl(
      _$TransactionCategorySummaryImpl _value,
      $Res Function(_$TransactionCategorySummaryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? totalAmount = null,
    Object? transactionCount = null,
    Object? averageAmount = null,
  }) {
    return _then(_$TransactionCategorySummaryImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TransactionType,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      transactionCount: null == transactionCount
          ? _value.transactionCount
          : transactionCount // ignore: cast_nullable_to_non_nullable
              as int,
      averageAmount: null == averageAmount
          ? _value.averageAmount
          : averageAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionCategorySummaryImpl implements _TransactionCategorySummary {
  const _$TransactionCategorySummaryImpl(
      {required this.type,
      required this.totalAmount,
      required this.transactionCount,
      required this.averageAmount});

  factory _$TransactionCategorySummaryImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$TransactionCategorySummaryImplFromJson(json);

  @override
  final TransactionType type;
  @override
  final double totalAmount;
  @override
  final int transactionCount;
  @override
  final double averageAmount;

  @override
  String toString() {
    return 'TransactionCategorySummary(type: $type, totalAmount: $totalAmount, transactionCount: $transactionCount, averageAmount: $averageAmount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionCategorySummaryImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.transactionCount, transactionCount) ||
                other.transactionCount == transactionCount) &&
            (identical(other.averageAmount, averageAmount) ||
                other.averageAmount == averageAmount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, type, totalAmount, transactionCount, averageAmount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionCategorySummaryImplCopyWith<_$TransactionCategorySummaryImpl>
      get copyWith => __$$TransactionCategorySummaryImplCopyWithImpl<
          _$TransactionCategorySummaryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionCategorySummaryImplToJson(
      this,
    );
  }
}

abstract class _TransactionCategorySummary
    implements TransactionCategorySummary {
  const factory _TransactionCategorySummary(
      {required final TransactionType type,
      required final double totalAmount,
      required final int transactionCount,
      required final double averageAmount}) = _$TransactionCategorySummaryImpl;

  factory _TransactionCategorySummary.fromJson(Map<String, dynamic> json) =
      _$TransactionCategorySummaryImpl.fromJson;

  @override
  TransactionType get type;
  @override
  double get totalAmount;
  @override
  int get transactionCount;
  @override
  double get averageAmount;
  @override
  @JsonKey(ignore: true)
  _$$TransactionCategorySummaryImplCopyWith<_$TransactionCategorySummaryImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Wallet _$WalletFromJson(Map<String, dynamic> json) {
  return _Wallet.fromJson(json);
}

/// @nodoc
mixin _$Wallet {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  double get balance => throw _privateConstructorUsedError;
  double get availableBalance => throw _privateConstructorUsedError;
  double get pendingBalance => throw _privateConstructorUsedError;
  List<WalletTransaction> get recentTransactions =>
      throw _privateConstructorUsedError;
  DateTime? get lastUpdated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WalletCopyWith<Wallet> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletCopyWith<$Res> {
  factory $WalletCopyWith(Wallet value, $Res Function(Wallet) then) =
      _$WalletCopyWithImpl<$Res, Wallet>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String currency,
      double balance,
      double availableBalance,
      double pendingBalance,
      List<WalletTransaction> recentTransactions,
      DateTime? lastUpdated});
}

/// @nodoc
class _$WalletCopyWithImpl<$Res, $Val extends Wallet>
    implements $WalletCopyWith<$Res> {
  _$WalletCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? currency = null,
    Object? balance = null,
    Object? availableBalance = null,
    Object? pendingBalance = null,
    Object? recentTransactions = null,
    Object? lastUpdated = freezed,
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
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      availableBalance: null == availableBalance
          ? _value.availableBalance
          : availableBalance // ignore: cast_nullable_to_non_nullable
              as double,
      pendingBalance: null == pendingBalance
          ? _value.pendingBalance
          : pendingBalance // ignore: cast_nullable_to_non_nullable
              as double,
      recentTransactions: null == recentTransactions
          ? _value.recentTransactions
          : recentTransactions // ignore: cast_nullable_to_non_nullable
              as List<WalletTransaction>,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WalletImplCopyWith<$Res> implements $WalletCopyWith<$Res> {
  factory _$$WalletImplCopyWith(
          _$WalletImpl value, $Res Function(_$WalletImpl) then) =
      __$$WalletImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String currency,
      double balance,
      double availableBalance,
      double pendingBalance,
      List<WalletTransaction> recentTransactions,
      DateTime? lastUpdated});
}

/// @nodoc
class __$$WalletImplCopyWithImpl<$Res>
    extends _$WalletCopyWithImpl<$Res, _$WalletImpl>
    implements _$$WalletImplCopyWith<$Res> {
  __$$WalletImplCopyWithImpl(
      _$WalletImpl _value, $Res Function(_$WalletImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? currency = null,
    Object? balance = null,
    Object? availableBalance = null,
    Object? pendingBalance = null,
    Object? recentTransactions = null,
    Object? lastUpdated = freezed,
  }) {
    return _then(_$WalletImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      availableBalance: null == availableBalance
          ? _value.availableBalance
          : availableBalance // ignore: cast_nullable_to_non_nullable
              as double,
      pendingBalance: null == pendingBalance
          ? _value.pendingBalance
          : pendingBalance // ignore: cast_nullable_to_non_nullable
              as double,
      recentTransactions: null == recentTransactions
          ? _value._recentTransactions
          : recentTransactions // ignore: cast_nullable_to_non_nullable
              as List<WalletTransaction>,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WalletImpl implements _Wallet {
  const _$WalletImpl(
      {required this.id,
      required this.userId,
      required this.currency,
      required this.balance,
      required this.availableBalance,
      required this.pendingBalance,
      final List<WalletTransaction> recentTransactions = const [],
      this.lastUpdated})
      : _recentTransactions = recentTransactions;

  factory _$WalletImpl.fromJson(Map<String, dynamic> json) =>
      _$$WalletImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String currency;
  @override
  final double balance;
  @override
  final double availableBalance;
  @override
  final double pendingBalance;
  final List<WalletTransaction> _recentTransactions;
  @override
  @JsonKey()
  List<WalletTransaction> get recentTransactions {
    if (_recentTransactions is EqualUnmodifiableListView)
      return _recentTransactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentTransactions);
  }

  @override
  final DateTime? lastUpdated;

  @override
  String toString() {
    return 'Wallet(id: $id, userId: $userId, currency: $currency, balance: $balance, availableBalance: $availableBalance, pendingBalance: $pendingBalance, recentTransactions: $recentTransactions, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.availableBalance, availableBalance) ||
                other.availableBalance == availableBalance) &&
            (identical(other.pendingBalance, pendingBalance) ||
                other.pendingBalance == pendingBalance) &&
            const DeepCollectionEquality()
                .equals(other._recentTransactions, _recentTransactions) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      currency,
      balance,
      availableBalance,
      pendingBalance,
      const DeepCollectionEquality().hash(_recentTransactions),
      lastUpdated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletImplCopyWith<_$WalletImpl> get copyWith =>
      __$$WalletImplCopyWithImpl<_$WalletImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WalletImplToJson(
      this,
    );
  }
}

abstract class _Wallet implements Wallet {
  const factory _Wallet(
      {required final String id,
      required final String userId,
      required final String currency,
      required final double balance,
      required final double availableBalance,
      required final double pendingBalance,
      final List<WalletTransaction> recentTransactions,
      final DateTime? lastUpdated}) = _$WalletImpl;

  factory _Wallet.fromJson(Map<String, dynamic> json) = _$WalletImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get currency;
  @override
  double get balance;
  @override
  double get availableBalance;
  @override
  double get pendingBalance;
  @override
  List<WalletTransaction> get recentTransactions;
  @override
  DateTime? get lastUpdated;
  @override
  @JsonKey(ignore: true)
  _$$WalletImplCopyWith<_$WalletImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WalletTransaction _$WalletTransactionFromJson(Map<String, dynamic> json) {
  return _WalletTransaction.fromJson(json);
}

/// @nodoc
mixin _$WalletTransaction {
  String get id => throw _privateConstructorUsedError;
  TransactionType get type => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String? get referenceId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WalletTransactionCopyWith<WalletTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletTransactionCopyWith<$Res> {
  factory $WalletTransactionCopyWith(
          WalletTransaction value, $Res Function(WalletTransaction) then) =
      _$WalletTransactionCopyWithImpl<$Res, WalletTransaction>;
  @useResult
  $Res call(
      {String id,
      TransactionType type,
      double amount,
      DateTime timestamp,
      String description,
      String? referenceId});
}

/// @nodoc
class _$WalletTransactionCopyWithImpl<$Res, $Val extends WalletTransaction>
    implements $WalletTransactionCopyWith<$Res> {
  _$WalletTransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? amount = null,
    Object? timestamp = null,
    Object? description = null,
    Object? referenceId = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TransactionType,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      referenceId: freezed == referenceId
          ? _value.referenceId
          : referenceId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WalletTransactionImplCopyWith<$Res>
    implements $WalletTransactionCopyWith<$Res> {
  factory _$$WalletTransactionImplCopyWith(_$WalletTransactionImpl value,
          $Res Function(_$WalletTransactionImpl) then) =
      __$$WalletTransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      TransactionType type,
      double amount,
      DateTime timestamp,
      String description,
      String? referenceId});
}

/// @nodoc
class __$$WalletTransactionImplCopyWithImpl<$Res>
    extends _$WalletTransactionCopyWithImpl<$Res, _$WalletTransactionImpl>
    implements _$$WalletTransactionImplCopyWith<$Res> {
  __$$WalletTransactionImplCopyWithImpl(_$WalletTransactionImpl _value,
      $Res Function(_$WalletTransactionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? amount = null,
    Object? timestamp = null,
    Object? description = null,
    Object? referenceId = freezed,
  }) {
    return _then(_$WalletTransactionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TransactionType,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      referenceId: freezed == referenceId
          ? _value.referenceId
          : referenceId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WalletTransactionImpl implements _WalletTransaction {
  const _$WalletTransactionImpl(
      {required this.id,
      required this.type,
      required this.amount,
      required this.timestamp,
      required this.description,
      this.referenceId});

  factory _$WalletTransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$WalletTransactionImplFromJson(json);

  @override
  final String id;
  @override
  final TransactionType type;
  @override
  final double amount;
  @override
  final DateTime timestamp;
  @override
  final String description;
  @override
  final String? referenceId;

  @override
  String toString() {
    return 'WalletTransaction(id: $id, type: $type, amount: $amount, timestamp: $timestamp, description: $description, referenceId: $referenceId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletTransactionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.referenceId, referenceId) ||
                other.referenceId == referenceId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, type, amount, timestamp, description, referenceId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletTransactionImplCopyWith<_$WalletTransactionImpl> get copyWith =>
      __$$WalletTransactionImplCopyWithImpl<_$WalletTransactionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WalletTransactionImplToJson(
      this,
    );
  }
}

abstract class _WalletTransaction implements WalletTransaction {
  const factory _WalletTransaction(
      {required final String id,
      required final TransactionType type,
      required final double amount,
      required final DateTime timestamp,
      required final String description,
      final String? referenceId}) = _$WalletTransactionImpl;

  factory _WalletTransaction.fromJson(Map<String, dynamic> json) =
      _$WalletTransactionImpl.fromJson;

  @override
  String get id;
  @override
  TransactionType get type;
  @override
  double get amount;
  @override
  DateTime get timestamp;
  @override
  String get description;
  @override
  String? get referenceId;
  @override
  @JsonKey(ignore: true)
  _$$WalletTransactionImplCopyWith<_$WalletTransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
