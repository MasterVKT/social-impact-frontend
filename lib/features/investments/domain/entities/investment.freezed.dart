// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'investment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Investment _$InvestmentFromJson(Map<String, dynamic> json) {
  return _Investment.fromJson(json);
}

/// @nodoc
mixin _$Investment {
  String get id => throw _privateConstructorUsedError;
  String get investorId => throw _privateConstructorUsedError;
  String get projectId => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  DateTime get investmentDate => throw _privateConstructorUsedError;
  InvestmentStatus get status => throw _privateConstructorUsedError;
  InvestmentType get type => throw _privateConstructorUsedError;
  double get currentValue => throw _privateConstructorUsedError;
  double get expectedReturn => throw _privateConstructorUsedError;
  double get actualReturn => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;
  DateTime? get exitDate => throw _privateConstructorUsedError;
  List<InvestmentTransaction> get transactions =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InvestmentCopyWith<Investment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvestmentCopyWith<$Res> {
  factory $InvestmentCopyWith(
          Investment value, $Res Function(Investment) then) =
      _$InvestmentCopyWithImpl<$Res, Investment>;
  @useResult
  $Res call(
      {String id,
      String investorId,
      String projectId,
      double amount,
      String currency,
      DateTime investmentDate,
      InvestmentStatus status,
      InvestmentType type,
      double currentValue,
      double expectedReturn,
      double actualReturn,
      String? notes,
      Map<String, dynamic>? metadata,
      DateTime? exitDate,
      List<InvestmentTransaction> transactions});
}

/// @nodoc
class _$InvestmentCopyWithImpl<$Res, $Val extends Investment>
    implements $InvestmentCopyWith<$Res> {
  _$InvestmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? investorId = null,
    Object? projectId = null,
    Object? amount = null,
    Object? currency = null,
    Object? investmentDate = null,
    Object? status = null,
    Object? type = null,
    Object? currentValue = null,
    Object? expectedReturn = null,
    Object? actualReturn = null,
    Object? notes = freezed,
    Object? metadata = freezed,
    Object? exitDate = freezed,
    Object? transactions = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      investorId: null == investorId
          ? _value.investorId
          : investorId // ignore: cast_nullable_to_non_nullable
              as String,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      investmentDate: null == investmentDate
          ? _value.investmentDate
          : investmentDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as InvestmentStatus,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as InvestmentType,
      currentValue: null == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as double,
      expectedReturn: null == expectedReturn
          ? _value.expectedReturn
          : expectedReturn // ignore: cast_nullable_to_non_nullable
              as double,
      actualReturn: null == actualReturn
          ? _value.actualReturn
          : actualReturn // ignore: cast_nullable_to_non_nullable
              as double,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      exitDate: freezed == exitDate
          ? _value.exitDate
          : exitDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      transactions: null == transactions
          ? _value.transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<InvestmentTransaction>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InvestmentImplCopyWith<$Res>
    implements $InvestmentCopyWith<$Res> {
  factory _$$InvestmentImplCopyWith(
          _$InvestmentImpl value, $Res Function(_$InvestmentImpl) then) =
      __$$InvestmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String investorId,
      String projectId,
      double amount,
      String currency,
      DateTime investmentDate,
      InvestmentStatus status,
      InvestmentType type,
      double currentValue,
      double expectedReturn,
      double actualReturn,
      String? notes,
      Map<String, dynamic>? metadata,
      DateTime? exitDate,
      List<InvestmentTransaction> transactions});
}

/// @nodoc
class __$$InvestmentImplCopyWithImpl<$Res>
    extends _$InvestmentCopyWithImpl<$Res, _$InvestmentImpl>
    implements _$$InvestmentImplCopyWith<$Res> {
  __$$InvestmentImplCopyWithImpl(
      _$InvestmentImpl _value, $Res Function(_$InvestmentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? investorId = null,
    Object? projectId = null,
    Object? amount = null,
    Object? currency = null,
    Object? investmentDate = null,
    Object? status = null,
    Object? type = null,
    Object? currentValue = null,
    Object? expectedReturn = null,
    Object? actualReturn = null,
    Object? notes = freezed,
    Object? metadata = freezed,
    Object? exitDate = freezed,
    Object? transactions = null,
  }) {
    return _then(_$InvestmentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      investorId: null == investorId
          ? _value.investorId
          : investorId // ignore: cast_nullable_to_non_nullable
              as String,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      investmentDate: null == investmentDate
          ? _value.investmentDate
          : investmentDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as InvestmentStatus,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as InvestmentType,
      currentValue: null == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as double,
      expectedReturn: null == expectedReturn
          ? _value.expectedReturn
          : expectedReturn // ignore: cast_nullable_to_non_nullable
              as double,
      actualReturn: null == actualReturn
          ? _value.actualReturn
          : actualReturn // ignore: cast_nullable_to_non_nullable
              as double,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      exitDate: freezed == exitDate
          ? _value.exitDate
          : exitDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      transactions: null == transactions
          ? _value._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<InvestmentTransaction>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InvestmentImpl implements _Investment {
  const _$InvestmentImpl(
      {required this.id,
      required this.investorId,
      required this.projectId,
      required this.amount,
      required this.currency,
      required this.investmentDate,
      required this.status,
      required this.type,
      this.currentValue = 0.0,
      this.expectedReturn = 0.0,
      this.actualReturn = 0.0,
      this.notes,
      final Map<String, dynamic>? metadata,
      this.exitDate,
      final List<InvestmentTransaction> transactions = const []})
      : _metadata = metadata,
        _transactions = transactions;

  factory _$InvestmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvestmentImplFromJson(json);

  @override
  final String id;
  @override
  final String investorId;
  @override
  final String projectId;
  @override
  final double amount;
  @override
  final String currency;
  @override
  final DateTime investmentDate;
  @override
  final InvestmentStatus status;
  @override
  final InvestmentType type;
  @override
  @JsonKey()
  final double currentValue;
  @override
  @JsonKey()
  final double expectedReturn;
  @override
  @JsonKey()
  final double actualReturn;
  @override
  final String? notes;
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
  final DateTime? exitDate;
  final List<InvestmentTransaction> _transactions;
  @override
  @JsonKey()
  List<InvestmentTransaction> get transactions {
    if (_transactions is EqualUnmodifiableListView) return _transactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactions);
  }

  @override
  String toString() {
    return 'Investment(id: $id, investorId: $investorId, projectId: $projectId, amount: $amount, currency: $currency, investmentDate: $investmentDate, status: $status, type: $type, currentValue: $currentValue, expectedReturn: $expectedReturn, actualReturn: $actualReturn, notes: $notes, metadata: $metadata, exitDate: $exitDate, transactions: $transactions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvestmentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.investorId, investorId) ||
                other.investorId == investorId) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.investmentDate, investmentDate) ||
                other.investmentDate == investmentDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.currentValue, currentValue) ||
                other.currentValue == currentValue) &&
            (identical(other.expectedReturn, expectedReturn) ||
                other.expectedReturn == expectedReturn) &&
            (identical(other.actualReturn, actualReturn) ||
                other.actualReturn == actualReturn) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.exitDate, exitDate) ||
                other.exitDate == exitDate) &&
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      investorId,
      projectId,
      amount,
      currency,
      investmentDate,
      status,
      type,
      currentValue,
      expectedReturn,
      actualReturn,
      notes,
      const DeepCollectionEquality().hash(_metadata),
      exitDate,
      const DeepCollectionEquality().hash(_transactions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvestmentImplCopyWith<_$InvestmentImpl> get copyWith =>
      __$$InvestmentImplCopyWithImpl<_$InvestmentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InvestmentImplToJson(
      this,
    );
  }
}

