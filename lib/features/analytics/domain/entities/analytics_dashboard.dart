import 'package:freezed_annotation/freezed_annotation.dart';

part 'analytics_dashboard.freezed.dart';
part 'analytics_dashboard.g.dart';

/// Analytics dashboard entity for comprehensive business insights
@freezed
class AnalyticsDashboard with _$AnalyticsDashboard {
  const factory AnalyticsDashboard({
    required String id,
    required String userId,
    required String organizationId,
    required String title,
    required DashboardType type,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default([]) List<AnalyticsWidget> widgets,
    @Default({}) Map<String, dynamic> configuration,
    @Default([]) List<String> sharedWith,
    String? description,
    bool? isDefault,
    DateTime? lastViewedAt,
  }) = _AnalyticsDashboard;

  factory AnalyticsDashboard.fromJson(Map<String, dynamic> json) => 
    _$AnalyticsDashboardFromJson(json);
}

/// Dashboard type enum
enum DashboardType {
  investor('Investor Dashboard'),
  organization('Organization Dashboard'),
  project('Project Dashboard'),
  compliance('Compliance Dashboard'),
  executive('Executive Dashboard'),
  custom('Custom Dashboard');

  const DashboardType(this.displayName);
  final String displayName;
}

/// Analytics widget for dashboard components
@freezed
class AnalyticsWidget with _$AnalyticsWidget {
  const factory AnalyticsWidget({
    required String id,
    required String title,
    required WidgetType type,
    required int positionX,
    required int positionY,
    required int width,
    required int height,
    required Map<String, dynamic> configuration,
    @Default({}) Map<String, dynamic> data,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _AnalyticsWidget;

  factory AnalyticsWidget.fromJson(Map<String, dynamic> json) => 
    _$AnalyticsWidgetFromJson(json);
}

/// Widget type enum
enum WidgetType {
  // Financial Widgets
  portfolioOverview('Portfolio Overview'),
  investmentPerformance('Investment Performance'),
  dividendSummary('Dividend Summary'),
  cashFlow('Cash Flow Analysis'),
  
  // Project Widgets
  projectStatus('Project Status'),
  fundingProgress('Funding Progress'),
  impactMetrics('Impact Metrics'),
  milestoneTimeline('Milestone Timeline'),
  
  // Analytics Widgets
  performanceChart('Performance Chart'),
  comparisonChart('Comparison Chart'),
  trendAnalysis('Trend Analysis'),
  kpiCard('KPI Card'),
  
  // Compliance Widgets
  complianceStatus('Compliance Status'),
  auditSummary('Audit Summary'),
  riskAssessment('Risk Assessment'),
  
  // Communication Widgets
  notificationSummary('Notification Summary'),
  activityFeed('Activity Feed'),
  userEngagement('User Engagement'),
  
  // Custom Widgets
  customChart('Custom Chart'),
  customTable('Custom Table'),
  customMetric('Custom Metric');

  const WidgetType(this.displayName);
  final String displayName;
}

/// Key Performance Indicator entity
@freezed
class KPI with _$KPI {
  const factory KPI({
    required String id,
    required String name,
    required String description,
    required KPICategory category,
    required double currentValue,
    required double targetValue,
    required String unit,
    required KPIDirection direction,
    DateTime? previousValue,
    DateTime? lastUpdated,
    @Default([]) List<KPIDataPoint> historicalData,
    Map<String, dynamic>? metadata,
  }) = _KPI;

  factory KPI.fromJson(Map<String, dynamic> json) => 
    _$KPIFromJson(json);
}

/// KPI category enum
enum KPICategory {
  financial('Financial'),
  impact('Impact'),
  operational('Operational'),
  engagement('Engagement'),
  compliance('Compliance'),
  growth('Growth'),
  efficiency('Efficiency'),
  sustainability('Sustainability');

  const KPICategory(this.displayName);
  final String displayName;
}

/// KPI direction enum (higher or lower is better)
enum KPIDirection {
  higher('Higher is Better'),
  lower('Lower is Better'),
  stable('Stable is Better');

  const KPIDirection(this.displayName);
  final String displayName;
}

/// KPI data point for historical tracking
@freezed
class KPIDataPoint with _$KPIDataPoint {
  const factory KPIDataPoint({
    required DateTime timestamp,
    required double value,
    String? note,
    Map<String, dynamic>? context,
  }) = _KPIDataPoint;

  factory KPIDataPoint.fromJson(Map<String, dynamic> json) => 
    _$KPIDataPointFromJson(json);
}

/// Analytics report entity
@freezed
class AnalyticsReport with _$AnalyticsReport {
  const factory AnalyticsReport({
    required String id,
    required String title,
    required String description,
    required ReportType type,
    required ReportStatus status,
    required DateTime periodStart,
    required DateTime periodEnd,
    required DateTime createdAt,
    @Default([]) List<ReportSection> sections,
    @Default([]) List<String> recipients,
    String? createdBy,
    DateTime? scheduledAt,
    String? templateId,
    Map<String, dynamic>? metadata,
  }) = _AnalyticsReport;

  factory AnalyticsReport.fromJson(Map<String, dynamic> json) => 
    _$AnalyticsReportFromJson(json);
}

/// Report type enum
enum ReportType {
  performance('Performance Report'),
  impact('Impact Report'),
  financial('Financial Report'),
  compliance('Compliance Report'),
  executive('Executive Summary'),
  investor('Investor Update'),
  quarterly('Quarterly Report'),
  annual('Annual Report'),
  custom('Custom Report');

  const ReportType(this.displayName);
  final String displayName;
}

/// Report status enum
enum ReportStatus {
  draft('Draft'),
  generating('Generating'),
  completed('Completed'),
  scheduled('Scheduled'),
  sent('Sent'),
  failed('Failed');

  const ReportStatus(this.displayName);
  final String displayName;
}

/// Report section entity
@freezed
class ReportSection with _$ReportSection {
  const factory ReportSection({
    required String id,
    required String title,
    required SectionType type,
    required int order,
    required Map<String, dynamic> content,
    String? description,
    @Default([]) List<ReportChart> charts,
    @Default([]) List<ReportTable> tables,
    Map<String, dynamic>? configuration,
  }) = _ReportSection;

  factory ReportSection.fromJson(Map<String, dynamic> json) => 
    _$ReportSectionFromJson(json);
}

/// Section type enum
enum SectionType {
  summary('Summary'),
  charts('Charts & Graphs'),
  tables('Tables & Data'),
  narrative('Narrative'),
  recommendations('Recommendations'),
  appendix('Appendix');

  const SectionType(this.displayName);
  final String displayName;
}

/// Report chart entity
@freezed
class ReportChart with _$ReportChart {
  const factory ReportChart({
    required String id,
    required String title,
    required ChartType type,
    required Map<String, dynamic> data,
    @Default({}) Map<String, dynamic> configuration,
    String? description,
    String? xAxisLabel,
    String? yAxisLabel,
  }) = _ReportChart;

  factory ReportChart.fromJson(Map<String, dynamic> json) => 
    _$ReportChartFromJson(json);
}

/// Chart type enum
enum ChartType {
  line('Line Chart'),
  bar('Bar Chart'),
  pie('Pie Chart'),
  area('Area Chart'),
  scatter('Scatter Plot'),
  histogram('Histogram'),
  heatmap('Heat Map'),
  funnel('Funnel Chart'),
  gauge('Gauge Chart'),
  waterfall('Waterfall Chart');

  const ChartType(this.displayName);
  final String displayName;
}

/// Report table entity
@freezed
class ReportTable with _$ReportTable {
  const factory ReportTable({
    required String id,
    required String title,
    required List<String> headers,
    required List<List<dynamic>> rows,
    String? description,
    @Default({}) Map<String, dynamic> formatting,
  }) = _ReportTable;

  factory ReportTable.fromJson(Map<String, dynamic> json) => 
    _$ReportTableFromJson(json);
}

/// Analytics insight entity for AI-generated insights
@freezed
class AnalyticsInsight with _$AnalyticsInsight {
  const factory AnalyticsInsight({
    required String id,
    required String title,
    required String description,
    required InsightType type,
    required InsightPriority priority,
    required DateTime createdAt,
    @Default([]) List<String> affectedMetrics,
    @Default([]) List<InsightAction> recommendedActions,
    String? sourceQuery,
    double? confidence,
    Map<String, dynamic>? evidence,
    DateTime? validUntil,
  }) = _AnalyticsInsight;

  factory AnalyticsInsight.fromJson(Map<String, dynamic> json) => 
    _$AnalyticsInsightFromJson(json);
}

/// Insight type enum
enum InsightType {
  trend('Trend Analysis'),
  anomaly('Anomaly Detection'),
  correlation('Correlation'),
  prediction('Prediction'),
  opportunity('Opportunity'),
  risk('Risk Alert'),
  performance('Performance'),
  benchmark('Benchmark Comparison');

  const InsightType(this.displayName);
  final String displayName;
}

/// Insight priority enum
enum InsightPriority {
  low('Low'),
  medium('Medium'),
  high('High'),
  critical('Critical');

  const InsightPriority(this.displayName);
  final String displayName;
}

/// Insight action recommendation
@freezed
class InsightAction with _$InsightAction {
  const factory InsightAction({
    required String id,
    required String title,
    required String description,
    required ActionType type,
    String? estimatedImpact,
    String? timeframe,
    @Default([]) List<String> prerequisites,
  }) = _InsightAction;

  factory InsightAction.fromJson(Map<String, dynamic> json) => 
    _$InsightActionFromJson(json);
}

/// Action type enum
enum ActionType {
  investigate('Investigate Further'),
  optimize('Optimize Process'),
  alert('Send Alert'),
  schedule('Schedule Review'),
  automate('Automate Task'),
  escalate('Escalate Issue'),
  monitor('Monitor Closely');

  const ActionType(this.displayName);
  final String displayName;
}

/// Data source configuration for analytics
@freezed
class DataSource with _$DataSource {
  const factory DataSource({
    required String id,
    required String name,
    required String description,
    required DataSourceType type,
    required Map<String, dynamic> connectionConfig,
    required bool isActive,
    @Default([]) List<String> availableMetrics,
    DateTime? lastSyncAt,
    DateTime? createdAt,
    String? createdBy,
    Map<String, dynamic>? metadata,
  }) = _DataSource;

  factory DataSource.fromJson(Map<String, dynamic> json) => 
    _$DataSourceFromJson(json);
}

/// Data source type enum
enum DataSourceType {
  database('Database'),
  api('REST API'),
  file('File Upload'),
  realtime('Real-time Stream'),
  webhook('Webhook'),
  integration('Third-party Integration');

  const DataSourceType(this.displayName);
  final String displayName;
}

/// Query builder entity for custom analytics
@freezed
class AnalyticsQuery with _$AnalyticsQuery {
  const factory AnalyticsQuery({
    required String id,
    required String name,
    required String description,
    required QueryType type,
    required Map<String, dynamic> queryConfig,
    @Default([]) List<String> dataSources,
    @Default([]) List<QueryFilter> filters,
    @Default([]) List<QueryGrouping> groupings,
    @Default([]) List<QueryAggregation> aggregations,
    DateTime? createdAt,
    String? createdBy,
  }) = _AnalyticsQuery;

  factory AnalyticsQuery.fromJson(Map<String, dynamic> json) => 
    _$AnalyticsQueryFromJson(json);
}

/// Query type enum
enum QueryType {
  metric('Metric Query'),
  trend('Trend Analysis'),
  comparison('Comparison Query'),
  distribution('Distribution Analysis'),
  correlation('Correlation Analysis'),
  custom('Custom Query');

  const QueryType(this.displayName);
  final String displayName;
}

/// Query filter entity
@freezed
class QueryFilter with _$QueryFilter {
  const factory QueryFilter({
    required String field,
    required FilterOperator operator,
    required dynamic value,
    String? displayName,
  }) = _QueryFilter;

  factory QueryFilter.fromJson(Map<String, dynamic> json) => 
    _$QueryFilterFromJson(json);
}

/// Filter operator enum
enum FilterOperator {
  equals('Equals'),
  notEquals('Not Equals'),
  greaterThan('Greater Than'),
  lessThan('Less Than'),
  greaterThanOrEqual('Greater Than or Equal'),
  lessThanOrEqual('Less Than or Equal'),
  contains('Contains'),
  notContains('Does Not Contain'),
  startsWith('Starts With'),
  endsWith('Ends With'),
  isNull('Is Null'),
  isNotNull('Is Not Null'),
  inList('In List'),
  notInList('Not In List');

  const FilterOperator(this.displayName);
  final String displayName;
}

/// Query grouping entity
@freezed
class QueryGrouping with _$QueryGrouping {
  const factory QueryGrouping({
    required String field,
    required GroupingType type,
    String? displayName,
  }) = _QueryGrouping;

  factory QueryGrouping.fromJson(Map<String, dynamic> json) => 
    _$QueryGroupingFromJson(json);
}

/// Grouping type enum
enum GroupingType {
  field('By Field'),
  date('By Date'),
  dateMonth('By Month'),
  dateWeek('By Week'),
  dateYear('By Year'),
  range('By Range');

  const GroupingType(this.displayName);
  final String displayName;
}

/// Query aggregation entity
@freezed
class QueryAggregation with _$QueryAggregation {
  const factory QueryAggregation({
    required String field,
    required AggregationType type,
    String? displayName,
    String? alias,
  }) = _QueryAggregation;

  factory QueryAggregation.fromJson(Map<String, dynamic> json) => 
    _$QueryAggregationFromJson(json);
}

/// Aggregation type enum
enum AggregationType {
  sum('Sum'),
  average('Average'),
  count('Count'),
  countDistinct('Count Distinct'),
  min('Minimum'),
  max('Maximum'),
  median('Median'),
  percentile('Percentile'),
  standardDeviation('Standard Deviation'),
  variance('Variance');

  const AggregationType(this.displayName);
  final String displayName;
}