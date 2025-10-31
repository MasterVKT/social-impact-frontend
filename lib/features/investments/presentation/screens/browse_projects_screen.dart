import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/widgets/responsive/responsive_layout.dart';
import '../../../../shared/constants/spacing.dart';
import '../../../../core/utils/platform_detector.dart';
import '../../domain/entities/project.dart';
import '../providers/investment_providers.dart';

/// Browse projects screen for discovering investment opportunities
class BrowseProjectsScreen extends ConsumerStatefulWidget {
  const BrowseProjectsScreen({super.key});

  @override
  ConsumerState<BrowseProjectsScreen> createState() => _BrowseProjectsScreenState();
}

class _BrowseProjectsScreenState extends ConsumerState<BrowseProjectsScreen> {
  final TextEditingController _searchController = TextEditingController();
  ProjectSearchCriteria _searchCriteria = const ProjectSearchCriteria();

  @override
  void dispose() {
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
          Expanded(child: _buildProjectList(context)),
        ],
      ),
    );
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
          });
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

  /// Build project list (mobile)
  Widget _buildProjectList(BuildContext context) {
    final projects = ref.watch(availableProjectsProvider);
    final filteredProjects = ref.read(availableProjectsProvider.notifier)
        .filterProjects(_searchCriteria);

    if (filteredProjects.isEmpty) {
      return _buildEmptyState(context);
    }

    return ListView.builder(
      padding: const EdgeInsets.all(Spacing.md),
      itemCount: filteredProjects.length,
      itemBuilder: (context, index) {
        return _buildProjectCard(context, filteredProjects[index]);
      },
    );
  }

  /// Build project grid (tablet/desktop)
  Widget _buildProjectGrid(BuildContext context) {
    final projects = ref.watch(availableProjectsProvider);
    final filteredProjects = ref.read(availableProjectsProvider.notifier)
        .filterProjects(_searchCriteria);

    if (filteredProjects.isEmpty) {
      return _buildEmptyState(context);
    }

    return GridView.builder(
      padding: const EdgeInsets.all(Spacing.md),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: PlatformDetector.isDesktop ? 3 : 2,
        childAspectRatio: 0.8,
        mainAxisSpacing: Spacing.md,
        crossAxisSpacing: Spacing.md,
      ),
      itemCount: filteredProjects.length,
      itemBuilder: (context, index) {
        return _buildProjectCard(context, filteredProjects[index]);
      },
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
              // Project image placeholder
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
    });
  }

  /// Clear all filters
  void _clearFilters() {
    setState(() {
      _searchController.clear();
      _searchCriteria = const ProjectSearchCriteria();
    });
  }

  /// Show filter dialog
  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Advanced Filters'),
        content: const SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Advanced filtering options coming soon...'),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Apply'),
          ),
        ],
      ),
    );
  }

  /// Navigate to project detail
  void _navigateToProjectDetail(String projectId) {
    context.go('/projects/$projectId');
  }
}