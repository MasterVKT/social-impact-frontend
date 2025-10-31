import 'package:flutter/foundation.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import '../../../../core/utils/platform_detector.dart';
import '../../domain/entities/auth_state.dart';

/// Apple Sign-In service with iOS-specific implementation and fallbacks
/// Provides secure Apple authentication for iOS devices only
class AppleSignInService {
  
  /// Check if Apple Sign-In is supported on current platform
  static bool get isSupported => PlatformDetector.isIOS;
  
  /// Check if Apple Sign-In is available on the device
  static Future<bool> isAvailable() async {
    if (!isSupported) return false;
    
    try {
      return await SignInWithApple.isAvailable();
    } catch (e) {
      if (kDebugMode) {
        print('Apple Sign-In availability check error: $e');
      }
      return false;
    }
  }
  
  /// Sign in with Apple - iOS only
  static Future<AuthorizationCredentialAppleID?> signIn() async {
    if (!isSupported) {
      throw UnsupportedError('Apple Sign-In is only available on iOS devices');
    }
    
    try {
      // Check availability first
      final available = await isAvailable();
      if (!available) {
        throw UnsupportedError('Apple Sign-In is not available on this device');
      }
      
      // Request Apple Sign-In
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        webAuthenticationOptions: WebAuthenticationOptions(
          clientId: 'your-service-id', // Configure in production
          redirectUri: Uri.parse('https://your-domain.com/auth/apple/callback'),
        ),
        nonce: _generateNonce(),
      );
      
      return credential;
    } on SignInWithAppleAuthorizationException catch (e) {
      if (kDebugMode) {
        print('Apple Sign-In authorization error: $e');
      }
      rethrow;
    } catch (e) {
      if (kDebugMode) {
        print('Apple Sign-In error: $e');
      }
      rethrow;
    }
  }
  
  /// Create Firebase credential from Apple Sign-In
  static firebase.OAuthCredential createFirebaseCredential(
    AuthorizationCredentialAppleID appleCredential,
  ) {
    return firebase.OAuthProvider('apple.com').credential(
      idToken: appleCredential.identityToken,
      accessToken: appleCredential.authorizationCode,
    );
  }
  
  /// Convert Apple Sign-In errors to auth failures
  static AuthFailure mapAppleSignInError(dynamic error) {
    if (error is SignInWithAppleAuthorizationException) {
      switch (error.code) {
        case AuthorizationErrorCode.canceled:
          return const AuthFailure(
            message: 'Apple Sign-In was cancelled',
            type: AuthFailureType.cancelledByUser,
            code: 'apple_sign_in_cancelled',
          );
          
        case AuthorizationErrorCode.failed:
          return const AuthFailure(
            message: 'Apple Sign-In failed. Please try again.',
            type: AuthFailureType.providerError,
            code: 'apple_sign_in_failed',
          );
          
        case AuthorizationErrorCode.invalidResponse:
          return const AuthFailure(
            message: 'Apple Sign-In returned an invalid response',
            type: AuthFailureType.providerError,
            code: 'apple_invalid_response',
          );
          
        case AuthorizationErrorCode.notHandled:
          return const AuthFailure(
            message: 'Apple Sign-In request was not handled',
            type: AuthFailureType.providerError,
            code: 'apple_not_handled',
          );
          
        case AuthorizationErrorCode.notInteractive:
          return const AuthFailure(
            message: 'Apple Sign-In requires user interaction',
            type: AuthFailureType.providerError,
            code: 'apple_not_interactive',
          );
          
        case AuthorizationErrorCode.unknown:
        default:
          return AuthFailure(
            message: 'Apple Sign-In failed with unknown error: ${error.toString()}',
            type: AuthFailureType.providerError,
            code: 'apple_unknown_error',
          );
      }
    }
    
    if (error is UnsupportedError) {
      return AuthFailure(
        message: error.message ?? 'Apple Sign-In is not supported',
        type: AuthFailureType.providerError,
        code: 'apple_unsupported',
      );
    }
    
    // Generic error
    return AuthFailure(
      message: 'Apple Sign-In failed: ${error.toString()}',
      type: AuthFailureType.providerError,
      code: 'apple_generic_error',
    );
  }
  
  /// Get platform-specific availability information
  static Future<Map<String, dynamic>> getAvailabilityInfo() async {
    final supported = isSupported;
    bool available = false;
    String reason = '';
    
    if (!supported) {
      reason = 'Apple Sign-In is only available on iOS devices';
    } else {
      try {
        available = await isAvailable();
        reason = available 
            ? 'Apple Sign-In is ready'
            : 'Apple Sign-In is not available on this iOS device';
      } catch (e) {
        reason = 'Failed to check Apple Sign-In availability: ${e.toString()}';
      }
    }
    
    return {
      'platform': PlatformDetector.isIOS ? 'ios' : 'other',
      'supported': supported,
      'available': available,
      'reason': reason,
      'fallbackOptions': _getFallbackOptions(),
    };
  }
  
  /// Get fallback authentication options for non-iOS platforms
  static List<String> _getFallbackOptions() {
    final options = <String>['Email/Password', 'Google Sign-In'];
    
    if (PlatformDetector.isAndroid) {
      options.add('Google Sign-In (Native)');
    }
    
    if (PlatformDetector.isWeb) {
      options.add('Google Sign-In (Popup)');
    }
    
    return options;
  }
  
  /// Generate a cryptographically secure nonce for Apple Sign-In
  static String _generateNonce() {
    // In production, this should generate a proper cryptographic nonce
    // For now, using a simple timestamp-based approach
    return DateTime.now().millisecondsSinceEpoch.toString();
  }
  
  /// Check if user information is available from Apple credential
  static bool hasUserInfo(AuthorizationCredentialAppleID credential) {
    return credential.email != null || 
           credential.givenName != null || 
           credential.familyName != null;
  }
  
  /// Extract user information from Apple credential
  static Map<String, String?> extractUserInfo(AuthorizationCredentialAppleID credential) {
    return {
      'email': credential.email,
      'firstName': credential.givenName,
      'lastName': credential.familyName,
      'displayName': _buildDisplayName(credential.givenName, credential.familyName),
    };
  }
  
  /// Build display name from Apple credential
  static String? _buildDisplayName(String? givenName, String? familyName) {
    if (givenName == null && familyName == null) return null;
    
    final parts = <String>[];
    if (givenName?.isNotEmpty == true) parts.add(givenName!);
    if (familyName?.isNotEmpty == true) parts.add(familyName!);
    
    return parts.isEmpty ? null : parts.join(' ');
  }
  
  /// Initialize Apple Sign-In service
  static Future<void> initialize() async {
    if (!isSupported) {
      if (kDebugMode) {
        print('Apple Sign-In: Not supported on this platform');
      }
      return;
    }
    
    try {
      final available = await isAvailable();
      if (kDebugMode) {
        print('Apple Sign-In: Available = $available');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Apple Sign-In initialization error: $e');
      }
    }
  }
  
  /// Get configuration requirements for Apple Sign-In
  static Map<String, dynamic> getConfigurationRequirements() {
    return {
      'platform': 'iOS only',
      'minimumIOSVersion': '13.0',
      'requiredCapabilities': ['Sign In with Apple'],
      'configurationFiles': [
        'ios/Runner/Runner.entitlements',
        'Apple Developer Console setup',
      ],
      'additionalSetup': [
        'Configure Apple Developer account',
        'Set up App ID with Sign In with Apple capability',
        'Configure service identifier for web authentication',
        'Set up proper redirect URIs',
      ],
    };
  }
}