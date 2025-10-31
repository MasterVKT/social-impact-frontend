import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/widgets/responsive/responsive_layout.dart';
import '../../../../shared/widgets/adaptive/adaptive_button.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/constants/spacing.dart';
import '../providers/password_recovery_providers.dart';
import '../providers/auth_provider_aliases.dart';

/// Email verification screen with resend functionality
class EmailVerificationScreen extends ConsumerStatefulWidget {
  final bool showSkipOption;

  const EmailVerificationScreen({
    super.key,
    this.showSkipOption = false,
  });

  @override
  ConsumerState<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState
    extends ConsumerState<EmailVerificationScreen> {
  bool _isLoading = false;
  String? _message;
  bool _isSuccess = false;

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
        title: const Text('Verify Email'),
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        automaticallyImplyLeading: !widget.showSkipOption,
        actions: widget.showSkipOption
            ? [
                TextButton(
                  onPressed: _handleSkip,
                  child: const Text('Skip for now'),
                ),
              ]
            : null,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(Spacing.md),
          child: _buildContent(),
        ),
      ),
    );
  }

  Widget _buildTabletLayout() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Email'),
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        automaticallyImplyLeading: !widget.showSkipOption,
        actions: widget.showSkipOption
            ? [
                TextButton(
                  onPressed: _handleSkip,
                  child: const Text('Skip for now'),
                ),
              ]
            : null,
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
          constraints: const BoxConstraints(maxWidth: 700),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(Spacing.xl),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Verify Your Email',
                      style: AdaptiveTextStyles.headlineLarge(context),
                    ),
                    if (widget.showSkipOption)
                      TextButton(
                        onPressed: _handleSkip,
                        child: const Text('Skip for now'),
                      ),
                  ],
                ),
                AdaptiveSpacing.verticalLarge(),
                _buildContent(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    if (_isSuccess) {
      return _buildSuccessState();
    }

    return _buildVerificationPrompt();
  }

  /// Build email verification prompt
  Widget _buildVerificationPrompt() {
    final authState = ref.watch(authStateProvider);

    return authState.maybeWhen(
      authenticated: (user) {
        return AdaptiveCard(
          child: Padding(
            padding: const EdgeInsets.all(Spacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildHeader(user.email ?? 'your email'),
                AdaptiveSpacing.verticalLarge(),
                _buildInstructions(),
                if (_message != null) ...[
                  AdaptiveSpacing.verticalMedium(),
                  _buildMessage(),
                ],
                AdaptiveSpacing.verticalLarge(),
                _buildResendButton(),
                AdaptiveSpacing.verticalMedium(),
                _buildRefreshButton(),
                if (widget.showSkipOption) ...[
                  AdaptiveSpacing.verticalMedium(),
                  _buildSkipButton(),
                ],
                AdaptiveSpacing.verticalLarge(),
                _buildHelpSection(),
              ],
            ),
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, code) => _buildErrorState(error),
      orElse: () => _buildErrorState('User not authenticated'),
    );
  }

  /// Build header
  Widget _buildHeader(String email) {
    return Column(
      children: [
        Icon(
          Icons.mark_email_unread_outlined,
          size: 80,
          color: Theme.of(context).colorScheme.primary,
        ),
        AdaptiveSpacing.verticalMedium(),
        Text(
          'Verify Your Email Address',
          style: AdaptiveTextStyles.headlineMedium(context),
          textAlign: TextAlign.center,
        ),
        AdaptiveSpacing.verticalSmall(),
        Text(
          'We\'ve sent a verification email to:',
          style: AdaptiveTextStyles.bodyLarge(context).copyWith(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
          ),
          textAlign: TextAlign.center,
        ),
        AdaptiveSpacing.verticalSmall(),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: Spacing.md,
            vertical: Spacing.sm,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            email,
            style: AdaptiveTextStyles.titleMedium(context).copyWith(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  /// Build instructions
  Widget _buildInstructions() {
    return Container(
      padding: const EdgeInsets.all(Spacing.md),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.info_outline,
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
              const SizedBox(width: Spacing.sm),
              Text(
                'Next Steps',
                style: AdaptiveTextStyles.titleSmall(context).copyWith(
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
              ),
            ],
          ),
          AdaptiveSpacing.verticalSmall(),
          Text(
            '1. Check your email inbox (and spam/junk folder)\n'
            '2. Open the verification email from Social Impact\n'
            '3. Click the "Verify Email" button or link\n'
            '4. Return to this screen and tap "I\'ve verified my email"',
            style: AdaptiveTextStyles.bodyMedium(context).copyWith(
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
          ),
        ],
      ),
    );
  }

  /// Build message display
  Widget _buildMessage() {
    final isError =
        !_message!.contains('sent') && !_message!.contains('Verification');

    return Container(
      padding: const EdgeInsets.all(Spacing.md),
      decoration: BoxDecoration(
        color: isError
            ? Theme.of(context).colorScheme.errorContainer
            : Theme.of(context).colorScheme.tertiaryContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(
            isError ? Icons.error_outline : Icons.check_circle_outline,
            color: isError
                ? Theme.of(context).colorScheme.onErrorContainer
                : Theme.of(context).colorScheme.onTertiaryContainer,
          ),
          const SizedBox(width: Spacing.sm),
          Expanded(
            child: Text(
              _message!,
              style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                color: isError
                    ? Theme.of(context).colorScheme.onErrorContainer
                    : Theme.of(context).colorScheme.onTertiaryContainer,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Build resend button with cooldown
  Widget _buildResendButton() {
    return Consumer(
      builder: (context, ref, child) {
        final cooldownState = ref.watch(resendCooldownProvider);

        final timeLeft = cooldownState;
        final canResend = timeLeft <= 0;

        return AdaptiveButton(
          text: _isLoading
              ? 'Sending...'
              : canResend
                  ? 'Resend Verification Email'
                  : 'Resend in ${timeLeft}s',
          onPressed: _isLoading || !canResend ? null : _handleResend,
          type: ButtonType.primary,
          size: ButtonSize.large,
        );
      },
    );
  }

  /// Build refresh button
  Widget _buildRefreshButton() {
    return AdaptiveButton(
      text: 'I\'ve verified my email',
      onPressed: _handleRefresh,
      type: ButtonType.secondary,
      size: ButtonSize.large,
    );
  }

  /// Build skip button
  Widget _buildSkipButton() {
    return AdaptiveButton(
      text: 'Skip for now',
      onPressed: _handleSkip,
      type: ButtonType.text,
      size: ButtonSize.large,
    );
  }

  /// Build help section
  Widget _buildHelpSection() {
    return Container(
      padding: const EdgeInsets.all(Spacing.md),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest.withOpacity(0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Didn\'t receive the email?',
            style: AdaptiveTextStyles.titleSmall(context),
          ),
          AdaptiveSpacing.verticalSmall(),
          _buildHelpItem(
            'Check your spam/junk email folder',
            Icons.report_outlined,
          ),
          _buildHelpItem(
            'Make sure your email address is correct',
            Icons.alternate_email,
          ),
          _buildHelpItem(
            'Add noreply@socialimpact.com to your contacts',
            Icons.contact_mail,
          ),
          _buildHelpItem(
            'Try resending the verification email',
            Icons.refresh,
          ),
        ],
      ),
    );
  }

  /// Build help item
  Widget _buildHelpItem(String text, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Spacing.xs),
      child: Row(
        children: [
          Icon(
            icon,
            size: 16,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
          ),
          const SizedBox(width: Spacing.sm),
          Expanded(
            child: Text(
              text,
              style: AdaptiveTextStyles.bodySmall(context).copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Build success state
  Widget _buildSuccessState() {
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          children: [
            Icon(
              Icons.verified,
              size: 80,
              color: Theme.of(context).colorScheme.tertiary,
            ),
            AdaptiveSpacing.verticalMedium(),
            Text(
              'Email Verified!',
              style: AdaptiveTextStyles.headlineMedium(context),
              textAlign: TextAlign.center,
            ),
            AdaptiveSpacing.verticalSmall(),
            Text(
              'Your email address has been successfully verified. You now have full access to all platform features.',
              style: AdaptiveTextStyles.bodyLarge(context).copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
              ),
              textAlign: TextAlign.center,
            ),
            AdaptiveSpacing.verticalLarge(),
            AdaptiveButton(
              text: 'Continue to App',
              onPressed: _handleContinue,
              type: ButtonType.primary,
              size: ButtonSize.large,
            ),
          ],
        ),
      ),
    );
  }

  /// Build error state
  Widget _buildErrorState(String error) {
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          children: [
            Icon(
              Icons.error_outline,
              size: 80,
              color: Theme.of(context).colorScheme.error,
            ),
            AdaptiveSpacing.verticalMedium(),
            Text(
              'Something went wrong',
              style: AdaptiveTextStyles.headlineMedium(context),
              textAlign: TextAlign.center,
            ),
            AdaptiveSpacing.verticalSmall(),
            Text(
              error,
              style: AdaptiveTextStyles.bodyLarge(context).copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
              ),
              textAlign: TextAlign.center,
            ),
            AdaptiveSpacing.verticalLarge(),
            AdaptiveButton(
              text: 'Try Again',
              onPressed: () {
                setState(() {
                  _message = null;
                });
              },
              type: ButtonType.primary,
              size: ButtonSize.large,
            ),
          ],
        ),
      ),
    );
  }

  /// Handle resend verification email
  Future<void> _handleResend() async {
    setState(() {
      _isLoading = true;
      _message = null;
    });

    try {
      await ref.read(passwordRecoveryUseCasesProvider).sendEmailVerification();

      // Start cooldown timer
      ref.read(resendCooldownProvider.notifier).startCooldown();

      setState(() {
        _message = 'Verification email sent! Check your inbox.';
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _message =
            e.toString().replaceFirst('EmailVerificationException: ', '');
        _isLoading = false;
      });
    }
  }

  /// Handle refresh to check verification status
  Future<void> _handleRefresh() async {
    // Refresh the auth state to check if email is now verified
    ref.invalidate(authStateProvider);

    // Wait for the state to refresh
    await Future.delayed(const Duration(milliseconds: 500));

    final authState = ref.read(authStateProvider);
    // Convertir l'état d'authentification en utilisateur
    final user = authState.maybeWhen(
      authenticated: (user) => user,
      orElse: () => null,
    );
    if (user?.isEmailVerified == true) {
      setState(() {
        _isSuccess = true;
      });
    } else {
      setState(() {
        _message =
            'Email not yet verified. Please check your email and try again.';
      });
    }
  }

  /// Handle skip verification
  void _handleSkip() {
    // Navigate to main app or next screen
    Navigator.of(context).pop();
  }

  /// Handle continue after successful verification
  void _handleContinue() {
    // Navigate to main app
    context.go('/dashboard');
  }
}
