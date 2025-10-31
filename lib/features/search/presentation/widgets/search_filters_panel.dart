import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/constants/spacing.dart';
import '../../domain/entities/search_query.dart';

/// Search filters panel with advanced filtering capabilities
class SearchFiltersPanel extends ConsumerStatefulWidget {
  final List<SearchFilter> filters;
  final SearchScope scope;
  final Function(List<SearchFilter>) onFiltersChanged;
  final bool showExpanded;
  
  const SearchFiltersPanel({
    super.key,
    required this.filters,
    required this.scope,
    required this.onFiltersChanged,
    this.showExpanded = false,
  });

  @override
  ConsumerState<SearchFiltersPanel> createState() => _SearchFiltersPanelState();
}

class _SearchFiltersPanelState extends ConsumerState<SearchFiltersPanel> {
  List<SearchFilter> _activeFilters = [];
  final Map<String, bool> _expandedSections = {};
  
  @override
  void initState() {
    super.initState();
    _activeFilters = List.from(widget.filters);
    _initializeExpandedSections();
  }
  
  @override
  void didUpdateWidget(SearchFiltersPanel oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.filters != widget.filters) {
      _activeFilters = List.from(widget.filters);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            AdaptiveSpacing.verticalMedium(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildActiveFilters(context),
                    if (_activeFilters.isNotEmpty)
                      AdaptiveSpacing.verticalMedium(),
                    ..._buildFilterSections(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  /// Build panel header
  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.filter_list,
          color: Theme.of(context).colorScheme.primary,
          size: 20,
        ),
        const SizedBox(width: Spacing.sm),
        Text(
          'Filters',
          style: AdaptiveTextStyles.titleMedium(context),
        ),
        const Spacer(),
        if (_activeFilters.isNotEmpty)
          TextButton(
            onPressed: _clearAllFilters,
            child: Text(
              'Clear All (${_activeFilters.length})',
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          ),
      ],
    );
  }
  
