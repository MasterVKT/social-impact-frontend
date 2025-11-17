// lib/features/investments/presentation/widgets/performance/performance_kpis.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/investments_providers.dart';
import '../../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../../shared/constants/spacing.dart';

class PerformanceKPIs extends ConsumerWidget {
  const PerformanceKPIs({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final portfolioAsync = ref.watch(portfolioSummaryProvider);
    return portfolioAsync.when(
      data: (summary) {
        if (summary == null) return const SizedBox.shrink();
        return Row(
          children: [
            Expanded(
              child: AdaptiveCard(
                child: Padding(
                  padding: const EdgeInsets.all(Spacing.lg),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Total Return', style: AdaptiveTextStyles.bodySmall(context)),
                      Text('€${summary.totalReturn.toStringAsFixed(0)}', style: AdaptiveTextStyles.titleLarge(context).copyWith(
                        color: summary.totalReturn >= 0 ? Colors.green : Colors.red,
                      )),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: Spacing.md),
            Expanded(
              child: AdaptiveCard(
                child: Padding(
                  padding: const EdgeInsets.all(Spacing.lg),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Return %', style: AdaptiveTextStyles.bodySmall(context)),
                      Text('${summary.returnPercentage.toStringAsFixed(2)}%', style: AdaptiveTextStyles.titleLarge(context).copyWith(
                        color: summary.returnPercentage >= 0 ? Colors.green : Colors.red,
                      )),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Error: ${e.toString()}')),
    );
  }
}

