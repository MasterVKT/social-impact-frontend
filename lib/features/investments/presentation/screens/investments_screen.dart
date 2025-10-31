// lib/features/investments/presentation/screens/investments_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/overview/overview_summary_card.dart';
import '../widgets/overview/overview_top_investments.dart';
import '../widgets/overview/overview_allocation_chart.dart';
import '../../../../shared/widgets/responsive/responsive_layout.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/constants/spacing.dart';

class InvestmentsScreen extends ConsumerStatefulWidget {
  const InvestmentsScreen({super.key});

  @override
  ConsumerState<InvestmentsScreen> createState() => _InvestmentsScreenState();
}

class _InvestmentsScreenState extends ConsumerState<InvestmentsScreen> with SingleTickerProviderStateMixin {
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

  void _logViewInvestmentsPage() {}

  void _logCurrentTab() {}

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
        title: Text('Investments', style: AdaptiveTextStyles.titleLarge(context)),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: const [
            Tab(text: 'Overview', icon: Icon(Icons.dashboard_outlined)),
            Tab(text: 'Portfolio', icon: Icon(Icons.account_balance_wallet_outlined)),
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
          _placeholder(context, 'Portfolio'),
          _placeholder(context, 'History'),
          _placeholder(context, 'Performance'),
          _placeholder(context, 'Receipts & Documents'),
          _placeholder(context, 'Preferences'),
        ],
      ),
    );
  }

  Widget _buildTablet(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Investments', style: AdaptiveTextStyles.titleLarge(context))),
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: _tabController.index,
            onDestinationSelected: (i) => setState(() => _tabController.index = i),
            extended: true,
            destinations: const [
              NavigationRailDestination(icon: Icon(Icons.dashboard_outlined), label: Text('Overview')),
              NavigationRailDestination(icon: Icon(Icons.account_balance_wallet_outlined), label: Text('Portfolio')),
              NavigationRailDestination(icon: Icon(Icons.history_outlined), label: Text('History')),
              NavigationRailDestination(icon: Icon(Icons.show_chart), label: Text('Performance')),
              NavigationRailDestination(icon: Icon(Icons.receipt_long_outlined), label: Text('Receipts')),
              NavigationRailDestination(icon: Icon(Icons.tune_outlined), label: Text('Preferences')),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: IndexedStack(
              index: _tabController.index,
              children: [
                _buildOverview(context),
                _placeholder(context, 'Portfolio'),
                _placeholder(context, 'History'),
                _placeholder(context, 'Performance'),
                _placeholder(context, 'Receipts & Documents'),
                _placeholder(context, 'Preferences'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktop(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Investments', style: AdaptiveTextStyles.titleLarge(context))),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Spacing.lg),
        child: _buildOverview(context),
      ),
    );
  }

  Widget _buildOverview(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(Spacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          OverviewSummaryCard(),
          SizedBox(height: Spacing.lg),
          OverviewTopInvestments(),
          SizedBox(height: Spacing.lg),
          OverviewAllocationChart(),
        ],
      ),
    );
  }

  Widget _placeholder(BuildContext context, String title) {
    return Center(
      child: Text(title, style: AdaptiveTextStyles.titleMedium(context)),
    );
  }
}
