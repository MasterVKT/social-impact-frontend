// lib/features/user_profile/domain/repositories/user_profile_repository.dart

import '../entities/user_profile.dart';

abstract class UserProfileRepository {
  Future<UserProfile?> getUserProfile(String uid);
  Future<void> updateUserProfile(String uid, UserProfile profile);

  Future<UserPreferences?> getUserPreferences(String uid);
  Future<void> updateUserPreferences(String uid, UserPreferences preferences);

  Future<UserPortfolioSummary?> getUserPortfolio(String uid);

  /// Retourne une page d'activités et un curseur pour la pagination
  Future<({List<UserActivity> items, Object? cursor})> getUserActivities({
    required String uid,
    int limit,
    Object? cursor,
  });

  Future<List<UserAchievement>> getUserAchievements(String uid);
  Future<Map<String, dynamic>?> getUserAchievementsStats(String uid);

  Future<void> createUserReport({
    required String reporterUid,
    required String reportedUid,
    required String reason,
    String? details,
  });

  Future<String> uploadProfileImage({
    required String uid,
    required List<int> bytes,
    String contentType,
  });

  Future<void> deleteProfileImage({required String uid});

  // Messagerie minimale
  Future<String> createMessageThread({required List<String> participants});
  Future<void> sendMessage({required String threadId, required String senderUid, required String text});
}
