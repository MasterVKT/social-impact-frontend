// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionImpl _$$TransactionImplFromJson(Map<String, dynamic> json) =>
    _$TransactionImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      type: $enumDecode(_$TransactionTypeEnumMap, json['type']),
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      status: $enumDecode(_$TransactionStatusEnumMap, json['status']),
      description: json['description'] as String,
      referenceId: json['referenceId'] as String?,
      projectId: json['projectId'] as String?,
      organizationId: json['organizationId'] as String?,
      paymentMethod: json['paymentMethod'] == null
          ? null
          : PaymentMethod.fromJson(
              json['paymentMethod'] as Map<String, dynamic>),
      metadata: json['metadata'] as Map<String, dynamic>?,
      processedAt: json['processedAt'] == null
          ? null
          : DateTime.parse(json['processedAt'] as String),
      failureReason: json['failureReason'] as String?,
    );

Map<String, dynamic> _$$TransactionImplToJson(_$TransactionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'type': _$TransactionTypeEnumMap[instance.type]!,
      'amount': instance.amount,
      'currency': instance.currency,
      'timestamp': instance.timestamp.toIso8601String(),
      'status': _$TransactionStatusEnumMap[instance.status]!,
      'description': instance.description,
      'referenceId': instance.referenceId,
      'projectId': instance.projectId,
      'organizationId': instance.organizationId,
      'paymentMethod': instance.paymentMethod,
      'metadata': instance.metadata,
      'processedAt': instance.processedAt?.toIso8601String(),
      'failureReason': instance.failureReason,
    };

const _$TransactionTypeEnumMap = {
  TransactionType.investment: 'investment',
  TransactionType.dividend: 'dividend',
  TransactionType.withdrawal: 'withdrawal',
  TransactionType.refund: 'refund',
  TransactionType.fee: 'fee',
  TransactionType.donation: 'donation',
  TransactionType.transfer: 'transfer',
};

const _$TransactionStatusEnumMap = {
  TransactionStatus.pending: 'pending',
  TransactionStatus.processing: 'processing',
  TransactionStatus.completed: 'completed',
  TransactionStatus.failed: 'failed',
  TransactionStatus.cancelled: 'cancelled',
  TransactionStatus.refunded: 'refunded',
};

