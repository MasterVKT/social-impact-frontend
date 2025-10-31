// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectImpl _$$ProjectImplFromJson(Map<String, dynamic> json) =>
    _$ProjectImpl(
      id: json['id'] as String,
      organizationId: json['organizationId'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      category: $enumDecode(_$ProjectCategoryEnumMap, json['category']),
      status: $enumDecode(_$ProjectStatusEnumMap, json['status']),
      fundingGoal: (json['fundingGoal'] as num).toDouble(),
      currentFunding: (json['currentFunding'] as num).toDouble(),
      currency: json['currency'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      location: json['location'] as String,
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      documents: (json['documents'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      milestones: (json['milestones'] as List<dynamic>?)
              ?.map((e) => ProjectMilestone.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      impactMetrics: (json['impactMetrics'] as List<dynamic>?)
              ?.map((e) => ImpactMetric.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      videoUrl: json['videoUrl'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$ProjectImplToJson(_$ProjectImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'organizationId': instance.organizationId,
      'name': instance.name,
      'description': instance.description,
      'category': _$ProjectCategoryEnumMap[instance.category]!,
      'status': _$ProjectStatusEnumMap[instance.status]!,
      'fundingGoal': instance.fundingGoal,
      'currentFunding': instance.currentFunding,
      'currency': instance.currency,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'location': instance.location,
      'images': instance.images,
      'documents': instance.documents,
      'milestones': instance.milestones,
      'impactMetrics': instance.impactMetrics,
      'videoUrl': instance.videoUrl,
      'metadata': instance.metadata,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

const _$ProjectCategoryEnumMap = {
  ProjectCategory.education: 'education',
  ProjectCategory.healthcare: 'healthcare',
  ProjectCategory.environment: 'environment',
  ProjectCategory.poverty: 'poverty',
  ProjectCategory.infrastructure: 'infrastructure',
  ProjectCategory.agriculture: 'agriculture',
  ProjectCategory.technology: 'technology',
  ProjectCategory.financialInclusion: 'financialInclusion',
  ProjectCategory.cleanEnergy: 'cleanEnergy',
  ProjectCategory.waterSanitation: 'waterSanitation',
};

const _$ProjectStatusEnumMap = {
  ProjectStatus.draft: 'draft',
  ProjectStatus.submitted: 'submitted',
  ProjectStatus.underReview: 'underReview',
  ProjectStatus.approved: 'approved',
  ProjectStatus.fundingActive: 'fundingActive',
  ProjectStatus.fundingComplete: 'fundingComplete',
  ProjectStatus.implementation: 'implementation',
  ProjectStatus.completed: 'completed',
  ProjectStatus.suspended: 'suspended',
  ProjectStatus.cancelled: 'cancelled',
};

_$ProjectMilestoneImpl _$$ProjectMilestoneImplFromJson(
        Map<String, dynamic> json) =>
    _$ProjectMilestoneImpl(
      id: json['id'] as String,
      projectId: json['projectId'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      targetDate: DateTime.parse(json['targetDate'] as String),
      status: $enumDecode(_$MilestoneStatusEnumMap, json['status']),
      fundingRequired: (json['fundingRequired'] as num?)?.toDouble(),
      evidenceUrl: json['evidenceUrl'] as String?,
      completedDate: json['completedDate'] == null
          ? null
          : DateTime.parse(json['completedDate'] as String),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$ProjectMilestoneImplToJson(
        _$ProjectMilestoneImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'projectId': instance.projectId,
      'title': instance.title,
      'description': instance.description,
      'targetDate': instance.targetDate.toIso8601String(),
      'status': _$MilestoneStatusEnumMap[instance.status]!,
      'fundingRequired': instance.fundingRequired,
      'evidenceUrl': instance.evidenceUrl,
      'completedDate': instance.completedDate?.toIso8601String(),
      'notes': instance.notes,
    };

const _$MilestoneStatusEnumMap = {
  MilestoneStatus.pending: 'pending',
  MilestoneStatus.inProgress: 'inProgress',
  MilestoneStatus.completed: 'completed',
  MilestoneStatus.delayed: 'delayed',
  MilestoneStatus.cancelled: 'cancelled',
};

_$ImpactMetricImpl _$$ImpactMetricImplFromJson(Map<String, dynamic> json) =>
    _$ImpactMetricImpl(
      id: json['id'] as String,
      projectId: json['projectId'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      unit: json['unit'] as String,
      targetValue: (json['targetValue'] as num).toDouble(),
      currentValue: (json['currentValue'] as num).toDouble(),
      type: $enumDecode(_$MetricTypeEnumMap, json['type']),
      verificationMethod: json['verificationMethod'] as String?,
      lastUpdated: json['lastUpdated'] == null
          ? null
          : DateTime.parse(json['lastUpdated'] as String),
    );

Map<String, dynamic> _$$ImpactMetricImplToJson(_$ImpactMetricImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'projectId': instance.projectId,
      'name': instance.name,
      'description': instance.description,
      'unit': instance.unit,
      'targetValue': instance.targetValue,
      'currentValue': instance.currentValue,
      'type': _$MetricTypeEnumMap[instance.type]!,
      'verificationMethod': instance.verificationMethod,
      'lastUpdated': instance.lastUpdated?.toIso8601String(),
    };

const _$MetricTypeEnumMap = {
  MetricType.beneficiaries: 'beneficiaries',
  MetricType.environmental: 'environmental',
  MetricType.economic: 'economic',
  MetricType.social: 'social',
  MetricType.educational: 'educational',
  MetricType.health: 'health',
};

_$ProjectSearchCriteriaImpl _$$ProjectSearchCriteriaImplFromJson(
        Map<String, dynamic> json) =>
    _$ProjectSearchCriteriaImpl(
      query: json['query'] as String?,
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$ProjectCategoryEnumMap, e))
          .toList(),
      statuses: (json['statuses'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$ProjectStatusEnumMap, e))
          .toList(),
      minFunding: (json['minFunding'] as num?)?.toDouble(),
      maxFunding: (json['maxFunding'] as num?)?.toDouble(),
      location: json['location'] as String?,
      organizationId: json['organizationId'] as String?,
      sortBy: $enumDecodeNullable(_$ProjectSortByEnumMap, json['sortBy']),
      sortOrder: $enumDecodeNullable(_$SortOrderEnumMap, json['sortOrder']),
    );

Map<String, dynamic> _$$ProjectSearchCriteriaImplToJson(
        _$ProjectSearchCriteriaImpl instance) =>
    <String, dynamic>{
      'query': instance.query,
      'categories': instance.categories
          ?.map((e) => _$ProjectCategoryEnumMap[e]!)
          .toList(),
      'statuses':
          instance.statuses?.map((e) => _$ProjectStatusEnumMap[e]!).toList(),
      'minFunding': instance.minFunding,
      'maxFunding': instance.maxFunding,
      'location': instance.location,
      'organizationId': instance.organizationId,
      'sortBy': _$ProjectSortByEnumMap[instance.sortBy],
      'sortOrder': _$SortOrderEnumMap[instance.sortOrder],
    };

const _$ProjectSortByEnumMap = {
  ProjectSortBy.name: 'name',
  ProjectSortBy.fundingGoal: 'fundingGoal',
  ProjectSortBy.currentFunding: 'currentFunding',
  ProjectSortBy.startDate: 'startDate',
  ProjectSortBy.category: 'category',
  ProjectSortBy.status: 'status',
};

const _$SortOrderEnumMap = {
  SortOrder.ascending: 'ascending',
  SortOrder.descending: 'descending',
};

_$ProjectFundingSummaryImpl _$$ProjectFundingSummaryImplFromJson(
        Map<String, dynamic> json) =>
    _$ProjectFundingSummaryImpl(
      projectId: json['projectId'] as String,
      totalFunding: (json['totalFunding'] as num).toDouble(),
      fundingGoal: (json['fundingGoal'] as num).toDouble(),
      fundingPercentage: (json['fundingPercentage'] as num).toDouble(),
      investorCount: (json['investorCount'] as num).toInt(),
      averageInvestment: (json['averageInvestment'] as num).toDouble(),
      lastInvestmentDate: DateTime.parse(json['lastInvestmentDate'] as String),
      breakdown: (json['breakdown'] as List<dynamic>?)
              ?.map((e) => FundingBreakdown.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ProjectFundingSummaryImplToJson(
        _$ProjectFundingSummaryImpl instance) =>
    <String, dynamic>{
      'projectId': instance.projectId,
      'totalFunding': instance.totalFunding,
      'fundingGoal': instance.fundingGoal,
      'fundingPercentage': instance.fundingPercentage,
      'investorCount': instance.investorCount,
      'averageInvestment': instance.averageInvestment,
      'lastInvestmentDate': instance.lastInvestmentDate.toIso8601String(),
      'breakdown': instance.breakdown,
    };

_$FundingBreakdownImpl _$$FundingBreakdownImplFromJson(
        Map<String, dynamic> json) =>
    _$FundingBreakdownImpl(
      type: $enumDecode(_$InvestmentTypeEnumMap, json['type']),
      amount: (json['amount'] as num).toDouble(),
      percentage: (json['percentage'] as num).toDouble(),
      investmentCount: (json['investmentCount'] as num).toInt(),
    );

Map<String, dynamic> _$$FundingBreakdownImplToJson(
        _$FundingBreakdownImpl instance) =>
    <String, dynamic>{
      'type': _$InvestmentTypeEnumMap[instance.type]!,
      'amount': instance.amount,
      'percentage': instance.percentage,
      'investmentCount': instance.investmentCount,
    };

const _$InvestmentTypeEnumMap = {
  InvestmentType.equity: 'equity',
  InvestmentType.debt: 'debt',
  InvestmentType.hybrid: 'hybrid',
  InvestmentType.donation: 'donation',
};

_$OrganizationImpl _$$OrganizationImplFromJson(Map<String, dynamic> json) =>
    _$OrganizationImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String?,
      website: json['website'] as String?,
      address: json['address'] as String,
      type: $enumDecode(_$OrganizationTypeEnumMap, json['type']),
      status: $enumDecode(_$OrganizationStatusEnumMap, json['status']),
      logoUrl: json['logoUrl'] as String?,
      certifications: (json['certifications'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      projects: (json['projects'] as List<dynamic>?)
              ?.map((e) => Project.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      metadata: json['metadata'] as Map<String, dynamic>?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$OrganizationImplToJson(_$OrganizationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'email': instance.email,
      'phone': instance.phone,
      'website': instance.website,
      'address': instance.address,
      'type': _$OrganizationTypeEnumMap[instance.type]!,
      'status': _$OrganizationStatusEnumMap[instance.status]!,
      'logoUrl': instance.logoUrl,
      'certifications': instance.certifications,
      'projects': instance.projects,
      'metadata': instance.metadata,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

const _$OrganizationTypeEnumMap = {
  OrganizationType.ngo: 'ngo',
  OrganizationType.socialEnterprise: 'socialEnterprise',
  OrganizationType.cooperative: 'cooperative',
  OrganizationType.government: 'government',
  OrganizationType.international: 'international',
};

const _$OrganizationStatusEnumMap = {
  OrganizationStatus.active: 'active',
  OrganizationStatus.pending: 'pending',
  OrganizationStatus.suspended: 'suspended',
  OrganizationStatus.inactive: 'inactive',
};
