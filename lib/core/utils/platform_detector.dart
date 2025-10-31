import 'package:flutter/foundation.dart' show kIsWeb;

// Importation conditionnelle de dart:io pour éviter les problèmes de compilation web
import 'platform_io.dart' if (dart.library.html) 'platform_web.dart';

/// PlatformDetector provides utilities for detecting the current platform
/// and platform-specific capabilities for multi-platform Flutter applications.
class PlatformDetector {
  // Platform detection
  static bool get isWeb => kIsWeb;
  static bool get isMobile => !kIsWeb && (isAndroid || isIOS);
  static bool get isAndroid => !kIsWeb && PlatformImpl.isAndroid;
  static bool get isIOS => !kIsWeb && PlatformImpl.isIOS;
  static bool get isDesktop =>
      !kIsWeb &&
      (PlatformImpl.isWindows || PlatformImpl.isMacOS || PlatformImpl.isLinux);

  // Type of platform
  static PlatformType get currentPlatform {
    if (kIsWeb) return PlatformType.web;
    if (PlatformImpl.isAndroid) return PlatformType.android;
    if (PlatformImpl.isIOS) return PlatformType.ios;
    return PlatformType.unknown;
  }

  // Platform-specific capabilities
  static bool get supportsBiometrics => isMobile;
  static bool get supportsNotifications => isMobile;
  static bool get supportsBackgroundProcessing => isMobile;
  static bool get supportsUrlNavigation => isWeb;
  static bool get supportsFileSystem => isMobile;
  static bool get supportsAppleSignIn => isIOS;
  static bool get supportsGoogleSignIn => true; // Available on all platforms

  // Platform-specific UI behaviors
  static bool get usesCupertinoDesign => isIOS;
  static bool get usesMaterialDesign => isAndroid || isWeb;
  static bool get supportsHapticFeedback => isMobile;
  static bool get supportsKeyboardShortcuts => isWeb || isDesktop;
  static bool get supportsHoverStates => isWeb || isDesktop;
}

/// Enumeration of supported platform types
enum PlatformType { android, ios, web, unknown }