  /// Build active filters chips
  Widget _buildActiveFilters(BuildContext context) {
    if (_activeFilters.isEmpty) {
      return Container();
    }
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Active Filters',
          style: AdaptiveTextStyles.bodyMedium(context).copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: Spacing.sm),
        Wrap(
          spacing: Spacing.sm,
          runSpacing: Spacing.sm,
          children: _activeFilters.map((filter) {
            return _buildFilterChip(context, filter);
          }).toList(),
        ),
      ],
    );
  }
  
  /// Build filter chip
  Widget _buildFilterChip(BuildContext context, SearchFilter filter) {
    return Chip(
      label: Text(
        '${filter.displayName ?? filter.field}: ${filter.value}',
        style: AdaptiveTextStyles.bodySmall(context),
      ),
      deleteIcon: const Icon(Icons.close, size: 16),
      onDeleted: () => _removeFilter(filter),
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
    );
  }
  
  /// Build filter sections based on scope
  List<Widget> _buildFilterSections(BuildContext context) {
    final sections = _getFilterSectionsForScope(widget.scope);
    
    return sections.map((section) {
      return _buildFilterSection(
        context,
        section['title'] as String,
        section['filters'] as List<Map<String, dynamic>>,
      );
    }).toList();
  }
  
  /// Build individual filter section
  Widget _buildFilterSection(
    BuildContext context,
    String title,
    List<Map<String, dynamic>> filters,
  ) {
    final isExpanded = _expandedSections[title] ?? widget.showExpanded;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () => _toggleSection(title),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: Spacing.sm),
            child: Row(
              children: [
                Icon(
                  isExpanded ? Icons.expand_less : Icons.expand_more,
                  size: 20,
                ),
                const SizedBox(width: Spacing.sm),
                Text(
                  title,
                  style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
        
        if (isExpanded) ...[
          ...filters.map((filterConfig) {
            return _buildFilterControl(context, filterConfig);
          }),
          AdaptiveSpacing.verticalMedium(),
        ],
      ],
    );
  }
  
  /// Build filter control based on type
  Widget _buildFilterControl(BuildContext context, Map<String, dynamic> filterConfig) {
    final type = filterConfig['type'] as FilterType;
    
    switch (type) {
      case FilterType.text:
        return _buildTextFilter(context, filterConfig);
      case FilterType.number:
        return _buildNumberFilter(context, filterConfig);
      case FilterType.date:
        return _buildDateFilter(context, filterConfig);
      case FilterType.boolean:
        return _buildBooleanFilter(context, filterConfig);
      case FilterType.list:
        return _buildListFilter(context, filterConfig);
      case FilterType.range:
        return _buildRangeFilter(context, filterConfig);
      case FilterType.geolocation:
        return _buildLocationFilter(context, filterConfig);
    }
  }
  
  /// Build text filter
  Widget _buildTextFilter(BuildContext context, Map<String, dynamic> config) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Spacing.md),
      child: TextField(
        decoration: InputDecoration(
          labelText: config['label'] as String,
          hintText: config['hint'] as String?,
          border: const OutlineInputBorder(),
          isDense: true,
        ),
        onChanged: (value) => _addOrUpdateFilter(
          config['field'] as String,
          FilterType.text,
          FilterOperator.contains,
          value,
          config['label'] as String,
        ),
      ),
    );
  }
  
  /// Build number filter
  Widget _buildNumberFilter(BuildContext context, Map<String, dynamic> config) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Spacing.md),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                labelText: '${config['label']} (Min)',
                border: const OutlineInputBorder(),
                isDense: true,
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) => _addOrUpdateFilter(
                config['field'] as String,
                FilterType.number,
                FilterOperator.greaterThanOrEqual,
                double.tryParse(value) ?? 0,
                '${config['label']} (Min)',
              ),
            ),
          ),
          const SizedBox(width: Spacing.sm),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                labelText: '${config['label']} (Max)',
                border: const OutlineInputBorder(),
                isDense: true,
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) => _addOrUpdateFilter(
                config['field'] as String,
                FilterType.number,
                FilterOperator.lessThanOrEqual,
                double.tryParse(value) ?? 0,
                '${config['label']} (Max)',
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  /// Build date filter
  Widget _buildDateFilter(BuildContext context, Map<String, dynamic> config) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Spacing.md),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () => _selectDate(context, config, true),
              child: Container(
                padding: const EdgeInsets.all(Spacing.md),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  'From Date',
                  style: AdaptiveTextStyles.bodyMedium(context),
                ),
              ),
            ),
          ),
          const SizedBox(width: Spacing.sm),
          Expanded(
            child: InkWell(
              onTap: () => _selectDate(context, config, false),
              child: Container(
                padding: const EdgeInsets.all(Spacing.md),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  'To Date',
                  style: AdaptiveTextStyles.bodyMedium(context),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  /// Build boolean filter
  Widget _buildBooleanFilter(BuildContext context, Map<String, dynamic> config) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Spacing.md),
      child: SwitchListTile(
        title: Text(config['label'] as String),
        value: _getBooleanFilterValue(config['field'] as String),
        onChanged: (value) => _addOrUpdateFilter(
          config['field'] as String,
          FilterType.boolean,
          FilterOperator.equals,
          value,
          config['label'] as String,
        ),
        dense: true,
        contentPadding: EdgeInsets.zero,
      ),
    );
  }
  
  /// Build list filter
  Widget _buildListFilter(BuildContext context, Map<String, dynamic> config) {
    final options = config['options'] as List<String>;
    
    return Padding(
      padding: const EdgeInsets.only(bottom: Spacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            config['label'] as String,
            style: AdaptiveTextStyles.bodyMedium(context).copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: Spacing.sm),
          ...options.map((option) {
            return CheckboxListTile(
              title: Text(option),
              value: _isOptionSelected(config['field'] as String, option),
              onChanged: (selected) => _toggleListOption(
                config['field'] as String,
                option,
                selected ?? false,
                config['label'] as String,
              ),
              dense: true,
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
            );
          }),
        ],
      ),
    );
  }
  
  /// Build range filter
  Widget _buildRangeFilter(BuildContext context, Map<String, dynamic> config) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Spacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            config['label'] as String,
            style: AdaptiveTextStyles.bodyMedium(context).copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          RangeSlider(
            values: RangeValues(
              (config['min'] as num).toDouble(),
              (config['max'] as num).toDouble(),
            ),
            min: (config['minValue'] as num).toDouble(),
            max: (config['maxValue'] as num).toDouble(),
            divisions: config['divisions'] as int?,
            labels: RangeLabels(
              config['min'].toString(),
              config['max'].toString(),
            ),
            onChanged: (values) => _addOrUpdateFilter(
              config['field'] as String,
              FilterType.range,
              FilterOperator.between,
              {'min': values.start, 'max': values.end},
              config['label'] as String,
            ),
          ),
        ],
      ),
    );
  }
  
  /// Build location filter
  Widget _buildLocationFilter(BuildContext context, Map<String, dynamic> config) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Spacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            config['label'] as String,
            style: AdaptiveTextStyles.bodyMedium(context).copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: Spacing.sm),
          ElevatedButton.icon(
            onPressed: () => _selectLocation(context, config),
            icon: const Icon(Icons.location_on, size: 18),
            label: const Text('Select Location'),
          ),
        ],
      ),
    );
  }
  
  /// Initialize expanded sections
  void _initializeExpandedSections() {
    final sections = _getFilterSectionsForScope(widget.scope);
    for (final section in sections) {
      _expandedSections[section['title'] as String] = widget.showExpanded;
    }
  }
  
  /// Toggle section expansion
  void _toggleSection(String title) {
    setState(() {
      _expandedSections[title] = !(_expandedSections[title] ?? false);
    });
  }
  
  /// Get filter sections for scope
  List<Map<String, dynamic>> _getFilterSectionsForScope(SearchScope scope) {
    // Base sections available for all scopes
    final baseSections = [
      {
        'title': 'Date Range',
        'filters': [
          {
            'field': 'createdAt',
            'type': FilterType.date,
            'label': 'Creation Date',
          },
          {
            'field': 'updatedAt',
            'type': FilterType.date,
            'label': 'Last Updated',
          },
        ],
      },
    ];
    
    // Scope-specific sections
    switch (scope) {
      case SearchScope.investments:
        return [
          ...baseSections,
          {
            'title': 'Investment Criteria',
            'filters': [
              {
                'field': 'amount',
                'type': FilterType.range,
                'label': 'Investment Amount',
                'min': 0,
                'max': 100000,
                'minValue': 0,
                'maxValue': 1000000,
                'divisions': 100,
              },
              {
                'field': 'status',
                'type': FilterType.list,
                'label': 'Status',
                'options': ['Active', 'Pending', 'Completed', 'Cancelled'],
              },
              {
                'field': 'type',
                'type': FilterType.list,
                'label': 'Investment Type',
                'options': ['Equity', 'Debt', 'Grant', 'Loan'],
              },
            ],
          },
        ];
      
      case SearchScope.projects:
        return [
          ...baseSections,
          {
            'title': 'Project Criteria',
            'filters': [
              {
                'field': 'category',
                'type': FilterType.list,
                'label': 'Category',
                'options': ['Environment', 'Education', 'Healthcare', 'Agriculture'],
              },
              {
                'field': 'fundingGoal',
                'type': FilterType.range,
                'label': 'Funding Goal',
                'min': 0,
                'max': 500000,
                'minValue': 0,
                'maxValue': 2000000,
                'divisions': 100,
              },
              {
                'field': 'location',
                'type': FilterType.geolocation,
                'label': 'Location',
              },
            ],
          },
        ];
      
      default:
        return baseSections;
    }
  }
  
  /// Add or update filter
  void _addOrUpdateFilter(
    String field,
    FilterType type,
    FilterOperator operator,
    dynamic value,
    String displayName,
  ) {
    if (value == null || value.toString().isEmpty) return;
    
    setState(() {
      // Remove existing filter for this field
      _activeFilters.removeWhere((f) => f.field == field && f.operator == operator);
      
      // Add new filter
      _activeFilters.add(SearchFilter(
        field: field,
        type: type,
        operator: operator,
        value: value,
        displayName: displayName,
        isActive: true,
      ));
    });
    
    widget.onFiltersChanged(_activeFilters);
  }
  
  /// Remove filter
  void _removeFilter(SearchFilter filter) {
    setState(() {
      _activeFilters.remove(filter);
    });
    widget.onFiltersChanged(_activeFilters);
  }
  
  /// Clear all filters
  void _clearAllFilters() {
    setState(() {
      _activeFilters.clear();
    });
    widget.onFiltersChanged(_activeFilters);
  }
  
  /// Get boolean filter value
  bool _getBooleanFilterValue(String field) {
    final filter = _activeFilters.firstWhere(
      (f) => f.field == field,
      orElse: () => const SearchFilter(
        field: '',
        type: FilterType.boolean,
        operator: FilterOperator.equals,
        value: false,
      ),
    );
    return filter.value as bool? ?? false;
  }
  
  /// Check if option is selected
  bool _isOptionSelected(String field, String option) {
    return _activeFilters.any(
      (f) => f.field == field && f.value == option,
    );
  }
  
  /// Toggle list option
  void _toggleListOption(String field, String option, bool selected, String displayName) {
    if (selected) {
      _addOrUpdateFilter(
        field,
        FilterType.list,
        FilterOperator.equals,
        option,
        displayName,
      );
    } else {
      _activeFilters.removeWhere(
        (f) => f.field == field && f.value == option,
      );
      setState(() {});
      widget.onFiltersChanged(_activeFilters);
    }
  }
  
  /// Select date
  Future<void> _selectDate(BuildContext context, Map<String, dynamic> config, bool isStartDate) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    
    if (date != null) {
      _addOrUpdateFilter(
        config['field'] as String,
        FilterType.date,
        isStartDate ? FilterOperator.greaterThanOrEqual : FilterOperator.lessThanOrEqual,
        date,
        '${config['label']} (${isStartDate ? 'From' : 'To'})',
      );
    }
  }
  
  /// Select location
  void _selectLocation(BuildContext context, Map<String, dynamic> config) {
    // Implement location picker
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select Location'),
        content: const Text('Location picker would be implemented here'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Add location filter
            },
            child: const Text('Select'),
          ),
        ],
      ),
    );
  }
}