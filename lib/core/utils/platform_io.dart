import 'dart:io' show Platform;

/// Export de la classe Platform pour les plateformes mobiles et desktop
/// Cette classe est utilisée par platform_detector.dart
class PlatformImpl {
  static bool get isAndroid => Platform.isAndroid;
  static bool get isIOS => Platform.isIOS;
  static bool get isWindows => Platform.isWindows;
  static bool get isMacOS => Platform.isMacOS;
  static bool get isLinux => Platform.isLinux;
}
