import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/constants/spacing.dart';

/// Analytics charts card showing visual data representations
class AnalyticsChartsCard extends ConsumerWidget {
  final String timeframe;
  final bool showDetailed;
  
  const AnalyticsChartsCard({
    super.key,
    required this.timeframe,
    this.showDetailed = false,
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
            _buildChartsContainer(context),
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
          Icons.analytics,
          color: Theme.of(context).colorScheme.primary,
          size: 24,
        ),
        const SizedBox(width: Spacing.sm),
        Text(
          'Analytics Charts',
          style: AdaptiveTextStyles.titleMedium(context),
        ),
        const Spacer(),
        PopupMenuButton<String>(
          onSelected: _handleChartAction,
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'configure',
              child: ListTile(
                leading: Icon(Icons.settings),
                title: Text('Configure Charts'),
              ),
            ),
            const PopupMenuItem(
              value: 'export',
              child: ListTile(
                leading: Icon(Icons.download),
                title: Text('Export Charts'),
              ),
            ),
          ],
        ),
      ],
    );
  }
  
  /// Build charts container
  Widget _buildChartsContainer(BuildContext context) {
    return Container(
      height: showDetailed ? 400 : 250,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.bar_chart,
              size: 48,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
            ),
            AdaptiveSpacing.verticalMedium(),
            Text(
              'Interactive Charts',
              style: AdaptiveTextStyles.titleMedium(context),
            ),
            const SizedBox(height: Spacing.sm),
            Text(
              'Dynamic chart visualizations will be displayed here',
              style: AdaptiveTextStyles.bodySmall(context).copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
  
  /// Handle chart actions
  void _handleChartAction(String action) {
    switch (action) {
      case 'configure':
        // Configure charts
        break;
      case 'export':
        // Export charts
        break;
    }
  }
}