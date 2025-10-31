import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/widgets/responsive/responsive_layout.dart';
import '../../../../shared/constants/spacing.dart';
import '../../../../core/utils/platform_detector.dart';
import '../widgets/transaction_list_card.dart';
import '../widgets/wallet_balance_card.dart';
import '../widgets/transaction_filters_card.dart';
import '../widgets/payment_methods_card.dart';

/// Transactions screen for viewing and managing financial transactions
class TransactionsScreen extends ConsumerStatefulWidget {
  const TransactionsScreen({super.key});

  @override
  ConsumerState<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends ConsumerState<TransactionsScreen>
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
          'Transactions',
          style: AdaptiveTextStyles.titleLarge(context),
        ),
        actions: [
          IconButton(
            onPressed: () => _navigateToSearch(),
            icon: const Icon(Icons.search),
            tooltip: 'Search Transactions',
          ),
          PopupMenuButton<String>(
            onSelected: _handleMenuAction,
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'export',
                child: ListTile(
                  leading: Icon(Icons.download),
                  title: Text('Export Transactions'),
                ),
              ),
              const PopupMenuItem(
                value: 'statements',
                child: ListTile(
                  leading: Icon(Icons.receipt),
                  title: Text('Monthly Statements'),
                ),
              ),
              const PopupMenuItem(
                value: 'settings',
                child: ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Payment Settings'),
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
            Tab(text: 'All Transactions', icon: Icon(Icons.list_outlined)),
            Tab(text: 'Payment Methods', icon: Icon(Icons.payment_outlined)),
            Tab(text: 'Reports', icon: Icon(Icons.analytics_outlined)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildOverviewTab(context),
          _buildTransactionsTab(context),
          _buildPaymentMethodsTab(context),
          _buildReportsTab(context),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showQuickActions(context),
        icon: const Icon(Icons.add),
        label: const Text('Transaction'),
      ),
    );
  }

  /// Build tablet layout with navigation rail
  Widget _buildTabletLayout(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Transactions',
          style: AdaptiveTextStyles.titleLarge(context),
        ),
        actions: [
          IconButton(
            onPressed: () => _navigateToSearch(),
            icon: const Icon(Icons.search),
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
                  icon: Icon(Icons.list_outlined),
                  selectedIcon: Icon(Icons.list),
                  label: Text('Transactions'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.payment_outlined),
                  selectedIcon: Icon(Icons.payment),
                  label: Text('Payment Methods'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.analytics_outlined),
                  selectedIcon: Icon(Icons.analytics),
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
                _buildTransactionsTab(context),
                _buildPaymentMethodsTab(context),
                _buildReportsTab(context),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showQuickActions(context),
        icon: const Icon(Icons.add),
        label: const Text('Transaction'),
      ),
    );
  }

  /// Build desktop layout with grid
  Widget _buildDesktopLayout(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Transactions Dashboard',
          style: AdaptiveTextStyles.titleLarge(context),
        ),
        actions: [
          TextButton.icon(
            onPressed: () => _showQuickActions(context),
            icon: const Icon(Icons.add),
            label: const Text('Transaction'),
          ),
          const SizedBox(width: Spacing.sm),
          IconButton(
            onPressed: () => _navigateToSearch(),
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
            // Top row - Wallet balance and quick stats
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  flex: 2,
                  child: WalletBalanceCard(),
                ),
                const SizedBox(width: Spacing.lg),
                Expanded(
                  child: _buildQuickStatsCard(context),
                ),
              ],
            ),
            AdaptiveSpacing.verticalLarge(),

            // Second row - Recent transactions and payment methods
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: TransactionListCard(
                    title: 'Recent Transactions',
                    showAll: false,
                    maxItems: 8,
                  ),
                ),
                SizedBox(width: Spacing.lg),
                Expanded(
                  child: PaymentMethodsCard(),
                ),
              ],
            ),
            AdaptiveSpacing.verticalLarge(),

            // Full width transaction filters and complete list
            const TransactionFiltersCard(),
            AdaptiveSpacing.verticalLarge(),
            const TransactionListCard(
              title: 'All Transactions',
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
      padding: const EdgeInsets.all(Spacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const WalletBalanceCard(),
          AdaptiveSpacing.verticalLarge(),
          _buildQuickStatsCard(context),
          AdaptiveSpacing.verticalLarge(),
          const TransactionListCard(
            title: 'Recent Transactions',
            showAll: false,
            maxItems: 5,
          ),
          AdaptiveSpacing.verticalLarge(),
          _buildQuickActionsCard(context),
        ],
      ),
    );
  }

  /// Build transactions tab content
  Widget _buildTransactionsTab(BuildContext context) {
    return const Column(
      children: [
        TransactionFiltersCard(),
        Expanded(
          child: TransactionListCard(
            title: 'All Transactions',
            showAll: true,
            showFilters: true,
          ),
        ),
      ],
    );
  }

  /// Build payment methods tab content
  Widget _buildPaymentMethodsTab(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(Spacing.md),
      child: Column(
        children: [
          const PaymentMethodsCard(showDetailed: true),
          AdaptiveSpacing.verticalLarge(),
          _buildPaymentHistoryCard(context),
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
          _buildTransactionSummaryCard(context),
          AdaptiveSpacing.verticalLarge(),
          _buildMonthlyReportsCard(context),
          AdaptiveSpacing.verticalLarge(),
          _buildTaxDocumentsCard(context),
        ],
      ),
    );
  }

  /// Build quick stats card
  Widget _buildQuickStatsCard(BuildContext context) {
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Quick Stats',
              style: AdaptiveTextStyles.titleMedium(context),
            ),
            AdaptiveSpacing.verticalMedium(),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: PlatformDetector.isMobile ? 2 : 2,
              childAspectRatio: 2,
              mainAxisSpacing: Spacing.sm,
              crossAxisSpacing: Spacing.sm,
              children: [
                _buildStatItem(context, 'This Month', '€12,450', Colors.green,
                    Icons.trending_up),
                _buildStatItem(context, 'Total Invested', '€156,750',
                    Colors.blue, Icons.account_balance_wallet),
                _buildStatItem(context, 'Dividends Earned', '€8,340',
                    Colors.orange, Icons.payments),
                _buildStatItem(context, 'Pending', '€2,100', Colors.grey,
                    Icons.hourglass_empty),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Build stat item
  Widget _buildStatItem(BuildContext context, String title, String value,
      Color color, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(Spacing.sm),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 20),
          AdaptiveSpacing.verticalSmall(),
          Text(
            value,
            style: AdaptiveTextStyles.titleSmall(context).copyWith(
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            title,
            style: AdaptiveTextStyles.bodySmall(context),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  /// Build quick actions card
  Widget _buildQuickActionsCard(BuildContext context) {
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Quick Actions',
              style: AdaptiveTextStyles.titleMedium(context),
            ),
            AdaptiveSpacing.verticalMedium(),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: PlatformDetector.isMobile ? 2 : 4,
              childAspectRatio: 1.2,
              mainAxisSpacing: Spacing.sm,
              crossAxisSpacing: Spacing.sm,
              children: [
                _buildActionButton(context, 'Add Funds', Icons.add,
                    () => _navigateToAddFunds()),
                _buildActionButton(context, 'Withdraw', Icons.account_balance,
                    () => _navigateToWithdraw()),
                _buildActionButton(context, 'Invest', Icons.trending_up,
                    () => _navigateToInvest()),
                _buildActionButton(context, 'Transfer', Icons.swap_horiz,
                    () => _navigateToTransfer()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Build action button
  Widget _buildActionButton(BuildContext context, String title, IconData icon,
      VoidCallback onPressed) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 24),
          AdaptiveSpacing.verticalSmall(),
          Text(
            title,
            style: AdaptiveTextStyles.bodySmall(context),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  /// Build payment history card
  Widget _buildPaymentHistoryCard(BuildContext context) {
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Payment Method History',
              style: AdaptiveTextStyles.titleMedium(context),
            ),
            AdaptiveSpacing.verticalMedium(),
            const Text(
                'Payment method usage history and analytics coming soon...'),
          ],
        ),
      ),
    );
  }

  /// Build transaction summary card
  Widget _buildTransactionSummaryCard(BuildContext context) {
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Transaction Summary',
              style: AdaptiveTextStyles.titleMedium(context),
            ),
            AdaptiveSpacing.verticalMedium(),
            const Text(
                'Detailed transaction summaries and analytics coming soon...'),
          ],
        ),
      ),
    );
  }

  /// Build monthly reports card
  Widget _buildMonthlyReportsCard(BuildContext context) {
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Monthly Reports',
              style: AdaptiveTextStyles.titleMedium(context),
            ),
            AdaptiveSpacing.verticalMedium(),
            const Text(
                'Monthly transaction reports and statements coming soon...'),
          ],
        ),
      ),
    );
  }

  /// Build tax documents card
  Widget _buildTaxDocumentsCard(BuildContext context) {
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tax Documents',
              style: AdaptiveTextStyles.titleMedium(context),
            ),
            AdaptiveSpacing.verticalMedium(),
            const Text('Tax-related documents and forms coming soon...'),
          ],
        ),
      ),
    );
  }

  /// Show quick actions bottom sheet
  void _showQuickActions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Quick Actions',
              style: AdaptiveTextStyles.titleMedium(context),
            ),
            AdaptiveSpacing.verticalMedium(),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              childAspectRatio: 1,
              mainAxisSpacing: Spacing.sm,
              crossAxisSpacing: Spacing.sm,
              children: [
                _buildActionButton(context, 'Add Funds', Icons.add, () {
                  Navigator.pop(context);
                  _navigateToAddFunds();
                }),
                _buildActionButton(context, 'Withdraw', Icons.account_balance,
                    () {
                  Navigator.pop(context);
                  _navigateToWithdraw();
                }),
                _buildActionButton(context, 'Invest', Icons.trending_up, () {
                  Navigator.pop(context);
                  _navigateToInvest();
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Handle menu actions
  void _handleMenuAction(String action) {
    switch (action) {
      case 'export':
        _exportTransactions();
        break;
      case 'statements':
        _navigateToStatements();
        break;
      case 'settings':
        _navigateToPaymentSettings();
        break;
    }
  }

  /// Export transactions
  void _exportTransactions() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Transaction export feature coming soon')),
    );
  }

  /// Navigate to search
  void _navigateToSearch() {
    context.go('/transactions/search');
  }

  /// Navigate to statements
  void _navigateToStatements() {
    context.go('/transactions/statements');
  }

  /// Navigate to payment settings
  void _navigateToPaymentSettings() {
    context.go('/settings/payment');
  }

  /// Navigate to add funds
  void _navigateToAddFunds() {
    context.go('/transactions/add-funds');
  }

  /// Navigate to withdraw
  void _navigateToWithdraw() {
    context.go('/transactions/withdraw');
  }

  /// Navigate to invest
  void _navigateToInvest() {
    context.go('/browse');
  }

  /// Navigate to transfer
  void _navigateToTransfer() {
    context.go('/transactions/transfer');
  }
}
