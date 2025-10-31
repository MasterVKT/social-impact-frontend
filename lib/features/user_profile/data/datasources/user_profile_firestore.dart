
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/user_profile.dart';
import '../mappers/user_profile_mappers.dart';

class UserProfileFirestoreDataSource {
  UserProfileFirestoreDataSource(this._firestore);

  final FirebaseFirestore _firestore;

  CollectionReference<Map<String, dynamic>> get _usersCol => _firestore.collection('users');
  CollectionReference<Map<String, dynamic>> get _portfolioCol => _firestore.collection('user_portfolio');
  CollectionReference<Map<String, dynamic>> get _achievementsCol => _firestore.collection('user_achievements');
  CollectionReference<Map<String, dynamic>> get _reportsCol => _firestore.collection('reports');
  CollectionReference<Map<String, dynamic>> get _messagesCol => _firestore.collection('messages');

  Future<UserProfile?> getUserProfile(String uid) async {
    final doc = await _usersCol.doc(uid).get();
    if (!doc.exists) return null;
    return UserProfileFirestore.fromFirestore(doc.id, doc.data()!);
  }

  Future<void> updateUserProfile(String uid, UserProfile profile) async {
    await _usersCol.doc(uid).set(profile.toFirestore(), SetOptions(merge: true));
  }

  Future<UserPreferences?> getUserPreferences(String uid) async {
    final doc = await _usersCol.doc(uid).get();
    if (!doc.exists) return null;
    final data = doc.data()!;
    if (data['preferences'] is Map<String, dynamic>) {
      return UserPreferencesFirestore.fromFirestore(uid, data['preferences'] as Map<String, dynamic>);
    }
    // Préférences à plat directement sous user (fallback)
    return UserPreferencesFirestore.fromFirestore(uid, data);
  }

  Future<void> updateUserPreferences(String uid, UserPreferences prefs) async {
    await _usersCol.doc(uid).set({
      'preferences': prefs.toFirestore(),
    }, SetOptions(merge: true));
  }

  Future<UserPortfolioSummary?> getUserPortfolio(String uid) async {
    final doc = await _portfolioCol.doc(uid).get();
    if (!doc.exists) return null;
    return UserPortfolioSummaryFirestore.fromFirestore(uid, doc.data()!);
  }

  Future<void> upsertUserPortfolio(String uid, UserPortfolioSummary summary) async {
    await _portfolioCol.doc(uid).set(summary.toFirestore(), SetOptions(merge: true));
  }

  Future<({List<UserActivity> items, DocumentSnapshot? lastDoc})> getUserActivities({
    required String uid,
    int limit = 20,
    DocumentSnapshot? startAfter,
  }) async {
    Query<Map<String, dynamic>> query = _usersCol.doc(uid).collection('items').parent! // wrong path safeguard
        as Query<Map<String, dynamic>>;

    // Correct path: user_activities/{uid}/items
    query = _firestore.collection('user_activities').doc(uid).collection('items')
        .orderBy('timestamp', descending: true)
        .limit(limit);

    if (startAfter != null) {
      query = (query as Query<Map<String, dynamic>>).startAfterDocument(startAfter);
    }

    final snap = await query.get();
    final items = snap.docs.map((d) => UserActivityFirestore.fromFirestore(d.id, d.data())).toList();
    final last = snap.docs.isEmpty ? null : snap.docs.last;
    return (items: items, lastDoc: last);
  }

  Future<List<UserAchievement>> getUserAchievements(String uid) async {
    final doc = await _achievementsCol.doc(uid).get();
    if (!doc.exists) return const [];
    final data = doc.data()!;

    final recent = (data['recent'] as List<dynamic>? ?? const [])
        .whereType<Map<String, dynamic>>()
        .toList();

    // Map recent array items (no document IDs inside array → synthesize)
    final items = <UserAchievement>[];
    for (var i = 0; i < recent.length; i++) {
      final map = recent[i];
      items.add(UserAchievementFirestore.fromFirestore(map['id']?.toString() ?? 'ach_$i', {
        'userId': uid,
        ...map,
      }));
    }

    return items;
  }

  Future<Map<String, dynamic>?> getUserAchievementsStats(String uid) async {
    final doc = await _achievementsCol.doc(uid).get();
    if (!doc.exists) return null;
    final data = doc.data()!;
    return data['stats'] is Map<String, dynamic> ? data['stats'] as Map<String, dynamic> : null;
  }

  Future<void> createReport({
    required String reporterUid,
    required String reportedUid,
    required String reason,
    String? details,
  }) async {
    await _reportsCol.add({
      'reporterUid': reporterUid,
      'reportedUid': reportedUid,
      'reason': reason,
      if (details != null) 'details': details,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }
}
