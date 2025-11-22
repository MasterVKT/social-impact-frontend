import 'package:flutter/material.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/constants/spacing.dart';
import '../../domain/entities/project.dart';

/// Milestones tab showing project milestones timeline
class ProjectMilestonesTab extends StatelessWidget {
  final Project project;

  const ProjectMilestonesTab({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    if (project.milestones.isEmpty) {
      return _buildEmptyState(context);
    }

    return ListView.builder(
      padding: const EdgeInsets.all(AppSpacing.lg),
      itemCount: project.milestones.length,
      itemBuilder: (context, index) {
        final milestone = project.milestones[index];
        final isLast = index == project.milestones.length - 1;

        return _buildMilestoneCard(context, milestone, isLast);
      },
    );
  }

  Widget _buildMilestoneCard(
    BuildContext context,
    ProjectMilestone milestone,
    bool isLast,
  ) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: isLast ? 0 : AppSpacing.md,
      ),
      child: AdaptiveCard(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Timeline indicator
            Column(
              children: [
                _buildStatusIcon(context, milestone.status),
                if (!isLast) ...[
                  Container(
                    width: 2,
                    height: 60,
                    color: Theme.of(context).colorScheme.outlineVariant,
                    margin: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
                  ),
                ],
              ],
            ),
            const AdaptiveSpacing.horizontal(size: SpacingSize.medium),

            // Milestone content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Status badge
                  _buildStatusBadge(context, milestone.status),
                  const AdaptiveSpacing.vertical(size: SpacingSize.small),

                  // Title
                  Text(
                    milestone.title,
                    style: AdaptiveTextStyles.titleMedium(context),
                  ),
                  const AdaptiveSpacing.vertical(size: SpacingSize.small),

                  // Description
                  Text(
                    milestone.description,
                    style: AdaptiveTextStyles.bodyMedium(context),
                  ),
                  const AdaptiveSpacing.vertical(size: SpacingSize.medium),

                  // Metadata
                  Wrap(
                    spacing: AppSpacing.md,
                    runSpacing: AppSpacing.sm,
                    children: [
                      _buildMetaChip(
                        context,
                        Icons.calendar_today,
                        'Target: ${_formatDate(milestone.targetDate)}',
                        milestone.isOverdue ? Colors.red : null,
                      ),
                      if (milestone.fundingRequired != null)
                        _buildMetaChip(
                          context,
                          Icons.euro,
                          '€${milestone.fundingRequired!.toStringAsFixed(0)}',
                        ),
                      if (milestone.completedDate != null)
                        _buildMetaChip(
                          context,
                          Icons.check_circle,
                          'Completed: ${_formatDate(milestone.completedDate!)}',
                          Colors.green,
                        ),
                    ],
                  ),

                  // Evidence link (if available)
                  if (milestone.evidenceUrl != null &&
                      milestone.evidenceUrl!.isNotEmpty) ...[
                    const AdaptiveSpacing.vertical(size: SpacingSize.small),
                    TextButton.icon(
                      onPressed: () {
                        // TODO: Open evidence URL
                      },
                      icon: const Icon(Icons.attachment, size: 16),
                      label: const Text('View Evidence'),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusIcon(BuildContext context, MilestoneStatus status) {
    IconData icon;
    Color color;

    switch (status) {
      case MilestoneStatus.completed:
        icon = Icons.check_circle;
        color = Colors.green;
        break;
      case MilestoneStatus.inProgress:
      case MilestoneStatus.submitted:
      case MilestoneStatus.underReview:
        icon = Icons.access_time;
        color = Colors.orange;
        break;
      case MilestoneStatus.delayed:
        icon = Icons.warning;
        color = Colors.red;
        break;
      case MilestoneStatus.rejected:
        icon = Icons.cancel;
        color = Colors.red;
        break;
      default:
        icon = Icons.radio_button_unchecked;
        color = Theme.of(context).colorScheme.outline;
    }

    return Container(
      padding: const EdgeInsets.all(AppSpacing.xs),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: color, size: 24),
    );
  }

  Widget _buildStatusBadge(BuildContext context, MilestoneStatus status) {
    Color backgroundColor;
    Color textColor;

    switch (status) {
      case MilestoneStatus.completed:
        backgroundColor = Colors.green;
        textColor = Colors.white;
        break;
      case MilestoneStatus.inProgress:
      case MilestoneStatus.submitted:
      case MilestoneStatus.underReview:
        backgroundColor = Colors.orange;
        textColor = Colors.white;
        break;
      case MilestoneStatus.delayed:
      case MilestoneStatus.rejected:
        backgroundColor = Colors.red;
        textColor = Colors.white;
        break;
      default:
        backgroundColor = Colors.grey;
        textColor = Colors.white;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        status.displayName,
        style: TextStyle(
          color: textColor,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildMetaChip(
    BuildContext context,
    IconData icon,
    String label, [
    Color? color,
  ]) {
    return Chip(
      avatar: Icon(icon, size: 16, color: color),
      label: Text(
        label,
        style: TextStyle(fontSize: 12, color: color),
      ),
      visualDensity: VisualDensity.compact,
      backgroundColor: color?.withOpacity(0.1),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.timeline,
            size: 64,
            color: Theme.of(context).colorScheme.outline,
          ),
          const AdaptiveSpacing.vertical(size: SpacingSize.medium),
          Text(
            'No Milestones Yet',
            style: AdaptiveTextStyles.titleLarge(context),
          ),
          const AdaptiveSpacing.vertical(size: SpacingSize.small),
          Text(
            'Milestones will be added soon.',
            style: AdaptiveTextStyles.bodyMedium(context),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
