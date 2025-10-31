// lib/features/investments/presentation/widgets/overview/overview_allocation_chart.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/investments_providers.dart';
import '../../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../../shared/constants/spacing.dart';

class OverviewAllocationChart extends ConsumerWidget {
  const OverviewAllocationChart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final portfolioAsync = ref.watch(portfolioSummaryProvider);
    return portfolioAsync.when(
      data: (summary) {
        final cats = summary?.investmentCategories ?? const <String>[];
        if (cats.isEmpty) return const SizedBox.shrink();
        final percent = 100.0 / cats.length;
        return AdaptiveCard(
          child: Padding(
            padding: const EdgeInsets.all(Spacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Allocation by Category', style: AdaptiveTextStyles.titleSmall(context)),
                const SizedBox(height: Spacing.md),
                ...cats.map((name) => _buildRow(context, name, percent)),
                const SizedBox(height: Spacing.md),
                _buildBar(context, percent, cats.length),
              ],
            ),
          ),
        );
      },
      loading: () => const AdaptiveCard(child: Padding(padding: EdgeInsets.all(Spacing.lg), child: Center(child: CircularProgressIndicator()))),
      error: (e, _) => AdaptiveCard(child: Padding(padding: const EdgeInsets.all(Spacing.lg), child: Text(e.toString()))),
    );
  }

  Widget _buildRow(BuildContext context, String name, double percent) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Spacing.sm),
      child: Row(
        children: [
          Container(width: 12, height: 12, decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary.withOpacity(0.3), borderRadius: BorderRadius.circular(3))),
          const SizedBox(width: Spacing.sm),
          Expanded(child: Text(name, style: AdaptiveTextStyles.bodyMedium(context))),
          Text('${percent.toStringAsFixed(1)}%', style: AdaptiveTextStyles.bodyMedium(context).copyWith(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Widget _buildBar(BuildContext context, double percent, int count) {
    return Container(
      height: 8,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
      child: Row(
        children: List.generate(count, (i) {
          return Expanded(
            flex: percent.round(),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.2 + (i % 3) * 0.1),
                borderRadius: i == 0
                    ? const BorderRadius.only(topLeft: Radius.circular(4), bottomLeft: Radius.circular(4))
                    : i == count - 1
                        ? const BorderRadius.only(topRight: Radius.circular(4), bottomRight: Radius.circular(4))
                        : null,
              ),
            ),
          );
        }),
      ),
    );
  }
}
