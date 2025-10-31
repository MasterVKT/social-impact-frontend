import 'package:flutter/material.dart';
import '../../../../../shared/widgets/responsive/responsive_layout.dart';
import '../../../../../shared/widgets/adaptive/adaptive_button.dart';
import '../../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../../shared/constants/spacing.dart';
import '../../../domain/entities/kyc.dart';

/// Main KYC verification screen with overview and navigation
class KYCMainScreen extends StatefulWidget {
  final KYCData? kycData;
  final VoidCallback? onStartKYC;
  final VoidCallback? onContinueKYC;
  final VoidCallback? onViewStatus;

  const KYCMainScreen({
    super.key,
    this.kycData,
    this.onStartKYC,
    this.onContinueKYC,
    this.onViewStatus,
  });

  @override
  State<KYCMainScreen> createState() => _KYCMainScreenState();
}

class _KYCMainScreenState extends State<KYCMainScreen> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: _buildMobileLayout(),
      tablet: _buildTabletLayout(),
      desktop: _buildDesktopLayout(),
    );
  }

  Widget _buildMobileLayout() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KYC Verification'),
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Spacing.md),
        child: _buildContent(),
      ),
    );
  }

  Widget _buildTabletLayout() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KYC Verification'),
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(Spacing.lg),
            child: _buildContent(),
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(Spacing.xl),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'KYC Verification',
                  style: AdaptiveTextStyles.headlineLarge(context),
                ),
                AdaptiveSpacing.verticalMedium(),
                _buildContent(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    if (widget.kycData == null) {
      return _buildStartKYCFlow();
    }

    switch (widget.kycData!.status) {
      case KYCStatus.notStarted:
        return _buildStartKYCFlow();
      case KYCStatus.pending:
        return _buildInProgressFlow();
      case KYCStatus.inReview:
        return _buildInReviewFlow();
      case KYCStatus.approved:
      case KYCStatus.verified:
        return _buildVerifiedFlow();
      case KYCStatus.rejected:
        return _buildRejectedFlow();
      case KYCStatus.expired:
        return _buildExpiredFlow();
      case KYCStatus.needsUpdate:
        return _buildRejectedFlow(); // Same as rejected but with different message
    }
  }

  /// Build initial KYC start flow for new users
  Widget _buildStartKYCFlow() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AdaptiveCard(
          child: Padding(
            padding: const EdgeInsets.all(Spacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.verified_user_outlined,
                  size: 48,
                  color: Theme.of(context).colorScheme.primary,
                ),
                AdaptiveSpacing.verticalMedium(),
                Text(
                  'Identity Verification Required',
                  style: AdaptiveTextStyles.headlineMedium(context),
                ),
                AdaptiveSpacing.verticalSmall(),
                Text(
                  'To ensure security and compliance, we need to verify your identity before you can start investing.',
                  style: AdaptiveTextStyles.bodyLarge(context).copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.8),
                  ),
                ),
                AdaptiveSpacing.verticalLarge(),
                _buildKYCLevelOptions(),
              ],
            ),
          ),
        ),
        AdaptiveSpacing.verticalLarge(),
        _buildBenefitsSection(),
        AdaptiveSpacing.verticalLarge(),
        _buildRequirementsSection(),
      ],
    );
  }

  /// Build KYC level selection options
  Widget _buildKYCLevelOptions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Choose Verification Level',
          style: AdaptiveTextStyles.titleMedium(context),
        ),
        AdaptiveSpacing.verticalMedium(),
        _buildKYCLevelCard(
          level: KYCLevel.basic,
          title: 'Basic Verification',
          description: 'Perfect for small investments up to \$5,000',
          features: [
            'Identity verification',
            'Address verification',
            'Basic investment access',
          ],
          estimatedTime: '10 minutes',
          isRecommended: true,
        ),
        AdaptiveSpacing.verticalMedium(),
        _buildKYCLevelCard(
          level: KYCLevel.enhanced,
          title: 'Enhanced Verification',
          description: 'For larger investments and full platform access',
          features: [
            'All basic features',
            'Financial verification',
            'Higher investment limits',
            'Priority support',
          ],
          estimatedTime: '20 minutes',
        ),
        AdaptiveSpacing.verticalMedium(),
        _buildKYCLevelCard(
          level: KYCLevel.institutional,
          title: 'Institutional Verification',
          description: 'For organizations and high-volume trading',
          features: [
            'All enhanced features',
            'Business verification',
            'Unlimited investment limits',
            'Dedicated account manager',
          ],
          estimatedTime: '45 minutes',
        ),
      ],
    );
  }

  /// Build individual KYC level card
  Widget _buildKYCLevelCard({
    required KYCLevel level,
    required String title,
    required String description,
    required List<String> features,
    required String estimatedTime,
    bool isRecommended = false,
  }) {
    return AdaptiveCard(
      elevation:
          isRecommended ? CardElevation.high : CardElevation.medium,
      child: Container(
        decoration: isRecommended
            ? BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(12),
              )
            : null,
        child: Padding(
          padding: const EdgeInsets.all(Spacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: AdaptiveTextStyles.titleMedium(context),
                    ),
                  ),
                  if (isRecommended)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Spacing.xs,
                        vertical: Spacing.xxs,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'Recommended',
                        style: AdaptiveTextStyles.labelSmall(context).copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ),
                ],
              ),
              AdaptiveSpacing.verticalSmall(),
              Text(
                description,
                style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
                ),
              ),
              AdaptiveSpacing.verticalMedium(),
              ...features.map((feature) => Padding(
                    padding: const EdgeInsets.only(bottom: Spacing.xs),
                    child: Row(
                      children: [
                        Icon(
                          Icons.check_circle_outline,
                          size: 16,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(width: Spacing.xs),
                        Expanded(
                          child: Text(
                            feature,
                            style: AdaptiveTextStyles.bodySmall(context),
                          ),
                        ),
                      ],
                    ),
                  )),
              AdaptiveSpacing.verticalMedium(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Est. time: $estimatedTime',
                    style: AdaptiveTextStyles.bodySmall(context).copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.6),
                    ),
                  ),
                  AdaptiveButton(
                    text: 'Start',
                    onPressed: () => _startKYC(level),
                    type: isRecommended
                        ? ButtonType.primary
                        : ButtonType.secondary,
                    size: ButtonSize.small,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Build benefits section
  Widget _buildBenefitsSection() {
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Why Verify Your Identity?',
              style: AdaptiveTextStyles.titleMedium(context),
            ),
            AdaptiveSpacing.verticalMedium(),
            _buildBenefitItem(
              icon: Icons.security,
              title: 'Enhanced Security',
              description: 'Protect your account and investments',
            ),
            _buildBenefitItem(
              icon: Icons.account_balance,
              title: 'Regulatory Compliance',
              description: 'Meet financial regulations and standards',
            ),
            _buildBenefitItem(
              icon: Icons.trending_up,
              title: 'Higher Limits',
              description: 'Access to larger investment opportunities',
            ),
            _buildBenefitItem(
              icon: Icons.support_agent,
              title: 'Premium Support',
              description: 'Priority customer service and assistance',
            ),
          ],
        ),
      ),
    );
  }

  /// Build benefit item
  Widget _buildBenefitItem({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Spacing.md),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(Spacing.sm),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: Theme.of(context).colorScheme.primary,
              size: 20,
            ),
          ),
          const SizedBox(width: Spacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AdaptiveTextStyles.titleSmall(context),
                ),
                Text(
                  description,
                  style: AdaptiveTextStyles.bodySmall(context).copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Build requirements section
  Widget _buildRequirementsSection() {
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'What You\'ll Need',
              style: AdaptiveTextStyles.titleMedium(context),
            ),
            AdaptiveSpacing.verticalMedium(),
            Text(
              'Have these documents ready for a smooth verification process:',
              style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
              ),
            ),
            AdaptiveSpacing.verticalMedium(),
            _buildRequirementItem(
                'Government-issued photo ID (passport, driver\'s license)'),
            _buildRequirementItem(
                'Proof of address (utility bill, bank statement)'),
            _buildRequirementItem('Clear, well-lit photos of documents'),
            _buildRequirementItem('Stable internet connection'),
          ],
        ),
      ),
    );
  }

  /// Build requirement item
  Widget _buildRequirementItem(String requirement) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Spacing.sm),
      child: Row(
        children: [
          Icon(
            Icons.description_outlined,
            size: 16,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
          ),
          const SizedBox(width: Spacing.sm),
          Expanded(
            child: Text(
              requirement,
              style: AdaptiveTextStyles.bodySmall(context),
            ),
          ),
        ],
      ),
    );
  }

  /// Build in-progress KYC flow
  Widget _buildInProgressFlow() {
    final progress = widget.kycData!.completionPercentage;
    final nextStep = widget.kycData!.nextStep;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AdaptiveCard(
          child: Padding(
            padding: const EdgeInsets.all(Spacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.pending_actions,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(width: Spacing.sm),
                    Expanded(
                      child: Text(
                        'Verification in Progress',
                        style: AdaptiveTextStyles.headlineMedium(context),
                      ),
                    ),
                  ],
                ),
                AdaptiveSpacing.verticalMedium(),
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor:
                      Theme.of(context).colorScheme.outline.withOpacity(0.2),
                ),
                AdaptiveSpacing.verticalSmall(),
                Text(
                  '${(progress * 100).toInt()}% Complete',
                  style: AdaptiveTextStyles.bodyMedium(context),
                ),
                if (nextStep != null) ...[
                  AdaptiveSpacing.verticalMedium(),
                  Text(
                    'Next Step: ${nextStep.name}',
                    style: AdaptiveTextStyles.titleSmall(context),
                  ),
                  Text(
                    nextStep.description ??
                        'Continue with verification process',
                    style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.8),
                    ),
                  ),
                ],
                AdaptiveSpacing.verticalLarge(),
                AdaptiveButton(
                  text: 'Continue Verification',
                  onPressed: widget.onContinueKYC,
                  type: ButtonType.primary,
                ),
              ],
            ),
          ),
        ),
        AdaptiveSpacing.verticalLarge(),
        _buildVerificationSteps(),
      ],
    );
  }

  /// Build in-review KYC flow
  Widget _buildInReviewFlow() {
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          children: [
            Icon(
              Icons.hourglass_empty,
              size: 64,
              color: Theme.of(context).colorScheme.secondary,
            ),
            AdaptiveSpacing.verticalMedium(),
            Text(
              'Under Review',
              style: AdaptiveTextStyles.headlineMedium(context),
            ),
            AdaptiveSpacing.verticalSmall(),
            Text(
              'Your verification documents are being reviewed by our team. This process typically takes 1-3 business days.',
              style: AdaptiveTextStyles.bodyLarge(context).copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
              ),
              textAlign: TextAlign.center,
            ),
            if (widget.kycData!.submittedAt != null) ...[
              AdaptiveSpacing.verticalMedium(),
              Text(
                'Submitted: ${_formatDate(widget.kycData!.submittedAt!)}',
                style: AdaptiveTextStyles.bodySmall(context).copyWith(
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                ),
              ),
            ],
            AdaptiveSpacing.verticalLarge(),
            AdaptiveButton(
              text: 'View Status',
              onPressed: widget.onViewStatus,
              type: ButtonType.secondary,
            ),
          ],
        ),
      ),
    );
  }

  /// Build verified KYC flow
  Widget _buildVerifiedFlow() {
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          children: [
            Icon(
              Icons.verified,
              size: 64,
              color: Theme.of(context).colorScheme.tertiary,
            ),
            AdaptiveSpacing.verticalMedium(),
            Text(
              'Identity Verified',
              style: AdaptiveTextStyles.headlineMedium(context),
            ),
            AdaptiveSpacing.verticalSmall(),
            Text(
              'Congratulations! Your identity has been successfully verified. You can now access all platform features.',
              style: AdaptiveTextStyles.bodyLarge(context).copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
              ),
              textAlign: TextAlign.center,
            ),
            if (widget.kycData!.reviewedAt != null) ...[
              AdaptiveSpacing.verticalMedium(),
              Text(
                'Verified: ${_formatDate(widget.kycData!.reviewedAt!)}',
                style: AdaptiveTextStyles.bodySmall(context).copyWith(
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                ),
              ),
            ],
            AdaptiveSpacing.verticalLarge(),
            AdaptiveButton(
              text: 'Start Investing',
              onPressed: () {
                // Navigate to main app
              },
              type: ButtonType.primary,
            ),
          ],
        ),
      ),
    );
  }

  /// Build rejected KYC flow
  Widget _buildRejectedFlow() {
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          children: [
            Icon(
              Icons.cancel_outlined,
              size: 64,
              color: Theme.of(context).colorScheme.error,
            ),
            AdaptiveSpacing.verticalMedium(),
            Text(
              'Verification Rejected',
              style: AdaptiveTextStyles.headlineMedium(context),
            ),
            AdaptiveSpacing.verticalSmall(),
            Text(
              'Unfortunately, we were unable to verify your identity with the provided information.',
              style: AdaptiveTextStyles.bodyLarge(context).copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
              ),
              textAlign: TextAlign.center,
            ),
            if (widget.kycData!.rejectionReason != null) ...[
              AdaptiveSpacing.verticalMedium(),
              Container(
                padding: const EdgeInsets.all(Spacing.md),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.errorContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  widget.kycData!.rejectionReason!,
                  style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                    color: Theme.of(context).colorScheme.onErrorContainer,
                  ),
                ),
              ),
            ],
            AdaptiveSpacing.verticalLarge(),
            AdaptiveButton(
              text: 'Try Again',
              onPressed: widget.onStartKYC,
              type: ButtonType.primary,
            ),
          ],
        ),
      ),
    );
  }

  /// Build expired KYC flow
  Widget _buildExpiredFlow() {
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          children: [
            Icon(
              Icons.schedule,
              size: 64,
              color: Theme.of(context).colorScheme.error,
            ),
            AdaptiveSpacing.verticalMedium(),
            Text(
              'Verification Expired',
              style: AdaptiveTextStyles.headlineMedium(context),
            ),
            AdaptiveSpacing.verticalSmall(),
            Text(
              'Your identity verification has expired and needs to be renewed for continued access.',
              style: AdaptiveTextStyles.bodyLarge(context).copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
              ),
              textAlign: TextAlign.center,
            ),
            AdaptiveSpacing.verticalLarge(),
            AdaptiveButton(
              text: 'Renew Verification',
              onPressed: widget.onStartKYC,
              type: ButtonType.primary,
            ),
          ],
        ),
      ),
    );
  }

  /// Build verification steps overview
  Widget _buildVerificationSteps() {
    final steps = widget.kycData!.verificationSteps;

    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Verification Steps',
              style: AdaptiveTextStyles.titleMedium(context),
            ),
            AdaptiveSpacing.verticalMedium(),
            ...steps.map((step) => _buildStepItem(step)),
          ],
        ),
      ),
    );
  }

  /// Build individual step item
  Widget _buildStepItem(KYCVerificationStep step) {
    Color statusColor;
    IconData statusIcon;

    switch (step.status) {
      case KYCStepStatus.completed:
        statusColor = Theme.of(context).colorScheme.tertiary;
        statusIcon = Icons.check_circle;
        break;
      case KYCStepStatus.inProgress:
        statusColor = Theme.of(context).colorScheme.primary;
        statusIcon = Icons.radio_button_checked;
        break;
      case KYCStepStatus.failed:
        statusColor = Theme.of(context).colorScheme.error;
        statusIcon = Icons.error;
        break;
      case KYCStepStatus.pending:
      case KYCStepStatus.skipped:
      default:
        statusColor = Theme.of(context).colorScheme.outline;
        statusIcon = Icons.radio_button_unchecked;
        break;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: Spacing.md),
      child: Row(
        children: [
          Icon(
            statusIcon,
            color: statusColor,
            size: 20,
          ),
          const SizedBox(width: Spacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  step.name,
                  style: AdaptiveTextStyles.titleSmall(context),
                ),
                Text(
                  step.description,
                  style: AdaptiveTextStyles.bodySmall(context).copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Start KYC process with selected level
  void _startKYC(KYCLevel level) {
    if (widget.onStartKYC != null) {
      widget.onStartKYC!();
    }
    // Navigate to KYC flow with selected level
    // This would typically involve navigation logic
  }

  /// Format date for display
  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
