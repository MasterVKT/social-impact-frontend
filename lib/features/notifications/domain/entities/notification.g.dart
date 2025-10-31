// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationImpl _$$NotificationImplFromJson(Map<String, dynamic> json) =>
    _$NotificationImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      title: json['title'] as String,
      message: json['message'] as String,
      type: $enumDecode(_$NotificationTypeEnumMap, json['type']),
      priority: $enumDecode(_$NotificationPriorityEnumMap, json['priority']),
      channel: $enumDecode(_$NotificationChannelEnumMap, json['channel']),
      createdAt: DateTime.parse(json['createdAt'] as String),
      isRead: json['isRead'] as bool,
      isDelivered: json['isDelivered'] as bool,
      readAt: json['readAt'] == null
          ? null
          : DateTime.parse(json['readAt'] as String),
      expiresAt: json['expiresAt'] == null
          ? null
          : DateTime.parse(json['expiresAt'] as String),
      actionUrl: json['actionUrl'] as String?,
      imageUrl: json['imageUrl'] as String?,
      data: json['data'] as Map<String, dynamic>?,
      metadata: json['metadata'] as Map<String, dynamic>?,
      groupId: json['groupId'] as String?,
      campaignId: json['campaignId'] as String?,
    );

Map<String, dynamic> _$$NotificationImplToJson(_$NotificationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'title': instance.title,
      'message': instance.message,
      'type': _$NotificationTypeEnumMap[instance.type]!,
      'priority': _$NotificationPriorityEnumMap[instance.priority]!,
      'channel': _$NotificationChannelEnumMap[instance.channel]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'isRead': instance.isRead,
      'isDelivered': instance.isDelivered,
      'readAt': instance.readAt?.toIso8601String(),
      'expiresAt': instance.expiresAt?.toIso8601String(),
      'actionUrl': instance.actionUrl,
      'imageUrl': instance.imageUrl,
      'data': instance.data,
      'metadata': instance.metadata,
      'groupId': instance.groupId,
      'campaignId': instance.campaignId,
    };

const _$NotificationTypeEnumMap = {
  NotificationType.investment: 'investment',
  NotificationType.dividend: 'dividend',
  NotificationType.projectUpdate: 'projectUpdate',
  NotificationType.milestoneAchieved: 'milestoneAchieved',
  NotificationType.fundingComplete: 'fundingComplete',
  NotificationType.impactReport: 'impactReport',
  NotificationType.compliance: 'compliance',
  NotificationType.security: 'security',
  NotificationType.systemUpdate: 'systemUpdate',
  NotificationType.marketing: 'marketing',
  NotificationType.reminder: 'reminder',
  NotificationType.welcome: 'welcome',
  NotificationType.achievement: 'achievement',
  NotificationType.socialUpdate: 'socialUpdate',
};

const _$NotificationPriorityEnumMap = {
  NotificationPriority.low: 'low',
  NotificationPriority.medium: 'medium',
  NotificationPriority.high: 'high',
  NotificationPriority.urgent: 'urgent',
};

const _$NotificationChannelEnumMap = {
  NotificationChannel.inApp: 'inApp',
  NotificationChannel.push: 'push',
  NotificationChannel.email: 'email',
  NotificationChannel.sms: 'sms',
  NotificationChannel.webhook: 'webhook',
};

