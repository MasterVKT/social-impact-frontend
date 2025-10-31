import '../entities/auth_state.dart';
import '../entities/user.dart';
import '../entities/action_code_info.dart';

/// Authentication repository interface defining contract for data operations
/// Follows Clean Architecture - domain layer doesn't depend on external frameworks
abstract class AuthRepository {
  /// Stream of authentication state changes
  Stream<AuthState> get authStateChanges;
  
  /// Get current authenticated user
  User? get currentUser;
  
  /// Check if user is currently authenticated
  bool get isAuthenticated;
  
  // Email/Password Authentication
  /// Sign in with email and password
  Future<AuthResult> signInWithEmailAndPassword({
    required String email,
    required String password,
    bool rememberMe = false,
  });
  
  /// Register new user with email and password
  Future<AuthResult> registerWithEmailAndPassword({
    required RegistrationData registrationData,
  });
  
  // Social Authentication
  /// Sign in with Google (adaptive: popup web, native mobile)
  Future<AuthResult> signInWithGoogle();
  
  /// Sign in with Apple (iOS only)
  Future<AuthResult> signInWithApple();
  
  // Biometric Authentication
  /// Check if biometric authentication is available
  Future<bool> isBiometricAvailable();
  
  /// Check if biometric authentication is enabled for user
  Future<bool> isBiometricEnabled();
  
  /// Enable biometric authentication for current user
  Future<AuthResult> enableBiometricAuthentication();
  
  /// Authenticate with biometrics
  Future<AuthResult> signInWithBiometric();
  
  /// Disable biometric authentication
  Future<void> disableBiometricAuthentication();
  
  // Password Management
  /// Send password reset email (for use cases)
  Future<void> sendPasswordResetEmail({required String email});
  
  /// Confirm password reset with code
  Future<void> confirmPasswordReset({
    required String code,
    required String newPassword,
  });
  
  /// Change user password (for use cases)
  Future<AuthResult> changePassword({
    required String currentPassword,
    required String newPassword,
  });
  
  /// Update user email with password confirmation
  Future<void> updateEmail({
    required String newEmail,
    required String password,
  });
  
  /// Check action code and get info
  Future<ActionCodeInfo> checkActionCode(String actionCode);
  
  /// Apply action code (for email verification)
  Future<void> applyActionCode(String actionCode);
  
  // Email Verification
  /// Send email verification (for use cases)
  Future<AuthResult> sendEmailVerification();
  
  /// Verify email with code
  Future<AuthResult> verifyEmail({required String code});
  
  /// Check if current user's email is verified
  Future<bool> isEmailVerified();
  
  /// Get current user (for use cases)
  Future<User?> getCurrentUser();
  
  // Session Management
  /// Sign out current user
  Future<void> signOut();
  
  /// Delete user account
  Future<AuthResult> deleteAccount();
  
  /// Refresh authentication token
  Future<AuthResult> refreshToken();
  
  /// Get current session information
  Future<AuthSession?> getCurrentSession();
  
  // User Profile Management
  /// Update user profile
  Future<AuthResult> updateProfile({
    String? displayName,
    String? photoURL,
    UserProfile? profile,
  });
  
  /// Update user preferences
  Future<AuthResult> updatePreferences({
    required UserPreferences preferences,
  });
  
  // KYC Management
  /// Start KYC verification process
  Future<AuthResult> startKYCVerification({
    required Map<String, dynamic> documents,
  });
  
  /// Check KYC status
  Future<KYCStatus> getKYCStatus();
  
  /// Update KYC status (admin only)
  Future<AuthResult> updateKYCStatus({
    required String userId,
    required KYCStatus status,
    String? reason,
  });
  
  // Multi-factor Authentication
  /// Enable two-factor authentication
  Future<AuthResult> enableTwoFactorAuth();
  
  /// Disable two-factor authentication  
  Future<AuthResult> disableTwoFactorAuth();
  
  /// Verify two-factor authentication code
  Future<AuthResult> verifyTwoFactorCode({
    required String code,
  });
  
  // Account Linking
  /// Link authentication provider to current account
  Future<AuthResult> linkProvider({
    required AuthProvider provider,
    required Map<String, dynamic> credentials,
  });
  
  /// Unlink authentication provider from current account
  Future<AuthResult> unlinkProvider({
    required AuthProvider provider,
  });
  
  /// Get linked providers for current user
  Future<List<AuthProvider>> getLinkedProviders();
  
  // Administrative
  /// Update user role (admin only)
  Future<AuthResult> updateUserRole({
    required String userId,
    required UserRole role,
  });
  
  /// Update user status (admin only)
  Future<AuthResult> updateUserStatus({
    required String userId,
    required UserStatus status,
    String? reason,
  });
  
  // Platform-specific methods
  /// Platform-specific initialization
  Future<void> initialize();
  
  /// Cleanup resources
  Future<void> dispose();
}