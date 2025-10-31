import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/widgets/responsive/responsive_layout.dart';
import '../../../../shared/constants/spacing.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/search_filters_panel.dart';
import '../widgets/search_results_list.dart';
import '../widgets/saved_searches_panel.dart';
import '../widgets/search_analytics_card.dart';
import '../../domain/entities/search_query.dart';

/// Advanced search screen with comprehensive filtering capabilities
class AdvancedSearchScreen extends ConsumerStatefulWidget {
  const AdvancedSearchScreen({super.key});

  @override
  ConsumerState<AdvancedSearchScreen> createState() => _AdvancedSearchScreenState();
}

class _AdvancedSearchScreenState extends ConsumerState<AdvancedSearchScreen> 
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();
  
  String _currentQuery = '';
  SearchScope _selectedScope = SearchScope.all;
  List<SearchFilter> _activeFilters = [];
  List<SearchSort> _activeSorts = [];
  bool _showFilters = false;
  final bool _showSavedSearches = false;
  
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }
  
  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: _buildMobileLayout(context),
      tablet: _buildTabletLayout(context),
      desktop: _buildDesktopLayout(context),
    );
  }
  
  /// Build mobile layout with search tabs
  Widget _buildMobileLayout(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search & Filters',
          style: AdaptiveTextStyles.titleLarge(context),
        ),
        actions: [
          IconButton(
            onPressed: () => _toggleFilters(),
            icon: Icon(
              _showFilters ? Icons.filter_list : Icons.filter_list_outlined,
            ),
            tooltip: 'Filters',
          ),
          IconButton(
            onPressed: () => _showSavedSearchesDialog(),
            icon: const Icon(Icons.bookmark_outlined),
            tooltip: 'Saved Searches',
          ),
          PopupMenuButton<String>(
            onSelected: _handleMenuAction,
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'save_search',
                child: ListTile(
                  leading: Icon(Icons.bookmark_add),
                  title: Text('Save Search'),
                ),
              ),
              const PopupMenuItem(
                value: 'search_history',
                child: ListTile(
                  leading: Icon(Icons.history),
                  title: Text('Search History'),
                ),
              ),
              const PopupMenuItem(
                value: 'export_results',
                child: ListTile(
                  leading: Icon(Icons.download),
                  title: Text('Export Results'),
                ),
              ),
            ],
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: const [
            Tab(text: 'All', icon: Icon(Icons.search_outlined)),
            Tab(text: 'Investments', icon: Icon(Icons.trending_up_outlined)),
            Tab(text: 'Projects', icon: Icon(Icons.work_outline)),
            Tab(text: 'Organizations', icon: Icon(Icons.business_outlined)),
          ],
          onTap: (index) {
            _handleScopeChange(_getScopeFromTabIndex(index));
          },
        ),
      ),
      body: Column(
        children: [
          // Search bar
          Container(
            padding: const EdgeInsets.all(Spacing.md),
            child: SearchBarWidget(
              controller: _searchController,
              scope: _selectedScope,
              onQueryChanged: _handleQueryChange,
              onScopeChanged: _handleScopeChange,
              onSearch: _performSearch,
            ),
          ),
          
          // Filters panel (when shown)
          if (_showFilters)
            Container(
              constraints: const BoxConstraints(maxHeight: 200),
              child: SearchFiltersPanel(
                filters: _activeFilters,
                scope: _selectedScope,
                onFiltersChanged: _handleFiltersChanged,
              ),
            ),
          
          // Results
          Expanded(
            child: SearchResultsList(
              query: _currentQuery,
              scope: _selectedScope,
              filters: _activeFilters,
              sorts: _activeSorts,
            ),
          ),
        ],
      ),
    );
  }
  
  /// Build tablet layout with side panel
  Widget _buildTabletLayout(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Advanced Search',
          style: AdaptiveTextStyles.titleLarge(context),
        ),
        actions: [
          IconButton(
            onPressed: () => _showSavedSearchesDialog(),
            icon: const Icon(Icons.bookmark_outlined),
            tooltip: 'Saved Searches',
          ),
          IconButton(
            onPressed: () => _handleMenuAction('export_results'),
            icon: const Icon(Icons.download),
            tooltip: 'Export',
          ),
        ],
      ),
      body: Row(
        children: [
          // Filters sidebar
          SizedBox(
            width: 300,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
                  ),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(Spacing.md),
                    child: SearchBarWidget(
                      controller: _searchController,
                      scope: _selectedScope,
                      onQueryChanged: _handleQueryChange,
                      onScopeChanged: _handleScopeChange,
                      onSearch: _performSearch,
                    ),
                  ),
                  Expanded(
                    child: SearchFiltersPanel(
                      filters: _activeFilters,
                      scope: _selectedScope,
                      onFiltersChanged: _handleFiltersChanged,
                      showExpanded: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Results area
          Expanded(
            child: SearchResultsList(
              query: _currentQuery,
              scope: _selectedScope,
              filters: _activeFilters,
              sorts: _activeSorts,
            ),
          ),
        ],
      ),
    );
  }
  
  /// Build desktop layout with comprehensive search interface
  Widget _buildDesktopLayout(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Advanced Search & Analytics',
          style: AdaptiveTextStyles.titleLarge(context),
        ),
        actions: [
          TextButton.icon(
            onPressed: () => _handleMenuAction('save_search'),
            icon: const Icon(Icons.bookmark_add, size: 18),
            label: const Text('Save Search'),
          ),
          const SizedBox(width: Spacing.sm),
          TextButton.icon(
            onPressed: () => _showAdvancedSettings(),
            icon: const Icon(Icons.tune, size: 18),
            label: const Text('Advanced'),
          ),
          const SizedBox(width: Spacing.sm),
          ElevatedButton.icon(
            onPressed: () => _handleMenuAction('export_results'),
            icon: const Icon(Icons.download, size: 18),
            label: const Text('Export Results'),
          ),
          const SizedBox(width: Spacing.lg),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left sidebar - Search and Filters
            SizedBox(
              width: 350,
              child: Column(
                children: [
                  // Search section
                  AdaptiveCard(
                    child: Padding(
                      padding: const EdgeInsets.all(Spacing.lg),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Search',
                            style: AdaptiveTextStyles.titleMedium(context),
                          ),
                          AdaptiveSpacing.verticalMedium(),
                          SearchBarWidget(
                            controller: _searchController,
                            scope: _selectedScope,
                            onQueryChanged: _handleQueryChange,
                            onScopeChanged: _handleScopeChange,
                            onSearch: _performSearch,
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  AdaptiveSpacing.verticalLarge(),
                  
                  // Filters section
                  Expanded(
                    child: SearchFiltersPanel(
                      filters: _activeFilters,
                      scope: _selectedScope,
                      onFiltersChanged: _handleFiltersChanged,
                      showExpanded: true,
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(width: Spacing.lg),
            
            // Main content - Results and Analytics
            Expanded(
              child: Column(
                children: [
                  // Results section
                  Expanded(
                    flex: 3,
                    child: SearchResultsList(
                      query: _currentQuery,
                      scope: _selectedScope,
                      filters: _activeFilters,
                      sorts: _activeSorts,
                      showAdvanced: true,
                    ),
                  ),
                  
                  AdaptiveSpacing.verticalLarge(),
                  
                  // Analytics section
                  SizedBox(
                    height: 200,
                    child: SearchAnalyticsCard(
                      query: _currentQuery,
                      scope: _selectedScope,
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(width: Spacing.lg),
            
            // Right sidebar - Saved Searches
            SizedBox(
              width: 280,
              child: SavedSearchesPanel(
                onSearchSelected: _loadSavedSearch,
                onSearchDeleted: _deleteSavedSearch,
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  /// Get search scope from tab index
  SearchScope _getScopeFromTabIndex(int index) {
    switch (index) {
      case 0:
        return SearchScope.all;
      case 1:
        return SearchScope.investments;
      case 2:
        return SearchScope.projects;
      case 3:
        return SearchScope.organizations;
      default:
        return SearchScope.all;
    }
  }
  
  /// Handle query change
  void _handleQueryChange(String query) {
    setState(() {
      _currentQuery = query;
    });
  }
  
  /// Handle scope change
  void _handleScopeChange(SearchScope scope) {
    setState(() {
      _selectedScope = scope;
    });
    _performSearch();
  }
  
  /// Handle filters changed
  void _handleFiltersChanged(List<SearchFilter> filters) {
    setState(() {
      _activeFilters = filters;
    });
    _performSearch();
  }
  
  /// Toggle filters panel
  void _toggleFilters() {
    setState(() {
      _showFilters = !_showFilters;
    });
  }
  
  /// Perform search
  void _performSearch() {
    // Implement search logic here
    // This would typically call a search service/provider
  }
  
  /// Handle menu actions
  void _handleMenuAction(String action) {
    switch (action) {
      case 'save_search':
        _showSaveSearchDialog();
        break;
      case 'search_history':
        _showSearchHistory();
        break;
      case 'export_results':
        _exportSearchResults();
        break;
    }
  }
  
  /// Show saved searches dialog
  void _showSavedSearchesDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Saved Searches'),
        content: SizedBox(
          width: 400,
          height: 300,
          child: SavedSearchesPanel(
            onSearchSelected: (search) {
              Navigator.of(context).pop();
              _loadSavedSearch(search);
            },
            onSearchDeleted: _deleteSavedSearch,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
  
  /// Show save search dialog
  void _showSaveSearchDialog() {
    final nameController = TextEditingController();
    final descriptionController = TextEditingController();
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Save Search'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Search Name',
                hintText: 'Enter a name for this search',
              ),
            ),
            const SizedBox(height: Spacing.md),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description (Optional)',
                hintText: 'Brief description of this search',
              ),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (nameController.text.isNotEmpty) {
                _saveCurrentSearch(nameController.text, descriptionController.text);
                Navigator.of(context).pop();
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
  
  /// Show search history
  void _showSearchHistory() {
    context.go('/search/history');
  }
  
  /// Show advanced settings
  void _showAdvancedSettings() {
    context.go('/search/settings');
  }
  
  /// Export search results
  void _exportSearchResults() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Export Search Results'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Select the format for exporting your search results:'),
            const SizedBox(height: Spacing.md),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pop();
                      _performExport('csv');
                    },
                    icon: const Icon(Icons.table_chart),
                    label: const Text('CSV'),
                  ),
                ),
                const SizedBox(width: Spacing.sm),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pop();
                      _performExport('json');
                    },
                    icon: const Icon(Icons.code),
                    label: const Text('JSON'),
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }
  
  /// Perform export
  void _performExport(String format) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Exporting search results as $format...'),
        action: SnackBarAction(
          label: 'View',
          onPressed: () {
            // Open exported file
          },
        ),
      ),
    );
  }
  
  /// Save current search
  void _saveCurrentSearch(String name, String description) {
    // Implement save search logic
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Search "$name" saved successfully')),
    );
  }
  
  /// Load saved search
  void _loadSavedSearch(SavedSearch search) {
    setState(() {
      _currentQuery = search.query.query;
      _selectedScope = search.query.scope;
      _activeFilters = search.query.filters;
      _activeSorts = search.query.sorting;
      _searchController.text = _currentQuery;
    });
    _performSearch();
  }
  
  /// Delete saved search
  void _deleteSavedSearch(SavedSearch search) {
    // Implement delete logic
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Search "${search.name}" deleted')),
    );
  }
}