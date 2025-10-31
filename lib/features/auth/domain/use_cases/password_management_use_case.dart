import '../entities/auth_state.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

/// Use case for password management operations
/// Handles password reset, change, and recovery logic
class PasswordManagementUseCase {
  final AuthRepository _authRepository;

  const PasswordManagementUseCase(this._authRepository);

  /// Send password reset email
  Future<AuthResult> sendPasswordResetEmail({
    required String email,
  }) async {
    // Validate email
    if (email.isEmpty || !_isValidEmail(email)) {
      return const AuthResult.failure(
        AuthFailure(
          message: 'Please enter a valid email address',
          type: AuthFailureType.invalidCredentials,
        ),
      );
    }

    try {
      await _authRepository.sendPasswordResetEmail(
        email: email.trim().toLowerCase(),
      );
      return const AuthResult.success(User(
        uid: '',
        email: '',
        displayName: null,
        photoURL: null,
      ));
    } catch (e) {
      return AuthResult.failure(
        AuthFailure(
          message: 'Failed to send password reset email: ${e.toString()}',
          type: AuthFailureType.unknown,
        ),
      );
    }
  }

  /// Change user password
  Future<AuthResult> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    // Validate current password
    if (currentPassword.isEmpty) {
      return const AuthResult.failure(
        AuthFailure(
          message: 'Current password is required',
          type: AuthFailureType.invalidCredentials,
        ),
      );
    }

    // Validate new password
    final passwordValidation =
        _validateNewPassword(newPassword, currentPassword);
    if (passwordValidation != null) {
      return AuthResult.failure(passwordValidation);
    }

    try {
      return await _authRepository.changePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
      );
    } catch (e) {
      return AuthResult.failure(
        AuthFailure(
          message: 'Failed to change password: ${e.toString()}',
          type: AuthFailureType.unknown,
        ),
      );
    }
  }

  /// Validate new password
  AuthFailure? _validateNewPassword(
      String newPassword, String currentPassword) {
    // Check if new password is provided
    if (newPassword.isEmpty) {
      return const AuthFailure(
        message: 'New password is required',
        type: AuthFailureType.weakPassword,
      );
    }

    // Check minimum length
    if (newPassword.length < 8) {
      return const AuthFailure(
        message: 'New password must be at least 8 characters long',
        type: AuthFailureType.weakPassword,
      );
    }

    // Check password strength
    if (!_isStrongPassword(newPassword)) {
      return const AuthFailure(
        message:
            'New password must contain uppercase, lowercase, number and special character',
        type: AuthFailureType.weakPassword,
      );
    }

    // Check if new password is different from current
    if (newPassword == currentPassword) {
      return const AuthFailure(
        message: 'New password must be different from current password',
        type: AuthFailureType.weakPassword,
      );
    }

    // Check for common weak patterns
    if (_isCommonPassword(newPassword)) {
      return const AuthFailure(
        message: 'Please choose a more secure password',
        type: AuthFailureType.weakPassword,
      );
    }

    return null;
  }

  /// Validate email format
  bool _isValidEmail(String email) {
    return RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(email);
  }

  /// Check if password is strong enough
  bool _isStrongPassword(String password) {
    // At least 8 characters with uppercase, lowercase, number and special char
    return password.length >= 8 &&
        RegExp(r'[A-Z]').hasMatch(password) &&
        RegExp(r'[a-z]').hasMatch(password) &&
        RegExp(r'[0-9]').hasMatch(password) &&
        RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password);
  }

  /// Check if password is commonly used (basic check)
  bool _isCommonPassword(String password) {
    final commonPasswords = [
      'password',
      '123456',
      '12345678',
      'qwerty',
      'abc123',
      'password123',
      'admin',
      'letmein',
      'welcome',
      'monkey',
      '1234567890',
      'password1',
      '123456789',
      'welcome123',
    ];

    return commonPasswords.contains(password.toLowerCase());
  }
}
