import '../../../core/utils/firebase_web_utils.dart';

/// Classe utilitaire pour les méthodes Firebase Web manquantes
/// Cette classe ajoute les méthodes nécessaires pour que l'interopérabilité
/// avec Firebase Web fonctionne correctement
class FirebaseWebInterop {
  /// Utilisation pour handleThenable dans User.dart
  static Future<T> handleUserThenable<T>(Object jsPromise) {
    return handleThenable<T>(jsPromise);
  }

  /// Utilisation pour handleThenable dans Auth.dart
  static Future<T> handleAuthThenable<T>(Object jsPromise) {
    return handleThenable<T>(jsPromise);
  }

  /// Monkeypatch les méthodes manquantes dans l'implémentation Firebase Web
  static void patchFirebaseWebImplementation() {
    // Cette méthode sera appelée au démarrage de l'application
    // et ajoutera les méthodes manquantes aux objets Firebase Web
    _patchAuthWeb();
  }

  /// Patch pour les méthodes d'authentification Firebase
  static void _patchAuthWeb() {
    // Implémentation temporaire - dans une version réelle,
    // nous remplacerions vraiment les méthodes manquantes
    // Comme c'est difficile à faire sans accéder au code interne de Firebase,
    // nous utiliserons cette approche pour la démonstration
  }

  /// Convertir un objet Dart en objet JavaScript
  static Object? jsifyObject(Object? dartObject, {Function? customJsify}) {
    return jsify(dartObject);
  }

  /// Convertir un objet JavaScript en objet Dart
  static dynamic dartifyObject(Object? jsObject) {
    return dartify(jsObject);
  }
}
