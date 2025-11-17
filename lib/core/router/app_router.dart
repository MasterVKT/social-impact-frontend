import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../navigation/adaptive_navigation_wrapper.dart';
import '../../core/utils/platform_detector.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/register_page.dart';
import '../../features/auth/presentation/screens/dashboard_screen.dart';
import '../../features/auth/presentation/screens/password_reset_screen.dart';
import '../../features/auth/presentation/screens/password_reset_confirm_screen.dart';
import '../../features/auth/presentation/screens/email_verification_screen.dart';
import '../../features/auth/presentation/screens/kyc/kyc_main_screen.dart';
import '../../features/auth/presentation/providers/auth_providers.dart';
import '../../features/auth/domain/entities/user.dart';
import '../../features/investments/presentation/screens/investments_screen.dart';
import '../../features/investments/presentation/screens/browse_projects_screen.dart';
import '../../features/user_profile/presentation/screens/user_profile_screen.dart';
import '../../features/settings/presentation/screens/settings_screen.dart';

/// Global navigator key for shell navigation
final _shellNavigatorKey = GlobalKey<NavigatorState>();

/// App router configuration with adaptive navigation and role-based routing
final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _shellNavigatorKey,
    initialLocation: '/login',
    redirect: (context, state) {
      final user = ref.watch(currentUserProvider);
      final isAuthenticated = user != null;
      final location = state.matchedLocation;
      
      // Public routes that don't require authentication
      final publicRoutes = [
        '/login',
        '/register',
        '/password-reset',
        '/email-verification',
      ];
      
      // Handle password reset confirmation with action code
      if (location.startsWith('/password-reset/confirm')) {
        return null; // Allow access
      }
      
      if (!isAuthenticated) {
        // Redirect unauthenticated users to login
        if (!publicRoutes.contains(location)) {
          return '/login';
        }
        return null;
      }
      
      // Authenticated user trying to access public routes
      if (publicRoutes.contains(location)) {
        return '/dashboard';
      }
      
      // Check role-based access
      if (!_hasAccessToRoute(user, location)) {
        return '/dashboard'; // Redirect to safe route
      }
      
      return null; // Allow access
    },
    
    routes: [
      // Authentication routes (no auth required)
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        path: '/password-reset',
        builder: (context, state) => const PasswordResetScreen(),
      ),
      GoRoute(
        path: '/password-reset/confirm',
        builder: (context, state) {
          final actionCode = state.uri.queryParameters['oobCode'] ?? '';
          return PasswordResetConfirmScreen(actionCode: actionCode);
        },
      ),
      GoRoute(
        path: '/email-verification',
        builder: (context, state) => const EmailVerificationScreen(),
      ),
      GoRoute(
        path: '/kyc',
        builder: (context, state) => const KYCMainScreen(),
      ),
      
      // Main application shell with adaptive navigation (authenticated routes)
      ShellRoute(
        builder: (context, state, child) {
          return AdaptiveNavigationWrapper(
            currentRoute: state.fullPath ?? state.path ?? '/dashboard',
            child: child,
          );
        },
        routes: [
          // Dashboard
          GoRoute(
            path: '/dashboard',
            pageBuilder: (context, state) => _buildAdaptivePage(
              context: context,
              state: state,
              child: const DashboardScreen(),
            ),
          ),
          
          // Role-based routes for investors
          GoRoute(
            path: '/investments',
            pageBuilder: (context, state) => _buildAdaptivePage(
              context: context,
              state: state,
              child: const InvestmentsScreen(),
            ),
          ),
          GoRoute(
            path: '/portfolio',
            redirect: (context, state) => '/investments',
          ),
          GoRoute(
            path: '/browse',
            pageBuilder: (context, state) => _buildAdaptivePage(
              context: context,
              state: state,
              child: const BrowseProjectsScreen(),
            ),
          ),
          
          // Role-based routes for organizations
          GoRoute(
            path: '/projects',
            pageBuilder: (context, state) => _buildAdaptivePage(
              context: context,
              state: state,
              child: const _PlaceholderPage(title: 'Projects'),
            ),
            routes: [
              GoRoute(
                path: ':projectId',
                builder: (context, state) {
                  final projectId = state.pathParameters['projectId']!;
                  return _PlaceholderPage(title: 'Project Details: $projectId');
                },
              ),
              GoRoute(
                path: 'create',
                builder: (context, state) => const _PlaceholderPage(title: 'Create Project'),
              ),
            ],
          ),
          GoRoute(
            path: '/impact',
            pageBuilder: (context, state) => _buildAdaptivePage(
              context: context,
              state: state,
              child: const _PlaceholderPage(title: 'Impact'),
            ),
          ),
          GoRoute(
            path: '/analytics',
            pageBuilder: (context, state) => _buildAdaptivePage(
              context: context,
              state: state,
              child: const _PlaceholderPage(title: 'Analytics'),
            ),
          ),
          
          // Role-based routes for auditors
          GoRoute(
            path: '/audits',
            pageBuilder: (context, state) => _buildAdaptivePage(
              context: context,
              state: state,
              child: const _PlaceholderPage(title: 'Audits'),
            ),
            routes: [
              GoRoute(
                path: ':auditId',
                builder: (context, state) {
                  final auditId = state.pathParameters['auditId']!;
                  return _PlaceholderPage(title: 'Audit Details: $auditId');
                },
              ),
            ],
          ),
          GoRoute(
            path: '/reports',
            pageBuilder: (context, state) => _buildAdaptivePage(
              context: context,
              state: state,
              child: const _PlaceholderPage(title: 'Reports'),
            ),
          ),
          
          // Role-based routes for admins
          GoRoute(
            path: '/admin/users',
            pageBuilder: (context, state) => _buildAdaptivePage(
              context: context,
              state: state,
              child: const _PlaceholderPage(title: 'User Management'),
            ),
          ),
          GoRoute(
            path: '/admin/projects',
            pageBuilder: (context, state) => _buildAdaptivePage(
              context: context,
              state: state,
              child: const _PlaceholderPage(title: 'Project Management'),
            ),
          ),
          GoRoute(
            path: '/admin/analytics',
            pageBuilder: (context, state) => _buildAdaptivePage(
              context: context,
              state: state,
              child: const _PlaceholderPage(title: 'Platform Analytics'),
            ),
          ),
          
          // Common routes
          GoRoute(
            path: '/profile',
            pageBuilder: (context, state) => _buildAdaptivePage(
              context: context,
              state: state,
              child: const UserProfileScreen(),
            ),
            routes: [
              GoRoute(
                path: 'edit',
                builder: (context, state) => const _PlaceholderPage(title: 'Edit Profile'),
              ),
            ],
          ),
          GoRoute(
            path: '/settings',
            pageBuilder: (context, state) => _buildAdaptivePage(
              context: context,
              state: state,
              child: const SettingsScreen(),
            ),
          ),
          GoRoute(
            path: '/activities',
            pageBuilder: (context, state) => _buildAdaptivePage(
              context: context,
              state: state,
              child: const _PlaceholderPage(title: 'Activities'),
            ),
          ),
        ],
      ),
    ],
    
    // Error handling
    errorBuilder: (context, state) => _PlaceholderPage(
      title: 'Error: ${state.error}',
      isError: true,
    ),
  );
});

