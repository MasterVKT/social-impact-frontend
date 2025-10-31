import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction.freezed.dart';
part 'transaction.g.dart';

/// Financial transaction entity
@freezed
class Transaction with _$Transaction {
  const factory Transaction({
    required String id,
    required String userId,
    required TransactionType type,
    required double amount,
    required String currency,
    required DateTime timestamp,
    required TransactionStatus status,
    required String description,
    String? referenceId,
    String? projectId,
    String? organizationId,
    PaymentMethod? paymentMethod,
    Map<String, dynamic>? metadata,
    DateTime? processedAt,
    String? failureReason,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, dynamic> json) => _$TransactionFromJson(json);
}

/// Transaction type enum
enum TransactionType {
  investment('Investment'),
  dividend('Dividend Payment'),
  withdrawal('Withdrawal'),
  refund('Refund'),
  fee('Platform Fee'),
  donation('Donation'),
  transfer('Transfer');

  const TransactionType(this.displayName);
  final String displayName;
}

/// Transaction status enum
enum TransactionStatus {
  pending('Pending'),
  processing('Processing'),
  completed('Completed'),
  failed('Failed'),
  cancelled('Cancelled'),
  refunded('Refunded');

  const TransactionStatus(this.displayName);
  final String displayName;
}

/// Payment method entity
@freezed
class PaymentMethod with _$PaymentMethod {
  const factory PaymentMethod({
    required String id,
    required String userId,
    required PaymentMethodType type,
    required String displayName,
    required bool isDefault,
    required bool isActive,
    Map<String, dynamic>? details,
    DateTime? expiryDate,
    DateTime? createdAt,
    DateTime? lastUsed,
  }) = _PaymentMethod;

  factory PaymentMethod.fromJson(Map<String, dynamic> json) => _$PaymentMethodFromJson(json);
}

/// Payment method type enum
enum PaymentMethodType {
  creditCard('Credit Card'),
  debitCard('Debit Card'),
  bankAccount('Bank Account'),
  digitalWallet('Digital Wallet'),
  cryptocurrency('Cryptocurrency'),
  sepa('SEPA Transfer'),
  swift('SWIFT Transfer');

  const PaymentMethodType(this.displayName);
  final String displayName;
}

/// Investment transaction details
@freezed
class InvestmentTransactionDetails with _$InvestmentTransactionDetails {
  const factory InvestmentTransactionDetails({
    required String investmentId,
    required String projectId,
    required String organizationId,
    required double shares,
    required double pricePerShare,
    required InvestmentType investmentType,
    Map<String, dynamic>? contractTerms,
  }) = _InvestmentTransactionDetails;

  factory InvestmentTransactionDetails.fromJson(Map<String, dynamic> json) => 
    _$InvestmentTransactionDetailsFromJson(json);
}

/// Investment type enum (referenced from investments domain)
enum InvestmentType {
  equity('Equity'),
  debt('Debt'),
  hybrid('Hybrid'),
  donation('Donation');

  const InvestmentType(this.displayName);
  final String displayName;
}

/// Transaction batch for processing multiple transactions
@freezed
class TransactionBatch with _$TransactionBatch {
  const factory TransactionBatch({
    required String id,
    required String userId,
    required List<String> transactionIds,
    required BatchStatus status,
    required DateTime createdAt,
    DateTime? processedAt,
    String? failureReason,
    Map<String, dynamic>? metadata,
  }) = _TransactionBatch;

  factory TransactionBatch.fromJson(Map<String, dynamic> json) => _$TransactionBatchFromJson(json);
}

/// Batch status enum
enum BatchStatus {
  pending('Pending'),
  processing('Processing'),
  completed('Completed'),
  partiallyFailed('Partially Failed'),
  failed('Failed');

  const BatchStatus(this.displayName);
  final String displayName;
}

/// Transaction fee structure
@freezed
class TransactionFee with _$TransactionFee {
  const factory TransactionFee({
    required String id,
    required TransactionType transactionType,
    required PaymentMethodType paymentMethodType,
    required FeeType feeType,
    required double feeAmount,
    double? feePercentage,
    double? minimumFee,
    double? maximumFee,
    DateTime? effectiveFrom,
    DateTime? effectiveTo,
  }) = _TransactionFee;

  factory TransactionFee.fromJson(Map<String, dynamic> json) => _$TransactionFeeFromJson(json);
}

/// Fee type enum
enum FeeType {
  fixed('Fixed Amount'),
  percentage('Percentage'),
  tiered('Tiered Structure');

  const FeeType(this.displayName);
  final String displayName;
}

/// Transaction summary for reporting
@freezed
class TransactionSummary with _$TransactionSummary {
  const factory TransactionSummary({
    required String userId,
    required String currency,
    required DateTime periodStart,
    required DateTime periodEnd,
    required double totalInvestments,
    required double totalWithdrawals,
    required double totalDividends,
    required double totalFees,
    required int transactionCount,
    @Default([]) List<TransactionCategorySummary> categorySummaries,
  }) = _TransactionSummary;

  factory TransactionSummary.fromJson(Map<String, dynamic> json) => _$TransactionSummaryFromJson(json);
}

/// Transaction category summary
@freezed
class TransactionCategorySummary with _$TransactionCategorySummary {
  const factory TransactionCategorySummary({
    required TransactionType type,
    required double totalAmount,
    required int transactionCount,
    required double averageAmount,
  }) = _TransactionCategorySummary;

  factory TransactionCategorySummary.fromJson(Map<String, dynamic> json) => 
    _$TransactionCategorySummaryFromJson(json);
}

/// Wallet entity for managing user funds
@freezed
class Wallet with _$Wallet {
  const factory Wallet({
    required String id,
    required String userId,
    required String currency,
    required double balance,
    required double availableBalance,
    required double pendingBalance,
    @Default([]) List<WalletTransaction> recentTransactions,
    DateTime? lastUpdated,
  }) = _Wallet;

  factory Wallet.fromJson(Map<String, dynamic> json) => _$WalletFromJson(json);
}

/// Wallet transaction (simplified transaction for wallet operations)
@freezed
class WalletTransaction with _$WalletTransaction {
  const factory WalletTransaction({
    required String id,
    required TransactionType type,
    required double amount,
    required DateTime timestamp,
    required String description,
    String? referenceId,
  }) = _WalletTransaction;

  factory WalletTransaction.fromJson(Map<String, dynamic> json) => _$WalletTransactionFromJson(json);
}