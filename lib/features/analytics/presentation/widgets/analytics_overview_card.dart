import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/constants/spacing.dart';

/// Analytics overview card showing key business metrics summary
class AnalyticsOverviewCard extends ConsumerWidget {
  final String timeframe;
  final String dashboardType;
  
  const AnalyticsOverviewCard({
    super.key,
    required this.timeframe,
    required this.dashboardType,
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
            _buildMetricsSummary(context),
            AdaptiveSpacing.verticalLarge(),
            _buildTrendIndicators(context),
            AdaptiveSpacing.verticalLarge(),
            _buildQuickActions(context),
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
          Icons.dashboard,
          color: Theme.of(context).colorScheme.primary,
          size: 24,
        ),
        const SizedBox(width: Spacing.sm),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${_getDashboardTitle()} Overview',
              style: AdaptiveTextStyles.titleMedium(context),
            ),
            Text(
              _getTimeframeDescription(),
              style: AdaptiveTextStyles.bodySmall(context).copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
              ),
            ),
          ],
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            'LIVE',
            style: AdaptiveTextStyles.bodySmall(context).copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          ),
        ),
      ],
    );
  }
  
  /// Build metrics summary grid
  Widget _buildMetricsSummary(BuildContext context) {
    final metrics = _getMetricsForDashboard();
    
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _getCrossAxisCount(),
        childAspectRatio: 1.8,
        mainAxisSpacing: Spacing.sm,
        crossAxisSpacing: Spacing.sm,
      ),
      itemCount: metrics.length,
      itemBuilder: (context, index) {
        final metric = metrics[index];
        return _buildMetricCard(context, metric);
      },
    );
  }
  
  /// Build individual metric card
  Widget _buildMetricCard(BuildContext context, Map<String, dynamic> metric) {
    final isPositive = (metric['change'] as String).startsWith('+');
    final changeColor = isPositive ? Colors.green : Colors.red;
    
    return Container(
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
              Icon(
                metric['icon'] as IconData,
                color: metric['color'] as Color,
                size: 20,
              ),
              const SizedBox(width: Spacing.sm),
              Expanded(
                child: Text(
                  metric['title'] as String,
                  style: AdaptiveTextStyles.bodySmall(context).copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          AdaptiveSpacing.verticalSmall(),
          Text(
            metric['value'] as String,
            style: AdaptiveTextStyles.titleLarge(context).copyWith(
              fontWeight: FontWeight.bold,
              color: metric['color'] as Color,
            ),
          ),
          const SizedBox(height: 2),
          Row(
            children: [
              Icon(
                isPositive ? Icons.trending_up : Icons.trending_down,
                size: 14,
                color: changeColor,
              ),
              const SizedBox(width: 4),
              Text(
                metric['change'] as String,
                style: AdaptiveTextStyles.bodySmall(context).copyWith(
                  color: changeColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: Spacing.sm),
              Text(
                'vs ${_getPreviousPeriod()}',
                style: AdaptiveTextStyles.bodySmall(context).copyWith(
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  
  /// Build trend indicators
  Widget _buildTrendIndicators(BuildContext context) {
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
            'Key Trends',
            style: AdaptiveTextStyles.titleSmall(context),
          ),
          AdaptiveSpacing.verticalMedium(),
          
          ...(_getTrendsForDashboard().map((trend) {
            return Padding(
              padding: const EdgeInsets.only(bottom: Spacing.sm),
              child: Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: trend['color'] as Color,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: Spacing.sm),
                  Expanded(
                    child: Text(
                      trend['description'] as String,
                      style: AdaptiveTextStyles.bodySmall(context),
                    ),
                  ),
                  Text(
                    trend['impact'] as String,
                    style: AdaptiveTextStyles.bodySmall(context).copyWith(
                      fontWeight: FontWeight.w600,
                      color: trend['color'] as Color,
                    ),
                  ),
                ],
              ),
            );
          })),
        ],
      ),
    );
  }
  
  /// Build quick actions
  Widget _buildQuickActions(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () => _navigateToDetail('performance'),
            icon: const Icon(Icons.trending_up, size: 18),
            label: const Text('View Performance'),
          ),
        ),
        const SizedBox(width: Spacing.sm),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () => _navigateToDetail('insights'),
            icon: const Icon(Icons.lightbulb, size: 18),
            label: const Text('View Insights'),
          ),
        ),
        const SizedBox(width: Spacing.sm),
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () => _generateReport(),
            icon: const Icon(Icons.description, size: 18),
            label: const Text('Generate Report'),
          ),
        ),
      ],
    );
  }
  
  /// Get dashboard title based on type
  String _getDashboardTitle() {
    switch (dashboardType) {
      case 'executive':
        return 'Executive';
      case 'investor':
        return 'Investor';
      case 'project':
        return 'Project';
      case 'compliance':
        return 'Compliance';
      case 'custom':
        return 'Custom';
      default:
        return 'Business';
    }
  }
  
  /// Get timeframe description
  String _getTimeframeDescription() {
    switch (timeframe) {
      case '7d':
        return 'Last 7 days';
      case '30d':
        return 'Last 30 days';
      case '90d':
        return 'Last 90 days';
      case '1y':
        return 'Last 12 months';
      default:
        return 'Current period';
    }
  }
  
  /// Get previous period for comparison
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
  
  /// Get cross axis count for grid
  int _getCrossAxisCount() {
    return 2; // Always 2 columns for better responsive design
  }
  
  /// Get metrics based on dashboard type
  List<Map<String, dynamic>> _getMetricsForDashboard() {
    switch (dashboardType) {
      case 'executive':
        return [
          {
            'title': 'Total Revenue',
            'value': '€2.4M',
            'change': '+12.5%',
            'icon': Icons.euro,
            'color': Colors.green,
          },
          {
            'title': 'Active Projects',
            'value': '47',
            'change': '+8.3%',
            'icon': Icons.work,
            'color': Colors.blue,
          },
          {
            'title': 'Impact Score',
            'value': '94.2',
            'change': '+5.7%',
            'icon': Icons.favorite,
            'color': Colors.purple,
          },
          {
            'title': 'User Growth',
            'value': '15.6K',
            'change': '+23.1%',
            'icon': Icons.people,
            'color': Colors.orange,
          },
        ];
      case 'investor':
        return [
          {
            'title': 'Portfolio Value',
            'value': '€1.8M',
            'change': '+9.2%',
            'icon': Icons.account_balance_wallet,
            'color': Colors.green,
          },
          {
            'title': 'Annual Return',
            'value': '14.7%',
            'change': '+2.3%',
            'icon': Icons.trending_up,
            'color': Colors.blue,
          },
          {
            'title': 'Dividends',
            'value': '€34K',
            'change': '+18.5%',
            'icon': Icons.payments,
            'color': Colors.orange,
          },
          {
            'title': 'Active Investments',
            'value': '23',
            'change': '+4.5%',
            'icon': Icons.business_center,
            'color': Colors.purple,
          },
        ];
      case 'project':
        return [
          {
            'title': 'Project Progress',
            'value': '76%',
            'change': '+12%',
            'icon': Icons.timeline,
            'color': Colors.blue,
          },
          {
            'title': 'Funding Raised',
            'value': '€520K',
            'change': '+8.7%',
            'icon': Icons.monetization_on,
            'color': Colors.green,
          },
          {
            'title': 'Milestones',
            'value': '12/15',
            'change': '+2',
            'icon': Icons.flag,
            'color': Colors.orange,
          },
          {
            'title': 'Team Members',
            'value': '28',
            'change': '+3',
            'icon': Icons.group,
            'color': Colors.purple,
          },
        ];
      case 'compliance':
        return [
          {
            'title': 'Compliance Score',
            'value': '98.5%',
            'change': '+1.2%',
            'icon': Icons.verified_user,
            'color': Colors.green,
          },
          {
            'title': 'Open Issues',
            'value': '3',
            'change': '-2',
            'icon': Icons.warning,
            'color': Colors.orange,
          },
          {
            'title': 'Audits Passed',
            'value': '15/15',
            'change': '+1',
            'icon': Icons.check_circle,
            'color': Colors.blue,
          },
          {
            'title': 'Risk Level',
            'value': 'Low',
            'change': 'Stable',
            'icon': Icons.security,
            'color': Colors.green,
          },
        ];
      default:
        return [
          {
            'title': 'Total Value',
            'value': '€1.2M',
            'change': '+15.3%',
            'icon': Icons.account_balance,
            'color': Colors.blue,
          },
          {
            'title': 'Growth Rate',
            'value': '23.4%',
            'change': '+5.1%',
            'icon': Icons.trending_up,
            'color': Colors.green,
          },
          {
            'title': 'Active Users',
            'value': '8.7K',
            'change': '+12.8%',
            'icon': Icons.people,
            'color': Colors.orange,
          },
          {
            'title': 'Efficiency',
            'value': '87%',
            'change': '+3.2%',
            'icon': Icons.speed,
            'color': Colors.purple,
          },
        ];
    }
  }
  
  /// Get trends based on dashboard type
  List<Map<String, dynamic>> _getTrendsForDashboard() {
    switch (dashboardType) {
      case 'executive':
        return [
          {
            'description': 'Revenue growth accelerating with new partnerships',
            'impact': 'High',
            'color': Colors.green,
          },
          {
            'description': 'Impact scores reaching record highs this quarter',
            'impact': 'Medium',
            'color': Colors.blue,
          },
          {
            'description': 'User engagement up 15% with new features',
            'impact': 'Medium',
            'color': Colors.orange,
          },
        ];
      case 'investor':
        return [
          {
            'description': 'Portfolio diversification improving risk profile',
            'impact': 'High',
            'color': Colors.green,
          },
          {
            'description': 'ESG investments outperforming traditional assets',
            'impact': 'High',
            'color': Colors.blue,
          },
          {
            'description': 'Dividend payments ahead of schedule',
            'impact': 'Medium',
            'color': Colors.orange,
          },
        ];
      case 'project':
        return [
          {
            'description': 'Project milestones being achieved ahead of schedule',
            'impact': 'High',
            'color': Colors.green,
          },
          {
            'description': 'Funding commitments exceeding initial targets',
            'impact': 'High',
            'color': Colors.blue,
          },
          {
            'description': 'Team productivity increasing with new tools',
            'impact': 'Medium',
            'color': Colors.orange,
          },
        ];
      case 'compliance':
        return [
          {
            'description': 'All regulatory requirements met for Q4',
            'impact': 'High',
            'color': Colors.green,
          },
          {
            'description': 'Risk assessment scores improving consistently',
            'impact': 'Medium',
            'color': Colors.blue,
          },
          {
            'description': 'Audit preparation well ahead of schedule',
            'impact': 'Low',
            'color': Colors.orange,
          },
        ];
      default:
        return [
          {
            'description': 'Overall business metrics trending positively',
            'impact': 'High',
            'color': Colors.green,
          },
          {
            'description': 'Operational efficiency gains from automation',
            'impact': 'Medium',
            'color': Colors.blue,
          },
          {
            'description': 'Customer satisfaction reaching new benchmarks',
            'impact': 'Medium',
            'color': Colors.orange,
          },
        ];
    }
  }
  
  /// Navigate to detail view
  void _navigateToDetail(String section) {
    // Navigate to detailed analytics section
  }
  
  /// Generate analytics report
  void _generateReport() {
    // Generate comprehensive analytics report
  }
}