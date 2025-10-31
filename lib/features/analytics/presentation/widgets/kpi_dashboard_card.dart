import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/constants/spacing.dart';

/// KPI dashboard card showing key performance indicators
class KPIDashboardCard extends ConsumerWidget {
  final String timeframe;
  final bool showDetailed;
  
  const KPIDashboardCard({
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
            _buildKPIList(context),
            if (showDetailed) ...[
              AdaptiveSpacing.verticalLarge(),
              _buildKPITrends(context),
              AdaptiveSpacing.verticalLarge(),
              _buildKPITargets(context),
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
          Icons.speed,
          color: Theme.of(context).colorScheme.primary,
          size: 24,
        ),
        const SizedBox(width: Spacing.sm),
        Text(
          'Key Performance Indicators',
          style: AdaptiveTextStyles.titleMedium(context),
        ),
        const Spacer(),
        if (!showDetailed)
          TextButton(
            onPressed: () => _navigateToDetailedKPIs(),
            child: const Text('View All'),
          ),
      ],
    );
  }
  
  /// Build KPI list
  Widget _buildKPIList(BuildContext context) {
    final kpis = _getKPIsForTimeframe();
    
    return Column(
      children: kpis.take(showDetailed ? kpis.length : 4).map((kpi) {
        return _buildKPIItem(context, kpi);
      }).toList(),
    );
  }
  
  /// Build individual KPI item
  Widget _buildKPIItem(BuildContext context, Map<String, dynamic> kpi) {
    final progress = (kpi['current'] as double) / (kpi['target'] as double);
    final isOnTrack = progress >= 0.8; // Consider 80%+ as on track
    final progressColor = isOnTrack ? Colors.green : 
                         progress >= 0.6 ? Colors.orange : Colors.red;
    
    return Container(
      margin: const EdgeInsets.only(bottom: Spacing.md),
      padding: const EdgeInsets.all(Spacing.md),
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
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: (kpi['color'] as Color).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Icon(
                  kpi['icon'] as IconData,
                  color: kpi['color'] as Color,
                  size: 18,
                ),
              ),
              const SizedBox(width: Spacing.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      kpi['name'] as String,
                      style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      kpi['category'] as String,
                      style: AdaptiveTextStyles.bodySmall(context).copyWith(
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${kpi['current'].toString()}${kpi['unit']}',
                    style: AdaptiveTextStyles.titleMedium(context).copyWith(
                      fontWeight: FontWeight.bold,
                      color: progressColor,
                    ),
                  ),
                  Text(
                    'of ${kpi['target'].toString()}${kpi['unit']}',
                    style: AdaptiveTextStyles.bodySmall(context).copyWith(
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ],
          ),
          
          AdaptiveSpacing.verticalMedium(),
          
          // Progress bar
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Progress',
                    style: AdaptiveTextStyles.bodySmall(context),
                  ),
                  Text(
                    '${(progress * 100).toStringAsFixed(0)}%',
                    style: AdaptiveTextStyles.bodySmall(context).copyWith(
                      fontWeight: FontWeight.w600,
                      color: progressColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              LinearProgressIndicator(
                value: progress.clamp(0.0, 1.0),
                backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
                valueColor: AlwaysStoppedAnimation<Color>(progressColor),
              ),
            ],
          ),
          
          if (showDetailed) ...[
            AdaptiveSpacing.verticalSmall(),
            Row(
              children: [
                Icon(
                  _getTrendIcon(kpi['trend'] as String),
                  size: 14,
                  color: _getTrendColor(kpi['trend'] as String),
                ),
                const SizedBox(width: 4),
                Text(
                  '${kpi['change']} vs ${_getPreviousPeriod()}',
                  style: AdaptiveTextStyles.bodySmall(context).copyWith(
                    color: _getTrendColor(kpi['trend'] as String),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                if (kpi['critical'] == true)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'CRITICAL',
                      style: AdaptiveTextStyles.bodySmall(context).copyWith(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 9,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ],
      ),
    );
  }
  
  /// Build KPI trends (detailed view only)
  Widget _buildKPITrends(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Spacing.md),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'KPI Trends Analysis',
            style: AdaptiveTextStyles.titleSmall(context),
          ),
          AdaptiveSpacing.verticalMedium(),
          
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.show_chart,
                    size: 32,
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.4),
                  ),
                  const SizedBox(height: Spacing.sm),
                  Text(
                    'KPI Trends Chart',
                    style: AdaptiveTextStyles.bodyMedium(context),
                  ),
                  Text(
                    'Interactive trend visualization',
                    style: AdaptiveTextStyles.bodySmall(context).copyWith(
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  /// Build KPI targets (detailed view only)
  Widget _buildKPITargets(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Target Achievement',
              style: AdaptiveTextStyles.titleSmall(context),
            ),
            TextButton(
              onPressed: () => _adjustTargets(),
              child: const Text('Adjust Targets'),
            ),
          ],
        ),
        AdaptiveSpacing.verticalMedium(),
        
        Container(
          padding: const EdgeInsets.all(Spacing.md),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
            ),
          ),
          child: Column(
            children: [
              _buildTargetSummaryRow(context, 'On Track', 8, Colors.green),
              const Divider(height: Spacing.md),
              _buildTargetSummaryRow(context, 'At Risk', 3, Colors.orange),
              const Divider(height: Spacing.md),
              _buildTargetSummaryRow(context, 'Behind', 1, Colors.red),
            ],
          ),
        ),
      ],
    );
  }
  
  /// Build target summary row
  Widget _buildTargetSummaryRow(BuildContext context, String status, int count, Color color) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: Spacing.sm),
        Expanded(
          child: Text(
            status,
            style: AdaptiveTextStyles.bodyMedium(context),
          ),
        ),
        Text(
          count.toString(),
          style: AdaptiveTextStyles.titleMedium(context).copyWith(
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(width: Spacing.sm),
        Text(
          'KPIs',
          style: AdaptiveTextStyles.bodySmall(context).copyWith(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
          ),
        ),
      ],
    );
  }
  
  /// Get KPIs for current timeframe
  List<Map<String, dynamic>> _getKPIsForTimeframe() {
    return [
      {
        'name': 'Revenue Growth',
        'category': 'Financial',
        'current': 2.4,
        'target': 3.0,
        'unit': 'M€',
        'change': '+12.5%',
        'trend': 'up',
        'icon': Icons.trending_up,
        'color': Colors.green,
        'critical': false,
      },
      {
        'name': 'Customer Acquisition',
        'category': 'Growth',
        'current': 1847.0,
        'target': 2000.0,
        'unit': '',
        'change': '+8.3%',
        'trend': 'up',
        'icon': Icons.people_alt,
        'color': Colors.blue,
        'critical': false,
      },
      {
        'name': 'Impact Score',
        'category': 'Sustainability',
        'current': 94.2,
        'target': 95.0,
        'unit': '',
        'change': '+2.1%',
        'trend': 'up',
        'icon': Icons.eco,
        'color': Colors.green,
        'critical': false,
      },
      {
        'name': 'Customer Satisfaction',
        'category': 'Quality',
        'current': 4.6,
        'target': 4.8,
        'unit': '/5',
        'change': '+0.2',
        'trend': 'up',
        'icon': Icons.star,
        'color': Colors.orange,
        'critical': false,
      },
      {
        'name': 'Operational Efficiency',
        'category': 'Operations',
        'current': 87.3,
        'target': 90.0,
        'unit': '%',
        'change': '+3.1%',
        'trend': 'up',
        'icon': Icons.speed,
        'color': Colors.purple,
        'critical': false,
      },
      {
        'name': 'Cash Flow',
        'category': 'Financial',
        'current': 450.0,
        'target': 500.0,
        'unit': 'K€',
        'change': '-2.3%',
        'trend': 'down',
        'icon': Icons.account_balance_wallet,
        'color': Colors.orange,
        'critical': true,
      },
      {
        'name': 'Compliance Score',
        'category': 'Risk',
        'current': 98.5,
        'target': 100.0,
        'unit': '%',
        'change': '+1.2%',
        'trend': 'up',
        'icon': Icons.verified_user,
        'color': Colors.blue,
        'critical': false,
      },
      {
        'name': 'Innovation Index',
        'category': 'Development',
        'current': 76.8,
        'target': 80.0,
        'unit': '',
        'change': '+4.7%',
        'trend': 'up',
        'icon': Icons.lightbulb,
        'color': Colors.purple,
        'critical': false,
      },
    ];
  }
  
  /// Get trend icon based on trend direction
  IconData _getTrendIcon(String trend) {
    switch (trend) {
      case 'up':
        return Icons.trending_up;
      case 'down':
        return Icons.trending_down;
      case 'stable':
        return Icons.trending_flat;
      default:
        return Icons.trending_flat;
    }
  }
  
  /// Get trend color based on trend direction
  Color _getTrendColor(String trend) {
    switch (trend) {
      case 'up':
        return Colors.green;
      case 'down':
        return Colors.red;
      case 'stable':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }
  
  /// Get previous period description
  String _getPreviousPeriod() {
    switch (timeframe) {
      case '7d':
        return 'last week';
      case '30d':
        return 'last month';
      case '90d':
        return 'last quarter';
      case '1y':
        return 'last year';
      default:
        return 'previous period';
    }
  }
  
  /// Navigate to detailed KPIs view
  void _navigateToDetailedKPIs() {
    // Navigate to detailed KPI dashboard
  }
  
  /// Adjust KPI targets
  void _adjustTargets() {
    // Open KPI target adjustment dialog
  }
}