import 'package:flutter/foundation.dart';

/// Stub implementation of BiometricService for platforms that don't support biometrics
class BiometricService {
  /// Check if biometric authentication is available on the device
  Future<bool> isBiometricAvailable() async {
    debugPrint(
        'BiometricService: Biometric authentication not supported on this platform');
    return false;
  }

  /// Authenticate using biometrics
  Future<bool> authenticate({
    required String reason,
    String? localizedReason,
    bool useErrorDialogs = true,
    bool stickyAuth = false,
  }) async {
    debugPrint(
        'BiometricService: Biometric authentication not supported on this platform');
    return false;
  }
}
