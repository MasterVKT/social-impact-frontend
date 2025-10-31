/// Stub implementation for non-web platforms
abstract class WebStorageImpl {
  static String? getItem(String key) => null;
  static void setItem(String key, String value) {}
  static void removeItem(String key) {}
  static void clear() {}
  static List<String> get keys => [];
  static String get userAgent => 'flutter-app';
  static bool get supportsSessionStorage => false;
}