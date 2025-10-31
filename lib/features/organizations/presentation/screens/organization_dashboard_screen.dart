import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/widgets/responsive/responsive_layout.dart';
import '../../../../shared/constants/spacing.dart';
import '../../../../core/utils/platform_detector.dart';
import '../widgets/organization_summary_card.dart';
import '../widgets/project_management_card.dart';
import '../widgets/funding_overview_card.dart';
import '../widgets/impact_metrics_card.dart';

/// Organization dashboard screen for managing projects and tracking impact
class OrganizationDashboardScreen extends ConsumerStatefulWidget {
  const OrganizationDashboardScreen({super.key});

  @override
  ConsumerState<OrganizationDashboardScreen> createState() =>
      _OrganizationDashboardScreenState();
}

class _OrganizationDashboardScreenState
    extends ConsumerState<OrganizationDashboardScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
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

  /// Build mobile layout with tabs
  Widget _buildMobileLayout(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Organization Dashboard',
          style: AdaptiveTextStyles.titleLarge(context),
        ),
        actions: [
          IconButton(
            onPressed: () => _navigateToNotifications(),
            icon: const Icon(Icons.notifications_outlined),
            tooltip: 'Notifications',
          ),
          PopupMenuButton<String>(
            onSelected: _handleMenuAction,
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'settings',
                child: ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Organization Settings'),
                ),
              ),
              const PopupMenuItem(
                value: 'reports',
                child: ListTile(
                  leading: Icon(Icons.assessment),
                  title: Text('Generate Reports'),
                ),
              ),
              const PopupMenuItem(
                value: 'help',
                child: ListTile(
                  leading: Icon(Icons.help_outline),
                  title: Text('Help & Support'),
                ),
              ),
            ],
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: const [
            Tab(text: 'Overview', icon: Icon(Icons.dashboard_outlined)),
            Tab(text: 'Projects', icon: Icon(Icons.folder_outlined)),
            Tab(text: 'Funding', icon: Icon(Icons.attach_money_outlined)),
            Tab(text: 'Impact', icon: Icon(Icons.eco_outlined)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildOverviewTab(context),
          _buildProjectsTab(context),
          _buildFundingTab(context),
          _buildImpactTab(context),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _navigateToCreateProject(),
        icon: const Icon(Icons.add),
        label: const Text('Project'),
      ),
    );
  }

  /// Build tablet layout with navigation rail
  Widget _buildTabletLayout(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Organization Dashboard',
          style: AdaptiveTextStyles.titleLarge(context),
        ),
        actions: [
          IconButton(
            onPressed: () => _navigateToNotifications(),
            icon: const Icon(Icons.notifications_outlined),
          ),
          IconButton(
            onPressed: () => _handleMenuAction('reports'),
            icon: const Icon(Icons.assessment),
            tooltip: 'Reports',
          ),
        ],
      ),
      body: Row(
        children: [
          SizedBox(
            width: 200,
            child: NavigationRail(
              selectedIndex: _tabController.index,
              onDestinationSelected: (index) {
                setState(() {
                  _tabController.index = index;
                });
              },
              extended: true,
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.dashboard_outlined),
                  selectedIcon: Icon(Icons.dashboard),
                  label: Text('Overview'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.folder_outlined),
                  selectedIcon: Icon(Icons.folder),
                  label: Text('Projects'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.attach_money_outlined),
                  selectedIcon: Icon(Icons.attach_money),
                  label: Text('Funding'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.eco_outlined),
                  selectedIcon: Icon(Icons.eco),
                  label: Text('Impact'),
                ),
              ],
            ),
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: IndexedStack(
              index: _tabController.index,
              children: [
                _buildOverviewTab(context),
                _buildProjectsTab(context),
                _buildFundingTab(context),
                _buildImpactTab(context),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _navigateToCreateProject(),
        icon: const Icon(Icons.add),
        label: const Text('Project'),
      ),
    );
  }

  /// Build desktop layout with grid
  Widget _buildDesktopLayout(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Organization Dashboard',
          style: AdaptiveTextStyles.titleLarge(context),
        ),
        actions: [
          TextButton.icon(
            onPressed: () => _navigateToCreateProject(),
            icon: const Icon(Icons.add),
            label: const Text('Project'),
          ),
          const SizedBox(width: Spacing.sm),
          IconButton(
            onPressed: () => _navigateToNotifications(),
            icon: const Icon(Icons.notifications_outlined),
            tooltip: 'Notifications',
          ),
          IconButton(
            onPressed: () => _handleMenuAction('reports'),
            icon: const Icon(Icons.assessment),
            tooltip: 'Reports',
          ),
          const SizedBox(width: Spacing.sm),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top row - Organization summary and quick actions
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: OrganizationSummaryCard(),
                ),
                SizedBox(width: Spacing.lg),
                Expanded(
                  child: FundingOverviewCard(),
                ),
              ],
            ),
            AdaptiveSpacing.verticalLarge(),

            // Second row - Projects and impact metrics
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ProjectManagementCard(),
                ),
                SizedBox(width: Spacing.lg),
                Expanded(
                  child: ImpactMetricsCard(),
                ),
              ],
            ),
            AdaptiveSpacing.verticalLarge(),

            // Recent activity and notifications
            _buildRecentActivityCard(context),
          ],
        ),
      ),
    );
  }

  /// Build overview tab content
  Widget _buildOverviewTab(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(Spacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const OrganizationSummaryCard(),
          AdaptiveSpacing.verticalLarge(),
          if (PlatformDetector.isMobile)
            Column(
              children: [
                const FundingOverviewCard(),
                AdaptiveSpacing.verticalLarge(),
                const ImpactMetricsCard(),
              ],
            )
          else
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: FundingOverviewCard()),
                SizedBox(width: Spacing.lg),
                Expanded(child: ImpactMetricsCard()),
              ],
            ),
          AdaptiveSpacing.verticalLarge(),
          _buildRecentActivityCard(context),
        ],
      ),
    );
  }

  /// Build projects tab content
  Widget _buildProjectsTab(BuildContext context) {
    return Column(
      children: [
        // Project filters and search
        Container(
          padding: const EdgeInsets.all(Spacing.md),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search projects...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    filled: true,
                  ),
                  onChanged: _handleProjectSearch,
                ),
              ),
              const SizedBox(width: Spacing.sm),
              IconButton(
                onPressed: _showProjectFilterDialog,
                icon: const Icon(Icons.filter_list),
                tooltip: 'Filter',
              ),
              IconButton(
                onPressed: _showProjectSortDialog,
                icon: const Icon(Icons.sort),
                tooltip: 'Sort',
              ),
            ],
          ),
        ),

        // Project list/grid
        const Expanded(
          child: ProjectManagementCard(showAll: true),
        ),
      ],
    );
  }

  /// Build funding tab content
  Widget _buildFundingTab(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(Spacing.md),
      child: Column(
        children: [
          const FundingOverviewCard(showDetailed: true),
          AdaptiveSpacing.verticalLarge(),
          _buildFundingHistoryCard(context),
          AdaptiveSpacing.verticalLarge(),
          _buildFundingAnalyticsCard(context),
        ],
      ),
    );
  }

  /// Build impact tab content
  Widget _buildImpactTab(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(Spacing.md),
      child: Column(
        children: [
          const ImpactMetricsCard(showDetailed: true),
          AdaptiveSpacing.verticalLarge(),
          _buildImpactReportsCard(context),
          AdaptiveSpacing.verticalLarge(),
          _buildSustainabilityGoalsCard(context),
        ],
      ),
    );
  }

  /// Build recent activity card
  Widget _buildRecentActivityCard(BuildContext context) {
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.history,
                  color: Theme.of(context).colorScheme.primary,
                  size: 24,
                ),
                const SizedBox(width: Spacing.sm),
                Text(
                  'Recent Activity',
                  style: AdaptiveTextStyles.titleMedium(context),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () => _navigateToAllActivity(),
                  child: const Text('View All'),
                ),
              ],
            ),
            AdaptiveSpacing.verticalMedium(),

            // Mock recent activities
            ..._getMockActivities()
                .map((activity) => _buildActivityItem(context, activity)),
          ],
        ),
      ),
    );
  }

  /// Build individual activity item
  Widget _buildActivityItem(
      BuildContext context, Map<String, dynamic> activity) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Spacing.sm),
      child: Row(
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor:
                _getActivityColor(activity['type']).withOpacity(0.1),
            child: Icon(
              _getActivityIcon(activity['type']),
              size: 16,
              color: _getActivityColor(activity['type']),
            ),
          ),
          const SizedBox(width: Spacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  activity['title'],
                  style: AdaptiveTextStyles.bodyMedium(context),
                ),
                Text(
                  activity['time'],
                  style: AdaptiveTextStyles.bodySmall(context).copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),
          if (activity['amount'] != null)
            Text(
              activity['amount'],
              style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                fontWeight: FontWeight.bold,
                color: activity['amount'].toString().startsWith('+')
                    ? Colors.green
                    : null,
              ),
            ),
        ],
      ),
    );
  }

  /// Build funding history card
  Widget _buildFundingHistoryCard(BuildContext context) {
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Funding History',
              style: AdaptiveTextStyles.titleMedium(context),
            ),
            AdaptiveSpacing.verticalMedium(),
            const Text('Detailed funding history coming soon...'),
          ],
        ),
      ),
    );
  }

  /// Build funding analytics card
  Widget _buildFundingAnalyticsCard(BuildContext context) {
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Funding Analytics',
              style: AdaptiveTextStyles.titleMedium(context),
            ),
            AdaptiveSpacing.verticalMedium(),
            const Text('Funding analytics and insights coming soon...'),
          ],
        ),
      ),
    );
  }

  /// Build impact reports card
  Widget _buildImpactReportsCard(BuildContext context) {
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Impact Reports',
              style: AdaptiveTextStyles.titleMedium(context),
            ),
            AdaptiveSpacing.verticalMedium(),
            const Text('Impact reports and documentation coming soon...'),
          ],
        ),
      ),
    );
  }

  /// Build sustainability goals card
  Widget _buildSustainabilityGoalsCard(BuildContext context) {
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'UN Sustainability Goals',
              style: AdaptiveTextStyles.titleMedium(context),
            ),
            AdaptiveSpacing.verticalMedium(),
            const Text('SDG alignment and tracking coming soon...'),
          ],
        ),
      ),
    );
  }

  /// Get mock activity data
  List<Map<String, dynamic>> _getMockActivities() {
    return [
      {
        'type': 'funding',
        'title': 'New funding received for Clean Water Project',
        'time': '2 hours ago',
        'amount': '+€5,000',
      },
      {
        'type': 'milestone',
        'title': 'Solar Panel Installation milestone completed',
        'time': '1 day ago',
        'amount': null,
      },
      {
        'type': 'project',
        'title': 'New project submitted for review',
        'time': '2 days ago',
        'amount': null,
      },
      {
        'type': 'impact',
        'title': 'Impact metrics updated for Healthcare Initiative',
        'time': '3 days ago',
        'amount': null,
      },
    ];
  }

  /// Get activity icon
  IconData _getActivityIcon(String type) {
    switch (type) {
      case 'funding':
        return Icons.attach_money;
      case 'milestone':
        return Icons.flag;
      case 'project':
        return Icons.folder;
      case 'impact':
        return Icons.eco;
      default:
        return Icons.circle;
    }
  }

  /// Get activity color
  Color _getActivityColor(String type) {
    switch (type) {
      case 'funding':
        return Colors.green;
      case 'milestone':
        return Colors.blue;
      case 'project':
        return Colors.orange;
      case 'impact':
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }

  /// Handle menu actions
  void _handleMenuAction(String action) {
    switch (action) {
      case 'settings':
        _navigateToOrganizationSettings();
        break;
      case 'reports':
        _generateReports();
        break;
      case 'help':
        _navigateToHelp();
        break;
    }
  }

  /// Handle project search
  void _handleProjectSearch(String query) {
    // Implement project search functionality
  }

  /// Show project filter dialog
  void _showProjectFilterDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Filter Projects'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Project filtering options coming soon...'),
          ],
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

  /// Show project sort dialog
  void _showProjectSortDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sort Projects'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Project sorting options coming soon...'),
          ],
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

  /// Generate reports
  void _generateReports() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Report generation feature coming soon')),
    );
  }

  /// Navigate to notifications
  void _navigateToNotifications() {
    context.go('/notifications');
  }

  /// Navigate to create project
  void _navigateToCreateProject() {
    context.go('/projects/create');
  }

  /// Navigate to all activity
  void _navigateToAllActivity() {
    context.go('/activity');
  }

  /// Navigate to organization settings
  void _navigateToOrganizationSettings() {
    context.go('/organization/settings');
  }

  /// Navigate to help
  void _navigateToHelp() {
    context.go('/help');
  }
}
