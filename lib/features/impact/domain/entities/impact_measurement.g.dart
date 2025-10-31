// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'impact_measurement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ImpactMeasurementImpl _$$ImpactMeasurementImplFromJson(
        Map<String, dynamic> json) =>
    _$ImpactMeasurementImpl(
      id: json['id'] as String,
      projectId: json['projectId'] as String,
      organizationId: json['organizationId'] as String,
      metricName: json['metricName'] as String,
      description: json['description'] as String,
      category: $enumDecode(_$ImpactCategoryEnumMap, json['category']),
      unit: $enumDecode(_$MeasurementUnitEnumMap, json['unit']),
      targetValue: (json['targetValue'] as num).toDouble(),
      currentValue: (json['currentValue'] as num).toDouble(),
      measurementDate: DateTime.parse(json['measurementDate'] as String),
      status: $enumDecode(_$MeasurementStatusEnumMap, json['status']),
      verificationLevel:
          $enumDecode(_$VerificationLevelEnumMap, json['verificationLevel']),
      evidenceUrls: (json['evidenceUrls'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      dataPoints: (json['dataPoints'] as List<dynamic>?)
              ?.map((e) => ImpactDataPoint.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      verifierName: json['verifierName'] as String?,
      verificationNotes: json['verificationNotes'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
      lastVerified: json['lastVerified'] == null
          ? null
          : DateTime.parse(json['lastVerified'] as String),
      nextReviewDate: json['nextReviewDate'] == null
          ? null
          : DateTime.parse(json['nextReviewDate'] as String),
    );

Map<String, dynamic> _$$ImpactMeasurementImplToJson(
        _$ImpactMeasurementImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'projectId': instance.projectId,
      'organizationId': instance.organizationId,
      'metricName': instance.metricName,
      'description': instance.description,
      'category': _$ImpactCategoryEnumMap[instance.category]!,
      'unit': _$MeasurementUnitEnumMap[instance.unit]!,
      'targetValue': instance.targetValue,
      'currentValue': instance.currentValue,
      'measurementDate': instance.measurementDate.toIso8601String(),
      'status': _$MeasurementStatusEnumMap[instance.status]!,
      'verificationLevel':
          _$VerificationLevelEnumMap[instance.verificationLevel]!,
      'evidenceUrls': instance.evidenceUrls,
      'dataPoints': instance.dataPoints,
      'verifierName': instance.verifierName,
      'verificationNotes': instance.verificationNotes,
      'metadata': instance.metadata,
      'lastVerified': instance.lastVerified?.toIso8601String(),
      'nextReviewDate': instance.nextReviewDate?.toIso8601String(),
    };

const _$ImpactCategoryEnumMap = {
  ImpactCategory.noPoverty: 'noPoverty',
  ImpactCategory.zeroHunger: 'zeroHunger',
  ImpactCategory.goodHealth: 'goodHealth',
  ImpactCategory.qualityEducation: 'qualityEducation',
  ImpactCategory.genderEquality: 'genderEquality',
  ImpactCategory.cleanWater: 'cleanWater',
  ImpactCategory.affordableEnergy: 'affordableEnergy',
  ImpactCategory.decentWork: 'decentWork',
  ImpactCategory.industryInnovation: 'industryInnovation',
  ImpactCategory.reducedInequalities: 'reducedInequalities',
  ImpactCategory.sustainableCities: 'sustainableCities',
  ImpactCategory.responsibleConsumption: 'responsibleConsumption',
  ImpactCategory.climateAction: 'climateAction',
  ImpactCategory.lifeBelow: 'lifeBelow',
  ImpactCategory.lifeOnLand: 'lifeOnLand',
  ImpactCategory.peaceJustice: 'peaceJustice',
  ImpactCategory.partnerships: 'partnerships',
};

const _$MeasurementUnitEnumMap = {
  MeasurementUnit.people: 'people',
  MeasurementUnit.households: 'households',
  MeasurementUnit.communities: 'communities',
  MeasurementUnit.students: 'students',
  MeasurementUnit.patients: 'patients',
  MeasurementUnit.jobs: 'jobs',
  MeasurementUnit.kwh: 'kwh',
  MeasurementUnit.mwh: 'mwh',
  MeasurementUnit.tons: 'tons',
  MeasurementUnit.liters: 'liters',
  MeasurementUnit.meters: 'meters',
  MeasurementUnit.hectares: 'hectares',
  MeasurementUnit.percentage: 'percentage',
  MeasurementUnit.ratio: 'ratio',
  MeasurementUnit.score: 'score',
  MeasurementUnit.currency: 'currency',
  MeasurementUnit.custom: 'custom',
};

const _$MeasurementStatusEnumMap = {
  MeasurementStatus.planned: 'planned',
  MeasurementStatus.inProgress: 'inProgress',
  MeasurementStatus.achieved: 'achieved',
  MeasurementStatus.exceeded: 'exceeded',
  MeasurementStatus.delayed: 'delayed',
  MeasurementStatus.notAchieved: 'notAchieved',
};

const _$VerificationLevelEnumMap = {
  VerificationLevel.selfReported: 'selfReported',
  VerificationLevel.peerReviewed: 'peerReviewed',
  VerificationLevel.thirdPartyVerified: 'thirdPartyVerified',
  VerificationLevel.independentlyAudited: 'independentlyAudited',
};

_$ImpactDataPointImpl _$$ImpactDataPointImplFromJson(
        Map<String, dynamic> json) =>
    _$ImpactDataPointImpl(
      id: json['id'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      value: (json['value'] as num).toDouble(),
      source: json['source'] as String,
      notes: json['notes'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$ImpactDataPointImplToJson(
        _$ImpactDataPointImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'timestamp': instance.timestamp.toIso8601String(),
      'value': instance.value,
      'source': instance.source,
      'notes': instance.notes,
      'metadata': instance.metadata,
    };

_$ImpactReportImpl _$$ImpactReportImplFromJson(Map<String, dynamic> json) =>
    _$ImpactReportImpl(
      id: json['id'] as String,
      projectId: json['projectId'] as String,
      organizationId: json['organizationId'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      type: $enumDecode(_$ReportTypeEnumMap, json['type']),
      period: $enumDecode(_$ReportPeriodEnumMap, json['period']),
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      generatedAt: DateTime.parse(json['generatedAt'] as String),
      status: $enumDecode(_$ReportStatusEnumMap, json['status']),
      measurementIds: (json['measurementIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      summaries: (json['summaries'] as List<dynamic>?)
              ?.map((e) => ImpactSummary.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      attachmentUrls: (json['attachmentUrls'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      generatedBy: json['generatedBy'] as String?,
      reviewedBy: json['reviewedBy'] as String?,
      reviewedAt: json['reviewedAt'] == null
          ? null
          : DateTime.parse(json['reviewedAt'] as String),
      publicUrl: json['publicUrl'] as String?,
    );

Map<String, dynamic> _$$ImpactReportImplToJson(_$ImpactReportImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'projectId': instance.projectId,
      'organizationId': instance.organizationId,
      'title': instance.title,
      'description': instance.description,
      'type': _$ReportTypeEnumMap[instance.type]!,
      'period': _$ReportPeriodEnumMap[instance.period]!,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'generatedAt': instance.generatedAt.toIso8601String(),
      'status': _$ReportStatusEnumMap[instance.status]!,
      'measurementIds': instance.measurementIds,
      'summaries': instance.summaries,
      'attachmentUrls': instance.attachmentUrls,
      'generatedBy': instance.generatedBy,
      'reviewedBy': instance.reviewedBy,
      'reviewedAt': instance.reviewedAt?.toIso8601String(),
      'publicUrl': instance.publicUrl,
    };

const _$ReportTypeEnumMap = {
  ReportType.quarterly: 'quarterly',
  ReportType.annual: 'annual',
  ReportType.milestone: 'milestone',
  ReportType.impact: 'impact',
  ReportType.compliance: 'compliance',
  ReportType.investor: 'investor',
};

const _$ReportPeriodEnumMap = {
  ReportPeriod.monthly: 'monthly',
  ReportPeriod.quarterly: 'quarterly',
  ReportPeriod.semiAnnual: 'semiAnnual',
  ReportPeriod.annual: 'annual',
  ReportPeriod.custom: 'custom',
};

const _$ReportStatusEnumMap = {
  ReportStatus.draft: 'draft',
  ReportStatus.underReview: 'underReview',
  ReportStatus.approved: 'approved',
  ReportStatus.published: 'published',
  ReportStatus.archived: 'archived',
};

_$ImpactSummaryImpl _$$ImpactSummaryImplFromJson(Map<String, dynamic> json) =>
    _$ImpactSummaryImpl(
      category: $enumDecode(_$ImpactCategoryEnumMap, json['category']),
      metricName: json['metricName'] as String,
      targetValue: (json['targetValue'] as num).toDouble(),
      achievedValue: (json['achievedValue'] as num).toDouble(),
      progressPercentage: (json['progressPercentage'] as num).toDouble(),
      beneficiariesCount: (json['beneficiariesCount'] as num).toInt(),
      currency: json['currency'] as String,
      investmentAmount: (json['investmentAmount'] as num?)?.toDouble(),
      costPerBeneficiary: (json['costPerBeneficiary'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$ImpactSummaryImplToJson(_$ImpactSummaryImpl instance) =>
    <String, dynamic>{
      'category': _$ImpactCategoryEnumMap[instance.category]!,
      'metricName': instance.metricName,
      'targetValue': instance.targetValue,
      'achievedValue': instance.achievedValue,
      'progressPercentage': instance.progressPercentage,
      'beneficiariesCount': instance.beneficiariesCount,
      'currency': instance.currency,
      'investmentAmount': instance.investmentAmount,
      'costPerBeneficiary': instance.costPerBeneficiary,
    };

_$ImpactAssessmentTemplateImpl _$$ImpactAssessmentTemplateImplFromJson(
        Map<String, dynamic> json) =>
    _$ImpactAssessmentTemplateImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      category: $enumDecode(_$ImpactCategoryEnumMap, json['category']),
      type: $enumDecode(_$TemplateTypeEnumMap, json['type']),
      metricTemplates: (json['metricTemplates'] as List<dynamic>?)
              ?.map((e) => MetricTemplate.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      requiredDocuments: (json['requiredDocuments'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      configuration: json['configuration'] as Map<String, dynamic>?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$ImpactAssessmentTemplateImplToJson(
        _$ImpactAssessmentTemplateImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'category': _$ImpactCategoryEnumMap[instance.category]!,
      'type': _$TemplateTypeEnumMap[instance.type]!,
      'metricTemplates': instance.metricTemplates,
      'requiredDocuments': instance.requiredDocuments,
      'configuration': instance.configuration,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

const _$TemplateTypeEnumMap = {
  TemplateType.standard: 'standard',
  TemplateType.custom: 'custom',
  TemplateType.industry: 'industry',
  TemplateType.regulatory: 'regulatory',
};

_$MetricTemplateImpl _$$MetricTemplateImplFromJson(Map<String, dynamic> json) =>
    _$MetricTemplateImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      unit: $enumDecode(_$MeasurementUnitEnumMap, json['unit']),
      metricType: $enumDecode(_$MetricTypeEnumMap, json['metricType']),
      isRequired: json['isRequired'] as bool,
      minValue: (json['minValue'] as num?)?.toDouble(),
      maxValue: (json['maxValue'] as num?)?.toDouble(),
      calculationFormula: json['calculationFormula'] as String?,
      validationRules: (json['validationRules'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$MetricTemplateImplToJson(
        _$MetricTemplateImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'unit': _$MeasurementUnitEnumMap[instance.unit]!,
      'metricType': _$MetricTypeEnumMap[instance.metricType]!,
      'isRequired': instance.isRequired,
      'minValue': instance.minValue,
      'maxValue': instance.maxValue,
      'calculationFormula': instance.calculationFormula,
      'validationRules': instance.validationRules,
    };

const _$MetricTypeEnumMap = {
  MetricType.output: 'output',
  MetricType.outcome: 'outcome',
  MetricType.impact: 'impact',
  MetricType.process: 'process',
  MetricType.financial: 'financial',
};

_$ImpactDashboardConfigImpl _$$ImpactDashboardConfigImplFromJson(
        Map<String, dynamic> json) =>
    _$ImpactDashboardConfigImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      name: json['name'] as String,
      dashboardType: $enumDecode(_$DashboardTypeEnumMap, json['dashboardType']),
      selectedProjects: (json['selectedProjects'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      selectedCategories: (json['selectedCategories'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$ImpactCategoryEnumMap, e))
              .toList() ??
          const [],
      selectedMetrics: (json['selectedMetrics'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      dateRange: DateRange.fromJson(json['dateRange'] as Map<String, dynamic>),
      charts: (json['charts'] as List<dynamic>?)
              ?.map(
                  (e) => ChartConfiguration.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      filters: json['filters'] as Map<String, dynamic>?,
      lastModified: json['lastModified'] == null
          ? null
          : DateTime.parse(json['lastModified'] as String),
    );

Map<String, dynamic> _$$ImpactDashboardConfigImplToJson(
        _$ImpactDashboardConfigImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'name': instance.name,
      'dashboardType': _$DashboardTypeEnumMap[instance.dashboardType]!,
      'selectedProjects': instance.selectedProjects,
      'selectedCategories': instance.selectedCategories
          .map((e) => _$ImpactCategoryEnumMap[e]!)
          .toList(),
      'selectedMetrics': instance.selectedMetrics,
      'dateRange': instance.dateRange,
      'charts': instance.charts,
      'filters': instance.filters,
      'lastModified': instance.lastModified?.toIso8601String(),
    };

const _$DashboardTypeEnumMap = {
  DashboardType.investor: 'investor',
  DashboardType.organization: 'organization',
  DashboardType.project: 'project',
  DashboardType.public: 'public',
  DashboardType.regulatory: 'regulatory',
};

_$DateRangeImpl _$$DateRangeImplFromJson(Map<String, dynamic> json) =>
    _$DateRangeImpl(
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      label: json['label'] as String?,
    );

Map<String, dynamic> _$$DateRangeImplToJson(_$DateRangeImpl instance) =>
    <String, dynamic>{
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'label': instance.label,
    };

_$ChartConfigurationImpl _$$ChartConfigurationImplFromJson(
        Map<String, dynamic> json) =>
    _$ChartConfigurationImpl(
      id: json['id'] as String,
      chartType: $enumDecode(_$ChartTypeEnumMap, json['chartType']),
      title: json['title'] as String,
      dataSource: json['dataSource'] as String,
      metrics: (json['metrics'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      options: json['options'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$ChartConfigurationImplToJson(
        _$ChartConfigurationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'chartType': _$ChartTypeEnumMap[instance.chartType]!,
      'title': instance.title,
      'dataSource': instance.dataSource,
      'metrics': instance.metrics,
      'options': instance.options,
    };

const _$ChartTypeEnumMap = {
  ChartType.lineChart: 'lineChart',
  ChartType.barChart: 'barChart',
  ChartType.pieChart: 'pieChart',
  ChartType.areaChart: 'areaChart',
  ChartType.scatterPlot: 'scatterPlot',
  ChartType.heatmap: 'heatmap',
  ChartType.gauge: 'gauge',
  ChartType.table: 'table',
};
