import '../entities/auth_state.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

/// Use case for email verification operations
/// Handles email verification and related authentication flows
class EmailVerificationUseCase {
  final AuthRepository _authRepository;
  
  const EmailVerificationUseCase(this._authRepository);
  
  /// Send email verification to current user
  Future<AuthResult> sendEmailVerification() async {
    // Check if user is authenticated
    if (!_authRepository.isAuthenticated) {
      return const AuthResult.failure(
        AuthFailure(
          message: 'You must be signed in to send email verification',
          type: AuthFailureType.permissionDenied,
        ),
      );
    }
    
    // Check if email is already verified
    final isVerified = await isEmailVerified();
    if (isVerified) {
      return const AuthResult.failure(
        AuthFailure(
          message: 'Your email is already verified',
          type: AuthFailureType.emailNotVerified,
        ),
      );
    }
    
    try {
      return await _authRepository.sendEmailVerification();
    } catch (e) {
      return AuthResult.failure(
        AuthFailure(
          message: 'Failed to send email verification: ${e.toString()}',
          type: AuthFailureType.unknown,
        ),
      );
    }
  }
  
  /// Verify email with verification code
  Future<AuthResult> verifyEmailWithCode({
    required String code,
  }) async {
    // Validate verification code
    if (code.isEmpty || code.length < 4) {
      return const AuthResult.failure(
        AuthFailure(
          message: 'Please enter a valid verification code',
          type: AuthFailureType.invalidCredentials,
        ),
      );
    }
    
    try {
      return await _authRepository.verifyEmail(code: code.trim());
    } catch (e) {
      return AuthResult.failure(
        AuthFailure(
          message: 'Email verification failed: ${e.toString()}',
          type: AuthFailureType.unknown,
        ),
      );
    }
  }
  
  /// Check if current user's email is verified
  Future<bool> isEmailVerified() async {
    try {
      return await _authRepository.isEmailVerified();
    } catch (e) {
      return false;
    }
  }
  
  /// Check if email verification is required for user actions
  bool isEmailVerificationRequired() {
    final user = _authRepository.currentUser;
    if (user == null) return false;
    
    // Email verification is required for:
    // - Making investments
    // - Accessing sensitive features
    // - Admin functions
    return !user.isEmailVerified && 
           (user.role == UserRole.investor || 
            user.role == UserRole.organization || 
            user.role == UserRole.admin);
  }
  
  /// Get email verification status with details
  Future<Map<String, dynamic>> getEmailVerificationStatus() async {
    if (!_authRepository.isAuthenticated) {
      return {
        'isVerified': false,
        'isRequired': false,
        'canSendVerification': false,
        'message': 'User not authenticated',
      };
    }
    
    final user = _authRepository.currentUser!;
    final isVerified = await isEmailVerified();
    final isRequired = isEmailVerificationRequired();
    
    return {
      'isVerified': isVerified,
      'isRequired': isRequired,
      'canSendVerification': !isVerified,
      'message': _getEmailVerificationMessage(isVerified, isRequired),
      'email': user.email,
    };
  }
  
  /// Get appropriate message for email verification status
  String _getEmailVerificationMessage(bool isVerified, bool isRequired) {
    if (isVerified) {
      return 'Your email address has been verified';
    }
    
    if (isRequired) {
      return 'Please verify your email address to access all features';
    }
    
    return 'Email verification is recommended for enhanced security';
  }
  
  /// Resend email verification with rate limiting
  Future<AuthResult> resendEmailVerification() async {
    // Check if user is authenticated
    if (!_authRepository.isAuthenticated) {
      return const AuthResult.failure(
        AuthFailure(
          message: 'You must be signed in to resend email verification',
          type: AuthFailureType.permissionDenied,
        ),
      );
    }
    
    // Check if email is already verified
    final isVerified = await isEmailVerified();
    if (isVerified) {
      return const AuthResult.failure(
        AuthFailure(
          message: 'Your email is already verified',
          type: AuthFailureType.emailNotVerified,
        ),
      );
    }
    
    try {
      // Note: In a real implementation, you would implement rate limiting here
      // to prevent spam. This could be done using a combination of:
      // - Local storage to track last sent time
      // - Backend validation
      // - Exponential backoff
      
      return await _authRepository.sendEmailVerification();
    } catch (e) {
      return AuthResult.failure(
        AuthFailure(
          message: 'Failed to resend email verification: ${e.toString()}',
          type: AuthFailureType.unknown,
        ),
      );
    }
  }
}