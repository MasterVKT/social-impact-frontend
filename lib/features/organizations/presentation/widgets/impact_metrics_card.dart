import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/constants/spacing.dart';
import '../../../../core/utils/platform_detector.dart';

/// Impact metrics card showing organization's social and environmental impact
class ImpactMetricsCard extends ConsumerWidget {
  final bool showDetailed;
  
  const ImpactMetricsCard({
    super.key,
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
            _buildImpactSummary(context),
            AdaptiveSpacing.verticalLarge(),
            _buildImpactMetrics(context),
            if (showDetailed) ...[
              AdaptiveSpacing.verticalLarge(),
              _buildSDGAlignment(context),
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
          Icons.eco,
          color: Theme.of(context).colorScheme.primary,
          size: 24,
        ),
        const SizedBox(width: Spacing.sm),
        Text(
          'Impact Metrics',
          style: AdaptiveTextStyles.titleMedium(context),
        ),
        const Spacer(),
        PopupMenuButton<String>(
          onSelected: _handleAction,
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'report',
              child: Text('Generate Report'),
            ),
            const PopupMenuItem(
              value: 'export',
              child: Text('Export Metrics'),
            ),
          ],
          child: const Icon(Icons.more_vert),
        ),
      ],
    );
  }
  
  /// Build impact summary
  Widget _buildImpactSummary(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Spacing.md),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3),
            Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.3),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            'Total Lives Impacted',
            style: AdaptiveTextStyles.titleMedium(context),
          ),
          const SizedBox(height: Spacing.sm),
          Text(
            '12,547',
            style: AdaptiveTextStyles.headlineLarge(context).copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          Text(
            '+2,340 this quarter',
            style: AdaptiveTextStyles.bodyMedium(context).copyWith(
              color: Colors.green,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
  
  /// Build impact metrics grid
  Widget _buildImpactMetrics(BuildContext context) {
    final metrics = [
      {
        'title': 'Clean Water Access',
        'value': '8,200',
        'unit': 'people',
        'icon': Icons.water_drop,
        'color': Colors.blue,
        'progress': 0.82,
        'target': '10,000',
      },
      {
        'title': 'Renewable Energy',
        'value': '150',
        'unit': 'MWh generated',
        'icon': Icons.wb_sunny,
        'color': Colors.orange,
        'progress': 0.75,
        'target': '200',
      },
      {
        'title': 'Education Access',
        'value': '2,400',
        'unit': 'students',
        'icon': Icons.school,
        'color': Colors.purple,
        'progress': 0.96,
        'target': '2,500',
      },
      {
        'title': 'Healthcare Services',
        'value': '5,670',
        'unit': 'patients treated',
        'icon': Icons.local_hospital,
        'color': Colors.red,
        'progress': 0.89,
        'target': '6,370',
      },
    ];
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Impact Categories',
          style: AdaptiveTextStyles.titleSmall(context),
        ),
        AdaptiveSpacing.verticalMedium(),
        
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: PlatformDetector.isMobile ? 1 : 2,
            childAspectRatio: PlatformDetector.isMobile ? 3 : 2.5,
            mainAxisSpacing: Spacing.md,
            crossAxisSpacing: Spacing.md,
          ),
          itemCount: metrics.length,
          itemBuilder: (context, index) {
            final metric = metrics[index];
            return _buildMetricCard(context, metric);
          },
        ),
      ],
    );
  }
  
  /// Build individual metric card
  Widget _buildMetricCard(BuildContext context, Map<String, dynamic> metric) {
    return Container(
      padding: const EdgeInsets.all(Spacing.md),
      decoration: BoxDecoration(
        color: (metric['color'] as Color).withOpacity(0.05),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: (metric['color'] as Color).withOpacity(0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                metric['icon'] as IconData,
                color: metric['color'] as Color,
                size: 20,
              ),
              const SizedBox(width: Spacing.sm),
              Expanded(
                child: Text(
                  metric['title'] as String,
                  style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          
          AdaptiveSpacing.verticalSmall(),
          
          Row(
            children: [
              Text(
                metric['value'] as String,
                style: AdaptiveTextStyles.titleLarge(context).copyWith(
                  fontWeight: FontWeight.bold,
                  color: metric['color'] as Color,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                metric['unit'] as String,
                style: AdaptiveTextStyles.bodySmall(context).copyWith(
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                ),
              ),
            ],
          ),
          
          AdaptiveSpacing.verticalSmall(),
          
          // Progress toward target
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Target: ${metric['target']}',
                    style: AdaptiveTextStyles.bodySmall(context),
                  ),
                  Text(
                    '${((metric['progress'] as double) * 100).toInt()}%',
                    style: AdaptiveTextStyles.bodySmall(context).copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              LinearProgressIndicator(
                value: metric['progress'] as double,
                backgroundColor: Theme.of(context).colorScheme.outline.withOpacity(0.2),
                valueColor: AlwaysStoppedAnimation<Color>(metric['color'] as Color),
              ),
            ],
          ),
        ],
      ),
    );
  }
  
  /// Build SDG alignment (only shown in detailed view)
  Widget _buildSDGAlignment(BuildContext context) {
    final sdgGoals = [
      {'number': 3, 'title': 'Good Health and Well-being', 'alignment': 0.9},
      {'number': 4, 'title': 'Quality Education', 'alignment': 0.8},
      {'number': 6, 'title': 'Clean Water and Sanitation', 'alignment': 0.95},
      {'number': 7, 'title': 'Affordable and Clean Energy', 'alignment': 0.7},
      {'number': 13, 'title': 'Climate Action', 'alignment': 0.6},
    ];
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'UN Sustainable Development Goals',
          style: AdaptiveTextStyles.titleSmall(context),
        ),
        AdaptiveSpacing.verticalMedium(),
        
        ...sdgGoals.map((goal) => _buildSDGItem(
          context,
          goal['number'] as int,
          goal['title'] as String,
          goal['alignment'] as double,
        )),
      ],
    );
  }
  
  /// Build individual SDG item
  Widget _buildSDGItem(BuildContext context, int number, String title, double alignment) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Spacing.sm),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: _getSDGColor(number),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Center(
              child: Text(
                number.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ),
          const SizedBox(width: Spacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AdaptiveTextStyles.bodyMedium(context),
                ),
                const SizedBox(height: 4),
                LinearProgressIndicator(
                  value: alignment,
                  backgroundColor: Theme.of(context).colorScheme.outline.withOpacity(0.2),
                  valueColor: AlwaysStoppedAnimation<Color>(_getSDGColor(number)),
                ),
              ],
            ),
          ),
          const SizedBox(width: Spacing.sm),
          Text(
            '${(alignment * 100).toInt()}%',
            style: AdaptiveTextStyles.bodySmall(context).copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
  
  /// Get SDG color based on goal number
  Color _getSDGColor(int sdgNumber) {
    switch (sdgNumber) {
      case 3: return const Color(0xFF4C9F38);
      case 4: return const Color(0xFFC5192D);
      case 6: return const Color(0xFF26BDE2);
      case 7: return const Color(0xFFFCC30B);
      case 13: return const Color(0xFF3F7E44);
      default: return Colors.grey;
    }
  }
  
  /// Handle header actions
  void _handleAction(String action) {
    switch (action) {
      case 'report':
        // Generate impact report
        break;
      case 'export':
        // Export impact metrics
        break;
    }
  }
}