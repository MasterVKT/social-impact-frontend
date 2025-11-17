// lib/core/services/analytics/analytics_service.dart

import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  AnalyticsService._();
  static final AnalyticsService instance = AnalyticsService._();

  FirebaseAnalytics get _analytics => FirebaseAnalytics.instance;

  Future<void> logViewProfile({required String? viewedUserId, required bool isOwner}) async {
    await _analytics.logEvent(
      name: 'view_profile',
      parameters: {
        'viewed_user_id': viewedUserId ?? 'current',
        'is_owner': isOwner ? 'true' : 'false', // Convert boolean to string for Firebase Analytics
      },
    );
  }

  Future<void> logViewProfileTab({required String tab, required String? viewedUserId}) async {
    await _analytics.logEvent(
      name: 'view_profile_tab',
      parameters: {
        'tab': tab,
        'viewed_user_id': viewedUserId ?? 'current',
      },
    );
  }

  Future<void> logShareProfile({required String? viewedUserId, required String channel}) async {
    await _analytics.logShare(
      contentType: 'profile',
      itemId: viewedUserId ?? 'current',
      method: channel,
    );
  }

  Future<void> logSendMessage({required String toUserId}) async {
    await _analytics.logEvent(
      name: 'send_message',
      parameters: {
        'to_user_id': toUserId,
      },
    );
  }

  Future<void> logReportUser({required String reportedUserId, required String reason}) async {
    await _analytics.logEvent(
      name: 'report_user',
      parameters: {
        'reported_user_id': reportedUserId,
        'reason': reason,
      },
    );
  }

  Future<void> logTogglePreference({required String key, required bool value}) async {
    await _analytics.logEvent(
      name: 'toggle_preference',
      parameters: {
        'key': key,
        'value': value,
      },
    );
  }

  Future<void> logUpdatePreference({required String key, required String value}) async {
    await _analytics.logEvent(
      name: 'update_preference',
      parameters: {
        'key': key,
        'value': value,
      },
    );
  }

  Future<void> logUpdatePhoto({required String userId}) async {
    await _analytics.logEvent(
      name: 'update_profile_photo',
      parameters: {
        'user_id': userId,
      },
    );
  }

  Future<void> logViewInvestmentsPage() async {
    await _analytics.logEvent(
      name: 'view_investments_page',
      parameters: {},
    );
  }

  Future<void> logViewInvestmentsTab({required String tab}) async {
    await _analytics.logEvent(
      name: 'view_investments_tab',
      parameters: {
        'tab': tab,
      },
    );
  }

  Future<void> logFilterContributions({required Map<String, dynamic> filters}) async {
    await _analytics.logEvent(
      name: 'filter_contributions',
      parameters: filters,
    );
  }

  Future<void> logExportContributions({required String format, required int count}) async {
    await _analytics.logEvent(
      name: 'export_contributions',
      parameters: {
        'format': format,
        'count': count,
      },
    );
  }

  Future<void> logDownloadReceipt({required String receiptId, required String contributionId}) async {
    await _analytics.logEvent(
      name: 'download_receipt',
      parameters: {
        'receipt_id': receiptId,
        'contribution_id': contributionId,
      },
    );
  }

  Future<void> logUpdateInvestmentPreferences({required String key, required dynamic value}) async {
    await _analytics.logEvent(
      name: 'update_investment_preferences',
      parameters: {
        'key': key,
        'value': value.toString(),
      },
    );
  }
}
