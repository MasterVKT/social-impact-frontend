import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/utils/platform_detector.dart';
import '../providers/providers.dart';

/// Social authentication buttons widget
/// Provides Google and Apple Sign-In with platform-aware behavior
class SocialAuthButtons extends ConsumerWidget {
  final bool isRegister;

  const SocialAuthButtons({
    super.key,
    this.isRegister = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signInState = ref.watch(signInControllerProvider);
    final appleCapabilities = ref.watch(appleSignInCapabilitiesProvider);

    return Column(
      children: [
        // Divider
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
        
        // Google Sign-In
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: signInState.isLoading ? null : () => _handleGoogleSignIn(ref),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/google_logo.png',
                  height: 20,
                  width: 20,
                  errorBuilder: (context, error, stackTrace) => Icon(
                    Icons.g_mobiledata,
                    size: 24,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  isRegister 
                      ? 'Continue with Google'
                      : 'Sign in with Google',
                ),
              ],
            ),
          ),
        ),
        
        // Apple Sign-In (iOS only)
        appleCapabilities.when(
          data: (capabilities) {
            if (capabilities.isSupported && capabilities.isAvailable) {
              return Padding(
                padding: const EdgeInsets.only(top: 12),
                child: SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: signInState.isLoading ? null : () => _handleAppleSignIn(ref),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.apple,
                          size: 24,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          isRegister 
                              ? 'Continue with Apple'
                              : 'Sign in with Apple',
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else if (capabilities.isSupported && !capabilities.isAvailable) {
              return Padding(
                padding: const EdgeInsets.only(top: 12),
                child: _buildAppleSignInUnavailable(context, capabilities.reason),
              );
            }
            return const SizedBox.shrink();
          },
          loading: () => const SizedBox.shrink(),
          error: (_, __) => const SizedBox.shrink(),
        ),
        
        // Platform-specific messaging
        const SizedBox(height: 12),
        _buildPlatformInfo(context),
      ],
    );
  }

  void _handleGoogleSignIn(WidgetRef ref) async {
    await ref.read(signInControllerProvider.notifier).signInWithGoogle();
  }

  void _handleAppleSignIn(WidgetRef ref) async {
    await ref.read(signInControllerProvider.notifier).signInWithApple();
  }

  Widget _buildPlatformInfo(BuildContext context) {
    String message;
    if (PlatformDetector.isWeb) {
      message = 'Web: Google Sign-In uses secure popup flow';
    } else if (PlatformDetector.isAndroid) {
      message = 'Android: Google Sign-In uses native authentication';
    } else if (PlatformDetector.isIOS) {
      message = 'iOS: Google Sign-In and Apple Sign-In available';
    } else {
      message = 'Social sign-in may be limited on this platform';
    }

    return Row(
      children: [
        Icon(
          Icons.info_outline,
          size: 16,
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
        ),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            message,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAppleSignInUnavailable(BuildContext context, String reason) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest.withOpacity(0.5),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.5),
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.apple,
            size: 20,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Apple Sign-In',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                  ),
                ),
                Text(
                  reason,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}