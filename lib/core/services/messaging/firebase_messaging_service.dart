import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import '../../utils/platform_detector.dart';

/// Firebase Cloud Messaging service for push notifications
/// Supports Android, iOS, and Web platforms
class FirebaseMessagingService {
  static final FirebaseMessagingService _instance = FirebaseMessagingService._internal();
  factory FirebaseMessagingService() => _instance;
  FirebaseMessagingService._internal();

  static FirebaseMessagingService get instance => _instance;

  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  bool _initialized = false;
  String? _fcmToken;

  /// Initialize Firebase Messaging
  Future<void> initialize() async {
    if (_initialized) return;

    try {
      // Request permissions (iOS/Web)
      if (PlatformDetector.isIOS || PlatformDetector.isWeb) {
        final allowed = await requestPermissions();
        if (!allowed) {
          debugPrint('⚠️ Notification permissions denied');
          return;
        }
      }

      // Get FCM token
      _fcmToken = await getToken();
      if (_fcmToken != null) {
        debugPrint('✅ FCM Token obtained: ${_fcmToken!.substring(0, 20)}...');
      }

      // Listen to token refresh
      _messaging.onTokenRefresh.listen((newToken) {
        debugPrint('🔄 FCM Token refreshed');
        _fcmToken = newToken;
        // Save to Firestore if user logged in
        // TODO: Save token when user logs in
      });

      // Configure foreground notification presentation (iOS/Android)
      await _messaging.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );

      // Handle foreground messages
      FirebaseMessaging.onMessage.listen(_handleForegroundMessage);

      // Handle notification taps
      FirebaseMessaging.onMessageOpenedApp.listen(_handleNotificationTap);

      // Check if app was opened from a notification
      final initialMessage = await _messaging.getInitialMessage();
      if (initialMessage != null) {
        _handleNotificationTap(initialMessage);
      }

      _initialized = true;
      debugPrint('✅ Firebase Messaging initialized');
    } catch (e) {
      debugPrint('❌ Messaging initialization error: $e');
    }
  }

  /// Request notification permissions (iOS/Web)
  Future<bool> requestPermissions() async {
    try {
      final settings = await _messaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
        announcement: false,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
      );

      final granted = settings.authorizationStatus == AuthorizationStatus.authorized ||
          settings.authorizationStatus == AuthorizationStatus.provisional;

      debugPrint('Notification permissions: ${granted ? "granted" : "denied"}');
      return granted;
    } catch (e) {
      debugPrint('❌ Permission request error: $e');
      return false;
    }
  }

  /// Get FCM token
  Future<String?> getToken() async {
    try {
      if (PlatformDetector.isWeb) {
        // Web requires VAPID key
        final vapidKey = kReleaseMode
            ? 'YOUR_VAPID_KEY_PRODUCTION'
            : 'YOUR_VAPID_KEY_DEVELOPMENT';

        return await _messaging.getToken(vapidKey: vapidKey);
      } else {
        return await _messaging.getToken();
      }
    } catch (e) {
      debugPrint('❌ Get token error: $e');
      return null;
    }
  }

  /// Save FCM token to Firestore for a user
  Future<void> saveTokenToFirestore(String userId) async {
    if (_fcmToken == null) {
      debugPrint('⚠️ No FCM token to save');
      return;
    }

    try {
      await _firestore.collection('users').doc(userId).update({
        'fcmToken': _fcmToken,
        'fcmTokenUpdatedAt': FieldValue.serverTimestamp(),
        'platform': PlatformDetector.currentPlatform.name,
      });

      debugPrint('✅ FCM token saved to Firestore for user: $userId');
    } catch (e) {
      debugPrint('❌ Save token error: $e');
    }
  }

  /// Remove FCM token from Firestore (on logout)
  Future<void> removeTokenFromFirestore(String userId) async {
    try {
      await _firestore.collection('users').doc(userId).update({
        'fcmToken': FieldValue.delete(),
        'fcmTokenUpdatedAt': FieldValue.delete(),
      });

      debugPrint('✅ FCM token removed from Firestore');
    } catch (e) {
      debugPrint('❌ Remove token error: $e');
    }
  }

  /// Handle foreground messages
  void _handleForegroundMessage(RemoteMessage message) {
    debugPrint('📬 Foreground message received');
    debugPrint('Title: ${message.notification?.title}');
    debugPrint('Body: ${message.notification?.body}');
    debugPrint('Data: ${message.data}');

    // TODO: Show in-app notification
    // You can use a notification library or custom widget
  }

  /// Handle notification tap (app in background/terminated)
  void _handleNotificationTap(RemoteMessage message) {
    debugPrint('👆 Notification tapped');
    debugPrint('Data: ${message.data}');

    // TODO: Navigate to relevant screen based on data
    final type = message.data['type'] as String?;
    final resourceId = message.data['resourceId'] as String?;

    switch (type) {
      case 'project':
        // Navigate to project detail
        debugPrint('Navigate to project: $resourceId');
        break;
      case 'contribution':
        // Navigate to contribution detail
        debugPrint('Navigate to contribution: $resourceId');
        break;
      case 'milestone':
        // Navigate to milestone detail
        debugPrint('Navigate to milestone: $resourceId');
        break;
      case 'audit':
        // Navigate to audit detail
        debugPrint('Navigate to audit: $resourceId');
        break;
      default:
        debugPrint('Unknown notification type: $type');
    }
  }

  /// Subscribe to a topic
  Future<void> subscribeToTopic(String topic) async {
    try {
      await _messaging.subscribeToTopic(topic);
      debugPrint('✅ Subscribed to topic: $topic');
    } catch (e) {
      debugPrint('❌ Subscribe topic error: $e');
    }
  }

  /// Unsubscribe from a topic
  Future<void> unsubscribeFromTopic(String topic) async {
    try {
      await _messaging.unsubscribeFromTopic(topic);
      debugPrint('✅ Unsubscribed from topic: $topic');
    } catch (e) {
      debugPrint('❌ Unsubscribe topic error: $e');
    }
  }

  /// Subscribe to role-based topic
  Future<void> subscribeToRoleTopic(String role) async {
    final topicMap = {
      'investor': 'investors',
      'organization': 'creators',
      'auditor': 'auditors',
      'admin': 'admins',
    };

    final topic = topicMap[role];
    if (topic != null) {
      await subscribeToTopic(topic);
    }
  }

  /// Subscribe to project updates
  Future<void> subscribeToProject(String projectId) async {
    await subscribeToTopic('project_$projectId');
  }

  /// Unsubscribe from project updates
  Future<void> unsubscribeFromProject(String projectId) async {
    await unsubscribeFromTopic('project_$projectId');
  }

  /// Get current FCM token
  String? get currentToken => _fcmToken;

  /// Check if initialized
  bool get isInitialized => _initialized;
}

/// Background message handler (must be top-level function)
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // Initialize Firebase if needed
  // await Firebase.initializeApp();

  debugPrint('📬 Background message received');
  debugPrint('Title: ${message.notification?.title}');
  debugPrint('Body: ${message.notification?.body}');

  // Handle background message
  // You can save to local storage, show local notification, etc.
}
