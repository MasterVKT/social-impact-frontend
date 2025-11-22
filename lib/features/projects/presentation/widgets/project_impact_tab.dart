import 'package:flutter/material.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/constants/spacing.dart';
import '../../domain/entities/project.dart';

/// Impact tab showing project impact metrics and outcomes
class ProjectImpactTab extends StatelessWidget {
  final Project project;

  const ProjectImpactTab({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Impact overview
          AdaptiveCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Expected Social Impact',
                  style: AdaptiveTextStyles.titleLarge(context),
                ),
                const AdaptiveSpacing.vertical(size: SpacingSize.medium),
                Text(
                  'This project aims to create measurable positive impact in the following areas:',
                  style: AdaptiveTextStyles.bodyLarge(context),
                ),
              ],
            ),
          ),
          const AdaptiveSpacing.vertical(size: SpacingSize.large),

          // Category-based impact
          _buildCategoryImpact(context),
          const AdaptiveSpacing.vertical(size: SpacingSize.large),

          // Milestones impact
          _buildMilestonesImpact(context),
          const AdaptiveSpacing.vertical(size: SpacingSize.large),

          // Funding allocation (placeholder for future)
          _buildFundingAllocation(context),
        ],
      ),
    );
  }

  Widget _buildCategoryImpact(BuildContext context) {
    final impactDescription = _getCategoryImpactDescription(project.category);

    return AdaptiveCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                _getCategoryIcon(project.category),
                color: Theme.of(context).colorScheme.primary,
              ),
              const AdaptiveSpacing.horizontal(size: SpacingSize.small),
              Text(
                project.category.displayName,
                style: AdaptiveTextStyles.titleMedium(context),
              ),
            ],
          ),
          const AdaptiveSpacing.vertical(size: SpacingSize.medium),
          Text(
            impactDescription,
            style: AdaptiveTextStyles.bodyMedium(context),
          ),
        ],
      ),
    );
  }

  Widget _buildMilestonesImpact(BuildContext context) {
    if (project.milestones.isEmpty) {
      return const SizedBox.shrink();
    }

    final completedCount = project.milestones
        .where((m) => m.status == MilestoneStatus.completed)
        .length;
    final totalCount = project.milestones.length;
    final progress = totalCount > 0 ? (completedCount / totalCount) * 100 : 0.0;

    return AdaptiveCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Implementation Progress',
            style: AdaptiveTextStyles.titleMedium(context),
          ),
          const AdaptiveSpacing.vertical(size: SpacingSize.medium),

          // Progress bar
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: progress / 100,
              minHeight: 12,
              backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          const AdaptiveSpacing.vertical(size: SpacingSize.small),

          Text(
            '$completedCount of $totalCount milestones completed (${progress.toStringAsFixed(1)}%)',
            style: AdaptiveTextStyles.bodyMedium(context),
          ),
          const AdaptiveSpacing.vertical(size: SpacingSize.medium),

          // Completed milestones list
          if (completedCount > 0) ...[
            Text(
              'Completed Milestones:',
              style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const AdaptiveSpacing.vertical(size: SpacingSize.small),
            ...project.milestones
                .where((m) => m.status == MilestoneStatus.completed)
                .map((milestone) => Padding(
                      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                      child: Row(
                        children: [
                          const Icon(Icons.check_circle,
                            size: 16,
                            color: Colors.green,
                          ),
                          const AdaptiveSpacing.horizontal(
                            size: SpacingSize.small,
                          ),
                          Expanded(
                            child: Text(
                              milestone.title,
                              style: AdaptiveTextStyles.bodySmall(context),
                            ),
                          ),
                        ],
                      ),
                    ))
                .toList(),
          ],
        ],
      ),
    );
  }

  Widget _buildFundingAllocation(BuildContext context) {
    return AdaptiveCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Funding Allocation',
            style: AdaptiveTextStyles.titleMedium(context),
          ),
          const AdaptiveSpacing.vertical(size: SpacingSize.medium),

          // Milestone funding breakdown
          if (project.milestones.any((m) => m.fundingRequired != null)) ...[
            ...project.milestones
                .where((m) => m.fundingRequired != null)
                .map((milestone) => Padding(
                      padding: const EdgeInsets.only(bottom: AppSpacing.md),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              milestone.title,
                              style: AdaptiveTextStyles.bodyMedium(context),
                            ),
                          ),
                          Text(
                            '€${milestone.fundingRequired!.toStringAsFixed(0)}',
                            style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ))
                .toList(),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: AdaptiveTextStyles.titleSmall(context),
                ),
                Text(
                  '€${project.fundingGoal.toStringAsFixed(0)}',
                  style: AdaptiveTextStyles.titleSmall(context).copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ] else ...[
            Text(
              'Detailed funding allocation will be available once milestones are finalized.',
              style: AdaptiveTextStyles.bodyMedium(context),
            ),
          ],
        ],
      ),
    );
  }

  IconData _getCategoryIcon(ProjectCategory category) {
    switch (category) {
      case ProjectCategory.education:
        return Icons.school;
      case ProjectCategory.healthcare:
        return Icons.local_hospital;
      case ProjectCategory.environment:
        return Icons.eco;
      case ProjectCategory.poverty:
        return Icons.volunteer_activism;
      case ProjectCategory.infrastructure:
        return Icons.construction;
      case ProjectCategory.agriculture:
        return Icons.agriculture;
      case ProjectCategory.technology:
        return Icons.computer;
      case ProjectCategory.waterSanitation:
        return Icons.water_drop;
      case ProjectCategory.cleanEnergy:
        return Icons.wb_sunny;
      case ProjectCategory.financialInclusion:
        return Icons.account_balance;
    }
  }

  String _getCategoryImpactDescription(ProjectCategory category) {
    switch (category) {
      case ProjectCategory.education:
        return 'This education project will improve access to quality learning opportunities and help build skills for future success.';
      case ProjectCategory.healthcare:
        return 'This healthcare project will improve health outcomes and provide better access to medical services for underserved communities.';
      case ProjectCategory.environment:
        return 'This environmental project will protect natural ecosystems and promote sustainable practices for a healthier planet.';
      case ProjectCategory.poverty:
        return 'This poverty alleviation project will help families build economic resilience and improve their quality of life.';
      case ProjectCategory.infrastructure:
        return 'This infrastructure project will build essential facilities that support community development and economic growth.';
      case ProjectCategory.agriculture:
        return 'This agricultural project will improve food security and support sustainable farming practices.';
      case ProjectCategory.technology:
        return 'This technology project will leverage innovation to solve social challenges and improve lives.';
      case ProjectCategory.waterSanitation:
        return 'This water and sanitation project will provide clean water access and improve public health outcomes.';
      case ProjectCategory.cleanEnergy:
        return 'This clean energy project will reduce carbon emissions and provide sustainable power solutions.';
      case ProjectCategory.financialInclusion:
        return 'This financial inclusion project will expand access to financial services and economic opportunities.';
    }
  }
}
