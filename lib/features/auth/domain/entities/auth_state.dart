import 'package:freezed_annotation/freezed_annotation.dart';
import 'user.dart';

part 'auth_state.freezed.dart';

/// Authentication state representing the current authentication status
@freezed
class AuthState with _$AuthState {
  /// User is authenticated
  const factory AuthState.authenticated(User user) = AuthStateAuthenticated;
  
  /// User is not authenticated
  const factory AuthState.unauthenticated() = AuthStateUnauthenticated;
  
  /// Authentication is in progress
  const factory AuthState.loading() = AuthStateLoading;
  
  /// Authentication failed with an error
  const factory AuthState.error(String message, {String? code}) = AuthStateError;
  
  /// Initial state before any authentication attempt
  const factory AuthState.initial() = AuthStateInitial;
}

/// Authentication result for operations
@freezed
class AuthResult with _$AuthResult {
  /// Operation succeeded
  const factory AuthResult.success(User user) = AuthResultSuccess;
  
  /// Operation failed
  const factory AuthResult.failure(AuthFailure failure) = AuthResultFailure;
}

/// Authentication failure details
@freezed
class AuthFailure with _$AuthFailure {
  const factory AuthFailure({
    required String message,
    required AuthFailureType type,
    String? code,
    Map<String, dynamic>? details,
  }) = _AuthFailure;
}

/// Types of authentication failures
enum AuthFailureType {
  // Network related
  networkError,
  serverError,
  
  // Credential related
  invalidCredentials,
  userNotFound,
  wrongPassword,
  weakPassword,
  
  // Account related
  emailAlreadyInUse,
  accountDisabled,
  emailNotVerified,
  
  // Provider related
  providerError,
  cancelledByUser,
  
  // Biometric related
  biometricNotAvailable,
  biometricNotEnrolled,
  biometricError,
  
  // KYC related
  kycRequired,
  kycPending,
  kycRejected,
  
  // General
  unknown,
  timeout,
  permissionDenied,
}

/// Login credentials for different authentication methods
@freezed
class LoginCredentials with _$LoginCredentials {
  /// Email and password credentials
  const factory LoginCredentials.emailPassword({
    required String email,
    required String password,
    @Default(false) bool rememberMe,
  }) = EmailPasswordCredentials;
  
  /// Google Sign-In credentials
  const factory LoginCredentials.google({
    String? idToken,
    String? accessToken,
  }) = GoogleCredentials;
  
  /// Apple Sign-In credentials
  const factory LoginCredentials.apple({
    String? idToken,
    String? authorizationCode,
    String? nonce,
  }) = AppleCredentials;
  
  /// Biometric credentials
  const factory LoginCredentials.biometric({
    required String userId,
    @Default(BiometricType.fingerprint) BiometricType type,
  }) = BiometricCredentials;
}

/// Registration data for creating new accounts
@freezed
class RegistrationData with _$RegistrationData {
  const factory RegistrationData({
    required String email,
    required String password,
    String? displayName,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    @Default(UserRole.investor) UserRole role,
    @Default(false) bool acceptTerms,
    @Default(false) bool acceptPrivacy,
    @Default(true) bool acceptMarketing,
  }) = _RegistrationData;
}

/// Password reset request data
@freezed
class PasswordResetData with _$PasswordResetData {
  const factory PasswordResetData({
    required String email,
  }) = _PasswordResetData;
}

/// Password change data
@freezed
class PasswordChangeData with _$PasswordChangeData {
  const factory PasswordChangeData({
    required String currentPassword,
    required String newPassword,
  }) = _PasswordChangeData;
}

/// Email verification data
@freezed
class EmailVerificationData with _$EmailVerificationData {
  const factory EmailVerificationData({
    required String code,
  }) = _EmailVerificationData;
}

/// Biometric authentication types
enum BiometricType {
  fingerprint,
  face,
  iris,
  voice,
}

