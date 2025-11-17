// lib/features/investments/presentation/widgets/portfolio/portfolio_breakdown.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/investments_providers.dart';
import '../../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../../shared/constants/spacing.dart';

class PortfolioBreakdown extends ConsumerWidget {
  const PortfolioBreakdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final portfolioAsync = ref.watch(portfolioSummaryProvider);
    return portfolioAsync.when(
      data: (summary) {
        if (summary == null) return const SizedBox.shrink();
        return AdaptiveCard(
          child: Padding(
            padding: const EdgeInsets.all(Spacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Portfolio Breakdown', style: AdaptiveTextStyles.titleMedium(context)),
                const SizedBox(height: Spacing.md),
                _buildStatRow(context, 'Active Investments', '${summary.activeInvestments}'),
                _buildStatRow(context, 'Completed Investments', '${summary.completedInvestments}'),
                _buildStatRow(context, 'Total Investment', '€${summary.totalInvestment.toStringAsFixed(0)}'),
                _buildStatRow(context, 'Current Value', '€${summary.currentValue.toStringAsFixed(0)}'),
                _buildStatRow(context, 'Total Return', '€${summary.totalReturn.toStringAsFixed(0)}', color: summary.totalReturn >= 0 ? Colors.green : Colors.red),
                const Divider(),
                _buildStatRow(context, 'Return Percentage', '${summary.returnPercentage.toStringAsFixed(2)}%', color: summary.returnPercentage >= 0 ? Colors.green : Colors.red),
              ],
            ),
          ),
        );
      },
      loading: () => const AdaptiveCard(child: Padding(padding: EdgeInsets.all(Spacing.lg), child: Center(child: CircularProgressIndicator()))),
      error: (e, _) => AdaptiveCard(child: Padding(padding: const EdgeInsets.all(Spacing.lg), child: Text(e.toString()))),
    );
  }

  Widget _buildStatRow(BuildContext context, String label, String value, {Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Spacing.xs),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AdaptiveTextStyles.bodyMedium(context)),
          Text(value, style: AdaptiveTextStyles.bodyMedium(context).copyWith(
            fontWeight: FontWeight.w600,
            color: color ?? Theme.of(context).colorScheme.onSurface,
          )),
        ],
      ),
    );
  }
}

