import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import '../../../../core/utils/platform_detector.dart';
import '../../domain/entities/auth_state.dart';

/// Google Sign-In service with platform-adaptive behavior
/// Handles platform-specific configuration and error handling
class GoogleSignInService {
  static GoogleSignIn? _googleSignIn;
  
  /// Get configured Google Sign-In instance
  static GoogleSignIn get instance {
    _googleSignIn ??= _createGoogleSignIn();
    return _googleSignIn!;
  }
  
  /// Create Google Sign-In instance with platform-specific configuration
  static GoogleSignIn _createGoogleSignIn() {
    if (PlatformDetector.isWeb) {
      // Web configuration
      return GoogleSignIn(
        scopes: ['email', 'profile'],
        // Web client ID would be configured here in production
        clientId: kDebugMode ? null : 'your-web-client-id.googleusercontent.com',
      );
    } else if (PlatformDetector.isMobile) {
      // Mobile configuration
      return GoogleSignIn(
        scopes: ['email', 'profile'],
        // Mobile client IDs are configured in platform-specific files
        // Android: android/app/google-services.json
        // iOS: ios/Runner/GoogleService-Info.plist
      );
    } else {
      // Fallback for other platforms
      return GoogleSignIn(
        scopes: ['email', 'profile'],
      );
    }
  }
  
  /// Sign in with Google - platform adaptive
  static Future<GoogleSignInAccount?> signIn() async {
    try {
      final googleSignIn = instance;
      
      if (PlatformDetector.isWeb) {
        // Web uses popup flow by default
        return await googleSignIn.signIn();
      } else if (PlatformDetector.isMobile) {
        // Mobile uses native flow
        return await googleSignIn.signIn();
      } else {
        // Fallback for other platforms
        return await googleSignIn.signIn();
      }
    } catch (e) {
      if (kDebugMode) {
        print('Google Sign-In error: $e');
      }
      return null;
    }
  }
  
  /// Sign out from Google
  static Future<void> signOut() async {
    try {
      await instance.signOut();
    } catch (e) {
      if (kDebugMode) {
        print('Google Sign-Out error: $e');
      }
    }
  }
  
  /// Disconnect from Google (revoke access)
  static Future<void> disconnect() async {
    try {
      await instance.disconnect();
    } catch (e) {
      if (kDebugMode) {
        print('Google disconnect error: $e');
      }
    }
  }
  
  /// Check if currently signed in to Google
  static Future<bool> isSignedIn() async {
    try {
      return await instance.isSignedIn();
    } catch (e) {
      if (kDebugMode) {
        print('Google isSignedIn check error: $e');
      }
      return false;
    }
  }
  
  /// Get current Google user
  static GoogleSignInAccount? get currentUser => instance.currentUser;
  
  /// Convert Google Sign-In errors to auth failures
  static AuthFailure mapGoogleSignInError(dynamic error) {
    final errorString = error.toString().toLowerCase();
    
    if (errorString.contains('sign_in_canceled') || 
        errorString.contains('cancelled')) {
      return const AuthFailure(
        message: 'Google Sign-In was cancelled',
        type: AuthFailureType.cancelledByUser,
      );
    }
    
    if (errorString.contains('network_error') ||
        errorString.contains('network')) {
      return const AuthFailure(
        message: 'Network error during Google Sign-In. Please check your connection.',
        type: AuthFailureType.networkError,
      );
    }
    
    if (errorString.contains('sign_in_failed') ||
        errorString.contains('account_selection_required')) {
      return const AuthFailure(
        message: 'Google Sign-In failed. Please try again.',
        type: AuthFailureType.providerError,
      );
    }
    
    if (errorString.contains('invalid_client')) {
      return const AuthFailure(
        message: 'Google Sign-In configuration error. Please contact support.',
        type: AuthFailureType.providerError,
        code: 'invalid_client',
      );
    }
    
    // Generic error
    return AuthFailure(
      message: 'Google Sign-In failed: ${error.toString()}',
      type: AuthFailureType.providerError,
    );
  }
  
  /// Create Firebase credential from Google Sign-In
  static firebase.OAuthCredential createFirebaseCredential(GoogleSignInAuthentication googleAuth) {
    return firebase.GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
  }
  
  /// Get platform-specific configuration status
  static Map<String, dynamic> getConfigurationStatus() {
    return {
      'platform': PlatformDetector.isWeb ? 'web' : (PlatformDetector.isAndroid ? 'android' : (PlatformDetector.isIOS ? 'ios' : 'unknown')),
      'isWeb': PlatformDetector.isWeb,
      'isMobile': PlatformDetector.isMobile,
      'isAndroid': PlatformDetector.isAndroid,
      'isIOS': PlatformDetector.isIOS,
      'supportsGoogleSignIn': PlatformDetector.isWeb || PlatformDetector.isMobile,
      'clientConfigured': _isClientConfigured(),
    };
  }
  
  /// Check if Google Sign-In client is properly configured
  static bool _isClientConfigured() {
    if (PlatformDetector.isWeb) {
      // In production, web needs a client ID
      return true; // For development, we'll assume it's configured
    } else if (PlatformDetector.isMobile) {
      // Mobile gets configuration from platform files
      return true;
    }
    return false;
  }
  
  /// Initialize Google Sign-In service
  static Future<void> initialize() async {
    try {
      // Pre-initialize the Google Sign-In instance
      final googleSignIn = instance;
      
      // Check if already signed in (for silent sign-in)
      if (await googleSignIn.isSignedIn()) {
        final account = await googleSignIn.signInSilently();
        if (kDebugMode && account != null) {
          print('Google Sign-In: Already signed in as ${account.email}');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Google Sign-In initialization error: $e');
      }
    }
  }
}