import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/utils/platform_detector.dart';
import '../../../../shared/widgets/adaptive/adaptive_button.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_field.dart';
import '../../../../shared/widgets/adaptive/adaptive_form_widgets.dart';
import '../../../../shared/widgets/responsive_layout.dart';
import '../../domain/entities/auth_state.dart';
import '../../domain/entities/user.dart';
import '../providers/providers.dart';
import '../widgets/auth_header.dart';
import '../widgets/social_auth_buttons.dart';
import '../widgets/user_role_selector.dart';

/// Adaptive registration page with responsive design
/// Supports multiple user roles and comprehensive form validation
class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  
  UserRole _selectedRole = UserRole.investor;
  bool _acceptTerms = false;
  bool _acceptPrivacy = false;
  bool _acceptMarketing = false;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final registerState = ref.watch(registerControllerProvider);

    return Scaffold(
      body: ResponsiveLayout(
        mobile: _buildMobileLayout(context, registerState),
        tablet: _buildTabletLayout(context, registerState),
        desktop: _buildDesktopLayout(context, registerState),
      ),
    );
  }

  Widget _buildMobileLayout(
    BuildContext context,
    AsyncValue<AuthResult?> registerState,
  ) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 16),
            const AuthHeader(
              title: 'Create Account',
              subtitle: 'Join our community of impact investors',
            ),
            const SizedBox(height: 32),
            _buildRegistrationForm(context, registerState),
            const SizedBox(height: 24),
            const SocialAuthButtons(isRegister: true),
            const SizedBox(height: 32),
            _buildFooterLinks(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTabletLayout(
    BuildContext context,
    AsyncValue<AuthResult?> registerState,
  ) {
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(48.0),
          child: SizedBox(
            width: 500,
            child: Column(
              children: [
                const SizedBox(height: 24),
                const AuthHeader(
                  title: 'Create Account',
                  subtitle: 'Join our community of impact investors',
                ),
                const SizedBox(height: 40),
                _buildRegistrationForm(context, registerState),
                const SizedBox(height: 32),
                const SocialAuthButtons(isRegister: true),
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
    AsyncValue<AuthResult?> registerState,
  ) {
    return Row(
      children: [
        // Left side - Branding
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
                    Icons.people_alt,
                    size: 80,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Join Our Community',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 48.0),
                    child: Text(
                      'Connect with organizations and investors creating positive change in the world',
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
        // Right side - Registration form
        Expanded(
          flex: 1,
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(64.0),
              child: SizedBox(
                width: 450,
                child: Column(
                  children: [
                    const AuthHeader(
                      title: 'Create Account',
                      subtitle: 'Join our community of impact investors',
                    ),
                    const SizedBox(height: 40),
                    _buildRegistrationForm(context, registerState),
                    const SizedBox(height: 32),
                    const SocialAuthButtons(isRegister: true),
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

  Widget _buildRegistrationForm(
    BuildContext context,
    AsyncValue<AuthResult?> registerState,
  ) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User Role Selection
          UserRoleSelector(
            selectedRole: _selectedRole,
            onRoleChanged: (role) {
              setState(() {
                _selectedRole = role;
              });
            },
          ),
          const SizedBox(height: 24),
          
          // Personal Information
          Row(
            children: [
              Expanded(
                child: AdaptiveTextField(
                  controller: _firstNameController,
                  label: 'First Name',
                  placeholder: 'Enter your first name',
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'First name is required';
                    }
                    if (value.trim().length < 2) {
                      return 'First name must be at least 2 characters';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: AdaptiveTextField(
                  controller: _lastNameController,
                  label: 'Last Name',
                  placeholder: 'Enter your last name',
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Last name is required';
                    }
                    if (value.trim().length < 2) {
                      return 'Last name must be at least 2 characters';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          // Email
          AdaptiveTextField(
            controller: _emailController,
            label: 'Email Address',
            placeholder: 'Enter your email address',
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Email is required';
              }
              if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                  .hasMatch(value)) {
                return 'Please enter a valid email address';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          
          // Password
          AdaptiveTextField(
            controller: _passwordController,
            label: 'Password',
            placeholder: 'Create a strong password',
            obscureText: _obscurePassword,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Password is required';
              }
              if (value.length < 8) {
                return 'Password must be at least 8 characters';
              }
              if (!_isStrongPassword(value)) {
                return 'Password must contain uppercase, lowercase, number and special character';
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
          
          // Confirm Password
          AdaptiveTextField(
            controller: _confirmPasswordController,
            label: 'Confirm Password',
            placeholder: 'Re-enter your password',
            obscureText: _obscureConfirmPassword,
            textInputAction: TextInputAction.done,
            onSubmitted: (_) => _handleRegister(),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please confirm your password';
              }
              if (value != _passwordController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
            suffixIcon: IconButton(
              icon: Icon(
                _obscureConfirmPassword ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  _obscureConfirmPassword = !_obscureConfirmPassword;
                });
              },
            ),
          ),
          const SizedBox(height: 24),
          
          // Terms and Conditions
          _buildTermsSection(),
          const SizedBox(height: 32),
          
          // Register Button
          SizedBox(
            width: double.infinity,
            child: AdaptiveButton(
              text: registerState.isLoading ? 'Creating Account...' : 'Create Account',
              onPressed: registerState.isLoading || !_canRegister() 
                  ? null 
                  : _handleRegister,
              isLoading: registerState.isLoading,
            ),
          ),
          
          // Error Display
          if (registerState.hasError) ...[
            const SizedBox(height: 16),
            _buildErrorContainer(context, _getErrorMessage(registerState.error)),
          ],
          if (registerState.hasValue && 
              registerState.value != null && 
              !registerState.value!.isSuccess) ...[
            const SizedBox(height: 16),
            _buildErrorContainer(
              context, 
              registerState.value!.failure?.message ?? 'Registration failed',
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildTermsSection() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AdaptiveCheckbox(
              value: _acceptTerms,
              onChanged: (value) {
                setState(() {
                  _acceptTerms = value ?? false;
                });
              },
            ),
            const SizedBox(width: 8),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _acceptTerms = !_acceptTerms;
                  });
                },
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'I agree to the ',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      TextSpan(
                        text: 'Terms of Service',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).primaryColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AdaptiveCheckbox(
              value: _acceptPrivacy,
              onChanged: (value) {
                setState(() {
                  _acceptPrivacy = value ?? false;
                });
              },
            ),
            const SizedBox(width: 8),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _acceptPrivacy = !_acceptPrivacy;
                  });
                },
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'I agree to the ',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).primaryColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AdaptiveCheckbox(
              value: _acceptMarketing,
              onChanged: (value) {
                setState(() {
                  _acceptMarketing = value ?? false;
                });
              },
            ),
            const SizedBox(width: 8),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _acceptMarketing = !_acceptMarketing;
                  });
                },
                child: Text(
                  'I would like to receive marketing emails and updates (optional)',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildErrorContainer(BuildContext context, String message) {
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

  Widget _buildFooterLinks(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Already have an account? ',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Sign In'),
            ),
          ],
        ),
        if (PlatformDetector.isWeb) ...[
          const SizedBox(height: 16),
          Text(
            'By creating an account, you agree to our Terms of Service and Privacy Policy',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
            ),
          ),
        ],
      ],
    );
  }

  bool _canRegister() {
    return _acceptTerms && _acceptPrivacy;
  }

  bool _isStrongPassword(String password) {
    return password.length >= 8 &&
        RegExp(r'[A-Z]').hasMatch(password) &&
        RegExp(r'[a-z]').hasMatch(password) &&
        RegExp(r'[0-9]').hasMatch(password) &&
        RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password);
  }

  void _handleRegister() async {
    if (!_formKey.currentState!.validate() || !_canRegister()) return;

    final registrationData = RegistrationData(
      email: _emailController.text.trim(),
      password: _passwordController.text,
      displayName: '${_firstNameController.text.trim()} ${_lastNameController.text.trim()}',
      firstName: _firstNameController.text.trim(),
      lastName: _lastNameController.text.trim(),
      role: _selectedRole,
      acceptTerms: _acceptTerms,
      acceptPrivacy: _acceptPrivacy,
      acceptMarketing: _acceptMarketing,
    );

    await ref.read(registerControllerProvider.notifier).registerWithEmailAndPassword(
      registrationData: registrationData,
    );

    // Navigation is handled by auth state listener
  }

  String _getErrorMessage(Object? error) {
    if (error == null) return 'An unknown error occurred';
    return error.toString();
  }
}