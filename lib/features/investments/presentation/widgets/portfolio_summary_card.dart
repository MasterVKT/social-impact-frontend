import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/constants/spacing.dart';
import '../../../../core/utils/platform_detector.dart';
import '../providers/investment_providers.dart';

/// Portfolio summary card showing key metrics
class PortfolioSummaryCard extends ConsumerWidget {
  const PortfolioSummaryCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final portfolio = ref.watch(portfolioProvider);

    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context, portfolio),
            AdaptiveSpacing.verticalLarge(),
            _buildMainMetrics(context, portfolio),
            AdaptiveSpacing.verticalLarge(),
            _buildSecondaryMetrics(context, portfolio),
            AdaptiveSpacing.verticalMedium(),
            _buildQuickActions(context),
          ],
        ),
      ),
    );
  }

  /// Build card header
  Widget _buildHeader(BuildContext context, portfolio) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(Spacing.sm),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            Icons.account_balance_wallet,
            color: Theme.of(context).colorScheme.primary,
            size: 24,
          ),
        ),
        const SizedBox(width: Spacing.md),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Portfolio Summary',
              style: AdaptiveTextStyles.titleMedium(context),
            ),
            Text(
              'Last updated: 2 hours ago',
              style: AdaptiveTextStyles.bodySmall(context).copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
              ),
            ),
          ],
        ),
        const Spacer(),
        IconButton(
          onPressed: () => _refreshPortfolio(),
          icon: const Icon(Icons.refresh),
          tooltip: 'Refresh',
        ),
      ],
    );
  }

  /// Build main portfolio metrics
  Widget _buildMainMetrics(BuildContext context, portfolio) {
    final isPositive = portfolio.totalReturns >= 0;

    return Column(
      children: [
        // Total value
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total Portfolio Value',
              style: AdaptiveTextStyles.bodyLarge(context),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '€${portfolio.currentValue.toStringAsFixed(0)}',
                  style: AdaptiveTextStyles.headlineMedium(context).copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Text(
                  '${isPositive ? '+' : ''}€${portfolio.totalReturns.toStringAsFixed(0)} (${isPositive ? '+' : ''}${portfolio.returnPercentage.toStringAsFixed(1)}%)',
                  style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                    color: isPositive ? Colors.green : Colors.red,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),

        AdaptiveSpacing.verticalMedium(),

        // Progress indicator
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Invested',
                  style: AdaptiveTextStyles.bodyMedium(context),
                ),
                Text(
                  '€${portfolio.totalInvested.toStringAsFixed(0)}',
                  style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: Spacing.sm),
            LinearProgressIndicator(
              value: portfolio.totalInvested > 0
                  ? (portfolio.currentValue / (portfolio.totalInvested * 1.2))
                      .clamp(0.0, 1.0)
                  : 0.0,
              backgroundColor:
                  Theme.of(context).colorScheme.outline.withOpacity(0.2),
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// Build secondary metrics grid
  Widget _buildSecondaryMetrics(BuildContext context, portfolio) {
    final metrics = [
      {
        'title': 'Active Investments',
        'value': '${portfolio.activeInvestments}',
        'icon': Icons.trending_up
      },
      {
        'title': 'Completed',
        'value': '${portfolio.completedInvestments}',
        'icon': Icons.check_circle
      },
      {
        'title': 'Total Invested',
        'value': '€${portfolio.totalInvested.toStringAsFixed(0)}',
        'icon': Icons.account_balance_wallet
      },
      {
        'title': 'Return',
        'value': '${portfolio.returnPercentage.toStringAsFixed(1)}%',
        'icon': Icons.trending_up
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: PlatformDetector.isMobile ? 2 : 4,
        // Ratio très large pour éviter tout overflow
        childAspectRatio: PlatformDetector.isMobile ? 1.8 : 2.2,
        mainAxisSpacing: Spacing.sm,
        crossAxisSpacing: Spacing.sm,
      ),
      itemCount: metrics.length,
      itemBuilder: (context, index) {
        final metric = metrics[index];
        return Container(
          padding: const EdgeInsets.all(Spacing.xs),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Theme.of(context).colorScheme.outline.withOpacity(0.1),
            ),
          ),
          child: IntrinsicHeight(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  metric['icon'] as IconData,
                  color: Theme.of(context).colorScheme.primary,
                  size: 20,
                ),
                const SizedBox(height: 4),
                Flexible(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      metric['value']! as String,
                      style: AdaptiveTextStyles.bodySmall(context).copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                      maxLines: 1,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: 2),
                Flexible(
                  child: Text(
                    metric['title']! as String,
                    style: AdaptiveTextStyles.bodySmall(context).copyWith(
                      fontSize: 10,
                    ),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// Build quick action buttons
  Widget _buildQuickActions(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () => _navigateToNewInvestment(),
            icon: const Icon(Icons.add, size: 16),
            label: const Text('Invest'),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                  horizontal: Spacing.xs, vertical: Spacing.xs),
              textStyle:
                  AdaptiveTextStyles.bodySmall(context).copyWith(fontSize: 11),
            ),
          ),
        ),
        const SizedBox(width: Spacing.xs),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () => _navigateToWithdraw(),
            icon: const Icon(Icons.account_balance, size: 16),
            label: const Text('Withdraw'),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                  horizontal: Spacing.xs, vertical: Spacing.xs),
              textStyle:
                  AdaptiveTextStyles.bodySmall(context).copyWith(fontSize: 11),
            ),
          ),
        ),
        const SizedBox(width: Spacing.xs),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () => _navigateToAnalytics(),
            icon: const Icon(Icons.analytics, size: 16),
            label: const Text('Analyze'),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                  horizontal: Spacing.xs, vertical: Spacing.xs),
              textStyle:
                  AdaptiveTextStyles.bodySmall(context).copyWith(fontSize: 11),
            ),
          ),
        ),
      ],
    );
  }

  /// Refresh portfolio data
  void _refreshPortfolio() {
    // Implement portfolio refresh
  }

  /// Navigate to new investment
  void _navigateToNewInvestment() {
    // Navigate to browse projects or investment screen
  }

  /// Navigate to withdraw
  void _navigateToWithdraw() {
    // Navigate to withdrawal screen
  }

  /// Navigate to analytics
  void _navigateToAnalytics() {
    // Navigate to detailed analytics screen
  }
}
