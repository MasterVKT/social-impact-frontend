import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/router/route_names.dart';
import '../../domain/entities/user.dart';
import 'auth_providers.dart';

part 'auth_navigation_provider.g.dart';

/// Authentication navigation provider
/// Handles auth-based navigation and route protection
@riverpod
class AuthNavigationController extends _$AuthNavigationController {
  @override
  AuthNavigationState build() {
    final isAuth = ref.watch(isAuthenticatedProvider);
    final user = ref.watch(currentUserProvider);
    final userRole = ref.watch(userRoleProvider);
    final kycStatus = ref.watch(kycStatusProvider);
    final isEmailVerified = ref.watch(isEmailVerifiedProvider);
    
    return AuthNavigationState(
      isAuthenticated: isAuth,
      user: user,
      userRole: userRole,
      kycStatus: kycStatus,
      isEmailVerified: isEmailVerified,
    );
  }
  
  /// Get initial route based on authentication state
  String getInitialRoute() {
    final state = this.state;
    
    if (!state.isAuthenticated) {
      return RouteNames.login;
    }
    
    // Check if user needs to complete onboarding
    if (state.user != null && !state.user!.isProfileComplete) {
      return RouteNames.onboarding;
    }
    
    // Check if email verification is required
    if (!state.isEmailVerified && _requiresEmailVerification(state.userRole)) {
      return RouteNames.emailVerification;
    }
    
    // Check if KYC is required
    if (state.kycStatus != KYCStatus.verified && _requiresKYC(state.userRole)) {
      return RouteNames.kycVerification;
    }
    
    // Navigate to role-appropriate dashboard
    return _getDashboardRoute(state.userRole);
  }
  
  /// Check if user can access route
  bool canAccessRoute(String route) {
    final state = this.state;
    
    // Public routes that don't require authentication
    final publicRoutes = {
      RouteNames.login,
      RouteNames.register,
      RouteNames.forgotPassword,
      RouteNames.home,
      RouteNames.about,
    };
    
    if (publicRoutes.contains(route)) {
      return true;
    }
    
    // All other routes require authentication
    if (!state.isAuthenticated) {
      return false;
    }
    
    // Check role-specific route access
    return _canUserAccessRoute(route, state);
  }
  
  /// Navigate to post-authentication route
  void navigateAfterAuth(BuildContext context) {
    final initialRoute = getInitialRoute();
    context.go(initialRoute);
  }
  
  /// Navigate to appropriate dashboard based on user role
  void navigateToDashboard(BuildContext context) {
    final state = this.state;
    final dashboardRoute = _getDashboardRoute(state.userRole);
    context.go(dashboardRoute);
  }
  
  /// Handle sign out navigation
  void navigateAfterSignOut(BuildContext context) {
    context.go(RouteNames.home);
  }
  
  /// Navigate to onboarding flow
  void navigateToOnboarding(BuildContext context) {
    context.go(RouteNames.onboarding);
  }
  
  /// Navigate to email verification
  void navigateToEmailVerification(BuildContext context) {
    context.go(RouteNames.emailVerification);
  }
  
  /// Navigate to KYC verification
  void navigateToKYC(BuildContext context) {
    context.go(RouteNames.kycVerification);
  }
  
  /// Get dashboard route based on user role
  String _getDashboardRoute(UserRole? role) {
    switch (role) {
      case UserRole.admin:
        return RouteNames.adminDashboard;
      case UserRole.organization:
        return RouteNames.organizationDashboard;
      case UserRole.investor:
        return RouteNames.investorDashboard;
      case UserRole.auditor:
        return RouteNames.investorDashboard; // Use investor dashboard for now
      case null:
        return RouteNames.home;
    }
  }
  
  /// Check if user role requires email verification
  bool _requiresEmailVerification(UserRole? role) {
    return role == UserRole.investor || 
           role == UserRole.organization || 
           role == UserRole.admin;
  }
  
  /// Check if user role requires KYC verification
  bool _requiresKYC(UserRole? role) {
    return role == UserRole.investor || role == UserRole.organization;
  }
  
  /// Check if user can access specific route based on role and status
  bool _canUserAccessRoute(String route, AuthNavigationState state) {
    final user = state.user;
    final role = state.userRole;
    final kycStatus = state.kycStatus;
    
    if (user == null) return false;
    
    // Admin routes
    final adminRoutes = {
      RouteNames.adminDashboard,
      RouteNames.userManagement,
      RouteNames.systemSettings,
    };
    
    if (adminRoutes.contains(route)) {
      return role == UserRole.admin;
    }
    
    // Organization routes
    final organizationRoutes = {
      RouteNames.organizationDashboard,
      RouteNames.projectManagement,
      RouteNames.organizationProfile,
    };
    
    if (organizationRoutes.contains(route)) {
      return role == UserRole.organization;
    }
    
    // Investor routes
    final investorRoutes = {
      RouteNames.investorDashboard,
      RouteNames.portfolio,
      RouteNames.investments,
    };
    
    if (investorRoutes.contains(route)) {
      return role == UserRole.investor;
    }
    
    // KYC-required routes
    final kycRequiredRoutes = {
      RouteNames.investments,
      RouteNames.portfolio,
      RouteNames.projectManagement,
    };
    
    if (kycRequiredRoutes.contains(route)) {
      return kycStatus == KYCStatus.verified;
    }
    
    // Email verification required routes
    final emailVerificationRequiredRoutes = {
      RouteNames.investorDashboard,
      RouteNames.organizationDashboard,
      RouteNames.adminDashboard,
    };
    
    if (emailVerificationRequiredRoutes.contains(route)) {
      return state.isEmailVerified;
    }
    
    // Default: allow access to common authenticated routes
    return true;
  }
}

/// Authentication navigation state
class AuthNavigationState {
  final bool isAuthenticated;
  final User? user;
  final UserRole? userRole;
  final KYCStatus? kycStatus;
  final bool isEmailVerified;
  
  const AuthNavigationState({
    required this.isAuthenticated,
    this.user,
    this.userRole,
    this.kycStatus,
    required this.isEmailVerified,
  });
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AuthNavigationState &&
        other.isAuthenticated == isAuthenticated &&
        other.user == user &&
        other.userRole == userRole &&
        other.kycStatus == kycStatus &&
        other.isEmailVerified == isEmailVerified;
  }
  
  @override
  int get hashCode {
    return isAuthenticated.hashCode ^
        user.hashCode ^
        userRole.hashCode ^
        kycStatus.hashCode ^
        isEmailVerified.hashCode;
  }
}