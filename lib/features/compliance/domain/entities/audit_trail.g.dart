// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audit_trail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuditTrailEntryImpl _$$AuditTrailEntryImplFromJson(
        Map<String, dynamic> json) =>
    _$AuditTrailEntryImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      action: json['action'] as String,
      category: $enumDecode(_$AuditCategoryEnumMap, json['category']),
      timestamp: DateTime.parse(json['timestamp'] as String),
      resourceId: json['resourceId'] as String,
      resourceType: json['resourceType'] as String,
      oldValues: json['oldValues'] as Map<String, dynamic>,
      newValues: json['newValues'] as Map<String, dynamic>,
      ipAddress: json['ipAddress'] as String,
      userAgent: json['userAgent'] as String,
      severity: $enumDecode(_$AuditSeverityEnumMap, json['severity']),
      sessionId: json['sessionId'] as String?,
      description: json['description'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
      complianceNote: json['complianceNote'] as String?,
    );

Map<String, dynamic> _$$AuditTrailEntryImplToJson(
        _$AuditTrailEntryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'action': instance.action,
      'category': _$AuditCategoryEnumMap[instance.category]!,
      'timestamp': instance.timestamp.toIso8601String(),
      'resourceId': instance.resourceId,
      'resourceType': instance.resourceType,
      'oldValues': instance.oldValues,
      'newValues': instance.newValues,
      'ipAddress': instance.ipAddress,
      'userAgent': instance.userAgent,
      'severity': _$AuditSeverityEnumMap[instance.severity]!,
      'sessionId': instance.sessionId,
      'description': instance.description,
      'metadata': instance.metadata,
      'complianceNote': instance.complianceNote,
    };

const _$AuditCategoryEnumMap = {
  AuditCategory.authentication: 'authentication',
  AuditCategory.authorization: 'authorization',
  AuditCategory.dataAccess: 'dataAccess',
  AuditCategory.dataModification: 'dataModification',
  AuditCategory.systemConfiguration: 'systemConfiguration',
  AuditCategory.financialTransaction: 'financialTransaction',
  AuditCategory.complianceAction: 'complianceAction',
  AuditCategory.securityEvent: 'securityEvent',
  AuditCategory.userManagement: 'userManagement',
  AuditCategory.projectManagement: 'projectManagement',
  AuditCategory.reportGeneration: 'reportGeneration',
};

const _$AuditSeverityEnumMap = {
  AuditSeverity.low: 'low',
  AuditSeverity.medium: 'medium',
  AuditSeverity.high: 'high',
  AuditSeverity.critical: 'critical',
};

