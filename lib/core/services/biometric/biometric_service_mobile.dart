import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth/error_codes.dart' as auth_error;

/// Implementation of BiometricService for mobile platforms
class BiometricService {
  final LocalAuthentication _localAuth = LocalAuthentication();

  /// Check if biometric authentication is available on the device
  Future<bool> isBiometricAvailable() async {
    try {
      // Check if biometrics are available
      final canAuthenticateWithBiometrics = await _localAuth.canCheckBiometrics;
      final canAuthenticate = await _localAuth.isDeviceSupported();

      return canAuthenticateWithBiometrics && canAuthenticate;
    } catch (e) {
      debugPrint('BiometricService: Error checking biometric availability: $e');
      return false;
    }
  }

  /// Authenticate using biometrics
  Future<bool> authenticate({
    required String reason,
    String? localizedReason,
    bool useErrorDialogs = true,
    bool stickyAuth = false,
  }) async {
    try {
      if (!await isBiometricAvailable()) {
        return false;
      }

      return await _localAuth.authenticate(
        localizedReason: localizedReason ?? reason,
        options: AuthenticationOptions(
          stickyAuth: stickyAuth,
          useErrorDialogs: useErrorDialogs,
        ),
      );
    } catch (e) {
      if (e is PlatformException) {
        if (e.code == auth_error.notAvailable ||
            e.code == auth_error.notEnrolled ||
            e.code == auth_error.passcodeNotSet ||
            e.code == auth_error.lockedOut ||
            e.code == auth_error.permanentlyLockedOut) {
          debugPrint('BiometricService: Biometrics not available: ${e.code}');
        } else {
          debugPrint('BiometricService: Authentication error: ${e.code}');
        }
      } else {
        debugPrint('BiometricService: Authentication error: $e');
      }
      return false;
    }
  }
}
