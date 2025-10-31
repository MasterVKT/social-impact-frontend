import '../entities/auth_state.dart';
import '../repositories/auth_repository.dart';

/// Use case for user sign in operations
/// Encapsulates business logic for authentication
class SignInUseCase {
  final AuthRepository _authRepository;
  
  const SignInUseCase(this._authRepository);
  
  /// Sign in with email and password
  Future<AuthResult> signInWithEmailAndPassword({
    required String email,
    required String password,
    bool rememberMe = false,
  }) async {
    // Validate input
    if (email.isEmpty || !_isValidEmail(email)) {
      return const AuthResult.failure(
        AuthFailure(
          message: 'Please enter a valid email address',
          type: AuthFailureType.invalidCredentials,
        ),
      );
    }
    
    if (password.isEmpty || password.length < 6) {
      return const AuthResult.failure(
        AuthFailure(
          message: 'Password must be at least 6 characters long',
          type: AuthFailureType.weakPassword,
        ),
      );
    }
    
    try {
      return await _authRepository.signInWithEmailAndPassword(
        email: email.trim().toLowerCase(),
        password: password,
        rememberMe: rememberMe,
      );
    } catch (e) {
      return AuthResult.failure(
        AuthFailure(
          message: 'Sign in failed: ${e.toString()}',
          type: AuthFailureType.unknown,
        ),
      );
    }
  }
  
  /// Sign in with Google
  Future<AuthResult> signInWithGoogle() async {
    try {
      return await _authRepository.signInWithGoogle();
    } catch (e) {
      return AuthResult.failure(
        AuthFailure(
          message: 'Google sign in failed: ${e.toString()}',
          type: AuthFailureType.providerError,
        ),
      );
    }
  }
  
  /// Sign in with Apple (iOS only)
  Future<AuthResult> signInWithApple() async {
    try {
      return await _authRepository.signInWithApple();
    } catch (e) {
      return AuthResult.failure(
        AuthFailure(
          message: 'Apple sign in failed: ${e.toString()}',
          type: AuthFailureType.providerError,
        ),
      );
    }
  }
  
  /// Sign in with biometric authentication
  Future<AuthResult> signInWithBiometric() async {
    try {
      // Check if biometric is available
      final isAvailable = await _authRepository.isBiometricAvailable();
      if (!isAvailable) {
        return const AuthResult.failure(
          AuthFailure(
            message: 'Biometric authentication is not available on this device',
            type: AuthFailureType.biometricNotAvailable,
          ),
        );
      }
      
      // Check if biometric is enabled for user
      final isEnabled = await _authRepository.isBiometricEnabled();
      if (!isEnabled) {
        return const AuthResult.failure(
          AuthFailure(
            message: 'Biometric authentication is not enabled. Please enable it in settings.',
            type: AuthFailureType.biometricNotEnrolled,
          ),
        );
      }
      
      return await _authRepository.signInWithBiometric();
    } catch (e) {
      return AuthResult.failure(
        AuthFailure(
          message: 'Biometric authentication failed: ${e.toString()}',
          type: AuthFailureType.biometricError,
        ),
      );
    }
  }
  
  /// Validate email format
  bool _isValidEmail(String email) {
    return RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(email);
  }
}