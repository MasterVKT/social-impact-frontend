import 'package:flutter/material.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/constants/spacing.dart';
import '../../domain/entities/project.dart';

/// Contributors tab showing project backers and supporters
class ProjectContributorsTab extends StatelessWidget {
  final Project project;

  const ProjectContributorsTab({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: Fetch actual contributors from contributions module
    // For now, show placeholder state
    return _buildPlaceholderState(context);
  }

  Widget _buildPlaceholderState(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Contribution stats placeholder
          AdaptiveCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Contribution Statistics',
                  style: AdaptiveTextStyles.titleLarge(context),
                ),
                const AdaptiveSpacing.vertical(size: SpacingSize.large),

                // Stats grid
                Row(
                  children: [
                    Expanded(
                      child: _buildStatCard(
                        context,
                        '0',
                        'Total Contributors',
                        Icons.people,
                      ),
                    ),
                    const AdaptiveSpacing.horizontal(size: SpacingSize.medium),
                    Expanded(
                      child: _buildStatCard(
                        context,
                        '€0',
                        'Average Contribution',
                        Icons.euro,
                      ),
                    ),
                  ],
                ),
                const AdaptiveSpacing.vertical(size: SpacingSize.medium),
                Row(
                  children: [
                    Expanded(
                      child: _buildStatCard(
                        context,
                        '€0',
                        'Largest Contribution',
                        Icons.star,
                      ),
                    ),
                    const AdaptiveSpacing.horizontal(size: SpacingSize.medium),
                    Expanded(
                      child: _buildStatCard(
                        context,
                        '0%',
                        'Progress',
                        Icons.trending_up,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const AdaptiveSpacing.vertical(size: SpacingSize.large),

          // Empty state
          AdaptiveCard(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.xl),
                child: Column(
                  children: [
                    Icon(
                      Icons.people_outline,
                      size: 64,
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    const AdaptiveSpacing.vertical(size: SpacingSize.medium),
                    Text(
                      'No Contributors Yet',
                      style: AdaptiveTextStyles.titleLarge(context),
                    ),
                    const AdaptiveSpacing.vertical(size: SpacingSize.small),
                    Text(
                      project.status == ProjectStatus.fundingActive
                          ? 'Be the first to support this project!'
                          : 'Contributors will appear here once funding is active.',
                      style: AdaptiveTextStyles.bodyMedium(context),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Note about future implementation
          const AdaptiveSpacing.vertical(size: SpacingSize.large),
          Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceVariant,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.info_outline,
                  size: 20,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                const AdaptiveSpacing.horizontal(size: SpacingSize.small),
                Expanded(
                  child: Text(
                    'Contributor details will be displayed here once the Contributions module is integrated.',
                    style: AdaptiveTextStyles.bodySmall(context),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(
    BuildContext context,
    String value,
    String label,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 32,
            color: Theme.of(context).colorScheme.primary,
          ),
          const AdaptiveSpacing.vertical(size: SpacingSize.small),
          Text(
            value,
            style: AdaptiveTextStyles.headlineSmall(context).copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const AdaptiveSpacing.vertical(size: SpacingSize.extraSmall),
          Text(
            label,
            style: AdaptiveTextStyles.bodySmall(context),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // This will be used when contributions module is integrated
  Widget _buildContributorsList(BuildContext context) {
    // TODO: Replace with actual contributors data
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 0,
      itemBuilder: (context, index) {
        return AdaptiveCard(
          margin: const EdgeInsets.only(bottom: AppSpacing.md),
          child: ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: const Text('Contributor Name'),
            subtitle: const Text('€100 • 2 days ago'),
            trailing: IconButton(
              icon: const Icon(Icons.favorite_border),
              onPressed: () {
                // Thank contributor
              },
            ),
          ),
        );
      },
    );
  }
}
