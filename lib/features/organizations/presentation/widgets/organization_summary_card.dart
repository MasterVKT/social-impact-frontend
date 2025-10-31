import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/constants/spacing.dart';
import '../../../../core/utils/platform_detector.dart';

/// Organization summary card showing key metrics and information
class OrganizationSummaryCard extends ConsumerWidget {
  const OrganizationSummaryCard({super.key});

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
            _buildOrganizationInfo(context),
            AdaptiveSpacing.verticalLarge(),
            _buildMetricsGrid(context),
            AdaptiveSpacing.verticalMedium(),
            _buildQuickActions(context),
          ],
        ),
      ),
    );
  }

  /// Build card header with organization logo and basic info
  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        // Organization logo placeholder
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            Icons.business,
            color: Theme.of(context).colorScheme.primary,
            size: 32,
          ),
        ),

        const SizedBox(width: Spacing.md),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Green Future Initiative',
                style: AdaptiveTextStyles.titleLarge(context).copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'VERIFIED',
                      style: AdaptiveTextStyles.bodySmall(context).copyWith(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                  ),
                  const SizedBox(width: Spacing.sm),
                  Text(
                    'NGO • Environmental',
                    style: AdaptiveTextStyles.bodySmall(context).copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        // Settings button
        IconButton(
          onPressed: () => _navigateToSettings(context),
          icon: const Icon(Icons.settings_outlined),
          tooltip: 'Organization Settings',
        ),
      ],
    );
  }

  /// Build organization information section
  Widget _buildOrganizationInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About Organization',
          style: AdaptiveTextStyles.titleMedium(context),
        ),
        AdaptiveSpacing.verticalSmall(),
        Text(
          'Green Future Initiative is dedicated to creating sustainable environmental solutions through community-driven projects. We focus on clean energy, water conservation, and reforestation efforts across developing regions.',
          style: AdaptiveTextStyles.bodyMedium(context).copyWith(
            height: 1.4,
          ),
        ),
        AdaptiveSpacing.verticalSmall(),

        // Contact information
        Row(
          children: [
            Icon(
              Icons.location_on_outlined,
              size: 16,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
            ),
            const SizedBox(width: 4),
            Text(
              'Nairobi, Kenya',
              style: AdaptiveTextStyles.bodySmall(context).copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
              ),
            ),
            const SizedBox(width: Spacing.md),
            Icon(
              Icons.web,
              size: 16,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
            ),
            const SizedBox(width: 4),
            Text(
              'greenfuture.org',
              style: AdaptiveTextStyles.bodySmall(context).copyWith(
                color: Theme.of(context).colorScheme.primary,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// Build metrics grid
  Widget _buildMetricsGrid(BuildContext context) {
    final metrics = [
      {
        'title': 'Active Projects',
        'value': '8',
        'icon': Icons.folder,
        'color': Colors.blue
      },
      {
        'title': 'Total Funding',
        'value': '€245K',
        'icon': Icons.attach_money,
        'color': Colors.green
      },
      {
        'title': 'Beneficiaries',
        'value': '12.5K',
        'icon': Icons.people,
        'color': Colors.orange
      },
      {
        'title': 'Success Rate',
        'value': '94%',
        'icon': Icons.trending_up,
        'color': Colors.purple
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: PlatformDetector.isMobile ? 2 : 4,
        childAspectRatio: PlatformDetector.isMobile ? 1.3 : 1.1,
        mainAxisSpacing: Spacing.sm,
        crossAxisSpacing: Spacing.sm,
      ),
      itemCount: metrics.length,
      itemBuilder: (context, index) {
        final metric = metrics[index];
        return Container(
          padding: const EdgeInsets.all(Spacing.md),
          decoration: BoxDecoration(
            color: (metric['color'] as Color).withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: (metric['color'] as Color).withOpacity(0.2),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                metric['icon'] as IconData,
                color: metric['color'] as Color,
                size: 24,
              ),
              AdaptiveSpacing.verticalSmall(),
              Text(
                metric['value'] as String,
                style: AdaptiveTextStyles.titleLarge(context).copyWith(
                  fontWeight: FontWeight.bold,
                  color: metric['color'] as Color,
                ),
              ),
              Text(
                metric['title'] as String,
                style: AdaptiveTextStyles.bodySmall(context),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        );
      },
    );
  }

  /// Build quick action buttons
  Widget _buildQuickActions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Actions',
          style: AdaptiveTextStyles.titleMedium(context),
        ),
        AdaptiveSpacing.verticalSmall(),
        if (PlatformDetector.isMobile)
          Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () => _navigateToCreateProject(context),
                  icon: const Icon(Icons.add, size: 16),
                  label: const Text('New Project'),
                  style: OutlinedButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    textStyle: const TextStyle(fontSize: 12),
                  ),
                ),
              ),
              const SizedBox(height: Spacing.sm),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () => _navigateToReports(context),
                      icon: const Icon(Icons.assessment, size: 16),
                      label: const Text('Reports'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        textStyle: const TextStyle(fontSize: 11),
                      ),
                    ),
                  ),
                  const SizedBox(width: Spacing.sm),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () => _navigateToImpact(context),
                      icon: const Icon(Icons.eco, size: 16),
                      label: const Text('Impact'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        textStyle: const TextStyle(fontSize: 11),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        else
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => _navigateToCreateProject(context),
                  icon: const Icon(Icons.add, size: 18),
                  label: const Text('New Project'),
                ),
              ),
              const SizedBox(width: Spacing.sm),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => _navigateToReports(context),
                  icon: const Icon(Icons.assessment, size: 18),
                  label: const Text('Reports'),
                ),
              ),
              const SizedBox(width: Spacing.sm),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => _navigateToImpact(context),
                  icon: const Icon(Icons.eco, size: 18),
                  label: const Text('Impact'),
                ),
              ),
            ],
          ),
      ],
    );
  }

  /// Navigate to organization settings
  void _navigateToSettings(BuildContext context) {
    // Navigate to organization settings
  }

  /// Navigate to create new project
  void _navigateToCreateProject(BuildContext context) {
    // Navigate to create project screen
  }

  /// Navigate to reports
  void _navigateToReports(BuildContext context) {
    // Navigate to reports screen
  }

  /// Navigate to impact metrics
  void _navigateToImpact(BuildContext context) {
    // Navigate to impact metrics screen
  }
}
