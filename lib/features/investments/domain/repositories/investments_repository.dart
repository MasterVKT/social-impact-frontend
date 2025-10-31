// lib/features/investments/domain/repositories/investments_repository.dart

import '../entities/contribution.dart';
import '../entities/contribution_receipt.dart';
import '../../../user_profile/domain/entities/user_profile.dart';
import '../entities/contribution_filters.dart';

abstract class InvestmentsRepository {
  Future<List<Contribution>> getContributions({
    required String uid,
    ContributionFilters? filters,
    int limit,
    Object? cursor,
  });

  Future<ContributionReceipt?> getReceipt({
    required String uid,
    required String contributionId,
  });

  Future<UserPortfolioSummary?> getPortfolio({
    required String uid,
  });

  Future<Uri?> exportContributionsCSV({
    required String uid,
    ContributionFilters? filters,
  });

  Future<({String clientSecret, String contributionId})> createContribution({
    required String uid,
    required String projectId,
    required int amountCents,
    bool anonymous,
    String? message,
  });

  Future<void> confirmPayment({
    required String paymentIntentId,
    required String clientSecret,
  });
}
