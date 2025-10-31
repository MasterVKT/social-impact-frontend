import 'dart:async';
import 'package:flutter/foundation.dart';

/// Utility functions for Firebase Web interop
/// This is a stub implementation for non-web platforms
/// The actual web implementation would use dart:js_interop

/// Convert Dart object to JavaScript object
Object? jsify(Object? object) {
  if (kIsWeb) {
    // Cette implémentation est un stub
    // Dans une vraie implémentation web, nous utiliserions dart:js_interop
    return object;
  }
  return object;
}

/// Convert JavaScript object to Dart object
dynamic dartify(Object? jsObject) {
  if (kIsWeb) {
    // Cette implémentation est un stub
    // Dans une vraie implémentation web, nous utiliserions dart:js_interop
    return jsObject;
  }
  return jsObject;
}

/// Handle JavaScript thenable (Promise) and convert to Dart Future
Future<T> handleThenable<T>(Object jsPromise) {
  // Cette implémentation est un stub
  // Dans une vraie implémentation web, nous utiliserions dart:js_interop
  final completer = Completer<T>();

  // Simuler une résolution immédiate
  if (jsPromise is Future) {
    jsPromise.then((result) {
      completer.complete(result as T);
    }).catchError((error) {
      completer.completeError(error);
    });
  } else {
    // Si ce n'est pas un Future, on complète avec la valeur directement
    try {
      completer.complete(jsPromise as T);
    } catch (e) {
      completer.completeError(e);
    }
  }

  return completer.future;
}
