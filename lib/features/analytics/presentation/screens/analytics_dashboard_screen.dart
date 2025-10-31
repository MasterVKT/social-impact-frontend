import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/widgets/responsive/responsive_layout.dart';
import '../../../../shared/constants/spacing.dart';
import '../widgets/analytics_overview_card.dart';
import '../widgets/performance_metrics_card.dart';
import '../widgets/analytics_charts_card.dart';
import '../widgets/insights_summary_card.dart';
import '../widgets/kpi_dashboard_card.dart';

/// Analytics dashboard screen for comprehensive business insights
class AnalyticsDashboardScreen extends ConsumerStatefulWidget {
  const AnalyticsDashboardScreen({super.key});

  @override
  ConsumerState<AnalyticsDashboardScreen> createState() => _AnalyticsDashboardScreenState();
}

class _AnalyticsDashboardScreenState extends ConsumerState<AnalyticsDashboardScreen> 
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _selectedTimeframe = '30d';
  String _selectedDashboard = 'executive';
  
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
          'Analytics Dashboard',
          style: AdaptiveTextStyles.titleLarge(context),
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: _handleTimeframeChange,
            icon: const Icon(Icons.access_time),
            tooltip: 'Time Period',
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: '7d',
                child: Text('Last 7 days'),
              ),
              const PopupMenuItem(
                value: '30d',
                child: Text('Last 30 days'),
              ),
              const PopupMenuItem(
                value: '90d',
                child: Text('Last 90 days'),
              ),
              const PopupMenuItem(
                value: '1y',
                child: Text('Last year'),
              ),
            ],
          ),
          PopupMenuButton<String>(
            onSelected: _handleMenuAction,
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'export',
                child: ListTile(
                  leading: Icon(Icons.download),
                  title: Text('Export Data'),
                ),
              ),
              const PopupMenuItem(
                value: 'customize',
                child: ListTile(
                  leading: Icon(Icons.tune),
                  title: Text('Customize Dashboard'),
                ),
              ),
              const PopupMenuItem(
                value: 'schedule_report',
                child: ListTile(
                  leading: Icon(Icons.schedule_send),
                  title: Text('Schedule Report'),
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
            Tab(text: 'Performance', icon: Icon(Icons.trending_up_outlined)),
            Tab(text: 'Analytics', icon: Icon(Icons.analytics_outlined)),
            Tab(text: 'Insights', icon: Icon(Icons.lightbulb_outlined)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildOverviewTab(context),
          _buildPerformanceTab(context),
          _buildAnalyticsTab(context),
          _buildInsightsTab(context),
        ],
      ),
    );
  }
  
  /// Build tablet layout with navigation rail
  Widget _buildTabletLayout(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Analytics Dashboard',
          style: AdaptiveTextStyles.titleLarge(context),
        ),
        actions: [
          _buildTimeframeSelector(context),
          const SizedBox(width: Spacing.sm),
          IconButton(
            onPressed: () => _handleMenuAction('export'),
            icon: const Icon(Icons.download),
            tooltip: 'Export',
          ),
          IconButton(
            onPressed: () => _handleMenuAction('customize'),
            icon: const Icon(Icons.tune),
            tooltip: 'Customize',
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
                  label: Text('Performance'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.analytics_outlined),
                  selectedIcon: Icon(Icons.analytics),
                  label: Text('Analytics'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.lightbulb_outlined),
                  selectedIcon: Icon(Icons.lightbulb),
                  label: Text('Insights'),
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
                _buildPerformanceTab(context),
                _buildAnalyticsTab(context),
                _buildInsightsTab(context),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  /// Build desktop layout with comprehensive dashboard
  Widget _buildDesktopLayout(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'Analytics Dashboard',
              style: AdaptiveTextStyles.titleLarge(context),
            ),
            const SizedBox(width: Spacing.md),
            _buildDashboardSelector(context),
          ],
        ),
        actions: [
          _buildTimeframeSelector(context),
          const SizedBox(width: Spacing.md),
          TextButton.icon(
            onPressed: () => _handleMenuAction('export'),
            icon: const Icon(Icons.download, size: 18),
            label: const Text('Export'),
          ),
          const SizedBox(width: Spacing.sm),
          TextButton.icon(
            onPressed: () => _handleMenuAction('customize'),
            icon: const Icon(Icons.tune, size: 18),
            label: const Text('Customize'),
          ),
          const SizedBox(width: Spacing.sm),
          ElevatedButton.icon(
            onPressed: () => _handleMenuAction('schedule_report'),
            icon: const Icon(Icons.schedule_send, size: 18),
            label: const Text('Schedule Report'),
          ),
          const SizedBox(width: Spacing.lg),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top row - Overview and KPI cards
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: AnalyticsOverviewCard(
                    timeframe: _selectedTimeframe,
                    dashboardType: _selectedDashboard,
                  ),
                ),
                const SizedBox(width: Spacing.lg),
                Expanded(
                  child: KPIDashboardCard(
                    timeframe: _selectedTimeframe,
                    showDetailed: false,
                  ),
                ),
              ],
            ),
            
            AdaptiveSpacing.verticalLarge(),
            
            // Second row - Performance and Charts
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: PerformanceMetricsCard(
                    timeframe: _selectedTimeframe,
                    showDetailed: false,
                  ),
                ),
                const SizedBox(width: Spacing.lg),
                Expanded(
                  child: AnalyticsChartsCard(
                    timeframe: _selectedTimeframe,
                    showDetailed: false,
                  ),
                ),
              ],
            ),
            
            AdaptiveSpacing.verticalLarge(),
            
            // Bottom row - Insights and additional analytics
            InsightsSummaryCard(
              timeframe: _selectedTimeframe,
              showDetailed: true,
            ),
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
        children: [
          AnalyticsOverviewCard(
            timeframe: _selectedTimeframe,
            dashboardType: _selectedDashboard,
          ),
          AdaptiveSpacing.verticalLarge(),
          KPIDashboardCard(
            timeframe: _selectedTimeframe,
            showDetailed: true,
          ),
        ],
      ),
    );
  }
  
  /// Build performance tab content
  Widget _buildPerformanceTab(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(Spacing.md),
      child: Column(
        children: [
          PerformanceMetricsCard(
            timeframe: _selectedTimeframe,
            showDetailed: true,
          ),
          AdaptiveSpacing.verticalLarge(),
          AnalyticsChartsCard(
            timeframe: _selectedTimeframe,
            showDetailed: true,
          ),
        ],
      ),
    );
  }
  
  /// Build analytics tab content
  Widget _buildAnalyticsTab(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(Spacing.md),
      child: Column(
        children: [
          AnalyticsChartsCard(
            timeframe: _selectedTimeframe,
            showDetailed: true,
          ),
          AdaptiveSpacing.verticalLarge(),
          _buildCustomQueryBuilder(context),
        ],
      ),
    );
  }
  
  /// Build insights tab content
  Widget _buildInsightsTab(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(Spacing.md),
      child: InsightsSummaryCard(
        timeframe: _selectedTimeframe,
        showDetailed: true,
      ),
    );
  }
  
  /// Build dashboard selector for desktop
  Widget _buildDashboardSelector(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.sm),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.5),
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: DropdownButton<String>(
        value: _selectedDashboard,
        onChanged: (value) {
          if (value != null) {
            setState(() {
              _selectedDashboard = value;
            });
          }
        },
        underline: const SizedBox(),
        items: const [
          DropdownMenuItem(
            value: 'executive',
            child: Text('Executive Dashboard'),
          ),
          DropdownMenuItem(
            value: 'investor',
            child: Text('Investor Dashboard'),
          ),
          DropdownMenuItem(
            value: 'project',
            child: Text('Project Dashboard'),
          ),
          DropdownMenuItem(
            value: 'compliance',
            child: Text('Compliance Dashboard'),
          ),
          DropdownMenuItem(
            value: 'custom',
            child: Text('Custom Dashboard'),
          ),
        ],
      ),
    );
  }
  
  /// Build timeframe selector
  Widget _buildTimeframeSelector(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.sm),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.5),
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: DropdownButton<String>(
        value: _selectedTimeframe,
        onChanged: _handleTimeframeChange,
        underline: const SizedBox(),
        items: const [
          DropdownMenuItem(
            value: '7d',
            child: Text('Last 7 days'),
          ),
          DropdownMenuItem(
            value: '30d',
            child: Text('Last 30 days'),
          ),
          DropdownMenuItem(
            value: '90d',
            child: Text('Last 90 days'),
          ),
          DropdownMenuItem(
            value: '1y',
            child: Text('Last year'),
          ),
        ],
      ),
    );
  }
  
  /// Build custom query builder
  Widget _buildCustomQueryBuilder(BuildContext context) {
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.query_builder,
                  color: Theme.of(context).colorScheme.primary,
                  size: 24,
                ),
                const SizedBox(width: Spacing.sm),
                Text(
                  'Custom Query Builder',
                  style: AdaptiveTextStyles.titleMedium(context),
                ),
                const Spacer(),
                ElevatedButton.icon(
                  onPressed: () => _openQueryBuilder(),
                  icon: const Icon(Icons.add, size: 18),
                  label: const Text('Build Query'),
                ),
              ],
            ),
            AdaptiveSpacing.verticalLarge(),
            
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest.withOpacity(0.3),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.query_stats,
                      size: 48,
                      color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.5),
                    ),
                    AdaptiveSpacing.verticalMedium(),
                    Text(
                      'Create Custom Analytics Queries',
                      style: AdaptiveTextStyles.titleMedium(context),
                    ),
                    const SizedBox(height: Spacing.sm),
                    Text(
                      'Build custom queries to analyze your data and create personalized insights',
                      style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  /// Handle timeframe change
  void _handleTimeframeChange(String? timeframe) {
    if (timeframe != null) {
      setState(() {
        _selectedTimeframe = timeframe;
      });
    }
  }
  
  /// Handle menu actions
  void _handleMenuAction(String action) {
    switch (action) {
      case 'export':
        _exportData();
        break;
      case 'customize':
        _customizeDashboard();
        break;
      case 'schedule_report':
        _scheduleReport();
        break;
    }
  }
  
  /// Export dashboard data
  void _exportData() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Export Dashboard Data'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Select the format for exporting your dashboard data:'),
            const SizedBox(height: Spacing.md),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pop();
                      _performExport('pdf');
                    },
                    icon: const Icon(Icons.picture_as_pdf),
                    label: const Text('PDF Report'),
                  ),
                ),
                const SizedBox(width: Spacing.sm),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pop();
                      _performExport('excel');
                    },
                    icon: const Icon(Icons.table_chart),
                    label: const Text('Excel Data'),
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
  
  /// Perform data export
  void _performExport(String format) {
    // Implement export functionality
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Exporting dashboard as $format...'),
        action: SnackBarAction(
          label: 'View',
          onPressed: () {
            // Open exported file
          },
        ),
      ),
    );
  }
  
  /// Customize dashboard
  void _customizeDashboard() {
    context.go('/analytics/customize');
  }
  
  /// Schedule report
  void _scheduleReport() {
    context.go('/analytics/schedule');
  }
  
  /// Open query builder
  void _openQueryBuilder() {
    context.go('/analytics/query-builder');
  }
}