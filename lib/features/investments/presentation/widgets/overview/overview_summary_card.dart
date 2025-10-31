
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/investments_providers.dart';
import '../../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../../shared/constants/spacing.dart';

class OverviewSummaryCard extends ConsumerWidget {
  const OverviewSummaryCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final portfolioAsync = ref.watch(portfolioSummaryProvider);
    return portfolioAsync.when(
      data: (summary) {
        return AdaptiveCard(
          child: Padding(
            padding: const EdgeInsets.all(Spacing.lg),
            child: Row(
              children: [
                Expanded(
                  child: _buildStat(
                    context,
                    title: 'Total Invested',
                    value: summary != null ? '€${summary.totalInvestment.toStringAsFixed(0)}' : '—',
                    color: Theme.of(context).colorScheme.primary,
                    icon: Icons.savings_outlined,
                  ),
                ),
                const SizedBox(width: Spacing.md),
                Expanded(
                  child: _buildStat(
                    context,
                    title: 'Current Value',
                    value: summary != null ? '€${summary.currentValue.toStringAsFixed(0)}' : '—',
                    color: Theme.of(context).colorScheme.secondary,
                    icon: Icons.account_balance_wallet_outlined,
                  ),
                ),
                const SizedBox(width: Spacing.md),
                Expanded(
                  child: _buildStat(
                    context,
                    title: 'Return %',
                    value: summary != null ? '${summary.returnPercentage.toStringAsFixed(1)}%' : '—',
                    color: Colors.green,
                    icon: Icons.trending_up,
                  ),
                ),
              ],
            ),
          ),
        );
      },
      loading: () => const AdaptiveCard(child: Padding(padding: EdgeInsets.all(Spacing.lg), child: Center(child: CircularProgressIndicator()))),
      error: (e, _) => AdaptiveCard(child: Padding(padding: const EdgeInsets.all(Spacing.lg), child: Text(e.toString()))),
    );
  }

  Widget _buildStat(BuildContext context, {required String title, required String value, required Color color, required IconData icon}) {
    return Container(
      padding: const EdgeInsets.all(Spacing.md),
      decoration: BoxDecoration(
        color: color.withOpacity(0.06),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color.withOpacity(0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color),
          ),
          const SizedBox(width: Spacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(value, style: AdaptiveTextStyles.titleMedium(context).copyWith(fontWeight: FontWeight.bold, color: color)),
                Text(title, style: AdaptiveTextStyles.bodySmall(context)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
