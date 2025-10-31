import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/constants/spacing.dart';
import '../../domain/entities/user_profile.dart';
import '../providers/user_profile_providers.dart';

/// Profile portfolio card showing user's investment portfolio and performance
class ProfilePortfolioCard extends ConsumerWidget {
  final String? userId;
  final bool showDetailed;

  const ProfilePortfolioCard({
    super.key,
    this.userId,
    this.showDetailed = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final portfolioAsync = ref.watch(userPortfolioProvider);

    return portfolioAsync.when(
      data: (summary) {
        if (summary == null) {
          return const AdaptiveCard(
            child: Padding(
              padding: EdgeInsets.all(Spacing.lg),
              child: Center(child: Text('No portfolio data')),
            ),
          );
        }
        return AdaptiveCard(
          child: Padding(
            padding: const EdgeInsets.all(Spacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context),
                AdaptiveSpacing.verticalLarge(),
                _buildPortfolioSummary(context, summary),
                if (showDetailed) ...[
                  AdaptiveSpacing.verticalLarge(),
                  _buildTopInvestments(context, summary),
                  AdaptiveSpacing.verticalLarge(),
                  _buildPortfolioBreakdown(context, summary),
                ],
              ],
            ),
          ),
        );
      },
      loading: () => const AdaptiveCard(
        child: Padding(
          padding: EdgeInsets.all(Spacing.lg),
          child: Center(child: CircularProgressIndicator()),
        ),
      ),
      error: (e, _) => AdaptiveCard(
        child: Padding(
          padding: const EdgeInsets.all(Spacing.lg),
          child: Text(e.toString()),
        ),
      ),
    );
  }

  /// Build card header
  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.account_balance_wallet_outlined,
          color: Theme.of(context).colorScheme.primary,
          size: 24,
        ),
        const SizedBox(width: Spacing.sm),
        Text(
          'Investment Portfolio',
          style: AdaptiveTextStyles.titleMedium(context),
        ),
        const Spacer(),
        if (showDetailed)
          TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              textStyle: const TextStyle(fontSize: 10),
              minimumSize: const Size(0, 0),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: () => _viewFullPortfolio(context),
            child: const Text('View All'),
          ),
      ],
    );
  }

  /// Build portfolio summary
  Widget _buildPortfolioSummary(BuildContext context, UserPortfolioSummary data) {
    return Container(
      padding: const EdgeInsets.all(Spacing.md),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).colorScheme.primaryContainer,
            Theme.of(context).colorScheme.secondaryContainer,
          ],
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _buildSummaryItem(
                  context,
                  'Total Investment',
                  '€${data.totalInvestment.toStringAsFixed(0)}',
                  Icons.trending_up,
                ),
              ),
              Container(
                  width: 1, height: 40, color: Colors.white.withOpacity(0.3)),
              Expanded(
                child: _buildSummaryItem(
                  context,
                  'Current Value',
                  '€${data.currentValue.toStringAsFixed(0)}',
                  Icons.account_balance_wallet,
                ),
              ),
            ],
          ),
          const SizedBox(height: Spacing.md),
          Row(
            children: [
              Expanded(
                child: _buildSummaryItem(
                  context,
                  'Total Return',
                  '€${data.totalReturn.toStringAsFixed(0)}',
                  Icons.show_chart,
                ),
              ),
              Container(
                  width: 1, height: 40, color: Colors.white.withOpacity(0.3)),
              Expanded(
                child: _buildSummaryItem(
                  context,
                  'Return %',
                  '${data.returnPercentage.toStringAsFixed(1)}%',
                  data.returnPercentage >= 0 ? Icons.arrow_upward : Icons.arrow_downward,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Build summary item
  Widget _buildSummaryItem(
      BuildContext context, String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: AdaptiveTextStyles.titleMedium(context).copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          label,
          style: AdaptiveTextStyles.bodySmall(context).copyWith(
            color: Colors.white.withOpacity(0.8),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  /// Build top investments
  Widget _buildTopInvestments(BuildContext context, UserPortfolioSummary data) {
    final top = data.topInvestments;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Top Performing Investments',
              style: AdaptiveTextStyles.titleSmall(context),
            ),
            const Spacer(),
            Text(
              '${top.length} of ${data.activeInvestments}',
              style: AdaptiveTextStyles.bodySmall(context).copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
              ),
            ),
          ],
        ),
        AdaptiveSpacing.verticalMedium(),
        ...top.take(showDetailed ? 5 : 3).map((investment) {
          return Padding(
            padding: const EdgeInsets.only(bottom: Spacing.sm),
            child: _buildInvestmentItem(context, investment),
          );
        }),
      ],
    );
  }

  /// Build investment item
  Widget _buildInvestmentItem(
      BuildContext context, InvestmentSummary investment) {
    final isPositive = investment.returnPercentage >= 0;

    return Container(
      padding: const EdgeInsets.all(Spacing.sm),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                ],
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                investment.name.substring(0, 2).toUpperCase(),
                style: AdaptiveTextStyles.bodySmall(context).copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: Spacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  investment.name,
                  style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  investment.type,
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '€${investment.currentValue.toStringAsFixed(0)}',
                style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    isPositive ? Icons.arrow_upward : Icons.arrow_downward,
                    size: 12,
                    color: isPositive ? Colors.green : Colors.red,
                  ),
                  Text(
                    '${investment.returnPercentage.toStringAsFixed(1)}%',
                    style: AdaptiveTextStyles.bodySmall(context).copyWith(
                      color: isPositive ? Colors.green : Colors.red,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Build portfolio breakdown
  Widget _buildPortfolioBreakdown(BuildContext context, UserPortfolioSummary data) {
    // S’il manque les catégories, afficher rien
    if (data.investmentCategories.isEmpty) {
      return const SizedBox.shrink();
    }

    // Sans pourcentages détaillés dans le schéma, on répartit équitablement
    final categories = data.investmentCategories
        .map((name) => {'name': name, 'percentage': (100.0 / data.investmentCategories.length), 'color': Colors.blue})
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Portfolio Breakdown',
          style: AdaptiveTextStyles.titleSmall(context),
        ),
        AdaptiveSpacing.verticalMedium(),
        ...categories.map((category) {
          return Padding(
            padding: const EdgeInsets.only(bottom: Spacing.sm),
            child: Row(
              children: [
                Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: category['color'] as Color,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(width: Spacing.sm),
                Expanded(
                  child: Text(
                    category['name'] as String,
                    style: AdaptiveTextStyles.bodyMedium(context),
                  ),
                ),
                Text(
                  '${(category['percentage'] as double).toStringAsFixed(1)}%',
                  style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          );
        }),
        AdaptiveSpacing.verticalMedium(),
        Container(
          height: 8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            children: categories.map((category) {
              return Expanded(
                flex: (category['percentage'] as double).round(),
                child: Container(
                  decoration: BoxDecoration(
                    color: category['color'] as Color,
                    borderRadius: category == categories.first
                        ? const BorderRadius.only(
                            topLeft: Radius.circular(4),
                            bottomLeft: Radius.circular(4),
                          )
                        : category == categories.last
                            ? const BorderRadius.only(
                                topRight: Radius.circular(4),
                                bottomRight: Radius.circular(4),
                              )
                            : null,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  /// View full portfolio
  void _viewFullPortfolio(BuildContext context) {
    // Navigate to full portfolio screen
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Navigate to full portfolio')),
    );
  }
}
