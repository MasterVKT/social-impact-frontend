import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/dashboard_page.dart';
import '../../features/investments/presentation/screens/investments_screen.dart';
import '../../features/investments/presentation/screens/browse_projects_screen.dart';
import '../../features/organizations/presentation/screens/organization_dashboard_screen.dart';
import '../../features/transactions/presentation/screens/transactions_screen.dart';
import '../../features/impact/presentation/screens/impact_dashboard_screen.dart';
import '../../features/notifications/presentation/screens/notifications_screen.dart';
import '../../features/analytics/presentation/screens/analytics_dashboard_screen.dart';
import '../../features/search/presentation/screens/advanced_search_screen.dart';
import '../../features/user_profile/presentation/screens/user_profile_screen.dart';
import '../../features/settings/presentation/screens/settings_screen.dart';
import '../../features/help_support/presentation/screens/help_support_screen.dart';
import '../../shared/widgets/ui_library/component_showcase_screen.dart';
import '../error/error_screen.dart';

/// Application router configuration with comprehensive navigation
class AppRouter {
  static final GoRouter _router = GoRouter(
    initialLocation: '/login',
    errorBuilder: (context, state) => ErrorScreen(error: state.error),
    routes: [
      // Authentication Routes
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      
      // Main Dashboard
      GoRoute(
        path: '/dashboard',
        name: 'dashboard',
        builder: (context, state) => const DashboardPage(),
      ),
      
      // Investment Routes
      GoRoute(
        path: '/investments',
        name: 'investments',
        builder: (context, state) => const InvestmentsScreen(),
      ),

      // Portfolio Route (redirect to investments for backward compatibility)
      GoRoute(
        path: '/portfolio',
        redirect: (context, state) => '/investments',
      ),

      // Project Routes
      GoRoute(
        path: '/projects',
        name: 'projects',
        builder: (context, state) => const BrowseProjectsScreen(),
      ),

      // Browse Route (alias for /projects)
      GoRoute(
        path: '/browse',
        name: 'browse',
        redirect: (context, state) => '/projects',
      ),
      
      // Organization Routes
      GoRoute(
        path: '/organizations',
        name: 'organizations',
        builder: (context, state) => const OrganizationDashboardScreen(),
      ),
      
      // Transaction Routes
      GoRoute(
        path: '/transactions',
        name: 'transactions',
        builder: (context, state) => const TransactionsScreen(),
      ),
      
      // Impact Measurement Routes
      GoRoute(
        path: '/impact',
        name: 'impact',
        builder: (context, state) => const ImpactDashboardScreen(),
      ),
      
      // Notification Routes
      GoRoute(
        path: '/notifications',
        name: 'notifications',
        builder: (context, state) => const NotificationsScreen(),
      ),
      
      // Analytics Routes
      GoRoute(
        path: '/analytics',
        name: 'analytics',
        builder: (context, state) => const AnalyticsDashboardScreen(),
      ),
      
      // Search Routes
      GoRoute(
        path: '/search',
        name: 'search',
        builder: (context, state) => const AdvancedSearchScreen(),
      ),
      
      // Profile Routes
      GoRoute(
        path: '/profile',
        name: 'profile',
        builder: (context, state) => const UserProfileScreen(),
        routes: [
          GoRoute(
            path: '/:userId',
            name: 'user-profile',
            builder: (context, state) {
              final userId = state.pathParameters['userId']!;
              return UserProfileScreen(userId: userId);
            },
          ),
          GoRoute(
            path: '/edit',
            name: 'profile-edit',
            builder: (context, state) => const ProfileEditScreen(),
          ),
        ],
      ),
      
      // Settings Routes
      GoRoute(
        path: '/settings',
        name: 'settings',
        builder: (context, state) => const SettingsScreen(),
        routes: [
          GoRoute(
            path: '/:category',
            name: 'settings-category',
            builder: (context, state) {
              final category = state.pathParameters['category']!;
              return SettingsCategoryScreen(category: category);
            },
          ),
          GoRoute(
            path: '/privacy',
            name: 'privacy-settings',
            builder: (context, state) => const PrivacySettingsScreen(),
          ),
          GoRoute(
            path: '/security',
            name: 'security-settings',
            builder: (context, state) => const SecuritySettingsScreen(),
          ),
        ],
      ),
      
      // Help & Support Routes
      GoRoute(
        path: '/help',
        name: 'help',
        builder: (context, state) => const HelpSupportScreen(),
        routes: [
          GoRoute(
            path: '/article/:id',
            name: 'help-article',
            builder: (context, state) {
              final id = state.pathParameters['id']!;
              return HelpArticleScreen(articleId: id);
            },
          ),
          GoRoute(
            path: '/faq/:id',
            name: 'faq',
            builder: (context, state) {
              final id = state.pathParameters['id']!;
              return FAQDetailScreen(faqId: id);
            },
          ),
          GoRoute(
            path: '/category/:id',
            name: 'help-category',
            builder: (context, state) {
              final id = state.pathParameters['id']!;
              return HelpCategoryScreen(categoryId: id);
            },
          ),
        ],
      ),
      
      // Support Routes
      GoRoute(
        path: '/support',
        name: 'support',
        builder: (context, state) => const SupportDashboardScreen(),
        routes: [
          GoRoute(
            path: '/ticket/create',
            name: 'create-ticket',
            builder: (context, state) => const CreateTicketScreen(),
          ),
          GoRoute(
            path: '/ticket/:id',
            name: 'ticket-detail',
            builder: (context, state) {
              final id = state.pathParameters['id']!;
              return TicketDetailScreen(ticketId: id);
            },
          ),
          GoRoute(
            path: '/tickets',
            name: 'my-tickets',
            builder: (context, state) => const MyTicketsScreen(),
          ),
          GoRoute(
            path: '/contact',
            name: 'contact-support',
            builder: (context, state) => const ContactSupportScreen(),
          ),
        ],
      ),
      
      // Community Routes
      GoRoute(
        path: '/community',
        name: 'community',
        builder: (context, state) => const CommunityScreen(),
        routes: [
          GoRoute(
            path: '/join',
            name: 'join-community',
            builder: (context, state) => const JoinCommunityScreen(),
          ),
          GoRoute(
            path: '/discussion/:id',
            name: 'discussion',
            builder: (context, state) {
              final id = state.pathParameters['id']!;
              return DiscussionScreen(discussionId: id);
            },
          ),
        ],
      ),
      
      // Component Library Route (for development)
      GoRoute(
        path: '/components',
        name: 'components',
        builder: (context, state) => const ComponentShowcaseScreen(),
      ),
      
      // System Status Route
      GoRoute(
        path: '/status',
        name: 'system-status',
        builder: (context, state) => const SystemStatusScreen(),
      ),
      
      // Legal Routes
      GoRoute(
        path: '/legal',
        name: 'legal',
        routes: [
          GoRoute(
            path: '/terms',
            name: 'terms',
            builder: (context, state) => const TermsOfServiceScreen(),
          ),
          GoRoute(
            path: '/privacy',
            name: 'privacy-policy',
            builder: (context, state) => const PrivacyPolicyScreen(),
          ),
          GoRoute(
            path: '/cookies',
            name: 'cookie-policy',
            builder: (context, state) => const CookiePolicyScreen(),
          ),
        ],
      ),
    ],
    redirect: (context, state) {
      // Add authentication logic here
      final isLoggedIn = _checkAuthStatus();
      final isLoggingIn = state.matchedLocation == '/login';
      
      if (!isLoggedIn && !isLoggingIn) {
        return '/login';
      }
      
      if (isLoggedIn && isLoggingIn) {
        return '/dashboard';
      }
      
      return null;
    },
  );
  
