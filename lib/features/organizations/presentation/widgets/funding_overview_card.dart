import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/constants/spacing.dart';

/// Funding overview card showing organization's funding statistics
class FundingOverviewCard extends ConsumerWidget {
  final bool showDetailed;
  
  const FundingOverviewCard({
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
            _buildFundingMetrics(context),
            AdaptiveSpacing.verticalLarge(),
            _buildFundingChart(context),
            if (showDetailed) ...[
              AdaptiveSpacing.verticalLarge(),
              _buildFundingBreakdown(context),
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
          Icons.attach_money,
          color: Theme.of(context).colorScheme.primary,
          size: 24,
        ),
        const SizedBox(width: Spacing.sm),
        Text(
          'Funding Overview',
          style: AdaptiveTextStyles.titleMedium(context),
        ),
        const Spacer(),
        PopupMenuButton<String>(
          onSelected: _handleAction,
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'export',
              child: Text('Export Data'),
            ),
            const PopupMenuItem(
              value: 'refresh',
              child: Text('Refresh'),
            ),
          ],
          child: const Icon(Icons.more_vert),
        ),
      ],
    );
  }
  
  /// Build funding metrics summary
  Widget _buildFundingMetrics(BuildContext context) {
    return Column(
      children: [
        // Total funding raised
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total Funding Raised',
              style: AdaptiveTextStyles.bodyLarge(context),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '€245,750',
                  style: AdaptiveTextStyles.headlineMedium(context).copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Text(
                  '+€45,200 this month',
                  style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                    color: Colors.green,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
        
        AdaptiveSpacing.verticalMedium(),
        
        // Funding target progress
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Annual Target',
                  style: AdaptiveTextStyles.bodyMedium(context),
                ),
                Text(
                  '€300,000',
                  style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: Spacing.sm),
            LinearProgressIndicator(
              value: 0.82, // 82% of annual target
              backgroundColor: Theme.of(context).colorScheme.outline.withOpacity(0.2),
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: Spacing.xs),
            Text(
              '82% of annual target achieved',
              style: AdaptiveTextStyles.bodySmall(context).copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
              ),
            ),
          ],
        ),
      ],
    );
  }
  
  /// Build funding chart (simplified visualization)
  Widget _buildFundingChart(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Funding Trends (Last 6 Months)',
          style: AdaptiveTextStyles.titleSmall(context),
        ),
        AdaptiveSpacing.verticalMedium(),
        
        // Simple bar chart representation
        SizedBox(
          height: 120,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildChartBar(context, 'Jan', 0.3, '€15K'),
              _buildChartBar(context, 'Feb', 0.5, '€25K'),
              _buildChartBar(context, 'Mar', 0.4, '€20K'),
              _buildChartBar(context, 'Apr', 0.7, '€35K'),
              _buildChartBar(context, 'May', 0.8, '€40K'),
              _buildChartBar(context, 'Jun', 0.9, '€45K'),
            ],
          ),
        ),
      ],
    );
  }
  
  /// Build individual chart bar
  Widget _buildChartBar(BuildContext context, String month, double value, String amount) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          amount,
          style: AdaptiveTextStyles.bodySmall(context).copyWith(
            fontSize: 10,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          width: 24,
          height: 80 * value,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.8),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          month,
          style: AdaptiveTextStyles.bodySmall(context).copyWith(
            fontSize: 10,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
          ),
        ),
      ],
    );
  }
  
  /// Build funding breakdown (only shown in detailed view)
  Widget _buildFundingBreakdown(BuildContext context) {
    final breakdownData = [
      {'source': 'Individual Investors', 'amount': 147500, 'percentage': 60.0, 'color': Colors.blue},
      {'source': 'Institutional Funding', 'amount': 73750, 'percentage': 30.0, 'color': Colors.green},
      {'source': 'Government Grants', 'amount': 24500, 'percentage': 10.0, 'color': Colors.orange},
    ];
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Funding Sources',
          style: AdaptiveTextStyles.titleSmall(context),
        ),
        AdaptiveSpacing.verticalMedium(),
        
        ...breakdownData.map((source) => _buildBreakdownItem(
          context, 
          source['source'] as String, 
          source['amount'] as int, 
          source['percentage'] as double,
          source['color'] as Color,
        )),
      ],
    );
  }
  
  /// Build funding breakdown item
  Widget _buildBreakdownItem(
    BuildContext context, 
    String source, 
    int amount, 
    double percentage,
    Color color,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Spacing.sm),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: Spacing.sm),
              Expanded(
                child: Text(
                  source,
                  style: AdaptiveTextStyles.bodyMedium(context),
                ),
              ),
              Text(
                '€${(amount / 1000).toStringAsFixed(0)}K',
                style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: Spacing.sm),
              Text(
                '${percentage.toStringAsFixed(0)}%',
                style: AdaptiveTextStyles.bodySmall(context).copyWith(
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          LinearProgressIndicator(
            value: percentage / 100,
            backgroundColor: Theme.of(context).colorScheme.outline.withOpacity(0.1),
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        ],
      ),
    );
  }
  
  /// Handle header actions
  void _handleAction(String action) {
    switch (action) {
      case 'export':
        // Export funding data
        break;
      case 'refresh':
        // Refresh funding data
        break;
    }
  }
}