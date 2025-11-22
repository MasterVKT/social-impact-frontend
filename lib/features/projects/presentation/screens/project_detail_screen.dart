import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';
import '../../../../shared/widgets/adaptive/adaptive_button.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_loading_indicator.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/widgets/responsive/responsive_layout.dart';
import '../../../../shared/constants/spacing.dart';
import '../../../../core/utils/platform_detector.dart';
import '../../../../core/themes/color_scheme.dart';
import '../../domain/entities/project.dart';
import '../providers/projects_providers.dart';
import '../widgets/project_overview_tab.dart';
import '../widgets/project_milestones_tab.dart';
import '../widgets/project_impact_tab.dart';
import '../widgets/project_contributors_tab.dart';
import '../widgets/project_header.dart';
import '../widgets/project_funding_card.dart';

/// Project detail screen showing comprehensive project information
/// Includes tabs for: Overview, Milestones, Impact, Contributors
class ProjectDetailScreen extends ConsumerStatefulWidget {
  final String projectId;

  const ProjectDetailScreen({
    super.key,
    required this.projectId,
  });

  @override
  ConsumerState<ProjectDetailScreen> createState() =>
      _ProjectDetailScreenState();
}

class _ProjectDetailScreenState extends ConsumerState<ProjectDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _currentTabIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final projectAsync = ref.watch(projectProvider(widget.projectId));

    return Scaffold(
      appBar: _buildAppBar(context, projectAsync.value),
      body: projectAsync.when(
        data: (project) {
          if (project == null) {
            return _buildProjectNotFound(context);
          }
          return ResponsiveLayout(
            mobile: _buildMobileLayout(context, project),
            tablet: _buildTabletLayout(context, project),
            desktop: _buildDesktopLayout(context, project),
          );
        },
        loading: () => const Center(
          child: AdaptiveLoadingIndicator(),
        ),
        error: (error, stack) => _buildErrorState(context, error),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context, Project? project) {
    return AppBar(
      title: Text(project?.name ?? 'Project Details'),
      actions: [
        if (project != null) ...[
          // Share button
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () => _shareProject(project),
            tooltip: 'Share Project',
          ),
          // Favorite button
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () => _toggleFavorite(project),
            tooltip: 'Add to Favorites',
          ),
          // More options
          PopupMenuButton<String>(
            onSelected: (value) => _handleMenuAction(context, value, project),
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'edit',
                child: Text('Edit Project'),
              ),
              const PopupMenuItem(
                value: 'report',
                child: Text('Report Project'),
              ),
              if (project.status == ProjectStatus.draft)
                const PopupMenuItem(
                  value: 'delete',
                  child: Text('Delete Project'),
                ),
            ],
          ),
        ],
      ],
    );
  }

  // ========== MOBILE LAYOUT ==========

  Widget _buildMobileLayout(BuildContext context, Project project) {
    return CustomScrollView(
      slivers: [
        // Project header with cover image
        SliverToBoxAdapter(
          child: ProjectHeader(project: project),
        ),

        // Funding card (sticky on mobile)
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: ProjectFundingCard(project: project),
          ),
        ),

        // Tabs
        SliverPersistentHeader(
          pinned: true,
          delegate: _SliverTabBarDelegate(
            TabBar(
              controller: _tabController,
              isScrollable: true,
              tabs: const [
                Tab(text: 'Overview'),
                Tab(text: 'Milestones'),
                Tab(text: 'Impact'),
                Tab(text: 'Contributors'),
              ],
            ),
          ),
        ),

        // Tab content
        SliverFillRemaining(
          child: TabBarView(
            controller: _tabController,
            children: [
              ProjectOverviewTab(project: project),
              ProjectMilestonesTab(project: project),
              ProjectImpactTab(project: project),
              ProjectContributorsTab(project: project),
            ],
          ),
        ),
      ],
    );
  }

  // ========== TABLET LAYOUT ==========

  Widget _buildTabletLayout(BuildContext context, Project project) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Main content (2/3 width)
        Expanded(
          flex: 2,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: ProjectHeader(project: project),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverTabBarDelegate(
                  TabBar(
                    controller: _tabController,
                    tabs: const [
                      Tab(text: 'Overview'),
                      Tab(text: 'Milestones'),
                      Tab(text: 'Impact'),
                      Tab(text: 'Contributors'),
                    ],
                  ),
                ),
              ),
              SliverFillRemaining(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    ProjectOverviewTab(project: project),
                    ProjectMilestonesTab(project: project),
                    ProjectImpactTab(project: project),
                    ProjectContributorsTab(project: project),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Sidebar (1/3 width)
        SizedBox(
          width: 350,
          child: _buildSidebar(context, project),
        ),
      ],
    );
  }

  // ========== DESKTOP LAYOUT ==========

  Widget _buildDesktopLayout(BuildContext context, Project project) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Main content (60% width)
        Expanded(
          flex: 6,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: ProjectHeader(project: project),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverTabBarDelegate(
                  TabBar(
                    controller: _tabController,
                    tabs: const [
                      Tab(text: 'Overview'),
                      Tab(text: 'Milestones'),
                      Tab(text: 'Impact'),
                      Tab(text: 'Contributors'),
                    ],
                  ),
                ),
              ),
              SliverFillRemaining(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    ProjectOverviewTab(project: project),
                    ProjectMilestonesTab(project: project),
                    ProjectImpactTab(project: project),
                    ProjectContributorsTab(project: project),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Sidebar (40% width)
        Expanded(
          flex: 4,
          child: _buildSidebar(context, project),
        ),
      ],
    );
  }

  // ========== SIDEBAR ==========

  Widget _buildSidebar(BuildContext context, Project project) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border(
          left: BorderSide(
            color: Theme.of(context).dividerColor,
            width: 1,
          ),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Funding card
            ProjectFundingCard(project: project),
            const AdaptiveSpacing.vertical(size: SpacingSize.large),

            // Project stats
            _buildProjectStats(context, project),
            const AdaptiveSpacing.vertical(size: SpacingSize.large),

            // Creator info
            _buildCreatorInfo(context, project),
            const AdaptiveSpacing.vertical(size: SpacingSize.large),

            // Category & Location
            _buildProjectMeta(context, project),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectStats(BuildContext context, Project project) {
    return AdaptiveCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Project Statistics',
            style: AdaptiveTextStyles.titleMedium(context),
          ),
          const AdaptiveSpacing.vertical(size: SpacingSize.medium),
          _buildStatRow(
            context,
            'Contributors',
            '0', // TODO: Get from contributors module
            Icons.people,
          ),
          _buildStatRow(
            context,
            'Completed Milestones',
            '${project.milestones.where((m) => m.status == MilestoneStatus.completed).length}/${project.milestones.length}',
            Icons.check_circle,
          ),
          _buildStatRow(
            context,
            'Days Remaining',
            project.daysRemaining != null
                ? '${project.daysRemaining} days'
                : 'N/A',
            Icons.calendar_today,
          ),
        ],
      ),
    );
  }

  Widget _buildStatRow(
    BuildContext context,
    String label,
    String value,
    IconData icon,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Theme.of(context).colorScheme.primary),
          const AdaptiveSpacing.horizontal(size: SpacingSize.small),
          Expanded(
            child: Text(
              label,
              style: AdaptiveTextStyles.bodyMedium(context),
            ),
          ),
          Text(
            value,
            style: AdaptiveTextStyles.bodyMedium(context).copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCreatorInfo(BuildContext context, Project project) {
    return AdaptiveCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Project Creator',
            style: AdaptiveTextStyles.titleMedium(context),
          ),
          const AdaptiveSpacing.vertical(size: SpacingSize.medium),
          // TODO: Fetch creator user data
          const ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.business),
            ),
            title: Text('Organization Name'),
            subtitle: Text('View Profile'),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectMeta(BuildContext context, Project project) {
    return AdaptiveCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildMetaRow(
            context,
            'Category',
            project.category.displayName,
            Icons.category,
          ),
          const Divider(),
          _buildMetaRow(
            context,
            'Location',
            project.location,
            Icons.location_on,
          ),
          const Divider(),
          _buildMetaRow(
            context,
            'Status',
            project.status.displayName,
            Icons.info,
          ),
        ],
      ),
    );
  }

  Widget _buildMetaRow(
    BuildContext context,
    String label,
    String value,
    IconData icon,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
      child: Row(
        children: [
          Icon(icon, size: 20),
          const AdaptiveSpacing.horizontal(size: SpacingSize.small),
          Text(
            '$label: ',
            style: AdaptiveTextStyles.bodySmall(context),
          ),
          Expanded(
            child: Text(
              value,
              style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ========== ERROR STATES ==========

  Widget _buildProjectNotFound(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_off,
            size: 64,
            color: Theme.of(context).colorScheme.outline,
          ),
          const AdaptiveSpacing.vertical(size: SpacingSize.medium),
          Text(
            'Project Not Found',
            style: AdaptiveTextStyles.titleLarge(context),
          ),
          const AdaptiveSpacing.vertical(size: SpacingSize.small),
          Text(
            'The project you are looking for does not exist.',
            style: AdaptiveTextStyles.bodyMedium(context),
            textAlign: TextAlign.center,
          ),
          const AdaptiveSpacing.vertical(size: SpacingSize.large),
          AdaptiveButton(
            onPressed: () => context.go('/'),
            label: 'Go to Home',
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, Object error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64,
            color: Theme.of(context).colorScheme.error,
          ),
          const AdaptiveSpacing.vertical(size: SpacingSize.medium),
          Text(
            'Error Loading Project',
            style: AdaptiveTextStyles.titleLarge(context),
          ),
          const AdaptiveSpacing.vertical(size: SpacingSize.small),
          Text(
            error.toString(),
            style: AdaptiveTextStyles.bodyMedium(context),
            textAlign: TextAlign.center,
          ),
          const AdaptiveSpacing.vertical(size: SpacingSize.large),
          AdaptiveButton(
            onPressed: () {
              ref.invalidate(projectProvider(widget.projectId));
            },
            label: 'Retry',
          ),
        ],
      ),
    );
  }

  // ========== ACTIONS ==========

  void _shareProject(Project project) {
    final url = 'https://socialimpact.com/projects/${project.id}';
    Share.share(
      'Check out this social impact project: ${project.name}\n\n$url',
      subject: project.name,
    );
  }

  void _toggleFavorite(Project project) {
    // TODO: Implement favorites functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Favorites feature coming soon!')),
    );
  }

  void _handleMenuAction(BuildContext context, String action, Project project) {
    switch (action) {
      case 'edit':
        context.push('/projects/${project.id}/edit');
        break;
      case 'report':
        _showReportDialog(context, project);
        break;
      case 'delete':
        _showDeleteConfirmation(context, project);
        break;
    }
  }

  void _showReportDialog(BuildContext context, Project project) {
    // TODO: Implement report functionality
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Report Project'),
        content: const Text('Report functionality coming soon.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context, Project project) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Project'),
        content: const Text(
          'Are you sure you want to delete this project? This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.error,
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed == true && mounted) {
      final notifier = ref.read(projectUpdateNotifierProvider.notifier);
      final result = await notifier.deleteProject(project.id);

      if (mounted) {
        if (result.isSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Project deleted successfully')),
          );
          context.go('/');
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(result.error ?? 'Failed to delete project')),
          );
        }
      }
    }
  }
}

// ========== SLIVER TAB BAR DELEGATE ==========

class _SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _SliverTabBarDelegate(this.tabBar);

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverTabBarDelegate oldDelegate) {
    return false;
  }
}
