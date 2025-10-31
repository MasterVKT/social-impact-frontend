import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import '../../../firebase_options.dart';

/// Initialise Firebase pour les plateformes mobiles et desktop
Future<void> initializeFirebaseForPlatform() async {
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    debugPrint('Firebase initialisé pour mobile/desktop');
  } catch (e) {
    debugPrint(
        'Erreur lors de l\'initialisation de Firebase pour mobile/desktop: $e');
    rethrow;
  }
}
