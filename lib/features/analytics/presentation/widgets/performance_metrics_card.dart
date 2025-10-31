import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/constants/spacing.dart';

/// Performance metrics card showing business performance analytics
class PerformanceMetricsCard extends ConsumerWidget {
  final String timeframe;
  final bool showDetailed;
  
  const PerformanceMetricsCard({
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
            _buildPerformanceCharts(context),
            if (showDetailed) ...[
              AdaptiveSpacing.verticalLarge(),
              _buildDetailedMetrics(context),
            ],
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
          Icons.trending_up,
          color: Theme.of(context).colorScheme.primary,
          size: 24,
        ),
        const SizedBox(width: Spacing.sm),
        Text(
          'Performance Metrics',
          style: AdaptiveTextStyles.titleMedium(context),
        ),
        const Spacer(),
        if (!showDetailed)
          TextButton(
            onPressed: () => _navigateToDetailed(),
            child: const Text('View Details'),
          ),
      ],
    );
  }
  
  /// Build performance charts placeholder
  Widget _buildPerformanceCharts(BuildContext context) {
    return Container(
      height: showDetailed ? 300 : 200,
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
              Icons.show_chart,
              size: 48,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
            ),
            AdaptiveSpacing.verticalMedium(),
            Text(
              'Performance Charts',
              style: AdaptiveTextStyles.titleMedium(context),
            ),
            const SizedBox(height: Spacing.sm),
            Text(
              'Interactive performance visualization',
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
  
  /// Build detailed metrics (detailed view only)
  Widget _buildDetailedMetrics(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Detailed Analysis',
          style: AdaptiveTextStyles.titleSmall(context),
        ),
        AdaptiveSpacing.verticalMedium(),
        // Add detailed metrics implementation here
        SizedBox(
          height: 150,
          child: Center(
            child: Text(
              'Detailed performance metrics will be displayed here',
              style: AdaptiveTextStyles.bodyMedium(context),
            ),
          ),
        ),
      ],
    );
  }
  
  /// Navigate to detailed view
  void _navigateToDetailed() {
    // Navigate to detailed performance metrics
  }
}