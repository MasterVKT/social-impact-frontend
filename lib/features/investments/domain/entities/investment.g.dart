// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'investment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InvestmentImpl _$$InvestmentImplFromJson(Map<String, dynamic> json) =>
    _$InvestmentImpl(
      id: json['id'] as String,
      investorId: json['investorId'] as String,
      projectId: json['projectId'] as String,
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String,
      investmentDate: DateTime.parse(json['investmentDate'] as String),
      status: $enumDecode(_$InvestmentStatusEnumMap, json['status']),
      type: $enumDecode(_$InvestmentTypeEnumMap, json['type']),
      currentValue: (json['currentValue'] as num?)?.toDouble() ?? 0.0,
      expectedReturn: (json['expectedReturn'] as num?)?.toDouble() ?? 0.0,
      actualReturn: (json['actualReturn'] as num?)?.toDouble() ?? 0.0,
      notes: json['notes'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
      exitDate: json['exitDate'] == null
          ? null
          : DateTime.parse(json['exitDate'] as String),
      transactions: (json['transactions'] as List<dynamic>?)
              ?.map((e) =>
                  InvestmentTransaction.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$InvestmentImplToJson(_$InvestmentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'investorId': instance.investorId,
      'projectId': instance.projectId,
      'amount': instance.amount,
      'currency': instance.currency,
      'investmentDate': instance.investmentDate.toIso8601String(),
      'status': _$InvestmentStatusEnumMap[instance.status]!,
      'type': _$InvestmentTypeEnumMap[instance.type]!,
      'currentValue': instance.currentValue,
      'expectedReturn': instance.expectedReturn,
      'actualReturn': instance.actualReturn,
      'notes': instance.notes,
      'metadata': instance.metadata,
      'exitDate': instance.exitDate?.toIso8601String(),
      'transactions': instance.transactions,
    };

const _$InvestmentStatusEnumMap = {
  InvestmentStatus.pending: 'pending',
  InvestmentStatus.active: 'active',
  InvestmentStatus.completed: 'completed',
  InvestmentStatus.cancelled: 'cancelled',
  InvestmentStatus.defaulted: 'defaulted',
};

const _$InvestmentTypeEnumMap = {
  InvestmentType.equity: 'equity',
  InvestmentType.debt: 'debt',
  InvestmentType.hybrid: 'hybrid',
  InvestmentType.donation: 'donation',
};

_$InvestmentTransactionImpl _$$InvestmentTransactionImplFromJson(
        Map<String, dynamic> json) =>
    _$InvestmentTransactionImpl(
      id: json['id'] as String,
      investmentId: json['investmentId'] as String,
      type: $enumDecode(_$TransactionTypeEnumMap, json['type']),
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String,
      date: DateTime.parse(json['date'] as String),
      status: $enumDecodeNullable(_$TransactionStatusEnumMap, json['status']) ??
          TransactionStatus.completed,
      description: json['description'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$InvestmentTransactionImplToJson(
        _$InvestmentTransactionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'investmentId': instance.investmentId,
      'type': _$TransactionTypeEnumMap[instance.type]!,
      'amount': instance.amount,
      'currency': instance.currency,
      'date': instance.date.toIso8601String(),
      'status': _$TransactionStatusEnumMap[instance.status]!,
      'description': instance.description,
      'metadata': instance.metadata,
    };

const _$TransactionTypeEnumMap = {
  TransactionType.investment: 'investment',
  TransactionType.dividend: 'dividend',
  TransactionType.interest: 'interest',
  TransactionType.repayment: 'repayment',
  TransactionType.fee: 'fee',
  TransactionType.exit: 'exit',
};

const _$TransactionStatusEnumMap = {
  TransactionStatus.pending: 'pending',
  TransactionStatus.processing: 'processing',
  TransactionStatus.completed: 'completed',
  TransactionStatus.failed: 'failed',
  TransactionStatus.cancelled: 'cancelled',
};

_$PortfolioImpl _$$PortfolioImplFromJson(Map<String, dynamic> json) =>
    _$PortfolioImpl(
      userId: json['userId'] as String,
      totalInvested: (json['totalInvested'] as num).toDouble(),
      currentValue: (json['currentValue'] as num).toDouble(),
      totalReturns: (json['totalReturns'] as num).toDouble(),
      returnPercentage: (json['returnPercentage'] as num).toDouble(),
      activeInvestments: (json['activeInvestments'] as num).toInt(),
      completedInvestments: (json['completedInvestments'] as num).toInt(),
      investments: (json['investments'] as List<dynamic>?)
              ?.map((e) => Investment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      allocations: (json['allocations'] as List<dynamic>?)
              ?.map((e) =>
                  PortfolioAllocation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      lastUpdated: json['lastUpdated'] == null
          ? null
          : DateTime.parse(json['lastUpdated'] as String),
    );

Map<String, dynamic> _$$PortfolioImplToJson(_$PortfolioImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'totalInvested': instance.totalInvested,
      'currentValue': instance.currentValue,
      'totalReturns': instance.totalReturns,
      'returnPercentage': instance.returnPercentage,
      'activeInvestments': instance.activeInvestments,
      'completedInvestments': instance.completedInvestments,
      'investments': instance.investments,
      'allocations': instance.allocations,
      'lastUpdated': instance.lastUpdated?.toIso8601String(),
    };

_$PortfolioAllocationImpl _$$PortfolioAllocationImplFromJson(
        Map<String, dynamic> json) =>
    _$PortfolioAllocationImpl(
      category: json['category'] as String,
      amount: (json['amount'] as num).toDouble(),
      percentage: (json['percentage'] as num).toDouble(),
      investmentCount: (json['investmentCount'] as num).toInt(),
    );

Map<String, dynamic> _$$PortfolioAllocationImplToJson(
        _$PortfolioAllocationImpl instance) =>
    <String, dynamic>{
      'category': instance.category,
      'amount': instance.amount,
      'percentage': instance.percentage,
      'investmentCount': instance.investmentCount,
    };

_$InvestmentPerformanceImpl _$$InvestmentPerformanceImplFromJson(
        Map<String, dynamic> json) =>
    _$InvestmentPerformanceImpl(
      investmentId: json['investmentId'] as String,
      irr: (json['irr'] as num).toDouble(),
      roi: (json['roi'] as num).toDouble(),
      multiple: (json['multiple'] as num).toDouble(),
      daysInvested: (json['daysInvested'] as num).toInt(),
      annualizedReturn: (json['annualizedReturn'] as num).toDouble(),
      performanceHistory: (json['performanceHistory'] as List<dynamic>?)
              ?.map((e) =>
                  PerformanceDataPoint.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$InvestmentPerformanceImplToJson(
        _$InvestmentPerformanceImpl instance) =>
    <String, dynamic>{
      'investmentId': instance.investmentId,
      'irr': instance.irr,
      'roi': instance.roi,
      'multiple': instance.multiple,
      'daysInvested': instance.daysInvested,
      'annualizedReturn': instance.annualizedReturn,
      'performanceHistory': instance.performanceHistory,
    };

_$PerformanceDataPointImpl _$$PerformanceDataPointImplFromJson(
        Map<String, dynamic> json) =>
    _$PerformanceDataPointImpl(
      date: DateTime.parse(json['date'] as String),
      value: (json['value'] as num).toDouble(),
      returnAmount: (json['returnAmount'] as num).toDouble(),
      returnPercentage: (json['returnPercentage'] as num).toDouble(),
    );

Map<String, dynamic> _$$PerformanceDataPointImplToJson(
        _$PerformanceDataPointImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'value': instance.value,
      'returnAmount': instance.returnAmount,
      'returnPercentage': instance.returnPercentage,
    };

_$InvestmentSearchCriteriaImpl _$$InvestmentSearchCriteriaImplFromJson(
        Map<String, dynamic> json) =>
    _$InvestmentSearchCriteriaImpl(
      query: json['query'] as String?,
      statuses: (json['statuses'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$InvestmentStatusEnumMap, e))
          .toList(),
      types: (json['types'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$InvestmentTypeEnumMap, e))
          .toList(),
      minAmount: (json['minAmount'] as num?)?.toDouble(),
      maxAmount: (json['maxAmount'] as num?)?.toDouble(),
      fromDate: json['fromDate'] == null
          ? null
          : DateTime.parse(json['fromDate'] as String),
      toDate: json['toDate'] == null
          ? null
          : DateTime.parse(json['toDate'] as String),
      projectCategory: json['projectCategory'] as String?,
      currency: json['currency'] as String?,
      sortBy: $enumDecodeNullable(_$InvestmentSortByEnumMap, json['sortBy']),
      sortOrder: $enumDecodeNullable(_$SortOrderEnumMap, json['sortOrder']),
    );

Map<String, dynamic> _$$InvestmentSearchCriteriaImplToJson(
        _$InvestmentSearchCriteriaImpl instance) =>
    <String, dynamic>{
      'query': instance.query,
      'statuses':
          instance.statuses?.map((e) => _$InvestmentStatusEnumMap[e]!).toList(),
      'types': instance.types?.map((e) => _$InvestmentTypeEnumMap[e]!).toList(),
      'minAmount': instance.minAmount,
      'maxAmount': instance.maxAmount,
      'fromDate': instance.fromDate?.toIso8601String(),
      'toDate': instance.toDate?.toIso8601String(),
      'projectCategory': instance.projectCategory,
      'currency': instance.currency,
      'sortBy': _$InvestmentSortByEnumMap[instance.sortBy],
      'sortOrder': _$SortOrderEnumMap[instance.sortOrder],
    };

const _$InvestmentSortByEnumMap = {
  InvestmentSortBy.date: 'date',
  InvestmentSortBy.amount: 'amount',
  InvestmentSortBy.returns: 'returns',
  InvestmentSortBy.status: 'status',
};

const _$SortOrderEnumMap = {
  SortOrder.ascending: 'ascending',
  SortOrder.descending: 'descending',
};

_$PerformanceMetricImpl _$$PerformanceMetricImplFromJson(
        Map<String, dynamic> json) =>
    _$PerformanceMetricImpl(
      id: json['id'] as String,
      portfolioId: json['portfolioId'] as String,
      date: DateTime.parse(json['date'] as String),
      totalValue: (json['totalValue'] as num).toDouble(),
      totalInvested: (json['totalInvested'] as num).toDouble(),
      totalReturn: (json['totalReturn'] as num?)?.toDouble(),
      returnPercentage: (json['returnPercentage'] as num?)?.toDouble(),
      benchmarkReturn: (json['benchmarkReturn'] as num?)?.toDouble(),
      assetAllocation: (json['assetAllocation'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
      categoryAllocation:
          (json['categoryAllocation'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
    );

Map<String, dynamic> _$$PerformanceMetricImplToJson(
        _$PerformanceMetricImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'portfolioId': instance.portfolioId,
      'date': instance.date.toIso8601String(),
      'totalValue': instance.totalValue,
      'totalInvested': instance.totalInvested,
      'totalReturn': instance.totalReturn,
      'returnPercentage': instance.returnPercentage,
      'benchmarkReturn': instance.benchmarkReturn,
      'assetAllocation': instance.assetAllocation,
      'categoryAllocation': instance.categoryAllocation,
    };
