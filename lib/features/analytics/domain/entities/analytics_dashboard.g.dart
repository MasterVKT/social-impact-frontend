// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytics_dashboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnalyticsDashboardImpl _$$AnalyticsDashboardImplFromJson(
        Map<String, dynamic> json) =>
    _$AnalyticsDashboardImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      organizationId: json['organizationId'] as String,
      title: json['title'] as String,
      type: $enumDecode(_$DashboardTypeEnumMap, json['type']),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      widgets: (json['widgets'] as List<dynamic>?)
              ?.map((e) => AnalyticsWidget.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      configuration: json['configuration'] as Map<String, dynamic>? ?? const {},
      sharedWith: (json['sharedWith'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      description: json['description'] as String?,
      isDefault: json['isDefault'] as bool?,
      lastViewedAt: json['lastViewedAt'] == null
          ? null
          : DateTime.parse(json['lastViewedAt'] as String),
    );

Map<String, dynamic> _$$AnalyticsDashboardImplToJson(
        _$AnalyticsDashboardImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'organizationId': instance.organizationId,
      'title': instance.title,
      'type': _$DashboardTypeEnumMap[instance.type]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'widgets': instance.widgets,
      'configuration': instance.configuration,
      'sharedWith': instance.sharedWith,
      'description': instance.description,
      'isDefault': instance.isDefault,
      'lastViewedAt': instance.lastViewedAt?.toIso8601String(),
    };

const _$DashboardTypeEnumMap = {
  DashboardType.investor: 'investor',
  DashboardType.organization: 'organization',
  DashboardType.project: 'project',
  DashboardType.compliance: 'compliance',
  DashboardType.executive: 'executive',
  DashboardType.custom: 'custom',
};

_$AnalyticsWidgetImpl _$$AnalyticsWidgetImplFromJson(
        Map<String, dynamic> json) =>
    _$AnalyticsWidgetImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      type: $enumDecode(_$WidgetTypeEnumMap, json['type']),
      positionX: (json['positionX'] as num).toInt(),
      positionY: (json['positionY'] as num).toInt(),
      width: (json['width'] as num).toInt(),
      height: (json['height'] as num).toInt(),
      configuration: json['configuration'] as Map<String, dynamic>,
      data: json['data'] as Map<String, dynamic>? ?? const {},
      description: json['description'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$AnalyticsWidgetImplToJson(
        _$AnalyticsWidgetImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'type': _$WidgetTypeEnumMap[instance.type]!,
      'positionX': instance.positionX,
      'positionY': instance.positionY,
      'width': instance.width,
      'height': instance.height,
      'configuration': instance.configuration,
      'data': instance.data,
      'description': instance.description,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

const _$WidgetTypeEnumMap = {
  WidgetType.portfolioOverview: 'portfolioOverview',
  WidgetType.investmentPerformance: 'investmentPerformance',
  WidgetType.dividendSummary: 'dividendSummary',
  WidgetType.cashFlow: 'cashFlow',
  WidgetType.projectStatus: 'projectStatus',
  WidgetType.fundingProgress: 'fundingProgress',
  WidgetType.impactMetrics: 'impactMetrics',
  WidgetType.milestoneTimeline: 'milestoneTimeline',
  WidgetType.performanceChart: 'performanceChart',
  WidgetType.comparisonChart: 'comparisonChart',
  WidgetType.trendAnalysis: 'trendAnalysis',
  WidgetType.kpiCard: 'kpiCard',
  WidgetType.complianceStatus: 'complianceStatus',
  WidgetType.auditSummary: 'auditSummary',
  WidgetType.riskAssessment: 'riskAssessment',
  WidgetType.notificationSummary: 'notificationSummary',
  WidgetType.activityFeed: 'activityFeed',
  WidgetType.userEngagement: 'userEngagement',
  WidgetType.customChart: 'customChart',
  WidgetType.customTable: 'customTable',
  WidgetType.customMetric: 'customMetric',
};

_$KPIImpl _$$KPIImplFromJson(Map<String, dynamic> json) => _$KPIImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      category: $enumDecode(_$KPICategoryEnumMap, json['category']),
      currentValue: (json['currentValue'] as num).toDouble(),
      targetValue: (json['targetValue'] as num).toDouble(),
      unit: json['unit'] as String,
      direction: $enumDecode(_$KPIDirectionEnumMap, json['direction']),
      previousValue: json['previousValue'] == null
          ? null
          : DateTime.parse(json['previousValue'] as String),
      lastUpdated: json['lastUpdated'] == null
          ? null
          : DateTime.parse(json['lastUpdated'] as String),
      historicalData: (json['historicalData'] as List<dynamic>?)
              ?.map((e) => KPIDataPoint.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$KPIImplToJson(_$KPIImpl instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'category': _$KPICategoryEnumMap[instance.category]!,
      'currentValue': instance.currentValue,
      'targetValue': instance.targetValue,
      'unit': instance.unit,
      'direction': _$KPIDirectionEnumMap[instance.direction]!,
      'previousValue': instance.previousValue?.toIso8601String(),
      'lastUpdated': instance.lastUpdated?.toIso8601String(),
      'historicalData': instance.historicalData,
      'metadata': instance.metadata,
    };

const _$KPICategoryEnumMap = {
  KPICategory.financial: 'financial',
  KPICategory.impact: 'impact',
  KPICategory.operational: 'operational',
  KPICategory.engagement: 'engagement',
  KPICategory.compliance: 'compliance',
  KPICategory.growth: 'growth',
  KPICategory.efficiency: 'efficiency',
  KPICategory.sustainability: 'sustainability',
};

const _$KPIDirectionEnumMap = {
  KPIDirection.higher: 'higher',
  KPIDirection.lower: 'lower',
  KPIDirection.stable: 'stable',
};

_$KPIDataPointImpl _$$KPIDataPointImplFromJson(Map<String, dynamic> json) =>
    _$KPIDataPointImpl(
      timestamp: DateTime.parse(json['timestamp'] as String),
      value: (json['value'] as num).toDouble(),
      note: json['note'] as String?,
      context: json['context'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$KPIDataPointImplToJson(_$KPIDataPointImpl instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp.toIso8601String(),
      'value': instance.value,
      'note': instance.note,
      'context': instance.context,
    };

_$AnalyticsReportImpl _$$AnalyticsReportImplFromJson(
        Map<String, dynamic> json) =>
    _$AnalyticsReportImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      type: $enumDecode(_$ReportTypeEnumMap, json['type']),
      status: $enumDecode(_$ReportStatusEnumMap, json['status']),
      periodStart: DateTime.parse(json['periodStart'] as String),
      periodEnd: DateTime.parse(json['periodEnd'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      sections: (json['sections'] as List<dynamic>?)
              ?.map((e) => ReportSection.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      recipients: (json['recipients'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      createdBy: json['createdBy'] as String?,
      scheduledAt: json['scheduledAt'] == null
          ? null
          : DateTime.parse(json['scheduledAt'] as String),
      templateId: json['templateId'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$AnalyticsReportImplToJson(
        _$AnalyticsReportImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'type': _$ReportTypeEnumMap[instance.type]!,
      'status': _$ReportStatusEnumMap[instance.status]!,
      'periodStart': instance.periodStart.toIso8601String(),
      'periodEnd': instance.periodEnd.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'sections': instance.sections,
      'recipients': instance.recipients,
      'createdBy': instance.createdBy,
      'scheduledAt': instance.scheduledAt?.toIso8601String(),
      'templateId': instance.templateId,
      'metadata': instance.metadata,
    };

const _$ReportTypeEnumMap = {
  ReportType.performance: 'performance',
  ReportType.impact: 'impact',
  ReportType.financial: 'financial',
  ReportType.compliance: 'compliance',
  ReportType.executive: 'executive',
  ReportType.investor: 'investor',
  ReportType.quarterly: 'quarterly',
  ReportType.annual: 'annual',
  ReportType.custom: 'custom',
};

const _$ReportStatusEnumMap = {
  ReportStatus.draft: 'draft',
  ReportStatus.generating: 'generating',
  ReportStatus.completed: 'completed',
  ReportStatus.scheduled: 'scheduled',
  ReportStatus.sent: 'sent',
  ReportStatus.failed: 'failed',
};

_$ReportSectionImpl _$$ReportSectionImplFromJson(Map<String, dynamic> json) =>
    _$ReportSectionImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      type: $enumDecode(_$SectionTypeEnumMap, json['type']),
      order: (json['order'] as num).toInt(),
      content: json['content'] as Map<String, dynamic>,
      description: json['description'] as String?,
      charts: (json['charts'] as List<dynamic>?)
              ?.map((e) => ReportChart.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      tables: (json['tables'] as List<dynamic>?)
              ?.map((e) => ReportTable.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      configuration: json['configuration'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$ReportSectionImplToJson(_$ReportSectionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'type': _$SectionTypeEnumMap[instance.type]!,
      'order': instance.order,
      'content': instance.content,
      'description': instance.description,
      'charts': instance.charts,
      'tables': instance.tables,
      'configuration': instance.configuration,
    };

const _$SectionTypeEnumMap = {
  SectionType.summary: 'summary',
  SectionType.charts: 'charts',
  SectionType.tables: 'tables',
  SectionType.narrative: 'narrative',
  SectionType.recommendations: 'recommendations',
  SectionType.appendix: 'appendix',
};

_$ReportChartImpl _$$ReportChartImplFromJson(Map<String, dynamic> json) =>
    _$ReportChartImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      type: $enumDecode(_$ChartTypeEnumMap, json['type']),
      data: json['data'] as Map<String, dynamic>,
      configuration: json['configuration'] as Map<String, dynamic>? ?? const {},
      description: json['description'] as String?,
      xAxisLabel: json['xAxisLabel'] as String?,
      yAxisLabel: json['yAxisLabel'] as String?,
    );

Map<String, dynamic> _$$ReportChartImplToJson(_$ReportChartImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'type': _$ChartTypeEnumMap[instance.type]!,
      'data': instance.data,
      'configuration': instance.configuration,
      'description': instance.description,
      'xAxisLabel': instance.xAxisLabel,
      'yAxisLabel': instance.yAxisLabel,
    };

const _$ChartTypeEnumMap = {
  ChartType.line: 'line',
  ChartType.bar: 'bar',
  ChartType.pie: 'pie',
  ChartType.area: 'area',
  ChartType.scatter: 'scatter',
  ChartType.histogram: 'histogram',
  ChartType.heatmap: 'heatmap',
  ChartType.funnel: 'funnel',
  ChartType.gauge: 'gauge',
  ChartType.waterfall: 'waterfall',
};

_$ReportTableImpl _$$ReportTableImplFromJson(Map<String, dynamic> json) =>
    _$ReportTableImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      headers:
          (json['headers'] as List<dynamic>).map((e) => e as String).toList(),
      rows: (json['rows'] as List<dynamic>)
          .map((e) => e as List<dynamic>)
          .toList(),
      description: json['description'] as String?,
      formatting: json['formatting'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$ReportTableImplToJson(_$ReportTableImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'headers': instance.headers,
      'rows': instance.rows,
      'description': instance.description,
      'formatting': instance.formatting,
    };

_$AnalyticsInsightImpl _$$AnalyticsInsightImplFromJson(
        Map<String, dynamic> json) =>
    _$AnalyticsInsightImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      type: $enumDecode(_$InsightTypeEnumMap, json['type']),
      priority: $enumDecode(_$InsightPriorityEnumMap, json['priority']),
      createdAt: DateTime.parse(json['createdAt'] as String),
      affectedMetrics: (json['affectedMetrics'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      recommendedActions: (json['recommendedActions'] as List<dynamic>?)
              ?.map((e) => InsightAction.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      sourceQuery: json['sourceQuery'] as String?,
      confidence: (json['confidence'] as num?)?.toDouble(),
      evidence: json['evidence'] as Map<String, dynamic>?,
      validUntil: json['validUntil'] == null
          ? null
          : DateTime.parse(json['validUntil'] as String),
    );

Map<String, dynamic> _$$AnalyticsInsightImplToJson(
        _$AnalyticsInsightImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'type': _$InsightTypeEnumMap[instance.type]!,
      'priority': _$InsightPriorityEnumMap[instance.priority]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'affectedMetrics': instance.affectedMetrics,
      'recommendedActions': instance.recommendedActions,
      'sourceQuery': instance.sourceQuery,
      'confidence': instance.confidence,
      'evidence': instance.evidence,
      'validUntil': instance.validUntil?.toIso8601String(),
    };

const _$InsightTypeEnumMap = {
  InsightType.trend: 'trend',
  InsightType.anomaly: 'anomaly',
  InsightType.correlation: 'correlation',
  InsightType.prediction: 'prediction',
  InsightType.opportunity: 'opportunity',
  InsightType.risk: 'risk',
  InsightType.performance: 'performance',
  InsightType.benchmark: 'benchmark',
};

const _$InsightPriorityEnumMap = {
  InsightPriority.low: 'low',
  InsightPriority.medium: 'medium',
  InsightPriority.high: 'high',
  InsightPriority.critical: 'critical',
};

_$InsightActionImpl _$$InsightActionImplFromJson(Map<String, dynamic> json) =>
    _$InsightActionImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      type: $enumDecode(_$ActionTypeEnumMap, json['type']),
      estimatedImpact: json['estimatedImpact'] as String?,
      timeframe: json['timeframe'] as String?,
      prerequisites: (json['prerequisites'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$InsightActionImplToJson(_$InsightActionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'type': _$ActionTypeEnumMap[instance.type]!,
      'estimatedImpact': instance.estimatedImpact,
      'timeframe': instance.timeframe,
      'prerequisites': instance.prerequisites,
    };

const _$ActionTypeEnumMap = {
  ActionType.investigate: 'investigate',
  ActionType.optimize: 'optimize',
  ActionType.alert: 'alert',
  ActionType.schedule: 'schedule',
  ActionType.automate: 'automate',
  ActionType.escalate: 'escalate',
  ActionType.monitor: 'monitor',
};

_$DataSourceImpl _$$DataSourceImplFromJson(Map<String, dynamic> json) =>
    _$DataSourceImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      type: $enumDecode(_$DataSourceTypeEnumMap, json['type']),
      connectionConfig: json['connectionConfig'] as Map<String, dynamic>,
      isActive: json['isActive'] as bool,
      availableMetrics: (json['availableMetrics'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      lastSyncAt: json['lastSyncAt'] == null
          ? null
          : DateTime.parse(json['lastSyncAt'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      createdBy: json['createdBy'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$DataSourceImplToJson(_$DataSourceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'type': _$DataSourceTypeEnumMap[instance.type]!,
      'connectionConfig': instance.connectionConfig,
      'isActive': instance.isActive,
      'availableMetrics': instance.availableMetrics,
      'lastSyncAt': instance.lastSyncAt?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'createdBy': instance.createdBy,
      'metadata': instance.metadata,
    };

const _$DataSourceTypeEnumMap = {
  DataSourceType.database: 'database',
  DataSourceType.api: 'api',
  DataSourceType.file: 'file',
  DataSourceType.realtime: 'realtime',
  DataSourceType.webhook: 'webhook',
  DataSourceType.integration: 'integration',
};

_$AnalyticsQueryImpl _$$AnalyticsQueryImplFromJson(Map<String, dynamic> json) =>
    _$AnalyticsQueryImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      type: $enumDecode(_$QueryTypeEnumMap, json['type']),
      queryConfig: json['queryConfig'] as Map<String, dynamic>,
      dataSources: (json['dataSources'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      filters: (json['filters'] as List<dynamic>?)
              ?.map((e) => QueryFilter.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      groupings: (json['groupings'] as List<dynamic>?)
              ?.map((e) => QueryGrouping.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      aggregations: (json['aggregations'] as List<dynamic>?)
              ?.map((e) => QueryAggregation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      createdBy: json['createdBy'] as String?,
    );

Map<String, dynamic> _$$AnalyticsQueryImplToJson(
        _$AnalyticsQueryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'type': _$QueryTypeEnumMap[instance.type]!,
      'queryConfig': instance.queryConfig,
      'dataSources': instance.dataSources,
      'filters': instance.filters,
      'groupings': instance.groupings,
      'aggregations': instance.aggregations,
      'createdAt': instance.createdAt?.toIso8601String(),
      'createdBy': instance.createdBy,
    };

const _$QueryTypeEnumMap = {
  QueryType.metric: 'metric',
  QueryType.trend: 'trend',
  QueryType.comparison: 'comparison',
  QueryType.distribution: 'distribution',
  QueryType.correlation: 'correlation',
  QueryType.custom: 'custom',
};

_$QueryFilterImpl _$$QueryFilterImplFromJson(Map<String, dynamic> json) =>
    _$QueryFilterImpl(
      field: json['field'] as String,
      operator: $enumDecode(_$FilterOperatorEnumMap, json['operator']),
      value: json['value'],
      displayName: json['displayName'] as String?,
    );

Map<String, dynamic> _$$QueryFilterImplToJson(_$QueryFilterImpl instance) =>
    <String, dynamic>{
      'field': instance.field,
      'operator': _$FilterOperatorEnumMap[instance.operator]!,
      'value': instance.value,
      'displayName': instance.displayName,
    };

const _$FilterOperatorEnumMap = {
  FilterOperator.equals: 'equals',
  FilterOperator.notEquals: 'notEquals',
  FilterOperator.greaterThan: 'greaterThan',
  FilterOperator.lessThan: 'lessThan',
  FilterOperator.greaterThanOrEqual: 'greaterThanOrEqual',
  FilterOperator.lessThanOrEqual: 'lessThanOrEqual',
  FilterOperator.contains: 'contains',
  FilterOperator.notContains: 'notContains',
  FilterOperator.startsWith: 'startsWith',
  FilterOperator.endsWith: 'endsWith',
  FilterOperator.isNull: 'isNull',
  FilterOperator.isNotNull: 'isNotNull',
  FilterOperator.inList: 'inList',
  FilterOperator.notInList: 'notInList',
};

_$QueryGroupingImpl _$$QueryGroupingImplFromJson(Map<String, dynamic> json) =>
    _$QueryGroupingImpl(
      field: json['field'] as String,
      type: $enumDecode(_$GroupingTypeEnumMap, json['type']),
      displayName: json['displayName'] as String?,
    );

Map<String, dynamic> _$$QueryGroupingImplToJson(_$QueryGroupingImpl instance) =>
    <String, dynamic>{
      'field': instance.field,
      'type': _$GroupingTypeEnumMap[instance.type]!,
      'displayName': instance.displayName,
    };

const _$GroupingTypeEnumMap = {
  GroupingType.field: 'field',
  GroupingType.date: 'date',
  GroupingType.dateMonth: 'dateMonth',
  GroupingType.dateWeek: 'dateWeek',
  GroupingType.dateYear: 'dateYear',
  GroupingType.range: 'range',
};

_$QueryAggregationImpl _$$QueryAggregationImplFromJson(
        Map<String, dynamic> json) =>
    _$QueryAggregationImpl(
      field: json['field'] as String,
      type: $enumDecode(_$AggregationTypeEnumMap, json['type']),
      displayName: json['displayName'] as String?,
      alias: json['alias'] as String?,
    );

Map<String, dynamic> _$$QueryAggregationImplToJson(
        _$QueryAggregationImpl instance) =>
    <String, dynamic>{
      'field': instance.field,
      'type': _$AggregationTypeEnumMap[instance.type]!,
      'displayName': instance.displayName,
      'alias': instance.alias,
    };

const _$AggregationTypeEnumMap = {
  AggregationType.sum: 'sum',
  AggregationType.average: 'average',
  AggregationType.count: 'count',
  AggregationType.countDistinct: 'countDistinct',
  AggregationType.min: 'min',
  AggregationType.max: 'max',
  AggregationType.median: 'median',
  AggregationType.percentile: 'percentile',
  AggregationType.standardDeviation: 'standardDeviation',
  AggregationType.variance: 'variance',
};