_$ComplianceReportImpl _$$ComplianceReportImplFromJson(
        Map<String, dynamic> json) =>
    _$ComplianceReportImpl(
      id: json['id'] as String,
      organizationId: json['organizationId'] as String,
      title: json['title'] as String,
      framework: $enumDecode(_$ComplianceFrameworkEnumMap, json['framework']),
      period: $enumDecode(_$ReportingPeriodEnumMap, json['period']),
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      status: $enumDecode(_$ComplianceStatusEnumMap, json['status']),
      generatedAt: DateTime.parse(json['generatedAt'] as String),
      requirements: (json['requirements'] as List<dynamic>?)
              ?.map((e) =>
                  ComplianceRequirement.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      findings: (json['findings'] as List<dynamic>?)
              ?.map(
                  (e) => ComplianceFinding.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      evidenceUrls: (json['evidenceUrls'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      generatedBy: json['generatedBy'] as String?,
      reviewedBy: json['reviewedBy'] as String?,
      reviewedAt: json['reviewedAt'] == null
          ? null
          : DateTime.parse(json['reviewedAt'] as String),
      submittedAt: json['submittedAt'] == null
          ? null
          : DateTime.parse(json['submittedAt'] as String),
      submissionReference: json['submissionReference'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$ComplianceReportImplToJson(
        _$ComplianceReportImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'organizationId': instance.organizationId,
      'title': instance.title,
      'framework': _$ComplianceFrameworkEnumMap[instance.framework]!,
      'period': _$ReportingPeriodEnumMap[instance.period]!,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'status': _$ComplianceStatusEnumMap[instance.status]!,
      'generatedAt': instance.generatedAt.toIso8601String(),
      'requirements': instance.requirements,
      'findings': instance.findings,
      'evidenceUrls': instance.evidenceUrls,
      'generatedBy': instance.generatedBy,
      'reviewedBy': instance.reviewedBy,
      'reviewedAt': instance.reviewedAt?.toIso8601String(),
      'submittedAt': instance.submittedAt?.toIso8601String(),
      'submissionReference': instance.submissionReference,
      'metadata': instance.metadata,
    };

const _$ComplianceFrameworkEnumMap = {
  ComplianceFramework.gdpr: 'gdpr',
  ComplianceFramework.sox: 'sox',
  ComplianceFramework.iso27001: 'iso27001',
  ComplianceFramework.pci: 'pci',
  ComplianceFramework.hipaa: 'hipaa',
  ComplianceFramework.mifid2: 'mifid2',
  ComplianceFramework.aml: 'aml',
  ComplianceFramework.kyc: 'kyc',
  ComplianceFramework.esg: 'esg',
  ComplianceFramework.ungc: 'ungc',
  ComplianceFramework.gri: 'gri',
  ComplianceFramework.sasb: 'sasb',
};

const _$ReportingPeriodEnumMap = {
  ReportingPeriod.monthly: 'monthly',
  ReportingPeriod.quarterly: 'quarterly',
  ReportingPeriod.semiAnnual: 'semiAnnual',
  ReportingPeriod.annual: 'annual',
  ReportingPeriod.adhoc: 'adhoc',
};

const _$ComplianceStatusEnumMap = {
  ComplianceStatus.draft: 'draft',
  ComplianceStatus.inProgress: 'inProgress',
  ComplianceStatus.underReview: 'underReview',
  ComplianceStatus.approved: 'approved',
  ComplianceStatus.submitted: 'submitted',
  ComplianceStatus.rejected: 'rejected',
  ComplianceStatus.expired: 'expired',
};

_$ComplianceRequirementImpl _$$ComplianceRequirementImplFromJson(
        Map<String, dynamic> json) =>
    _$ComplianceRequirementImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      type: $enumDecode(_$RequirementTypeEnumMap, json['type']),
      status: $enumDecode(_$ComplianceStatusEnumMap, json['status']),
      priority: $enumDecode(_$PriorityEnumMap, json['priority']),
      dueDate: DateTime.parse(json['dueDate'] as String),
      assignedTo: json['assignedTo'] as String?,
      evidenceUrl: json['evidenceUrl'] as String?,
      completedDate: json['completedDate'] == null
          ? null
          : DateTime.parse(json['completedDate'] as String),
      notes: json['notes'] as String?,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
    );

Map<String, dynamic> _$$ComplianceRequirementImplToJson(
        _$ComplianceRequirementImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'type': _$RequirementTypeEnumMap[instance.type]!,
      'status': _$ComplianceStatusEnumMap[instance.status]!,
      'priority': _$PriorityEnumMap[instance.priority]!,
      'dueDate': instance.dueDate.toIso8601String(),
      'assignedTo': instance.assignedTo,
      'evidenceUrl': instance.evidenceUrl,
      'completedDate': instance.completedDate?.toIso8601String(),
      'notes': instance.notes,
      'tags': instance.tags,
    };

const _$RequirementTypeEnumMap = {
  RequirementType.documentation: 'documentation',
  RequirementType.process: 'process',
  RequirementType.technical: 'technical',
  RequirementType.training: 'training',
  RequirementType.audit: 'audit',
  RequirementType.certification: 'certification',
};

const _$PriorityEnumMap = {
  Priority.low: 'low',
  Priority.medium: 'medium',
  Priority.high: 'high',
  Priority.critical: 'critical',
};

_$ComplianceFindingImpl _$$ComplianceFindingImplFromJson(
        Map<String, dynamic> json) =>
    _$ComplianceFindingImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      severity: $enumDecode(_$FindingSeverityEnumMap, json['severity']),
      type: $enumDecode(_$FindingTypeEnumMap, json['type']),
      status: $enumDecode(_$FindingStatusEnumMap, json['status']),
      discoveredAt: DateTime.parse(json['discoveredAt'] as String),
      discoveredBy: json['discoveredBy'] as String?,
      resolvedAt: json['resolvedAt'] == null
          ? null
          : DateTime.parse(json['resolvedAt'] as String),
      resolvedBy: json['resolvedBy'] as String?,
      resolution: json['resolution'] as String?,
      affectedSystems: (json['affectedSystems'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      evidenceUrls: (json['evidenceUrls'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$ComplianceFindingImplToJson(
        _$ComplianceFindingImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'severity': _$FindingSeverityEnumMap[instance.severity]!,
      'type': _$FindingTypeEnumMap[instance.type]!,
      'status': _$FindingStatusEnumMap[instance.status]!,
      'discoveredAt': instance.discoveredAt.toIso8601String(),
      'discoveredBy': instance.discoveredBy,
      'resolvedAt': instance.resolvedAt?.toIso8601String(),
      'resolvedBy': instance.resolvedBy,
      'resolution': instance.resolution,
      'affectedSystems': instance.affectedSystems,
      'evidenceUrls': instance.evidenceUrls,
      'metadata': instance.metadata,
    };

const _$FindingSeverityEnumMap = {
  FindingSeverity.informational: 'informational',
  FindingSeverity.low: 'low',
  FindingSeverity.medium: 'medium',
  FindingSeverity.high: 'high',
  FindingSeverity.critical: 'critical',
};

const _$FindingTypeEnumMap = {
  FindingType.nonCompliance: 'nonCompliance',
  FindingType.weakness: 'weakness',
  FindingType.gap: 'gap',
  FindingType.observation: 'observation',
  FindingType.recommendation: 'recommendation',
};

const _$FindingStatusEnumMap = {
  FindingStatus.open: 'open',
  FindingStatus.inProgress: 'inProgress',
  FindingStatus.resolved: 'resolved',
  FindingStatus.accepted: 'accepted',
  FindingStatus.deferred: 'deferred',
};

_$DataRetentionPolicyImpl _$$DataRetentionPolicyImplFromJson(
        Map<String, dynamic> json) =>
    _$DataRetentionPolicyImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      dataCategory: $enumDecode(_$DataCategoryEnumMap, json['dataCategory']),
      retentionPeriod:
          Duration(microseconds: (json['retentionPeriod'] as num).toInt()),
      actionAfterExpiry:
          $enumDecode(_$RetentionActionEnumMap, json['actionAfterExpiry']),
      isActive: json['isActive'] as bool,
      applicableRegions: (json['applicableRegions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      exemptions: (json['exemptions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$DataRetentionPolicyImplToJson(
        _$DataRetentionPolicyImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'dataCategory': _$DataCategoryEnumMap[instance.dataCategory]!,
      'retentionPeriod': instance.retentionPeriod.inMicroseconds,
      'actionAfterExpiry':
          _$RetentionActionEnumMap[instance.actionAfterExpiry]!,
      'isActive': instance.isActive,
      'applicableRegions': instance.applicableRegions,
      'exemptions': instance.exemptions,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

const _$DataCategoryEnumMap = {
  DataCategory.personalData: 'personalData',
  DataCategory.financialData: 'financialData',
  DataCategory.transactionData: 'transactionData',
  DataCategory.communicationData: 'communicationData',
  DataCategory.systemLogs: 'systemLogs',
  DataCategory.auditLogs: 'auditLogs',
  DataCategory.analyticsData: 'analyticsData',
};

const _$RetentionActionEnumMap = {
  RetentionAction.delete: 'delete',
  RetentionAction.anonymize: 'anonymize',
  RetentionAction.archive: 'archive',
  RetentionAction.review: 'review',
};

_$PrivacyImpactAssessmentImpl _$$PrivacyImpactAssessmentImplFromJson(
        Map<String, dynamic> json) =>
    _$PrivacyImpactAssessmentImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      projectId: json['projectId'] as String,
      status: $enumDecode(_$PIAStatusEnumMap, json['status']),
      startDate: DateTime.parse(json['startDate'] as String),
      completedDate: json['completedDate'] == null
          ? null
          : DateTime.parse(json['completedDate'] as String),
      conductedBy: json['conductedBy'] as String,
      dataProcessingActivities: (json['dataProcessingActivities']
                  as List<dynamic>?)
              ?.map((e) =>
                  DataProcessingActivity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      identifiedRisks: (json['identifiedRisks'] as List<dynamic>?)
              ?.map((e) => PrivacyRisk.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      mitigationMeasures: (json['mitigationMeasures'] as List<dynamic>?)
              ?.map((e) => Mitigation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      conclusion: json['conclusion'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$PrivacyImpactAssessmentImplToJson(
        _$PrivacyImpactAssessmentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'projectId': instance.projectId,
      'status': _$PIAStatusEnumMap[instance.status]!,
      'startDate': instance.startDate.toIso8601String(),
      'completedDate': instance.completedDate?.toIso8601String(),
      'conductedBy': instance.conductedBy,
      'dataProcessingActivities': instance.dataProcessingActivities,
      'identifiedRisks': instance.identifiedRisks,
      'mitigationMeasures': instance.mitigationMeasures,
      'conclusion': instance.conclusion,
      'metadata': instance.metadata,
    };

const _$PIAStatusEnumMap = {
  PIAStatus.notStarted: 'notStarted',
  PIAStatus.inProgress: 'inProgress',
  PIAStatus.underReview: 'underReview',
  PIAStatus.approved: 'approved',
  PIAStatus.rejected: 'rejected',
};

_$DataProcessingActivityImpl _$$DataProcessingActivityImplFromJson(
        Map<String, dynamic> json) =>
    _$DataProcessingActivityImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      purpose: json['purpose'] as String,
      legalBasis: $enumDecode(_$LegalBasisEnumMap, json['legalBasis']),
      dataTypes: (json['dataTypes'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      dataSubjects: (json['dataSubjects'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      recipients: (json['recipients'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      retentionPeriod: json['retentionPeriod'] == null
          ? null
          : Duration(microseconds: (json['retentionPeriod'] as num).toInt()),
      isAutomatedDecisionMaking: json['isAutomatedDecisionMaking'] as bool?,
      transferMechanism: json['transferMechanism'] as String?,
    );

Map<String, dynamic> _$$DataProcessingActivityImplToJson(
        _$DataProcessingActivityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'purpose': instance.purpose,
      'legalBasis': _$LegalBasisEnumMap[instance.legalBasis]!,
      'dataTypes': instance.dataTypes,
      'dataSubjects': instance.dataSubjects,
      'recipients': instance.recipients,
      'retentionPeriod': instance.retentionPeriod?.inMicroseconds,
      'isAutomatedDecisionMaking': instance.isAutomatedDecisionMaking,
      'transferMechanism': instance.transferMechanism,
    };

const _$LegalBasisEnumMap = {
  LegalBasis.consent: 'consent',
  LegalBasis.contract: 'contract',
  LegalBasis.legalObligation: 'legalObligation',
  LegalBasis.vitalInterests: 'vitalInterests',
  LegalBasis.publicTask: 'publicTask',
  LegalBasis.legitimateInterests: 'legitimateInterests',
};

_$PrivacyRiskImpl _$$PrivacyRiskImplFromJson(Map<String, dynamic> json) =>
    _$PrivacyRiskImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      likelihood: $enumDecode(_$RiskLevelEnumMap, json['likelihood']),
      impact: $enumDecode(_$RiskLevelEnumMap, json['impact']),
      overallRisk: $enumDecode(_$RiskLevelEnumMap, json['overallRisk']),
      affectedDataSubjects: (json['affectedDataSubjects'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      potentialHarm: json['potentialHarm'] as String?,
    );

Map<String, dynamic> _$$PrivacyRiskImplToJson(_$PrivacyRiskImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'likelihood': _$RiskLevelEnumMap[instance.likelihood]!,
      'impact': _$RiskLevelEnumMap[instance.impact]!,
      'overallRisk': _$RiskLevelEnumMap[instance.overallRisk]!,
      'affectedDataSubjects': instance.affectedDataSubjects,
      'potentialHarm': instance.potentialHarm,
    };

const _$RiskLevelEnumMap = {
  RiskLevel.low: 'low',
  RiskLevel.medium: 'medium',
  RiskLevel.high: 'high',
  RiskLevel.veryHigh: 'veryHigh',
};

_$MitigationImpl _$$MitigationImplFromJson(Map<String, dynamic> json) =>
    _$MitigationImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      status: $enumDecode(_$MitigationStatusEnumMap, json['status']),
      responsiblePerson: json['responsiblePerson'] as String,
      targetDate: DateTime.parse(json['targetDate'] as String),
      completedDate: json['completedDate'] == null
          ? null
          : DateTime.parse(json['completedDate'] as String),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$MitigationImplToJson(_$MitigationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'status': _$MitigationStatusEnumMap[instance.status]!,
      'responsiblePerson': instance.responsiblePerson,
      'targetDate': instance.targetDate.toIso8601String(),
      'completedDate': instance.completedDate?.toIso8601String(),
      'notes': instance.notes,
    };

const _$MitigationStatusEnumMap = {
  MitigationStatus.planned: 'planned',
  MitigationStatus.inProgress: 'inProgress',
  MitigationStatus.completed: 'completed',
  MitigationStatus.deferred: 'deferred',
  MitigationStatus.cancelled: 'cancelled',
};
