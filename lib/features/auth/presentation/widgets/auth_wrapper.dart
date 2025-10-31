import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../pages/dashboard_page.dart';
import '../pages/login_page.dart';
import '../providers/providers.dart';
import 'auth_state_listener.dart';

/// Authentication wrapper widget
/// Handles authentication flow and displays appropriate screens
class AuthWrapper extends ConsumerWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateNotifierProvider);

    return AuthStateListener(
      onAuthenticated: () {
        // Handle successful authentication
        debugPrint('User authenticated successfully');
      },
      onUnauthenticated: () {
        // Handle sign out
        debugPrint('User signed out');
      },
      onError: (message) {
        // Handle authentication errors
        debugPrint('Authentication error: $message');
      },
      child: authState.when(
        authenticated: (user) {
          // Show dashboard for authenticated users
          return const DashboardPage();
        },
        unauthenticated: () {
          // Show login page for unauthenticated users
          return const LoginPage();
        },
        loading: () {
          // Show loading screen
          return const Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Loading...'),
                ],
              ),
            ),
          );
        },
        error: (message, code) {
          // Show error screen
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error,
                    size: 64,
                    color: Theme.of(context).colorScheme.error,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Authentication Error',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Text(
                      message,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      // Reset authentication state
                      ref.invalidate(authStateNotifierProvider);
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          );
        },
        initial: () {
          // Show initial loading state
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}