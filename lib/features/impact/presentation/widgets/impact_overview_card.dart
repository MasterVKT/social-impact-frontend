import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/constants/spacing.dart';
import '../../../../core/utils/platform_detector.dart';

/// Impact overview card showing high-level impact metrics and progress
class ImpactOverviewCard extends ConsumerWidget {
  final String timeframe;
  final bool showDetailed;
  
  const ImpactOverviewCard({
    super.key,
    required this.timeframe,
    this.showDetailed = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AdaptiveCard(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primaryContainer,
              Theme.of(context).colorScheme.secondaryContainer,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(Spacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              AdaptiveSpacing.verticalLarge(),
              _buildMainImpactMetric(context),
              AdaptiveSpacing.verticalLarge(),
              _buildImpactBreakdown(context),
              if (showDetailed) ...[
                AdaptiveSpacing.verticalLarge(),
                _buildDetailedMetrics(context),
              ],
            ],
          ),
        ),
      ),
    );
  }
  
  /// Build card header
  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(Spacing.sm),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            Icons.public,
            color: Theme.of(context).colorScheme.primary,
            size: 24,
          ),
        ),
        const SizedBox(width: Spacing.md),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Impact Overview',
              style: AdaptiveTextStyles.titleMedium(context).copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              _getTimeframeLabel(timeframe),
              style: AdaptiveTextStyles.bodySmall(context).copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
              ),
            ),
          ],
        ),
        const Spacer(),
        IconButton(
          onPressed: () => _refreshData(),
          icon: const Icon(Icons.refresh),
          tooltip: 'Refresh Data',
        ),
      ],
    );
  }
  
  /// Build main impact metric
  Widget _buildMainImpactMetric(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Spacing.lg),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
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
                    'Total Lives Impacted',
                    style: AdaptiveTextStyles.titleLarge(context).copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: Spacing.sm),
                  Text(
                    '12,547',
                    style: AdaptiveTextStyles.headlineLarge(context).copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(Spacing.md),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Column(
                  children: [
                    const Icon(
                      Icons.trending_up,
                      color: Colors.green,
                      size: 32,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '+15.3%',
                      style: AdaptiveTextStyles.titleMedium(context).copyWith(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          
          AdaptiveSpacing.verticalMedium(),
          
          // Progress towards annual target
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Annual Target Progress',
                    style: AdaptiveTextStyles.bodyLarge(context),
                  ),
                  Text(
                    '15,000 target',
                    style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: Spacing.sm),
              LinearProgressIndicator(
                value: 0.836, // 12,547 / 15,000
                backgroundColor: Theme.of(context).colorScheme.outline.withOpacity(0.2),
                valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: Spacing.xs),
              Text(
                '83.6% of annual target achieved',
                style: AdaptiveTextStyles.bodySmall(context).copyWith(
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  
  /// Build impact breakdown
  Widget _buildImpactBreakdown(BuildContext context) {
    final impactCategories = [
      {'name': 'Healthcare', 'count': 5670, 'percentage': 45.2, 'color': Colors.red, 'icon': Icons.local_hospital},
      {'name': 'Education', 'count': 3140, 'percentage': 25.0, 'color': Colors.blue, 'icon': Icons.school},
      {'name': 'Clean Water', 'count': 2200, 'percentage': 17.5, 'color': Colors.cyan, 'icon': Icons.water_drop},
      {'name': 'Environment', 'count': 1537, 'percentage': 12.3, 'color': Colors.green, 'icon': Icons.eco},
    ];
    
    return Container(
      padding: const EdgeInsets.all(Spacing.md),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Impact by Category',
            style: AdaptiveTextStyles.titleMedium(context).copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          AdaptiveSpacing.verticalMedium(),
          
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: PlatformDetector.isMobile ? 2 : 4,
              childAspectRatio: PlatformDetector.isMobile ? 1.2 : 1.0,
              mainAxisSpacing: Spacing.sm,
              crossAxisSpacing: Spacing.sm,
            ),
            itemCount: impactCategories.length,
            itemBuilder: (context, index) {
              final category = impactCategories[index];
              return _buildCategoryItem(
                context,
                category['name'] as String,
                category['count'] as int,
                category['percentage'] as double,
                category['color'] as Color,
                category['icon'] as IconData,
              );
            },
          ),
        ],
      ),
    );
  }
  
  /// Build individual category item
  Widget _buildCategoryItem(
    BuildContext context,
    String name,
    int count,
    double percentage,
    Color color,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.all(Spacing.sm),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 24),
          AdaptiveSpacing.verticalSmall(),
          Text(
            count.toString(),
            style: AdaptiveTextStyles.titleMedium(context).copyWith(
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            name,
            style: AdaptiveTextStyles.bodySmall(context),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            '${percentage.toStringAsFixed(1)}%',
            style: AdaptiveTextStyles.bodySmall(context).copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
  
  /// Build detailed metrics (only shown when showDetailed is true)
  Widget _buildDetailedMetrics(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Spacing.md),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Detailed Impact Metrics',
            style: AdaptiveTextStyles.titleMedium(context).copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          AdaptiveSpacing.verticalMedium(),
          
          Row(
            children: [
              Expanded(
                child: _buildDetailMetric(
                  context,
                  'CO₂ Reduced',
                  '2,340 tons',
                  '+23.1%',
                  Colors.green,
                  Icons.co2,
                ),
              ),
              const SizedBox(width: Spacing.sm),
              Expanded(
                child: _buildDetailMetric(
                  context,
                  'Jobs Created',
                  '1,250',
                  '+8.7%',
                  Colors.orange,
                  Icons.work,
                ),
              ),
              const SizedBox(width: Spacing.sm),
              Expanded(
                child: _buildDetailMetric(
                  context,
                  'Communities',
                  '45',
                  '+12.5%',
                  Colors.purple,
                  Icons.groups,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  
  /// Build detailed metric item
  Widget _buildDetailMetric(
    BuildContext context,
    String title,
    String value,
    String change,
    Color color,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.all(Spacing.sm),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 20),
          AdaptiveSpacing.verticalSmall(),
          Text(
            value,
            style: AdaptiveTextStyles.titleSmall(context).copyWith(
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            title,
            style: AdaptiveTextStyles.bodySmall(context),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              change,
              style: AdaptiveTextStyles.bodySmall(context).copyWith(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 9,
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  /// Get timeframe label for display
  String _getTimeframeLabel(String timeframe) {
    switch (timeframe) {
      case '1M':
        return 'Last 30 days';
      case '3M':
        return 'Last 3 months';
      case '6M':
        return 'Last 6 months';
      case '12M':
        return 'Last 12 months';
      case 'ALL':
        return 'All time';
      default:
        return 'Last 12 months';
    }
  }
  
  /// Refresh impact data
  void _refreshData() {
    // Implement data refresh functionality
  }
}