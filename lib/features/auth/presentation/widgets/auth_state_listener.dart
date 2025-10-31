import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/auth_state.dart';
import '../providers/providers.dart';

/// Authentication state listener widget
/// Handles navigation and UI updates based on authentication state changes
class AuthStateListener extends ConsumerWidget {
  final Widget child;
  final VoidCallback? onAuthenticated;
  final VoidCallback? onUnauthenticated;
  final Function(String)? onError;

  const AuthStateListener({
    super.key,
    required this.child,
    this.onAuthenticated,
    this.onUnauthenticated,
    this.onError,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AuthState>(authStateNotifierProvider, (previous, next) {
      next.when(
        authenticated: (user) {
          // Clear any previous error states
          _clearErrorStates(ref);
          
          // Show success message
          if (previous != null && previous != next) {
            _showSuccessSnackBar(context, 'Welcome back, ${user.displayName ?? user.email}!');
          }
          
          // Execute callback
          onAuthenticated?.call();
        },
        unauthenticated: () {
          // Clear any previous states
          _clearErrorStates(ref);
          
          // Execute callback
          onUnauthenticated?.call();
        },
        loading: () {
          // Handle loading state if needed
        },
        error: (message, code) {
          // Show error message
          _showErrorSnackBar(context, message);
          
          // Execute error callback
          onError?.call(message);
        },
        initial: () {
          // Handle initial state
        },
      );
    });

    // Listen to sign in controller state for immediate feedback
    ref.listen<AsyncValue<AuthResult?>>(signInControllerProvider, (previous, next) {
      next.whenData((result) {
        if (result != null) {
          if (result.isSuccess) {
            // Success is handled by auth state listener
            ref.read(signInControllerProvider.notifier).clearState();
          } else if (result.failure != null) {
            _showErrorSnackBar(context, result.failure!.message);
          }
        }
      });
    });

    // Listen to register controller state
    ref.listen<AsyncValue<AuthResult?>>(registerControllerProvider, (previous, next) {
      next.whenData((result) {
        if (result != null) {
          if (result.isSuccess) {
            _showSuccessSnackBar(context, 'Account created successfully! Please verify your email.');
            ref.read(registerControllerProvider.notifier).clearState();
          } else if (result.failure != null) {
            _showErrorSnackBar(context, result.failure!.message);
          }
        }
      });
    });

    // Listen to password controller state
    ref.listen<AsyncValue<AuthResult?>>(passwordControllerProvider, (previous, next) {
      next.whenData((result) {
        if (result != null && result.isSuccess) {
          _showSuccessSnackBar(context, 'Password reset email sent successfully!');
        }
      });
    });

    return child;
  }

  void _clearErrorStates(WidgetRef ref) {
    // Clear any controller states that might show errors
    ref.read(signInControllerProvider.notifier).clearState();
    ref.read(registerControllerProvider.notifier).clearState();
    ref.read(passwordControllerProvider.notifier).clearState();
  }

  void _showSuccessSnackBar(BuildContext context, String message) {
    if (!context.mounted) return;
    
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(
              Icons.check_circle,
              color: Colors.white,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 4),
      ),
    );
  }

  void _showErrorSnackBar(BuildContext context, String message) {
    if (!context.mounted) return;
    
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(
              Icons.error,
              color: Colors.white,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 5),
        action: SnackBarAction(
          label: 'Dismiss',
          textColor: Colors.white,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }
}