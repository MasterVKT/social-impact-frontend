import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/constants/spacing.dart';

/// Beneficiaries tracker card showing people impacted by projects
class BeneficiariesTrackerCard extends ConsumerWidget {
  final String timeframe;

  const BeneficiariesTrackerCard({
    super.key,
    required this.timeframe,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            AdaptiveSpacing.verticalLarge(),
            _buildBeneficiariesOverview(context),
            AdaptiveSpacing.verticalLarge(),
            _buildDemographicsBreakdown(context),
            AdaptiveSpacing.verticalMedium(),
            _buildRecentUpdates(context),
          ],
        ),
      ),
    );
  }

  /// Build card header
  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.people,
          color: Theme.of(context).colorScheme.primary,
          size: 24,
        ),
        const SizedBox(width: Spacing.sm),
        Text(
          'Beneficiaries Tracker',
          style: AdaptiveTextStyles.titleMedium(context),
        ),
        const Spacer(),
        PopupMenuButton<String>(
          onSelected: _handleAction,
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'detailed_report',
              child: Text('Detailed Report'),
            ),
            const PopupMenuItem(
              value: 'export_data',
              child: Text('Export Data'),
            ),
          ],
          child: const Icon(Icons.more_vert),
        ),
      ],
    );
  }

  /// Build beneficiaries overview
  Widget _buildBeneficiariesOverview(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Spacing.md),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blue.withOpacity(0.1),
            Colors.purple.withOpacity(0.1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Beneficiaries',
                    style: AdaptiveTextStyles.titleMedium(context).copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: Spacing.sm),
                  Text(
                    '12,547',
                    style: AdaptiveTextStyles.headlineLarge(context).copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  Text(
                    '+2,340 ${_getTimeframeLabel()}',
                    style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                      color: Colors.green,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(Spacing.md),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Icon(
                  Icons.trending_up,
                  color: Colors.blue,
                  size: 32,
                ),
              ),
            ],
          ),

          AdaptiveSpacing.verticalMedium(),

          // Impact categories quick stats
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildQuickStat(context, 'Direct', '8,230', Colors.blue),
              _buildQuickStat(context, 'Indirect', '4,317', Colors.purple),
              _buildQuickStat(context, 'New', '2,340', Colors.green),
            ],
          ),
        ],
      ),
    );
  }

  /// Build quick stat item
  Widget _buildQuickStat(
      BuildContext context, String label, String value, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: AdaptiveTextStyles.titleMedium(context).copyWith(
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          label,
          style: AdaptiveTextStyles.bodySmall(context),
        ),
      ],
    );
  }

  /// Build demographics breakdown
  Widget _buildDemographicsBreakdown(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Demographics Breakdown',
          style: AdaptiveTextStyles.titleMedium(context),
        ),
        AdaptiveSpacing.verticalMedium(),
        _buildDemographicItem(context, 'Gender', [
          {
            'label': 'Women',
            'count': 6890,
            'percentage': 54.9,
            'color': Colors.pink
          },
          {
            'label': 'Men',
            'count': 5657,
            'percentage': 45.1,
            'color': Colors.blue
          },
        ]),
        AdaptiveSpacing.verticalMedium(),
        _buildDemographicItem(context, 'Age Groups', [
          {
            'label': 'Children (0-17)',
            'count': 4520,
            'percentage': 36.0,
            'color': Colors.green
          },
          {
            'label': 'Adults (18-64)',
            'count': 6780,
            'percentage': 54.0,
            'color': Colors.orange
          },
          {
            'label': 'Elderly (65+)',
            'count': 1247,
            'percentage': 10.0,
            'color': Colors.purple
          },
        ]),
        AdaptiveSpacing.verticalMedium(),
        _buildDemographicItem(context, 'Location', [
          {
            'label': 'Urban',
            'count': 7530,
            'percentage': 60.0,
            'color': Colors.indigo
          },
          {
            'label': 'Rural',
            'count': 5017,
            'percentage': 40.0,
            'color': Colors.teal
          },
        ]),
      ],
    );
  }

  /// Build demographic breakdown item
  Widget _buildDemographicItem(BuildContext context, String category,
      List<Map<String, dynamic>> breakdown) {
    return Container(
      padding: const EdgeInsets.all(Spacing.sm),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            category,
            style: AdaptiveTextStyles.titleSmall(context).copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          AdaptiveSpacing.verticalSmall(),
          ...breakdown.map((item) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Row(
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: item['color'] as Color,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(width: Spacing.sm),
                    Expanded(
                      child: Text(
                        item['label'] as String,
                        style: AdaptiveTextStyles.bodyMedium(context),
                      ),
                    ),
                    Text(
                      (item['count'] as int).toString(),
                      style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: Spacing.sm),
                    Text(
                      '${(item['percentage'] as double).toStringAsFixed(1)}%',
                      style: AdaptiveTextStyles.bodySmall(context).copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  /// Build recent updates
  Widget _buildRecentUpdates(BuildContext context) {
    final recentUpdates = [
      {
        'project': 'Clean Water Access Project',
        'count': 450,
        'type': 'Direct beneficiaries',
        'date': '2 days ago',
        'color': Colors.blue,
      },
      {
        'project': 'Healthcare Initiative',
        'count': 320,
        'type': 'Patients treated',
        'date': '5 days ago',
        'color': Colors.red,
      },
      {
        'project': 'Education Program',
        'count': 180,
        'type': 'Students enrolled',
        'date': '1 week ago',
        'color': Colors.purple,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recent Updates',
          style: AdaptiveTextStyles.titleMedium(context),
        ),
        AdaptiveSpacing.verticalMedium(),
        ...recentUpdates.map((update) => Padding(
              padding: const EdgeInsets.symmetric(vertical: Spacing.sm),
              child: Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: update['color'] as Color,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: Spacing.sm),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          update['project'] as String,
                          style:
                              AdaptiveTextStyles.bodyMedium(context).copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '${update['count']} ${update['type']}',
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
                  Text(
                    update['date'] as String,
                    style: AdaptiveTextStyles.bodySmall(context).copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }

  /// Get timeframe label for display
  String _getTimeframeLabel() {
    switch (timeframe) {
      case '1M':
        return 'this month';
      case '3M':
        return 'last 3 months';
      case '6M':
        return 'last 6 months';
      case '12M':
        return 'this year';
      case 'ALL':
        return 'all time';
      default:
        return 'this period';
    }
  }

  /// Handle card actions
  void _handleAction(String action) {
    switch (action) {
      case 'detailed_report':
        // Generate detailed beneficiaries report
        break;
      case 'export_data':
        // Export beneficiaries data
        break;
    }
  }
}
