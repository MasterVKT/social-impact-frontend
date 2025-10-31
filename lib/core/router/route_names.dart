/// Route names for the Social Finance Impact Platform
/// Provides centralized route management for multi-platform navigation
class RouteNames {
  // Root routes
  static const String root = '/';
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';

  // Authentication routes
  static const String auth = '/auth';
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String forgotPassword = '/auth/forgot-password';
  static const String resetPassword = '/auth/reset-password';
  static const String verifyEmail = '/auth/verify-email';

  // Main app routes
  static const String home = '/home';
  static const String dashboard = '/dashboard';

  // Project routes
  static const String projects = '/projects';
  static const String projectDetails = '/projects/:projectId';
  static const String createProject = '/projects/create';
  static const String editProject = '/projects/:projectId/edit';

  // Contribution routes
  static const String contributions = '/contributions';
  static const String contributionDetails = '/contributions/:contributionId';
  static const String createContribution = '/contributions/create';
  static const String contributionHistory = '/contributions/history';

  // Audit routes
  static const String audits = '/audits';
  static const String auditDetails = '/audits/:auditId';
  static const String createAudit = '/audits/create';

  // Investment routes
  static const String investments = '/investments';
  static const String investmentDetails = '/investments/:investmentId';
  static const String portfolio = '/portfolio';

  // Profile routes
  static const String profile = '/profile';
  static const String editProfile = '/profile/edit';
  static const String settings = '/profile/settings';
  static const String kyc = '/profile/kyc';
  static const String kycVerification = '/profile/kyc';
  static const String emailVerification = '/auth/verify-email';

  // Dashboard routes par rôle
  static const String organizationDashboard = '/dashboard';
  static const String investorDashboard = '/dashboard';

  // Autres routes
  static const String systemSettings = '/settings';
  static const String userManagement = '/admin/users';
  static const String organizationProfile = '/profile';
  static const String projectManagement = '/projects';

  // Admin routes
  static const String admin = '/admin';
  static const String adminDashboard = '/admin/dashboard';
  static const String adminUsers = '/admin/users';
  static const String adminProjects = '/admin/projects';
  static const String adminAudits = '/admin/audits';

  // Settings routes
  static const String notifications = '/settings/notifications';
  static const String privacy = '/settings/privacy';
  static const String support = '/settings/support';
  static const String about = '/settings/about';

  // Error routes
  static const String notFound = '/404';
  static const String error = '/error';

  // Platform-specific routes

  // Mobile-specific routes
  static const String mobileAuth = '/mobile/auth';
  static const String mobileOnboarding = '/mobile/onboarding';

  // Web-specific routes
  static const String webAuth = '/web/auth';
  static const String webDashboard = '/web/dashboard';

  /// Helper methods for route construction

  static String projectDetailsRoute(String projectId) {
    return '/projects/$projectId';
  }

  static String editProjectRoute(String projectId) {
    return '/projects/$projectId/edit';
  }

  static String contributionDetailsRoute(String contributionId) {
    return '/contributions/$contributionId';
  }

  static String auditDetailsRoute(String auditId) {
    return '/audits/$auditId';
  }

  /// Route validation helpers

  static bool isAuthRoute(String route) {
    return route.startsWith('/auth');
  }

  static bool isProtectedRoute(String route) {
    const protectedRoutes = [
      dashboard,
      projects,
      contributions,
      audits,
      profile,
      admin,
    ];

    return protectedRoutes
        .any((protectedRoute) => route.startsWith(protectedRoute));
  }

  static bool isAdminRoute(String route) {
    return route.startsWith('/admin');
  }

  static bool isMobileSpecificRoute(String route) {
    return route.startsWith('/mobile');
  }

  static bool isWebSpecificRoute(String route) {
    return route.startsWith('/web');
  }

  /// Get appropriate route based on platform

  static String getAuthRouteForPlatform({required bool isMobile}) {
    return isMobile ? mobileAuth : auth;
  }

  static String getDashboardRouteForPlatform({required bool isMobile}) {
    return isMobile ? dashboard : webDashboard;
  }
}
