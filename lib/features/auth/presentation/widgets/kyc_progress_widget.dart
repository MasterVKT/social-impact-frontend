import 'package:flutter/material.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/constants/spacing.dart';
import '../../../auth/domain/entities/kyc.dart';

/// Widget displaying KYC verification progress with step indicators
class KYCProgressWidget extends StatelessWidget {
  final List<KYCVerificationStep> steps;
  final double progress;
  final String? currentStepId;
  final Function(KYCVerificationStep)? onStepTap;

  const KYCProgressWidget({
    super.key,
    required this.steps,
    required this.progress,
    this.currentStepId,
    this.onStepTap,
  });

  @override
  Widget build(BuildContext context) {
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            AdaptiveSpacing.verticalMedium(),
            _buildProgressIndicator(context),
            AdaptiveSpacing.verticalLarge(),
            _buildStepsList(context),
          ],
        ),
      ),
    );
  }

  /// Build progress header
  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.checklist_outlined,
          color: Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(width: Spacing.sm),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Verification Progress',
                style: AdaptiveTextStyles.titleMedium(context),
              ),
              Text(
                '${_getCompletedSteps()} of ${steps.length} steps completed',
                style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: Spacing.sm,
            vertical: Spacing.xs,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            '${(progress * 100).toInt()}%',
            style: AdaptiveTextStyles.labelMedium(context).copyWith(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  /// Build progress indicator bar
  Widget _buildProgressIndicator(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Started',
              style: AdaptiveTextStyles.bodySmall(context).copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
              ),
            ),
            Text(
              progress >= 1.0 ? 'Complete' : 'In Progress',
              style: AdaptiveTextStyles.bodySmall(context).copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
              ),
            ),
          ],
        ),
        const SizedBox(height: Spacing.xs),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: progress,
            backgroundColor:
                Theme.of(context).colorScheme.outline.withOpacity(0.2),
            valueColor: AlwaysStoppedAnimation<Color>(
              progress >= 1.0
                  ? Theme.of(context).colorScheme.tertiary
                  : Theme.of(context).colorScheme.primary,
            ),
            minHeight: 8,
          ),
        ),
      ],
    );
  }

  /// Build steps list
  Widget _buildStepsList(BuildContext context) {
    return Column(
      children: steps
          .asMap()
          .entries
          .map((entry) => _buildStepItem(context, entry.key, entry.value))
          .toList(),
    );
  }

  /// Build individual step item
  Widget _buildStepItem(
    BuildContext context,
    int index,
    KYCVerificationStep step,
  ) {
    final isCurrentStep = step.stepId == currentStepId;
    final isLastStep = index == steps.length - 1;

    return InkWell(
      onTap: onStepTap != null ? () => onStepTap!(step) : null,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: Spacing.sm),
        child: Row(
          children: [
            // Step indicator
            _buildStepIndicator(context, step, isCurrentStep),

            // Connecting line (except for last step)
            if (!isLastStep)
              Positioned(
                top: 32,
                left: 15,
                child: Container(
                  width: 2,
                  height: 40,
                  color: _getStepStatus(step) == KYCStepStatus.completed
                      ? Theme.of(context).colorScheme.tertiary
                      : Theme.of(context).colorScheme.outline.withOpacity(0.3),
                ),
              ),

            const SizedBox(width: Spacing.md),

            // Step content
            Expanded(
              child: _buildStepContent(context, step, isCurrentStep),
            ),
          ],
        ),
      ),
    );
  }

  /// Build step indicator circle
  Widget _buildStepIndicator(
    BuildContext context,
    KYCVerificationStep step,
    bool isCurrentStep,
  ) {
    final status = _getStepStatus(step);

    Color backgroundColor;
    Color iconColor;
    IconData icon;

    switch (status) {
      case KYCStepStatus.completed:
        backgroundColor = Theme.of(context).colorScheme.tertiary;
        iconColor = Theme.of(context).colorScheme.onTertiary;
        icon = Icons.check;
        break;
      case KYCStepStatus.inProgress:
        backgroundColor = Theme.of(context).colorScheme.primary;
        iconColor = Theme.of(context).colorScheme.onPrimary;
        icon = Icons.hourglass_empty;
        break;
      case KYCStepStatus.failed:
        backgroundColor = Theme.of(context).colorScheme.error;
        iconColor = Theme.of(context).colorScheme.onError;
        icon = Icons.close;
        break;
      case KYCStepStatus.pending:
      case KYCStepStatus.skipped:
      default:
        backgroundColor = isCurrentStep
            ? Theme.of(context).colorScheme.primary.withOpacity(0.2)
            : Theme.of(context).colorScheme.outline.withOpacity(0.2);
        iconColor = isCurrentStep
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.outline;
        icon = Icons.radio_button_unchecked;
        break;
    }

    return Stack(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: backgroundColor,
            shape: BoxShape.circle,
            border: isCurrentStep
                ? Border.all(
                    color: Theme.of(context).colorScheme.primary,
                    width: 2,
                  )
                : null,
          ),
          child: Icon(
            icon,
            color: iconColor,
            size: 16,
          ),
        ),
        if (isCurrentStep)
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                  width: 4,
                ),
              ),
            ),
          ),
      ],
    );
  }

  /// Build step content
  Widget _buildStepContent(
    BuildContext context,
    KYCVerificationStep step,
    bool isCurrentStep,
  ) {
    final status = _getStepStatus(step);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                step.name,
                style: AdaptiveTextStyles.titleSmall(context).copyWith(
                  color: isCurrentStep
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.onSurface,
                  fontWeight:
                      isCurrentStep ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ),
            _buildStepStatusChip(context, status),
          ],
        ),
        ...[
          const SizedBox(height: Spacing.xs),
          Text(
            step.description,
            style: AdaptiveTextStyles.bodySmall(context).copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
            ),
          ),
        ],
        if (step.completedAt != null) ...[
          const SizedBox(height: Spacing.xs),
          Text(
            _getStepTimestamp(step),
            style: AdaptiveTextStyles.bodySmall(context).copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
            ),
          ),
        ],
        if (step.errorMessage != null && step.errorMessage!.isNotEmpty) ...[
          const SizedBox(height: Spacing.xs),
          Container(
            padding: const EdgeInsets.all(Spacing.xs),
            decoration: BoxDecoration(
              color: status == KYCStepStatus.failed
                  ? Theme.of(context).colorScheme.errorContainer
                  : Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.5),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              step.errorMessage!,
              style: AdaptiveTextStyles.bodySmall(context).copyWith(
                color: status == KYCStepStatus.failed
                    ? Theme.of(context).colorScheme.onErrorContainer
                    : Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
        ],
      ],
    );
  }

  /// Build step status chip
  Widget _buildStepStatusChip(BuildContext context, KYCStepStatus status) {
    Color backgroundColor;
    Color textColor;
    String text;

    switch (status) {
      case KYCStepStatus.completed:
        backgroundColor = Theme.of(context).colorScheme.tertiaryContainer;
        textColor = Theme.of(context).colorScheme.onTertiaryContainer;
        text = 'Completed';
        break;
      case KYCStepStatus.inProgress:
        backgroundColor = Theme.of(context).colorScheme.primaryContainer;
        textColor = Theme.of(context).colorScheme.onPrimaryContainer;
        text = 'In Progress';
        break;
      case KYCStepStatus.failed:
        backgroundColor = Theme.of(context).colorScheme.errorContainer;
        textColor = Theme.of(context).colorScheme.onErrorContainer;
        text = 'Failed';
        break;
      case KYCStepStatus.skipped:
        backgroundColor =
            Theme.of(context).colorScheme.outline.withOpacity(0.2);
        textColor = Theme.of(context).colorScheme.onSurface.withOpacity(0.6);
        text = 'Skipped';
        break;
      case KYCStepStatus.pending:
      default:
        backgroundColor =
            Theme.of(context).colorScheme.outline.withOpacity(0.1);
        textColor = Theme.of(context).colorScheme.onSurface.withOpacity(0.6);
        text = 'Pending';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Spacing.xs,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: AdaptiveTextStyles.labelSmall(context).copyWith(
          color: textColor,
        ),
      ),
    );
  }

  /// Get step status (with fallback logic)
  KYCStepStatus _getStepStatus(KYCVerificationStep step) {
    return step.status;
  }

  /// Get step timestamp text
  String _getStepTimestamp(KYCVerificationStep step) {
    if (step.completedAt != null) {
      return 'Completed: ${_formatDate(step.completedAt!)}';
    }
    return '';
  }

  /// Format date for display
  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final stepDate = DateTime(date.year, date.month, date.day);

    if (stepDate == today) {
      return 'Today ${_formatTime(date)}';
    } else if (stepDate == today.subtract(const Duration(days: 1))) {
      return 'Yesterday ${_formatTime(date)}';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }

  /// Format time for display
  String _formatTime(DateTime date) {
    final hour = date.hour.toString().padLeft(2, '0');
    final minute = date.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  /// Get number of completed steps
  int _getCompletedSteps() {
    return steps.where((step) => step.status == KYCStepStatus.completed).length;
  }
}
