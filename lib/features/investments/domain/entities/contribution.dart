// lib/features/investments/domain/entities/contribution.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'contribution.freezed.dart';
part 'contribution.g.dart';

enum ContributionStatus {
  pending,
  confirmed,
  failed,
  refunded,
}

@freezed
class Contribution with _$Contribution {
  const factory Contribution({
    required String id,
    required String userId,
    required String projectId,
    required int amountCents,
    @Default('EUR') String currency,
    @Default(ContributionStatus.pending) ContributionStatus status,
    required DateTime createdAt,
    String? paymentMethod, // 'card'|'apple_pay'|'google_pay'
    @Default(false) bool anonymous,
    ContributionFees? fees,
    String? receiptUrl,
    String? paymentIntentId,
    String? stripeClientSecret,
  }) = _Contribution;

  factory Contribution.fromJson(Map<String, dynamic> json) => _$ContributionFromJson(json);
}

@freezed
class ContributionFees with _$ContributionFees {
  const factory ContributionFees({
    @Default(0) int platformCents,
    @Default(0) int auditCents,
    @Default(0) int stripeCents,
  }) = _ContributionFees;

  factory ContributionFees.fromJson(Map<String, dynamic> json) => _$ContributionFeesFromJson(json);
}
