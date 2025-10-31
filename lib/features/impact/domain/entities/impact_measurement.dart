import 'package:freezed_annotation/freezed_annotation.dart';

part 'impact_measurement.freezed.dart';
part 'impact_measurement.g.dart';

/// Impact measurement entity for tracking social and environmental outcomes
@freezed
class ImpactMeasurement with _$ImpactMeasurement {
  const factory ImpactMeasurement({
    required String id,
    required String projectId,
    required String organizationId,
    required String metricName,
    required String description,
    required ImpactCategory category,
    required MeasurementUnit unit,
    required double targetValue,
    required double currentValue,
    required DateTime measurementDate,
    required MeasurementStatus status,
    required VerificationLevel verificationLevel,
    @Default([]) List<String> evidenceUrls,
    @Default([]) List<ImpactDataPoint> dataPoints,
    String? verifierName,
    String? verificationNotes,
    Map<String, dynamic>? metadata,
    DateTime? lastVerified,
    DateTime? nextReviewDate,
  }) = _ImpactMeasurement;

  factory ImpactMeasurement.fromJson(Map<String, dynamic> json) => 
    _$ImpactMeasurementFromJson(json);
}

/// Impact category enum aligned with UN SDGs
enum ImpactCategory {
  noPoverty('No Poverty', 1),
  zeroHunger('Zero Hunger', 2),
  goodHealth('Good Health and Well-being', 3),
  qualityEducation('Quality Education', 4),
  genderEquality('Gender Equality', 5),
  cleanWater('Clean Water and Sanitation', 6),
  affordableEnergy('Affordable and Clean Energy', 7),
  decentWork('Decent Work and Economic Growth', 8),
  industryInnovation('Industry, Innovation and Infrastructure', 9),
  reducedInequalities('Reduced Inequalities', 10),
  sustainableCities('Sustainable Cities and Communities', 11),
  responsibleConsumption('Responsible Consumption and Production', 12),
  climateAction('Climate Action', 13),
  lifeBelow('Life Below Water', 14),
  lifeOnLand('Life on Land', 15),
  peaceJustice('Peace, Justice and Strong Institutions', 16),
  partnerships('Partnerships for the Goals', 17);

  const ImpactCategory(this.displayName, this.sdgNumber);
  final String displayName;
  final int sdgNumber;
}

/// Measurement unit enum
enum MeasurementUnit {
  people('People'),
  households('Households'),
  communities('Communities'),
  students('Students'),
  patients('Patients'),
  jobs('Jobs Created'),
  kwh('kWh'),
  mwh('MWh'),
  tons('Tons'),
  liters('Liters'),
  meters('Meters'),
  hectares('Hectares'),
  percentage('Percentage'),
  ratio('Ratio'),
  score('Score'),
  currency('Currency'),
  custom('Custom Unit');

  const MeasurementUnit(this.displayName);
  final String displayName;
}

/// Measurement status enum
enum MeasurementStatus {
  planned('Planned'),
  inProgress('In Progress'),
  achieved('Achieved'),
  exceeded('Exceeded'),
  delayed('Delayed'),
  notAchieved('Not Achieved');

  const MeasurementStatus(this.displayName);
  final String displayName;
}

/// Verification level enum
enum VerificationLevel {
  selfReported('Self-Reported'),
  peerReviewed('Peer Reviewed'),
  thirdPartyVerified('Third Party Verified'),
  independentlyAudited('Independently Audited');

  const VerificationLevel(this.displayName);
  final String displayName;
}

/// Impact data point for tracking progress over time
@freezed
class ImpactDataPoint with _$ImpactDataPoint {
  const factory ImpactDataPoint({
    required String id,
    required DateTime timestamp,
    required double value,
    required String source,
    String? notes,
    Map<String, dynamic>? metadata,
  }) = _ImpactDataPoint;

  factory ImpactDataPoint.fromJson(Map<String, dynamic> json) => 
    _$ImpactDataPointFromJson(json);
}

/// Impact report entity
@freezed
class ImpactReport with _$ImpactReport {
  const factory ImpactReport({
    required String id,
    required String projectId,
    required String organizationId,
    required String title,
    required String description,
    required ReportType type,
    required ReportPeriod period,
    required DateTime startDate,
    required DateTime endDate,
    required DateTime generatedAt,
    required ReportStatus status,
    @Default([]) List<String> measurementIds,
    @Default([]) List<ImpactSummary> summaries,
    @Default([]) List<String> attachmentUrls,
    String? generatedBy,
    String? reviewedBy,
    DateTime? reviewedAt,
    String? publicUrl,
  }) = _ImpactReport;

  factory ImpactReport.fromJson(Map<String, dynamic> json) => 
    _$ImpactReportFromJson(json);
}

/// Report type enum
enum ReportType {
  quarterly('Quarterly Report'),
  annual('Annual Report'),
  milestone('Milestone Report'),
  impact('Impact Assessment'),
  compliance('Compliance Report'),
  investor('Investor Update');

