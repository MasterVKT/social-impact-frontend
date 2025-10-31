import 'package:freezed_annotation/freezed_annotation.dart';

part 'audit_trail.freezed.dart';
part 'audit_trail.g.dart';

/// Audit trail entry for compliance and security tracking
@freezed
class AuditTrailEntry with _$AuditTrailEntry {
  const factory AuditTrailEntry({
    required String id,
    required String userId,
    required String action,
    required AuditCategory category,
    required DateTime timestamp,
    required String resourceId,
    required String resourceType,
    required Map<String, dynamic> oldValues,
    required Map<String, dynamic> newValues,
    required String ipAddress,
    required String userAgent,
    required AuditSeverity severity,
    String? sessionId,
    String? description,
    Map<String, dynamic>? metadata,
    String? complianceNote,
  }) = _AuditTrailEntry;

  factory AuditTrailEntry.fromJson(Map<String, dynamic> json) => 
    _$AuditTrailEntryFromJson(json);
}

/// Audit category enum
enum AuditCategory {
  authentication('Authentication'),
  authorization('Authorization'),
  dataAccess('Data Access'),
  dataModification('Data Modification'),
  systemConfiguration('System Configuration'),
  financialTransaction('Financial Transaction'),
  complianceAction('Compliance Action'),
  securityEvent('Security Event'),
  userManagement('User Management'),
  projectManagement('Project Management'),
  reportGeneration('Report Generation');

  const AuditCategory(this.displayName);
  final String displayName;
}

/// Audit severity levels
enum AuditSeverity {
  low('Low'),
  medium('Medium'),
  high('High'),
  critical('Critical');

  const AuditSeverity(this.displayName);
  final String displayName;
}

/// Compliance report entity
@freezed
class ComplianceReport with _$ComplianceReport {
  const factory ComplianceReport({
    required String id,
    required String organizationId,
    required String title,
    required ComplianceFramework framework,
    required ReportingPeriod period,
    required DateTime startDate,
    required DateTime endDate,
    required ComplianceStatus status,
    required DateTime generatedAt,
    @Default([]) List<ComplianceRequirement> requirements,
    @Default([]) List<ComplianceFinding> findings,
    @Default([]) List<String> evidenceUrls,
    String? generatedBy,
    String? reviewedBy,
    DateTime? reviewedAt,
    DateTime? submittedAt,
    String? submissionReference,
    Map<String, dynamic>? metadata,
  }) = _ComplianceReport;

  factory ComplianceReport.fromJson(Map<String, dynamic> json) => 
    _$ComplianceReportFromJson(json);
}

/// Compliance framework enum
enum ComplianceFramework {
  gdpr('GDPR - General Data Protection Regulation'),
  sox('SOX - Sarbanes-Oxley Act'),
  iso27001('ISO 27001 - Information Security'),
  pci('PCI DSS - Payment Card Industry'),
  hipaa('HIPAA - Health Insurance Portability'),
  mifid2('MiFID II - Markets in Financial Instruments'),
  aml('AML - Anti-Money Laundering'),
  kyc('KYC - Know Your Customer'),
  esg('ESG - Environmental, Social, Governance'),
  ungc('UN Global Compact'),
  gri('GRI - Global Reporting Initiative'),
  sasb('SASB - Sustainability Accounting Standards');

  const ComplianceFramework(this.displayName);
  final String displayName;
}

/// Reporting period enum
enum ReportingPeriod {
  monthly('Monthly'),
  quarterly('Quarterly'),
  semiAnnual('Semi-Annual'),
  annual('Annual'),
  adhoc('Ad-hoc');

  const ReportingPeriod(this.displayName);
  final String displayName;
}

/// Compliance status enum
enum ComplianceStatus {
  draft('Draft'),
  inProgress('In Progress'),
  underReview('Under Review'),
  approved('Approved'),
  submitted('Submitted'),
  rejected('Rejected'),
  expired('Expired');

  const ComplianceStatus(this.displayName);
  final String displayName;
}

/// Compliance requirement
@freezed
class ComplianceRequirement with _$ComplianceRequirement {
  const factory ComplianceRequirement({
    required String id,
    required String title,
    required String description,
    required RequirementType type,
    required ComplianceStatus status,
    required Priority priority,
    required DateTime dueDate,
    String? assignedTo,
    String? evidenceUrl,
    DateTime? completedDate,
    String? notes,
    @Default([]) List<String> tags,
  }) = _ComplianceRequirement;

  factory ComplianceRequirement.fromJson(Map<String, dynamic> json) => 
    _$ComplianceRequirementFromJson(json);
}

/// Requirement type enum
enum RequirementType {
  documentation('Documentation'),
  process('Process'),
  technical('Technical Control'),
  training('Training'),
  audit('Audit'),
  certification('Certification');

  const RequirementType(this.displayName);
  final String displayName;
}

/// Priority enum
enum Priority {
  low('Low'),
  medium('Medium'),
  high('High'),
  critical('Critical');

  const Priority(this.displayName);
  final String displayName;
}

/// Compliance finding
@freezed
class ComplianceFinding with _$ComplianceFinding {
  const factory ComplianceFinding({
    required String id,
    required String title,
    required String description,
    required FindingSeverity severity,
    required FindingType type,
    required FindingStatus status,
    required DateTime discoveredAt,
    String? discoveredBy,
    DateTime? resolvedAt,
    String? resolvedBy,
    String? resolution,
    @Default([]) List<String> affectedSystems,
    @Default([]) List<String> evidenceUrls,
    Map<String, dynamic>? metadata,
  }) = _ComplianceFinding;

