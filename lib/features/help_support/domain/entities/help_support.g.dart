// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'help_support.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HelpArticleImpl _$$HelpArticleImplFromJson(Map<String, dynamic> json) =>
    _$HelpArticleImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      categoryId: json['categoryId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      status: $enumDecodeNullable(_$HelpArticleStatusEnumMap, json['status']) ??
          HelpArticleStatus.published,
      viewCount: (json['viewCount'] as num?)?.toInt() ?? 0,
      helpfulCount: (json['helpfulCount'] as num?)?.toInt() ?? 0,
      notHelpfulCount: (json['notHelpfulCount'] as num?)?.toInt() ?? 0,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      relatedArticleIds: (json['relatedArticleIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      summary: json['summary'] as String?,
      authorId: json['authorId'] as String?,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      estimatedReadingTime:
          (json['estimatedReadingTime'] as num?)?.toInt() ?? 0,
      isFeatured: json['isFeatured'] as bool? ?? false,
      allowComments: json['allowComments'] as bool? ?? false,
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$HelpArticleImplToJson(_$HelpArticleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'categoryId': instance.categoryId,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'status': _$HelpArticleStatusEnumMap[instance.status]!,
      'viewCount': instance.viewCount,
      'helpfulCount': instance.helpfulCount,
      'notHelpfulCount': instance.notHelpfulCount,
      'tags': instance.tags,
      'relatedArticleIds': instance.relatedArticleIds,
      'summary': instance.summary,
      'authorId': instance.authorId,
      'thumbnailUrl': instance.thumbnailUrl,
      'estimatedReadingTime': instance.estimatedReadingTime,
      'isFeatured': instance.isFeatured,
      'allowComments': instance.allowComments,
      'metadata': instance.metadata,
    };

const _$HelpArticleStatusEnumMap = {
  HelpArticleStatus.draft: 'draft',
  HelpArticleStatus.published: 'published',
  HelpArticleStatus.archived: 'archived',
  HelpArticleStatus.underReview: 'underReview',
};

_$HelpCategoryImpl _$$HelpCategoryImplFromJson(Map<String, dynamic> json) =>
    _$HelpCategoryImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      sortOrder: (json['sortOrder'] as num).toInt(),
      articleIds: (json['articleIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      parentCategoryId: json['parentCategoryId'] as String?,
      iconName: json['iconName'] as String?,
      color: json['color'] as String?,
      isVisible: json['isVisible'] as bool? ?? true,
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$HelpCategoryImplToJson(_$HelpCategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'sortOrder': instance.sortOrder,
      'articleIds': instance.articleIds,
      'parentCategoryId': instance.parentCategoryId,
      'iconName': instance.iconName,
      'color': instance.color,
      'isVisible': instance.isVisible,
      'metadata': instance.metadata,
    };

_$SupportTicketImpl _$$SupportTicketImplFromJson(Map<String, dynamic> json) =>
    _$SupportTicketImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      subject: json['subject'] as String,
      description: json['description'] as String,
      priority: $enumDecode(_$TicketPriorityEnumMap, json['priority']),
      status: $enumDecode(_$TicketStatusEnumMap, json['status']),
      category: $enumDecode(_$TicketCategoryEnumMap, json['category']),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      assignedAgentId: json['assignedAgentId'] as String?,
      resolvedAt: json['resolvedAt'] == null
          ? null
          : DateTime.parse(json['resolvedAt'] as String),
      closedAt: json['closedAt'] == null
          ? null
          : DateTime.parse(json['closedAt'] as String),
      attachmentIds: (json['attachmentIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      messages: (json['messages'] as List<dynamic>?)
              ?.map((e) => TicketMessage.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      customFields: (json['customFields'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {},
      resolution: json['resolution'] as String?,
      satisfactionRating: (json['satisfactionRating'] as num?)?.toInt(),
      satisfactionFeedback: json['satisfactionFeedback'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$SupportTicketImplToJson(_$SupportTicketImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'subject': instance.subject,
      'description': instance.description,
      'priority': _$TicketPriorityEnumMap[instance.priority]!,
      'status': _$TicketStatusEnumMap[instance.status]!,
      'category': _$TicketCategoryEnumMap[instance.category]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'assignedAgentId': instance.assignedAgentId,
      'resolvedAt': instance.resolvedAt?.toIso8601String(),
      'closedAt': instance.closedAt?.toIso8601String(),
      'attachmentIds': instance.attachmentIds,
      'messages': instance.messages,
      'customFields': instance.customFields,
      'resolution': instance.resolution,
      'satisfactionRating': instance.satisfactionRating,
      'satisfactionFeedback': instance.satisfactionFeedback,
      'metadata': instance.metadata,
    };

const _$TicketPriorityEnumMap = {
  TicketPriority.low: 'low',
  TicketPriority.medium: 'medium',
  TicketPriority.high: 'high',
  TicketPriority.urgent: 'urgent',
  TicketPriority.critical: 'critical',
};

const _$TicketStatusEnumMap = {
  TicketStatus.open: 'open',
  TicketStatus.inProgress: 'inProgress',
  TicketStatus.pendingCustomer: 'pendingCustomer',
  TicketStatus.resolved: 'resolved',
  TicketStatus.closed: 'closed',
  TicketStatus.reopened: 'reopened',
};

const _$TicketCategoryEnumMap = {
  TicketCategory.technical: 'technical',
  TicketCategory.billing: 'billing',
  TicketCategory.account: 'account',
  TicketCategory.investment: 'investment',
  TicketCategory.general: 'general',
  TicketCategory.feedback: 'feedback',
  TicketCategory.bug: 'bug',
  TicketCategory.featureRequest: 'featureRequest',
};

_$TicketMessageImpl _$$TicketMessageImplFromJson(Map<String, dynamic> json) =>
    _$TicketMessageImpl(
      id: json['id'] as String,
      ticketId: json['ticketId'] as String,
      content: json['content'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      sender: $enumDecode(_$MessageSenderEnumMap, json['sender']),
      senderId: json['senderId'] as String?,
      senderName: json['senderName'] as String?,
      attachmentIds: (json['attachmentIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      isInternal: json['isInternal'] as bool? ?? false,
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$TicketMessageImplToJson(_$TicketMessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ticketId': instance.ticketId,
      'content': instance.content,
      'createdAt': instance.createdAt.toIso8601String(),
      'sender': _$MessageSenderEnumMap[instance.sender]!,
      'senderId': instance.senderId,
      'senderName': instance.senderName,
      'attachmentIds': instance.attachmentIds,
      'isInternal': instance.isInternal,
      'metadata': instance.metadata,
    };

const _$MessageSenderEnumMap = {
  MessageSender.customer: 'customer',
  MessageSender.agent: 'agent',
  MessageSender.system: 'system',
};

_$FAQImpl _$$FAQImplFromJson(Map<String, dynamic> json) => _$FAQImpl(
      id: json['id'] as String,
      question: json['question'] as String,
      answer: json['answer'] as String,
      categoryId: json['categoryId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      viewCount: (json['viewCount'] as num?)?.toInt() ?? 0,
      helpfulCount: (json['helpfulCount'] as num?)?.toInt() ?? 0,
      notHelpfulCount: (json['notHelpfulCount'] as num?)?.toInt() ?? 0,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      relatedFaqIds: (json['relatedFaqIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      sortOrder: (json['sortOrder'] as num?)?.toInt() ?? 0,
      isPublished: json['isPublished'] as bool? ?? true,
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$FAQImplToJson(_$FAQImpl instance) => <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'answer': instance.answer,
      'categoryId': instance.categoryId,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'viewCount': instance.viewCount,
      'helpfulCount': instance.helpfulCount,
      'notHelpfulCount': instance.notHelpfulCount,
      'tags': instance.tags,
      'relatedFaqIds': instance.relatedFaqIds,
      'sortOrder': instance.sortOrder,
      'isPublished': instance.isPublished,
      'metadata': instance.metadata,
    };

_$LiveChatSessionImpl _$$LiveChatSessionImplFromJson(
        Map<String, dynamic> json) =>
    _$LiveChatSessionImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      startedAt: DateTime.parse(json['startedAt'] as String),
      status: $enumDecode(_$ChatSessionStatusEnumMap, json['status']),
      agentId: json['agentId'] as String?,
      agentName: json['agentName'] as String?,
      endedAt: json['endedAt'] == null
          ? null
          : DateTime.parse(json['endedAt'] as String),
      messages: (json['messages'] as List<dynamic>?)
              ?.map((e) => ChatMessage.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      waitTime: (json['waitTime'] as num?)?.toInt() ?? 0,
      satisfactionRating: (json['satisfactionRating'] as num?)?.toInt(),
      satisfactionFeedback: json['satisfactionFeedback'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$LiveChatSessionImplToJson(
        _$LiveChatSessionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'startedAt': instance.startedAt.toIso8601String(),
      'status': _$ChatSessionStatusEnumMap[instance.status]!,
      'agentId': instance.agentId,
      'agentName': instance.agentName,
      'endedAt': instance.endedAt?.toIso8601String(),
      'messages': instance.messages,
      'waitTime': instance.waitTime,
      'satisfactionRating': instance.satisfactionRating,
      'satisfactionFeedback': instance.satisfactionFeedback,
      'metadata': instance.metadata,
    };

const _$ChatSessionStatusEnumMap = {
  ChatSessionStatus.waiting: 'waiting',
  ChatSessionStatus.active: 'active',
  ChatSessionStatus.ended: 'ended',
  ChatSessionStatus.abandoned: 'abandoned',
};

_$ChatMessageImpl _$$ChatMessageImplFromJson(Map<String, dynamic> json) =>
    _$ChatMessageImpl(
      id: json['id'] as String,
      sessionId: json['sessionId'] as String,
      content: json['content'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      sender: $enumDecode(_$MessageSenderEnumMap, json['sender']),
      senderId: json['senderId'] as String?,
      senderName: json['senderName'] as String?,
      type: $enumDecodeNullable(_$MessageTypeEnumMap, json['type']) ??
          MessageType.text,
      attachmentIds: (json['attachmentIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$ChatMessageImplToJson(_$ChatMessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sessionId': instance.sessionId,
      'content': instance.content,
      'timestamp': instance.timestamp.toIso8601String(),
      'sender': _$MessageSenderEnumMap[instance.sender]!,
      'senderId': instance.senderId,
      'senderName': instance.senderName,
      'type': _$MessageTypeEnumMap[instance.type]!,
      'attachmentIds': instance.attachmentIds,
      'metadata': instance.metadata,
    };

const _$MessageTypeEnumMap = {
  MessageType.text: 'text',
  MessageType.image: 'image',
  MessageType.file: 'file',
  MessageType.system: 'system',
  MessageType.quickReply: 'quickReply',
};

_$ContactInfoImpl _$$ContactInfoImplFromJson(Map<String, dynamic> json) =>
    _$ContactInfoImpl(
      email: json['email'] as String? ?? 'support@socialimpact.app',
      phone: json['phone'] as String? ?? '+44 20 7123 4567',
      address:
          json['address'] as String? ?? 'Social Impact Platform, London, UK',
      businessHours: json['businessHours'] as String? ??
          'Monday - Friday: 9:00 AM - 6:00 PM GMT',
      averageResponseTime: (json['averageResponseTime'] as num?)?.toInt() ?? 30,
      socialMedia: (json['socialMedia'] as List<dynamic>?)
              ?.map(
                  (e) => SocialMediaContact.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      emergencyContacts:
          (json['emergencyContacts'] as Map<String, dynamic>?)?.map(
                (k, e) => MapEntry(k, e as String),
              ) ??
              const {},
    );

Map<String, dynamic> _$$ContactInfoImplToJson(_$ContactInfoImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'phone': instance.phone,
      'address': instance.address,
      'businessHours': instance.businessHours,
      'averageResponseTime': instance.averageResponseTime,
      'socialMedia': instance.socialMedia,
      'emergencyContacts': instance.emergencyContacts,
    };

_$SocialMediaContactImpl _$$SocialMediaContactImplFromJson(
        Map<String, dynamic> json) =>
    _$SocialMediaContactImpl(
      platform: json['platform'] as String,
      username: json['username'] as String,
      url: json['url'] as String,
      isActive: json['isActive'] as bool? ?? true,
    );

Map<String, dynamic> _$$SocialMediaContactImplToJson(
        _$SocialMediaContactImpl instance) =>
    <String, dynamic>{
      'platform': instance.platform,
      'username': instance.username,
      'url': instance.url,
      'isActive': instance.isActive,
    };

_$UserFeedbackImpl _$$UserFeedbackImplFromJson(Map<String, dynamic> json) =>
    _$UserFeedbackImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      type: $enumDecode(_$FeedbackTypeEnumMap, json['type']),
      title: json['title'] as String,
      content: json['content'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      status: $enumDecodeNullable(_$FeedbackStatusEnumMap, json['status']) ??
          FeedbackStatus.open,
      categoryId: json['categoryId'] as String?,
      attachmentIds: (json['attachmentIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      adminResponse: json['adminResponse'] as String?,
      respondedAt: json['respondedAt'] == null
          ? null
          : DateTime.parse(json['respondedAt'] as String),
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$UserFeedbackImplToJson(_$UserFeedbackImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'type': _$FeedbackTypeEnumMap[instance.type]!,
      'title': instance.title,
      'content': instance.content,
      'createdAt': instance.createdAt.toIso8601String(),
      'status': _$FeedbackStatusEnumMap[instance.status]!,
      'categoryId': instance.categoryId,
      'attachmentIds': instance.attachmentIds,
      'adminResponse': instance.adminResponse,
      'respondedAt': instance.respondedAt?.toIso8601String(),
      'metadata': instance.metadata,
    };

const _$FeedbackTypeEnumMap = {
  FeedbackType.bug: 'bug',
  FeedbackType.feature: 'feature',
  FeedbackType.improvement: 'improvement',
  FeedbackType.compliment: 'compliment',
  FeedbackType.complaint: 'complaint',
  FeedbackType.other: 'other',
};

const _$FeedbackStatusEnumMap = {
  FeedbackStatus.open: 'open',
  FeedbackStatus.inReview: 'inReview',
  FeedbackStatus.planned: 'planned',
  FeedbackStatus.inProgress: 'inProgress',
  FeedbackStatus.completed: 'completed',
  FeedbackStatus.rejected: 'rejected',
  FeedbackStatus.duplicate: 'duplicate',
};

_$HelpSearchResultImpl _$$HelpSearchResultImplFromJson(
        Map<String, dynamic> json) =>
    _$HelpSearchResultImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      excerpt: json['excerpt'] as String,
      type: $enumDecode(_$HelpResultTypeEnumMap, json['type']),
      relevanceScore: (json['relevanceScore'] as num).toDouble(),
      url: json['url'] as String?,
      categoryName: json['categoryName'] as String?,
      highlightedTerms: (json['highlightedTerms'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$HelpSearchResultImplToJson(
        _$HelpSearchResultImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'excerpt': instance.excerpt,
      'type': _$HelpResultTypeEnumMap[instance.type]!,
      'relevanceScore': instance.relevanceScore,
      'url': instance.url,
      'categoryName': instance.categoryName,
      'highlightedTerms': instance.highlightedTerms,
      'metadata': instance.metadata,
    };

const _$HelpResultTypeEnumMap = {
  HelpResultType.article: 'article',
  HelpResultType.faq: 'faq',
  HelpResultType.video: 'video',
  HelpResultType.tutorial: 'tutorial',
  HelpResultType.guide: 'guide',
};

_$SystemStatusImpl _$$SystemStatusImplFromJson(Map<String, dynamic> json) =>
    _$SystemStatusImpl(
      id: json['id'] as String,
      serviceName: json['serviceName'] as String,
      status: $enumDecode(_$ServiceStatusEnumMap, json['status']),
      lastUpdated: DateTime.parse(json['lastUpdated'] as String),
      statusMessage: json['statusMessage'] as String?,
      recentIncidents: (json['recentIncidents'] as List<dynamic>?)
              ?.map((e) => StatusIncident.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      performanceMetrics:
          (json['performanceMetrics'] as Map<String, dynamic>?)?.map(
                (k, e) => MapEntry(k, (e as num).toDouble()),
              ) ??
              const {},
    );

Map<String, dynamic> _$$SystemStatusImplToJson(_$SystemStatusImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'serviceName': instance.serviceName,
      'status': _$ServiceStatusEnumMap[instance.status]!,
      'lastUpdated': instance.lastUpdated.toIso8601String(),
      'statusMessage': instance.statusMessage,
      'recentIncidents': instance.recentIncidents,
      'performanceMetrics': instance.performanceMetrics,
    };

const _$ServiceStatusEnumMap = {
  ServiceStatus.operational: 'operational',
  ServiceStatus.degradedPerformance: 'degradedPerformance',
  ServiceStatus.partialOutage: 'partialOutage',
  ServiceStatus.majorOutage: 'majorOutage',
  ServiceStatus.maintenance: 'maintenance',
};

_$StatusIncidentImpl _$$StatusIncidentImplFromJson(Map<String, dynamic> json) =>
    _$StatusIncidentImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      status: $enumDecode(_$IncidentStatusEnumMap, json['status']),
      severity: $enumDecode(_$IncidentSeverityEnumMap, json['severity']),
      startedAt: DateTime.parse(json['startedAt'] as String),
      resolvedAt: json['resolvedAt'] == null
          ? null
          : DateTime.parse(json['resolvedAt'] as String),
      affectedServices: (json['affectedServices'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      updates: (json['updates'] as List<dynamic>?)
              ?.map((e) => IncidentUpdate.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$StatusIncidentImplToJson(
        _$StatusIncidentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'status': _$IncidentStatusEnumMap[instance.status]!,
      'severity': _$IncidentSeverityEnumMap[instance.severity]!,
      'startedAt': instance.startedAt.toIso8601String(),
      'resolvedAt': instance.resolvedAt?.toIso8601String(),
      'affectedServices': instance.affectedServices,
      'updates': instance.updates,
    };

const _$IncidentStatusEnumMap = {
  IncidentStatus.investigating: 'investigating',
  IncidentStatus.identified: 'identified',
  IncidentStatus.monitoring: 'monitoring',
  IncidentStatus.resolved: 'resolved',
};

const _$IncidentSeverityEnumMap = {
  IncidentSeverity.minor: 'minor',
  IncidentSeverity.major: 'major',
  IncidentSeverity.critical: 'critical',
};

_$IncidentUpdateImpl _$$IncidentUpdateImplFromJson(Map<String, dynamic> json) =>
    _$IncidentUpdateImpl(
      id: json['id'] as String,
      incidentId: json['incidentId'] as String,
      message: json['message'] as String,
      status: $enumDecode(_$IncidentStatusEnumMap, json['status']),
      timestamp: DateTime.parse(json['timestamp'] as String),
      authorId: json['authorId'] as String?,
    );

Map<String, dynamic> _$$IncidentUpdateImplToJson(
        _$IncidentUpdateImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'incidentId': instance.incidentId,
      'message': instance.message,
      'status': _$IncidentStatusEnumMap[instance.status]!,
      'timestamp': instance.timestamp.toIso8601String(),
      'authorId': instance.authorId,
    };