  const ReportType(this.displayName);
  final String displayName;
}

/// Report period enum
enum ReportPeriod {
  monthly('Monthly'),
  quarterly('Quarterly'),
  semiAnnual('Semi-Annual'),
  annual('Annual'),
  custom('Custom Period');

  const ReportPeriod(this.displayName);
  final String displayName;
}

/// Report status enum
enum ReportStatus {
  draft('Draft'),
  underReview('Under Review'),
  approved('Approved'),
  published('Published'),
  archived('Archived');

  const ReportStatus(this.displayName);
  final String displayName;
}

/// Impact summary for aggregated metrics
@freezed
class ImpactSummary with _$ImpactSummary {
  const factory ImpactSummary({
    required ImpactCategory category,
    required String metricName,
    required double targetValue,
    required double achievedValue,
    required double progressPercentage,
    required int beneficiariesCount,
    required String currency,
    double? investmentAmount,
    double? costPerBeneficiary,
  }) = _ImpactSummary;

  factory ImpactSummary.fromJson(Map<String, dynamic> json) => 
    _$ImpactSummaryFromJson(json);
}

/// Impact assessment template
@freezed
class ImpactAssessmentTemplate with _$ImpactAssessmentTemplate {
  const factory ImpactAssessmentTemplate({
    required String id,
    required String name,
    required String description,
    required ImpactCategory category,
    required TemplateType type,
    @Default([]) List<MetricTemplate> metricTemplates,
    @Default([]) List<String> requiredDocuments,
    Map<String, dynamic>? configuration,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _ImpactAssessmentTemplate;

  factory ImpactAssessmentTemplate.fromJson(Map<String, dynamic> json) => 
    _$ImpactAssessmentTemplateFromJson(json);
}

/// Template type enum
enum TemplateType {
  standard('Standard Template'),
  custom('Custom Template'),
  industry('Industry Specific'),
  regulatory('Regulatory Compliance');

  const TemplateType(this.displayName);
  final String displayName;
}

/// Metric template for standardized measurements
@freezed
class MetricTemplate with _$MetricTemplate {
  const factory MetricTemplate({
    required String id,
    required String name,
    required String description,
    required MeasurementUnit unit,
    required MetricType metricType,
    required bool isRequired,
    double? minValue,
    double? maxValue,
    String? calculationFormula,
    @Default([]) List<String> validationRules,
  }) = _MetricTemplate;

  factory MetricTemplate.fromJson(Map<String, dynamic> json) => 
    _$MetricTemplateFromJson(json);
}

/// Metric type enum
enum MetricType {
  output('Output Metric'),
  outcome('Outcome Metric'),
  impact('Impact Metric'),
  process('Process Metric'),
  financial('Financial Metric');

  const MetricType(this.displayName);
  final String displayName;
}

/// Impact dashboard configuration
@freezed
class ImpactDashboardConfig with _$ImpactDashboardConfig {
  const factory ImpactDashboardConfig({
    required String id,
    required String userId,
    required String name,
    required DashboardType dashboardType,
    @Default([]) List<String> selectedProjects,
    @Default([]) List<ImpactCategory> selectedCategories,
    @Default([]) List<String> selectedMetrics,
    required DateRange dateRange,
    @Default([]) List<ChartConfiguration> charts,
    Map<String, dynamic>? filters,
    DateTime? lastModified,
  }) = _ImpactDashboardConfig;

  factory ImpactDashboardConfig.fromJson(Map<String, dynamic> json) => 
    _$ImpactDashboardConfigFromJson(json);
}

/// Dashboard type enum
enum DashboardType {
  investor('Investor Dashboard'),
  organization('Organization Dashboard'),
  project('Project Dashboard'),
  public('Public Dashboard'),
  regulatory('Regulatory Dashboard');

  const DashboardType(this.displayName);
  final String displayName;
}

/// Date range for reporting
@freezed
class DateRange with _$DateRange {
  const factory DateRange({
    required DateTime startDate,
    required DateTime endDate,
    String? label,
  }) = _DateRange;

  factory DateRange.fromJson(Map<String, dynamic> json) => 
    _$DateRangeFromJson(json);
}

/// Chart configuration for visualizations
@freezed
class ChartConfiguration with _$ChartConfiguration {
  const factory ChartConfiguration({
    required String id,
    required ChartType chartType,
    required String title,
    required String dataSource,
    @Default([]) List<String> metrics,
    Map<String, dynamic>? options,
  }) = _ChartConfiguration;

  factory ChartConfiguration.fromJson(Map<String, dynamic> json) => 
    _$ChartConfigurationFromJson(json);
}

/// Chart type enum
enum ChartType {
  lineChart('Line Chart'),
  barChart('Bar Chart'),
  pieChart('Pie Chart'),
  areaChart('Area Chart'),
  scatterPlot('Scatter Plot'),
  heatmap('Heatmap'),
  gauge('Gauge Chart'),
  table('Data Table');

  const ChartType(this.displayName);
  final String displayName;
}