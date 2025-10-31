import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_query.freezed.dart';
part 'search_query.g.dart';

/// Search query entity for advanced search and filtering
@freezed
class SearchQuery with _$SearchQuery {
  const factory SearchQuery({
    required String id,
    required String userId,
    required String query,
    required SearchScope scope,
    required DateTime createdAt,
    @Default([]) List<SearchFilter> filters,
    @Default([]) List<SearchSort> sorting,
    @Default({}) Map<String, dynamic> metadata,
    String? name,
    bool? isSaved,
    DateTime? lastUsedAt,
    int? resultCount,
  }) = _SearchQuery;

  factory SearchQuery.fromJson(Map<String, dynamic> json) => 
    _$SearchQueryFromJson(json);
}

/// Search scope enum for different search contexts
enum SearchScope {
  all('All Content'),
  investments('Investments'),
  projects('Projects'),
  organizations('Organizations'),
  users('Users'),
  transactions('Transactions'),
  reports('Reports'),
  compliance('Compliance'),
  notifications('Notifications'),
  analytics('Analytics');

  const SearchScope(this.displayName);
  final String displayName;
}

/// Search filter entity for advanced filtering
@freezed
class SearchFilter with _$SearchFilter {
  const factory SearchFilter({
    required String field,
    required FilterType type,
    required FilterOperator operator,
    required dynamic value,
    String? displayName,
    bool? isActive,
  }) = _SearchFilter;

  factory SearchFilter.fromJson(Map<String, dynamic> json) => 
    _$SearchFilterFromJson(json);
}

/// Filter type enum
enum FilterType {
  text('Text'),
  number('Number'),
  date('Date'),
  boolean('Boolean'),
  list('List'),
  range('Range'),
  geolocation('Location');

  const FilterType(this.displayName);
  final String displayName;
}

/// Filter operator enum
enum FilterOperator {
  equals('Equals'),
  notEquals('Not Equals'),
  contains('Contains'),
  notContains('Does Not Contain'),
  startsWith('Starts With'),
  endsWith('Ends With'),
  greaterThan('Greater Than'),
  lessThan('Less Than'),
  greaterThanOrEqual('Greater Than or Equal'),
  lessThanOrEqual('Less Than or Equal'),
  between('Between'),
  inList('In List'),
  notInList('Not In List'),
  isEmpty('Is Empty'),
  isNotEmpty('Is Not Empty'),
  isNull('Is Null'),
  isNotNull('Is Not Null');

  const FilterOperator(this.displayName);
  final String displayName;
}

/// Search sort entity for result ordering
@freezed
class SearchSort with _$SearchSort {
  const factory SearchSort({
    required String field,
    required SortDirection direction,
    required int priority,
    String? displayName,
  }) = _SearchSort;

  factory SearchSort.fromJson(Map<String, dynamic> json) => 
    _$SearchSortFromJson(json);
}

/// Sort direction enum
enum SortDirection {
  ascending('Ascending'),
  descending('Descending');

  const SortDirection(this.displayName);
  final String displayName;
}

/// Search result entity
@freezed
class SearchResult with _$SearchResult {
  const factory SearchResult({
    required String id,
    required SearchResultType type,
    required String title,
    required String description,
    required Map<String, dynamic> data,
    required double relevanceScore,
    required DateTime timestamp,
    String? imageUrl,
    String? url,
    @Default([]) List<String> tags,
    @Default({}) Map<String, String> highlights,
    Map<String, dynamic>? metadata,
  }) = _SearchResult;

  factory SearchResult.fromJson(Map<String, dynamic> json) => 
    _$SearchResultFromJson(json);
}

/// Search result type enum
enum SearchResultType {
  investment('Investment'),
  project('Project'),
  organization('Organization'),
  user('User'),
  transaction('Transaction'),
  report('Report'),
  document('Document'),
  notification('Notification'),
  insight('Insight'),
  kpi('KPI');

  const SearchResultType(this.displayName);
  final String displayName;
}

/// Search suggestion entity
@freezed
class SearchSuggestion with _$SearchSuggestion {
  const factory SearchSuggestion({
    required String text,
    required SuggestionType type,
    required int frequency,
    double? score,
    String? category,
    Map<String, dynamic>? metadata,
  }) = _SearchSuggestion;

  factory SearchSuggestion.fromJson(Map<String, dynamic> json) => 
    _$SearchSuggestionFromJson(json);
}

/// Suggestion type enum
enum SuggestionType {
  query('Search Query'),
  filter('Filter'),
  tag('Tag'),
  category('Category'),
  recent('Recent Search'),
  popular('Popular Search');

  const SuggestionType(this.displayName);
  final String displayName;
}

/// Saved search entity
@freezed
class SavedSearch with _$SavedSearch {
  const factory SavedSearch({
    required String id,
    required String userId,
    required String name,
    required String description,
    required SearchQuery query,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(false) bool isDefault,
    @Default([]) List<String> sharedWith,
    @Default({}) Map<String, dynamic> alertSettings,
    String? category,
    int? usageCount,
    DateTime? lastUsedAt,
  }) = _SavedSearch;

  factory SavedSearch.fromJson(Map<String, dynamic> json) => 
    _$SavedSearchFromJson(json);
}

