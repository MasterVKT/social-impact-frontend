// lib/features/investments/domain/entities/contribution_filters.dart

import 'package:freezed_annotation/freezed_annotation.dart';
import 'contribution.dart';

part 'contribution_filters.freezed.dart';
part 'contribution_filters.g.dart';

@freezed
class ContributionFilters with _$ContributionFilters {
  const factory ContributionFilters({
    DateTime? from,
    DateTime? to,
    List<ContributionStatus>? statuses,
    String? projectId,
    int? minAmountCents,
    int? maxAmountCents,
    String? searchText,
  }) = _ContributionFilters;

  factory ContributionFilters.fromJson(Map<String, dynamic> json) => _$ContributionFiltersFromJson(json);
}
