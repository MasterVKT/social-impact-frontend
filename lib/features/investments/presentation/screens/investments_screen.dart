// lib/features/investments/presentation/screens/investments_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/services/analytics/analytics_service.dart';
import '../widgets/overview/overview_summary_card.dart';
import '../widgets/overview/overview_top_investments.dart';
import '../widgets/overview/overview_allocation_chart.dart';
import '../widgets/portfolio/portfolio_list.dart';
import '../widgets/portfolio/portfolio_breakdown.dart';
import '../widgets/history/history_table.dart';
import '../widgets/performance/performance_kpis.dart';
import '../widgets/receipts/receipts_list.dart';
import '../widgets/preferences/investment_preferences.dart';
import '../../../../shared/widgets/responsive/responsive_layout.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/constants/spacing.dart';

class InvestmentsScreen extends ConsumerStatefulWidget {
  const InvestmentsScreen({super.key});

  @override
  ConsumerState<InvestmentsScreen> createState() => _InvestmentsScreenState();
}

class _InvestmentsScreenState extends ConsumerState<InvestmentsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _logViewInvestmentsPage();
      _logCurrentTab();
    });
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) return;
      _logCurrentTab();
    });
  }

  void _logViewInvestmentsPage() {
    AnalyticsService.instance.logViewInvestmentsPage();
  }

  void _logCurrentTab() {
    final tabs = [
      'overview',
      'portfolio',
      'history',
      'performance',
      'receipts',
      'preferences'
    ];
    if (_tabController.index >= 0 && _tabController.index < tabs.length) {
      AnalyticsService.instance
          .logViewInvestmentsTab(tab: tabs[_tabController.index]);
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: _buildMobile(context),
      tablet: _buildTablet(context),
      desktop: _buildDesktop(context),
    );
  }

  Widget _buildMobile(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Investments', style: AdaptiveTextStyles.titleLarge(context)),
        actions: [
          IconButton(
            onPressed: () => _navigateToSearch(context),
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
            Tab(
                text: 'Portfolio',
                icon: Icon(Icons.account_balance_wallet_outlined)),
            Tab(text: 'History', icon: Icon(Icons.history_outlined)),
            Tab(text: 'Performance', icon: Icon(Icons.show_chart)),
            Tab(text: 'Receipts', icon: Icon(Icons.receipt_long_outlined)),
            Tab(text: 'Preferences', icon: Icon(Icons.tune_outlined)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildOverview(context),
          _buildPortfolio(context),
          _buildHistory(context),
          _buildPerformance(context),
          _buildReceipts(context),
          _buildPreferences(context),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _navigateToBrowse(context),
        icon: const Icon(Icons.add),
        label: const Text('Invest'),
      ),
    );
  }

  Widget _buildTablet(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Investments', style: AdaptiveTextStyles.titleLarge(context)),
        actions: [
          IconButton(
            onPressed: () => _navigateToSearch(context),
            icon: const Icon(Icons.search),
            tooltip: 'Search',
          ),
          IconButton(
            onPressed: () => _handleMenuAction('export'),
            icon: const Icon(Icons.download),
            tooltip: 'Export',
          ),
        ],
      ),
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: _tabController.index,
            onDestinationSelected: (i) =>
                setState(() => _tabController.index = i),
            extended: true,
            destinations: const [
              NavigationRailDestination(
                  icon: Icon(Icons.dashboard_outlined),
                  label: Text('Overview')),
              NavigationRailDestination(
                  icon: Icon(Icons.account_balance_wallet_outlined),
                  label: Text('Portfolio')),
              NavigationRailDestination(
                  icon: Icon(Icons.history_outlined), label: Text('History')),
              NavigationRailDestination(
                  icon: Icon(Icons.show_chart), label: Text('Performance')),
              NavigationRailDestination(
                  icon: Icon(Icons.receipt_long_outlined),
                  label: Text('Receipts')),
              NavigationRailDestination(
                  icon: Icon(Icons.tune_outlined), label: Text('Preferences')),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: IndexedStack(
              index: _tabController.index,
              children: [
                _buildOverview(context),
                _buildPortfolio(context),
                _buildHistory(context),
                _buildPerformance(context),
                _buildReceipts(context),
                _buildPreferences(context),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _navigateToBrowse(context),
        icon: const Icon(Icons.add),
        label: const Text('Invest'),
      ),
    );
  }

  Widget _buildDesktop(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Investments', style: AdaptiveTextStyles.titleLarge(context)),
        actions: [
          TextButton.icon(
            onPressed: () => _navigateToBrowse(context),
            icon: const Icon(Icons.add),
            label: const Text('Invest'),
          ),
          const SizedBox(width: Spacing.sm),
          IconButton(
            onPressed: () => _navigateToSearch(context),
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
        child: _buildOverview(context),
      ),
    );
  }

  Widget _buildOverview(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(Spacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OverviewSummaryCard(),
          SizedBox(height: Spacing.lg),
          OverviewTopInvestments(),
          SizedBox(height: Spacing.lg),
          OverviewAllocationChart(),
        ],
      ),
    );
  }

  Widget _buildPortfolio(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(Spacing.lg),
      child: Column(
        children: [
          PortfolioBreakdown(),
          SizedBox(height: Spacing.lg),
          PortfolioList(),
        ],
      ),
    );
  }

  Widget _buildHistory(BuildContext context) {
    return const HistoryTable();
  }

  Widget _buildPerformance(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(Spacing.lg),
      child: PerformanceKPIs(),
    );
  }

  Widget _buildReceipts(BuildContext context) {
    return const ReceiptsList();
  }

  Widget _buildPreferences(BuildContext context) {
    return const InvestmentPreferences();
  }

  void _handleMenuAction(String action) {
    switch (action) {
      case 'export':
        AnalyticsService.instance
            .logExportContributions(format: 'csv', count: 0);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Portfolio export feature coming soon')),
        );
        break;
      case 'settings':
        context.go('/portfolio/settings');
        break;
      case 'help':
        context.go('/help');
        break;
    }
  }

  void _navigateToSearch(BuildContext context) {
    context.go('/investments/search');
  }

  void _navigateToBrowse(BuildContext context) {
    context.go('/browse');
  }
}
