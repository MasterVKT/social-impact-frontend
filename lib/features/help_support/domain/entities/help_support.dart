import 'package:freezed_annotation/freezed_annotation.dart';

part 'help_support.freezed.dart';
part 'help_support.g.dart';

/// Help article entity
@freezed
class HelpArticle with _$HelpArticle {
  const factory HelpArticle({
    required String id,
    required String title,
    required String content,
    required String categoryId,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(HelpArticleStatus.published) HelpArticleStatus status,
    @Default(0) int viewCount,
    @Default(0) int helpfulCount,
    @Default(0) int notHelpfulCount,
    @Default([]) List<String> tags,
    @Default([]) List<String> relatedArticleIds,
    String? summary,
    String? authorId,
    String? thumbnailUrl,
    @Default(0) int estimatedReadingTime, // in minutes
    @Default(false) bool isFeatured,
    @Default(false) bool allowComments,
    @Default({}) Map<String, dynamic> metadata,
  }) = _HelpArticle;

  factory HelpArticle.fromJson(Map<String, dynamic> json) => 
    _$HelpArticleFromJson(json);
}

/// Help article status
enum HelpArticleStatus {
  draft('Draft'),
  published('Published'),
  archived('Archived'),
  underReview('Under Review');

  const HelpArticleStatus(this.displayName);
  final String displayName;
}

/// Help category entity
@freezed
class HelpCategory with _$HelpCategory {
  const factory HelpCategory({
    required String id,
    required String name,
    required String description,
    required int sortOrder,
    @Default([]) List<String> articleIds,
    String? parentCategoryId,
    String? iconName,
    String? color,
    @Default(true) bool isVisible,
    @Default({}) Map<String, dynamic> metadata,
  }) = _HelpCategory;

  factory HelpCategory.fromJson(Map<String, dynamic> json) => 
    _$HelpCategoryFromJson(json);
}

/// Support ticket entity
@freezed
class SupportTicket with _$SupportTicket {
  const factory SupportTicket({
    required String id,
    required String userId,
    required String subject,
    required String description,
    required TicketPriority priority,
    required TicketStatus status,
    required TicketCategory category,
    required DateTime createdAt,
    required DateTime updatedAt,
    String? assignedAgentId,
    DateTime? resolvedAt,
    DateTime? closedAt,
    @Default([]) List<String> attachmentIds,
    @Default([]) List<TicketMessage> messages,
    @Default({}) Map<String, String> customFields,
    String? resolution,
    int? satisfactionRating,
    String? satisfactionFeedback,
    @Default({}) Map<String, dynamic> metadata,
  }) = _SupportTicket;

  factory SupportTicket.fromJson(Map<String, dynamic> json) => 
    _$SupportTicketFromJson(json);
}

/// Ticket priority enum
enum TicketPriority {
  low('Low'),
  medium('Medium'),
  high('High'),
  urgent('Urgent'),
  critical('Critical');

  const TicketPriority(this.displayName);
  final String displayName;
}

/// Ticket status enum
enum TicketStatus {
  open('Open'),
  inProgress('In Progress'),
  pendingCustomer('Pending Customer'),
  resolved('Resolved'),
  closed('Closed'),
  reopened('Reopened');

  const TicketStatus(this.displayName);
  final String displayName;
}

/// Ticket category enum
enum TicketCategory {
  technical('Technical Issue'),
  billing('Billing & Payments'),
  account('Account Management'),
  investment('Investment Support'),
  general('General Inquiry'),
  feedback('Feedback & Suggestions'),
  bug('Bug Report'),
  featureRequest('Feature Request');

  const TicketCategory(this.displayName);
  final String displayName;
}

/// Ticket message entity
@freezed
class TicketMessage with _$TicketMessage {
  const factory TicketMessage({
    required String id,
    required String ticketId,
    required String content,
    required DateTime createdAt,
    required MessageSender sender,
    String? senderId,
    String? senderName,
    @Default([]) List<String> attachmentIds,
    @Default(false) bool isInternal,
    @Default({}) Map<String, dynamic> metadata,
  }) = _TicketMessage;

