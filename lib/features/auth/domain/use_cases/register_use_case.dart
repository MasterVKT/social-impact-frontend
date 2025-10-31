import '../entities/auth_state.dart';
import '../repositories/auth_repository.dart';

/// Use case for user registration operations
/// Handles business logic for account creation
class RegisterUseCase {
  final AuthRepository _authRepository;
  
  const RegisterUseCase(this._authRepository);
  
  /// Register new user with email and password
  Future<AuthResult> registerWithEmailAndPassword({
    required RegistrationData registrationData,
  }) async {
    // Validate registration data
    final validation = _validateRegistrationData(registrationData);
    if (validation != null) {
      return AuthResult.failure(validation);
    }
    
    try {
      return await _authRepository.registerWithEmailAndPassword(
        registrationData: registrationData,
      );
    } catch (e) {
      return AuthResult.failure(
        AuthFailure(
          message: 'Registration failed: ${e.toString()}',
          type: AuthFailureType.unknown,
        ),
      );
    }
  }
  
  /// Validate registration data
  AuthFailure? _validateRegistrationData(RegistrationData data) {
    // Email validation
    if (data.email.isEmpty || !_isValidEmail(data.email)) {
      return const AuthFailure(
        message: 'Please enter a valid email address',
        type: AuthFailureType.invalidCredentials,
      );
    }
    
    // Password validation
    if (data.password.isEmpty) {
      return const AuthFailure(
        message: 'Password is required',
        type: AuthFailureType.weakPassword,
      );
    }
    
    if (data.password.length < 8) {
      return const AuthFailure(
        message: 'Password must be at least 8 characters long',
        type: AuthFailureType.weakPassword,
      );
    }
    
    if (!_isStrongPassword(data.password)) {
      return const AuthFailure(
        message: 'Password must contain uppercase, lowercase, number and special character',
        type: AuthFailureType.weakPassword,
      );
    }
    
    // Terms and conditions validation
    if (!data.acceptTerms) {
      return const AuthFailure(
        message: 'You must accept the terms and conditions',
        type: AuthFailureType.permissionDenied,
      );
    }
    
    if (!data.acceptPrivacy) {
      return const AuthFailure(
        message: 'You must accept the privacy policy',
        type: AuthFailureType.permissionDenied,
      );
    }
    
    // Name validation (if provided)
    if (data.firstName?.isNotEmpty == true && data.firstName!.length < 2) {
      return const AuthFailure(
        message: 'First name must be at least 2 characters',
        type: AuthFailureType.invalidCredentials,
      );
    }
    
    if (data.lastName?.isNotEmpty == true && data.lastName!.length < 2) {
      return const AuthFailure(
        message: 'Last name must be at least 2 characters',
        type: AuthFailureType.invalidCredentials,
      );
    }
    
    // Phone number validation (if provided)
    if (data.phoneNumber?.isNotEmpty == true && !_isValidPhoneNumber(data.phoneNumber!)) {
      return const AuthFailure(
        message: 'Please enter a valid phone number',
        type: AuthFailureType.invalidCredentials,
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
  
  /// Validate phone number format
  bool _isValidPhoneNumber(String phoneNumber) {
    // Basic phone number validation (international format)
    return RegExp(r'^\+?[1-9]\d{1,14}$').hasMatch(phoneNumber.replaceAll(RegExp(r'[\s\-\(\)]'), ''));
  }
}