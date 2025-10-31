import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/responsive/responsive_layout.dart';
import '../../../../shared/widgets/adaptive/adaptive_button.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_field.dart';
import '../../../../shared/constants/spacing.dart';
import '../providers/password_recovery_providers.dart';

/// Password reset screen with email input and reset flow
class PasswordResetScreen extends ConsumerStatefulWidget {
  const PasswordResetScreen({super.key});

  @override
  ConsumerState<PasswordResetScreen> createState() => _PasswordResetScreenState();
}

class _PasswordResetScreenState extends ConsumerState<PasswordResetScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool _isLoading = false;
  String? _message;
  bool _isSuccess = false;
  
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

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
        title: const Text('Reset Password'),
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
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
        title: const Text('Reset Password'),
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
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
          constraints: const BoxConstraints(maxWidth: 600),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(Spacing.xl),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    const SizedBox(width: Spacing.sm),
                    Text(
                      'Reset Password',
                      style: AdaptiveTextStyles.headlineLarge(context),
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
    
    return _buildResetForm();
  }
  
  /// Build password reset form
  Widget _buildResetForm() {
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildHeader(),
              AdaptiveSpacing.verticalLarge(),
              _buildEmailField(),
              if (_message != null) ...[
                AdaptiveSpacing.verticalMedium(),
                _buildMessage(),
              ],
              AdaptiveSpacing.verticalLarge(),
              _buildSubmitButton(),
              AdaptiveSpacing.verticalMedium(),
              _buildBackToLoginButton(),
              AdaptiveSpacing.verticalLarge(),
              _buildHelpSection(),
            ],
          ),
        ),
      ),
    );
  }
  
  /// Build form header
  Widget _buildHeader() {
    return Column(
      children: [
        Icon(
          Icons.lock_reset,
          size: 64,
          color: Theme.of(context).colorScheme.primary,
        ),
        AdaptiveSpacing.verticalMedium(),
        Text(
          'Reset Your Password',
          style: AdaptiveTextStyles.headlineMedium(context),
          textAlign: TextAlign.center,
        ),
        AdaptiveSpacing.verticalSmall(),
        Text(
          'Enter your email address and we\'ll send you a link to reset your password.',
          style: AdaptiveTextStyles.bodyLarge(context).copyWith(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
  
  /// Build email input field
  Widget _buildEmailField() {
    return AdaptiveTextField(
      controller: _emailController,
      label: 'Email Address',
      placeholder: 'Enter your email address',
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.done,
      prefixIcon: const Icon(Icons.email_outlined),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Email address is required';
        }
        
        final emailRegex = RegExp(
          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
        );
        
        if (!emailRegex.hasMatch(value.trim())) {
          return 'Please enter a valid email address';
        }
        
        return null;
      },
      onSubmitted: (_) => _handleSubmit(),
    );
  }
  
  /// Build message display
  Widget _buildMessage() {
    final isError = !_isSuccess;
    
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
  
  /// Build submit button
  Widget _buildSubmitButton() {
    return AdaptiveButton(
      text: _isLoading ? 'Sending...' : 'Send Reset Link',
      onPressed: _isLoading ? null : _handleSubmit,
      type: ButtonType.primary,
      size: ButtonSize.large,
    );
  }
  
  /// Build back to login button
  Widget _buildBackToLoginButton() {
    return AdaptiveButton(
      text: 'Back to Sign In',
      onPressed: () => Navigator.of(context).pop(),
      type: ButtonType.secondary,
      size: ButtonSize.large,
    );
  }
  
  /// Build help section
  Widget _buildHelpSection() {
    return Container(
      padding: const EdgeInsets.all(Spacing.md),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Having trouble?',
            style: AdaptiveTextStyles.titleSmall(context).copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          AdaptiveSpacing.verticalSmall(),
          _buildHelpItem(
            'Check your spam folder for the reset email',
            Icons.mark_email_read_outlined,
          ),
          _buildHelpItem(
            'Make sure you entered the correct email address',
            Icons.alternate_email,
          ),
          _buildHelpItem(
            'Contact support if you still need help',
            Icons.support_agent,
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
          const SizedBox(width: Spacing.xs),
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
              Icons.mark_email_read_outlined,
              size: 80,
              color: Theme.of(context).colorScheme.tertiary,
            ),
            AdaptiveSpacing.verticalMedium(),
            Text(
              'Check Your Email',
              style: AdaptiveTextStyles.headlineMedium(context),
              textAlign: TextAlign.center,
            ),
            AdaptiveSpacing.verticalSmall(),
            Text(
              'We\'ve sent a password reset link to:',
              style: AdaptiveTextStyles.bodyLarge(context).copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
              ),
              textAlign: TextAlign.center,
            ),
            AdaptiveSpacing.verticalSmall(),
            Text(
              _emailController.text.trim(),
              style: AdaptiveTextStyles.titleMedium(context).copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
              textAlign: TextAlign.center,
            ),
            AdaptiveSpacing.verticalLarge(),
            _buildResendButton(),
            AdaptiveSpacing.verticalMedium(),
            AdaptiveButton(
              text: 'Back to Sign In',
              onPressed: () => Navigator.of(context).pop(),
              type: ButtonType.secondary,
              size: ButtonSize.large,
            ),
            AdaptiveSpacing.verticalLarge(),
            Container(
              padding: const EdgeInsets.all(Spacing.md),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Text(
                    'Next Steps',
                    style: AdaptiveTextStyles.titleSmall(context),
                  ),
                  AdaptiveSpacing.verticalSmall(),
                  Text(
                    '1. Check your email inbox (and spam folder)\n'
                    '2. Click the reset link in the email\n'
                    '3. Enter your new password\n'
                    '4. Sign in with your new password',
                    style: AdaptiveTextStyles.bodySmall(context),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
          ],
        ),
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
          text: canResend 
              ? 'Resend Email' 
              : 'Resend in ${timeLeft}s',
          onPressed: canResend ? _handleResend : null,
          type: ButtonType.primary,
          size: ButtonSize.large,
        );
      },
    );
  }
  
  /// Handle form submission
  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;
    
    setState(() {
      _isLoading = true;
      _message = null;
    });
    
    try {
      await ref.read(passwordRecoveryUseCasesProvider).sendPasswordResetEmail(
        _emailController.text.trim(),
      );
      
      // Start cooldown timer
      ref.read(resendCooldownProvider.notifier).startCooldown();
      
      setState(() {
        _isSuccess = true;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _message = e.toString().replaceFirst('PasswordRecoveryException: ', '');
        _isLoading = false;
      });
    }
  }
  
  /// Handle resend email
  Future<void> _handleResend() async {
    try {
      await ref.read(passwordRecoveryUseCasesProvider).sendPasswordResetEmail(
        _emailController.text.trim(),
      );
      
      // Start cooldown timer again
      ref.read(resendCooldownProvider.notifier).startCooldown();
      
      setState(() {
        _message = 'Reset email sent again!';
      });
    } catch (e) {
      setState(() {
        _message = e.toString().replaceFirst('PasswordRecoveryException: ', '');
      });
    }
  }
}