_$PaymentMethodImpl _$$PaymentMethodImplFromJson(Map<String, dynamic> json) =>
    _$PaymentMethodImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      type: $enumDecode(_$PaymentMethodTypeEnumMap, json['type']),
      displayName: json['displayName'] as String,
      isDefault: json['isDefault'] as bool,
      isActive: json['isActive'] as bool,
      details: json['details'] as Map<String, dynamic>?,
      expiryDate: json['expiryDate'] == null
          ? null
          : DateTime.parse(json['expiryDate'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      lastUsed: json['lastUsed'] == null
          ? null
          : DateTime.parse(json['lastUsed'] as String),
    );

Map<String, dynamic> _$$PaymentMethodImplToJson(_$PaymentMethodImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'type': _$PaymentMethodTypeEnumMap[instance.type]!,
      'displayName': instance.displayName,
      'isDefault': instance.isDefault,
      'isActive': instance.isActive,
      'details': instance.details,
      'expiryDate': instance.expiryDate?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'lastUsed': instance.lastUsed?.toIso8601String(),
    };

const _$PaymentMethodTypeEnumMap = {
  PaymentMethodType.creditCard: 'creditCard',
  PaymentMethodType.debitCard: 'debitCard',
  PaymentMethodType.bankAccount: 'bankAccount',
  PaymentMethodType.digitalWallet: 'digitalWallet',
  PaymentMethodType.cryptocurrency: 'cryptocurrency',
  PaymentMethodType.sepa: 'sepa',
  PaymentMethodType.swift: 'swift',
};

_$InvestmentTransactionDetailsImpl _$$InvestmentTransactionDetailsImplFromJson(
        Map<String, dynamic> json) =>
    _$InvestmentTransactionDetailsImpl(
      investmentId: json['investmentId'] as String,
      projectId: json['projectId'] as String,
      organizationId: json['organizationId'] as String,
      shares: (json['shares'] as num).toDouble(),
      pricePerShare: (json['pricePerShare'] as num).toDouble(),
      investmentType:
          $enumDecode(_$InvestmentTypeEnumMap, json['investmentType']),
      contractTerms: json['contractTerms'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$InvestmentTransactionDetailsImplToJson(
        _$InvestmentTransactionDetailsImpl instance) =>
    <String, dynamic>{
      'investmentId': instance.investmentId,
      'projectId': instance.projectId,
      'organizationId': instance.organizationId,
      'shares': instance.shares,
      'pricePerShare': instance.pricePerShare,
      'investmentType': _$InvestmentTypeEnumMap[instance.investmentType]!,
      'contractTerms': instance.contractTerms,
    };

const _$InvestmentTypeEnumMap = {
  InvestmentType.equity: 'equity',
  InvestmentType.debt: 'debt',
  InvestmentType.hybrid: 'hybrid',
  InvestmentType.donation: 'donation',
};

_$TransactionBatchImpl _$$TransactionBatchImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionBatchImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      transactionIds: (json['transactionIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      status: $enumDecode(_$BatchStatusEnumMap, json['status']),
      createdAt: DateTime.parse(json['createdAt'] as String),
      processedAt: json['processedAt'] == null
          ? null
          : DateTime.parse(json['processedAt'] as String),
      failureReason: json['failureReason'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$TransactionBatchImplToJson(
        _$TransactionBatchImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'transactionIds': instance.transactionIds,
      'status': _$BatchStatusEnumMap[instance.status]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'processedAt': instance.processedAt?.toIso8601String(),
      'failureReason': instance.failureReason,
      'metadata': instance.metadata,
    };

const _$BatchStatusEnumMap = {
  BatchStatus.pending: 'pending',
  BatchStatus.processing: 'processing',
  BatchStatus.completed: 'completed',
  BatchStatus.partiallyFailed: 'partiallyFailed',
  BatchStatus.failed: 'failed',
};

_$TransactionFeeImpl _$$TransactionFeeImplFromJson(Map<String, dynamic> json) =>
    _$TransactionFeeImpl(
      id: json['id'] as String,
      transactionType:
          $enumDecode(_$TransactionTypeEnumMap, json['transactionType']),
      paymentMethodType:
          $enumDecode(_$PaymentMethodTypeEnumMap, json['paymentMethodType']),
      feeType: $enumDecode(_$FeeTypeEnumMap, json['feeType']),
      feeAmount: (json['feeAmount'] as num).toDouble(),
      feePercentage: (json['feePercentage'] as num?)?.toDouble(),
      minimumFee: (json['minimumFee'] as num?)?.toDouble(),
      maximumFee: (json['maximumFee'] as num?)?.toDouble(),
      effectiveFrom: json['effectiveFrom'] == null
          ? null
          : DateTime.parse(json['effectiveFrom'] as String),
      effectiveTo: json['effectiveTo'] == null
          ? null
          : DateTime.parse(json['effectiveTo'] as String),
    );

Map<String, dynamic> _$$TransactionFeeImplToJson(
        _$TransactionFeeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'transactionType': _$TransactionTypeEnumMap[instance.transactionType]!,
      'paymentMethodType':
          _$PaymentMethodTypeEnumMap[instance.paymentMethodType]!,
      'feeType': _$FeeTypeEnumMap[instance.feeType]!,
      'feeAmount': instance.feeAmount,
      'feePercentage': instance.feePercentage,
      'minimumFee': instance.minimumFee,
      'maximumFee': instance.maximumFee,
      'effectiveFrom': instance.effectiveFrom?.toIso8601String(),
      'effectiveTo': instance.effectiveTo?.toIso8601String(),
    };

const _$FeeTypeEnumMap = {
  FeeType.fixed: 'fixed',
  FeeType.percentage: 'percentage',
  FeeType.tiered: 'tiered',
};

_$TransactionSummaryImpl _$$TransactionSummaryImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionSummaryImpl(
      userId: json['userId'] as String,
      currency: json['currency'] as String,
      periodStart: DateTime.parse(json['periodStart'] as String),
      periodEnd: DateTime.parse(json['periodEnd'] as String),
      totalInvestments: (json['totalInvestments'] as num).toDouble(),
      totalWithdrawals: (json['totalWithdrawals'] as num).toDouble(),
      totalDividends: (json['totalDividends'] as num).toDouble(),
      totalFees: (json['totalFees'] as num).toDouble(),
      transactionCount: (json['transactionCount'] as num).toInt(),
      categorySummaries: (json['categorySummaries'] as List<dynamic>?)
              ?.map((e) => TransactionCategorySummary.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$TransactionSummaryImplToJson(
        _$TransactionSummaryImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'currency': instance.currency,
      'periodStart': instance.periodStart.toIso8601String(),
      'periodEnd': instance.periodEnd.toIso8601String(),
      'totalInvestments': instance.totalInvestments,
      'totalWithdrawals': instance.totalWithdrawals,
      'totalDividends': instance.totalDividends,
      'totalFees': instance.totalFees,
      'transactionCount': instance.transactionCount,
      'categorySummaries': instance.categorySummaries,
    };

_$TransactionCategorySummaryImpl _$$TransactionCategorySummaryImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionCategorySummaryImpl(
      type: $enumDecode(_$TransactionTypeEnumMap, json['type']),
      totalAmount: (json['totalAmount'] as num).toDouble(),
      transactionCount: (json['transactionCount'] as num).toInt(),
      averageAmount: (json['averageAmount'] as num).toDouble(),
    );

Map<String, dynamic> _$$TransactionCategorySummaryImplToJson(
        _$TransactionCategorySummaryImpl instance) =>
    <String, dynamic>{
      'type': _$TransactionTypeEnumMap[instance.type]!,
      'totalAmount': instance.totalAmount,
      'transactionCount': instance.transactionCount,
      'averageAmount': instance.averageAmount,
    };

_$WalletImpl _$$WalletImplFromJson(Map<String, dynamic> json) => _$WalletImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      currency: json['currency'] as String,
      balance: (json['balance'] as num).toDouble(),
      availableBalance: (json['availableBalance'] as num).toDouble(),
      pendingBalance: (json['pendingBalance'] as num).toDouble(),
      recentTransactions: (json['recentTransactions'] as List<dynamic>?)
              ?.map(
                  (e) => WalletTransaction.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      lastUpdated: json['lastUpdated'] == null
          ? null
          : DateTime.parse(json['lastUpdated'] as String),
    );

Map<String, dynamic> _$$WalletImplToJson(_$WalletImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'currency': instance.currency,
      'balance': instance.balance,
      'availableBalance': instance.availableBalance,
      'pendingBalance': instance.pendingBalance,
      'recentTransactions': instance.recentTransactions,
      'lastUpdated': instance.lastUpdated?.toIso8601String(),
    };

_$WalletTransactionImpl _$$WalletTransactionImplFromJson(
        Map<String, dynamic> json) =>
    _$WalletTransactionImpl(
      id: json['id'] as String,
      type: $enumDecode(_$TransactionTypeEnumMap, json['type']),
      amount: (json['amount'] as num).toDouble(),
      timestamp: DateTime.parse(json['timestamp'] as String),
      description: json['description'] as String,
      referenceId: json['referenceId'] as String?,
    );

Map<String, dynamic> _$$WalletTransactionImplToJson(
        _$WalletTransactionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$TransactionTypeEnumMap[instance.type]!,
      'amount': instance.amount,
      'timestamp': instance.timestamp.toIso8601String(),
      'description': instance.description,
      'referenceId': instance.referenceId,
    };
