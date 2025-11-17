// lib/features/investments/presentation/widgets/overview/overview_top_investments.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/investments_providers.dart';
import '../../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../../shared/constants/spacing.dart';

class OverviewTopInvestments extends ConsumerWidget {
  const OverviewTopInvestments({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final portfolioAsync = ref.watch(portfolioSummaryProvider);
    return portfolioAsync.when(
      data: (summary) {
        final items = summary?.topInvestments ?? const [];
        if (items.isEmpty) {
          return const SizedBox.shrink();
        }
        return AdaptiveCard(
          child: Padding(
            padding: const EdgeInsets.all(Spacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Top Performing Investments', style: AdaptiveTextStyles.titleSmall(context)),
                const SizedBox(height: Spacing.md),
                ...items.take(5).map((inv) => _buildItem(context, inv)),
              ],
            ),
          ),
        );
      },
      loading: () => const AdaptiveCard(child: Padding(padding: EdgeInsets.all(Spacing.lg), child: Center(child: CircularProgressIndicator()))),
      error: (e, _) => AdaptiveCard(child: Padding(padding: const EdgeInsets.all(Spacing.lg), child: Text(e.toString()))),
    );
  }

  Widget _buildItem(BuildContext context, dynamic investment) {
    final isPositive = (investment.returnPercentage ?? 0) >= 0;
    return Padding(
      padding: const EdgeInsets.only(bottom: Spacing.sm),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.secondary,
              ]),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                (investment.name as String).substring(0, 2).toUpperCase(),
                style: AdaptiveTextStyles.bodySmall(context).copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(width: Spacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(investment.name, style: AdaptiveTextStyles.bodyMedium(context).copyWith(fontWeight: FontWeight.w600)),
                Text(investment.type, style: AdaptiveTextStyles.bodySmall(context).copyWith(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6))),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('€${investment.currentValue.toStringAsFixed(0)}', style: AdaptiveTextStyles.bodyMedium(context).copyWith(fontWeight: FontWeight.w600)),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(isPositive ? Icons.arrow_upward : Icons.arrow_downward, size: 12, color: isPositive ? Colors.green : Colors.red),
                  Text('${investment.returnPercentage.toStringAsFixed(1)}%', style: AdaptiveTextStyles.bodySmall(context).copyWith(color: isPositive ? Colors.green : Colors.red, fontWeight: FontWeight.w600)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
