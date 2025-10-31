import 'package:flutter/foundation.dart';

// Import conditionnellement selon la plateforme
import 'firebase_service_stub.dart'
    if (dart.library.io) 'firebase_service_mobile.dart'
    if (dart.library.html) 'firebase_service_web.dart';

export 'firebase_service_stub.dart'
    if (dart.library.io) 'firebase_service_mobile.dart'
    if (dart.library.html) 'firebase_service_web.dart';

/// Initialise Firebase pour la plateforme actuelle
Future<void> initializeFirebase() async {
  try {
    await initializeFirebaseForPlatform();
    debugPrint('Firebase initialisé avec succès');
  } catch (e) {
    debugPrint('Erreur lors de l\'initialisation de Firebase: $e');
    rethrow;
  }
}
