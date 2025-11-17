import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/widgets/responsive/responsive_layout.dart';
import '../../../../shared/constants/spacing.dart';
import '../../../../core/utils/platform_detector.dart';
import '../../domain/entities/project.dart';
import '../providers/investment_providers.dart';
import '../providers/favorites_provider.dart';

/// Browse projects screen for discovering investment opportunities
class BrowseProjectsScreen extends ConsumerStatefulWidget {
  const BrowseProjectsScreen({super.key});

  @override
  ConsumerState<BrowseProjectsScreen> createState() => _BrowseProjectsScreenState();
}

class _BrowseProjectsScreenState extends ConsumerState<BrowseProjectsScreen> {
  final TextEditingController _searchController = TextEditingController();
  ProjectSearchCriteria _searchCriteria = const ProjectSearchCriteria();

  // Pagination state (MVP Required)
  int _currentPage = 1;
  static const int _itemsPerPage = 10;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  /// Reset pagination when filters change
  void _resetPagination() {
    setState(() {
      _currentPage = 1;
    });
  }

  /// Load more projects
  void _loadMoreProjects() {
    setState(() {
      _currentPage++;
    });
  }

  @override
  void initState() {
    super.initState();

    // For web: Load filters from URL query parameters (MVP Required)
    if (PlatformDetector.isWeb) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _loadFiltersFromUrl();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: _buildMobileLayout(context),
      tablet: _buildTabletLayout(context),
      desktop: _buildDesktopLayout(context),
    );
  }

  /// Load filters from URL query parameters (Web only - MVP Required)
  void _loadFiltersFromUrl() {
    if (!PlatformDetector.isWeb) return;

    final uri = Uri.base;
    final queryParams = uri.queryParameters;

    if (queryParams.isEmpty) return;

    setState(() {
      // Load search query
      if (queryParams.containsKey('q')) {
        _searchController.text = queryParams['q'] ?? '';
      }

      // Load categories
      List<ProjectCategory>? categories;
      if (queryParams.containsKey('categories')) {
        final categoryNames = queryParams['categories']!.split(',');
        categories = categoryNames
            .map((name) {
              try {
                return ProjectCategory.values.firstWhere((c) => c.name == name);
              } catch (e) {
                return null;
              }
            })
            .where((c) => c != null)
            .cast<ProjectCategory>()
            .toList();
      }

      // Load statuses
      List<ProjectStatus>? statuses;
      if (queryParams.containsKey('statuses')) {
        final statusNames = queryParams['statuses']!.split(',');
        statuses = statusNames
            .map((name) {
              try {
                return ProjectStatus.values.firstWhere((s) => s.name == name);
              } catch (e) {
                return null;
              }
            })
            .where((s) => s != null)
            .cast<ProjectStatus>()
            .toList();
      }

      // Load funding range
      final minFunding = queryParams.containsKey('minFunding')
          ? double.tryParse(queryParams['minFunding']!)
          : null;
      final maxFunding = queryParams.containsKey('maxFunding')
          ? double.tryParse(queryParams['maxFunding']!)
          : null;

      // Load sort
      ProjectSortBy? sortBy;
      if (queryParams.containsKey('sortBy')) {
        try {
          sortBy = ProjectSortBy.values.firstWhere(
            (s) => s.name == queryParams['sortBy'],
          );
        } catch (e) {
          sortBy = null;
        }
      }

      SortOrder? sortOrder;
      if (queryParams.containsKey('sortOrder')) {
        try {
          sortOrder = SortOrder.values.firstWhere(
            (s) => s.name == queryParams['sortOrder'],
          );
        } catch (e) {
          sortOrder = null;
        }
      }

      // Update search criteria
      _searchCriteria = ProjectSearchCriteria(
        query: queryParams['q'],
        categories: categories,
        statuses: statuses,
        minFunding: minFunding,
        maxFunding: maxFunding,
        sortBy: sortBy,
        sortOrder: sortOrder,
      );
    });
  }

  /// Update URL with current filters (Web only - MVP Required)
  void _updateUrl() {
    if (!PlatformDetector.isWeb) return;

    final queryParams = <String, String>{};

    // Add query
    if (_searchCriteria.query != null && _searchCriteria.query!.isNotEmpty) {
      queryParams['q'] = _searchCriteria.query!;
    }

    // Add categories
    if (_searchCriteria.categories != null && _searchCriteria.categories!.isNotEmpty) {
      queryParams['categories'] = _searchCriteria.categories!
          .map((c) => c.name)
          .join(',');
    }

    // Add statuses
    if (_searchCriteria.statuses != null && _searchCriteria.statuses!.isNotEmpty) {
      queryParams['statuses'] = _searchCriteria.statuses!
          .map((s) => s.name)
          .join(',');
    }

    // Add funding range
    if (_searchCriteria.minFunding != null) {
      queryParams['minFunding'] = _searchCriteria.minFunding.toString();
    }
    if (_searchCriteria.maxFunding != null) {
      queryParams['maxFunding'] = _searchCriteria.maxFunding.toString();
    }

    // Add sort
    if (_searchCriteria.sortBy != null) {
      queryParams['sortBy'] = _searchCriteria.sortBy!.name;
    }
    if (_searchCriteria.sortOrder != null) {
      queryParams['sortOrder'] = _searchCriteria.sortOrder!.name;
    }

    // Build new URL
    final uri = Uri(
      path: '/projects',
      queryParameters: queryParams.isEmpty ? null : queryParams,
    );

    // Update browser URL without reloading (using pushState)
    context.go(uri.toString());
  }

  /// Build mobile layout
  Widget _buildMobileLayout(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Browse Projects',
          style: AdaptiveTextStyles.titleLarge(context),
        ),
        actions: [
          IconButton(
            onPressed: _showFilterDialog,
            icon: const Icon(Icons.filter_list),
            tooltip: 'Filter',
          ),
        ],
      ),
      body: Column(
        children: [
          _buildSearchBar(context),
          _buildCategoryFilters(context),
          Expanded(
            child: RefreshIndicator(
              onRefresh: _handleRefresh,
              child: _buildProjectList(context),
            ),
          ),
        ],
      ),
    );
  }

  /// Handle pull-to-refresh
  Future<void> _handleRefresh() async {
    // Invalidate the projects provider to refresh data
    ref.invalidate(availableProjectsProvider);
    // Wait a moment for the provider to refresh
    await Future.delayed(const Duration(milliseconds: 500));
  }

  /// Build tablet layout
  Widget _buildTabletLayout(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Browse Projects',
          style: AdaptiveTextStyles.titleLarge(context),
        ),
        actions: [
          IconButton(
            onPressed: _showFilterDialog,
            icon: const Icon(Icons.filter_list),
            tooltip: 'Filter',
          ),
        ],
      ),
      body: Row(
        children: [
          SizedBox(
            width: 250,
            child: _buildSideFilters(context),
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: Column(
              children: [
                _buildSearchBar(context),
                Expanded(child: _buildProjectGrid(context)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Build desktop layout
  Widget _buildDesktopLayout(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Browse Projects',
          style: AdaptiveTextStyles.titleLarge(context),
        ),
        actions: [
          IconButton(
            onPressed: _showFilterDialog,
            icon: const Icon(Icons.filter_list),
            tooltip: 'Advanced Filters',
          ),
        ],
      ),
      body: Row(
        children: [
          SizedBox(
            width: 300,
            child: _buildSideFilters(context),
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: Column(
              children: [
                _buildSearchBar(context),
                Expanded(child: _buildProjectGrid(context)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Build search bar
  Widget _buildSearchBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Spacing.md),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Search projects...',
          prefixIcon: const Icon(Icons.search),
          suffixIcon: _searchController.text.isNotEmpty
              ? IconButton(
                  onPressed: () {
                    _searchController.clear();
                    _updateSearch();
                  },
                  icon: const Icon(Icons.clear),
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          filled: true,
        ),
        onChanged: (_) => _updateSearch(),
      ),
    );
  }

  /// Build category filter chips
  Widget _buildCategoryFilters(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: Spacing.md),
        children: [
          _buildCategoryChip('All', null),
          ...ProjectCategory.values.map(
            (category) => _buildCategoryChip(category.displayName, category),
          ),
        ],
      ),
    );
  }

  /// Build category filter chip
  Widget _buildCategoryChip(String label, ProjectCategory? category) {
    final isSelected = category == null
        ? (_searchCriteria.categories?.isEmpty ?? true)
        : (_searchCriteria.categories?.contains(category) ?? false);

    return Padding(
      padding: const EdgeInsets.only(right: Spacing.sm),
      child: FilterChip(
        selected: isSelected,
        onSelected: (selected) {
          setState(() {
            if (category == null) {
              _searchCriteria = _searchCriteria.copyWith(categories: []);
            } else if (selected) {
              final categories = _searchCriteria.categories ?? [];
              _searchCriteria = _searchCriteria.copyWith(
                categories: [...categories, category],
              );
            } else {
              final categories = _searchCriteria.categories ?? [];
              _searchCriteria = _searchCriteria.copyWith(
                categories: categories.where((c) => c != category).toList(),
              );
            }
            _resetPagination(); // Reset pagination on filter change
          });
          _updateUrl(); // Update URL for web bookmarking (MVP Required)
        },
        label: Text(label),
      ),
    );
  }

  /// Build side filters panel
  Widget _buildSideFilters(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Spacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Filters',
            style: AdaptiveTextStyles.titleMedium(context),
          ),
          AdaptiveSpacing.verticalMedium(),
          
          // Categories
          _buildFilterSection(
            'Categories',
            ProjectCategory.values.map((c) => c.displayName).toList(),
          ),
          
          AdaptiveSpacing.verticalLarge(),
          
          // Status
          _buildFilterSection(
            'Status',
            ProjectStatus.values.map((s) => s.displayName).toList(),
          ),
          
          AdaptiveSpacing.verticalLarge(),
          
          // Funding Range
          Text(
            'Funding Range',
            style: AdaptiveTextStyles.titleSmall(context),
          ),
          AdaptiveSpacing.verticalSmall(),
          // Add range slider here
          
          const Spacer(),
          
          ElevatedButton(
            onPressed: _clearFilters,
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(40),
            ),
            child: const Text('Clear Filters'),
          ),
        ],
      ),
    );
  }

  /// Build filter section
  Widget _buildFilterSection(String title, List<String> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AdaptiveTextStyles.titleSmall(context),
        ),
        AdaptiveSpacing.verticalSmall(),
        ...options.take(5).map(
          (option) => CheckboxListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            title: Text(option),
            value: false, // Update based on filter state
            onChanged: (value) {
              // Update filter state
            },
          ),
        ),
      ],
    );
  }

  /// Build project list (mobile) with pagination
  Widget _buildProjectList(BuildContext context) {
    ref.watch(availableProjectsProvider);
    final allProjects = ref.read(availableProjectsProvider.notifier)
        .filterProjects(_searchCriteria);

    if (allProjects.isEmpty) {
      return _buildEmptyState(context);
    }

    // Paginate projects (MVP Required)
    final itemsToShow = _currentPage * _itemsPerPage;
    final paginatedProjects = allProjects.take(itemsToShow).toList();
    final hasMoreProjects = allProjects.length > paginatedProjects.length;

    return ListView.builder(
      padding: const EdgeInsets.all(Spacing.md),
      itemCount: paginatedProjects.length + (hasMoreProjects ? 1 : 0),
      itemBuilder: (context, index) {
        // Show "Load More" button at the end
        if (index == paginatedProjects.length) {
          return _buildLoadMoreButton(context);
        }
        return _buildProjectCard(context, paginatedProjects[index]);
      },
    );
  }

  /// Build project grid (tablet/desktop) with pagination
  Widget _buildProjectGrid(BuildContext context) {
    ref.watch(availableProjectsProvider);
    final allProjects = ref.read(availableProjectsProvider.notifier)
        .filterProjects(_searchCriteria);

    if (allProjects.isEmpty) {
      return _buildEmptyState(context);
    }

    // Paginate projects (MVP Required)
    final itemsToShow = _currentPage * _itemsPerPage;
    final paginatedProjects = allProjects.take(itemsToShow).toList();
    final hasMoreProjects = allProjects.length > paginatedProjects.length;

    final crossAxisCount = PlatformDetector.isDesktop ? 3 : 2;

    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(Spacing.md),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: 0.8,
              mainAxisSpacing: Spacing.md,
              crossAxisSpacing: Spacing.md,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) => _buildProjectCard(context, paginatedProjects[index]),
              childCount: paginatedProjects.length,
            ),
          ),
        ),
        // Load More button
        if (hasMoreProjects)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(Spacing.lg),
              child: _buildLoadMoreButton(context),
            ),
          ),
      ],
    );
  }

  /// Build "Load More" button (MVP Required - Pagination)
  Widget _buildLoadMoreButton(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: Spacing.lg),
        child: OutlinedButton.icon(
          onPressed: _loadMoreProjects,
          icon: const Icon(Icons.expand_more),
          label: const Text('Load More Projects'),
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: Spacing.xl,
              vertical: Spacing.md,
            ),
          ),
        ),
      ),
    );
  }

  /// Build individual project card
  Widget _buildProjectCard(BuildContext context, Project project) {
    final fundingPercentage = (project.currentFunding / project.fundingGoal).clamp(0.0, 1.0);

    return AdaptiveCard(
      child: InkWell(
        onTap: () => _navigateToProjectDetail(project.id),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(Spacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Project image placeholder with action buttons
              Stack(
                children: [
                  Container(
                    height: 120,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: _getCategoryColor(project.category).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      _getCategoryIcon(project.category),
                      size: 40,
                      color: _getCategoryColor(project.category),
                    ),
                  ),
                  // Action buttons overlay
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Favorite button
                        Consumer(
                          builder: (context, ref, child) {
                            final favoritesAsync = ref.watch(favoritesNotifierProvider);

                            return favoritesAsync.when(
                              data: (favorites) {
                                final isFavorite = favorites.contains(project.id);
                                return Material(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  elevation: 2,
                                  child: IconButton(
                                    icon: Icon(
                                      isFavorite ? Icons.favorite : Icons.favorite_border,
                                      size: 20,
                                      color: isFavorite ? Colors.red : Colors.grey,
                                    ),
                                    onPressed: () {
                                      ref.read(favoritesNotifierProvider.notifier)
                                          .toggleFavorite(project.id);
                                    },
                                    tooltip: isFavorite ? 'Remove from favorites' : 'Add to favorites',
                                    padding: const EdgeInsets.all(8),
                                    constraints: const BoxConstraints(
                                      minWidth: 36,
                                      minHeight: 36,
                                    ),
                                  ),
                                );
                              },
                              loading: () => const SizedBox(width: 36, height: 36),
                              error: (_, __) => const SizedBox(width: 36, height: 36),
                            );
                          },
                        ),
                        const SizedBox(width: 8),
                        // Share button
                        Material(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          elevation: 2,
                          child: IconButton(
                            icon: const Icon(Icons.share, size: 20),
                            onPressed: () => _shareProject(project),
                            tooltip: 'Share project',
                            padding: const EdgeInsets.all(8),
                            constraints: const BoxConstraints(
                              minWidth: 36,
                              minHeight: 36,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              AdaptiveSpacing.verticalMedium(),

              // Project name
              Text(
                project.name,
                style: AdaptiveTextStyles.titleSmall(context),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              
              AdaptiveSpacing.verticalSmall(),
              
              // Location
              Row(
                children: [
                  const Icon(Icons.location_on, size: 16),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      project.location,
                      style: AdaptiveTextStyles.bodySmall(context),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              
              AdaptiveSpacing.verticalSmall(),
              
              // Funding progress
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${(fundingPercentage * 100).toInt()}% funded',
                        style: AdaptiveTextStyles.bodySmall(context),
                      ),
                      Text(
                        '€${(project.currentFunding / 1000).toStringAsFixed(0)}k / €${(project.fundingGoal / 1000).toStringAsFixed(0)}k',
                        style: AdaptiveTextStyles.bodySmall(context).copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  LinearProgressIndicator(
                    value: fundingPercentage,
                    backgroundColor: Theme.of(context).colorScheme.outline.withOpacity(0.2),
                    valueColor: AlwaysStoppedAnimation<Color>(
                      _getCategoryColor(project.category),
                    ),
                  ),
                ],
              ),
              
              AdaptiveSpacing.verticalSmall(),
              
              // Category chip
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: _getCategoryColor(project.category).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  project.category.displayName,
                  style: AdaptiveTextStyles.bodySmall(context).copyWith(
                    color: _getCategoryColor(project.category),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
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
            'No projects found',
            style: AdaptiveTextStyles.titleMedium(context),
          ),
          const SizedBox(height: Spacing.sm),
          Text(
            'Try adjusting your search criteria',
            style: AdaptiveTextStyles.bodyMedium(context).copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
            ),
          ),
          AdaptiveSpacing.verticalLarge(),
          ElevatedButton(
            onPressed: _clearFilters,
            child: const Text('Clear Filters'),
          ),
        ],
      ),
    );
  }

  /// Get category color
  Color _getCategoryColor(ProjectCategory category) {
    switch (category) {
      case ProjectCategory.healthcare:
        return Colors.red;
      case ProjectCategory.education:
        return Colors.blue;
      case ProjectCategory.environment:
        return Colors.green;
      case ProjectCategory.cleanEnergy:
        return Colors.orange;
      case ProjectCategory.waterSanitation:
        return Colors.cyan;
      case ProjectCategory.financialInclusion:
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }

  /// Get category icon
  IconData _getCategoryIcon(ProjectCategory category) {
    switch (category) {
      case ProjectCategory.healthcare:
        return Icons.local_hospital;
      case ProjectCategory.education:
        return Icons.school;
      case ProjectCategory.environment:
        return Icons.eco;
      case ProjectCategory.cleanEnergy:
        return Icons.wb_sunny;
      case ProjectCategory.waterSanitation:
        return Icons.water_drop;
      case ProjectCategory.financialInclusion:
        return Icons.account_balance;
      default:
        return Icons.business;
    }
  }

  /// Update search criteria
  void _updateSearch() {
    setState(() {
      _searchCriteria = _searchCriteria.copyWith(
        query: _searchController.text.isEmpty ? null : _searchController.text,
      );
      _resetPagination(); // Reset pagination when search changes
    });
    _updateUrl(); // Update URL for web bookmarking (MVP Required)
  }

  /// Clear all filters
  void _clearFilters() {
    setState(() {
      _searchController.clear();
      _searchCriteria = const ProjectSearchCriteria();
      _resetPagination(); // Reset pagination when clearing filters
    });
    _updateUrl(); // Update URL for web bookmarking (MVP Required)
  }

  /// Show filter dialog (Bottom Sheet for Mobile - MVP Required)
  void _showFilterDialog() {
    if (PlatformDetector.isMobile) {
      // Mobile: Show as bottom sheet modal (MVP requirement)
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) => _buildFilterBottomSheet(context),
      );
    } else {
      // Tablet/Desktop: Show as dialog
      showDialog(
        context: context,
        builder: (context) => _buildFilterDialog(context),
      );
    }
  }

  /// Build filter bottom sheet for mobile (MVP Required)
  Widget _buildFilterBottomSheet(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              // Handle bar
              Container(
                margin: const EdgeInsets.only(top: 12, bottom: 8),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),

              // Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    Text(
                      'Filters',
                      style: AdaptiveTextStyles.titleLarge(context),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _searchCriteria = const ProjectSearchCriteria();
                        });
                      },
                      child: const Text('Clear All'),
                    ),
                  ],
                ),
              ),

              const Divider(height: 1),

              // Filter content
              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(16),
                  children: [
                    // Categories Section
                    _buildBottomSheetSection(
                      context,
                      'Categories',
                      ProjectCategory.values.map((category) {
                        final isSelected = _searchCriteria.categories?.contains(category) ?? false;
                        return FilterChip(
                          label: Text(category.displayName),
                          selected: isSelected,
                          onSelected: (selected) {
                            setState(() {
                              final categories = _searchCriteria.categories ?? [];
                              if (selected) {
                                _searchCriteria = _searchCriteria.copyWith(
                                  categories: [...categories, category],
                                );
                              } else {
                                _searchCriteria = _searchCriteria.copyWith(
                                  categories: categories.where((c) => c != category).toList(),
                                );
                              }
                            });
                          },
                        );
                      }).toList(),
                    ),

                    AdaptiveSpacing.verticalLarge(),

                    // Status Section
                    _buildBottomSheetSection(
                      context,
                      'Project Status',
                      ProjectStatus.values.where((status) =>
                        status == ProjectStatus.fundingActive ||
                        status == ProjectStatus.approved ||
                        status == ProjectStatus.implementation
                      ).map((status) {
                        final isSelected = _searchCriteria.statuses?.contains(status) ?? false;
                        return FilterChip(
                          label: Text(status.displayName),
                          selected: isSelected,
                          onSelected: (selected) {
                            setState(() {
                              final statuses = _searchCriteria.statuses ?? [];
                              if (selected) {
                                _searchCriteria = _searchCriteria.copyWith(
                                  statuses: [...statuses, status],
                                );
                              } else {
                                _searchCriteria = _searchCriteria.copyWith(
                                  statuses: statuses.where((s) => s != status).toList(),
                                );
                              }
                            });
                          },
                        );
                      }).toList(),
                    ),

                    AdaptiveSpacing.verticalLarge(),

                    // Funding Range Section
                    Text(
                      'Funding Goal Range',
                      style: AdaptiveTextStyles.titleMedium(context),
                    ),
                    AdaptiveSpacing.verticalSmall(),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: const InputDecoration(
                              labelText: 'Min (€)',
                              border: OutlineInputBorder(),
                              isDense: true,
                            ),
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              final amount = double.tryParse(value);
                              setState(() {
                                _searchCriteria = _searchCriteria.copyWith(
                                  minFunding: amount,
                                );
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: TextField(
                            decoration: const InputDecoration(
                              labelText: 'Max (€)',
                              border: OutlineInputBorder(),
                              isDense: true,
                            ),
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              final amount = double.tryParse(value);
                              setState(() {
                                _searchCriteria = _searchCriteria.copyWith(
                                  maxFunding: amount,
                                );
                              });
                            },
                          ),
                        ),
                      ],
                    ),

                    AdaptiveSpacing.verticalLarge(),

                    // Sort By Section
                    Text(
                      'Sort By',
                      style: AdaptiveTextStyles.titleMedium(context),
                    ),
                    AdaptiveSpacing.verticalSmall(),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        _buildSortChip(context, ProjectSortBy.startDate, 'Date'),
                        _buildSortChip(context, ProjectSortBy.fundingGoal, 'Funding Goal'),
                        _buildSortChip(context, ProjectSortBy.name, 'Name'),
                        _buildSortChip(context, ProjectSortBy.category, 'Category'),
                      ],
                    ),

                    const SizedBox(height: 80), // Space for button
                  ],
                ),
              ),

              // Apply button
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: SafeArea(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      setState(() {
                        _resetPagination(); // Reset pagination when filters applied
                      });
                      _updateUrl(); // Update URL for web bookmarking (MVP Required)
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(48),
                    ),
                    child: const Text('Apply Filters'),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  /// Build filter dialog for tablet/desktop
  Widget _buildFilterDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Advanced Filters'),
      content: SingleChildScrollView(
        child: SizedBox(
          width: 500,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Categories', style: AdaptiveTextStyles.titleMedium(context)),
              AdaptiveSpacing.verticalSmall(),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: ProjectCategory.values.map((category) {
                  final isSelected = _searchCriteria.categories?.contains(category) ?? false;
                  return FilterChip(
                    label: Text(category.displayName),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        final categories = _searchCriteria.categories ?? [];
                        if (selected) {
                          _searchCriteria = _searchCriteria.copyWith(
                            categories: [...categories, category],
                          );
                        } else {
                          _searchCriteria = _searchCriteria.copyWith(
                            categories: categories.where((c) => c != category).toList(),
                          );
                        }
                      });
                    },
                  );
                }).toList(),
              ),
              AdaptiveSpacing.verticalLarge(),
              Text('Project Status', style: AdaptiveTextStyles.titleMedium(context)),
              AdaptiveSpacing.verticalSmall(),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: ProjectStatus.values.where((status) =>
                  status == ProjectStatus.fundingActive ||
                  status == ProjectStatus.approved ||
                  status == ProjectStatus.implementation
                ).map((status) {
                  final isSelected = _searchCriteria.statuses?.contains(status) ?? false;
                  return FilterChip(
                    label: Text(status.displayName),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        final statuses = _searchCriteria.statuses ?? [];
                        if (selected) {
                          _searchCriteria = _searchCriteria.copyWith(
                            statuses: [...statuses, status],
                          );
                        } else {
                          _searchCriteria = _searchCriteria.copyWith(
                            statuses: statuses.where((s) => s != status).toList(),
                          );
                        }
                      });
                    },
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            setState(() {
              _searchCriteria = const ProjectSearchCriteria();
            });
          },
          child: const Text('Clear All'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
            setState(() {
              _resetPagination(); // Reset pagination when filters applied
            });
            _updateUrl(); // Update URL for web bookmarking (MVP Required)
          },
          child: const Text('Apply'),
        ),
      ],
    );
  }

  /// Build bottom sheet section with chips
  Widget _buildBottomSheetSection(
    BuildContext context,
    String title,
    List<Widget> chips,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AdaptiveTextStyles.titleMedium(context)),
        AdaptiveSpacing.verticalSmall(),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: chips,
        ),
      ],
    );
  }

  /// Build sort chip
  Widget _buildSortChip(BuildContext context, ProjectSortBy sortBy, String label) {
    final isSelected = _searchCriteria.sortBy == sortBy;
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        setState(() {
          _searchCriteria = _searchCriteria.copyWith(
            sortBy: selected ? sortBy : null,
            sortOrder: SortOrder.descending,
          );
        });
      },
    );
  }

  /// Navigate to project detail
  void _navigateToProjectDetail(String projectId) {
    context.go('/projects/$projectId');
  }

  /// Share project (MVP Required - Native Sharing)
  Future<void> _shareProject(Project project) async {
    try {
      final projectUrl = 'https://socialimpact.app/projects/${project.id}';
      final shareText = '''
Check out this social impact project: ${project.name}

${project.description}

${project.category.displayName} | ${project.location}

Funding: €${(project.currentFunding / 1000).toStringAsFixed(1)}k / €${(project.fundingGoal / 1000).toStringAsFixed(1)}k

Learn more: $projectUrl
''';

      await Share.share(
        shareText,
        subject: project.name,
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to share project: $e'),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }
}