_$NotificationPreferencesImpl _$$NotificationPreferencesImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationPreferencesImpl(
      userId: json['userId'] as String,
      typePreferences: (json['typePreferences'] as Map<String, dynamic>?)?.map(
            (k, e) =>
                MapEntry($enumDecode(_$NotificationTypeEnumMap, k), e as bool),
          ) ??
          const {},
      channelPreferences:
          (json['channelPreferences'] as Map<String, dynamic>?)?.map(
                (k, e) => MapEntry(
                    $enumDecode(_$NotificationChannelEnumMap, k), e as bool),
              ) ??
              const {},
      priorityPreferences:
          (json['priorityPreferences'] as Map<String, dynamic>?)?.map(
                (k, e) => MapEntry(
                    $enumDecode(_$NotificationPriorityEnumMap, k), e as bool),
              ) ??
              const {},
      allowMarketing: json['allowMarketing'] as bool? ?? true,
      allowReminders: json['allowReminders'] as bool? ?? true,
      quietHoursStart: json['quietHoursStart'] == null
          ? const QuietHourTime(hour: 9, minute: 0)
          : QuietHourTime.fromJson(
              json['quietHoursStart'] as Map<String, dynamic>),
      quietHoursEnd: json['quietHoursEnd'] == null
          ? const QuietHourTime(hour: 22, minute: 0)
          : QuietHourTime.fromJson(
              json['quietHoursEnd'] as Map<String, dynamic>),
      mutedProjects: (json['mutedProjects'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      mutedOrganizations: (json['mutedOrganizations'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$NotificationPreferencesImplToJson(
        _$NotificationPreferencesImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'typePreferences': instance.typePreferences
          .map((k, e) => MapEntry(_$NotificationTypeEnumMap[k]!, e)),
      'channelPreferences': instance.channelPreferences
          .map((k, e) => MapEntry(_$NotificationChannelEnumMap[k]!, e)),
      'priorityPreferences': instance.priorityPreferences
          .map((k, e) => MapEntry(_$NotificationPriorityEnumMap[k]!, e)),
      'allowMarketing': instance.allowMarketing,
      'allowReminders': instance.allowReminders,
      'quietHoursStart': instance.quietHoursStart,
      'quietHoursEnd': instance.quietHoursEnd,
      'mutedProjects': instance.mutedProjects,
      'mutedOrganizations': instance.mutedOrganizations,
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$QuietHourTimeImpl _$$QuietHourTimeImplFromJson(Map<String, dynamic> json) =>
    _$QuietHourTimeImpl(
      hour: (json['hour'] as num).toInt(),
      minute: (json['minute'] as num).toInt(),
    );

Map<String, dynamic> _$$QuietHourTimeImplToJson(_$QuietHourTimeImpl instance) =>
    <String, dynamic>{
      'hour': instance.hour,
      'minute': instance.minute,
    };

_$NotificationTemplateImpl _$$NotificationTemplateImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationTemplateImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      type: $enumDecode(_$NotificationTypeEnumMap, json['type']),
      titleTemplate: json['titleTemplate'] as String,
      messageTemplate: json['messageTemplate'] as String,
      defaultPriority:
          $enumDecode(_$NotificationPriorityEnumMap, json['defaultPriority']),
      defaultChannels: (json['defaultChannels'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$NotificationChannelEnumMap, e))
              .toList() ??
          const [NotificationChannel.inApp],
      defaultData: json['defaultData'] as Map<String, dynamic>? ?? const {},
      requiredVariables: (json['requiredVariables'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      isActive: json['isActive'] as bool?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$NotificationTemplateImplToJson(
        _$NotificationTemplateImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': _$NotificationTypeEnumMap[instance.type]!,
      'titleTemplate': instance.titleTemplate,
      'messageTemplate': instance.messageTemplate,
      'defaultPriority':
          _$NotificationPriorityEnumMap[instance.defaultPriority]!,
      'defaultChannels': instance.defaultChannels
          .map((e) => _$NotificationChannelEnumMap[e]!)
          .toList(),
      'defaultData': instance.defaultData,
      'requiredVariables': instance.requiredVariables,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$NotificationCampaignImpl _$$NotificationCampaignImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationCampaignImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      type: $enumDecode(_$CampaignTypeEnumMap, json['type']),
      status: $enumDecode(_$CampaignStatusEnumMap, json['status']),
      scheduledAt: DateTime.parse(json['scheduledAt'] as String),
      template: NotificationTemplate.fromJson(
          json['template'] as Map<String, dynamic>),
      templateVariables: json['templateVariables'] as Map<String, dynamic>,
      targetUserIds: (json['targetUserIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      targetSegments: (json['targetSegments'] as List<dynamic>?)
              ?.map((e) => UserSegment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      startedAt: json['startedAt'] == null
          ? null
          : DateTime.parse(json['startedAt'] as String),
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
      createdBy: json['createdBy'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$NotificationCampaignImplToJson(
        _$NotificationCampaignImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'type': _$CampaignTypeEnumMap[instance.type]!,
      'status': _$CampaignStatusEnumMap[instance.status]!,
      'scheduledAt': instance.scheduledAt.toIso8601String(),
      'template': instance.template,
      'templateVariables': instance.templateVariables,
      'targetUserIds': instance.targetUserIds,
      'targetSegments': instance.targetSegments,
      'createdAt': instance.createdAt?.toIso8601String(),
      'startedAt': instance.startedAt?.toIso8601String(),
      'completedAt': instance.completedAt?.toIso8601String(),
      'createdBy': instance.createdBy,
      'metadata': instance.metadata,
    };

const _$CampaignTypeEnumMap = {
  CampaignType.announcement: 'announcement',
  CampaignType.marketing: 'marketing',
  CampaignType.productUpdate: 'productUpdate',
  CampaignType.reminder: 'reminder',
  CampaignType.seasonal: 'seasonal',
  CampaignType.emergency: 'emergency',
};

const _$CampaignStatusEnumMap = {
  CampaignStatus.draft: 'draft',
  CampaignStatus.scheduled: 'scheduled',
  CampaignStatus.running: 'running',
  CampaignStatus.paused: 'paused',
  CampaignStatus.completed: 'completed',
  CampaignStatus.cancelled: 'cancelled',
  CampaignStatus.failed: 'failed',
};

_$UserSegmentImpl _$$UserSegmentImplFromJson(Map<String, dynamic> json) =>
    _$UserSegmentImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      type: $enumDecode(_$SegmentTypeEnumMap, json['type']),
      criteria: json['criteria'] as Map<String, dynamic>,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$UserSegmentImplToJson(_$UserSegmentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'type': _$SegmentTypeEnumMap[instance.type]!,
      'criteria': instance.criteria,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

const _$SegmentTypeEnumMap = {
  SegmentType.behavioral: 'behavioral',
  SegmentType.demographic: 'demographic',
  SegmentType.geographic: 'geographic',
  SegmentType.psychographic: 'psychographic',
  SegmentType.firmographic: 'firmographic',
  SegmentType.custom: 'custom',
};

_$NotificationAnalyticsImpl _$$NotificationAnalyticsImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationAnalyticsImpl(
      notificationId: json['notificationId'] as String,
      delivered: (json['delivered'] as num).toInt(),
      opened: (json['opened'] as num).toInt(),
      clicked: (json['clicked'] as num).toInt(),
      dismissed: (json['dismissed'] as num).toInt(),
      failed: (json['failed'] as num).toInt(),
      periodStart: DateTime.parse(json['periodStart'] as String),
      periodEnd: DateTime.parse(json['periodEnd'] as String),
      channelBreakdown:
          (json['channelBreakdown'] as Map<String, dynamic>?)?.map(
                (k, e) => MapEntry($enumDecode(_$NotificationChannelEnumMap, k),
                    ChannelAnalytics.fromJson(e as Map<String, dynamic>)),
              ) ??
              const {},
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$NotificationAnalyticsImplToJson(
        _$NotificationAnalyticsImpl instance) =>
    <String, dynamic>{
      'notificationId': instance.notificationId,
      'delivered': instance.delivered,
      'opened': instance.opened,
      'clicked': instance.clicked,
      'dismissed': instance.dismissed,
      'failed': instance.failed,
      'periodStart': instance.periodStart.toIso8601String(),
      'periodEnd': instance.periodEnd.toIso8601String(),
      'channelBreakdown': instance.channelBreakdown
          .map((k, e) => MapEntry(_$NotificationChannelEnumMap[k]!, e)),
      'metadata': instance.metadata,
    };

_$ChannelAnalyticsImpl _$$ChannelAnalyticsImplFromJson(
        Map<String, dynamic> json) =>
    _$ChannelAnalyticsImpl(
      sent: (json['sent'] as num).toInt(),
      delivered: (json['delivered'] as num).toInt(),
      opened: (json['opened'] as num).toInt(),
      clicked: (json['clicked'] as num).toInt(),
      failed: (json['failed'] as num).toInt(),
      deliveryRate: (json['deliveryRate'] as num).toDouble(),
      openRate: (json['openRate'] as num).toDouble(),
      clickThroughRate: (json['clickThroughRate'] as num).toDouble(),
    );

Map<String, dynamic> _$$ChannelAnalyticsImplToJson(
        _$ChannelAnalyticsImpl instance) =>
    <String, dynamic>{
      'sent': instance.sent,
      'delivered': instance.delivered,
      'opened': instance.opened,
      'clicked': instance.clicked,
      'failed': instance.failed,
      'deliveryRate': instance.deliveryRate,
      'openRate': instance.openRate,
      'clickThroughRate': instance.clickThroughRate,
    };

_$PushNotificationPayloadImpl _$$PushNotificationPayloadImplFromJson(
        Map<String, dynamic> json) =>
    _$PushNotificationPayloadImpl(
      title: json['title'] as String,
      body: json['body'] as String,
      icon: json['icon'] as String?,
      image: json['image'] as String?,
      sound: json['sound'] as String?,
      clickAction: json['clickAction'] as String?,
      data: (json['data'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {},
      android: json['android'] == null
          ? null
          : PushNotificationAndroid.fromJson(
              json['android'] as Map<String, dynamic>),
      ios: json['ios'] == null
          ? null
          : PushNotificationIOS.fromJson(json['ios'] as Map<String, dynamic>),
      web: json['web'] == null
          ? null
          : PushNotificationWeb.fromJson(json['web'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PushNotificationPayloadImplToJson(
        _$PushNotificationPayloadImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
      'icon': instance.icon,
      'image': instance.image,
      'sound': instance.sound,
      'clickAction': instance.clickAction,
      'data': instance.data,
      'android': instance.android,
      'ios': instance.ios,
      'web': instance.web,
    };

_$PushNotificationAndroidImpl _$$PushNotificationAndroidImplFromJson(
        Map<String, dynamic> json) =>
    _$PushNotificationAndroidImpl(
      channelId: json['channelId'] as String?,
      smallIcon: json['smallIcon'] as String?,
      color: json['color'] as String?,
      tag: json['tag'] as String?,
      priority: $enumDecodeNullable(
          _$AndroidNotificationPriorityEnumMap, json['priority']),
      visibility:
          $enumDecodeNullable(_$AndroidVisibilityEnumMap, json['visibility']),
      actions: (json['actions'] as List<dynamic>?)
              ?.map((e) => AndroidAction.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$PushNotificationAndroidImplToJson(
        _$PushNotificationAndroidImpl instance) =>
    <String, dynamic>{
      'channelId': instance.channelId,
      'smallIcon': instance.smallIcon,
      'color': instance.color,
      'tag': instance.tag,
      'priority': _$AndroidNotificationPriorityEnumMap[instance.priority],
      'visibility': _$AndroidVisibilityEnumMap[instance.visibility],
      'actions': instance.actions,
    };

const _$AndroidNotificationPriorityEnumMap = {
  AndroidNotificationPriority.min: 'min',
  AndroidNotificationPriority.low: 'low',
  AndroidNotificationPriority.defaultPriority: 'defaultPriority',
  AndroidNotificationPriority.high: 'high',
  AndroidNotificationPriority.max: 'max',
};

const _$AndroidVisibilityEnumMap = {
  AndroidVisibility.secret: 'secret',
  AndroidVisibility.private: 'private',
  AndroidVisibility.public: 'public',
};

_$AndroidActionImpl _$$AndroidActionImplFromJson(Map<String, dynamic> json) =>
    _$AndroidActionImpl(
      title: json['title'] as String,
      action: json['action'] as String,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$$AndroidActionImplToJson(_$AndroidActionImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'action': instance.action,
      'icon': instance.icon,
    };

_$PushNotificationIOSImpl _$$PushNotificationIOSImplFromJson(
        Map<String, dynamic> json) =>
    _$PushNotificationIOSImpl(
      sound: json['sound'] as String?,
      badge: (json['badge'] as num?)?.toInt(),
      category: json['category'] as String?,
      threadId: json['threadId'] as String?,
      customData: json['customData'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$PushNotificationIOSImplToJson(
        _$PushNotificationIOSImpl instance) =>
    <String, dynamic>{
      'sound': instance.sound,
      'badge': instance.badge,
      'category': instance.category,
      'threadId': instance.threadId,
      'customData': instance.customData,
    };

_$PushNotificationWebImpl _$$PushNotificationWebImplFromJson(
        Map<String, dynamic> json) =>
    _$PushNotificationWebImpl(
      icon: json['icon'] as String?,
      image: json['image'] as String?,
      badge: json['badge'] as String?,
      tag: json['tag'] as String?,
      requireInteraction: json['requireInteraction'] as bool?,
      actions: (json['actions'] as List<dynamic>?)
              ?.map((e) => WebAction.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$PushNotificationWebImplToJson(
        _$PushNotificationWebImpl instance) =>
    <String, dynamic>{
      'icon': instance.icon,
      'image': instance.image,
      'badge': instance.badge,
      'tag': instance.tag,
      'requireInteraction': instance.requireInteraction,
      'actions': instance.actions,
    };

_$WebActionImpl _$$WebActionImplFromJson(Map<String, dynamic> json) =>
    _$WebActionImpl(
      action: json['action'] as String,
      title: json['title'] as String,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$$WebActionImplToJson(_$WebActionImpl instance) =>
    <String, dynamic>{
      'action': instance.action,
      'title': instance.title,
      'icon': instance.icon,
    };

_$EmailNotificationImpl _$$EmailNotificationImplFromJson(
        Map<String, dynamic> json) =>
    _$EmailNotificationImpl(
      to: json['to'] as String,
      subject: json['subject'] as String,
      htmlContent: json['htmlContent'] as String,
      textContent: json['textContent'] as String?,
      from: json['from'] as String?,
      replyTo: json['replyTo'] as String?,
      cc: (json['cc'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
      bcc: (json['bcc'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
      attachments: (json['attachments'] as List<dynamic>?)
              ?.map((e) => EmailAttachment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      headers: (json['headers'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {},
      templateId: json['templateId'] as String?,
      templateData: json['templateData'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$EmailNotificationImplToJson(
        _$EmailNotificationImpl instance) =>
    <String, dynamic>{
      'to': instance.to,
      'subject': instance.subject,
      'htmlContent': instance.htmlContent,
      'textContent': instance.textContent,
      'from': instance.from,
      'replyTo': instance.replyTo,
      'cc': instance.cc,
      'bcc': instance.bcc,
      'attachments': instance.attachments,
      'headers': instance.headers,
      'templateId': instance.templateId,
      'templateData': instance.templateData,
    };

_$EmailAttachmentImpl _$$EmailAttachmentImplFromJson(
        Map<String, dynamic> json) =>
    _$EmailAttachmentImpl(
      filename: json['filename'] as String,
      content: json['content'] as String,
      contentType: json['contentType'] as String,
      disposition: json['disposition'] as String?,
      contentId: json['contentId'] as String?,
    );

Map<String, dynamic> _$$EmailAttachmentImplToJson(
        _$EmailAttachmentImpl instance) =>
    <String, dynamic>{
      'filename': instance.filename,
      'content': instance.content,
      'contentType': instance.contentType,
      'disposition': instance.disposition,
      'contentId': instance.contentId,
    };

_$SMSNotificationImpl _$$SMSNotificationImplFromJson(
        Map<String, dynamic> json) =>
    _$SMSNotificationImpl(
      to: json['to'] as String,
      message: json['message'] as String,
      from: json['from'] as String?,
      mediaUrl: json['mediaUrl'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$SMSNotificationImplToJson(
        _$SMSNotificationImpl instance) =>
    <String, dynamic>{
      'to': instance.to,
      'message': instance.message,
      'from': instance.from,
      'mediaUrl': instance.mediaUrl,
      'metadata': instance.metadata,
    };
