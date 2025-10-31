import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/widgets/adaptive/adaptive_button.dart';
import '../../../../shared/constants/spacing.dart';
import '../providers/kyc_providers.dart';

/// KYC status card for dashboard
class KYCStatusCard extends ConsumerWidget {
  const KYCStatusCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final kycStatsAsync = ref.watch(kycStatsProvider);

    return kycStatsAsync.when(
      data: (stats) => _buildKYCCard(context, ref, stats),
      loading: () => _buildLoadingCard(context),
      error: (error, _) => _buildErrorCard(context, error.toString()),
    );
  }

  /// Build KYC status card
  Widget _buildKYCCard(
    BuildContext context,
    WidgetRef ref,
    Map<String, dynamic> stats,
  ) {
    final hasKYC = stats['hasKYC'] as bool? ?? false;
    final status = stats['status'] as String?;
    final progress = stats['progress'] as double? ?? 0.0;
    final isVerified = stats['isVerified'] as bool? ?? false;
    final isPendingReview = stats['isPendingReview'] as bool? ?? false;
    final isExpired = stats['isExpired'] as bool? ?? false;

    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context, hasKYC, status),
            AdaptiveSpacing.verticalMedium(),
            if (hasKYC) ...[
              _buildProgressSection(context, progress, status),
              AdaptiveSpacing.verticalMedium(),
            ],
            _buildStatusMessage(
                context, hasKYC, isVerified, isPendingReview, isExpired),
            AdaptiveSpacing.verticalMedium(),
            _buildActionButton(
                context, hasKYC, isVerified, isPendingReview, isExpired),
          ],
        ),
      ),
    );
  }

  /// Build card header
  Widget _buildHeader(BuildContext context, bool hasKYC, String? status) {
    IconData icon;
    Color iconColor;
    String title;

    if (!hasKYC) {
      icon = Icons.security;
      iconColor = Theme.of(context).colorScheme.primary;
      title = 'Identity Verification';
    } else {
      switch (status) {
        case 'verified':
          icon = Icons.verified;
          iconColor = Colors.green;
          title = 'Verification Complete';
          break;
        case 'in_review':
          icon = Icons.hourglass_empty;
          iconColor = Colors.orange;
          title = 'Under Review';
          break;
        case 'rejected':
          icon = Icons.error_outline;
          iconColor = Theme.of(context).colorScheme.error;
          title = 'Verification Failed';
          break;
        case 'expired':
          icon = Icons.schedule;
          iconColor = Theme.of(context).colorScheme.error;
          title = 'Verification Expired';
          break;
        case 'pending':
        default:
          icon = Icons.pending_actions;
          iconColor = Theme.of(context).colorScheme.primary;
          title = 'Verification In Progress';
          break;
      }
    }

    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(Spacing.sm),
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: iconColor,
            size: 24,
          ),
        ),
        const SizedBox(width: Spacing.md),
        Expanded(
          child: Text(
            title,
            style: AdaptiveTextStyles.titleMedium(context),
          ),
        ),
      ],
    );
  }

  /// Build progress section
  Widget _buildProgressSection(
    BuildContext context,
    double progress,
    String? status,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Progress',
              style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
              ),
            ),
            Text(
              '${(progress * 100).toInt()}%',
              style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: Spacing.sm),
        LinearProgressIndicator(
          value: progress,
          backgroundColor:
              Theme.of(context).colorScheme.outline.withOpacity(0.2),
          valueColor: AlwaysStoppedAnimation<Color>(
            _getProgressColor(context, status),
          ),
        ),
      ],
    );
  }

  /// Build status message
  Widget _buildStatusMessage(
    BuildContext context,
    bool hasKYC,
    bool isVerified,
    bool isPendingReview,
    bool isExpired,
  ) {
    String message;
    Color messageColor;

    if (!hasKYC) {
      message =
          'Complete identity verification to access all platform features and increase your investment limits.';
      messageColor = Theme.of(context).colorScheme.onSurface.withOpacity(0.8);
    } else if (isVerified) {
      message =
          'Your identity has been verified. You have full access to all platform features.';
      messageColor = Colors.green;
    } else if (isPendingReview) {
      message =
          'Your documents are being reviewed. This typically takes 1-3 business days.';
      messageColor = Colors.orange;
    } else if (isExpired) {
      message =
          'Your verification has expired. Please update your documents to continue.';
      messageColor = Theme.of(context).colorScheme.error;
    } else {
      message = 'Complete all verification steps to submit for review.';
      messageColor = Theme.of(context).colorScheme.onSurface.withOpacity(0.8);
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(Spacing.sm),
      decoration: BoxDecoration(
        color: messageColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        message,
        style: AdaptiveTextStyles.bodySmall(context).copyWith(
          color: messageColor,
        ),
      ),
    );
  }

  /// Build action button
  Widget _buildActionButton(
    BuildContext context,
    bool hasKYC,
    bool isVerified,
    bool isPendingReview,
    bool isExpired,
  ) {
    String buttonText;
    VoidCallback? onPressed;
    ButtonType buttonType;

    if (!hasKYC) {
      buttonText = 'Start Verification';
      onPressed = () => _navigateToKYC(context);
      buttonType = ButtonType.primary;
    } else if (isVerified) {
      buttonText = 'View Certificate';
      onPressed = () => _navigateToKYCStatus(context);
      buttonType = ButtonType.secondary;
    } else if (isPendingReview) {
      buttonText = 'Check Status';
      onPressed = () => _navigateToKYCStatus(context);
      buttonType = ButtonType.secondary;
    } else if (isExpired) {
      buttonText = 'Update Documents';
      onPressed = () => _navigateToKYC(context);
      buttonType = ButtonType.primary;
    } else {
      buttonText = 'Continue Verification';
      onPressed = () => _navigateToKYC(context);
      buttonType = ButtonType.primary;
    }

    return SizedBox(
      width: double.infinity,
      child: AdaptiveButton(
        text: buttonText,
        onPressed: onPressed,
        type: buttonType,
        size: ButtonSize.medium,
      ),
    );
  }

  /// Build loading card
  Widget _buildLoadingCard(BuildContext context) {
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.md),
        child: Row(
          children: [
            const CircularProgressIndicator(),
            const SizedBox(width: Spacing.md),
            Text(
              'Loading verification status...',
              style: AdaptiveTextStyles.bodyMedium(context),
            ),
          ],
        ),
      ),
    );
  }

  /// Build error card
  Widget _buildErrorCard(BuildContext context, String error) {
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.error_outline,
                  color: Theme.of(context).colorScheme.error,
                ),
                const SizedBox(width: Spacing.sm),
                Text(
                  'Error Loading KYC Status',
                  style: AdaptiveTextStyles.titleMedium(context),
                ),
              ],
            ),
            AdaptiveSpacing.verticalSmall(),
            Text(
              error,
              style: AdaptiveTextStyles.bodySmall(context).copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Get progress color based on status
  Color _getProgressColor(BuildContext context, String? status) {
    switch (status) {
      case 'verified':
        return Colors.green;
      case 'in_review':
        return Colors.orange;
      case 'rejected':
      case 'expired':
        return Theme.of(context).colorScheme.error;
      case 'pending':
      default:
        return Theme.of(context).colorScheme.primary;
    }
  }

  /// Navigate to KYC flow
  void _navigateToKYC(BuildContext context) {
    context.go('/kyc');
  }

  /// Navigate to KYC status
  void _navigateToKYCStatus(BuildContext context) {
    context.go('/kyc/status');
  }
}
