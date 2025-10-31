import 'dart:html' as html;

/// Web implementation using dart:html localStorage
class WebStorageImpl {
  static String? getItem(String key) {
    return html.window.localStorage[key];
  }
  
  static void setItem(String key, String value) {
    html.window.localStorage[key] = value;
  }
  
  static void removeItem(String key) {
    html.window.localStorage.remove(key);
  }
  
  static void clear() {
    html.window.localStorage.clear();
  }
  
  static List<String> get keys {
    return html.window.localStorage.keys.toList();
  }
  
  static String get userAgent {
    return html.window.navigator.userAgent;
  }
  
  static bool get supportsSessionStorage {
    try {
      return html.window.sessionStorage.isEmpty is bool;
    } catch (e) {
      return false;
    }
  }
}