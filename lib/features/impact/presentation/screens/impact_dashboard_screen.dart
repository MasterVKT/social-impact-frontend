import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/widgets/responsive/responsive_layout.dart';
import '../../../../shared/constants/spacing.dart';
import '../../../../core/utils/platform_detector.dart';
import '../widgets/impact_overview_card.dart';
import '../widgets/sdg_alignment_card.dart';
import '../widgets/impact_metrics_chart.dart';
import '../widgets/beneficiaries_tracker_card.dart';
import '../widgets/impact_reports_card.dart';

/// Impact measurement dashboard for tracking social and environmental outcomes
class ImpactDashboardScreen extends ConsumerStatefulWidget {
  const ImpactDashboardScreen({super.key});

  @override
  ConsumerState<ImpactDashboardScreen> createState() => _ImpactDashboardScreenState();
}

class _ImpactDashboardScreenState extends ConsumerState<ImpactDashboardScreen> 
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _selectedTimeframe = '12M';
  
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
          'Impact Dashboard',
          style: AdaptiveTextStyles.titleLarge(context),
        ),
        actions: [
          PopupMenuButton<String>(
            initialValue: _selectedTimeframe,
            onSelected: (value) {
              setState(() {
                _selectedTimeframe = value;
              });
            },
            itemBuilder: (context) => [
              const PopupMenuItem(value: '1M', child: Text('Last Month')),
              const PopupMenuItem(value: '3M', child: Text('Last 3 Months')),
              const PopupMenuItem(value: '6M', child: Text('Last 6 Months')),
              const PopupMenuItem(value: '12M', child: Text('Last Year')),
              const PopupMenuItem(value: 'ALL', child: Text('All Time')),
            ],
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: Spacing.sm, vertical: Spacing.xs),
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).colorScheme.outline),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _selectedTimeframe,
                    style: AdaptiveTextStyles.bodySmall(context),
                  ),
                  const SizedBox(width: 4),
                  const Icon(Icons.arrow_drop_down, size: 16),
                ],
              ),
            ),
          ),
          const SizedBox(width: Spacing.sm),
          PopupMenuButton<String>(
            onSelected: _handleMenuAction,
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'export',
                child: ListTile(
                  leading: Icon(Icons.download),
                  title: Text('Export Report'),
                ),
              ),
              const PopupMenuItem(
                value: 'configure',
                child: ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Configure Dashboard'),
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
            Tab(text: 'SDG Goals', icon: Icon(Icons.public_outlined)),
            Tab(text: 'Metrics', icon: Icon(Icons.analytics_outlined)),
            Tab(text: 'Reports', icon: Icon(Icons.description_outlined)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildOverviewTab(context),
          _buildSDGTab(context),
          _buildMetricsTab(context),
          _buildReportsTab(context),
        ],
      ),
    );
  }
  
  /// Build tablet layout with navigation rail
  Widget _buildTabletLayout(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Impact Dashboard',
          style: AdaptiveTextStyles.titleLarge(context),
        ),
        actions: [
          _buildTimeframeSelector(context),
          const SizedBox(width: Spacing.sm),
          IconButton(
            onPressed: () => _handleMenuAction('export'),
            icon: const Icon(Icons.download),
            tooltip: 'Export Report',
          ),
          IconButton(
            onPressed: () => _handleMenuAction('configure'),
            icon: const Icon(Icons.settings),
            tooltip: 'Configure',
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
                  icon: Icon(Icons.public_outlined),
                  selectedIcon: Icon(Icons.public),
                  label: Text('SDG Goals'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.analytics_outlined),
                  selectedIcon: Icon(Icons.analytics),
                  label: Text('Metrics'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.description_outlined),
                  selectedIcon: Icon(Icons.description),
                  label: Text('Reports'),
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
                _buildSDGTab(context),
                _buildMetricsTab(context),
                _buildReportsTab(context),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  /// Build desktop layout with comprehensive grid
  Widget _buildDesktopLayout(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Impact Measurement Dashboard',
          style: AdaptiveTextStyles.titleLarge(context),
        ),
        actions: [
          _buildTimeframeSelector(context),
          const SizedBox(width: Spacing.md),
          TextButton.icon(
            onPressed: () => _handleMenuAction('export'),
            icon: const Icon(Icons.download),
            label: const Text('Export Report'),
          ),
          IconButton(
            onPressed: () => _handleMenuAction('configure'),
            icon: const Icon(Icons.settings),
            tooltip: 'Configure Dashboard',
          ),
          const SizedBox(width: Spacing.sm),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top row - Impact overview and SDG alignment
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: ImpactOverviewCard(timeframe: _selectedTimeframe),
                ),
                const SizedBox(width: Spacing.lg),
                Expanded(
                  child: SDGAlignmentCard(timeframe: _selectedTimeframe),
                ),
              ],
            ),
            AdaptiveSpacing.verticalLarge(),
            
            // Second row - Metrics chart and beneficiaries tracker
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: ImpactMetricsChart(timeframe: _selectedTimeframe),
                ),
                const SizedBox(width: Spacing.lg),
                Expanded(
                  child: BeneficiariesTrackerCard(timeframe: _selectedTimeframe),
                ),
              ],
            ),
            AdaptiveSpacing.verticalLarge(),
            
            // Full width impact reports
            ImpactReportsCard(timeframe: _selectedTimeframe),
          ],
        ),
      ),
    );
  }
  
  /// Build timeframe selector widget
  Widget _buildTimeframeSelector(BuildContext context) {
    return SegmentedButton<String>(
      segments: const [
        ButtonSegment(value: '1M', label: Text('1M')),
        ButtonSegment(value: '3M', label: Text('3M')),
        ButtonSegment(value: '6M', label: Text('6M')),
        ButtonSegment(value: '12M', label: Text('1Y')),
        ButtonSegment(value: 'ALL', label: Text('All')),
      ],
      selected: {_selectedTimeframe},
      onSelectionChanged: (selection) {
        setState(() {
          _selectedTimeframe = selection.first;
        });
      },
    );
  }
  
  /// Build overview tab content
  Widget _buildOverviewTab(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(Spacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImpactOverviewCard(timeframe: _selectedTimeframe),
          AdaptiveSpacing.verticalLarge(),
          
          if (PlatformDetector.isMobile)
            Column(
              children: [
                BeneficiariesTrackerCard(timeframe: _selectedTimeframe),
                AdaptiveSpacing.verticalLarge(),
                _buildKeyMetricsCard(context),
              ],
            )
          else
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: BeneficiariesTrackerCard(timeframe: _selectedTimeframe)),
                const SizedBox(width: Spacing.lg),
                Expanded(child: _buildKeyMetricsCard(context)),
              ],
            ),
        ],
      ),
    );
  }
  
  /// Build SDG tab content
  Widget _buildSDGTab(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(Spacing.md),
      child: Column(
        children: [
          SDGAlignmentCard(timeframe: _selectedTimeframe, showDetailed: true),
          AdaptiveSpacing.verticalLarge(),
          _buildSDGProgressCard(context),
        ],
      ),
    );
  }
  
  /// Build metrics tab content
  Widget _buildMetricsTab(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(Spacing.md),
      child: Column(
        children: [
          ImpactMetricsChart(timeframe: _selectedTimeframe, showDetailed: true),
          AdaptiveSpacing.verticalLarge(),
          _buildMetricsTableCard(context),
        ],
      ),
    );
  }
  
  /// Build reports tab content
  Widget _buildReportsTab(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(Spacing.md),
      child: Column(
        children: [
          ImpactReportsCard(timeframe: _selectedTimeframe, showDetailed: true),
          AdaptiveSpacing.verticalLarge(),
          _buildReportTemplatesCard(context),
        ],
      ),
    );
  }
  
  /// Build key metrics card
  Widget _buildKeyMetricsCard(BuildContext context) {
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Key Impact Metrics',
              style: AdaptiveTextStyles.titleMedium(context),
            ),
            AdaptiveSpacing.verticalMedium(),
            
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: PlatformDetector.isMobile ? 2 : 2,
              childAspectRatio: 1.5,
              mainAxisSpacing: Spacing.md,
              crossAxisSpacing: Spacing.md,
              children: [
                _buildMetricItem(context, 'Lives Impacted', '12,547', '+15%', Colors.blue),
                _buildMetricItem(context, 'CO₂ Reduced', '2,340t', '+23%', Colors.green),
                _buildMetricItem(context, 'Jobs Created', '1,250', '+8%', Colors.orange),
                _buildMetricItem(context, 'Communities', '45', '+12%', Colors.purple),
              ],
            ),
          ],
        ),
      ),
    );
  }
  
  /// Build metric item
  Widget _buildMetricItem(BuildContext context, String title, String value, String change, Color color) {
    return Container(
      padding: const EdgeInsets.all(Spacing.md),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: AdaptiveTextStyles.titleLarge(context).copyWith(
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          AdaptiveSpacing.verticalSmall(),
          Text(
            title,
            style: AdaptiveTextStyles.bodyMedium(context),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          AdaptiveSpacing.verticalSmall(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              change,
              style: AdaptiveTextStyles.bodySmall(context).copyWith(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  /// Build SDG progress card
  Widget _buildSDGProgressCard(BuildContext context) {
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'SDG Progress Tracking',
              style: AdaptiveTextStyles.titleMedium(context),
            ),
            AdaptiveSpacing.verticalMedium(),
            const Text('Detailed SDG progress tracking and alignment analysis coming soon...'),
          ],
        ),
      ),
    );
  }
  
  /// Build metrics table card
  Widget _buildMetricsTableCard(BuildContext context) {
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Detailed Metrics Table',
              style: AdaptiveTextStyles.titleMedium(context),
            ),
            AdaptiveSpacing.verticalMedium(),
            const Text('Comprehensive metrics table with filtering and export capabilities coming soon...'),
          ],
        ),
      ),
    );
  }
  
  /// Build report templates card
  Widget _buildReportTemplatesCard(BuildContext context) {
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Report Templates',
              style: AdaptiveTextStyles.titleMedium(context),
            ),
            AdaptiveSpacing.verticalMedium(),
            const Text('Customizable report templates for different stakeholders coming soon...'),
          ],
        ),
      ),
    );
  }
  
  /// Handle menu actions
  void _handleMenuAction(String action) {
    switch (action) {
      case 'export':
        _exportReport();
        break;
      case 'configure':
        _navigateToDashboardConfig();
        break;
    }
  }
  
  /// Export impact report
  void _exportReport() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Export Impact Report'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Select export format:'),
            AdaptiveSpacing.verticalMedium(),
            ListTile(
              leading: const Icon(Icons.picture_as_pdf),
              title: const Text('PDF Report'),
              onTap: () {
                Navigator.pop(context);
                _exportToPDF();
              },
            ),
            ListTile(
              leading: const Icon(Icons.table_chart),
              title: const Text('Excel Spreadsheet'),
              onTap: () {
                Navigator.pop(context);
                _exportToExcel();
              },
            ),
            ListTile(
              leading: const Icon(Icons.code),
              title: const Text('JSON Data'),
              onTap: () {
                Navigator.pop(context);
                _exportToJSON();
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }
  
  /// Export to PDF
  void _exportToPDF() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('PDF export feature coming soon')),
    );
  }
  
  /// Export to Excel
  void _exportToExcel() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Excel export feature coming soon')),
    );
  }
  
  /// Export to JSON
  void _exportToJSON() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('JSON export feature coming soon')),
    );
  }
  
  /// Navigate to dashboard configuration
  void _navigateToDashboardConfig() {
    context.go('/impact/dashboard/config');
  }
}