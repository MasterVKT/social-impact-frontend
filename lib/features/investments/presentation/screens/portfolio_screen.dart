import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/widgets/responsive/responsive_layout.dart';
import '../../../../shared/constants/spacing.dart';
import '../../../../core/utils/platform_detector.dart';
import '../widgets/portfolio_summary_card.dart';
import '../widgets/portfolio_allocation_chart.dart';
import '../widgets/investment_list_card.dart';
import '../widgets/performance_chart_card.dart';

/// Portfolio screen for investors to view their investments
class PortfolioScreen extends ConsumerStatefulWidget {
  const PortfolioScreen({super.key});

  @override
  ConsumerState<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends ConsumerState<PortfolioScreen>
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
          'My Portfolio',
          style: AdaptiveTextStyles.titleLarge(context),
        ),
        actions: [
          IconButton(
            onPressed: () => _navigateToInvestmentSearch(context),
            icon: const Icon(Icons.search),
            tooltip: 'Search Investments',
          ),
          PopupMenuButton<String>(
            onSelected: _handleMenuAction,
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'export',
                child: ListTile(
                  leading: Icon(Icons.download),
                  title: Text('Export Portfolio'),
                ),
              ),
              const PopupMenuItem(
                value: 'settings',
                child: ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Portfolio Settings'),
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
            Tab(text: 'Investments', icon: Icon(Icons.trending_up)),
            Tab(text: 'Performance', icon: Icon(Icons.analytics_outlined)),
            Tab(text: 'Activity', icon: Icon(Icons.history)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildOverviewTab(context),
          _buildInvestmentsTab(context),
          _buildPerformanceTab(context),
          _buildActivityTab(context),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _navigateToBrowseProjects(context),
        icon: const Icon(Icons.add),
        label: const Text('Invest'),
      ),
    );
  }

  /// Build tablet layout with side navigation
  Widget _buildTabletLayout(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Portfolio',
          style: AdaptiveTextStyles.titleLarge(context),
        ),
        actions: [
          IconButton(
            onPressed: () => _navigateToInvestmentSearch(context),
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () => _handleMenuAction('export'),
            icon: const Icon(Icons.download),
            tooltip: 'Export Portfolio',
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
                  icon: Icon(Icons.trending_up_outlined),
                  selectedIcon: Icon(Icons.trending_up),
                  label: Text('Investments'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.analytics_outlined),
                  selectedIcon: Icon(Icons.analytics),
                  label: Text('Performance'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.history_outlined),
                  selectedIcon: Icon(Icons.history),
                  label: Text('Activity'),
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
                _buildInvestmentsTab(context),
                _buildPerformanceTab(context),
                _buildActivityTab(context),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _navigateToBrowseProjects(context),
        icon: const Icon(Icons.add),
        label: const Text('Invest'),
      ),
    );
  }

  /// Build desktop layout with grid
  Widget _buildDesktopLayout(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Portfolio Dashboard',
          style: AdaptiveTextStyles.titleLarge(context),
        ),
        actions: [
          TextButton.icon(
            onPressed: () => _navigateToBrowseProjects(context),
            icon: const Icon(Icons.add),
            label: const Text('Invest'),
          ),
          const SizedBox(width: Spacing.sm),
          IconButton(
            onPressed: () => _navigateToInvestmentSearch(context),
            icon: const Icon(Icons.search),
            tooltip: 'Search',
          ),
          IconButton(
            onPressed: () => _handleMenuAction('export'),
            icon: const Icon(Icons.download),
            tooltip: 'Export',
          ),
          const SizedBox(width: Spacing.sm),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top row - Summary and quick actions
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: PortfolioSummaryCard(),
                ),
                SizedBox(width: Spacing.lg),
                Expanded(
                  child: PortfolioAllocationChart(),
                ),
              ],
            ),
            AdaptiveSpacing.verticalLarge(),

            // Second row - Performance and recent investments
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: PerformanceChartCard(),
                ),
                SizedBox(width: Spacing.lg),
                Expanded(
                  child: InvestmentListCard(
                    title: 'Recent Investments',
                    showAll: false,
                    maxItems: 5,
                  ),
                ),
              ],
            ),
            AdaptiveSpacing.verticalLarge(),

            // Full width investment list
            const InvestmentListCard(
              title: 'All Investments',
              showAll: true,
            ),
          ],
        ),
      ),
    );
  }

  /// Build overview tab content
  Widget _buildOverviewTab(BuildContext context) {
    return SingleChildScrollView(
      padding:
          const EdgeInsets.fromLTRB(Spacing.md, Spacing.md, Spacing.md, 200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PortfolioSummaryCard(),
          AdaptiveSpacing.verticalLarge(),
          if (PlatformDetector.isMobile)
            Column(
              children: [
                const PortfolioAllocationChart(),
                AdaptiveSpacing.verticalLarge(),
                const PerformanceChartCard(),
              ],
            )
          else
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: PortfolioAllocationChart()),
                SizedBox(width: Spacing.lg),
                Expanded(child: PerformanceChartCard()),
              ],
            ),
          AdaptiveSpacing.verticalLarge(),
          const InvestmentListCard(
            title: 'Recent Investments',
            showAll: false,
            maxItems: 3,
          ),
        ],
      ),
    );
  }

  /// Build investments tab content
  Widget _buildInvestmentsTab(BuildContext context) {
    return Column(
      children: [
        // Filter and search bar
        Container(
          padding:
              const EdgeInsets.fromLTRB(Spacing.md, Spacing.md, Spacing.md, 0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search investments...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    filled: true,
                  ),
                  onChanged: _handleSearchQuery,
                ),
              ),
              const SizedBox(width: Spacing.sm),
              IconButton(
                onPressed: _showFilterDialog,
                icon: const Icon(Icons.filter_list),
                tooltip: 'Filter',
              ),
              IconButton(
                onPressed: _showSortDialog,
                icon: const Icon(Icons.sort),
                tooltip: 'Sort',
              ),
            ],
          ),
        ),

        // Investment list
        const Expanded(
          child: Padding(
            padding: EdgeInsets.only(bottom: 200),
            child: InvestmentListCard(
              title: 'All Investments',
              showAll: true,
              showFilters: true,
            ),
          ),
        ),
      ],
    );
  }

  /// Build performance tab content
  Widget _buildPerformanceTab(BuildContext context) {
    return SingleChildScrollView(
      padding:
          const EdgeInsets.fromLTRB(Spacing.md, Spacing.md, Spacing.md, 200),
      child: Column(
        children: [
          // Performance summary cards
          _buildPerformanceMetrics(context),
          AdaptiveSpacing.verticalLarge(),

          // Performance charts
          const PerformanceChartCard(showDetailed: true),
          AdaptiveSpacing.verticalLarge(),

          // Performance comparison
          _buildPerformanceComparison(context),
        ],
      ),
    );
  }

  /// Build activity tab content
  Widget _buildActivityTab(BuildContext context) {
    return SingleChildScrollView(
      padding:
          const EdgeInsets.fromLTRB(Spacing.md, Spacing.md, Spacing.md, 200),
      child: Column(
        children: [
          _buildActivityFilters(context),
          AdaptiveSpacing.verticalMedium(),
          _buildActivityList(context),
        ],
      ),
    );
  }

  /// Build performance metrics cards
  Widget _buildPerformanceMetrics(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: PlatformDetector.isMobile ? 2 : 4,
      // Ratio encore plus large pour éliminer complètement l'overflow
      childAspectRatio: PlatformDetector.isMobile ? 1.6 : 1.8,
      mainAxisSpacing: Spacing.sm,
      crossAxisSpacing: Spacing.sm,
      children: [
        _buildMetricCard(
          context,
          'Total Return',
          '+€12,450',
          '+8.5%',
          Icons.trending_up,
          Colors.green,
        ),
        _buildMetricCard(
          context,
          'Annual Return',
          '12.3%',
          '+2.1%',
          Icons.percent,
          Colors.blue,
        ),
        _buildMetricCard(
          context,
          'Best Investment',
          '+€3,200',
          '+25.6%',
          Icons.star,
          Colors.orange,
        ),
        _buildMetricCard(
          context,
          'Portfolio IRR',
          '15.2%',
          '+1.8%',
          Icons.analytics,
          Colors.purple,
        ),
      ],
    );
  }

  /// Build individual metric card
  Widget _buildMetricCard(
    BuildContext context,
    String title,
    String value,
    String change,
    IconData icon,
    Color color,
  ) {
    return AdaptiveCard(
      child: Container(
        constraints: const BoxConstraints(minHeight: 100),
        padding: const EdgeInsets.all(Spacing.sm),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Icon(icon, color: color, size: 14),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      title,
                      style: AdaptiveTextStyles.bodySmall(context).copyWith(
                        fontSize: 9,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  value,
                  style: AdaptiveTextStyles.titleSmall(context).copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 4),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  change,
                  style: AdaptiveTextStyles.bodySmall(context).copyWith(
                    color: change.startsWith('+') ? Colors.green : Colors.red,
                    fontSize: 9,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Build performance comparison section
  Widget _buildPerformanceComparison(BuildContext context) {
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Performance Comparison',
              style: AdaptiveTextStyles.titleMedium(context),
            ),
            AdaptiveSpacing.verticalMedium(),
            // Mock comparison data
            _buildComparisonRow('My Portfolio', '12.3%', '+2.1%', true),
            _buildComparisonRow('Market Average', '8.7%', '+0.5%', false),
            _buildComparisonRow('Top Performer', '18.9%', '+3.2%', false),
          ],
        ),
      ),
    );
  }

  /// Build comparison row
  Widget _buildComparisonRow(
      String name, String return_, String change, bool isUser) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: Spacing.sm),
      decoration: BoxDecoration(
        color: isUser
            ? Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3)
            : null,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          if (isUser) const Icon(Icons.person, size: 16),
          if (isUser) const SizedBox(width: Spacing.sm),
          Expanded(child: Text(name)),
          Text(return_, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(width: Spacing.md),
          Text(
            change,
            style: TextStyle(
              color: change.startsWith('+') ? Colors.green : Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  /// Build activity filters
  Widget _buildActivityFilters(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SegmentedButton<String>(
            segments: const [
              ButtonSegment(value: 'all', label: Text('All')),
              ButtonSegment(value: 'investments', label: Text('Investments')),
              ButtonSegment(value: 'returns', label: Text('Returns')),
              ButtonSegment(value: 'dividends', label: Text('Dividends')),
            ],
            selected: const {'all'},
            onSelectionChanged: (selection) {
              // Handle filter change
            },
          ),
        ),
      ],
    );
  }

  /// Build activity list
  Widget _buildActivityList(BuildContext context) {
    // Mock activity data
    final activities = [
      {
        'type': 'investment',
        'title': 'Invested in Clean Water Project',
        'amount': '€5,000',
        'date': '2 days ago'
      },
      {
        'type': 'dividend',
        'title': 'Dividend from Solar Farm Project',
        'amount': '+€250',
        'date': '1 week ago'
      },
      {
        'type': 'return',
        'title': 'Partial return from Microfinance',
        'amount': '+€1,200',
        'date': '2 weeks ago'
      },
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: activities.length,
      itemBuilder: (context, index) {
        final activity = activities[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundColor:
                _getActivityColor(activity['type']!).withOpacity(0.1),
            child: Icon(
              _getActivityIcon(activity['type']!),
              color: _getActivityColor(activity['type']!),
            ),
          ),
          title: Text(activity['title']!),
          subtitle: Text(activity['date']!),
          trailing: Text(
            activity['amount']!,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: activity['amount']!.startsWith('+')
                  ? Colors.green
                  : Colors.black,
            ),
          ),
        );
      },
    );
  }

  /// Get activity icon
  IconData _getActivityIcon(String type) {
    switch (type) {
      case 'investment':
        return Icons.trending_up;
      case 'dividend':
        return Icons.payments;
      case 'return':
        return Icons.keyboard_return;
      default:
        return Icons.circle;
    }
  }

  /// Get activity color
  Color _getActivityColor(String type) {
    switch (type) {
      case 'investment':
        return Colors.blue;
      case 'dividend':
        return Colors.green;
      case 'return':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  /// Handle menu actions
  void _handleMenuAction(String action) {
    switch (action) {
      case 'export':
        _exportPortfolio();
        break;
      case 'settings':
        _navigateToPortfolioSettings();
        break;
      case 'help':
        _navigateToHelp();
        break;
    }
  }

  /// Handle search query
  void _handleSearchQuery(String query) {
    // Implement search functionality
  }

  /// Show filter dialog
  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Filter Investments'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Filter options would go here
            Text('Filter options coming soon...'),
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

  /// Show sort dialog
  void _showSortDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sort Investments'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Sort options would go here
            Text('Sort options coming soon...'),
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

  /// Export portfolio
  void _exportPortfolio() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Portfolio export feature coming soon')),
    );
  }

  /// Navigate to investment search
  void _navigateToInvestmentSearch(BuildContext context) {
    context.go('/investments/search');
  }

  /// Navigate to browse projects
  void _navigateToBrowseProjects(BuildContext context) {
    context.go('/browse');
  }

  /// Navigate to portfolio settings
  void _navigateToPortfolioSettings() {
    context.go('/portfolio/settings');
  }

  /// Navigate to help
  void _navigateToHelp() {
    context.go('/help');
  }
}
