// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_query.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchQueryImpl _$$SearchQueryImplFromJson(Map<String, dynamic> json) =>
    _$SearchQueryImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      query: json['query'] as String,
      scope: $enumDecode(_$SearchScopeEnumMap, json['scope']),
      createdAt: DateTime.parse(json['createdAt'] as String),
      filters: (json['filters'] as List<dynamic>?)
              ?.map((e) => SearchFilter.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      sorting: (json['sorting'] as List<dynamic>?)
              ?.map((e) => SearchSort.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
      name: json['name'] as String?,
      isSaved: json['isSaved'] as bool?,
      lastUsedAt: json['lastUsedAt'] == null
          ? null
          : DateTime.parse(json['lastUsedAt'] as String),
      resultCount: (json['resultCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SearchQueryImplToJson(_$SearchQueryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'query': instance.query,
      'scope': _$SearchScopeEnumMap[instance.scope]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'filters': instance.filters,
      'sorting': instance.sorting,
      'metadata': instance.metadata,
      'name': instance.name,
      'isSaved': instance.isSaved,
      'lastUsedAt': instance.lastUsedAt?.toIso8601String(),
      'resultCount': instance.resultCount,
    };

const _$SearchScopeEnumMap = {
  SearchScope.all: 'all',
  SearchScope.investments: 'investments',
  SearchScope.projects: 'projects',
  SearchScope.organizations: 'organizations',
  SearchScope.users: 'users',
  SearchScope.transactions: 'transactions',
  SearchScope.reports: 'reports',
  SearchScope.compliance: 'compliance',
  SearchScope.notifications: 'notifications',
  SearchScope.analytics: 'analytics',
};

_$SearchFilterImpl _$$SearchFilterImplFromJson(Map<String, dynamic> json) =>
    _$SearchFilterImpl(
      field: json['field'] as String,
      type: $enumDecode(_$FilterTypeEnumMap, json['type']),
      operator: $enumDecode(_$FilterOperatorEnumMap, json['operator']),
      value: json['value'],
      displayName: json['displayName'] as String?,
      isActive: json['isActive'] as bool?,
    );

Map<String, dynamic> _$$SearchFilterImplToJson(_$SearchFilterImpl instance) =>
    <String, dynamic>{
      'field': instance.field,
      'type': _$FilterTypeEnumMap[instance.type]!,
      'operator': _$FilterOperatorEnumMap[instance.operator]!,
      'value': instance.value,
      'displayName': instance.displayName,
      'isActive': instance.isActive,
    };

const _$FilterTypeEnumMap = {
  FilterType.text: 'text',
  FilterType.number: 'number',
  FilterType.date: 'date',
  FilterType.boolean: 'boolean',
  FilterType.list: 'list',
  FilterType.range: 'range',
  FilterType.geolocation: 'geolocation',
};

const _$FilterOperatorEnumMap = {
  FilterOperator.equals: 'equals',
  FilterOperator.notEquals: 'notEquals',
  FilterOperator.contains: 'contains',
  FilterOperator.notContains: 'notContains',
  FilterOperator.startsWith: 'startsWith',
  FilterOperator.endsWith: 'endsWith',
  FilterOperator.greaterThan: 'greaterThan',
  FilterOperator.lessThan: 'lessThan',
  FilterOperator.greaterThanOrEqual: 'greaterThanOrEqual',
  FilterOperator.lessThanOrEqual: 'lessThanOrEqual',
  FilterOperator.between: 'between',
  FilterOperator.inList: 'inList',
  FilterOperator.notInList: 'notInList',
  FilterOperator.isEmpty: 'isEmpty',
  FilterOperator.isNotEmpty: 'isNotEmpty',
  FilterOperator.isNull: 'isNull',
  FilterOperator.isNotNull: 'isNotNull',
};

_$SearchSortImpl _$$SearchSortImplFromJson(Map<String, dynamic> json) =>
    _$SearchSortImpl(
      field: json['field'] as String,
      direction: $enumDecode(_$SortDirectionEnumMap, json['direction']),
      priority: (json['priority'] as num).toInt(),
      displayName: json['displayName'] as String?,
    );

Map<String, dynamic> _$$SearchSortImplToJson(_$SearchSortImpl instance) =>
    <String, dynamic>{
      'field': instance.field,
      'direction': _$SortDirectionEnumMap[instance.direction]!,
      'priority': instance.priority,
      'displayName': instance.displayName,
    };

const _$SortDirectionEnumMap = {
  SortDirection.ascending: 'ascending',
  SortDirection.descending: 'descending',
};

_$SearchResultImpl _$$SearchResultImplFromJson(Map<String, dynamic> json) =>
    _$SearchResultImpl(
      id: json['id'] as String,
      type: $enumDecode(_$SearchResultTypeEnumMap, json['type']),
      title: json['title'] as String,
      description: json['description'] as String,
      data: json['data'] as Map<String, dynamic>,
      relevanceScore: (json['relevanceScore'] as num).toDouble(),
      timestamp: DateTime.parse(json['timestamp'] as String),
      imageUrl: json['imageUrl'] as String?,
      url: json['url'] as String?,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      highlights: (json['highlights'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {},
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$SearchResultImplToJson(_$SearchResultImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$SearchResultTypeEnumMap[instance.type]!,
      'title': instance.title,
      'description': instance.description,
      'data': instance.data,
      'relevanceScore': instance.relevanceScore,
      'timestamp': instance.timestamp.toIso8601String(),
      'imageUrl': instance.imageUrl,
      'url': instance.url,
      'tags': instance.tags,
      'highlights': instance.highlights,
      'metadata': instance.metadata,
    };

const _$SearchResultTypeEnumMap = {
  SearchResultType.investment: 'investment',
  SearchResultType.project: 'project',
  SearchResultType.organization: 'organization',
  SearchResultType.user: 'user',
  SearchResultType.transaction: 'transaction',
  SearchResultType.report: 'report',
  SearchResultType.document: 'document',
  SearchResultType.notification: 'notification',
  SearchResultType.insight: 'insight',
  SearchResultType.kpi: 'kpi',
};

_$SearchSuggestionImpl _$$SearchSuggestionImplFromJson(
        Map<String, dynamic> json) =>
    _$SearchSuggestionImpl(
      text: json['text'] as String,
      type: $enumDecode(_$SuggestionTypeEnumMap, json['type']),
      frequency: (json['frequency'] as num).toInt(),
      score: (json['score'] as num?)?.toDouble(),
      category: json['category'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$SearchSuggestionImplToJson(
        _$SearchSuggestionImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'type': _$SuggestionTypeEnumMap[instance.type]!,
      'frequency': instance.frequency,
      'score': instance.score,
      'category': instance.category,
      'metadata': instance.metadata,
    };

const _$SuggestionTypeEnumMap = {
  SuggestionType.query: 'query',
  SuggestionType.filter: 'filter',
  SuggestionType.tag: 'tag',
  SuggestionType.category: 'category',
  SuggestionType.recent: 'recent',
  SuggestionType.popular: 'popular',
};

_$SavedSearchImpl _$$SavedSearchImplFromJson(Map<String, dynamic> json) =>
    _$SavedSearchImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      query: SearchQuery.fromJson(json['query'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      isDefault: json['isDefault'] as bool? ?? false,
      sharedWith: (json['sharedWith'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      alertSettings: json['alertSettings'] as Map<String, dynamic>? ?? const {},
      category: json['category'] as String?,
      usageCount: (json['usageCount'] as num?)?.toInt(),
      lastUsedAt: json['lastUsedAt'] == null
          ? null
          : DateTime.parse(json['lastUsedAt'] as String),
    );

Map<String, dynamic> _$$SavedSearchImplToJson(_$SavedSearchImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'name': instance.name,
      'description': instance.description,
      'query': instance.query,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'isDefault': instance.isDefault,
      'sharedWith': instance.sharedWith,
      'alertSettings': instance.alertSettings,
      'category': instance.category,
      'usageCount': instance.usageCount,
      'lastUsedAt': instance.lastUsedAt?.toIso8601String(),
    };

_$SearchAnalyticsImpl _$$SearchAnalyticsImplFromJson(
        Map<String, dynamic> json) =>
    _$SearchAnalyticsImpl(
      id: json['id'] as String,
      periodStart: DateTime.parse(json['periodStart'] as String),
      periodEnd: DateTime.parse(json['periodEnd'] as String),
      totalSearches: (json['totalSearches'] as num).toInt(),
      uniqueUsers: (json['uniqueUsers'] as num).toInt(),
      averageResultsPerSearch:
          (json['averageResultsPerSearch'] as num).toDouble(),
      trends: (json['trends'] as List<dynamic>?)
              ?.map((e) => SearchTrendData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      popularQueries: (json['popularQueries'] as List<dynamic>?)
              ?.map((e) => PopularQuery.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      performanceMetrics: (json['performanceMetrics'] as List<dynamic>?)
              ?.map((e) =>
                  SearchPerformanceMetric.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$SearchAnalyticsImplToJson(
        _$SearchAnalyticsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'periodStart': instance.periodStart.toIso8601String(),
      'periodEnd': instance.periodEnd.toIso8601String(),
      'totalSearches': instance.totalSearches,
      'uniqueUsers': instance.uniqueUsers,
      'averageResultsPerSearch': instance.averageResultsPerSearch,
      'trends': instance.trends,
      'popularQueries': instance.popularQueries,
      'performanceMetrics': instance.performanceMetrics,
      'metadata': instance.metadata,
    };

_$SearchTrendDataImpl _$$SearchTrendDataImplFromJson(
        Map<String, dynamic> json) =>
    _$SearchTrendDataImpl(
      timestamp: DateTime.parse(json['timestamp'] as String),
      searchCount: (json['searchCount'] as num).toInt(),
      mostPopularQuery: json['mostPopularQuery'] as String,
      mostPopularScope:
          $enumDecode(_$SearchScopeEnumMap, json['mostPopularScope']),
      averageRelevanceScore: (json['averageRelevanceScore'] as num).toDouble(),
    );

Map<String, dynamic> _$$SearchTrendDataImplToJson(
        _$SearchTrendDataImpl instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp.toIso8601String(),
      'searchCount': instance.searchCount,
      'mostPopularQuery': instance.mostPopularQuery,
      'mostPopularScope': _$SearchScopeEnumMap[instance.mostPopularScope]!,
      'averageRelevanceScore': instance.averageRelevanceScore,
    };

_$PopularQueryImpl _$$PopularQueryImplFromJson(Map<String, dynamic> json) =>
    _$PopularQueryImpl(
      query: json['query'] as String,
      count: (json['count'] as num).toInt(),
      scope: $enumDecode(_$SearchScopeEnumMap, json['scope']),
      averageClickThroughRate:
          (json['averageClickThroughRate'] as num).toDouble(),
      commonFilters: (json['commonFilters'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$PopularQueryImplToJson(_$PopularQueryImpl instance) =>
    <String, dynamic>{
      'query': instance.query,
      'count': instance.count,
      'scope': _$SearchScopeEnumMap[instance.scope]!,
      'averageClickThroughRate': instance.averageClickThroughRate,
      'commonFilters': instance.commonFilters,
    };

_$SearchPerformanceMetricImpl _$$SearchPerformanceMetricImplFromJson(
        Map<String, dynamic> json) =>
    _$SearchPerformanceMetricImpl(
      metricName: json['metricName'] as String,
      value: (json['value'] as num).toDouble(),
      unit: json['unit'] as String,
      type: $enumDecode(_$MetricTypeEnumMap, json['type']),
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$SearchPerformanceMetricImplToJson(
        _$SearchPerformanceMetricImpl instance) =>
    <String, dynamic>{
      'metricName': instance.metricName,
      'value': instance.value,
      'unit': instance.unit,
      'type': _$MetricTypeEnumMap[instance.type]!,
      'timestamp': instance.timestamp?.toIso8601String(),
      'description': instance.description,
    };

const _$MetricTypeEnumMap = {
  MetricType.latency: 'latency',
  MetricType.accuracy: 'accuracy',
  MetricType.coverage: 'coverage',
  MetricType.satisfaction: 'satisfaction',
  MetricType.conversion: 'conversion',
};

_$SearchConfigurationImpl _$$SearchConfigurationImplFromJson(
        Map<String, dynamic> json) =>
    _$SearchConfigurationImpl(
      id: json['id'] as String,
      organizationId: json['organizationId'] as String,
      indices: (json['indices'] as List<dynamic>?)
              ?.map((e) => SearchIndex.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      fieldConfigs: (json['fieldConfigs'] as List<dynamic>?)
              ?.map(
                  (e) => SearchFieldConfig.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      boostingRules: (json['boostingRules'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, (e as num).toDouble()),
          ) ??
          const {},
      stopWords: (json['stopWords'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      synonyms: (json['synonyms'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      customSettings: json['customSettings'] as Map<String, dynamic>?,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      updatedBy: json['updatedBy'] as String?,
    );

Map<String, dynamic> _$$SearchConfigurationImplToJson(
        _$SearchConfigurationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'organizationId': instance.organizationId,
      'indices': instance.indices,
      'fieldConfigs': instance.fieldConfigs,
      'boostingRules': instance.boostingRules,
      'stopWords': instance.stopWords,
      'synonyms': instance.synonyms,
      'customSettings': instance.customSettings,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'updatedBy': instance.updatedBy,
    };

_$SearchIndexImpl _$$SearchIndexImplFromJson(Map<String, dynamic> json) =>
    _$SearchIndexImpl(
      name: json['name'] as String,
      description: json['description'] as String,
      scope: $enumDecode(_$SearchScopeEnumMap, json['scope']),
      fields: (json['fields'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      settings: json['settings'] as Map<String, dynamic>? ?? const {},
      isActive: json['isActive'] as bool?,
      lastUpdated: json['lastUpdated'] == null
          ? null
          : DateTime.parse(json['lastUpdated'] as String),
    );

Map<String, dynamic> _$$SearchIndexImplToJson(_$SearchIndexImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'scope': _$SearchScopeEnumMap[instance.scope]!,
      'fields': instance.fields,
      'settings': instance.settings,
      'isActive': instance.isActive,
      'lastUpdated': instance.lastUpdated?.toIso8601String(),
    };

_$SearchFieldConfigImpl _$$SearchFieldConfigImplFromJson(
        Map<String, dynamic> json) =>
    _$SearchFieldConfigImpl(
      fieldName: json['fieldName'] as String,
      dataType: $enumDecode(_$FieldDataTypeEnumMap, json['dataType']),
      isSearchable: json['isSearchable'] as bool,
      isFilterable: json['isFilterable'] as bool,
      isSortable: json['isSortable'] as bool,
      boost: (json['boost'] as num?)?.toDouble() ?? 1.0,
      isFaceted: json['isFaceted'] as bool? ?? false,
      analyzer: json['analyzer'] as String?,
      customConfig: json['customConfig'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$SearchFieldConfigImplToJson(
        _$SearchFieldConfigImpl instance) =>
    <String, dynamic>{
      'fieldName': instance.fieldName,
      'dataType': _$FieldDataTypeEnumMap[instance.dataType]!,
      'isSearchable': instance.isSearchable,
      'isFilterable': instance.isFilterable,
      'isSortable': instance.isSortable,
      'boost': instance.boost,
      'isFaceted': instance.isFaceted,
      'analyzer': instance.analyzer,
      'customConfig': instance.customConfig,
    };

const _$FieldDataTypeEnumMap = {
  FieldDataType.text: 'text',
  FieldDataType.keyword: 'keyword',
  FieldDataType.integer: 'integer',
  FieldDataType.float: 'float',
  FieldDataType.date: 'date',
  FieldDataType.boolean: 'boolean',
  FieldDataType.geoPoint: 'geoPoint',
  FieldDataType.nested: 'nested',
};

_$FacetResultImpl _$$FacetResultImplFromJson(Map<String, dynamic> json) =>
    _$FacetResultImpl(
      field: json['field'] as String,
      displayName: json['displayName'] as String,
      values: (json['values'] as List<dynamic>?)
              ?.map((e) => FacetValue.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      type: $enumDecode(_$FacetTypeEnumMap, json['type']),
      totalCount: (json['totalCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$FacetResultImplToJson(_$FacetResultImpl instance) =>
    <String, dynamic>{
      'field': instance.field,
      'displayName': instance.displayName,
      'values': instance.values,
      'type': _$FacetTypeEnumMap[instance.type]!,
      'totalCount': instance.totalCount,
    };

const _$FacetTypeEnumMap = {
  FacetType.terms: 'terms',
  FacetType.range: 'range',
  FacetType.dateRange: 'dateRange',
  FacetType.histogram: 'histogram',
  FacetType.geographic: 'geographic',
};

_$FacetValueImpl _$$FacetValueImplFromJson(Map<String, dynamic> json) =>
    _$FacetValueImpl(
      value: json['value'] as String,
      displayValue: json['displayValue'] as String,
      count: (json['count'] as num).toInt(),
      isSelected: json['isSelected'] as bool,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$FacetValueImplToJson(_$FacetValueImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'displayValue': instance.displayValue,
      'count': instance.count,
      'isSelected': instance.isSelected,
      'description': instance.description,
    };
