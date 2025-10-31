import 'package:freezed_annotation/freezed_annotation.dart';

part 'project.freezed.dart';
part 'project.g.dart';

/// Project entity representing social impact projects
@freezed
class Project with _$Project {
  const factory Project({
    required String id,
    required String organizationId,
    required String name,
    required String description,
    required ProjectCategory category,
    required ProjectStatus status,
    required double fundingGoal,
    required double currentFunding,
    required String currency,
    required DateTime startDate,
    required DateTime endDate,
    required String location,
    @Default([]) List<String> images,
    @Default([]) List<String> documents,
    @Default([]) List<ProjectMilestone> milestones,
    @Default([]) List<ImpactMetric> impactMetrics,
    String? videoUrl,
    Map<String, dynamic>? metadata,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Project;

  factory Project.fromJson(Map<String, dynamic> json) => _$ProjectFromJson(json);
}

/// Project category enum
enum ProjectCategory {
  education('Education'),
  healthcare('Healthcare'),
  environment('Environment'),
  poverty('Poverty Alleviation'),
  infrastructure('Infrastructure'),
  agriculture('Agriculture'),
  technology('Technology'),
  financialInclusion('Financial Inclusion'),
  cleanEnergy('Clean Energy'),
  waterSanitation('Water & Sanitation');

  const ProjectCategory(this.displayName);
  final String displayName;
}

/// Project status enum
enum ProjectStatus {
  draft('Draft'),
  submitted('Submitted'),
  underReview('Under Review'),
  approved('Approved'),
  fundingActive('Funding Active'),
  fundingComplete('Funding Complete'),
  implementation('Implementation'),
  completed('Completed'),
  suspended('Suspended'),
  cancelled('Cancelled');

  const ProjectStatus(this.displayName);
  final String displayName;
}

/// Project milestone
@freezed
class ProjectMilestone with _$ProjectMilestone {
  const factory ProjectMilestone({
    required String id,
    required String projectId,
    required String title,
    required String description,
    required DateTime targetDate,
    required MilestoneStatus status,
    double? fundingRequired,
    String? evidenceUrl,
    DateTime? completedDate,
    String? notes,
  }) = _ProjectMilestone;

  factory ProjectMilestone.fromJson(Map<String, dynamic> json) => 
    _$ProjectMilestoneFromJson(json);
}

/// Milestone status enum
enum MilestoneStatus {
  pending('Pending'),
  inProgress('In Progress'),
  completed('Completed'),
  delayed('Delayed'),
  cancelled('Cancelled');

  const MilestoneStatus(this.displayName);
  final String displayName;
}

/// Impact metric for measuring project outcomes
@freezed
class ImpactMetric with _$ImpactMetric {
  const factory ImpactMetric({
    required String id,
    required String projectId,
    required String name,
    required String description,
    required String unit,
    required double targetValue,
    required double currentValue,
    required MetricType type,
    String? verificationMethod,
    DateTime? lastUpdated,
  }) = _ImpactMetric;

  factory ImpactMetric.fromJson(Map<String, dynamic> json) => 
    _$ImpactMetricFromJson(json);
}

/// Impact metric type
enum MetricType {
  beneficiaries('Beneficiaries'),
  environmental('Environmental'),
  economic('Economic'),
  social('Social'),
  educational('Educational'),
  health('Health');

  const MetricType(this.displayName);
  final String displayName;
}

/// Project search and filter criteria
@freezed
class ProjectSearchCriteria with _$ProjectSearchCriteria {
  const factory ProjectSearchCriteria({
    String? query,
    List<ProjectCategory>? categories,
    List<ProjectStatus>? statuses,
    double? minFunding,
    double? maxFunding,
    String? location,
    String? organizationId,
    ProjectSortBy? sortBy,
    SortOrder? sortOrder,
  }) = _ProjectSearchCriteria;

  factory ProjectSearchCriteria.fromJson(Map<String, dynamic> json) => 
    _$ProjectSearchCriteriaFromJson(json);
}

/// Project sorting options
enum ProjectSortBy {
  name('Name'),
  fundingGoal('Funding Goal'),
  currentFunding('Current Funding'),
  startDate('Start Date'),
  category('Category'),
  status('Status');

  const ProjectSortBy(this.displayName);
  final String displayName;
}

/// Project funding summary
@freezed
class ProjectFundingSummary with _$ProjectFundingSummary {
  const factory ProjectFundingSummary({
    required String projectId,
    required double totalFunding,
    required double fundingGoal,
    required double fundingPercentage,
    required int investorCount,
    required double averageInvestment,
    required DateTime lastInvestmentDate,
    @Default([]) List<FundingBreakdown> breakdown,
  }) = _ProjectFundingSummary;

  factory ProjectFundingSummary.fromJson(Map<String, dynamic> json) => 
    _$ProjectFundingSummaryFromJson(json);
}

/// Funding breakdown by investment type
@freezed
class FundingBreakdown with _$FundingBreakdown {
  const factory FundingBreakdown({
    required InvestmentType type,
    required double amount,
    required double percentage,
    required int investmentCount,
  }) = _FundingBreakdown;

  factory FundingBreakdown.fromJson(Map<String, dynamic> json) => 
    _$FundingBreakdownFromJson(json);
}

/// Organization entity
@freezed
class Organization with _$Organization {
  const factory Organization({
    required String id,
    required String name,
    required String description,
    required String email,
    String? phone,
    String? website,
    required String address,
    required OrganizationType type,
    required OrganizationStatus status,
    String? logoUrl,
    @Default([]) List<String> certifications,
    @Default([]) List<Project> projects,
    Map<String, dynamic>? metadata,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Organization;

  factory Organization.fromJson(Map<String, dynamic> json) => 
    _$OrganizationFromJson(json);
}

/// Organization type enum
enum OrganizationType {
  ngo('NGO'),
  socialEnterprise('Social Enterprise'),
  cooperative('Cooperative'),
  government('Government Agency'),
  international('International Organization');

  const OrganizationType(this.displayName);
  final String displayName;
}

/// Organization status enum
enum OrganizationStatus {
  active('Active'),
  pending('Pending Verification'),
  suspended('Suspended'),
  inactive('Inactive');

  const OrganizationStatus(this.displayName);
  final String displayName;
}

/// Import investment type for reference
enum InvestmentType {
  equity('Equity'),
  debt('Debt'),
  hybrid('Hybrid'),
  donation('Donation');

  const InvestmentType(this.displayName);
  final String displayName;
}

/// Sort order enum
enum SortOrder {
  ascending('Ascending'),
  descending('Descending');

  const SortOrder(this.displayName);
  final String displayName;
}