// lib/features/investments/data/repositories/investments_repository_impl.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/contribution.dart';
import '../../domain/entities/contribution_receipt.dart';
import '../../domain/entities/contribution_filters.dart';
import '../../domain/repositories/investments_repository.dart';
import '../datasources/investments_firestore_data_source.dart';
import '../../../user_profile/domain/entities/user_profile.dart';

class InvestmentsRepositoryImpl implements InvestmentsRepository {
  InvestmentsRepositoryImpl({required FirebaseFirestore firestore})
      : _ds = InvestmentsFirestoreDataSource(firestore);

  final InvestmentsFirestoreDataSource _ds;

  @override
  Future<List<Contribution>> getContributions({
    required String uid,
    ContributionFilters? filters,
    int limit = 20,
    Object? cursor,
  }) async {
    return _ds.getContributions(
      uid: uid,
      filters: filters,
      limit: limit,
      startAfter: cursor is DocumentSnapshot ? cursor : null,
    );
  }

  @override
  Future<ContributionReceipt?> getReceipt({required String uid, required String contributionId}) {
    return _ds.getReceipt(uid: uid, contributionId: contributionId);
  }

  @override
  Future<UserPortfolioSummary?> getPortfolio({required String uid}) {
    return _ds.getPortfolio(uid: uid);
  }

  @override
  Future<Uri?> exportContributionsCSV({required String uid, ContributionFilters? filters}) async {
    // Placeholder: à implémenter via Cloud Functions (génération CSV et URL)
    return null;
  }

  @override
  Future<({String clientSecret, String contributionId})> createContribution({
    required String uid,
    required String projectId,
    required int amountCents,
    bool anonymous = false,
    String? message,
  }) async {
    // Placeholder: wrap Cloud Functions createContribution
    // Retourne clientSecret + contributionId pour Stripe
    throw UnimplementedError('createContribution not implemented');
  }

  @override
  Future<void> confirmPayment({required String paymentIntentId, required String clientSecret}) async {
    // Placeholder: wrap Cloud Functions confirmPayment
    throw UnimplementedError('confirmPayment not implemented');
  }
}
