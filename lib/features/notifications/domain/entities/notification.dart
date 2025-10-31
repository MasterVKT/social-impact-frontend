import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';

/// Notification entity for real-time user communications
@freezed
class Notification with _$Notification {
  const factory Notification({
    required String id,
    required String userId,
    required String title,
    required String message,
    required NotificationType type,
    required NotificationPriority priority,
    required NotificationChannel channel,
    required DateTime createdAt,
    required bool isRead,
    required bool isDelivered,
    DateTime? readAt,
    DateTime? expiresAt,
    String? actionUrl,
    String? imageUrl,
    Map<String, dynamic>? data,
    Map<String, dynamic>? metadata,
    String? groupId,
    String? campaignId,
  }) = _Notification;

  factory Notification.fromJson(Map<String, dynamic> json) => 
    _$NotificationFromJson(json);
}

/// Notification type enum
enum NotificationType {
  investment('Investment Update'),
  dividend('Dividend Payment'),
  projectUpdate('Project Update'),
  milestoneAchieved('Milestone Achieved'),
  fundingComplete('Funding Complete'),
  impactReport('Impact Report'),
  compliance('Compliance Alert'),
  security('Security Alert'),
  systemUpdate('System Update'),
  marketing('Marketing Message'),
  reminder('Reminder'),
  welcome('Welcome Message'),
  achievement('Achievement Unlocked'),
  socialUpdate('Social Update');

  const NotificationType(this.displayName);
  final String displayName;
}

/// Notification priority levels
enum NotificationPriority {
  low('Low'),
  medium('Medium'),
  high('High'),
  urgent('Urgent');

  const NotificationPriority(this.displayName);
  final String displayName;
}

/// Notification delivery channels
enum NotificationChannel {
  inApp('In-App'),
  push('Push Notification'),
  email('Email'),
  sms('SMS'),
  webhook('Webhook');

  const NotificationChannel(this.displayName);
  final String displayName;
}

/// Notification preferences for users
@freezed
class NotificationPreferences with _$NotificationPreferences {
  const factory NotificationPreferences({
    required String userId,
    @Default({}) Map<NotificationType, bool> typePreferences,
    @Default({}) Map<NotificationChannel, bool> channelPreferences,
    @Default({}) Map<NotificationPriority, bool> priorityPreferences,
    @Default(true) bool allowMarketing,
    @Default(true) bool allowReminders,
    @Default(QuietHourTime(hour: 9, minute: 0)) QuietHourTime quietHoursStart,
    @Default(QuietHourTime(hour: 22, minute: 0)) QuietHourTime quietHoursEnd,
    @Default([]) List<String> mutedProjects,
    @Default([]) List<String> mutedOrganizations,
    DateTime? updatedAt,
  }) = _NotificationPreferences;

  factory NotificationPreferences.fromJson(Map<String, dynamic> json) => 
    _$NotificationPreferencesFromJson(json);
}

/// Time of day for quiet hours
@freezed
class QuietHourTime with _$QuietHourTime {
  const factory QuietHourTime({
    required int hour,
    required int minute,
  }) = _QuietHourTime;

  factory QuietHourTime.fromJson(Map<String, dynamic> json) => 
    _$QuietHourTimeFromJson(json);
}

