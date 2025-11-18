import 'package:flutter/material.dart';
import '../../../../shared/widgets/adaptive/adaptive_button.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/constants/spacing.dart';
import '../../../projects/domain/entities/project.dart';

/// Card displaying milestone status with action buttons
class MilestoneStatusCard extends StatelessWidget {
  final ProjectMilestone milestone;
  final VoidCallback? onSubmitEvidence;
  final VoidCallback? onUpdateStatus;
  final VoidCallback? onViewEvidence;

  const MilestoneStatusCard({
    super.key,
    required this.milestone,
    this.onSubmitEvidence,
    this.onUpdateStatus,
    this.onViewEvidence,
  });

  @override
  Widget build(BuildContext context) {
    return AdaptiveCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Status header
          Row(
            children: [
              _buildStatusIcon(context),
              const AdaptiveSpacing.horizontal(size: SpacingSize.medium),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      milestone.title,
                      style: AdaptiveTextStyles.titleMedium(context),
                    ),
                    const AdaptiveSpacing.vertical(size: SpacingSize.extraSmall),
                    _buildStatusBadge(context),
                  ],
                ),
              ),
            ],
          ),
          const AdaptiveSpacing.vertical(size: SpacingSize.medium),

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

          // Evidence URL (if exists)
          if (milestone.evidenceUrl != null && milestone.evidenceUrl!.isNotEmpty) ...[
            const AdaptiveSpacing.vertical(size: SpacingSize.medium),
            const Divider(),
            const AdaptiveSpacing.vertical(size: SpacingSize.small),
            Row(
              children: [
                Icon(
                  Icons.attachment,
                  size: 16,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const AdaptiveSpacing.horizontal(size: SpacingSize.small),
                Text(
                  'Evidence attached',
                  style: AdaptiveTextStyles.bodySmall(context).copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ],

          // Action buttons
          const AdaptiveSpacing.vertical(size: SpacingSize.medium),
          const Divider(),
          const AdaptiveSpacing.vertical(size: SpacingSize.small),
          _buildActionButtons(context),
        ],
      ),
    );
  }

  Widget _buildStatusIcon(BuildContext context) {
    IconData icon;
    Color color;

    switch (milestone.status) {
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
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: color, size: 32),
    );
  }

  Widget _buildStatusBadge(BuildContext context) {
    Color backgroundColor;
    Color textColor;

    switch (milestone.status) {
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
        milestone.status.displayName,
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

  Widget _buildActionButtons(BuildContext context) {
    final canSubmitEvidence = milestone.status == MilestoneStatus.inProgress ||
        milestone.status == MilestoneStatus.pending ||
        milestone.status == MilestoneStatus.rejected;

    final hasEvidence = milestone.evidenceUrl != null &&
        milestone.evidenceUrl!.isNotEmpty;

    return Row(
      children: [
        // Submit evidence button
        if (canSubmitEvidence && onSubmitEvidence != null)
          Expanded(
            child: AdaptiveButton(
              onPressed: onSubmitEvidence,
              label: hasEvidence ? 'Update Evidence' : 'Submit Evidence',
              buttonType: ButtonType.primary,
              prefixIcon: Icons.upload,
              isFullWidth: true,
            ),
          ),

        // View evidence button
        if (hasEvidence && onViewEvidence != null) ...[
          if (canSubmitEvidence) const AdaptiveSpacing.horizontal(size: SpacingSize.small),
          Expanded(
            child: AdaptiveButton(
              onPressed: onViewEvidence,
              label: 'View Evidence',
              buttonType: ButtonType.secondary,
              prefixIcon: Icons.visibility,
              isFullWidth: true,
            ),
          ),
        ],

        // Status completed, show congratulations
        if (milestone.status == MilestoneStatus.completed)
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(AppSpacing.sm),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.celebration, color: Colors.green, size: 20),
                  const AdaptiveSpacing.horizontal(size: SpacingSize.small),
                  Text(
                    'Milestone Completed!',
                    style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                      color: Colors.green,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),

        // Under review status
        if (milestone.status == MilestoneStatus.underReview ||
            milestone.status == MilestoneStatus.submitted)
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(AppSpacing.sm),
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.hourglass_empty, color: Colors.orange, size: 20),
                  const AdaptiveSpacing.horizontal(size: SpacingSize.small),
                  Text(
                    milestone.status == MilestoneStatus.submitted
                        ? 'Evidence Submitted'
                        : 'Under Review',
                    style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                      color: Colors.orange,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