/// Search analytics entity
@freezed
class SearchAnalytics with _$SearchAnalytics {
  const factory SearchAnalytics({
    required String id,
    required DateTime periodStart,
    required DateTime periodEnd,
    required int totalSearches,
    required int uniqueUsers,
    required double averageResultsPerSearch,
    @Default([]) List<SearchTrendData> trends,
    @Default([]) List<PopularQuery> popularQueries,
    @Default([]) List<SearchPerformanceMetric> performanceMetrics,
    Map<String, dynamic>? metadata,
  }) = _SearchAnalytics;

  factory SearchAnalytics.fromJson(Map<String, dynamic> json) => 
    _$SearchAnalyticsFromJson(json);
}

/// Search trend data
@freezed
class SearchTrendData with _$SearchTrendData {
  const factory SearchTrendData({
    required DateTime timestamp,
    required int searchCount,
    required String mostPopularQuery,
    required SearchScope mostPopularScope,
    required double averageRelevanceScore,
  }) = _SearchTrendData;

  factory SearchTrendData.fromJson(Map<String, dynamic> json) => 
    _$SearchTrendDataFromJson(json);
}

/// Popular query data
@freezed
class PopularQuery with _$PopularQuery {
  const factory PopularQuery({
    required String query,
    required int count,
    required SearchScope scope,
    required double averageClickThroughRate,
    @Default([]) List<String> commonFilters,
  }) = _PopularQuery;

  factory PopularQuery.fromJson(Map<String, dynamic> json) => 
    _$PopularQueryFromJson(json);
}

/// Search performance metric
@freezed
class SearchPerformanceMetric with _$SearchPerformanceMetric {
  const factory SearchPerformanceMetric({
    required String metricName,
    required double value,
    required String unit,
    required MetricType type,
    DateTime? timestamp,
    String? description,
  }) = _SearchPerformanceMetric;

  factory SearchPerformanceMetric.fromJson(Map<String, dynamic> json) => 
    _$SearchPerformanceMetricFromJson(json);
}

/// Metric type enum
enum MetricType {
  latency('Latency'),
  accuracy('Accuracy'),
  coverage('Coverage'),
  satisfaction('User Satisfaction'),
  conversion('Conversion Rate');

  const MetricType(this.displayName);
  final String displayName;
}

/// Advanced search configuration
@freezed
class SearchConfiguration with _$SearchConfiguration {
  const factory SearchConfiguration({
    required String id,
    required String organizationId,
    @Default([]) List<SearchIndex> indices,
    @Default([]) List<SearchFieldConfig> fieldConfigs,
    @Default({}) Map<String, double> boostingRules,
    @Default([]) List<String> stopWords,
    @Default([]) List<String> synonyms,
    Map<String, dynamic>? customSettings,
    DateTime? updatedAt,
    String? updatedBy,
  }) = _SearchConfiguration;

  factory SearchConfiguration.fromJson(Map<String, dynamic> json) => 
    _$SearchConfigurationFromJson(json);
}

/// Search index configuration
@freezed
class SearchIndex with _$SearchIndex {
  const factory SearchIndex({
    required String name,
    required String description,
    required SearchScope scope,
    @Default([]) List<String> fields,
    @Default({}) Map<String, dynamic> settings,
    bool? isActive,
    DateTime? lastUpdated,
  }) = _SearchIndex;

  factory SearchIndex.fromJson(Map<String, dynamic> json) => 
    _$SearchIndexFromJson(json);
}

/// Search field configuration
@freezed
class SearchFieldConfig with _$SearchFieldConfig {
  const factory SearchFieldConfig({
    required String fieldName,
    required FieldDataType dataType,
    required bool isSearchable,
    required bool isFilterable,
    required bool isSortable,
    @Default(1.0) double boost,
    @Default(false) bool isFaceted,
    String? analyzer,
    Map<String, dynamic>? customConfig,
  }) = _SearchFieldConfig;

  factory SearchFieldConfig.fromJson(Map<String, dynamic> json) => 
    _$SearchFieldConfigFromJson(json);
}

/// Field data type enum
enum FieldDataType {
  text('Text'),
  keyword('Keyword'),
  integer('Integer'),
  float('Float'),
  date('Date'),
  boolean('Boolean'),
  geoPoint('Geographic Point'),
  nested('Nested Object');

  const FieldDataType(this.displayName);
  final String displayName;
}

/// Faceted search result
@freezed
class FacetResult with _$FacetResult {
  const factory FacetResult({
    required String field,
    required String displayName,
    @Default([]) List<FacetValue> values,
    required FacetType type,
    int? totalCount,
  }) = _FacetResult;

  factory FacetResult.fromJson(Map<String, dynamic> json) => 
    _$FacetResultFromJson(json);
}

/// Facet value
@freezed
class FacetValue with _$FacetValue {
  const factory FacetValue({
    required String value,
    required String displayValue,
    required int count,
    required bool isSelected,
    String? description,
  }) = _FacetValue;

  factory FacetValue.fromJson(Map<String, dynamic> json) => 
    _$FacetValueFromJson(json);
}

/// Facet type enum
enum FacetType {
  terms('Terms'),
  range('Range'),
  dateRange('Date Range'),
  histogram('Histogram'),
  geographic('Geographic');

  const FacetType(this.displayName);
  final String displayName;
}