  factory TicketMessage.fromJson(Map<String, dynamic> json) => 
    _$TicketMessageFromJson(json);
}

/// Message sender type
enum MessageSender {
  customer('Customer'),
  agent('Support Agent'),
  system('System');

  const MessageSender(this.displayName);
  final String displayName;
}

/// FAQ entity
@freezed
class FAQ with _$FAQ {
  const factory FAQ({
    required String id,
    required String question,
    required String answer,
    required String categoryId,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(0) int viewCount,
    @Default(0) int helpfulCount,
    @Default(0) int notHelpfulCount,
    @Default([]) List<String> tags,
    @Default([]) List<String> relatedFaqIds,
    @Default(0) int sortOrder,
    @Default(true) bool isPublished,
    @Default({}) Map<String, dynamic> metadata,
  }) = _FAQ;

  factory FAQ.fromJson(Map<String, dynamic> json) => 
    _$FAQFromJson(json);
}

/// Live chat session entity
@freezed
class LiveChatSession with _$LiveChatSession {
  const factory LiveChatSession({
    required String id,
    required String userId,
    required DateTime startedAt,
    required ChatSessionStatus status,
    String? agentId,
    String? agentName,
    DateTime? endedAt,
    @Default([]) List<ChatMessage> messages,
    @Default(0) int waitTime, // in seconds
    int? satisfactionRating,
    String? satisfactionFeedback,
    @Default({}) Map<String, dynamic> metadata,
  }) = _LiveChatSession;

  factory LiveChatSession.fromJson(Map<String, dynamic> json) => 
    _$LiveChatSessionFromJson(json);
}

/// Chat session status
enum ChatSessionStatus {
  waiting('Waiting'),
  active('Active'),
  ended('Ended'),
  abandoned('Abandoned');

  const ChatSessionStatus(this.displayName);
  final String displayName;
}

/// Chat message entity
@freezed
class ChatMessage with _$ChatMessage {
  const factory ChatMessage({
    required String id,
    required String sessionId,
    required String content,
    required DateTime timestamp,
    required MessageSender sender,
    String? senderId,
    String? senderName,
    @Default(MessageType.text) MessageType type,
    @Default([]) List<String> attachmentIds,
    @Default({}) Map<String, dynamic> metadata,
  }) = _ChatMessage;

  factory ChatMessage.fromJson(Map<String, dynamic> json) => 
    _$ChatMessageFromJson(json);
}

/// Message type enum
enum MessageType {
  text('Text'),
  image('Image'),
  file('File'),
  system('System'),
  quickReply('Quick Reply');

  const MessageType(this.displayName);
  final String displayName;
}

/// Contact information entity
@freezed
class ContactInfo with _$ContactInfo {
  const factory ContactInfo({
    @Default('support@socialimpact.app') String email,
    @Default('+44 20 7123 4567') String phone,
    @Default('Social Impact Platform, London, UK') String address,
    @Default('Monday - Friday: 9:00 AM - 6:00 PM GMT') String businessHours,
    @Default(30) int averageResponseTime, // in minutes
    @Default([]) List<SocialMediaContact> socialMedia,
    @Default({}) Map<String, String> emergencyContacts,
  }) = _ContactInfo;

  factory ContactInfo.fromJson(Map<String, dynamic> json) => 
    _$ContactInfoFromJson(json);
}

/// Social media contact
@freezed
class SocialMediaContact with _$SocialMediaContact {
  const factory SocialMediaContact({
    required String platform,
    required String username,
    required String url,
    @Default(true) bool isActive,
  }) = _SocialMediaContact;

  factory SocialMediaContact.fromJson(Map<String, dynamic> json) => 
    _$SocialMediaContactFromJson(json);
}

