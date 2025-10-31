import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import '../../../firebase_options.dart';

/// Initialise Firebase pour le web
Future<void> initializeFirebaseForPlatform() async {
  try {
    if (kIsWeb) {
      // Utilisation d'un try-catch pour gérer les erreurs spécifiques au web
      try {
        await Firebase.initializeApp(
          options: DefaultFirebaseOptions.web,
        );
        debugPrint('Firebase initialisé pour le web');
      } catch (e) {
        debugPrint(
            'Erreur lors de l\'initialisation de Firebase pour le web: $e');
        debugPrint('Utilisation du mode de secours pour le web');
        // Mode de secours - ne pas initialiser Firebase pour le web
      }
    } else {
      throw UnsupportedError('Cette implémentation est uniquement pour le web');
    }
  } catch (e) {
    debugPrint('Erreur lors de l\'initialisation de Firebase pour le web: $e');
    rethrow;
  }
}