  static GoRouter get router => _router;
  
  /// Check if user is authenticated
  static bool _checkAuthStatus() {
    // This would integrate with your auth service
    // For now, return true to allow navigation
    return true;
  }
}

// Placeholder screens that need to be implemented
class ProfileEditScreen extends StatelessWidget {
  const ProfileEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profile')),
      body: const Center(
        child: Text('Profile Edit Screen - Coming Soon'),
      ),
    );
  }
}

class SettingsCategoryScreen extends StatelessWidget {
  final String category;
  
  const SettingsCategoryScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${category.toUpperCase()} Settings')),
      body: Center(
        child: Text('$category Settings Screen - Coming Soon'),
      ),
    );
  }
}

class PrivacySettingsScreen extends StatelessWidget {
  const PrivacySettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Privacy Settings')),
      body: const Center(
        child: Text('Privacy Settings Screen - Coming Soon'),
      ),
    );
  }
}

class SecuritySettingsScreen extends StatelessWidget {
  const SecuritySettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Security Settings')),
      body: const Center(
        child: Text('Security Settings Screen - Coming Soon'),
      ),
    );
  }
}

class HelpArticleScreen extends StatelessWidget {
  final String articleId;
  
  const HelpArticleScreen({super.key, required this.articleId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Help Article')),
      body: Center(
        child: Text('Help Article $articleId - Coming Soon'),
      ),
    );
  }
}

