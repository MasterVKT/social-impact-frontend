import 'package:flutter/material.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/constants/spacing.dart';

/// Reusable dashboard statistics card with adaptive design
class DashboardStatsCard extends StatelessWidget {
  final String title;
  final List<DashboardStat> stats;
  final IconData icon;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  
  const DashboardStatsCard({
    super.key,
    required this.title,
    required this.stats,
    required this.icon,
    this.onTap,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return AdaptiveCard(
      backgroundColor: backgroundColor,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(Spacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              AdaptiveSpacing.verticalMedium(),
              _buildStats(context),
              if (onTap != null) ...[
                AdaptiveSpacing.verticalMedium(),
                _buildActionButton(context),
              ],
            ],
          ),
        ),
      ),
    );
  }
  
  /// Build card header with icon and title
  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(Spacing.sm),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: Theme.of(context).colorScheme.primary,
            size: 24,
          ),
        ),
        const SizedBox(width: Spacing.md),
        Expanded(
          child: Text(
            title,
            style: AdaptiveTextStyles.titleMedium(context),
          ),
        ),
      ],
    );
  }
  
  /// Build statistics list
  Widget _buildStats(BuildContext context) {
    return Column(
      children: stats
          .map((stat) => _buildStatItem(context, stat))
          .toList(),
    );
  }
  
  /// Build individual statistic item
  Widget _buildStatItem(BuildContext context, DashboardStat stat) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Spacing.sm),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              stat.label,
              style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
              ),
            ),
          ),
          Row(
            children: [
              Text(
                stat.value,
                style: AdaptiveTextStyles.titleMedium(context).copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (stat.trend != null) ...[
                const SizedBox(width: Spacing.xs),
                _buildTrendIndicator(context, stat.trend!),
              ],
            ],
          ),
        ],
      ),
    );
  }
  
  /// Build trend indicator
  Widget _buildTrendIndicator(BuildContext context, TrendIndicator trend) {
    IconData icon;
    Color color;
    
    switch (trend.direction) {
      case TrendDirection.up:
        icon = Icons.trending_up;
        color = Colors.green;
        break;
      case TrendDirection.down:
        icon = Icons.trending_down;
        color = Colors.red;
        break;
      case TrendDirection.stable:
        icon = Icons.trending_flat;
        color = Theme.of(context).colorScheme.onSurface.withOpacity(0.6);
        break;
    }
    
    return Tooltip(
      message: trend.tooltip ?? '',
      child: Row(
        children: [
          Icon(
            icon,
            size: 16,
            color: color,
          ),
          if (trend.percentage != null) ...[
            const SizedBox(width: 2),
            Text(
              '${trend.percentage!}%',
              style: AdaptiveTextStyles.bodySmall(context).copyWith(
                color: color,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ],
      ),
    );
  }
  
  /// Build action button
  Widget _buildActionButton(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: Spacing.sm),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'View Details',
            style: AdaptiveTextStyles.bodyMedium(context).copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: Spacing.xs),
          Icon(
            Icons.arrow_forward,
            size: 16,
            color: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
    );
  }
}

/// Data class for dashboard statistics
class DashboardStat {
  final String label;
  final String value;
  final TrendIndicator? trend;
  final String? description;
  
  const DashboardStat({
    required this.label,
    required this.value,
    this.trend,
    this.description,
  });
}

/// Trend indicator for statistics
class TrendIndicator {
  final TrendDirection direction;
  final double? percentage;
  final String? tooltip;
  
  const TrendIndicator({
    required this.direction,
    this.percentage,
    this.tooltip,
  });
}

/// Trend direction enum
enum TrendDirection {
  up,
  down,
  stable,
}