import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/constants/spacing.dart';

/// Insights summary card showing AI-generated business insights
class InsightsSummaryCard extends ConsumerWidget {
  final String timeframe;
  final bool showDetailed;
  
  const InsightsSummaryCard({
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
            _buildInsightsList(context),
            if (showDetailed) ...[
              AdaptiveSpacing.verticalLarge(),
              _buildInsightsAnalysis(context),
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
          Icons.lightbulb,
          color: Theme.of(context).colorScheme.primary,
          size: 24,
        ),
        const SizedBox(width: Spacing.sm),
        Text(
          'AI Insights & Recommendations',
          style: AdaptiveTextStyles.titleMedium(context),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.purple.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            'AI POWERED',
            style: AdaptiveTextStyles.bodySmall(context).copyWith(
              color: Colors.purple,
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          ),
        ),
      ],
    );
  }
  
  /// Build insights list
  Widget _buildInsightsList(BuildContext context) {
    final insights = _getMockInsights();
    
    return Column(
      children: insights.take(showDetailed ? insights.length : 3).map((insight) {
        return _buildInsightItem(context, insight);
      }).toList(),
    );
  }
  
  /// Build individual insight item
  Widget _buildInsightItem(BuildContext context, Map<String, dynamic> insight) {
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
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: (insight['color'] as Color).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Icon(
                  insight['icon'] as IconData,
                  size: 16,
                  color: insight['color'] as Color,
                ),
              ),
              const SizedBox(width: Spacing.sm),
              Expanded(
                child: Text(
                  insight['title'] as String,
                  style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              _buildPriorityChip(context, insight['priority'] as String),
            ],
          ),
          
          AdaptiveSpacing.verticalSmall(),
          
          Text(
            insight['description'] as String,
            style: AdaptiveTextStyles.bodySmall(context).copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
            ),
          ),
          
          if (insight['actions'] != null) ...[
            AdaptiveSpacing.verticalSmall(),
            Wrap(
              spacing: Spacing.xs,
              runSpacing: Spacing.xs,
              children: (insight['actions'] as List<String>).map((action) {
                return Chip(
                  label: Text(
                    action,
                    style: AdaptiveTextStyles.bodySmall(context).copyWith(
                      fontSize: 11,
                    ),
                  ),
                  backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                  visualDensity: VisualDensity.compact,
                );
              }).toList(),
            ),
          ],
          
          AdaptiveSpacing.verticalSmall(),
          
          Row(
            children: [
              Text(
                'Confidence: ${insight['confidence']}%',
                style: AdaptiveTextStyles.bodySmall(context).copyWith(
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () => _viewInsightDetails(insight),
                child: const Text('View Details'),
              ),
            ],
          ),
        ],
      ),
    );
  }
  
  /// Build priority chip
  Widget _buildPriorityChip(BuildContext context, String priority) {
    Color color;
    switch (priority.toLowerCase()) {
      case 'critical':
        color = Colors.red;
        break;
      case 'high':
        color = Colors.orange;
        break;
      case 'medium':
        color = Colors.blue;
        break;
      case 'low':
        color = Colors.grey;
        break;
      default:
        color = Colors.grey;
    }
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        priority.toUpperCase(),
        style: AdaptiveTextStyles.bodySmall(context).copyWith(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: 9,
        ),
      ),
    );
  }
  
  /// Build insights analysis (detailed view only)
  Widget _buildInsightsAnalysis(BuildContext context) {
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
            'Insights Analysis',
            style: AdaptiveTextStyles.titleSmall(context),
          ),
          AdaptiveSpacing.verticalMedium(),
          
          Row(
            children: [
              Expanded(
                child: _buildAnalysisMetric(context, 'Total Insights', '47', Colors.blue),
              ),
              Expanded(
                child: _buildAnalysisMetric(context, 'Implemented', '23', Colors.green),
              ),
              Expanded(
                child: _buildAnalysisMetric(context, 'Pending', '18', Colors.orange),
              ),
              Expanded(
                child: _buildAnalysisMetric(context, 'Critical', '6', Colors.red),
              ),
            ],
          ),
          
          AdaptiveSpacing.verticalMedium(),
          
          Text(
            'Top Recommendation',
            style: AdaptiveTextStyles.bodyMedium(context).copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Focus on optimizing customer acquisition channels for improved ROI performance',
            style: AdaptiveTextStyles.bodySmall(context).copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }
  
  /// Build analysis metric
  Widget _buildAnalysisMetric(BuildContext context, String label, String value, Color color) {
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
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
  
  /// Get mock insights data
  List<Map<String, dynamic>> _getMockInsights() {
    return [
      {
        'title': 'Revenue Growth Opportunity',
        'description': 'Customer acquisition cost has decreased by 15%, suggesting optimal time to scale marketing efforts',
        'priority': 'High',
        'confidence': 87,
        'icon': Icons.trending_up,
        'color': Colors.green,
        'actions': ['Increase Marketing Budget', 'Launch New Campaign'],
      },
      {
        'title': 'Operational Efficiency Alert',
        'description': 'Project delivery times show improvement potential in resource allocation',
        'priority': 'Medium',
        'confidence': 73,
        'icon': Icons.speed,
        'color': Colors.blue,
        'actions': ['Review Resource Allocation', 'Optimize Workflow'],
      },
      {
        'title': 'Risk Management Warning',
        'description': 'Compliance score trends suggest need for immediate attention to regulatory requirements',
        'priority': 'Critical',
        'confidence': 94,
        'icon': Icons.warning,
        'color': Colors.red,
        'actions': ['Review Compliance', 'Schedule Audit'],
      },
      {
        'title': 'Customer Satisfaction Trend',
        'description': 'User engagement metrics indicate high satisfaction with recent feature releases',
        'priority': 'Low',
        'confidence': 82,
        'icon': Icons.sentiment_satisfied,
        'color': Colors.orange,
        'actions': ['Feature Feedback', 'User Survey'],
      },
      {
        'title': 'Investment Performance',
        'description': 'Portfolio diversification analysis suggests rebalancing for improved risk profile',
        'priority': 'Medium',
        'confidence': 78,
        'icon': Icons.account_balance_wallet,
        'color': Colors.purple,
        'actions': ['Portfolio Review', 'Risk Assessment'],
      },
    ];
  }
  
  /// View insight details
  void _viewInsightDetails(Map<String, dynamic> insight) {
    // Navigate to detailed insight view
  }
}