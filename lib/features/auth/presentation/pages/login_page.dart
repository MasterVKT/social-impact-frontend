import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/utils/platform_detector.dart';
import '../../../../shared/widgets/adaptive/adaptive_button.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_field.dart';
import '../../../../shared/widgets/adaptive/adaptive_form_widgets.dart';
import '../../../../shared/widgets/adaptive/adaptive_snackbar.dart';
import '../../../../shared/widgets/responsive_layout.dart';
import '../providers/providers.dart';
import '../widgets/auth_header.dart';
import '../widgets/social_auth_buttons.dart';
import '../widgets/biometric_auth_button.dart';
import '../../domain/entities/auth_state.dart';
import 'forgot_password_page.dart';
import 'register_page.dart';

/// Adaptive login page with responsive design
/// Supports email/password, social auth, and biometric authentication
class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final signInState = ref.watch(signInControllerProvider);
    final biometricCapabilities = ref.watch(biometricCapabilitiesProvider);

    return Scaffold(
      body: ResponsiveLayout(
        mobile: _buildMobileLayout(context, signInState, biometricCapabilities),
        tablet: _buildTabletLayout(context, signInState, biometricCapabilities),
        desktop:
            _buildDesktopLayout(context, signInState, biometricCapabilities),
      ),
    );
  }

  Widget _buildMobileLayout(
    BuildContext context,
    AsyncValue<AuthResult?> signInState,
    AsyncValue<BiometricCapabilities> biometricCapabilities,
  ) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 32),
            const AuthHeader(
              title: 'Welcome Back',
              subtitle: 'Sign in to your account',
            ),
            const SizedBox(height: 48),
            _buildLoginForm(context, signInState),
            const SizedBox(height: 24),
            _buildBiometricAuth(biometricCapabilities),
            const SizedBox(height: 24),
            const SocialAuthButtons(),
            const SizedBox(height: 32),
            _buildFooterLinks(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTabletLayout(
    BuildContext context,
    AsyncValue<AuthResult?> signInState,
    AsyncValue<BiometricCapabilities> biometricCapabilities,
  ) {
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
                  title: 'Welcome Back',
                  subtitle: 'Sign in to your account',
                ),
                const SizedBox(height: 48),
                _buildLoginForm(context, signInState),
                const SizedBox(height: 32),
                _buildBiometricAuth(biometricCapabilities),
                const SizedBox(height: 32),
                const SocialAuthButtons(),
                const SizedBox(height: 40),
                _buildFooterLinks(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(
    BuildContext context,
    AsyncValue<AuthResult?> signInState,
    AsyncValue<BiometricCapabilities> biometricCapabilities,
  ) {
    return Row(
      children: [
        // Left side - Branding/Image
        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).primaryColor.withOpacity(0.8),
                ],
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.eco,
                    size: 80,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Social Finance',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 48.0),
                    child: Text(
                      'Invest in projects that create positive social and environmental impact',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.white.withOpacity(0.9),
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // Right side - Login form
        Expanded(
          flex: 1,
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(64.0),
              child: SizedBox(
                width: 400,
                child: Column(
                  children: [
                    const AuthHeader(
                      title: 'Welcome Back',
                      subtitle: 'Sign in to your account',
                    ),
                    const SizedBox(height: 48),
                    _buildLoginForm(context, signInState),
                    const SizedBox(height: 32),
                    _buildBiometricAuth(biometricCapabilities),
                    const SizedBox(height: 32),
                    const SocialAuthButtons(),
                    const SizedBox(height: 40),
                    _buildFooterLinks(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginForm(
    BuildContext context,
    AsyncValue<AuthResult?> signInState,
  ) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          AdaptiveTextField(
            controller: _emailController,
            label: 'Email',
            placeholder: 'Enter your email address',
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                  .hasMatch(value)) {
                return 'Please enter a valid email address';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          AdaptiveTextField(
            controller: _passwordController,
            label: 'Password',
            placeholder: 'Enter your password',
            obscureText: _obscurePassword,
            textInputAction: TextInputAction.done,
            onSubmitted: (_) => _handleSignIn(),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              if (value.length < 6) {
                return 'Password must be at least 6 characters';
              }
              return null;
            },
            suffixIcon: IconButton(
              icon: Icon(
                _obscurePassword ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              AdaptiveCheckbox(
                value: _rememberMe,
                onChanged: (value) {
                  setState(() {
                    _rememberMe = value ?? false;
                  });
                },
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Remember me',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ForgotPasswordPage(),
                    ),
                  );
                },
                child: const Text('Forgot Password?'),
              ),
            ],
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: AdaptiveButton(
              text: 'Sign In',
              onPressed: signInState.isLoading ? null : _handleSignIn,
              isLoading: signInState.isLoading,
            ),
          ),
          if (signInState.hasError) ...[
            const SizedBox(height: 16),
            Container(
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
                      _getErrorMessage(signInState.error),
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          if (signInState.hasValue &&
              signInState.value != null &&
              !signInState.value!.isSuccess) ...[
            const SizedBox(height: 16),
            Container(
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
                      signInState.value!.failure?.message ?? 'Sign in failed',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildBiometricAuth(
      AsyncValue<BiometricCapabilities> biometricCapabilities) {
    return biometricCapabilities.when(
      data: (capabilities) {
        if (!capabilities.isSupported || !capabilities.isAvailable) {
          return const SizedBox.shrink();
        }

        return Column(
          children: [
            Row(
              children: [
                const Expanded(child: Divider()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'OR',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                const Expanded(child: Divider()),
              ],
            ),
            const SizedBox(height: 16),
            BiometricAuthButton(
              reason: capabilities.reason,
              onAuthenticated: _handleBiometricAuth,
              onFailed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('L\'authentification biométrique a échoué'),
                  ),
                );
              },
              onUnavailable: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                        'L\'authentification biométrique n\'est pas disponible'),
                  ),
                );
              },
            ),
          ],
        );
      },
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
    );
  }

  Widget _buildFooterLinks(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don't have an account? ",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const RegisterPage(),
                  ),
                );
              },
              child: const Text('Sign Up'),
            ),
          ],
        ),
        if (PlatformDetector.isWeb) ...[
          const SizedBox(height: 16),
          Text(
            'By signing in, you agree to our Terms of Service and Privacy Policy',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                ),
          ),
        ],
      ],
    );
  }

  void _handleSignIn() async {
    if (!_formKey.currentState!.validate()) return;

    // Call sign-in method (returns void)
    await ref
        .read(signInControllerProvider.notifier)
        .signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text,
          rememberMe: _rememberMe,
        );

    // Check the state after sign-in attempt
    if (mounted) {
      final state = ref.read(signInControllerProvider);
      state.whenData((authResult) {
        authResult?.when(
          success: (user) {
            AdaptiveSnackbar.show(
              context: context,
              message: 'Welcome back!',
              type: AdaptiveSnackbarType.success,
            );
          },
          failure: (authFailure) {
            AdaptiveSnackbar.show(
              context: context,
              message: authFailure.message,
              type: AdaptiveSnackbarType.error,
            );
          },
        );
      });
    }

    // Navigation is handled by auth state listener
  }

  void _handleBiometricAuth() async {
    await ref.read(signInControllerProvider.notifier).signInWithBiometric();
  }

  String _getErrorMessage(Object? error) {
    if (error == null) return 'An unknown error occurred';
    return error.toString();
  }
}
