// lib/features/investments/domain/entities/contribution_receipt.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'contribution_receipt.freezed.dart';
part 'contribution_receipt.g.dart';

@freezed
class ContributionReceipt with _$ContributionReceipt {
  const factory ContributionReceipt({
    required String id,
    required String contributionId,
    required String userId,
    required String url,
    required DateTime createdAt,
    @Default('contribution') String kind,
  }) = _ContributionReceipt;

  factory ContributionReceipt.fromJson(Map<String, dynamic> json) => _$ContributionReceiptFromJson(json);
}