abstract class _Investment implements Investment {
  const factory _Investment(
      {required final String id,
      required final String investorId,
      required final String projectId,
      required final double amount,
      required final String currency,
      required final DateTime investmentDate,
      required final InvestmentStatus status,
      required final InvestmentType type,
      final double currentValue,
      final double expectedReturn,
      final double actualReturn,
      final String? notes,
      final Map<String, dynamic>? metadata,
      final DateTime? exitDate,
      final List<InvestmentTransaction> transactions}) = _$InvestmentImpl;

  factory _Investment.fromJson(Map<String, dynamic> json) =
      _$InvestmentImpl.fromJson;

  @override
  String get id;
  @override
  String get investorId;
  @override
  String get projectId;
  @override
  double get amount;
  @override
  String get currency;
  @override
  DateTime get investmentDate;
  @override
  InvestmentStatus get status;
  @override
  InvestmentType get type;
  @override
  double get currentValue;
  @override
  double get expectedReturn;
  @override
  double get actualReturn;
  @override
  String? get notes;
  @override
  Map<String, dynamic>? get metadata;
  @override
  DateTime? get exitDate;
  @override
  List<InvestmentTransaction> get transactions;
  @override
  @JsonKey(ignore: true)
  _$$InvestmentImplCopyWith<_$InvestmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InvestmentTransaction _$InvestmentTransactionFromJson(
    Map<String, dynamic> json) {
  return _InvestmentTransaction.fromJson(json);
}

/// @nodoc
mixin _$InvestmentTransaction {
  String get id => throw _privateConstructorUsedError;
  String get investmentId => throw _privateConstructorUsedError;
  TransactionType get type => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  TransactionStatus get status => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InvestmentTransactionCopyWith<InvestmentTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvestmentTransactionCopyWith<$Res> {
  factory $InvestmentTransactionCopyWith(InvestmentTransaction value,
          $Res Function(InvestmentTransaction) then) =
      _$InvestmentTransactionCopyWithImpl<$Res, InvestmentTransaction>;
  @useResult
  $Res call(
      {String id,
      String investmentId,
      TransactionType type,
      double amount,
      String currency,
      DateTime date,
      TransactionStatus status,
      String? description,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class _$InvestmentTransactionCopyWithImpl<$Res,
        $Val extends InvestmentTransaction>
    implements $InvestmentTransactionCopyWith<$Res> {
  _$InvestmentTransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? investmentId = null,
    Object? type = null,
    Object? amount = null,
    Object? currency = null,
    Object? date = null,
    Object? status = null,
    Object? description = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      investmentId: null == investmentId
          ? _value.investmentId
          : investmentId // ignore: cast_nullable_to_non_nullable
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
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TransactionStatus,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InvestmentTransactionImplCopyWith<$Res>
    implements $InvestmentTransactionCopyWith<$Res> {
  factory _$$InvestmentTransactionImplCopyWith(
          _$InvestmentTransactionImpl value,
          $Res Function(_$InvestmentTransactionImpl) then) =
      __$$InvestmentTransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String investmentId,
      TransactionType type,
      double amount,
      String currency,
      DateTime date,
      TransactionStatus status,
      String? description,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class __$$InvestmentTransactionImplCopyWithImpl<$Res>
    extends _$InvestmentTransactionCopyWithImpl<$Res,
        _$InvestmentTransactionImpl>
    implements _$$InvestmentTransactionImplCopyWith<$Res> {
  __$$InvestmentTransactionImplCopyWithImpl(_$InvestmentTransactionImpl _value,
      $Res Function(_$InvestmentTransactionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? investmentId = null,
    Object? type = null,
    Object? amount = null,
    Object? currency = null,
    Object? date = null,
    Object? status = null,
    Object? description = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_$InvestmentTransactionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      investmentId: null == investmentId
          ? _value.investmentId
          : investmentId // ignore: cast_nullable_to_non_nullable
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
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TransactionStatus,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
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
class _$InvestmentTransactionImpl implements _InvestmentTransaction {
  const _$InvestmentTransactionImpl(
      {required this.id,
      required this.investmentId,
      required this.type,
      required this.amount,
      required this.currency,
      required this.date,
      this.status = TransactionStatus.completed,
      this.description,
      final Map<String, dynamic>? metadata})
      : _metadata = metadata;

  factory _$InvestmentTransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvestmentTransactionImplFromJson(json);

  @override
  final String id;
  @override
  final String investmentId;
  @override
  final TransactionType type;
  @override
  final double amount;
  @override
  final String currency;
  @override
  final DateTime date;
  @override
  @JsonKey()
  final TransactionStatus status;
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
  String toString() {
    return 'InvestmentTransaction(id: $id, investmentId: $investmentId, type: $type, amount: $amount, currency: $currency, date: $date, status: $status, description: $description, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvestmentTransactionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.investmentId, investmentId) ||
                other.investmentId == investmentId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      investmentId,
      type,
      amount,
      currency,
      date,
      status,
      description,
      const DeepCollectionEquality().hash(_metadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvestmentTransactionImplCopyWith<_$InvestmentTransactionImpl>
      get copyWith => __$$InvestmentTransactionImplCopyWithImpl<
          _$InvestmentTransactionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InvestmentTransactionImplToJson(
      this,
    );
  }
}

abstract class _InvestmentTransaction implements InvestmentTransaction {
  const factory _InvestmentTransaction(
      {required final String id,
      required final String investmentId,
      required final TransactionType type,
      required final double amount,
      required final String currency,
      required final DateTime date,
      final TransactionStatus status,
      final String? description,
      final Map<String, dynamic>? metadata}) = _$InvestmentTransactionImpl;

  factory _InvestmentTransaction.fromJson(Map<String, dynamic> json) =
      _$InvestmentTransactionImpl.fromJson;

  @override
  String get id;
  @override
  String get investmentId;
  @override
  TransactionType get type;
  @override
  double get amount;
  @override
  String get currency;
  @override
  DateTime get date;
  @override
  TransactionStatus get status;
  @override
  String? get description;
  @override
  Map<String, dynamic>? get metadata;
  @override
  @JsonKey(ignore: true)
  _$$InvestmentTransactionImplCopyWith<_$InvestmentTransactionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Portfolio _$PortfolioFromJson(Map<String, dynamic> json) {
  return _Portfolio.fromJson(json);
}

/// @nodoc
mixin _$Portfolio {
  String get userId => throw _privateConstructorUsedError;
  double get totalInvested => throw _privateConstructorUsedError;
  double get currentValue => throw _privateConstructorUsedError;
  double get totalReturns => throw _privateConstructorUsedError;
  double get returnPercentage => throw _privateConstructorUsedError;
  int get activeInvestments => throw _privateConstructorUsedError;
  int get completedInvestments => throw _privateConstructorUsedError;
  List<Investment> get investments => throw _privateConstructorUsedError;
  List<PortfolioAllocation> get allocations =>
      throw _privateConstructorUsedError;
  DateTime? get lastUpdated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PortfolioCopyWith<Portfolio> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PortfolioCopyWith<$Res> {
  factory $PortfolioCopyWith(Portfolio value, $Res Function(Portfolio) then) =
      _$PortfolioCopyWithImpl<$Res, Portfolio>;
  @useResult
  $Res call(
      {String userId,
      double totalInvested,
      double currentValue,
      double totalReturns,
      double returnPercentage,
      int activeInvestments,
      int completedInvestments,
      List<Investment> investments,
      List<PortfolioAllocation> allocations,
      DateTime? lastUpdated});
}

/// @nodoc
class _$PortfolioCopyWithImpl<$Res, $Val extends Portfolio>
    implements $PortfolioCopyWith<$Res> {
  _$PortfolioCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? totalInvested = null,
    Object? currentValue = null,
    Object? totalReturns = null,
    Object? returnPercentage = null,
    Object? activeInvestments = null,
    Object? completedInvestments = null,
    Object? investments = null,
    Object? allocations = null,
    Object? lastUpdated = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      totalInvested: null == totalInvested
          ? _value.totalInvested
          : totalInvested // ignore: cast_nullable_to_non_nullable
              as double,
      currentValue: null == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as double,
      totalReturns: null == totalReturns
          ? _value.totalReturns
          : totalReturns // ignore: cast_nullable_to_non_nullable
              as double,
      returnPercentage: null == returnPercentage
          ? _value.returnPercentage
          : returnPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      activeInvestments: null == activeInvestments
          ? _value.activeInvestments
          : activeInvestments // ignore: cast_nullable_to_non_nullable
              as int,
      completedInvestments: null == completedInvestments
          ? _value.completedInvestments
          : completedInvestments // ignore: cast_nullable_to_non_nullable
              as int,
      investments: null == investments
          ? _value.investments
          : investments // ignore: cast_nullable_to_non_nullable
              as List<Investment>,
      allocations: null == allocations
          ? _value.allocations
          : allocations // ignore: cast_nullable_to_non_nullable
              as List<PortfolioAllocation>,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PortfolioImplCopyWith<$Res>
    implements $PortfolioCopyWith<$Res> {
  factory _$$PortfolioImplCopyWith(
          _$PortfolioImpl value, $Res Function(_$PortfolioImpl) then) =
      __$$PortfolioImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      double totalInvested,
      double currentValue,
      double totalReturns,
      double returnPercentage,
      int activeInvestments,
      int completedInvestments,
      List<Investment> investments,
      List<PortfolioAllocation> allocations,
      DateTime? lastUpdated});
}

/// @nodoc
class __$$PortfolioImplCopyWithImpl<$Res>
    extends _$PortfolioCopyWithImpl<$Res, _$PortfolioImpl>
    implements _$$PortfolioImplCopyWith<$Res> {
  __$$PortfolioImplCopyWithImpl(
      _$PortfolioImpl _value, $Res Function(_$PortfolioImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? totalInvested = null,
    Object? currentValue = null,
    Object? totalReturns = null,
    Object? returnPercentage = null,
    Object? activeInvestments = null,
    Object? completedInvestments = null,
    Object? investments = null,
    Object? allocations = null,
    Object? lastUpdated = freezed,
  }) {
    return _then(_$PortfolioImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      totalInvested: null == totalInvested
          ? _value.totalInvested
          : totalInvested // ignore: cast_nullable_to_non_nullable
              as double,
      currentValue: null == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as double,
      totalReturns: null == totalReturns
          ? _value.totalReturns
          : totalReturns // ignore: cast_nullable_to_non_nullable
              as double,
      returnPercentage: null == returnPercentage
          ? _value.returnPercentage
          : returnPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      activeInvestments: null == activeInvestments
          ? _value.activeInvestments
          : activeInvestments // ignore: cast_nullable_to_non_nullable
              as int,
      completedInvestments: null == completedInvestments
          ? _value.completedInvestments
          : completedInvestments // ignore: cast_nullable_to_non_nullable
              as int,
      investments: null == investments
          ? _value._investments
          : investments // ignore: cast_nullable_to_non_nullable
              as List<Investment>,
      allocations: null == allocations
          ? _value._allocations
          : allocations // ignore: cast_nullable_to_non_nullable
              as List<PortfolioAllocation>,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PortfolioImpl implements _Portfolio {
  const _$PortfolioImpl(
      {required this.userId,
      required this.totalInvested,
      required this.currentValue,
      required this.totalReturns,
      required this.returnPercentage,
      required this.activeInvestments,
      required this.completedInvestments,
      final List<Investment> investments = const [],
      final List<PortfolioAllocation> allocations = const [],
      this.lastUpdated})
      : _investments = investments,
        _allocations = allocations;

  factory _$PortfolioImpl.fromJson(Map<String, dynamic> json) =>
      _$$PortfolioImplFromJson(json);

  @override
  final String userId;
  @override
  final double totalInvested;
  @override
  final double currentValue;
  @override
  final double totalReturns;
  @override
  final double returnPercentage;
  @override
  final int activeInvestments;
  @override
  final int completedInvestments;
  final List<Investment> _investments;
  @override
  @JsonKey()
  List<Investment> get investments {
    if (_investments is EqualUnmodifiableListView) return _investments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_investments);
  }

  final List<PortfolioAllocation> _allocations;
  @override
  @JsonKey()
  List<PortfolioAllocation> get allocations {
    if (_allocations is EqualUnmodifiableListView) return _allocations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allocations);
  }

  @override
  final DateTime? lastUpdated;

  @override
  String toString() {
    return 'Portfolio(userId: $userId, totalInvested: $totalInvested, currentValue: $currentValue, totalReturns: $totalReturns, returnPercentage: $returnPercentage, activeInvestments: $activeInvestments, completedInvestments: $completedInvestments, investments: $investments, allocations: $allocations, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PortfolioImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.totalInvested, totalInvested) ||
                other.totalInvested == totalInvested) &&
            (identical(other.currentValue, currentValue) ||
                other.currentValue == currentValue) &&
            (identical(other.totalReturns, totalReturns) ||
                other.totalReturns == totalReturns) &&
            (identical(other.returnPercentage, returnPercentage) ||
                other.returnPercentage == returnPercentage) &&
            (identical(other.activeInvestments, activeInvestments) ||
                other.activeInvestments == activeInvestments) &&
            (identical(other.completedInvestments, completedInvestments) ||
                other.completedInvestments == completedInvestments) &&
            const DeepCollectionEquality()
                .equals(other._investments, _investments) &&
            const DeepCollectionEquality()
                .equals(other._allocations, _allocations) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      totalInvested,
      currentValue,
      totalReturns,
      returnPercentage,
      activeInvestments,
      completedInvestments,
      const DeepCollectionEquality().hash(_investments),
      const DeepCollectionEquality().hash(_allocations),
      lastUpdated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PortfolioImplCopyWith<_$PortfolioImpl> get copyWith =>
      __$$PortfolioImplCopyWithImpl<_$PortfolioImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PortfolioImplToJson(
      this,
    );
  }
}

abstract class _Portfolio implements Portfolio {
  const factory _Portfolio(
      {required final String userId,
      required final double totalInvested,
      required final double currentValue,
      required final double totalReturns,
      required final double returnPercentage,
      required final int activeInvestments,
      required final int completedInvestments,
      final List<Investment> investments,
      final List<PortfolioAllocation> allocations,
      final DateTime? lastUpdated}) = _$PortfolioImpl;

  factory _Portfolio.fromJson(Map<String, dynamic> json) =
      _$PortfolioImpl.fromJson;

  @override
  String get userId;
  @override
  double get totalInvested;
  @override
  double get currentValue;
  @override
  double get totalReturns;
  @override
  double get returnPercentage;
  @override
  int get activeInvestments;
  @override
  int get completedInvestments;
  @override
  List<Investment> get investments;
  @override
  List<PortfolioAllocation> get allocations;
  @override
  DateTime? get lastUpdated;
  @override
  @JsonKey(ignore: true)
  _$$PortfolioImplCopyWith<_$PortfolioImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PortfolioAllocation _$PortfolioAllocationFromJson(Map<String, dynamic> json) {
  return _PortfolioAllocation.fromJson(json);
}

/// @nodoc
mixin _$PortfolioAllocation {
  String get category => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  double get percentage => throw _privateConstructorUsedError;
  int get investmentCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PortfolioAllocationCopyWith<PortfolioAllocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PortfolioAllocationCopyWith<$Res> {
  factory $PortfolioAllocationCopyWith(
          PortfolioAllocation value, $Res Function(PortfolioAllocation) then) =
      _$PortfolioAllocationCopyWithImpl<$Res, PortfolioAllocation>;
  @useResult
  $Res call(
      {String category, double amount, double percentage, int investmentCount});
}

/// @nodoc
class _$PortfolioAllocationCopyWithImpl<$Res, $Val extends PortfolioAllocation>
    implements $PortfolioAllocationCopyWith<$Res> {
  _$PortfolioAllocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? amount = null,
    Object? percentage = null,
    Object? investmentCount = null,
  }) {
    return _then(_value.copyWith(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$PortfolioAllocationImplCopyWith<$Res>
    implements $PortfolioAllocationCopyWith<$Res> {
  factory _$$PortfolioAllocationImplCopyWith(_$PortfolioAllocationImpl value,
          $Res Function(_$PortfolioAllocationImpl) then) =
      __$$PortfolioAllocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String category, double amount, double percentage, int investmentCount});
}

/// @nodoc
class __$$PortfolioAllocationImplCopyWithImpl<$Res>
    extends _$PortfolioAllocationCopyWithImpl<$Res, _$PortfolioAllocationImpl>
    implements _$$PortfolioAllocationImplCopyWith<$Res> {
  __$$PortfolioAllocationImplCopyWithImpl(_$PortfolioAllocationImpl _value,
      $Res Function(_$PortfolioAllocationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? amount = null,
    Object? percentage = null,
    Object? investmentCount = null,
  }) {
    return _then(_$PortfolioAllocationImpl(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$PortfolioAllocationImpl implements _PortfolioAllocation {
  const _$PortfolioAllocationImpl(
      {required this.category,
      required this.amount,
      required this.percentage,
      required this.investmentCount});

  factory _$PortfolioAllocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$PortfolioAllocationImplFromJson(json);

  @override
  final String category;
  @override
  final double amount;
  @override
  final double percentage;
  @override
  final int investmentCount;

  @override
  String toString() {
    return 'PortfolioAllocation(category: $category, amount: $amount, percentage: $percentage, investmentCount: $investmentCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PortfolioAllocationImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage) &&
            (identical(other.investmentCount, investmentCount) ||
                other.investmentCount == investmentCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, category, amount, percentage, investmentCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PortfolioAllocationImplCopyWith<_$PortfolioAllocationImpl> get copyWith =>
      __$$PortfolioAllocationImplCopyWithImpl<_$PortfolioAllocationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PortfolioAllocationImplToJson(
      this,
    );
  }
}

abstract class _PortfolioAllocation implements PortfolioAllocation {
  const factory _PortfolioAllocation(
      {required final String category,
      required final double amount,
      required final double percentage,
      required final int investmentCount}) = _$PortfolioAllocationImpl;

  factory _PortfolioAllocation.fromJson(Map<String, dynamic> json) =
      _$PortfolioAllocationImpl.fromJson;

  @override
  String get category;
  @override
  double get amount;
  @override
  double get percentage;
  @override
  int get investmentCount;
  @override
  @JsonKey(ignore: true)
  _$$PortfolioAllocationImplCopyWith<_$PortfolioAllocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InvestmentPerformance _$InvestmentPerformanceFromJson(
    Map<String, dynamic> json) {
  return _InvestmentPerformance.fromJson(json);
}

/// @nodoc
mixin _$InvestmentPerformance {
  String get investmentId => throw _privateConstructorUsedError;
  double get irr =>
      throw _privateConstructorUsedError; // Internal Rate of Return
  double get roi => throw _privateConstructorUsedError; // Return on Investment
  double get multiple =>
      throw _privateConstructorUsedError; // Investment multiple
  int get daysInvested => throw _privateConstructorUsedError;
  double get annualizedReturn => throw _privateConstructorUsedError;
  List<PerformanceDataPoint> get performanceHistory =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InvestmentPerformanceCopyWith<InvestmentPerformance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvestmentPerformanceCopyWith<$Res> {
  factory $InvestmentPerformanceCopyWith(InvestmentPerformance value,
          $Res Function(InvestmentPerformance) then) =
      _$InvestmentPerformanceCopyWithImpl<$Res, InvestmentPerformance>;
  @useResult
  $Res call(
      {String investmentId,
      double irr,
      double roi,
      double multiple,
      int daysInvested,
      double annualizedReturn,
      List<PerformanceDataPoint> performanceHistory});
}

/// @nodoc
class _$InvestmentPerformanceCopyWithImpl<$Res,
        $Val extends InvestmentPerformance>
    implements $InvestmentPerformanceCopyWith<$Res> {
  _$InvestmentPerformanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? investmentId = null,
    Object? irr = null,
    Object? roi = null,
    Object? multiple = null,
    Object? daysInvested = null,
    Object? annualizedReturn = null,
    Object? performanceHistory = null,
  }) {
    return _then(_value.copyWith(
      investmentId: null == investmentId
          ? _value.investmentId
          : investmentId // ignore: cast_nullable_to_non_nullable
              as String,
      irr: null == irr
          ? _value.irr
          : irr // ignore: cast_nullable_to_non_nullable
              as double,
      roi: null == roi
          ? _value.roi
          : roi // ignore: cast_nullable_to_non_nullable
              as double,
      multiple: null == multiple
          ? _value.multiple
          : multiple // ignore: cast_nullable_to_non_nullable
              as double,
      daysInvested: null == daysInvested
          ? _value.daysInvested
          : daysInvested // ignore: cast_nullable_to_non_nullable
              as int,
      annualizedReturn: null == annualizedReturn
          ? _value.annualizedReturn
          : annualizedReturn // ignore: cast_nullable_to_non_nullable
              as double,
      performanceHistory: null == performanceHistory
          ? _value.performanceHistory
          : performanceHistory // ignore: cast_nullable_to_non_nullable
              as List<PerformanceDataPoint>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InvestmentPerformanceImplCopyWith<$Res>
    implements $InvestmentPerformanceCopyWith<$Res> {
  factory _$$InvestmentPerformanceImplCopyWith(
          _$InvestmentPerformanceImpl value,
          $Res Function(_$InvestmentPerformanceImpl) then) =
      __$$InvestmentPerformanceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String investmentId,
      double irr,
      double roi,
      double multiple,
      int daysInvested,
      double annualizedReturn,
      List<PerformanceDataPoint> performanceHistory});
}

/// @nodoc
class __$$InvestmentPerformanceImplCopyWithImpl<$Res>
    extends _$InvestmentPerformanceCopyWithImpl<$Res,
        _$InvestmentPerformanceImpl>
    implements _$$InvestmentPerformanceImplCopyWith<$Res> {
  __$$InvestmentPerformanceImplCopyWithImpl(_$InvestmentPerformanceImpl _value,
      $Res Function(_$InvestmentPerformanceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? investmentId = null,
    Object? irr = null,
    Object? roi = null,
    Object? multiple = null,
    Object? daysInvested = null,
    Object? annualizedReturn = null,
    Object? performanceHistory = null,
  }) {
    return _then(_$InvestmentPerformanceImpl(
      investmentId: null == investmentId
          ? _value.investmentId
          : investmentId // ignore: cast_nullable_to_non_nullable
              as String,
      irr: null == irr
          ? _value.irr
          : irr // ignore: cast_nullable_to_non_nullable
              as double,
      roi: null == roi
          ? _value.roi
          : roi // ignore: cast_nullable_to_non_nullable
              as double,
      multiple: null == multiple
          ? _value.multiple
          : multiple // ignore: cast_nullable_to_non_nullable
              as double,
      daysInvested: null == daysInvested
          ? _value.daysInvested
          : daysInvested // ignore: cast_nullable_to_non_nullable
              as int,
      annualizedReturn: null == annualizedReturn
          ? _value.annualizedReturn
          : annualizedReturn // ignore: cast_nullable_to_non_nullable
              as double,
      performanceHistory: null == performanceHistory
          ? _value._performanceHistory
          : performanceHistory // ignore: cast_nullable_to_non_nullable
              as List<PerformanceDataPoint>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InvestmentPerformanceImpl implements _InvestmentPerformance {
  const _$InvestmentPerformanceImpl(
      {required this.investmentId,
      required this.irr,
      required this.roi,
      required this.multiple,
      required this.daysInvested,
      required this.annualizedReturn,
      final List<PerformanceDataPoint> performanceHistory = const []})
      : _performanceHistory = performanceHistory;

  factory _$InvestmentPerformanceImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvestmentPerformanceImplFromJson(json);

  @override
  final String investmentId;
  @override
  final double irr;
// Internal Rate of Return
  @override
  final double roi;
// Return on Investment
  @override
  final double multiple;
// Investment multiple
  @override
  final int daysInvested;
  @override
  final double annualizedReturn;
  final List<PerformanceDataPoint> _performanceHistory;
  @override
  @JsonKey()
  List<PerformanceDataPoint> get performanceHistory {
    if (_performanceHistory is EqualUnmodifiableListView)
      return _performanceHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_performanceHistory);
  }

  @override
  String toString() {
    return 'InvestmentPerformance(investmentId: $investmentId, irr: $irr, roi: $roi, multiple: $multiple, daysInvested: $daysInvested, annualizedReturn: $annualizedReturn, performanceHistory: $performanceHistory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvestmentPerformanceImpl &&
            (identical(other.investmentId, investmentId) ||
                other.investmentId == investmentId) &&
            (identical(other.irr, irr) || other.irr == irr) &&
            (identical(other.roi, roi) || other.roi == roi) &&
            (identical(other.multiple, multiple) ||
                other.multiple == multiple) &&
            (identical(other.daysInvested, daysInvested) ||
                other.daysInvested == daysInvested) &&
            (identical(other.annualizedReturn, annualizedReturn) ||
                other.annualizedReturn == annualizedReturn) &&
            const DeepCollectionEquality()
                .equals(other._performanceHistory, _performanceHistory));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      investmentId,
      irr,
      roi,
      multiple,
      daysInvested,
      annualizedReturn,
      const DeepCollectionEquality().hash(_performanceHistory));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvestmentPerformanceImplCopyWith<_$InvestmentPerformanceImpl>
      get copyWith => __$$InvestmentPerformanceImplCopyWithImpl<
          _$InvestmentPerformanceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InvestmentPerformanceImplToJson(
      this,
    );
  }
}

abstract class _InvestmentPerformance implements InvestmentPerformance {
  const factory _InvestmentPerformance(
          {required final String investmentId,
          required final double irr,
          required final double roi,
          required final double multiple,
          required final int daysInvested,
          required final double annualizedReturn,
          final List<PerformanceDataPoint> performanceHistory}) =
      _$InvestmentPerformanceImpl;

  factory _InvestmentPerformance.fromJson(Map<String, dynamic> json) =
      _$InvestmentPerformanceImpl.fromJson;

  @override
  String get investmentId;
  @override
  double get irr;
  @override // Internal Rate of Return
  double get roi;
  @override // Return on Investment
  double get multiple;
  @override // Investment multiple
  int get daysInvested;
  @override
  double get annualizedReturn;
  @override
  List<PerformanceDataPoint> get performanceHistory;
  @override
  @JsonKey(ignore: true)
  _$$InvestmentPerformanceImplCopyWith<_$InvestmentPerformanceImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PerformanceDataPoint _$PerformanceDataPointFromJson(Map<String, dynamic> json) {
  return _PerformanceDataPoint.fromJson(json);
}

/// @nodoc
mixin _$PerformanceDataPoint {
  DateTime get date => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;
  double get returnAmount => throw _privateConstructorUsedError;
  double get returnPercentage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PerformanceDataPointCopyWith<PerformanceDataPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PerformanceDataPointCopyWith<$Res> {
  factory $PerformanceDataPointCopyWith(PerformanceDataPoint value,
          $Res Function(PerformanceDataPoint) then) =
      _$PerformanceDataPointCopyWithImpl<$Res, PerformanceDataPoint>;
  @useResult
  $Res call(
      {DateTime date,
      double value,
      double returnAmount,
      double returnPercentage});
}

/// @nodoc
class _$PerformanceDataPointCopyWithImpl<$Res,
        $Val extends PerformanceDataPoint>
    implements $PerformanceDataPointCopyWith<$Res> {
  _$PerformanceDataPointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? value = null,
    Object? returnAmount = null,
    Object? returnPercentage = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      returnAmount: null == returnAmount
          ? _value.returnAmount
          : returnAmount // ignore: cast_nullable_to_non_nullable
              as double,
      returnPercentage: null == returnPercentage
          ? _value.returnPercentage
          : returnPercentage // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PerformanceDataPointImplCopyWith<$Res>
    implements $PerformanceDataPointCopyWith<$Res> {
  factory _$$PerformanceDataPointImplCopyWith(_$PerformanceDataPointImpl value,
          $Res Function(_$PerformanceDataPointImpl) then) =
      __$$PerformanceDataPointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime date,
      double value,
      double returnAmount,
      double returnPercentage});
}

/// @nodoc
class __$$PerformanceDataPointImplCopyWithImpl<$Res>
    extends _$PerformanceDataPointCopyWithImpl<$Res, _$PerformanceDataPointImpl>
    implements _$$PerformanceDataPointImplCopyWith<$Res> {
  __$$PerformanceDataPointImplCopyWithImpl(_$PerformanceDataPointImpl _value,
      $Res Function(_$PerformanceDataPointImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? value = null,
    Object? returnAmount = null,
    Object? returnPercentage = null,
  }) {
    return _then(_$PerformanceDataPointImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      returnAmount: null == returnAmount
          ? _value.returnAmount
          : returnAmount // ignore: cast_nullable_to_non_nullable
              as double,
      returnPercentage: null == returnPercentage
          ? _value.returnPercentage
          : returnPercentage // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PerformanceDataPointImpl implements _PerformanceDataPoint {
  const _$PerformanceDataPointImpl(
      {required this.date,
      required this.value,
      required this.returnAmount,
      required this.returnPercentage});

  factory _$PerformanceDataPointImpl.fromJson(Map<String, dynamic> json) =>
      _$$PerformanceDataPointImplFromJson(json);

  @override
  final DateTime date;
  @override
  final double value;
  @override
  final double returnAmount;
  @override
  final double returnPercentage;

  @override
  String toString() {
    return 'PerformanceDataPoint(date: $date, value: $value, returnAmount: $returnAmount, returnPercentage: $returnPercentage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PerformanceDataPointImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.returnAmount, returnAmount) ||
                other.returnAmount == returnAmount) &&
            (identical(other.returnPercentage, returnPercentage) ||
                other.returnPercentage == returnPercentage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, date, value, returnAmount, returnPercentage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PerformanceDataPointImplCopyWith<_$PerformanceDataPointImpl>
      get copyWith =>
          __$$PerformanceDataPointImplCopyWithImpl<_$PerformanceDataPointImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PerformanceDataPointImplToJson(
      this,
    );
  }
}

abstract class _PerformanceDataPoint implements PerformanceDataPoint {
  const factory _PerformanceDataPoint(
      {required final DateTime date,
      required final double value,
      required final double returnAmount,
      required final double returnPercentage}) = _$PerformanceDataPointImpl;

  factory _PerformanceDataPoint.fromJson(Map<String, dynamic> json) =
      _$PerformanceDataPointImpl.fromJson;

  @override
  DateTime get date;
  @override
  double get value;
  @override
  double get returnAmount;
  @override
  double get returnPercentage;
  @override
  @JsonKey(ignore: true)
  _$$PerformanceDataPointImplCopyWith<_$PerformanceDataPointImpl>
      get copyWith => throw _privateConstructorUsedError;
}

InvestmentSearchCriteria _$InvestmentSearchCriteriaFromJson(
    Map<String, dynamic> json) {
  return _InvestmentSearchCriteria.fromJson(json);
}

/// @nodoc
mixin _$InvestmentSearchCriteria {
  String? get query => throw _privateConstructorUsedError;
  List<InvestmentStatus>? get statuses => throw _privateConstructorUsedError;
  List<InvestmentType>? get types => throw _privateConstructorUsedError;
  double? get minAmount => throw _privateConstructorUsedError;
  double? get maxAmount => throw _privateConstructorUsedError;
  DateTime? get fromDate => throw _privateConstructorUsedError;
  DateTime? get toDate => throw _privateConstructorUsedError;
  String? get projectCategory => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;
  InvestmentSortBy? get sortBy => throw _privateConstructorUsedError;
  SortOrder? get sortOrder => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InvestmentSearchCriteriaCopyWith<InvestmentSearchCriteria> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvestmentSearchCriteriaCopyWith<$Res> {
  factory $InvestmentSearchCriteriaCopyWith(InvestmentSearchCriteria value,
          $Res Function(InvestmentSearchCriteria) then) =
      _$InvestmentSearchCriteriaCopyWithImpl<$Res, InvestmentSearchCriteria>;
  @useResult
  $Res call(
      {String? query,
      List<InvestmentStatus>? statuses,
      List<InvestmentType>? types,
      double? minAmount,
      double? maxAmount,
      DateTime? fromDate,
      DateTime? toDate,
      String? projectCategory,
      String? currency,
      InvestmentSortBy? sortBy,
      SortOrder? sortOrder});
}

/// @nodoc
class _$InvestmentSearchCriteriaCopyWithImpl<$Res,
        $Val extends InvestmentSearchCriteria>
    implements $InvestmentSearchCriteriaCopyWith<$Res> {
  _$InvestmentSearchCriteriaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = freezed,
    Object? statuses = freezed,
    Object? types = freezed,
    Object? minAmount = freezed,
    Object? maxAmount = freezed,
    Object? fromDate = freezed,
    Object? toDate = freezed,
    Object? projectCategory = freezed,
    Object? currency = freezed,
    Object? sortBy = freezed,
    Object? sortOrder = freezed,
  }) {
    return _then(_value.copyWith(
      query: freezed == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
      statuses: freezed == statuses
          ? _value.statuses
          : statuses // ignore: cast_nullable_to_non_nullable
              as List<InvestmentStatus>?,
      types: freezed == types
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<InvestmentType>?,
      minAmount: freezed == minAmount
          ? _value.minAmount
          : minAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      maxAmount: freezed == maxAmount
          ? _value.maxAmount
          : maxAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      fromDate: freezed == fromDate
          ? _value.fromDate
          : fromDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      toDate: freezed == toDate
          ? _value.toDate
          : toDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      projectCategory: freezed == projectCategory
          ? _value.projectCategory
          : projectCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      sortBy: freezed == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as InvestmentSortBy?,
      sortOrder: freezed == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as SortOrder?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InvestmentSearchCriteriaImplCopyWith<$Res>
    implements $InvestmentSearchCriteriaCopyWith<$Res> {
  factory _$$InvestmentSearchCriteriaImplCopyWith(
          _$InvestmentSearchCriteriaImpl value,
          $Res Function(_$InvestmentSearchCriteriaImpl) then) =
      __$$InvestmentSearchCriteriaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? query,
      List<InvestmentStatus>? statuses,
      List<InvestmentType>? types,
      double? minAmount,
      double? maxAmount,
      DateTime? fromDate,
      DateTime? toDate,
      String? projectCategory,
      String? currency,
      InvestmentSortBy? sortBy,
      SortOrder? sortOrder});
}

/// @nodoc
class __$$InvestmentSearchCriteriaImplCopyWithImpl<$Res>
    extends _$InvestmentSearchCriteriaCopyWithImpl<$Res,
        _$InvestmentSearchCriteriaImpl>
    implements _$$InvestmentSearchCriteriaImplCopyWith<$Res> {
  __$$InvestmentSearchCriteriaImplCopyWithImpl(
      _$InvestmentSearchCriteriaImpl _value,
      $Res Function(_$InvestmentSearchCriteriaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = freezed,
    Object? statuses = freezed,
    Object? types = freezed,
    Object? minAmount = freezed,
    Object? maxAmount = freezed,
    Object? fromDate = freezed,
    Object? toDate = freezed,
    Object? projectCategory = freezed,
    Object? currency = freezed,
    Object? sortBy = freezed,
    Object? sortOrder = freezed,
  }) {
    return _then(_$InvestmentSearchCriteriaImpl(
      query: freezed == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
      statuses: freezed == statuses
          ? _value._statuses
          : statuses // ignore: cast_nullable_to_non_nullable
              as List<InvestmentStatus>?,
      types: freezed == types
          ? _value._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<InvestmentType>?,
      minAmount: freezed == minAmount
          ? _value.minAmount
          : minAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      maxAmount: freezed == maxAmount
          ? _value.maxAmount
          : maxAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      fromDate: freezed == fromDate
          ? _value.fromDate
          : fromDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      toDate: freezed == toDate
          ? _value.toDate
          : toDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      projectCategory: freezed == projectCategory
          ? _value.projectCategory
          : projectCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      sortBy: freezed == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as InvestmentSortBy?,
      sortOrder: freezed == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as SortOrder?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InvestmentSearchCriteriaImpl implements _InvestmentSearchCriteria {
  const _$InvestmentSearchCriteriaImpl(
      {this.query,
      final List<InvestmentStatus>? statuses,
      final List<InvestmentType>? types,
      this.minAmount,
      this.maxAmount,
      this.fromDate,
      this.toDate,
      this.projectCategory,
      this.currency,
      this.sortBy,
      this.sortOrder})
      : _statuses = statuses,
        _types = types;

  factory _$InvestmentSearchCriteriaImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvestmentSearchCriteriaImplFromJson(json);

  @override
  final String? query;
  final List<InvestmentStatus>? _statuses;
  @override
  List<InvestmentStatus>? get statuses {
    final value = _statuses;
    if (value == null) return null;
    if (_statuses is EqualUnmodifiableListView) return _statuses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<InvestmentType>? _types;
  @override
  List<InvestmentType>? get types {
    final value = _types;
    if (value == null) return null;
    if (_types is EqualUnmodifiableListView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final double? minAmount;
  @override
  final double? maxAmount;
  @override
  final DateTime? fromDate;
  @override
  final DateTime? toDate;
  @override
  final String? projectCategory;
  @override
  final String? currency;
  @override
  final InvestmentSortBy? sortBy;
  @override
  final SortOrder? sortOrder;

  @override
  String toString() {
    return 'InvestmentSearchCriteria(query: $query, statuses: $statuses, types: $types, minAmount: $minAmount, maxAmount: $maxAmount, fromDate: $fromDate, toDate: $toDate, projectCategory: $projectCategory, currency: $currency, sortBy: $sortBy, sortOrder: $sortOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvestmentSearchCriteriaImpl &&
            (identical(other.query, query) || other.query == query) &&
            const DeepCollectionEquality().equals(other._statuses, _statuses) &&
            const DeepCollectionEquality().equals(other._types, _types) &&
            (identical(other.minAmount, minAmount) ||
                other.minAmount == minAmount) &&
            (identical(other.maxAmount, maxAmount) ||
                other.maxAmount == maxAmount) &&
            (identical(other.fromDate, fromDate) ||
                other.fromDate == fromDate) &&
            (identical(other.toDate, toDate) || other.toDate == toDate) &&
            (identical(other.projectCategory, projectCategory) ||
                other.projectCategory == projectCategory) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.sortBy, sortBy) || other.sortBy == sortBy) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      query,
      const DeepCollectionEquality().hash(_statuses),
      const DeepCollectionEquality().hash(_types),
      minAmount,
      maxAmount,
      fromDate,
      toDate,
      projectCategory,
      currency,
      sortBy,
      sortOrder);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvestmentSearchCriteriaImplCopyWith<_$InvestmentSearchCriteriaImpl>
      get copyWith => __$$InvestmentSearchCriteriaImplCopyWithImpl<
          _$InvestmentSearchCriteriaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InvestmentSearchCriteriaImplToJson(
      this,
    );
  }
}

abstract class _InvestmentSearchCriteria implements InvestmentSearchCriteria {
  const factory _InvestmentSearchCriteria(
      {final String? query,
      final List<InvestmentStatus>? statuses,
      final List<InvestmentType>? types,
      final double? minAmount,
      final double? maxAmount,
      final DateTime? fromDate,
      final DateTime? toDate,
      final String? projectCategory,
      final String? currency,
      final InvestmentSortBy? sortBy,
      final SortOrder? sortOrder}) = _$InvestmentSearchCriteriaImpl;

  factory _InvestmentSearchCriteria.fromJson(Map<String, dynamic> json) =
      _$InvestmentSearchCriteriaImpl.fromJson;

  @override
  String? get query;
  @override
  List<InvestmentStatus>? get statuses;
  @override
  List<InvestmentType>? get types;
  @override
  double? get minAmount;
  @override
  double? get maxAmount;
  @override
  DateTime? get fromDate;
  @override
  DateTime? get toDate;
  @override
  String? get projectCategory;
  @override
  String? get currency;
  @override
  InvestmentSortBy? get sortBy;
  @override
  SortOrder? get sortOrder;
  @override
  @JsonKey(ignore: true)
  _$$InvestmentSearchCriteriaImplCopyWith<_$InvestmentSearchCriteriaImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PerformanceMetric _$PerformanceMetricFromJson(Map<String, dynamic> json) {
  return _PerformanceMetric.fromJson(json);
}

/// @nodoc
mixin _$PerformanceMetric {
  String get id => throw _privateConstructorUsedError;
  String get portfolioId => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  double get totalValue => throw _privateConstructorUsedError;
  double get totalInvested => throw _privateConstructorUsedError;
  double? get totalReturn => throw _privateConstructorUsedError;
  double? get returnPercentage => throw _privateConstructorUsedError;
  double? get benchmarkReturn => throw _privateConstructorUsedError;
  Map<String, double>? get assetAllocation =>
      throw _privateConstructorUsedError;
  Map<String, double>? get categoryAllocation =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PerformanceMetricCopyWith<PerformanceMetric> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PerformanceMetricCopyWith<$Res> {
  factory $PerformanceMetricCopyWith(
          PerformanceMetric value, $Res Function(PerformanceMetric) then) =
      _$PerformanceMetricCopyWithImpl<$Res, PerformanceMetric>;
  @useResult
  $Res call(
      {String id,
      String portfolioId,
      DateTime date,
      double totalValue,
      double totalInvested,
      double? totalReturn,
      double? returnPercentage,
      double? benchmarkReturn,
      Map<String, double>? assetAllocation,
      Map<String, double>? categoryAllocation});
}

/// @nodoc
class _$PerformanceMetricCopyWithImpl<$Res, $Val extends PerformanceMetric>
    implements $PerformanceMetricCopyWith<$Res> {
  _$PerformanceMetricCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? portfolioId = null,
    Object? date = null,
    Object? totalValue = null,
    Object? totalInvested = null,
    Object? totalReturn = freezed,
    Object? returnPercentage = freezed,
    Object? benchmarkReturn = freezed,
    Object? assetAllocation = freezed,
    Object? categoryAllocation = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      portfolioId: null == portfolioId
          ? _value.portfolioId
          : portfolioId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalValue: null == totalValue
          ? _value.totalValue
          : totalValue // ignore: cast_nullable_to_non_nullable
              as double,
      totalInvested: null == totalInvested
          ? _value.totalInvested
          : totalInvested // ignore: cast_nullable_to_non_nullable
              as double,
      totalReturn: freezed == totalReturn
          ? _value.totalReturn
          : totalReturn // ignore: cast_nullable_to_non_nullable
              as double?,
      returnPercentage: freezed == returnPercentage
          ? _value.returnPercentage
          : returnPercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      benchmarkReturn: freezed == benchmarkReturn
          ? _value.benchmarkReturn
          : benchmarkReturn // ignore: cast_nullable_to_non_nullable
              as double?,
      assetAllocation: freezed == assetAllocation
          ? _value.assetAllocation
          : assetAllocation // ignore: cast_nullable_to_non_nullable
              as Map<String, double>?,
      categoryAllocation: freezed == categoryAllocation
          ? _value.categoryAllocation
          : categoryAllocation // ignore: cast_nullable_to_non_nullable
              as Map<String, double>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PerformanceMetricImplCopyWith<$Res>
    implements $PerformanceMetricCopyWith<$Res> {
  factory _$$PerformanceMetricImplCopyWith(_$PerformanceMetricImpl value,
          $Res Function(_$PerformanceMetricImpl) then) =
      __$$PerformanceMetricImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String portfolioId,
      DateTime date,
      double totalValue,
      double totalInvested,
      double? totalReturn,
      double? returnPercentage,
      double? benchmarkReturn,
      Map<String, double>? assetAllocation,
      Map<String, double>? categoryAllocation});
}

/// @nodoc
class __$$PerformanceMetricImplCopyWithImpl<$Res>
    extends _$PerformanceMetricCopyWithImpl<$Res, _$PerformanceMetricImpl>
    implements _$$PerformanceMetricImplCopyWith<$Res> {
  __$$PerformanceMetricImplCopyWithImpl(_$PerformanceMetricImpl _value,
      $Res Function(_$PerformanceMetricImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? portfolioId = null,
    Object? date = null,
    Object? totalValue = null,
    Object? totalInvested = null,
    Object? totalReturn = freezed,
    Object? returnPercentage = freezed,
    Object? benchmarkReturn = freezed,
    Object? assetAllocation = freezed,
    Object? categoryAllocation = freezed,
  }) {
    return _then(_$PerformanceMetricImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      portfolioId: null == portfolioId
          ? _value.portfolioId
          : portfolioId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalValue: null == totalValue
          ? _value.totalValue
          : totalValue // ignore: cast_nullable_to_non_nullable
              as double,
      totalInvested: null == totalInvested
          ? _value.totalInvested
          : totalInvested // ignore: cast_nullable_to_non_nullable
              as double,
      totalReturn: freezed == totalReturn
          ? _value.totalReturn
          : totalReturn // ignore: cast_nullable_to_non_nullable
              as double?,
      returnPercentage: freezed == returnPercentage
          ? _value.returnPercentage
          : returnPercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      benchmarkReturn: freezed == benchmarkReturn
          ? _value.benchmarkReturn
          : benchmarkReturn // ignore: cast_nullable_to_non_nullable
              as double?,
      assetAllocation: freezed == assetAllocation
          ? _value._assetAllocation
          : assetAllocation // ignore: cast_nullable_to_non_nullable
              as Map<String, double>?,
      categoryAllocation: freezed == categoryAllocation
          ? _value._categoryAllocation
          : categoryAllocation // ignore: cast_nullable_to_non_nullable
              as Map<String, double>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PerformanceMetricImpl implements _PerformanceMetric {
  const _$PerformanceMetricImpl(
      {required this.id,
      required this.portfolioId,
      required this.date,
      required this.totalValue,
      required this.totalInvested,
      this.totalReturn,
      this.returnPercentage,
      this.benchmarkReturn,
      final Map<String, double>? assetAllocation,
      final Map<String, double>? categoryAllocation})
      : _assetAllocation = assetAllocation,
        _categoryAllocation = categoryAllocation;

  factory _$PerformanceMetricImpl.fromJson(Map<String, dynamic> json) =>
      _$$PerformanceMetricImplFromJson(json);

  @override
  final String id;
  @override
  final String portfolioId;
  @override
  final DateTime date;
  @override
  final double totalValue;
  @override
  final double totalInvested;
  @override
  final double? totalReturn;
  @override
  final double? returnPercentage;
  @override
  final double? benchmarkReturn;
  final Map<String, double>? _assetAllocation;
  @override
  Map<String, double>? get assetAllocation {
    final value = _assetAllocation;
    if (value == null) return null;
    if (_assetAllocation is EqualUnmodifiableMapView) return _assetAllocation;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, double>? _categoryAllocation;
  @override
  Map<String, double>? get categoryAllocation {
    final value = _categoryAllocation;
    if (value == null) return null;
    if (_categoryAllocation is EqualUnmodifiableMapView)
      return _categoryAllocation;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'PerformanceMetric(id: $id, portfolioId: $portfolioId, date: $date, totalValue: $totalValue, totalInvested: $totalInvested, totalReturn: $totalReturn, returnPercentage: $returnPercentage, benchmarkReturn: $benchmarkReturn, assetAllocation: $assetAllocation, categoryAllocation: $categoryAllocation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PerformanceMetricImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.portfolioId, portfolioId) ||
                other.portfolioId == portfolioId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.totalValue, totalValue) ||
                other.totalValue == totalValue) &&
            (identical(other.totalInvested, totalInvested) ||
                other.totalInvested == totalInvested) &&
            (identical(other.totalReturn, totalReturn) ||
                other.totalReturn == totalReturn) &&
            (identical(other.returnPercentage, returnPercentage) ||
                other.returnPercentage == returnPercentage) &&
            (identical(other.benchmarkReturn, benchmarkReturn) ||
                other.benchmarkReturn == benchmarkReturn) &&
            const DeepCollectionEquality()
                .equals(other._assetAllocation, _assetAllocation) &&
            const DeepCollectionEquality()
                .equals(other._categoryAllocation, _categoryAllocation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      portfolioId,
      date,
      totalValue,
      totalInvested,
      totalReturn,
      returnPercentage,
      benchmarkReturn,
      const DeepCollectionEquality().hash(_assetAllocation),
      const DeepCollectionEquality().hash(_categoryAllocation));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PerformanceMetricImplCopyWith<_$PerformanceMetricImpl> get copyWith =>
      __$$PerformanceMetricImplCopyWithImpl<_$PerformanceMetricImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PerformanceMetricImplToJson(
      this,
    );
  }
}

abstract class _PerformanceMetric implements PerformanceMetric {
  const factory _PerformanceMetric(
      {required final String id,
      required final String portfolioId,
      required final DateTime date,
      required final double totalValue,
      required final double totalInvested,
      final double? totalReturn,
      final double? returnPercentage,
      final double? benchmarkReturn,
      final Map<String, double>? assetAllocation,
      final Map<String, double>? categoryAllocation}) = _$PerformanceMetricImpl;

  factory _PerformanceMetric.fromJson(Map<String, dynamic> json) =
      _$PerformanceMetricImpl.fromJson;

  @override
  String get id;
  @override
  String get portfolioId;
  @override
  DateTime get date;
  @override
  double get totalValue;
  @override
  double get totalInvested;
  @override
  double? get totalReturn;
  @override
  double? get returnPercentage;
  @override
  double? get benchmarkReturn;
  @override
  Map<String, double>? get assetAllocation;
  @override
  Map<String, double>? get categoryAllocation;
  @override
  @JsonKey(ignore: true)
  _$$PerformanceMetricImplCopyWith<_$PerformanceMetricImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