/// Notification template for consistent messaging
@freezed
class NotificationTemplate with _$NotificationTemplate {
  const factory NotificationTemplate({
    required String id,
    required String name,
    required NotificationType type,
    required String titleTemplate,
    required String messageTemplate,
    required NotificationPriority defaultPriority,
    @Default([NotificationChannel.inApp]) List<NotificationChannel> defaultChannels,
    @Default({}) Map<String, dynamic> defaultData,
    @Default([]) List<String> requiredVariables,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _NotificationTemplate;

  factory NotificationTemplate.fromJson(Map<String, dynamic> json) => 
    _$NotificationTemplateFromJson(json);
}

/// Notification campaign for bulk messaging
@freezed
class NotificationCampaign with _$NotificationCampaign {
  const factory NotificationCampaign({
    required String id,
    required String name,
    required String description,
    required CampaignType type,
    required CampaignStatus status,
    required DateTime scheduledAt,
    required NotificationTemplate template,
    required Map<String, dynamic> templateVariables,
    @Default([]) List<String> targetUserIds,
    @Default([]) List<UserSegment> targetSegments,
    DateTime? createdAt,
    DateTime? startedAt,
    DateTime? completedAt,
    String? createdBy,
    Map<String, dynamic>? metadata,
  }) = _NotificationCampaign;

  factory NotificationCampaign.fromJson(Map<String, dynamic> json) => 
    _$NotificationCampaignFromJson(json);
}

/// Campaign type enum
enum CampaignType {
  announcement('Announcement'),
  marketing('Marketing'),
  productUpdate('Product Update'),
  reminder('Reminder'),
  seasonal('Seasonal'),
  emergency('Emergency Alert');

  const CampaignType(this.displayName);
  final String displayName;
}

/// Campaign status enum
enum CampaignStatus {
  draft('Draft'),
  scheduled('Scheduled'),
  running('Running'),
  paused('Paused'),
  completed('Completed'),
  cancelled('Cancelled'),
  failed('Failed');

  const CampaignStatus(this.displayName);
  final String displayName;
}

/// User segment for targeted messaging
@freezed
class UserSegment with _$UserSegment {
  const factory UserSegment({
    required String id,
    required String name,
    required String description,
    required SegmentType type,
    required Map<String, dynamic> criteria,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _UserSegment;

  factory UserSegment.fromJson(Map<String, dynamic> json) => 
    _$UserSegmentFromJson(json);
}

/// Segment type enum
enum SegmentType {
  behavioral('Behavioral'),
  demographic('Demographic'),
  geographic('Geographic'),
  psychographic('Psychographic'),
  firmographic('Firmographic'),
  custom('Custom');

  const SegmentType(this.displayName);
  final String displayName;
}

/// Notification analytics for tracking performance
@freezed
class NotificationAnalytics with _$NotificationAnalytics {
  const factory NotificationAnalytics({
    required String notificationId,
    required int delivered,
    required int opened,
    required int clicked,
    required int dismissed,
    required int failed,
    required DateTime periodStart,
    required DateTime periodEnd,
    @Default({}) Map<NotificationChannel, ChannelAnalytics> channelBreakdown,
    @Default({}) Map<String, dynamic> metadata,
  }) = _NotificationAnalytics;

  factory NotificationAnalytics.fromJson(Map<String, dynamic> json) => 
    _$NotificationAnalyticsFromJson(json);
}

/// Channel-specific analytics
@freezed
class ChannelAnalytics with _$ChannelAnalytics {
  const factory ChannelAnalytics({
    required int sent,
    required int delivered,
    required int opened,
    required int clicked,
    required int failed,
    required double deliveryRate,
    required double openRate,
    required double clickThroughRate,
  }) = _ChannelAnalytics;

  factory ChannelAnalytics.fromJson(Map<String, dynamic> json) => 
    _$ChannelAnalyticsFromJson(json);
}

/// Push notification payload
@freezed
class PushNotificationPayload with _$PushNotificationPayload {
  const factory PushNotificationPayload({
    required String title,
    required String body,
    String? icon,
    String? image,
    String? sound,
    String? clickAction,
    @Default({}) Map<String, String> data,
    PushNotificationAndroid? android,
    PushNotificationIOS? ios,
    PushNotificationWeb? web,
  }) = _PushNotificationPayload;

  factory PushNotificationPayload.fromJson(Map<String, dynamic> json) => 
    _$PushNotificationPayloadFromJson(json);
}

/// Android-specific push notification settings
@freezed
class PushNotificationAndroid with _$PushNotificationAndroid {
  const factory PushNotificationAndroid({
    String? channelId,
    String? smallIcon,
    String? color,
    String? tag,
    AndroidNotificationPriority? priority,
    AndroidVisibility? visibility,
    @Default([]) List<AndroidAction> actions,
  }) = _PushNotificationAndroid;

  factory PushNotificationAndroid.fromJson(Map<String, dynamic> json) => 
    _$PushNotificationAndroidFromJson(json);
}

/// Android notification priority
enum AndroidNotificationPriority {
  min('MIN'),
  low('LOW'),
  defaultPriority('DEFAULT'),
  high('HIGH'),
  max('MAX');

  const AndroidNotificationPriority(this.value);
  final String value;
}

/// Android notification visibility
enum AndroidVisibility {
  secret('SECRET'),
  private('PRIVATE'),
  public('PUBLIC');

  const AndroidVisibility(this.value);
  final String value;
}

/// Android notification action
@freezed
class AndroidAction with _$AndroidAction {
  const factory AndroidAction({
    required String title,
    required String action,
    String? icon,
  }) = _AndroidAction;

  factory AndroidAction.fromJson(Map<String, dynamic> json) => 
    _$AndroidActionFromJson(json);
}

/// iOS-specific push notification settings
@freezed
class PushNotificationIOS with _$PushNotificationIOS {
  const factory PushNotificationIOS({
    String? sound,
    int? badge,
    String? category,
    String? threadId,
    @Default({}) Map<String, dynamic> customData,
  }) = _PushNotificationIOS;

  factory PushNotificationIOS.fromJson(Map<String, dynamic> json) => 
    _$PushNotificationIOSFromJson(json);
}

/// Web-specific push notification settings
@freezed
class PushNotificationWeb with _$PushNotificationWeb {
  const factory PushNotificationWeb({
    String? icon,
    String? image,
    String? badge,
    String? tag,
    bool? requireInteraction,
    @Default([]) List<WebAction> actions,
  }) = _PushNotificationWeb;

  factory PushNotificationWeb.fromJson(Map<String, dynamic> json) => 
    _$PushNotificationWebFromJson(json);
}

/// Web notification action
@freezed
class WebAction with _$WebAction {
  const factory WebAction({
    required String action,
    required String title,
    String? icon,
  }) = _WebAction;

  factory WebAction.fromJson(Map<String, dynamic> json) => 
    _$WebActionFromJson(json);
}

/// Email notification content
@freezed
class EmailNotification with _$EmailNotification {
  const factory EmailNotification({
    required String to,
    required String subject,
    required String htmlContent,
    String? textContent,
    String? from,
    String? replyTo,
    @Default([]) List<String> cc,
    @Default([]) List<String> bcc,
    @Default([]) List<EmailAttachment> attachments,
    @Default({}) Map<String, String> headers,
    String? templateId,
    @Default({}) Map<String, dynamic> templateData,
  }) = _EmailNotification;

  factory EmailNotification.fromJson(Map<String, dynamic> json) => 
    _$EmailNotificationFromJson(json);
}

/// Email attachment
@freezed
class EmailAttachment with _$EmailAttachment {
  const factory EmailAttachment({
    required String filename,
    required String content,
    required String contentType,
    String? disposition,
    String? contentId,
  }) = _EmailAttachment;

  factory EmailAttachment.fromJson(Map<String, dynamic> json) => 
    _$EmailAttachmentFromJson(json);
}

/// SMS notification content
@freezed
class SMSNotification with _$SMSNotification {
  const factory SMSNotification({
    required String to,
    required String message,
    String? from,
    String? mediaUrl,
    Map<String, dynamic>? metadata,
  }) = _SMSNotification;

  factory SMSNotification.fromJson(Map<String, dynamic> json) => 
    _$SMSNotificationFromJson(json);
}