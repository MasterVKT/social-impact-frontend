// lib/features/investments/presentation/widgets/portfolio/portfolio_list.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/investments_providers.dart';
import '../../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../../shared/constants/spacing.dart';

class PortfolioList extends ConsumerWidget {
  const PortfolioList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final portfolioAsync = ref.watch(portfolioSummaryProvider);
    return portfolioAsync.when(
      data: (summary) {
        final investments = summary?.topInvestments ?? const [];
        if (investments.isEmpty) {
          return Center(
            child: Text(
              'No investments yet',
              style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
              ),
            ),
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.all(Spacing.md),
          itemCount: investments.length,
          itemBuilder: (context, index) {
            final inv = investments[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: Spacing.md),
              child: AdaptiveCard(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                    child: Text(
                      inv.name.substring(0, 2).toUpperCase(),
                      style: TextStyle(color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                  title: Text(inv.name, style: AdaptiveTextStyles.bodyLarge(context).copyWith(fontWeight: FontWeight.w600)),
                  subtitle: Text(inv.type, style: AdaptiveTextStyles.bodySmall(context)),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('€${inv.currentValue.toStringAsFixed(0)}', style: AdaptiveTextStyles.bodyMedium(context).copyWith(fontWeight: FontWeight.w600)),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            inv.returnPercentage >= 0 ? Icons.trending_up : Icons.trending_down,
                            size: 16,
                            color: inv.returnPercentage >= 0 ? Colors.green : Colors.red,
                          ),
                          Text(
                            '${inv.returnPercentage >= 0 ? '+' : ''}${inv.returnPercentage.toStringAsFixed(1)}%',
                            style: AdaptiveTextStyles.bodySmall(context).copyWith(
                              color: inv.returnPercentage >= 0 ? Colors.green : Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Error: ${e.toString()}')),
    );
  }
}

