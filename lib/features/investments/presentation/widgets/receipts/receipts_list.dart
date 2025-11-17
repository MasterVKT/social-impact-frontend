// lib/features/investments/presentation/widgets/receipts/receipts_list.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/investments_providers.dart';
import '../../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../../shared/constants/spacing.dart';
import '../../../../../../core/services/analytics/analytics_service.dart';

class ReceiptsList extends ConsumerWidget {
  const ReceiptsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contributionsAsync = ref.watch(contributionsProvider(null));
    return contributionsAsync.when(
      data: (contributions) {
        final withReceipts = contributions.where((c) => c.receiptUrl != null).toList();
        if (withReceipts.isEmpty) {
          return Center(
            child: Text(
              'No receipts available',
              style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
              ),
            ),
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.all(Spacing.md),
          itemCount: withReceipts.length,
          itemBuilder: (context, index) {
            final c = withReceipts[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: Spacing.md),
              child: AdaptiveCard(
                child: ListTile(
                  leading: const Icon(Icons.receipt_long),
                  title: Text('Contribution #${c.id.substring(0, 8)}', style: AdaptiveTextStyles.bodyLarge(context).copyWith(fontWeight: FontWeight.w600)),
                  subtitle: Text('€${(c.amountCents / 100).toStringAsFixed(2)} • ${c.createdAt.toLocal().toString().split(' ')[0]}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.download),
                    onPressed: () {
                      AnalyticsService.instance.logDownloadReceipt(
                        receiptId: c.receiptUrl ?? '',
                        contributionId: c.id,
                      );
                      // TODO: Implement download
                    },
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

