import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/constants/spacing.dart';
import '../../domain/entities/search_query.dart';

/// Saved searches panel for managing saved search queries
class SavedSearchesPanel extends ConsumerStatefulWidget {
  final Function(SavedSearch) onSearchSelected;
  final Function(SavedSearch) onSearchDeleted;
  
  const SavedSearchesPanel({
    super.key,
    required this.onSearchSelected,
    required this.onSearchDeleted,
  });

  @override
  ConsumerState<SavedSearchesPanel> createState() => _SavedSearchesPanelState();
}

class _SavedSearchesPanelState extends ConsumerState<SavedSearchesPanel> {
  List<SavedSearch> _savedSearches = [];
  bool _isLoading = false;
  
  @override
  void initState() {
    super.initState();
    _loadSavedSearches();
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
              child: _isLoading
                  ? _buildLoadingState(context)
                  : _savedSearches.isEmpty
                      ? _buildEmptyState(context)
                      : _buildSavedSearchesList(context),
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
          Icons.bookmark,
          color: Theme.of(context).colorScheme.primary,
          size: 20,
        ),
        const SizedBox(width: Spacing.sm),
        Text(
          'Saved Searches',
          style: AdaptiveTextStyles.titleMedium(context),
        ),
        const Spacer(),
        Text(
          '${_savedSearches.length}',
          style: AdaptiveTextStyles.bodySmall(context).copyWith(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
          ),
        ),
      ],
    );
  }
  
  /// Build loading state
  Widget _buildLoadingState(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
  
  /// Build empty state
  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.bookmark_outline,
            size: 48,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
          ),
          AdaptiveSpacing.verticalMedium(),
          Text(
            'No Saved Searches',
            style: AdaptiveTextStyles.titleMedium(context),
          ),
          const SizedBox(height: Spacing.sm),
          Text(
            'Save frequently used searches for quick access',
            style: AdaptiveTextStyles.bodySmall(context).copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
  
  /// Build saved searches list
  Widget _buildSavedSearchesList(BuildContext context) {
    return ListView.separated(
      itemCount: _savedSearches.length,
      separatorBuilder: (context, index) => const SizedBox(height: Spacing.sm),
      itemBuilder: (context, index) {
        final savedSearch = _savedSearches[index];
        return _buildSavedSearchItem(context, savedSearch);
      },
    );
  }
  
  /// Build saved search item
  Widget _buildSavedSearchItem(BuildContext context, SavedSearch savedSearch) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: InkWell(
        onTap: () => widget.onSearchSelected(savedSearch),
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(Spacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    _getScopeIcon(savedSearch.query.scope),
                    size: 16,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: Spacing.sm),
                  Expanded(
                    child: Text(
                      savedSearch.name,
                      style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (savedSearch.isDefault)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'DEFAULT',
                        style: AdaptiveTextStyles.bodySmall(context).copyWith(
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  const SizedBox(width: Spacing.sm),
                  PopupMenuButton<String>(
                    onSelected: (action) => _handleSearchAction(action, savedSearch),
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: 'edit',
                        child: ListTile(
                          leading: Icon(Icons.edit, size: 16),
                          title: Text('Edit'),
                        ),
                      ),
                      const PopupMenuItem(
                        value: 'duplicate',
                        child: ListTile(
                          leading: Icon(Icons.copy, size: 16),
                          title: Text('Duplicate'),
                        ),
                      ),
                      const PopupMenuItem(
                        value: 'share',
                        child: ListTile(
                          leading: Icon(Icons.share, size: 16),
                          title: Text('Share'),
                        ),
                      ),
                      const PopupMenuItem(
                        value: 'delete',
                        child: ListTile(
                          leading: Icon(Icons.delete, color: Colors.red, size: 16),
                          title: Text('Delete', style: TextStyle(color: Colors.red)),
                        ),
                      ),
                    ],
                    child: Icon(
                      Icons.more_vert,
                      size: 16,
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 4),
              
              if (savedSearch.description.isNotEmpty)
                Text(
                  savedSearch.description,
                  style: AdaptiveTextStyles.bodySmall(context).copyWith(
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              
              AdaptiveSpacing.verticalSmall(),
              
              // Query details
              Container(
                padding: const EdgeInsets.all(Spacing.sm),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (savedSearch.query.query.isNotEmpty)
                      Text(
                        '"${savedSearch.query.query}"',
                        style: AdaptiveTextStyles.bodySmall(context).copyWith(
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    if (savedSearch.query.filters.isNotEmpty) ...[
                      const SizedBox(height: 2),
                      Text(
                        '${savedSearch.query.filters.length} filters applied',
                        style: AdaptiveTextStyles.bodySmall(context).copyWith(
                          fontSize: 10,
                          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              
              AdaptiveSpacing.verticalSmall(),
              
              // Metadata
              Row(
                children: [
                  Text(
                    savedSearch.query.scope.displayName,
                    style: AdaptiveTextStyles.bodySmall(context).copyWith(
                      fontSize: 10,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(width: Spacing.sm),
                  Text(
                    '•',
                    style: AdaptiveTextStyles.bodySmall(context).copyWith(
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                    ),
                  ),
                  const SizedBox(width: Spacing.sm),
                  Text(
                    _formatDate(savedSearch.createdAt),
                    style: AdaptiveTextStyles.bodySmall(context).copyWith(
                      fontSize: 10,
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                    ),
                  ),
                  const Spacer(),
                  if (savedSearch.usageCount != null && savedSearch.usageCount! > 0)
                    Text(
                      'Used ${savedSearch.usageCount} times',
                      style: AdaptiveTextStyles.bodySmall(context).copyWith(
                        fontSize: 10,
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                      ),
                    ),
                ],
              ),
            ],
          ),
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
  
  /// Format date
  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);
    
    if (difference.inDays > 7) {
      return '${date.day}/${date.month}/${date.year}';
    } else if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else {
      return '${difference.inMinutes}m ago';
    }
  }
  
  /// Handle search action
  void _handleSearchAction(String action, SavedSearch savedSearch) {
    switch (action) {
      case 'edit':
        _editSearch(savedSearch);
        break;
      case 'duplicate':
        _duplicateSearch(savedSearch);
        break;
      case 'share':
        _shareSearch(savedSearch);
        break;
      case 'delete':
        _deleteSearch(savedSearch);
        break;
    }
  }
  
  /// Edit search
  void _editSearch(SavedSearch savedSearch) {
    final nameController = TextEditingController(text: savedSearch.name);
    final descriptionController = TextEditingController(text: savedSearch.description);
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Saved Search'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Search Name',
              ),
            ),
            const SizedBox(height: Spacing.md),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
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
              Navigator.of(context).pop();
              _updateSearch(savedSearch, nameController.text, descriptionController.text);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
  
  /// Duplicate search
  void _duplicateSearch(SavedSearch savedSearch) {
    // Implement duplicate functionality
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Duplicated "${savedSearch.name}"')),
    );
  }
  
  /// Share search
  void _shareSearch(SavedSearch savedSearch) {
    // Implement share functionality
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Share Search'),
        content: const Text('Share this saved search with other users?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Shared "${savedSearch.name}"')),
              );
            },
            child: const Text('Share'),
          ),
        ],
      ),
    );
  }
  
  /// Delete search
  void _deleteSearch(SavedSearch savedSearch) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Saved Search'),
        content: Text('Are you sure you want to delete "${savedSearch.name}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              setState(() {
                _savedSearches.remove(savedSearch);
              });
              widget.onSearchDeleted(savedSearch);
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
  
  /// Update search
  void _updateSearch(SavedSearch savedSearch, String name, String description) {
    // Implement update functionality
    setState(() {
      final index = _savedSearches.indexOf(savedSearch);
      if (index != -1) {
        _savedSearches[index] = savedSearch.copyWith(
          name: name,
          description: description,
          updatedAt: DateTime.now(),
        );
      }
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Search updated successfully')),
    );
  }
  
  /// Load saved searches
  Future<void> _loadSavedSearches() async {
    setState(() {
      _isLoading = true;
    });
    
    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 500));
    
    setState(() {
      _savedSearches = _getMockSavedSearches();
      _isLoading = false;
    });
  }
  
  /// Get mock saved searches
  List<SavedSearch> _getMockSavedSearches() {
    return [
      SavedSearch(
        id: '1',
        userId: 'user1',
        name: 'Renewable Energy Projects',
        description: 'All renewable energy projects in Europe',
        query: SearchQuery(
          id: 'q1',
          userId: 'user1',
          query: 'renewable energy',
          scope: SearchScope.projects,
          createdAt: DateTime.now(),
          filters: [
            const SearchFilter(
              field: 'category',
              type: FilterType.list,
              operator: FilterOperator.equals,
              value: 'Environment',
              displayName: 'Category',
            ),
          ],
        ),
        createdAt: DateTime.now().subtract(const Duration(days: 7)),
        updatedAt: DateTime.now().subtract(const Duration(days: 2)),
        isDefault: true,
        usageCount: 15,
      ),
      SavedSearch(
        id: '2',
        userId: 'user1',
        name: 'High-Value Investments',
        description: 'Investments over €50,000',
        query: SearchQuery(
          id: 'q2',
          userId: 'user1',
          query: 'investment',
          scope: SearchScope.investments,
          createdAt: DateTime.now(),
          filters: [
            const SearchFilter(
              field: 'amount',
              type: FilterType.range,
              operator: FilterOperator.greaterThanOrEqual,
              value: 50000,
              displayName: 'Amount',
            ),
          ],
        ),
        createdAt: DateTime.now().subtract(const Duration(days: 14)),
        updatedAt: DateTime.now().subtract(const Duration(days: 1)),
        usageCount: 8,
      ),
      SavedSearch(
        id: '3',
        userId: 'user1',
        name: 'Educational Initiatives',
        description: 'Education-focused social impact projects',
        query: SearchQuery(
          id: 'q3',
          userId: 'user1',
          query: 'education',
          scope: SearchScope.projects,
          createdAt: DateTime.now(),
        ),
        createdAt: DateTime.now().subtract(const Duration(days: 3)),
        updatedAt: DateTime.now().subtract(const Duration(days: 3)),
        usageCount: 3,
      ),
    ];
  }
}