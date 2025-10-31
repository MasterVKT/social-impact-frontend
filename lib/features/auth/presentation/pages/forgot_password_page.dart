import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/adaptive/adaptive_button.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_field.dart';
import '../../../../shared/widgets/responsive_layout.dart';
import '../providers/providers.dart';
import '../widgets/auth_header.dart';

/// Forgot password page with adaptive design
/// Allows users to request password reset email
class ForgotPasswordPage extends ConsumerStatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  ConsumerState<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends ConsumerState<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final passwordState = ref.watch(passwordControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset Password'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ResponsiveLayout(
        mobile: _buildMobileLayout(passwordState),
        tablet: _buildTabletLayout(passwordState),
        desktop: _buildDesktopLayout(passwordState),
      ),
    );
  }

  Widget _buildMobileLayout(AsyncValue passwordState) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 32),
            const AuthHeader(
              title: 'Reset Password',
              subtitle: 'Enter your email to receive password reset instructions',
            ),
            const SizedBox(height: 48),
            _buildResetForm(passwordState),
            const SizedBox(height: 32),
            _buildBackToLogin(),
          ],
        ),
      ),
    );
  }

  Widget _buildTabletLayout(AsyncValue passwordState) {
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(48.0),
          child: SizedBox(
            width: 400,
            child: Column(
              children: [
                const SizedBox(height: 24),
                const AuthHeader(
                  title: 'Reset Password',
                  subtitle: 'Enter your email to receive password reset instructions',
                ),
                const SizedBox(height: 48),
                _buildResetForm(passwordState),
                const SizedBox(height: 32),
                _buildBackToLogin(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(AsyncValue passwordState) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(64.0),
        child: SizedBox(
          width: 450,
          child: Column(
            children: [
              const AuthHeader(
                title: 'Reset Password',
                subtitle: 'Enter your email to receive password reset instructions',
              ),
              const SizedBox(height: 48),
              _buildResetForm(passwordState),
              const SizedBox(height: 32),
              _buildBackToLogin(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResetForm(AsyncValue passwordState) {
    final hasSucceeded = passwordState.hasValue && 
                        passwordState.value != null && 
                        passwordState.value!.isSuccess;

    if (hasSucceeded) {
      return _buildSuccessMessage();
    }

    return Form(
      key: _formKey,
      child: Column(
        children: [
          AdaptiveTextField(
            controller: _emailController,
            label: 'Email Address',
            placeholder: 'Enter your email address',
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.done,
            onSubmitted: (_) => _handlePasswordReset(),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email address';
              }
              if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                  .hasMatch(value)) {
                return 'Please enter a valid email address';
              }
              return null;
            },
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: AdaptiveButton(
              text: passwordState.isLoading ? 'Sending...' : 'Send Reset Email',
              onPressed: passwordState.isLoading ? null : _handlePasswordReset,
              isLoading: passwordState.isLoading,
            ),
          ),
          if (passwordState.hasError) ...[
            const SizedBox(height: 16),
            _buildErrorContainer(_getErrorMessage(passwordState.error)),
          ],
          if (passwordState.hasValue && 
              passwordState.value != null && 
              !passwordState.value!.isSuccess) ...[
            const SizedBox(height: 16),
            _buildErrorContainer(
              passwordState.value!.failure?.message ?? 'Failed to send reset email',
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSuccessMessage() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(
            Icons.email_outlined,
            size: 48,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 16),
          Text(
            'Reset Email Sent!',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'We\'ve sent password reset instructions to ${_emailController.text}. Please check your email and follow the instructions to reset your password.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Didn\'t receive the email? Check your spam folder or try again with a different email address.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorContainer(String message) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.errorContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(
            Icons.error_outline,
            color: Theme.of(context).colorScheme.error,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackToLogin() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Remember your password? ',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Back to Sign In'),
        ),
      ],
    );
  }

  void _handlePasswordReset() async {
    if (!_formKey.currentState!.validate()) return;

    await ref.read(passwordControllerProvider.notifier).sendPasswordResetEmail(
      email: _emailController.text.trim(),
    );
  }

  String _getErrorMessage(Object? error) {
    if (error == null) return 'An unknown error occurred';
    return error.toString();
  }
}