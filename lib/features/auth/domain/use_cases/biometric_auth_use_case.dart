import '../../../../core/utils/platform_detector.dart';
import '../entities/auth_state.dart';
import '../repositories/auth_repository.dart';

/// Use case for biometric authentication operations
/// Handles biometric authentication logic (mobile platforms only)
class BiometricAuthUseCase {
  final AuthRepository _authRepository;
  
  const BiometricAuthUseCase(this._authRepository);
  
  /// Check if biometric authentication is supported on current platform
  bool get isSupportedOnPlatform => PlatformDetector.supportsBiometrics;
  
  /// Check if biometric authentication is available
  Future<AuthResult> checkBiometricAvailability() async {
    if (!isSupportedOnPlatform) {
      return const AuthResult.failure(
        AuthFailure(
          message: 'Biometric authentication is not supported on this platform',
          type: AuthFailureType.biometricNotAvailable,
        ),
      );
    }
    
    try {
      final isAvailable = await _authRepository.isBiometricAvailable();
      if (!isAvailable) {
        return const AuthResult.failure(
          AuthFailure(
            message: 'Biometric authentication is not available on this device',
            type: AuthFailureType.biometricNotAvailable,
          ),
        );
      }
      
      return AuthResult.success(_authRepository.currentUser!);
    } catch (e) {
      return AuthResult.failure(
        AuthFailure(
          message: 'Failed to check biometric availability: ${e.toString()}',
          type: AuthFailureType.biometricError,
        ),
      );
    }
  }
  
  /// Enable biometric authentication for current user
  Future<AuthResult> enableBiometricAuthentication() async {
    if (!isSupportedOnPlatform) {
      return const AuthResult.failure(
        AuthFailure(
          message: 'Biometric authentication is not supported on this platform',
          type: AuthFailureType.biometricNotAvailable,
        ),
      );
    }
    
    // Check if user is authenticated
    if (!_authRepository.isAuthenticated) {
      return const AuthResult.failure(
        AuthFailure(
          message: 'You must be signed in to enable biometric authentication',
          type: AuthFailureType.permissionDenied,
        ),
      );
    }
    
    try {
      // Check if biometric is available
      final isAvailable = await _authRepository.isBiometricAvailable();
      if (!isAvailable) {
        return const AuthResult.failure(
          AuthFailure(
            message: 'Biometric authentication is not available. Please set up biometrics in your device settings.',
            type: AuthFailureType.biometricNotEnrolled,
          ),
        );
      }
      
      return await _authRepository.enableBiometricAuthentication();
    } catch (e) {
      return AuthResult.failure(
        AuthFailure(
          message: 'Failed to enable biometric authentication: ${e.toString()}',
          type: AuthFailureType.biometricError,
        ),
      );
    }
  }
  
  /// Disable biometric authentication for current user
  Future<AuthResult> disableBiometricAuthentication() async {
    if (!isSupportedOnPlatform) {
      return const AuthResult.failure(
        AuthFailure(
          message: 'Biometric authentication is not supported on this platform',
          type: AuthFailureType.biometricNotAvailable,
        ),
      );
    }
    
    // Check if user is authenticated
    if (!_authRepository.isAuthenticated) {
      return const AuthResult.failure(
        AuthFailure(
          message: 'You must be signed in to disable biometric authentication',
          type: AuthFailureType.permissionDenied,
        ),
      );
    }
    
    try {
      await _authRepository.disableBiometricAuthentication();
      return AuthResult.success(_authRepository.currentUser!);
    } catch (e) {
      return AuthResult.failure(
        AuthFailure(
          message: 'Failed to disable biometric authentication: ${e.toString()}',
          type: AuthFailureType.biometricError,
        ),
      );
    }
  }
  
  /// Authenticate user with biometrics
  Future<AuthResult> authenticateWithBiometrics() async {
    if (!isSupportedOnPlatform) {
      return const AuthResult.failure(
        AuthFailure(
          message: 'Biometric authentication is not supported on this platform',
          type: AuthFailureType.biometricNotAvailable,
        ),
      );
    }
    
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
            message: 'Biometric authentication is not enabled. Please enable it in settings first.',
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
  
  /// Check if biometric authentication is enabled for current user
  Future<bool> isBiometricEnabled() async {
    if (!isSupportedOnPlatform) return false;
    
    try {
      return await _authRepository.isBiometricEnabled();
    } catch (e) {
      return false;
    }
  }
  
  /// Get biometric capabilities information
  Future<Map<String, dynamic>> getBiometricCapabilities() async {
    if (!isSupportedOnPlatform) {
      return {
        'supported': false,
        'available': false,
        'enabled': false,
        'reason': 'Platform does not support biometric authentication',
      };
    }
    
    try {
      final isAvailable = await _authRepository.isBiometricAvailable();
      final isEnabled = await _authRepository.isBiometricEnabled();
      
      return {
        'supported': true,
        'available': isAvailable,
        'enabled': isEnabled,
        'reason': isAvailable
            ? (isEnabled ? 'Biometric authentication is ready' : 'Biometric authentication is available but not enabled')
            : 'Biometric authentication is not set up on this device',
      };
    } catch (e) {
      return {
        'supported': true,
        'available': false,
        'enabled': false,
        'reason': 'Failed to check biometric capabilities: ${e.toString()}',
      };
    }
  }
}