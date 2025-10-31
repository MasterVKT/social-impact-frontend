import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/auth_state.dart';
import '../../domain/entities/user.dart';
import 'auth_providers.dart';

part 'auth_controller_providers.g.dart';

// Authentication Action Controllers

/// Sign in controller
/// Handles sign in operations with loading states
@riverpod
class SignInController extends _$SignInController {
  @override
  AsyncValue<AuthResult?> build() {
    return const AsyncValue.data(null);
  }
  
  /// Sign in with email and password
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
    bool rememberMe = false,
  }) async {
    state = const AsyncValue.loading();
    
    try {
      final signInUseCase = ref.read(signInUseCaseProvider);
      final result = await signInUseCase.signInWithEmailAndPassword(
        email: email,
        password: password,
        rememberMe: rememberMe,
      );
      
      state = AsyncValue.data(result);
      
      // Update auth state if successful
      if (result.isSuccess) {
        ref.read(authStateNotifierProvider.notifier)
            .updateAuthState(AuthState.authenticated(result.user!));
      }
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
  
  /// Sign in with Google
  Future<void> signInWithGoogle() async {
    state = const AsyncValue.loading();
    
    try {
      final signInUseCase = ref.read(signInUseCaseProvider);
      final result = await signInUseCase.signInWithGoogle();
      
      state = AsyncValue.data(result);
      
      if (result.isSuccess) {
        ref.read(authStateNotifierProvider.notifier)
            .updateAuthState(AuthState.authenticated(result.user!));
      }
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
  
  /// Sign in with Apple
  Future<void> signInWithApple() async {
    state = const AsyncValue.loading();
    
    try {
      final signInUseCase = ref.read(signInUseCaseProvider);
      final result = await signInUseCase.signInWithApple();
      
      state = AsyncValue.data(result);
      
      if (result.isSuccess) {
        ref.read(authStateNotifierProvider.notifier)
            .updateAuthState(AuthState.authenticated(result.user!));
      }
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
  
  /// Sign in with biometric authentication
  Future<void> signInWithBiometric() async {
    state = const AsyncValue.loading();
    
    try {
      final signInUseCase = ref.read(signInUseCaseProvider);
      final result = await signInUseCase.signInWithBiometric();
      
      state = AsyncValue.data(result);
      
      if (result.isSuccess) {
        ref.read(authStateNotifierProvider.notifier)
            .updateAuthState(AuthState.authenticated(result.user!));
      }
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
  
  /// Clear sign in state
  void clearState() {
    state = const AsyncValue.data(null);
  }
}

/// Registration controller
/// Handles user registration operations
@riverpod
class RegisterController extends _$RegisterController {
  @override
  AsyncValue<AuthResult?> build() {
    return const AsyncValue.data(null);
  }
  
  /// Register new user with email and password
  Future<void> registerWithEmailAndPassword({
    required RegistrationData registrationData,
  }) async {
    state = const AsyncValue.loading();
    
    try {
      final registerUseCase = ref.read(registerUseCaseProvider);
      final result = await registerUseCase.registerWithEmailAndPassword(
        registrationData: registrationData,
      );
      
      state = AsyncValue.data(result);
      
      if (result.isSuccess) {
        ref.read(authStateNotifierProvider.notifier)
            .updateAuthState(AuthState.authenticated(result.user!));
      }
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
  
  /// Clear registration state
  void clearState() {
    state = const AsyncValue.data(null);
  }
}

/// Password management controller
/// Handles password-related operations
@riverpod
class PasswordController extends _$PasswordController {
  @override
  AsyncValue<AuthResult?> build() {
    return const AsyncValue.data(null);
  }
  
  /// Send password reset email
  Future<void> sendPasswordResetEmail({
    required String email,
  }) async {
    state = const AsyncValue.loading();
    
    try {
      final passwordUseCase = ref.read(passwordManagementUseCaseProvider);
      final result = await passwordUseCase.sendPasswordResetEmail(email: email);
      
      state = AsyncValue.data(result);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
  
  /// Change user password
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    state = const AsyncValue.loading();
    
    try {
      final passwordUseCase = ref.read(passwordManagementUseCaseProvider);
      final result = await passwordUseCase.changePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
      );
      
      state = AsyncValue.data(result);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
  
  /// Clear password state
  void clearState() {
    state = const AsyncValue.data(null);
  }
}

/// Biometric authentication controller
/// Handles biometric authentication setup and operations
@riverpod
class BiometricController extends _$BiometricController {
  @override
  AsyncValue<AuthResult?> build() {
    return const AsyncValue.data(null);
  }
  
  /// Enable biometric authentication
  Future<void> enableBiometricAuth() async {
    state = const AsyncValue.loading();
    
    try {
      final biometricUseCase = ref.read(biometricAuthUseCaseProvider);
      final result = await biometricUseCase.enableBiometricAuthentication();
      
      state = AsyncValue.data(result);
      
      // Refresh biometric capabilities
      ref.invalidate(biometricCapabilitiesProvider);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
  
  /// Disable biometric authentication
  Future<void> disableBiometricAuth() async {
    state = const AsyncValue.loading();
    
    try {
      final biometricUseCase = ref.read(biometricAuthUseCaseProvider);
      final result = await biometricUseCase.disableBiometricAuthentication();
      
      state = AsyncValue.data(result);
      
      // Refresh biometric capabilities
      ref.invalidate(biometricCapabilitiesProvider);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
  
  /// Authenticate with biometrics
  Future<void> authenticateWithBiometric() async {
    state = const AsyncValue.loading();
    
    try {
      final biometricUseCase = ref.read(biometricAuthUseCaseProvider);
      final result = await biometricUseCase.authenticateWithBiometrics();
      
      state = AsyncValue.data(result);
      
      if (result.isSuccess) {
        ref.read(authStateNotifierProvider.notifier)
            .updateAuthState(AuthState.authenticated(result.user!));
      }
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
  
  /// Clear biometric state
  void clearState() {
    state = const AsyncValue.data(null);
  }
}

/// User profile controller
/// Handles user profile management operations
@riverpod
class UserProfileController extends _$UserProfileController {
  @override
  AsyncValue<AuthResult?> build() {
    return const AsyncValue.data(null);
  }
  
  /// Update user profile
  Future<void> updateProfile({
    String? displayName,
    String? photoURL,
    UserProfile? profile,
  }) async {
    state = const AsyncValue.loading();
    
    try {
      final userManagementUseCase = ref.read(userManagementUseCaseProvider);
      final result = await userManagementUseCase.updateProfile(
        displayName: displayName,
        photoURL: photoURL,
        profile: profile,
      );
      
      state = AsyncValue.data(result);
      
      if (result.isSuccess) {
        // Refresh current user data
        ref.invalidate(currentUserProvider);
      }
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
  
  /// Update user preferences
  Future<void> updatePreferences({
    required UserPreferences preferences,
  }) async {
    state = const AsyncValue.loading();
    
    try {
      final userManagementUseCase = ref.read(userManagementUseCaseProvider);
      final result = await userManagementUseCase.updatePreferences(
        preferences: preferences,
      );
      
      state = AsyncValue.data(result);
      
      if (result.isSuccess) {
        // Refresh current user data
        ref.invalidate(currentUserProvider);
      }
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
  
  /// Start KYC verification
  Future<void> startKYCVerification({
    required Map<String, dynamic> documents,
  }) async {
    state = const AsyncValue.loading();
    
    try {
      final userManagementUseCase = ref.read(userManagementUseCaseProvider);
      final result = await userManagementUseCase.startKYCVerification(
        documents: documents,
      );
      
      state = AsyncValue.data(result);
      
      if (result.isSuccess) {
        // Refresh KYC status
        ref.invalidate(kycStatusProvider);
      }
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
  
  /// Clear profile state
  void clearState() {
    state = const AsyncValue.data(null);
  }
}

/// Email verification controller
/// Handles email verification operations
@riverpod
class EmailVerificationController extends _$EmailVerificationController {
  @override
  AsyncValue<AuthResult?> build() {
    return const AsyncValue.data(null);
  }
  
  /// Send email verification
  Future<void> sendEmailVerification() async {
    state = const AsyncValue.loading();
    
    try {
      final emailUseCase = ref.read(emailVerificationUseCaseProvider);
      final result = await emailUseCase.sendEmailVerification();
      
      state = AsyncValue.data(result);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
  
  /// Verify email with code
  Future<void> verifyEmailWithCode({
    required String code,
  }) async {
    state = const AsyncValue.loading();
    
    try {
      final emailUseCase = ref.read(emailVerificationUseCaseProvider);
      final result = await emailUseCase.verifyEmailWithCode(code: code);
      
      state = AsyncValue.data(result);
      
      if (result.isSuccess) {
        // Refresh email verification status
        ref.invalidate(isEmailVerifiedProvider);
        ref.invalidate(currentUserProvider);
      }
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
  
  /// Resend email verification
  Future<void> resendEmailVerification() async {
    state = const AsyncValue.loading();
    
    try {
      final emailUseCase = ref.read(emailVerificationUseCaseProvider);
      final result = await emailUseCase.resendEmailVerification();
      
      state = AsyncValue.data(result);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
  
  /// Clear email verification state
  void clearState() {
    state = const AsyncValue.data(null);
  }
}

/// Session controller
/// Handles session management operations
@riverpod
class SessionController extends _$SessionController {
  @override
  AsyncValue<void> build() {
    return const AsyncValue.data(null);
  }
  
  /// Sign out current user
  Future<void> signOut() async {
    state = const AsyncValue.loading();
    
    try {
      final sessionUseCase = ref.read(sessionManagementUseCaseProvider);
      await sessionUseCase.signOut();
      
      // Update auth state
      ref.read(authStateNotifierProvider.notifier)
          .updateAuthState(const AuthState.unauthenticated());
      
      // Clear all related provider states
      ref.invalidate(currentUserProvider);
      ref.invalidate(isAuthenticatedProvider);
      ref.invalidate(userRoleProvider);
      ref.invalidate(kycStatusProvider);
      ref.invalidate(isEmailVerifiedProvider);
      ref.invalidate(userPermissionsProvider);
      
      state = const AsyncValue.data(null);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
  
  /// Delete user account
  Future<void> deleteAccount() async {
    state = const AsyncValue.loading();
    
    try {
      final userManagementUseCase = ref.read(userManagementUseCaseProvider);
      final result = await userManagementUseCase.deleteAccount();
      
      if (result.isSuccess) {
        // Update auth state
        ref.read(authStateNotifierProvider.notifier)
            .updateAuthState(const AuthState.unauthenticated());
        
        // Clear all related provider states
        ref.invalidate(currentUserProvider);
        ref.invalidate(isAuthenticatedProvider);
        ref.invalidate(userRoleProvider);
        ref.invalidate(kycStatusProvider);
        ref.invalidate(isEmailVerifiedProvider);
        ref.invalidate(userPermissionsProvider);
      }
      
      state = const AsyncValue.data(null);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
  
  /// Refresh current session
  Future<void> refreshSession() async {
    try {
      final authRepository = ref.read(authRepositoryProvider);
      await authRepository.refreshToken();
      
      // Refresh session status
      ref.invalidate(sessionStatusProvider);
      ref.invalidate(currentUserProvider);
    } catch (e) {
      // Handle refresh errors silently or show user notification
    }
  }
  
  /// Clear session state
  void clearState() {
    state = const AsyncValue.data(null);
  }
}