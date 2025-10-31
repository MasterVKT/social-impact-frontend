import 'package:flutter/foundation.dart';

/// Implementation of BiometricService for web platform
class BiometricService {
  /// Check if biometric authentication is available on the device
  Future<bool> isBiometricAvailable() async {
    // Web platform doesn't support biometrics through Flutter yet
    debugPrint(
        'BiometricService: Biometric authentication not supported on web');
    return false;
  }

  /// Authenticate using biometrics
  Future<bool> authenticate({
    required String reason,
    String? localizedReason,
    bool useErrorDialogs = true,
    bool stickyAuth = false,
  }) async {
    // Web platform doesn't support biometrics through Flutter yet
    debugPrint(
        'BiometricService: Biometric authentication not supported on web');
    return false;
  }
}
