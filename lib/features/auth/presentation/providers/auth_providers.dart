import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/data_sources/firebase_auth_data_source.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../data/services/apple_sign_in_service.dart';
import '../../domain/entities/auth_state.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/use_cases/auth_use_cases.dart';

part 'auth_providers.g.dart';

// Data Sources and Repositories

/// Firebase authentication data source provider
@riverpod
FirebaseAuthDataSource firebaseAuthDataSource(FirebaseAuthDataSourceRef ref) {
  return FirebaseAuthDataSource();
}

/// Authentication repository provider
@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  final firebaseDataSource = ref.watch(firebaseAuthDataSourceProvider);
  return AuthRepositoryImpl(firebaseDataSource: firebaseDataSource);
}

// Use Cases Providers

/// Sign in use case provider
@riverpod
SignInUseCase signInUseCase(SignInUseCaseRef ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return SignInUseCase(authRepository);
}

/// Registration use case provider
@riverpod
RegisterUseCase registerUseCase(RegisterUseCaseRef ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return RegisterUseCase(authRepository);
}

/// Password management use case provider
@riverpod
PasswordManagementUseCase passwordManagementUseCase(PasswordManagementUseCaseRef ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return PasswordManagementUseCase(authRepository);
}

/// Biometric authentication use case provider
@riverpod
BiometricAuthUseCase biometricAuthUseCase(BiometricAuthUseCaseRef ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return BiometricAuthUseCase(authRepository);
}

/// User management use case provider
@riverpod
UserManagementUseCase userManagementUseCase(UserManagementUseCaseRef ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return UserManagementUseCase(authRepository);
}

/// Email verification use case provider
@riverpod
EmailVerificationUseCase emailVerificationUseCase(EmailVerificationUseCaseRef ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return EmailVerificationUseCase(authRepository);
}

/// Session management use case provider
@riverpod
SessionManagementUseCase sessionManagementUseCase(SessionManagementUseCaseRef ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return SessionManagementUseCase(authRepository);
}

// State Providers

/// Authentication state stream provider
/// Provides real-time authentication state changes
@riverpod
Stream<AuthState> authStateStream(AuthStateStreamRef ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.authStateChanges;
}

/// Current authentication state provider
/// Provides the current authentication state synchronously
@riverpod
class AuthStateNotifier extends _$AuthStateNotifier {
  @override
  AuthState build() {
    final authRepository = ref.watch(authRepositoryProvider);
    
    // Listen to auth state changes and update the state
    ref.listen(authStateStreamProvider, (previous, next) {
      next.when(
        data: (authState) => state = authState,
        loading: () => state = const AuthState.loading(),
        error: (error, _) => state = AuthState.error(error.toString()),
      );
    });
    
    // Return initial state based on current user
    if (authRepository.isAuthenticated) {
      final user = authRepository.currentUser;
      return user != null 
          ? AuthState.authenticated(user)
          : const AuthState.unauthenticated();
    }
    
    return const AuthState.unauthenticated();
  }
  
  /// Update authentication state
  void updateAuthState(AuthState newState) {
    state = newState;
  }
}

/// Current user provider
/// Provides the currently authenticated user
@riverpod
User? currentUser(CurrentUserRef ref) {
  final authState = ref.watch(authStateNotifierProvider);
  return authState.maybeWhen(
    authenticated: (user) => user,
    orElse: () => null,
  );
}

/// Authentication status provider
/// Provides boolean authentication status
@riverpod
bool isAuthenticated(IsAuthenticatedRef ref) {
  final authState = ref.watch(authStateNotifierProvider);
  return authState.maybeWhen(
    authenticated: (_) => true,
    orElse: () => false,
  );
}

/// User role provider
/// Provides the current user's role
@riverpod
UserRole? userRole(UserRoleRef ref) {
  final user = ref.watch(currentUserProvider);
  return user?.role;
}

/// KYC status provider
/// Provides the current user's KYC verification status
@riverpod
KYCStatus? kycStatus(KycStatusRef ref) {
  final user = ref.watch(currentUserProvider);
  return user?.kycStatus;
}

/// Email verification status provider
/// Provides the current user's email verification status
@riverpod
bool isEmailVerified(IsEmailVerifiedRef ref) {
  final user = ref.watch(currentUserProvider);
  return user?.isEmailVerified ?? false;
}

/// User permissions provider
/// Provides computed permissions based on user role and status
@riverpod
UserPermissions userPermissions(UserPermissionsRef ref) {
  final user = ref.watch(currentUserProvider);
  final isAuth = ref.watch(isAuthenticatedProvider);
  
  if (!isAuth || user == null) {
    return const UserPermissions();
  }
  
  return UserPermissions(
    canViewDashboard: user.status == UserStatus.active,
    canInvest: user.canInvest,
    canCreateProjects: user.role == UserRole.organization && user.kycStatus == KYCStatus.verified,
    canManageUsers: user.role == UserRole.admin,
    canAccessAdminPanel: user.role == UserRole.admin,
    canViewAnalytics: user.role == UserRole.admin || user.role == UserRole.organization,
    canEditProfile: user.status == UserStatus.active,
    canWithdrawFunds: user.canInvest && user.kycStatus == KYCStatus.verified,
  );
}

