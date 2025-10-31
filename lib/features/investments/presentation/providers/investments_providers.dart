// lib/features/investments/presentation/providers/investments_providers.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/contribution.dart';
import '../../domain/entities/contribution_receipt.dart';
import '../../domain/entities/contribution_filters.dart';
import '../../domain/repositories/investments_repository.dart';
import '../../data/repositories/investments_repository_impl.dart';
import '../../../auth/presentation/providers/providers.dart';
import '../../../user_profile/domain/entities/user_profile.dart';

final investmentsRepositoryProvider = Provider<InvestmentsRepository>((ref) {
  return InvestmentsRepositoryImpl(firestore: FirebaseFirestore.instance);
});

final contributionsProvider = FutureProvider.autoDispose
    .family<List<Contribution>, ContributionFilters?>((ref, filters) async {
  final repo = ref.watch(investmentsRepositoryProvider);
  final auth = ref.watch(currentUserProvider);
  final uid = auth?.uid;
  if (uid == null) return const [];
  return repo.getContributions(uid: uid, filters: filters, limit: 50);
});

final receiptsProvider = FutureProvider.autoDispose
    .family<ContributionReceipt?, String>((ref, contributionId) async {
  final repo = ref.watch(investmentsRepositoryProvider);
  final auth = ref.watch(currentUserProvider);
  final uid = auth?.uid;
  if (uid == null) return null;
  return repo.getReceipt(uid: uid, contributionId: contributionId);
});

final portfolioSummaryProvider = FutureProvider<UserPortfolioSummary?>((ref) async {
  final repo = ref.watch(investmentsRepositoryProvider);
  final auth = ref.watch(currentUserProvider);
  final uid = auth?.uid;
  if (uid == null) return null;
  return repo.getPortfolio(uid: uid);
});

final performanceProvider = FutureProvider.autoDispose
    .family<Map<String, dynamic>, String>((ref, range) async {
  // Calcul simple côté client à partir des contributions
  final contributions = await ref.watch(contributionsProvider(null).future);
  final total = contributions.fold<int>(0, (sum, c) {
    final cents = (c as dynamic).amountCents as int? ?? 0;
    return sum + cents;
  });
  return {
    'kpis': {
      'totalInvestedCents': total,
      'count': contributions.length,
    },
    'series': [],
  };
});
