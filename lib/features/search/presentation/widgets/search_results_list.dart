import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/constants/spacing.dart';
import '../../domain/entities/search_query.dart';

/// Search results list with advanced result display
class SearchResultsList extends ConsumerStatefulWidget {
  final String query;
  final SearchScope scope;
  final List<SearchFilter> filters;
  final List<SearchSort> sorts;
  final bool showAdvanced;
  
  const SearchResultsList({
    super.key,
    required this.query,
    required this.scope,
    required this.filters,
    required this.sorts,
    this.showAdvanced = false,
  });

  @override
  ConsumerState<SearchResultsList> createState() => _SearchResultsListState();
}

class _SearchResultsListState extends ConsumerState<SearchResultsList> {
  List<SearchResult> _results = [];
  bool _isLoading = false;
  String _selectedView = 'list';
  String _selectedSort = 'relevance';
  
  @override
  void initState() {
    super.initState();
    _loadResults();
  }
  
  @override
  void didUpdateWidget(SearchResultsList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.query != widget.query ||
        oldWidget.scope != widget.scope ||
        oldWidget.filters != widget.filters) {
      _loadResults();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildResultsHeader(context),
          const Divider(height: 1),
          Expanded(
            child: _isLoading
                ? _buildLoadingState(context)
                : _results.isEmpty
                    ? _buildEmptyState(context)
                    : _buildResultsContent(context),
          ),
        ],
      ),
    );
  }
  
  /// Build results header with controls
  Widget _buildResultsHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Spacing.lg),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: Theme.of(context).colorScheme.primary,
            size: 20,
          ),
          const SizedBox(width: Spacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _getResultsTitle(),
                  style: AdaptiveTextStyles.titleMedium(context),
                ),
                if (widget.query.isNotEmpty)
                  Text(
                    'for "${widget.query}"',
                    style: AdaptiveTextStyles.bodySmall(context).copyWith(
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                    ),
                  ),
              ],
            ),
          ),
          
          // View toggle
          ToggleButtons(
            isSelected: [
              _selectedView == 'list',
              _selectedView == 'grid',
            ],
            onPressed: (index) {
              setState(() {
                _selectedView = index == 0 ? 'list' : 'grid';
              });
            },
            constraints: const BoxConstraints(
              minHeight: 32,
              minWidth: 32,
            ),
            children: const [
              Icon(Icons.list, size: 18),
              Icon(Icons.grid_view, size: 18),
            ],
          ),
          
          const SizedBox(width: Spacing.sm),
          
          // Sort dropdown
          Container(
            padding: const EdgeInsets.symmetric(horizontal: Spacing.sm),
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).colorScheme.outline.withOpacity(0.5),
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            child: DropdownButton<String>(
              value: _selectedSort,
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _selectedSort = value;
                  });
                  _sortResults(value);
                }
              },
              underline: const SizedBox(),
              items: const [
                DropdownMenuItem(
                  value: 'relevance',
                  child: Text('Relevance'),
                ),
                DropdownMenuItem(
                  value: 'date_desc',
                  child: Text('Newest First'),
                ),
                DropdownMenuItem(
                  value: 'date_asc',
                  child: Text('Oldest First'),
                ),
                DropdownMenuItem(
                  value: 'title',
                  child: Text('Title A-Z'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  /// Build loading state
  Widget _buildLoadingState(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: Spacing.md),
          Text('Searching...'),
        ],
      ),
    );
  }
  
  /// Build empty state
  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_off,
            size: 64,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
          ),
          AdaptiveSpacing.verticalMedium(),
          Text(
            widget.query.isEmpty ? 'Start Searching' : 'No Results Found',
            style: AdaptiveTextStyles.titleMedium(context),
          ),
          const SizedBox(height: Spacing.sm),
          Text(
            widget.query.isEmpty
                ? 'Enter a search term to find relevant content'
                : 'Try adjusting your search terms or filters',
            style: AdaptiveTextStyles.bodyMedium(context).copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
            ),
            textAlign: TextAlign.center,
          ),
          if (widget.query.isNotEmpty) ...[
            AdaptiveSpacing.verticalMedium(),
            ElevatedButton.icon(
              onPressed: () => _showSearchSuggestions(),
              icon: const Icon(Icons.lightbulb_outline, size: 18),
              label: const Text('Get Search Suggestions'),
            ),
          ],
        ],
      ),
    );
  }
  
  /// Build results content
  Widget _buildResultsContent(BuildContext context) {
    return Column(
      children: [
        // Results count and filters summary
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: Spacing.lg,
            vertical: Spacing.sm,
          ),
          color: Theme.of(context).colorScheme.surfaceContainerHighest.withOpacity(0.3),
          child: Row(
            children: [
              Text(
                '${_results.length} results found',
                style: AdaptiveTextStyles.bodySmall(context).copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (widget.filters.isNotEmpty) ...[
                const SizedBox(width: Spacing.sm),
                Text(
                  '• ${widget.filters.length} filters applied',
                  style: AdaptiveTextStyles.bodySmall(context).copyWith(
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                  ),
                ),
              ],
              const Spacer(),
              Text(
                'Sorted by $_selectedSort',
                style: AdaptiveTextStyles.bodySmall(context).copyWith(
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
        
        // Results list/grid
        Expanded(
          child: _selectedView == 'list'
              ? _buildResultsList(context)
              : _buildResultsGrid(context),
        ),
      ],
    );
  }
  
  /// Build results list view
  Widget _buildResultsList(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(Spacing.lg),
      itemCount: _results.length,
      separatorBuilder: (context, index) => const SizedBox(height: Spacing.md),
      itemBuilder: (context, index) {
        final result = _results[index];
        return _buildResultListItem(context, result);
      },
    );
  }
  
  /// Build results grid view
  Widget _buildResultsGrid(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(Spacing.lg),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.2,
        mainAxisSpacing: Spacing.md,
        crossAxisSpacing: Spacing.md,
      ),
      itemCount: _results.length,
      itemBuilder: (context, index) {
        final result = _results[index];
        return _buildResultGridItem(context, result);
      },
    );
  }
  
  /// Build result list item
  Widget _buildResultListItem(BuildContext context, SearchResult result) {
    return Container(
      padding: const EdgeInsets.all(Spacing.md),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: InkWell(
        onTap: () => _openResult(result),
        borderRadius: BorderRadius.circular(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Result icon/image
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: _getResultTypeColor(result.type).withOpacity(0.1),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Icon(
                _getResultTypeIcon(result.type),
                color: _getResultTypeColor(result.type),
                size: 24,
              ),
            ),
            
            const SizedBox(width: Spacing.md),
            
            // Result content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    result.title,
                    style: AdaptiveTextStyles.titleSmall(context),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    result.description,
                    style: AdaptiveTextStyles.bodySmall(context).copyWith(
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  AdaptiveSpacing.verticalSmall(),
                  
                  // Tags and metadata
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: _getResultTypeColor(result.type).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          result.type.displayName,
                          style: AdaptiveTextStyles.bodySmall(context).copyWith(
                            color: _getResultTypeColor(result.type),
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(width: Spacing.sm),
                      const Icon(
                        Icons.star,
                        size: 12,
                        color: Colors.amber,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        '${(result.relevanceScore * 100).toInt()}%',
                        style: AdaptiveTextStyles.bodySmall(context).copyWith(
                          fontSize: 10,
                          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        _formatTimestamp(result.timestamp),
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
          ],
        ),
      ),
    );
  }
  
  /// Build result grid item
  Widget _buildResultGridItem(BuildContext context, SearchResult result) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: InkWell(
        onTap: () => _openResult(result),
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(Spacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                _getResultTypeIcon(result.type),
                color: _getResultTypeColor(result.type),
                size: 32,
              ),
              AdaptiveSpacing.verticalMedium(),
              Text(
                result.title,
                style: AdaptiveTextStyles.titleSmall(context),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Expanded(
                child: Text(
                  result.description,
                  style: AdaptiveTextStyles.bodySmall(context).copyWith(
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: _getResultTypeColor(result.type).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      result.type.displayName,
                      style: AdaptiveTextStyles.bodySmall(context).copyWith(
                        color: _getResultTypeColor(result.type),
                        fontSize: 9,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${(result.relevanceScore * 100).toInt()}%',
                    style: AdaptiveTextStyles.bodySmall(context).copyWith(
                      fontSize: 10,
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
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
  
  /// Get results title
  String _getResultsTitle() {
    final scopeName = widget.scope == SearchScope.all ? 'All Content' : widget.scope.displayName;
    return 'Search Results - $scopeName';
  }
  
  /// Get result type icon
  IconData _getResultTypeIcon(SearchResultType type) {
    switch (type) {
      case SearchResultType.investment:
        return Icons.trending_up;
      case SearchResultType.project:
        return Icons.work;
      case SearchResultType.organization:
        return Icons.business;
      case SearchResultType.user:
        return Icons.person;
      case SearchResultType.transaction:
        return Icons.payment;
      case SearchResultType.report:
        return Icons.description;
      case SearchResultType.document:
        return Icons.article;
      case SearchResultType.notification:
        return Icons.notifications;
      case SearchResultType.insight:
        return Icons.lightbulb;
      case SearchResultType.kpi:
        return Icons.speed;
    }
  }
  
  /// Get result type color
  Color _getResultTypeColor(SearchResultType type) {
    switch (type) {
      case SearchResultType.investment:
        return Colors.green;
      case SearchResultType.project:
        return Colors.blue;
      case SearchResultType.organization:
        return Colors.purple;
      case SearchResultType.user:
        return Colors.orange;
      case SearchResultType.transaction:
        return Colors.teal;
      case SearchResultType.report:
        return Colors.indigo;
      case SearchResultType.document:
        return Colors.brown;
      case SearchResultType.notification:
        return Colors.pink;
      case SearchResultType.insight:
        return Colors.amber;
      case SearchResultType.kpi:
        return Colors.red;
    }
  }
  
  /// Format timestamp
  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);
    
    if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else {
      return '${difference.inMinutes}m ago';
    }
  }
  
  /// Load search results
  Future<void> _loadResults() async {
    setState(() {
      _isLoading = true;
    });
    
    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 1000));
    
    setState(() {
      _results = _getMockResults();
      _isLoading = false;
    });
  }
  
  /// Get mock results
  List<SearchResult> _getMockResults() {
    if (widget.query.isEmpty) return [];
    
    return [
      SearchResult(
        id: '1',
        type: SearchResultType.project,
        title: 'Clean Water Access Initiative',
        description: 'Providing clean drinking water to rural communities through sustainable infrastructure projects',
        data: {},
        relevanceScore: 0.95,
        timestamp: DateTime.now().subtract(const Duration(hours: 2)),
        tags: ['water', 'sustainability', 'rural'],
        highlights: {'title': 'Clean <mark>Water</mark> Access Initiative'},
      ),
      SearchResult(
        id: '2',
        type: SearchResultType.investment,
        title: 'Renewable Energy Portfolio',
        description: 'Diversified investment portfolio focused on solar and wind energy projects across Europe',
        data: {},
        relevanceScore: 0.87,
        timestamp: DateTime.now().subtract(const Duration(days: 1)),
        tags: ['renewable', 'energy', 'portfolio'],
      ),
      SearchResult(
        id: '3',
        type: SearchResultType.organization,
        title: 'Green Future Foundation',
        description: 'Non-profit organization dedicated to environmental conservation and sustainable development',
        data: {},
        relevanceScore: 0.82,
        timestamp: DateTime.now().subtract(const Duration(days: 3)),
        tags: ['environment', 'sustainability', 'foundation'],
      ),
    ];
  }
  
  /// Sort results
  void _sortResults(String sortType) {
    setState(() {
      switch (sortType) {
        case 'relevance':
          _results.sort((a, b) => b.relevanceScore.compareTo(a.relevanceScore));
          break;
        case 'date_desc':
          _results.sort((a, b) => b.timestamp.compareTo(a.timestamp));
          break;
        case 'date_asc':
          _results.sort((a, b) => a.timestamp.compareTo(b.timestamp));
          break;
        case 'title':
          _results.sort((a, b) => a.title.compareTo(b.title));
          break;
      }
    });
  }
  
  /// Open result
  void _openResult(SearchResult result) {
    // Navigate to result details
  }
  
  /// Show search suggestions
  void _showSearchSuggestions() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Search Suggestions'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Try these search tips:'),
            SizedBox(height: Spacing.sm),
            Text('• Use specific keywords'),
            Text('• Try different search terms'),
            Text('• Check your spelling'),
            Text('• Use filters to narrow results'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Got it'),
          ),
        ],
      ),
    );
  }
}