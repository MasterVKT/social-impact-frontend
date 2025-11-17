// lib/features/investments/presentation/widgets/history/history_table.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/investments_providers.dart';
import '../../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../../../core/services/analytics/analytics_service.dart';
import '../../../domain/entities/contribution.dart';

class HistoryTable extends ConsumerWidget {
  const HistoryTable({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contributionsAsync = ref.watch(contributionsProvider(null));
    return contributionsAsync.when(
      data: (contributions) {
        if (contributions.isEmpty) {
          return Center(
            child: Text(
              'No contributions yet',
              style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
              ),
            ),
          );
        }
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: AdaptiveCard(
            child: DataTable(
              columns: const [
                DataColumn(label: Text('Date')),
                DataColumn(label: Text('Project')),
                DataColumn(label: Text('Amount')),
                DataColumn(label: Text('Status')),
                DataColumn(label: Text('Actions')),
              ],
              rows: contributions.map((c) {
                return DataRow(
                  cells: [
                    DataCell(Text(c.createdAt.toLocal().toString().split(' ')[0])),
                    DataCell(Text(c.projectId.substring(0, 8))),
                    DataCell(Text('€${(c.amountCents / 100).toStringAsFixed(2)}')),
                    DataCell(_StatusChip(status: c.status)),
                    DataCell(IconButton(
                      icon: const Icon(Icons.receipt),
                      onPressed: () {
                        AnalyticsService.instance.logDownloadReceipt(
                          receiptId: c.receiptUrl ?? '',
                          contributionId: c.id,
                        );
                        // TODO: Implement receipt download
                      },
                    )),
                  ],
                );
              }).toList(),
            ),
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Error: ${e.toString()}')),
    );
  }
}

class _StatusChip extends StatelessWidget {
  final ContributionStatus status;
  const _StatusChip({required this.status});

  @override
  Widget build(BuildContext context) {
    Color color;
    switch (status) {
      case ContributionStatus.confirmed:
        color = Colors.green;
        break;
      case ContributionStatus.failed:
        color = Colors.red;
        break;
      case ContributionStatus.refunded:
        color = Colors.orange;
        break;
      case ContributionStatus.pending:
        color = Colors.blue;
        break;
    }
    return Chip(
      label: Text(status.name.toUpperCase(), style: const TextStyle(fontSize: 10)),
      backgroundColor: color.withOpacity(0.2),
      labelStyle: TextStyle(color: color, fontWeight: FontWeight.w600),
    );
  }
}