/// Biometric availability provider
/// Checks if biometric authentication is available on current platform
@riverpod
Future<BiometricCapabilities> biometricCapabilities(BiometricCapabilitiesRef ref) async {
  final biometricUseCase = ref.watch(biometricAuthUseCaseProvider);
  
  if (!biometricUseCase.isSupportedOnPlatform) {
    return const BiometricCapabilities(
      isSupported: false,
      isAvailable: false,
      isEnabled: false,
      reason: 'Biometric authentication not supported on this platform',
    );
  }
  
  try {
    final capabilities = await biometricUseCase.getBiometricCapabilities();
    return BiometricCapabilities(
      isSupported: capabilities['supported'] as bool,
      isAvailable: capabilities['available'] as bool,
      isEnabled: capabilities['enabled'] as bool,
      reason: capabilities['reason'] as String,
    );
  } catch (e) {
    return BiometricCapabilities(
      isSupported: false,
      isAvailable: false,
      isEnabled: false,
      reason: 'Failed to check biometric capabilities: ${e.toString()}',
    );
  }
}

/// Apple Sign-In availability provider
/// Checks if Apple Sign-In is available on current platform (iOS only)
@riverpod
Future<AppleSignInCapabilities> appleSignInCapabilities(AppleSignInCapabilitiesRef ref) async {
  try {
    // Import the service dynamically to avoid compilation issues on non-iOS
    final availabilityInfo = await _getAppleSignInAvailabilityInfo();
    
    return AppleSignInCapabilities(
      isSupported: availabilityInfo['supported'] as bool,
      isAvailable: availabilityInfo['available'] as bool,
      reason: availabilityInfo['reason'] as String,
      fallbackOptions: (availabilityInfo['fallbackOptions'] as List).cast<String>(),
    );
  } catch (e) {
    return AppleSignInCapabilities(
      isSupported: false,
      isAvailable: false,
      reason: 'Failed to check Apple Sign-In availability: ${e.toString()}',
      fallbackOptions: ['Email/Password', 'Google Sign-In'],
    );
  }
}

/// Helper function to get Apple Sign-In availability info
Future<Map<String, dynamic>> _getAppleSignInAvailabilityInfo() async {
  try {
    return await AppleSignInService.getAvailabilityInfo();
  } catch (e) {
    // Fallback if service is not available
    return {
      'supported': false,
      'available': false,
      'reason': 'Apple Sign-In service not available: ${e.toString()}',
      'fallbackOptions': ['Email/Password', 'Google Sign-In'],
    };
  }
}

/// Session status provider
/// Provides current session information and security status
@riverpod
Future<SessionStatus> sessionStatus(SessionStatusRef ref) async {
  final sessionUseCase = ref.watch(sessionManagementUseCaseProvider);
  final isAuth = ref.watch(isAuthenticatedProvider);
  
  if (!isAuth) {
    return const SessionStatus(
      isValid: false,
      isSecure: false,
      securityLevel: 'None',
      issues: ['Not authenticated'],
      recommendations: ['Please sign in'],
    );
  }
  
  try {
    final status = await sessionUseCase.getSessionStatus();
    final security = await sessionUseCase.validateSessionSecurity();
    
    return SessionStatus(
      isValid: status['isValid'] as bool,
      isSecure: security['isSecure'] as bool,
      securityLevel: security['securityLevel'] as String,
      issues: (security['issues'] as List).cast<String>(),
      recommendations: (security['recommendations'] as List).cast<String>(),
      sessionInfo: status['session'] as Map<String, dynamic>?,
    );
  } catch (e) {
    return const SessionStatus(
      isValid: false,
      isSecure: false,
      securityLevel: 'Error',
      issues: ['Failed to validate session'],
      recommendations: ['Please try signing out and back in'],
    );
  }
}

// Helper Data Classes

/// User permissions data class
class UserPermissions {
  final bool canViewDashboard;
  final bool canInvest;
  final bool canCreateProjects;
  final bool canManageUsers;
  final bool canAccessAdminPanel;
  final bool canViewAnalytics;
  final bool canEditProfile;
  final bool canWithdrawFunds;
  
  const UserPermissions({
    this.canViewDashboard = false,
    this.canInvest = false,
    this.canCreateProjects = false,
    this.canManageUsers = false,
    this.canAccessAdminPanel = false,
    this.canViewAnalytics = false,
    this.canEditProfile = false,
    this.canWithdrawFunds = false,
  });
}

/// Biometric capabilities data class
class BiometricCapabilities {
  final bool isSupported;
  final bool isAvailable;
  final bool isEnabled;
  final String reason;
  final List<String> availableBiometrics;
  
  const BiometricCapabilities({
    required this.isSupported,
    required this.isAvailable,
    required this.isEnabled,
    required this.reason,
    this.availableBiometrics = const [],
  });
}

/// Session status data class
class SessionStatus {
  final bool isValid;
  final bool isSecure;
  final String securityLevel;
  final List<String> issues;
  final List<String> recommendations;
  final Map<String, dynamic>? sessionInfo;
  
  const SessionStatus({
    required this.isValid,
    required this.isSecure,
    required this.securityLevel,
    required this.issues,
    required this.recommendations,
    this.sessionInfo,
  });
}

/// Apple Sign-In capabilities data class
class AppleSignInCapabilities {
  final bool isSupported;
  final bool isAvailable;
  final String reason;
  final List<String> fallbackOptions;
  
  const AppleSignInCapabilities({
    required this.isSupported,
    required this.isAvailable,
    required this.reason,
    required this.fallbackOptions,
  });
}