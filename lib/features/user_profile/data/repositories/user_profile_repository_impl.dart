// lib/features/user_profile/data/repositories/user_profile_repository_impl.dart

import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/user_profile.dart';
import '../../domain/repositories/user_profile_repository.dart';
import '../datasources/user_profile_firestore.dart';
import '../datasources/user_storage_data_source.dart';

class UserProfileRepositoryImpl implements UserProfileRepository {
  UserProfileRepositoryImpl({
    required FirebaseFirestore firestore,
    required Object storage,
  })  : _firestore = firestore,
        _ds = UserProfileFirestoreDataSource(firestore),
        _storage = UserStorageDataSource(storage);

  final FirebaseFirestore _firestore;
  final UserProfileFirestoreDataSource _ds;
  final UserStorageDataSource _storage;

  @override
  Future<UserProfile?> getUserProfile(String uid) => _ds.getUserProfile(uid);

  @override
  Future<void> updateUserProfile(String uid, UserProfile profile) => _ds.updateUserProfile(uid, profile);

  @override
  Future<UserPreferences?> getUserPreferences(String uid) => _ds.getUserPreferences(uid);

  @override
  Future<void> updateUserPreferences(String uid, UserPreferences preferences) => _ds.updateUserPreferences(uid, preferences);

  @override
  Future<UserPortfolioSummary?> getUserPortfolio(String uid) => _ds.getUserPortfolio(uid);

  @override
  Future<({List<UserActivity> items, Object? cursor})> getUserActivities({
    required String uid,
    int limit = 20,
    Object? cursor,
  }) async {
    final res = await _ds.getUserActivities(
      uid: uid,
      limit: limit,
      startAfter: cursor is DocumentSnapshot ? cursor : null,
    );
    return (items: res.items, cursor: res.lastDoc);
  }

  @override
  Future<List<UserAchievement>> getUserAchievements(String uid) => _ds.getUserAchievements(uid);

  @override
  Future<Map<String, dynamic>?> getUserAchievementsStats(String uid) => _ds.getUserAchievementsStats(uid);

  @override
  Future<void> createUserReport({
    required String reporterUid,
    required String reportedUid,
    required String reason,
    String? details,
  }) => _ds.createReport(
        reporterUid: reporterUid,
        reportedUid: reportedUid,
        reason: reason,
        details: details,
      );

  @override
  Future<String> uploadProfileImage({
    required String uid,
    required List<int> bytes,
    String contentType = 'image/jpeg',
  }) async {
    final url = await _storage.uploadProfileImage(
      uid: uid,
      bytes: Uint8List.fromList(bytes),
      contentType: contentType,
    );
    // Update user photoURL
    await _firestore.collection('users').doc(uid).set({'photoURL': url, 'updatedAt': FieldValue.serverTimestamp()}, SetOptions(merge: true));
    return url;
  }

  @override
  Future<void> deleteProfileImage({required String uid}) async {
    await _storage.deleteProfileImage(uid: uid);
    await _firestore.collection('users').doc(uid).set({'photoURL': null, 'updatedAt': FieldValue.serverTimestamp()}, SetOptions(merge: true));
  }

  @override
  Future<String> createMessageThread({required List<String> participants}) async {
    final now = FieldValue.serverTimestamp();
    final doc = await _firestore.collection('messages').add({
      'participants': participants,
      'createdAt': now,
    });
    return doc.id;
  }

  @override
  Future<void> sendMessage({required String threadId, required String senderUid, required String text}) async {
    final itemsCol = _firestore.collection('messages').doc(threadId).collection('items');
    await itemsCol.add({
      'senderUid': senderUid,
      'text': text,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }
}
