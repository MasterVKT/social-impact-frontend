import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/constants/spacing.dart';
import '../../domain/entities/search_query.dart';

/// Search analytics card showing search performance and insights
class SearchAnalyticsCard extends ConsumerWidget {
  final String query;
  final SearchScope scope;
  
  const SearchAnalyticsCard({
    super.key,
    required this.query,
    required this.scope,
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
            AdaptiveSpacing.verticalMedium(),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: _buildSearchMetrics(context),
                  ),
                  const SizedBox(width: Spacing.lg),
                  Expanded(
                    child: _buildPopularSearches(context),
                  ),
                ],
              ),
            ),
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
          Icons.insights,
          color: Theme.of(context).colorScheme.primary,
          size: 20,
        ),
        const SizedBox(width: Spacing.sm),
        Text(
          'Search Analytics',
          style: AdaptiveTextStyles.titleMedium(context),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            'REAL-TIME',
            style: AdaptiveTextStyles.bodySmall(context).copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          ),
        ),
      ],
    );
  }
  
  /// Build search metrics
  Widget _buildSearchMetrics(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Search Performance',
          style: AdaptiveTextStyles.bodyMedium(context).copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        AdaptiveSpacing.verticalMedium(),
        
        Row(
          children: [
            Expanded(
              child: _buildMetricItem(
                context,
                'Response Time',
                '234ms',
                Icons.speed,
                Colors.green,
                'Excellent',
              ),
            ),
            Expanded(
              child: _buildMetricItem(
                context,
                'Results Found',
                '1,247',
                Icons.search,
                Colors.blue,
                '+15% vs avg',
              ),
            ),
          ],
        ),
        
        const SizedBox(height: Spacing.md),
        
        Row(
          children: [
            Expanded(
              child: _buildMetricItem(
                context,
                'Relevance Score',
                '94.2%',
                Icons.star,
                Colors.orange,
                'High quality',
              ),
            ),
            Expanded(
              child: _buildMetricItem(
                context,
                'Click-through Rate',
                '78.5%',
                Icons.touch_app,
                Colors.purple,
                '+12% today',
              ),
            ),
          ],
        ),
      ],
    );
  }
  
  /// Build metric item
  Widget _buildMetricItem(
    BuildContext context,
    String label,
    String value,
    IconData icon,
    Color color,
    String subtitle,
  ) {
    return Container(
      padding: const EdgeInsets.all(Spacing.sm),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 16),
              const SizedBox(width: Spacing.xs),
              Text(
                label,
                style: AdaptiveTextStyles.bodySmall(context).copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: AdaptiveTextStyles.titleMedium(context).copyWith(
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            subtitle,
            style: AdaptiveTextStyles.bodySmall(context).copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
  
  /// Build popular searches
  Widget _buildPopularSearches(BuildContext context) {
    final popularSearches = [
      {'query': 'renewable energy', 'count': 234, 'trend': '+15%'},
      {'query': 'clean water', 'count': 189, 'trend': '+8%'},
      {'query': 'education', 'count': 156, 'trend': '+12%'},
      {'query': 'healthcare', 'count': 143, 'trend': '+5%'},
      {'query': 'agriculture', 'count': 98, 'trend': '-2%'},
    ];
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Popular Searches Today',
          style: AdaptiveTextStyles.bodyMedium(context).copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        AdaptiveSpacing.verticalMedium(),
        
        Expanded(
          child: ListView.separated(
            itemCount: popularSearches.length,
            separatorBuilder: (context, index) => const SizedBox(height: Spacing.sm),
            itemBuilder: (context, index) {
              final search = popularSearches[index];
              final isPositive = (search['trend'] as String).startsWith('+');
              
              return Container(
                padding: const EdgeInsets.all(Spacing.sm),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                        child: Text(
                          '${index + 1}',
                          style: AdaptiveTextStyles.bodySmall(context).copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
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
                            search['query'] as String,
                            style: AdaptiveTextStyles.bodySmall(context).copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '${search['count']} searches',
                            style: AdaptiveTextStyles.bodySmall(context).copyWith(
                              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      search['trend'] as String,
                      style: AdaptiveTextStyles.bodySmall(context).copyWith(
                        color: isPositive ? Colors.green : Colors.red,
                        fontWeight: FontWeight.w600,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}