import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/widgets/adaptive/adaptive_button.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/constants/spacing.dart';
import '../../../../core/themes/color_scheme.dart';
import '../../domain/entities/project.dart';

/// Funding card showing progress and contribute button
class ProjectFundingCard extends ConsumerWidget {
  final Project project;

  const ProjectFundingCard({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AdaptiveCard(
      elevation: CardElevation.medium,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Funding progress
          Text(
            'Funding Progress',
            style: AdaptiveTextStyles.titleMedium(context),
          ),
          const AdaptiveSpacing.vertical(size: SpacingSize.medium),

          // Progress bar
          _buildProgressBar(context),
          const AdaptiveSpacing.vertical(size: SpacingSize.small),

          // Funding amount
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '€${_formatAmount(project.currentFunding)}',
                style: AdaptiveTextStyles.headlineSmall(context).copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'of €${_formatAmount(project.fundingGoal)}',
                style: AdaptiveTextStyles.bodyMedium(context),
              ),
            ],
          ),
          const AdaptiveSpacing.vertical(size: SpacingSize.small),

          // Progress percentage
          Text(
            '${project.fundingProgress.toStringAsFixed(1)}% funded',
            style: AdaptiveTextStyles.bodySmall(context),
          ),
          const AdaptiveSpacing.vertical(size: SpacingSize.large),

          // Days remaining
          if (project.daysRemaining != null) ...[
            Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  size: 16,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                const AdaptiveSpacing.horizontal(size: SpacingSize.small),
                Text(
                  '${project.daysRemaining} days remaining',
                  style: AdaptiveTextStyles.bodyMedium(context),
                ),
              ],
            ),
            const AdaptiveSpacing.vertical(size: SpacingSize.large),
          ],

          // Contribute button (only show if funding is active)
          if (project.status == ProjectStatus.fundingActive)
            AdaptiveButton(
              onPressed: () => _handleContribute(context, project),
              label: 'Contribute Now',
              buttonType: ButtonType.primary,
              isFullWidth: true,
            ),

          // Status message for non-active projects
          if (project.status != ProjectStatus.fundingActive)
            Container(
              padding: const EdgeInsets.all(AppSpacing.sm),
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
                      _getStatusMessage(project.status),
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

  Widget _buildProgressBar(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: LinearProgressIndicator(
        value: project.fundingProgress / 100,
        minHeight: 12,
        backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
        valueColor: AlwaysStoppedAnimation<Color>(
          Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }

  String _formatAmount(double amount) {
    if (amount >= 1000000) {
      return '${(amount / 1000000).toStringAsFixed(1)}M';
    } else if (amount >= 1000) {
      return '${(amount / 1000).toStringAsFixed(1)}K';
    }
    return amount.toStringAsFixed(0);
  }

  String _getStatusMessage(ProjectStatus status) {
    switch (status) {
      case ProjectStatus.draft:
        return 'This project is still in draft mode.';
      case ProjectStatus.submitted:
      case ProjectStatus.underReview:
        return 'This project is under review.';
      case ProjectStatus.approved:
        return 'This project has been approved and will start accepting contributions soon.';
      case ProjectStatus.fundingComplete:
        return 'This project has reached its funding goal!';
      case ProjectStatus.implementation:
        return 'This project is currently being implemented.';
      case ProjectStatus.completed:
        return 'This project has been completed!';
      case ProjectStatus.suspended:
        return 'This project is currently suspended.';
      case ProjectStatus.cancelled:
        return 'This project has been cancelled.';
      default:
        return '';
    }
  }

  void _handleContribute(BuildContext context, Project project) {
    // Navigate to contribution screen
    context.push('/projects/${project.id}/contribute');
  }
}
