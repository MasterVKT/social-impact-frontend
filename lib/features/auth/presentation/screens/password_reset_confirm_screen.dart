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
import '../widgets/password_strength_indicator.dart';

/// Password reset confirmation screen with new password input
class PasswordResetConfirmScreen extends ConsumerStatefulWidget {
  final String actionCode;
  final String? email;
  
  const PasswordResetConfirmScreen({
    super.key,
    required this.actionCode,
    this.email,
  });

  @override
  ConsumerState<PasswordResetConfirmScreen> createState() => _PasswordResetConfirmScreenState();
}

class _PasswordResetConfirmScreenState extends ConsumerState<PasswordResetConfirmScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  
  bool _isLoading = false;
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  String? _message;
  bool _isSuccess = false;
  String? _verifiedEmail;
  
  @override
  void initState() {
    super.initState();
    _verifyActionCode();
  }
  
  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
        title: const Text('Set New Password'),
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
        title: const Text('Set New Password'),
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
                Text(
                  'Set New Password',
                  style: AdaptiveTextStyles.headlineLarge(context),
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
    
    if (_verifiedEmail == null && _message != null) {
      return _buildErrorState();
    }
    
    return _buildPasswordForm();
  }
  
  /// Build password reset form
  Widget _buildPasswordForm() {
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
              _buildPasswordField(),
              AdaptiveSpacing.verticalMedium(),
              _buildPasswordStrengthIndicator(),
              AdaptiveSpacing.verticalMedium(),
              _buildConfirmPasswordField(),
              if (_message != null) ...[
                AdaptiveSpacing.verticalMedium(),
                _buildMessage(),
              ],
              AdaptiveSpacing.verticalLarge(),
              _buildSubmitButton(),
              AdaptiveSpacing.verticalLarge(),
              _buildPasswordRequirements(),
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
          Icons.lock_outline,
          size: 64,
          color: Theme.of(context).colorScheme.primary,
        ),
        AdaptiveSpacing.verticalMedium(),
        Text(
          'Set New Password',
          style: AdaptiveTextStyles.headlineMedium(context),
          textAlign: TextAlign.center,
        ),
        if (_verifiedEmail != null) ...[
          AdaptiveSpacing.verticalSmall(),
          Text(
            'for $_verifiedEmail',
            style: AdaptiveTextStyles.bodyLarge(context).copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
            ),
            textAlign: TextAlign.center,
          ),
        ],
        AdaptiveSpacing.verticalSmall(),
        Text(
          'Choose a strong password to keep your account secure.',
          style: AdaptiveTextStyles.bodyMedium(context).copyWith(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
  
  /// Build password field
  Widget _buildPasswordField() {
    return AdaptiveTextField(
      controller: _passwordController,
      label: 'New Password',
      placeholder: 'Enter your new password',
      obscureText: !_isPasswordVisible,
      textInputAction: TextInputAction.next,
      prefixIcon: const Icon(Icons.lock_outline),
      suffixIcon: IconButton(
        icon: Icon(
          _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
        ),
        onPressed: () {
          setState(() {
            _isPasswordVisible = !_isPasswordVisible;
          });
        },
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Password is required';
        }
        
        if (value.length < 8) {
          return 'Password must be at least 8 characters';
        }
        
        return null;
      },
      onChanged: (value) {
        setState(() {}); // Trigger rebuild for strength indicator
      },
    );
  }
  
  /// Build password strength indicator
  Widget _buildPasswordStrengthIndicator() {
    return PasswordStrengthIndicator(
      password: _passwordController.text,
    );
  }
  
  /// Build confirm password field
  Widget _buildConfirmPasswordField() {
    return AdaptiveTextField(
      controller: _confirmPasswordController,
      label: 'Confirm New Password',
      placeholder: 'Confirm your new password',
      obscureText: !_isConfirmPasswordVisible,
      textInputAction: TextInputAction.done,
      prefixIcon: const Icon(Icons.lock_outline),
      suffixIcon: IconButton(
        icon: Icon(
          _isConfirmPasswordVisible ? Icons.visibility_off : Icons.visibility,
        ),
        onPressed: () {
          setState(() {
            _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
          });
        },
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please confirm your password';
        }
        
        if (value != _passwordController.text) {
          return 'Passwords do not match';
        }
        
        return null;
      },
      onSubmitted: (_) => _handleSubmit(),
    );
  }
  
  /// Build message display
  Widget _buildMessage() {
    return Container(
      padding: const EdgeInsets.all(Spacing.md),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.errorContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(
            Icons.error_outline,
            color: Theme.of(context).colorScheme.onErrorContainer,
          ),
          const SizedBox(width: Spacing.sm),
          Expanded(
            child: Text(
              _message!,
              style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                color: Theme.of(context).colorScheme.onErrorContainer,
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
      text: _isLoading ? 'Updating Password...' : 'Update Password',
      onPressed: _isLoading ? null : _handleSubmit,
      type: ButtonType.primary,
      size: ButtonSize.large,
    );
  }
  
  /// Build password requirements
  Widget _buildPasswordRequirements() {
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
            'Password Requirements',
            style: AdaptiveTextStyles.titleSmall(context).copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          AdaptiveSpacing.verticalSmall(),
          _buildRequirementItem('At least 8 characters long'),
          _buildRequirementItem('Contains uppercase letter (A-Z)'),
          _buildRequirementItem('Contains lowercase letter (a-z)'),
          _buildRequirementItem('Contains number (0-9)'),
          _buildRequirementItem('Contains special character (!@#\$%^&*)'),
        ],
      ),
    );
  }
  
  /// Build requirement item
  Widget _buildRequirementItem(String requirement) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Spacing.xs),
      child: Row(
        children: [
          Icon(
            Icons.check_circle_outline,
            size: 16,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
          ),
          const SizedBox(width: Spacing.xs),
          Expanded(
            child: Text(
              requirement,
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
              Icons.check_circle_outline,
              size: 80,
              color: Theme.of(context).colorScheme.tertiary,
            ),
            AdaptiveSpacing.verticalMedium(),
            Text(
              'Password Updated!',
              style: AdaptiveTextStyles.headlineMedium(context),
              textAlign: TextAlign.center,
            ),
            AdaptiveSpacing.verticalSmall(),
            Text(
              'Your password has been successfully updated. You can now sign in with your new password.',
              style: AdaptiveTextStyles.bodyLarge(context).copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
              ),
              textAlign: TextAlign.center,
            ),
            AdaptiveSpacing.verticalLarge(),
            AdaptiveButton(
              text: 'Sign In',
              onPressed: () {
                // Navigate to login screen
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              type: ButtonType.primary,
              size: ButtonSize.large,
            ),
          ],
        ),
      ),
    );
  }
  
  /// Build error state
  Widget _buildErrorState() {
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
              'Invalid or Expired Link',
              style: AdaptiveTextStyles.headlineMedium(context),
              textAlign: TextAlign.center,
            ),
            AdaptiveSpacing.verticalSmall(),
            Text(
              _message ?? 'This password reset link is invalid or has expired.',
              style: AdaptiveTextStyles.bodyLarge(context).copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
              ),
              textAlign: TextAlign.center,
            ),
            AdaptiveSpacing.verticalLarge(),
            AdaptiveButton(
              text: 'Request New Link',
              onPressed: () {
                Navigator.of(context).pop();
              },
              type: ButtonType.primary,
              size: ButtonSize.large,
            ),
          ],
        ),
      ),
    );
  }
  
  /// Verify action code when screen loads
  Future<void> _verifyActionCode() async {
    try {
      final actionCodeInfo = await ref
          .read(passwordRecoveryUseCasesProvider)
          .checkActionCode(widget.actionCode);
      
      setState(() {
        _verifiedEmail = actionCodeInfo.email;
      });
    } catch (e) {
      setState(() {
        _message = e.toString().replaceFirst('PasswordRecoveryException: ', '');
      });
    }
  }
  
  /// Handle form submission
  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;
    
    setState(() {
      _isLoading = true;
      _message = null;
    });
    
    try {
      await ref.read(passwordRecoveryUseCasesProvider).confirmPasswordReset(
        code: widget.actionCode,
        newPassword: _passwordController.text,
      );
      
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
}