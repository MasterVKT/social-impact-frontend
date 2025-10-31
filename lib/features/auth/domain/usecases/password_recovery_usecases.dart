import '../repositories/auth_repository.dart';
import '../entities/action_code_info.dart';

/// Use cases for password recovery and email verification operations
/// Implements business logic for secure password reset and email verification processes
class PasswordRecoveryUseCases {
  final AuthRepository _repository;
  
  const PasswordRecoveryUseCases(this._repository);
  
  /// Send password reset email to user
  Future<void> sendPasswordResetEmail(String email) async {
    // Validate email format
    if (!_isValidEmail(email)) {
      throw const PasswordRecoveryException('Invalid email format');
    }
    
    // Normalize email (lowercase, trim)
    final normalizedEmail = email.toLowerCase().trim();
    
    try {
      await _repository.sendPasswordResetEmail(email: normalizedEmail);
    } catch (e) {
      throw PasswordRecoveryException('Failed to send password reset email: $e');
    }
  }
  
  /// Verify password reset code and reset password
  Future<void> confirmPasswordReset({
    required String code,
    required String newPassword,
  }) async {
    // Validate password strength
    final passwordValidation = _validatePasswordStrength(newPassword);
    if (!passwordValidation.isValid) {
      throw PasswordRecoveryException(passwordValidation.errorMessage ?? 'Password validation failed');
    }
    
    try {
      await _repository.confirmPasswordReset(
        code: code,
        newPassword: newPassword,
      );
    } catch (e) {
      throw PasswordRecoveryException('Failed to reset password: $e');
    }
  }
  
  /// Send email verification to current user
  Future<void> sendEmailVerification() async {
    try {
      await _repository.sendEmailVerification();
    } catch (e) {
      throw EmailVerificationException('Failed to send email verification: $e');
    }
  }
  
  /// Verify email with verification link
  Future<void> verifyEmail(String actionCode) async {
    try {
      await _repository.applyActionCode(actionCode);
    } catch (e) {
      throw EmailVerificationException('Failed to verify email: $e');
    }
  }
  
  /// Check if email verification is required
  Future<bool> isEmailVerificationRequired() async {
    try {
      final user = await _repository.getCurrentUser();
      return user != null && !user.isEmailVerified;
    } catch (e) {
      return false;
    }
  }
  
  /// Resend email verification if needed
  Future<void> resendEmailVerification() async {
    final isRequired = await isEmailVerificationRequired();
    if (!isRequired) {
      throw const EmailVerificationException('Email verification not required');
    }
    
    await sendEmailVerification();
  }
  
  /// Change user password (requires current password)
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    // Validate new password strength
    final passwordValidation = _validatePasswordStrength(newPassword);
    if (!passwordValidation.isValid) {
      throw PasswordRecoveryException(passwordValidation.errorMessage ?? 'Password validation failed');
    }
    
    // Ensure new password is different from current
    if (currentPassword == newPassword) {
      throw const PasswordRecoveryException('New password must be different from current password');
    }
    
    try {
      await _repository.changePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
      );
    } catch (e) {
      throw PasswordRecoveryException('Failed to change password: $e');
    }
  }
  
  /// Update user email (requires re-authentication)
  Future<void> updateEmail({
    required String newEmail,
    required String password,
  }) async {
    // Validate email format
    if (!_isValidEmail(newEmail)) {
      throw const EmailVerificationException('Invalid email format');
    }
    
    final normalizedEmail = newEmail.toLowerCase().trim();
    
    try {
      await _repository.updateEmail(
        newEmail: normalizedEmail,
        password: password,
      );
    } catch (e) {
      throw EmailVerificationException('Failed to update email: $e');
    }
  }
  
  /// Verify action code and get action info
  Future<ActionCodeInfo> checkActionCode(String actionCode) async {
    try {
      return await _repository.checkActionCode(actionCode);
    } catch (e) {
      throw PasswordRecoveryException('Invalid or expired action code: $e');
    }
  }
  
  /// Validate email format
  bool _isValidEmail(String email) {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(email.trim());
  }
  
  /// Validate password strength
  PasswordValidationResult _validatePasswordStrength(String password) {
    if (password.length < 8) {
      return const PasswordValidationResult(
        isValid: false,
        errorMessage: 'Password must be at least 8 characters long',
      );
    }
    
    if (!password.contains(RegExp(r'[A-Z]'))) {
      return const PasswordValidationResult(
        isValid: false,
        errorMessage: 'Password must contain at least one uppercase letter',
      );
    }
    
    if (!password.contains(RegExp(r'[a-z]'))) {
      return const PasswordValidationResult(
        isValid: false,
        errorMessage: 'Password must contain at least one lowercase letter',
      );
    }
    
    if (!password.contains(RegExp(r'[0-9]'))) {
      return const PasswordValidationResult(
        isValid: false,
        errorMessage: 'Password must contain at least one number',
      );
    }
    
    if (!password.contains(RegExp(r'[!@#$%^&*()_+\-=\[\]{};:"\\|,.<>\/?]'))) {
      return const PasswordValidationResult(
        isValid: false,
        errorMessage: 'Password must contain at least one special character',
      );
    }
    
    // Check for common weak passwords
    final commonPasswords = [
      'password', '12345678', 'qwerty123', 'abc123456',
      'password123', '123456789', 'welcome123', 'admin123'
    ];
    
    if (commonPasswords.contains(password.toLowerCase())) {
      return const PasswordValidationResult(
        isValid: false,
        errorMessage: 'Password is too common, please choose a stronger password',
      );
    }
    
    return const PasswordValidationResult(isValid: true);
  }
}

/// Result of password validation
class PasswordValidationResult {
  final bool isValid;
  final String? errorMessage;
  
  const PasswordValidationResult({
    required this.isValid,
    this.errorMessage,
  });
}


/// Types of action codes
enum ActionCodeType {
  passwordReset,
  emailVerification,
  emailChange,
  revertSecondFactorAddition,
}

/// Base exception for password recovery operations
class PasswordRecoveryException implements Exception {
  final String message;
  const PasswordRecoveryException(this.message);
  
  @override
  String toString() => 'PasswordRecoveryException: $message';
}

/// Exception for email verification operations
class EmailVerificationException implements Exception {
  final String message;
  const EmailVerificationException(this.message);
  
  @override
  String toString() => 'EmailVerificationException: $message';
}

/// Exception for weak passwords
class WeakPasswordException extends PasswordRecoveryException {
  const WeakPasswordException(String message) : super(message);
  
  @override
  String toString() => 'WeakPasswordException: $message';
}

/// Exception for invalid action codes
class InvalidActionCodeException extends PasswordRecoveryException {
  const InvalidActionCodeException(String message) : super(message);
  
  @override
  String toString() => 'InvalidActionCodeException: $message';
}