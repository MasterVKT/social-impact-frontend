// lib/features/investments/data/datasources/investments_firestore_data_source.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../user_profile/domain/entities/user_profile.dart';
import '../../domain/entities/contribution.dart';
import '../../domain/entities/contribution_receipt.dart';
import '../../domain/entities/contribution_filters.dart';

class InvestmentsFirestoreDataSource {
  InvestmentsFirestoreDataSource(this._firestore);

  final FirebaseFirestore _firestore;

  CollectionReference<Map<String, dynamic>> _userContributionsCol(String uid) =>
      _firestore.collection('users').doc(uid).collection('contributions');

  Future<List<Contribution>> getContributions({
    required String uid,
    ContributionFilters? filters,
    int limit = 20,
    DocumentSnapshot? startAfter,
  }) async {
    Query<Map<String, dynamic>> q = _userContributionsCol(uid)
        .orderBy('createdAt', descending: true)
        .limit(limit);

    if (filters != null) {
      if (filters.from != null) {
        q = q.where('createdAt', isGreaterThanOrEqualTo: filters.from);
      }
      if (filters.to != null) {
        q = q.where('createdAt', isLessThanOrEqualTo: filters.to);
      }
      if (filters.statuses != null && filters.statuses!.isNotEmpty) {
        q = q.where('status', whereIn: filters.statuses!.map((e) => e.name).toList());
      }
      if (filters.projectId != null) {
        q = q.where('projectId', isEqualTo: filters.projectId);
      }
      // Montants et searchText à traiter côté client (indexation complexe)
    }

    if (startAfter != null) {
      q = (q as Query<Map<String, dynamic>>).startAfterDocument(startAfter);
    }

    final snap = await q.get();
    return snap.docs.map((d) => _mapContribution(d)).toList();
  }

  Contribution _mapContribution(QueryDocumentSnapshot<Map<String, dynamic>> d) {
    final data = d.data();
    return Contribution(
      id: d.id,
      userId: data['userId']?.toString() ?? '',
      projectId: data['projectId']?.toString() ?? '',
      amountCents: (data['amountCents'] is int)
          ? data['amountCents'] as int
          : (data['amount'] is num) // fallback si montant en euros
              ? (data['amount'] * 100).round()
              : 0,
      currency: data['currency']?.toString() ?? 'EUR',
      status: _parseStatus(data['status']?.toString()),
      createdAt: _toDate(data['createdAt']) ?? DateTime.fromMillisecondsSinceEpoch(0),
      paymentMethod: data['paymentMethod']?.toString(),
      anonymous: data['anonymous'] == true,
      fees: ContributionFees(
        platformCents: (data['fees']?['platform'] ?? 0) is int ? data['fees']['platform'] : 0,
        auditCents: (data['fees']?['audit'] ?? 0) is int ? data['fees']['audit'] : 0,
        stripeCents: (data['fees']?['stripe'] ?? 0) is int ? data['fees']['stripe'] : 0,
      ),
      receiptUrl: data['receiptUrl']?.toString(),
      paymentIntentId: data['paymentIntentId']?.toString(),
      stripeClientSecret: data['stripeClientSecret']?.toString(),
    );
  }

  ContributionStatus _parseStatus(String? s) {
    switch (s) {
      case 'confirmed':
        return ContributionStatus.confirmed;
      case 'failed':
        return ContributionStatus.failed;
      case 'refunded':
        return ContributionStatus.refunded;
      default:
        return ContributionStatus.pending;
    }
  }

  DateTime? _toDate(dynamic v) {
    if (v == null) return null;
    if (v is Timestamp) return v.toDate();
    if (v is DateTime) return v;
    return null;
  }

  Future<ContributionReceipt?> getReceipt({required String uid, required String contributionId}) async {
    // Si stocké dans la contribution
    final c = await _userContributionsCol(uid).doc(contributionId).get();
    if (c.exists && (c.data()?['receiptUrl'] != null)) {
      return ContributionReceipt(
        id: 'r_$contributionId',
        contributionId: contributionId,
        userId: uid,
        url: c.data()!['receiptUrl'].toString(),
        createdAt: _toDate(c.data()!['createdAt']) ?? DateTime.now(),
      );
    }
    // Sinon, chercher sous-collection receipts
    final rs = await _firestore.collection('users').doc(uid).collection('receipts').where('contributionId', isEqualTo: contributionId).limit(1).get();
    if (rs.docs.isEmpty) return null;
    final d = rs.docs.first;
    final data = d.data();
    return ContributionReceipt(
      id: d.id,
      contributionId: data['contributionId']?.toString() ?? contributionId,
      userId: uid,
      url: data['url']?.toString() ?? '',
      createdAt: _toDate(data['createdAt']) ?? DateTime.now(),
      kind: data['kind']?.toString() ?? 'contribution',
    );
  }

  Future<UserPortfolioSummary?> getPortfolio({required String uid}) async {
    final doc = await _firestore.collection('user_portfolio').doc(uid).get();
    if (!doc.exists) return null;
    // Mappé côté profil: structure réutilisée
    final data = doc.data()!;
    return UserPortfolioSummary.fromJson({
      'userId': uid,
      'totalInvestment': data['totalInvestment'] ?? 0.0,
      'currentValue': data['currentValue'] ?? 0.0,
      'totalReturn': data['totalReturn'] ?? 0.0,
      'returnPercentage': data['returnPercentage'] ?? 0.0,
      'activeInvestments': data['activeInvestments'] ?? 0,
      'completedInvestments': data['completedInvestments'] ?? 0,
      'topInvestments': (data['topInvestments'] ?? []),
      'investmentCategories': (data['investmentCategories'] ?? []),
      'lastUpdated': data['lastUpdated'],
    });
  }
}