class FAQDetailScreen extends StatelessWidget {
  final String faqId;
  
  const FAQDetailScreen({super.key, required this.faqId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FAQ')),
      body: Center(
        child: Text('FAQ $faqId - Coming Soon'),
      ),
    );
  }
}

class HelpCategoryScreen extends StatelessWidget {
  final String categoryId;
  
  const HelpCategoryScreen({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Help Category')),
      body: Center(
        child: Text('Help Category $categoryId - Coming Soon'),
      ),
    );
  }
}

class SupportDashboardScreen extends StatelessWidget {
  const SupportDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Support Dashboard')),
      body: const Center(
        child: Text('Support Dashboard - Coming Soon'),
      ),
    );
  }
}

class CreateTicketScreen extends StatelessWidget {
  const CreateTicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Support Ticket')),
      body: const Center(
        child: Text('Create Ticket Screen - Coming Soon'),
      ),
    );
  }
}

class TicketDetailScreen extends StatelessWidget {
  final String ticketId;
  
  const TicketDetailScreen({super.key, required this.ticketId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Support Ticket')),
      body: Center(
        child: Text('Ticket $ticketId - Coming Soon'),
      ),
    );
  }
}

class MyTicketsScreen extends StatelessWidget {
  const MyTicketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Tickets')),
      body: const Center(
        child: Text('My Tickets Screen - Coming Soon'),
      ),
    );
  }
}

class ContactSupportScreen extends StatelessWidget {
  const ContactSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contact Support')),
      body: const Center(
        child: Text('Contact Support Screen - Coming Soon'),
      ),
    );
  }
}

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Community')),
      body: const Center(
        child: Text('Community Screen - Coming Soon'),
      ),
    );
  }
}

class JoinCommunityScreen extends StatelessWidget {
  const JoinCommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Join Community')),
      body: const Center(
        child: Text('Join Community Screen - Coming Soon'),
      ),
    );
  }
}

class DiscussionScreen extends StatelessWidget {
  final String discussionId;
  
  const DiscussionScreen({super.key, required this.discussionId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Discussion')),
      body: Center(
        child: Text('Discussion $discussionId - Coming Soon'),
      ),
    );
  }
}

class SystemStatusScreen extends StatelessWidget {
  const SystemStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('System Status')),
      body: const Center(
        child: Text('System Status Screen - Coming Soon'),
      ),
    );
  }
}

class TermsOfServiceScreen extends StatelessWidget {
  const TermsOfServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Terms of Service')),
      body: const Center(
        child: Text('Terms of Service Screen - Coming Soon'),
      ),
    );
  }
}

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Privacy Policy')),
      body: const Center(
        child: Text('Privacy Policy Screen - Coming Soon'),
      ),
    );
  }
}

class CookiePolicyScreen extends StatelessWidget {
  const CookiePolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cookie Policy')),
      body: const Center(
        child: Text('Cookie Policy Screen - Coming Soon'),
      ),
    );
  }
}