/// Helper method to build platform-appropriate pages
Page<dynamic> _buildAdaptivePage({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  if (PlatformDetector.isMobile) {
    return MaterialPage(
      key: state.pageKey,
      child: child,
    );
  } else {
    return NoTransitionPage(
      key: state.pageKey,
      child: child,
    );
  }
}

/// Helper method to check role-based access
bool _hasAccessToRoute(User user, String location) {
  // Define role-based access control
  final roleRoutes = {
    UserRole.investor: [
      '/dashboard',
      '/investments',
      '/portfolio', 
      '/browse',
      '/profile',
      '/settings',
      '/activities',
      '/kyc',
    ],
    UserRole.organization: [
      '/dashboard',
      '/projects',
      '/impact',
      '/analytics',
      '/profile',
      '/settings',
      '/activities',
      '/kyc',
    ],
    UserRole.auditor: [
      '/dashboard',
      '/audits',
      '/reports',
      '/profile',
      '/settings',
      '/activities',
      '/kyc',
    ],
    UserRole.admin: [
      '/dashboard',
      '/admin/users',
      '/admin/projects',
      '/admin/analytics',
      '/profile',
      '/settings',
      '/activities',
      '/kyc',
    ],
  };
  
  final allowedRoutes = roleRoutes[user.role] ?? [];
  
  // Check if the location starts with any allowed route
  for (final route in allowedRoutes) {
    if (location.startsWith(route)) {
      return true;
    }
  }
  
  return false;
}

/// Route names constants
class RouteNames {
  static const String root = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String dashboard = '/dashboard';
  static const String profile = '/profile';
  static const String projects = '/projects';
  static const String investments = '/investments';
  static const String audits = '/audits';
  static const String admin = '/admin';
}

/// Placeholder page widget for development
class _PlaceholderPage extends StatelessWidget {
  final String title;
  final bool isError;
  
  const _PlaceholderPage({
    required this.title,
    this.isError = false,
  });
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: isError ? Colors.red : null,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isError ? Icons.error : Icons.construction,
              size: 64,
              color: isError ? Colors.red : Colors.orange,
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'This page is under construction',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            Text(
              'Platform: ${PlatformDetector.currentPlatform.name}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              'Screen: ${MediaQuery.of(context).size.width.toInt()}x${MediaQuery.of(context).size.height.toInt()}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}