/// User feedback entity
@freezed
class UserFeedback with _$UserFeedback {
  const factory UserFeedback({
    required String id,
    required String userId,
    required FeedbackType type,
    required String title,
    required String content,
    required DateTime createdAt,
    @Default(FeedbackStatus.open) FeedbackStatus status,
    String? categoryId,
    @Default([]) List<String> attachmentIds,
    String? adminResponse,
    DateTime? respondedAt,
    @Default({}) Map<String, dynamic> metadata,
  }) = _UserFeedback;

  factory UserFeedback.fromJson(Map<String, dynamic> json) => 
    _$UserFeedbackFromJson(json);
}

/// Feedback type enum
enum FeedbackType {
  bug('Bug Report'),
  feature('Feature Request'),
  improvement('Improvement Suggestion'),
  compliment('Compliment'),
  complaint('Complaint'),
  other('Other');

  const FeedbackType(this.displayName);
  final String displayName;
}

/// Feedback status enum
enum FeedbackStatus {
  open('Open'),
  inReview('In Review'),
  planned('Planned'),
  inProgress('In Progress'),
  completed('Completed'),
  rejected('Rejected'),
  duplicate('Duplicate');

  const FeedbackStatus(this.displayName);
  final String displayName;
}

/// Help search result entity
@freezed
class HelpSearchResult with _$HelpSearchResult {
  const factory HelpSearchResult({
    required String id,
    required String title,
    required String excerpt,
    required HelpResultType type,
    required double relevanceScore,
    String? url,
    String? categoryName,
    @Default([]) List<String> highlightedTerms,
    @Default({}) Map<String, dynamic> metadata,
  }) = _HelpSearchResult;

  factory HelpSearchResult.fromJson(Map<String, dynamic> json) => 
    _$HelpSearchResultFromJson(json);
}

/// Help result type enum
enum HelpResultType {
  article('Article'),
  faq('FAQ'),
  video('Video'),
  tutorial('Tutorial'),
  guide('Guide');

  const HelpResultType(this.displayName);
  final String displayName;
}

/// System status entity
@freezed
class SystemStatus with _$SystemStatus {
  const factory SystemStatus({
    required String id,
    required String serviceName,
    required ServiceStatus status,
    required DateTime lastUpdated,
    String? statusMessage,
    @Default([]) List<StatusIncident> recentIncidents,
    @Default({}) Map<String, double> performanceMetrics,
  }) = _SystemStatus;

  factory SystemStatus.fromJson(Map<String, dynamic> json) => 
    _$SystemStatusFromJson(json);
}

/// Service status enum
enum ServiceStatus {
  operational('Operational'),
  degradedPerformance('Degraded Performance'),
  partialOutage('Partial Outage'),
  majorOutage('Major Outage'),
  maintenance('Under Maintenance');

  const ServiceStatus(this.displayName);
  final String displayName;
}

/// Status incident entity
@freezed
class StatusIncident with _$StatusIncident {
  const factory StatusIncident({
    required String id,
    required String title,
    required String description,
    required IncidentStatus status,
    required IncidentSeverity severity,
    required DateTime startedAt,
    DateTime? resolvedAt,
    @Default([]) List<String> affectedServices,
    @Default([]) List<IncidentUpdate> updates,
  }) = _StatusIncident;

  factory StatusIncident.fromJson(Map<String, dynamic> json) => 
    _$StatusIncidentFromJson(json);
}

/// Incident status enum
enum IncidentStatus {
  investigating('Investigating'),
  identified('Identified'),
  monitoring('Monitoring'),
  resolved('Resolved');

  const IncidentStatus(this.displayName);
  final String displayName;
}

/// Incident severity enum
enum IncidentSeverity {
  minor('Minor'),
  major('Major'),
  critical('Critical');

  const IncidentSeverity(this.displayName);
  final String displayName;
}

/// Incident update entity
@freezed
class IncidentUpdate with _$IncidentUpdate {
  const factory IncidentUpdate({
    required String id,
    required String incidentId,
    required String message,
    required IncidentStatus status,
    required DateTime timestamp,
    String? authorId,
  }) = _IncidentUpdate;

  factory IncidentUpdate.fromJson(Map<String, dynamic> json) => 
    _$IncidentUpdateFromJson(json);
}