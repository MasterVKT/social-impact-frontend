import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/constants/spacing.dart';
import '../../domain/entities/search_query.dart';

/// Enhanced search bar widget with suggestions and scope selection
class SearchBarWidget extends ConsumerStatefulWidget {
  final TextEditingController controller;
  final SearchScope scope;
  final Function(String) onQueryChanged;
  final Function(SearchScope) onScopeChanged;
  final VoidCallback onSearch;
  final bool showScopeSelector;
  
  const SearchBarWidget({
    super.key,
    required this.controller,
    required this.scope,
    required this.onQueryChanged,
    required this.onScopeChanged,
    required this.onSearch,
    this.showScopeSelector = true,
  });

  @override
  ConsumerState<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends ConsumerState<SearchBarWidget> {
  final FocusNode _focusNode = FocusNode();
  bool _showSuggestions = false;
  List<String> _suggestions = [];
  
  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChanged);
    widget.controller.addListener(_onTextChanged);
  }
  
  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChanged);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Main search bar
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _focusNode.hasFocus 
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.outline.withOpacity(0.5),
              width: _focusNode.hasFocus ? 2 : 1,
            ),
            boxShadow: _focusNode.hasFocus 
                ? [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                      blurRadius: 8,
                      spreadRadius: 0,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : null,
          ),
          child: Row(
            children: [
              // Scope selector
              if (widget.showScopeSelector)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: Spacing.md),
                  child: _buildScopeSelector(context),
                ),
              
              // Search input
              Expanded(
                child: TextField(
                  controller: widget.controller,
                  focusNode: _focusNode,
                  decoration: InputDecoration(
                    hintText: _getHintText(),
                    hintStyle: AdaptiveTextStyles.bodyMedium(context).copyWith(
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: Spacing.md,
                      vertical: Spacing.md,
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                    ),
                    suffixIcon: widget.controller.text.isNotEmpty
                        ? IconButton(
                            onPressed: _clearSearch,
                            icon: Icon(
                              Icons.clear,
                              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                            ),
                          )
                        : null,
                  ),
                  onSubmitted: (_) => widget.onSearch(),
                  textInputAction: TextInputAction.search,
                ),
              ),
              
              // Search button
              Container(
                margin: const EdgeInsets.only(right: Spacing.sm),
                child: ElevatedButton(
                  onPressed: widget.onSearch,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: Spacing.md,
                      vertical: Spacing.sm,
                    ),
                  ),
                  child: const Text('Search'),
                ),
              ),
            ],
          ),
        ),
        
        // Search suggestions
        if (_showSuggestions && _suggestions.isNotEmpty)
          Container(
            margin: const EdgeInsets.only(top: Spacing.xs),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
              ),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.shadow.withOpacity(0.1),
                  blurRadius: 8,
                  spreadRadius: 0,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(Spacing.sm),
                  child: Text(
                    'Suggestions',
                    style: AdaptiveTextStyles.bodySmall(context).copyWith(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                    ),
                  ),
                ),
                ..._suggestions.take(5).map((suggestion) {
                  return _buildSuggestionItem(context, suggestion);
                }),
              ],
            ),
          ),
      ],
    );
  }
  
  /// Build scope selector dropdown
  Widget _buildScopeSelector(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.sm),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            color: Theme.of(context).colorScheme.outline.withOpacity(0.3),
          ),
        ),
      ),
      child: DropdownButton<SearchScope>(
        value: widget.scope,
        onChanged: (scope) {
          if (scope != null) {
            widget.onScopeChanged(scope);
          }
        },
        underline: const SizedBox(),
        style: AdaptiveTextStyles.bodyMedium(context),
        items: SearchScope.values.map((scope) {
          return DropdownMenuItem(
            value: scope,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  _getScopeIcon(scope),
                  size: 16,
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                ),
                const SizedBox(width: Spacing.xs),
                Text(scope.displayName),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
  
  /// Build suggestion item
  Widget _buildSuggestionItem(BuildContext context, String suggestion) {
    return InkWell(
      onTap: () => _selectSuggestion(suggestion),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Spacing.md,
          vertical: Spacing.sm,
        ),
        child: Row(
          children: [
            Icon(
              Icons.history,
              size: 16,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
            ),
            const SizedBox(width: Spacing.sm),
            Expanded(
              child: Text(
                suggestion,
                style: AdaptiveTextStyles.bodyMedium(context),
              ),
            ),
            Icon(
              Icons.call_made,
              size: 14,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.4),
            ),
          ],
        ),
      ),
    );
  }
  
  /// Get scope icon
  IconData _getScopeIcon(SearchScope scope) {
    switch (scope) {
      case SearchScope.all:
        return Icons.search;
      case SearchScope.investments:
        return Icons.trending_up;
      case SearchScope.projects:
        return Icons.work;
      case SearchScope.organizations:
        return Icons.business;
      case SearchScope.users:
        return Icons.people;
      case SearchScope.transactions:
        return Icons.payment;
      case SearchScope.reports:
        return Icons.description;
      case SearchScope.compliance:
        return Icons.verified_user;
      case SearchScope.notifications:
        return Icons.notifications;
      case SearchScope.analytics:
        return Icons.analytics;
    }
  }
  
  /// Get hint text based on scope
  String _getHintText() {
    switch (widget.scope) {
      case SearchScope.all:
        return 'Search everything...';
      case SearchScope.investments:
        return 'Search investments and portfolios...';
      case SearchScope.projects:
        return 'Search projects and initiatives...';
      case SearchScope.organizations:
        return 'Search organizations and companies...';
      case SearchScope.users:
        return 'Search users and contacts...';
      case SearchScope.transactions:
        return 'Search transactions and payments...';
      case SearchScope.reports:
        return 'Search reports and documents...';
      case SearchScope.compliance:
        return 'Search compliance and audit data...';
      case SearchScope.notifications:
        return 'Search notifications and alerts...';
      case SearchScope.analytics:
        return 'Search analytics and insights...';
    }
  }
  
  /// Handle focus changes
  void _onFocusChanged() {
    setState(() {
      _showSuggestions = _focusNode.hasFocus && _suggestions.isNotEmpty;
    });
  }
  
  /// Handle text changes
  void _onTextChanged() {
    final query = widget.controller.text;
    widget.onQueryChanged(query);
    
    if (query.isNotEmpty) {
      _updateSuggestions(query);
    } else {
      setState(() {
        _suggestions = [];
        _showSuggestions = false;
      });
    }
  }
  
  /// Update suggestions based on query
  void _updateSuggestions(String query) {
    // Mock suggestions - in real app, this would come from a provider
    final mockSuggestions = [
      'renewable energy projects',
      'clean water initiatives',
      'sustainable agriculture',
      'education programs',
      'healthcare access',
      'microfinance lending',
      'carbon offset programs',
      'social impact bonds',
      'ESG investments',
      'community development',
    ];
    
    final filteredSuggestions = mockSuggestions
        .where((s) => s.toLowerCase().contains(query.toLowerCase()))
        .toList();
    
    setState(() {
      _suggestions = filteredSuggestions;
      _showSuggestions = _focusNode.hasFocus && filteredSuggestions.isNotEmpty;
    });
  }
  
  /// Select suggestion
  void _selectSuggestion(String suggestion) {
    widget.controller.text = suggestion;
    widget.onQueryChanged(suggestion);
    setState(() {
      _showSuggestions = false;
    });
    _focusNode.unfocus();
    widget.onSearch();
  }
  
  /// Clear search
  void _clearSearch() {
    widget.controller.clear();
    widget.onQueryChanged('');
    setState(() {
      _suggestions = [];
      _showSuggestions = false;
    });
    _focusNode.requestFocus();
  }
}