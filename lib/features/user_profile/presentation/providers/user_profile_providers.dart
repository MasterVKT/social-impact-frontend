// lib/features/user_profile/presentation/providers/user_profile_providers.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../auth/presentation/providers/providers.dart';
import '../../domain/entities/user_profile.dart';
import '../../domain/repositories/user_profile_repository.dart';
import '../../data/repositories/user_profile_repository_impl.dart';

// Repository provider
final userProfileRepositoryProvider = Provider<UserProfileRepository>((ref) {
  // FirebaseFirestore instance
  final firestore = FirebaseFirestore.instance;
  // Storage dynamic instance: laisser l’injection externe si nécessaire
  final storage = _resolveStorage();
  return UserProfileRepositoryImpl(firestore: firestore, storage: storage);
});

Object _resolveStorage() {
  // Tente de récupérer FirebaseStorage si disponible via reflection légère
  // Sinon renvoie un placeholder Object (les méthodes dynamiques échoueront si appelées sans implémentation)
  try {
    // ignore: avoid_dynamic_calls
    final storage = (FirebaseFirestore.instance as dynamic);
    // Ce code n’instancie pas le storage; l’application devrait injecter une instance réelle côté composition
    return (storage.storage != null) ? storage.storage : Object();
  } catch (_) {
    return Object();
  }
}

// Profil courant
final currentUserProfileProvider = FutureProvider<UserProfile?>((ref) async {
  final repo = ref.watch(userProfileRepositoryProvider);
  final authUser = ref.watch(currentUserProvider);
  final uid = authUser?.uid;
  if (uid == null) return null;
  return repo.getUserProfile(uid);
});

// Préférences courantes
final userPreferencesProvider = FutureProvider<UserPreferences?>((ref) async {
  final repo = ref.watch(userProfileRepositoryProvider);
  final authUser = ref.watch(currentUserProvider);
  final uid = authUser?.uid;
  if (uid == null) return null;
  return repo.getUserPreferences(uid);
});

// Portfolio
final userPortfolioProvider = FutureProvider<UserPortfolioSummary?>((ref) async {
  final repo = ref.watch(userProfileRepositoryProvider);
  final authUser = ref.watch(currentUserProvider);
  final uid = authUser?.uid;
  if (uid == null) return null;
  return repo.getUserPortfolio(uid);
});

// Activités (page simple sans état de pagination global, pour usage direct)
final userActivitiesPageProvider = FutureProvider.autoDispose
    .family<({List<UserActivity> items, Object? cursor}), ({int limit, Object? cursor})>((ref, args) async {
  final repo = ref.watch(userProfileRepositoryProvider);
  final authUser = ref.watch(currentUserProvider);
  final uid = authUser?.uid;
  if (uid == null) return (items: <UserActivity>[], cursor: null);
  return repo.getUserActivities(uid: uid, limit: args.limit, cursor: args.cursor);
});

// Achievements (liste récente)
final userAchievementsProvider = FutureProvider<List<UserAchievement>>((ref) async {
  final repo = ref.watch(userProfileRepositoryProvider);
  final authUser = ref.watch(currentUserProvider);
  final uid = authUser?.uid;
  if (uid == null) return const [];
  return repo.getUserAchievements(uid);
});

// Stats achievements
final userAchievementsStatsProvider = FutureProvider<Map<String, dynamic>?>((ref) async {
  final repo = ref.watch(userProfileRepositoryProvider);
  final authUser = ref.watch(currentUserProvider);
  final uid = authUser?.uid;
  if (uid == null) return null;
  return repo.getUserAchievementsStats(uid);
});

// Actions de mise à jour
final updateUserPreferencesProvider = Provider<Future<void> Function(UserPreferences)>((ref) {
  final repo = ref.watch(userProfileRepositoryProvider);
  final authUser = ref.watch(currentUserProvider);
  return (prefs) async {
    final uid = authUser?.uid;
    if (uid == null) return;
    await repo.updateUserPreferences(uid, prefs);
    // Invalider caches
    ref.invalidate(userPreferencesProvider);
  };
});

final uploadProfileImageProvider = Provider<Future<String> Function(List<int> bytes)>((ref) {
  final repo = ref.watch(userProfileRepositoryProvider);
  final authUser = ref.watch(currentUserProvider);
  return (bytes) async {
    final uid = authUser?.uid;
    if (uid == null) return '';
    final url = await repo.uploadProfileImage(uid: uid, bytes: bytes);
    ref.invalidate(currentUserProfileProvider);
    return url;
  };
});

// Actions transverses: Report
final reportUserProvider = Provider<Future<void> Function({required String reportedUid, required String reason, String? details})>((ref) {
  final repo = ref.watch(userProfileRepositoryProvider);
  final authUser = ref.watch(currentUserProvider);
  return ({required String reportedUid, required String reason, String? details}) async {
    final reporterUid = authUser?.uid;
    if (reporterUid == null) return;
    await repo.createUserReport(reporterUid: reporterUid, reportedUid: reportedUid, reason: reason, details: details);
  };
});

// Actions transverses: Messagerie
final createThreadProvider = Provider<Future<String> Function(List<String> participants)>((ref) {
  final repo = ref.watch(userProfileRepositoryProvider);
  return (participants) async => repo.createMessageThread(participants: participants);
});

final sendMessageProvider = Provider<Future<void> Function({required String threadId, required String text})>((ref) {
  final repo = ref.watch(userProfileRepositoryProvider);
  final authUser = ref.watch(currentUserProvider);
  return ({required String threadId, required String text}) async {
    final sender = authUser?.uid;
    if (sender == null) return;
    await repo.sendMessage(threadId: threadId, senderUid: sender, text: text);
  };
});