  factory ComplianceFinding.fromJson(Map<String, dynamic> json) => 
    _$ComplianceFindingFromJson(json);
}

/// Finding severity enum
enum FindingSeverity {
  informational('Informational'),
  low('Low'),
  medium('Medium'),
  high('High'),
  critical('Critical');

  const FindingSeverity(this.displayName);
  final String displayName;
}

/// Finding type enum
enum FindingType {
  nonCompliance('Non-Compliance'),
  weakness('Control Weakness'),
  gap('Gap Analysis'),
  observation('Observation'),
  recommendation('Recommendation');

  const FindingType(this.displayName);
  final String displayName;
}

/// Finding status enum
enum FindingStatus {
  open('Open'),
  inProgress('In Progress'),
  resolved('Resolved'),
  accepted('Risk Accepted'),
  deferred('Deferred');

  const FindingStatus(this.displayName);
  final String displayName;
}

/// Data retention policy
@freezed
class DataRetentionPolicy with _$DataRetentionPolicy {
  const factory DataRetentionPolicy({
    required String id,
    required String name,
    required String description,
    required DataCategory dataCategory,
    required Duration retentionPeriod,
    required RetentionAction actionAfterExpiry,
    required bool isActive,
    @Default([]) List<String> applicableRegions,
    @Default([]) List<String> exemptions,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _DataRetentionPolicy;

  factory DataRetentionPolicy.fromJson(Map<String, dynamic> json) => 
    _$DataRetentionPolicyFromJson(json);
}

/// Data category enum
enum DataCategory {
  personalData('Personal Data'),
  financialData('Financial Data'),
  transactionData('Transaction Data'),
  communicationData('Communication Data'),
  systemLogs('System Logs'),
  auditLogs('Audit Logs'),
  analyticsData('Analytics Data');

  const DataCategory(this.displayName);
  final String displayName;
}

/// Retention action enum
enum RetentionAction {
  delete('Delete'),
  anonymize('Anonymize'),
  archive('Archive'),
  review('Manual Review');

  const RetentionAction(this.displayName);
  final String displayName;
}

/// Privacy impact assessment
@freezed
class PrivacyImpactAssessment with _$PrivacyImpactAssessment {
  const factory PrivacyImpactAssessment({
    required String id,
    required String title,
    required String description,
    required String projectId,
    required PIAStatus status,
    required DateTime startDate,
    DateTime? completedDate,
    required String conductedBy,
    @Default([]) List<DataProcessingActivity> dataProcessingActivities,
    @Default([]) List<PrivacyRisk> identifiedRisks,
    @Default([]) List<Mitigation> mitigationMeasures,
    String? conclusion,
    Map<String, dynamic>? metadata,
  }) = _PrivacyImpactAssessment;

  factory PrivacyImpactAssessment.fromJson(Map<String, dynamic> json) => 
    _$PrivacyImpactAssessmentFromJson(json);
}

/// PIA status enum
enum PIAStatus {
  notStarted('Not Started'),
  inProgress('In Progress'),
  underReview('Under Review'),
  approved('Approved'),
  rejected('Rejected');

  const PIAStatus(this.displayName);
  final String displayName;
}

/// Data processing activity
@freezed
class DataProcessingActivity with _$DataProcessingActivity {
  const factory DataProcessingActivity({
    required String id,
    required String name,
    required String purpose,
    required LegalBasis legalBasis,
    @Default([]) List<String> dataTypes,
    @Default([]) List<String> dataSubjects,
    @Default([]) List<String> recipients,
    Duration? retentionPeriod,
    bool? isAutomatedDecisionMaking,
    String? transferMechanism,
  }) = _DataProcessingActivity;

  factory DataProcessingActivity.fromJson(Map<String, dynamic> json) => 
    _$DataProcessingActivityFromJson(json);
}

/// Legal basis for processing personal data (GDPR)
enum LegalBasis {
  consent('Consent'),
  contract('Contract Performance'),
  legalObligation('Legal Obligation'),
  vitalInterests('Vital Interests'),
  publicTask('Public Task'),
  legitimateInterests('Legitimate Interests');

  const LegalBasis(this.displayName);
  final String displayName;
}

/// Privacy risk
@freezed
class PrivacyRisk with _$PrivacyRisk {
  const factory PrivacyRisk({
    required String id,
    required String title,
    required String description,
    required RiskLevel likelihood,
    required RiskLevel impact,
    required RiskLevel overallRisk,
    @Default([]) List<String> affectedDataSubjects,
    String? potentialHarm,
  }) = _PrivacyRisk;

  factory PrivacyRisk.fromJson(Map<String, dynamic> json) => 
    _$PrivacyRiskFromJson(json);
}

/// Risk level enum
enum RiskLevel {
  low('Low'),
  medium('Medium'),
  high('High'),
  veryHigh('Very High');

  const RiskLevel(this.displayName);
  final String displayName;
}

/// Risk mitigation measure
@freezed
class Mitigation with _$Mitigation {
  const factory Mitigation({
    required String id,
    required String title,
    required String description,
    required MitigationStatus status,
    required String responsiblePerson,
    required DateTime targetDate,
    DateTime? completedDate,
    String? notes,
  }) = _Mitigation;

  factory Mitigation.fromJson(Map<String, dynamic> json) => 
    _$MitigationFromJson(json);
}

/// Mitigation status enum
enum MitigationStatus {
  planned('Planned'),
  inProgress('In Progress'),
  completed('Completed'),
  deferred('Deferred'),
  cancelled('Cancelled');

  const MitigationStatus(this.displayName);
  final String displayName;
}