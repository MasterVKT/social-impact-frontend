import 'package:freezed_annotation/freezed_annotation.dart';

part 'investment.freezed.dart';
part 'investment.g.dart';

/// Investment entity representing a user's investment in a project
@freezed
class Investment with _$Investment {
  const factory Investment({
    required String id,
    required String investorId,
    required String projectId,
    required double amount,
    required String currency,
    required DateTime investmentDate,
    required InvestmentStatus status,
    required InvestmentType type,
    @Default(0.0) double currentValue,
    @Default(0.0) double expectedReturn,
    @Default(0.0) double actualReturn,
    String? notes,
    Map<String, dynamic>? metadata,
    DateTime? exitDate,
    @Default([]) List<InvestmentTransaction> transactions,
  }) = _Investment;

  factory Investment.fromJson(Map<String, dynamic> json) =>
      _$InvestmentFromJson(json);
}

/// Investment status enum
enum InvestmentStatus {
  pending,
  active,
  completed,
  cancelled,
  defaulted;

  String get displayName {
    switch (this) {
      case InvestmentStatus.pending:
        return 'Pending';
      case InvestmentStatus.active:
        return 'Active';
      case InvestmentStatus.completed:
        return 'Completed';
      case InvestmentStatus.cancelled:
        return 'Cancelled';
      case InvestmentStatus.defaulted:
        return 'Defaulted';
    }
  }
}

/// Investment type enum
enum InvestmentType {
  equity,
  debt,
  hybrid,
  donation;

  String get displayName {
    switch (this) {
      case InvestmentType.equity:
        return 'Equity';
      case InvestmentType.debt:
        return 'Debt';
      case InvestmentType.hybrid:
        return 'Hybrid';
      case InvestmentType.donation:
        return 'Donation';
    }
  }
}

/// Investment transaction representing cash flows
@freezed
class InvestmentTransaction with _$InvestmentTransaction {
  const factory InvestmentTransaction({
    required String id,
    required String investmentId,
    required TransactionType type,
    required double amount,
    required String currency,
    required DateTime date,
    @Default(TransactionStatus.completed) TransactionStatus status,
    String? description,
    Map<String, dynamic>? metadata,
  }) = _InvestmentTransaction;

  factory InvestmentTransaction.fromJson(Map<String, dynamic> json) =>
      _$InvestmentTransactionFromJson(json);
}

/// Transaction type enum
enum TransactionType {
  investment,
  dividend,
  interest,
  repayment,
  fee,
  exit;

  String get displayName {
    switch (this) {
      case TransactionType.investment:
        return 'Investment';
      case TransactionType.dividend:
        return 'Dividend';
      case TransactionType.interest:
        return 'Interest';
      case TransactionType.repayment:
        return 'Repayment';
      case TransactionType.fee:
        return 'Fee';
      case TransactionType.exit:
        return 'Exit';
    }
  }
}

/// Transaction status enum
enum TransactionStatus {
  pending,
  processing,
  completed,
  failed,
  cancelled;

  String get displayName {
    switch (this) {
      case TransactionStatus.pending:
        return 'Pending';
      case TransactionStatus.processing:
        return 'Processing';
      case TransactionStatus.completed:
        return 'Completed';
      case TransactionStatus.failed:
        return 'Failed';
      case TransactionStatus.cancelled:
        return 'Cancelled';
    }
  }
}

/// Portfolio summary data
@freezed
class Portfolio with _$Portfolio {
  const factory Portfolio({
    required String userId,
    required double totalInvested,
    required double currentValue,
    required double totalReturns,
    required double returnPercentage,
    required int activeInvestments,
    required int completedInvestments,
    @Default([]) List<Investment> investments,
    @Default([]) List<PortfolioAllocation> allocations,
    DateTime? lastUpdated,
  }) = _Portfolio;

  factory Portfolio.fromJson(Map<String, dynamic> json) =>
      _$PortfolioFromJson(json);
}

/// Portfolio allocation by category
@freezed
class PortfolioAllocation with _$PortfolioAllocation {
  const factory PortfolioAllocation({
    required String category,
    required double amount,
    required double percentage,
    required int investmentCount,
  }) = _PortfolioAllocation;

  factory PortfolioAllocation.fromJson(Map<String, dynamic> json) =>
      _$PortfolioAllocationFromJson(json);
}

/// Investment performance metrics
@freezed
class InvestmentPerformance with _$InvestmentPerformance {
  const factory InvestmentPerformance({
    required String investmentId,
    required double irr, // Internal Rate of Return
    required double roi, // Return on Investment
    required double multiple, // Investment multiple
    required int daysInvested,
    required double annualizedReturn,
    @Default([]) List<PerformanceDataPoint> performanceHistory,
  }) = _InvestmentPerformance;

  factory InvestmentPerformance.fromJson(Map<String, dynamic> json) =>
      _$InvestmentPerformanceFromJson(json);
}

/// Performance data point for charts
@freezed
class PerformanceDataPoint with _$PerformanceDataPoint {
  const factory PerformanceDataPoint({
    required DateTime date,
    required double value,
    required double returnAmount,
    required double returnPercentage,
  }) = _PerformanceDataPoint;

  factory PerformanceDataPoint.fromJson(Map<String, dynamic> json) =>
      _$PerformanceDataPointFromJson(json);
}

/// Investment search and filter criteria
@freezed
class InvestmentSearchCriteria with _$InvestmentSearchCriteria {
  const factory InvestmentSearchCriteria({
    String? query,
    List<InvestmentStatus>? statuses,
    List<InvestmentType>? types,
    double? minAmount,
    double? maxAmount,
    DateTime? fromDate,
    DateTime? toDate,
    String? projectCategory,
    String? currency,
    InvestmentSortBy? sortBy,
    SortOrder? sortOrder,
  }) = _InvestmentSearchCriteria;

  factory InvestmentSearchCriteria.fromJson(Map<String, dynamic> json) =>
      _$InvestmentSearchCriteriaFromJson(json);
}

/// Investment sorting options
enum InvestmentSortBy {
  date,
  amount,
  returns,
  status;

  String get displayName {
    switch (this) {
      case InvestmentSortBy.date:
        return 'Date';
      case InvestmentSortBy.amount:
        return 'Amount';
      case InvestmentSortBy.returns:
        return 'Returns';
      case InvestmentSortBy.status:
        return 'Status';
    }
  }
}

/// Sort order enum
enum SortOrder {
  ascending,
  descending;

  String get displayName {
    switch (this) {
      case SortOrder.ascending:
        return 'Ascending';
      case SortOrder.descending:
        return 'Descending';
    }
  }
}

/// Performance metric entity for tracking portfolio/investment performance
@freezed
class PerformanceMetric with _$PerformanceMetric {
  const factory PerformanceMetric({
    required String id,
    required String portfolioId,
    required DateTime date,
    required double totalValue,
    required double totalInvested,
    double? totalReturn,
    double? returnPercentage,
    double? benchmarkReturn,
    Map<String, double>? assetAllocation,
    Map<String, double>? categoryAllocation,
  }) = _PerformanceMetric;

  factory PerformanceMetric.fromJson(Map<String, dynamic> json) =>
      _$PerformanceMetricFromJson(json);
}