/// Session information
@freezed
class AuthSession with _$AuthSession {
  const factory AuthSession({
    required String sessionId,
    required String userId,
    required DateTime createdAt,
    required DateTime expiresAt,
    String? deviceId,
    String? deviceName,
    String? ipAddress,
    String? userAgent,
    @Default(false) bool isActive,
  }) = _AuthSession;
}

/// Extensions for AuthState
extension AuthStateExtensions on AuthState {
  /// Check if user is authenticated
  bool get isAuthenticated => this is AuthStateAuthenticated;
  
  /// Check if authentication is loading
  bool get isLoading => this is AuthStateLoading;
  
  /// Check if there's an authentication error
  bool get hasError => this is AuthStateError;
  
  /// Get the authenticated user (null if not authenticated)
  User? get user => mapOrNull(authenticated: (state) => state.user);
  
  /// Get error message (null if no error)
  String? get errorMessage => mapOrNull(error: (state) => state.message);
  
  /// Get error code (null if no error)
  String? get errorCode => mapOrNull(error: (state) => state.code);
}

/// Extensions for AuthResult
extension AuthResultExtensions on AuthResult {
  /// Check if the result is successful
  bool get isSuccess => this is AuthResultSuccess;
  
  /// Check if the result is a failure
  bool get isFailure => this is AuthResultFailure;
  
  /// Get the user from successful result (null if failed)
  User? get user => mapOrNull(success: (result) => result.user);
  
  /// Get the failure from failed result (null if successful)
  AuthFailure? get failure => mapOrNull(failure: (result) => result.failure);
}


/// Extensions for AuthFailure
extension AuthFailureExtensions on AuthFailure {
  /// Check if failure is network related
  bool get isNetworkError => type == AuthFailureType.networkError;
  
  /// Check if failure is credential related
  bool get isCredentialError => [
    AuthFailureType.invalidCredentials,
    AuthFailureType.userNotFound,
    AuthFailureType.wrongPassword,
    AuthFailureType.weakPassword,
  ].contains(type);
  
  /// Check if failure is account related
  bool get isAccountError => [
    AuthFailureType.emailAlreadyInUse,
    AuthFailureType.accountDisabled,
    AuthFailureType.emailNotVerified,
  ].contains(type);
  
  /// Check if failure is biometric related
  bool get isBiometricError => [
    AuthFailureType.biometricNotAvailable,
    AuthFailureType.biometricNotEnrolled,
    AuthFailureType.biometricError,
  ].contains(type);
  
  /// Get user-friendly error message
  String get userMessage {
    switch (type) {
      case AuthFailureType.networkError:
        return 'Network connection error. Please check your internet connection.';
      case AuthFailureType.invalidCredentials:
        return 'Invalid email or password. Please try again.';
      case AuthFailureType.userNotFound:
        return 'No account found with this email address.';
      case AuthFailureType.wrongPassword:
        return 'Incorrect password. Please try again.';
      case AuthFailureType.weakPassword:
        return 'Password is too weak. Please choose a stronger password.';
      case AuthFailureType.emailAlreadyInUse:
        return 'An account with this email already exists.';
      case AuthFailureType.accountDisabled:
        return 'Your account has been disabled. Please contact support.';
      case AuthFailureType.emailNotVerified:
        return 'Please verify your email address before continuing.';
      case AuthFailureType.cancelledByUser:
        return 'Sign-in was cancelled.';
      case AuthFailureType.biometricNotAvailable:
        return 'Biometric authentication is not available on this device.';
      case AuthFailureType.biometricNotEnrolled:
        return 'Please set up biometric authentication in your device settings.';
      case AuthFailureType.kycRequired:
        return 'Identity verification is required to continue.';
      case AuthFailureType.kycPending:
        return 'Your identity verification is being reviewed.';
      case AuthFailureType.kycRejected:
        return 'Identity verification was rejected. Please contact support.';
      default:
        return message;
    }
  }
}