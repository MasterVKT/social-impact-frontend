/// Implémentation web de la classe Platform pour la détection de plateforme
/// Cette classe est utilisée par platform_detector.dart
class PlatformImpl {
  // Sur le web, ces valeurs sont toujours fausses
  static bool get isAndroid => false;
  static bool get isIOS => false;
  static bool get isWindows => false;
  static bool get isMacOS => false;
  static bool get isLinux => false;
}
