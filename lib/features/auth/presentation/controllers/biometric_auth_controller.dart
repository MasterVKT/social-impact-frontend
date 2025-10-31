import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/auth_state.dart';
import '../providers/auth_providers.dart';

part 'biometric_auth_controller.g.dart';

/// Controller for managing biometric authentication operations
/// Handles biometric sign-in, setup, and management
@riverpod
class BiometricAuthController extends _$BiometricAuthController {
  @override
  AsyncValue<void> build() {
    return const AsyncValue.data(null);
  }
  
  /// Sign in with biometric authentication
  Future<void> signInWithBiometric() async {
    state = const AsyncValue.loading();
    
    try {
      final biometricUseCase = ref.read(biometricAuthUseCaseProvider);
      final result = await biometricUseCase.authenticateWithBiometrics();
      
      result.when(
        success: (user) {
          // Update the auth state
          ref.read(authStateNotifierProvider.notifier).updateAuthState(
            AuthState.authenticated(user),
          );
          state = const AsyncValue.data(null);
        },
        failure: (failure) {
          state = AsyncValue.error(failure.message, StackTrace.current);
        },
      );
    } catch (e) {
      state = AsyncValue.error(e.toString(), StackTrace.current);
    }
  }
  
  /// Enable biometric authentication for current user
  Future<void> enableBiometricAuth() async {
    state = const AsyncValue.loading();
    
    try {
      final biometricUseCase = ref.read(biometricAuthUseCaseProvider);
      final result = await biometricUseCase.enableBiometricAuthentication();
      
      result.when(
        success: (user) {
          // Refresh biometric capabilities
          ref.invalidate(biometricCapabilitiesProvider);
          state = const AsyncValue.data(null);
        },
        failure: (failure) {
          state = AsyncValue.error(failure.message, StackTrace.current);
        },
      );
    } catch (e) {
      state = AsyncValue.error(e.toString(), StackTrace.current);
    }
  }
  
  /// Disable biometric authentication for current user
  Future<void> disableBiometricAuth() async {
    state = const AsyncValue.loading();
    
    try {
      final biometricUseCase = ref.read(biometricAuthUseCaseProvider);
      final result = await biometricUseCase.disableBiometricAuthentication();
      
      result.when(
        success: (user) {
          // Refresh biometric capabilities
          ref.invalidate(biometricCapabilitiesProvider);
          state = const AsyncValue.data(null);
        },
        failure: (failure) {
          state = AsyncValue.error(failure.message, StackTrace.current);
        },
      );
    } catch (e) {
      state = AsyncValue.error(e.toString(), StackTrace.current);
    }
  }
  
  /// Check biometric availability and refresh capabilities
  Future<void> refreshBiometricStatus() async {
    try {
      ref.invalidate(biometricCapabilitiesProvider);
    } catch (e) {
      state = AsyncValue.error(e.toString(), StackTrace.current);
    }
  }
  
  /// Test biometric authentication without signing in
  Future<bool> testBiometricAuth() async {
    try {
      final biometricUseCase = ref.read(biometricAuthUseCaseProvider);
      final result = await biometricUseCase.authenticateWithBiometrics();
      
      return result.when(
        success: (_) => true,
        failure: (_) => false,
      );
    } catch (e) {
      return false;
    }
  }
}