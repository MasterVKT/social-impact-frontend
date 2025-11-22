import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'core/themes/app_theme.dart';
import 'core/config/env_config.dart';
import 'core/services/storage/adaptive_storage_service.dart';
import 'core/services/stripe/stripe_service.dart';
import 'core/services/messaging/firebase_messaging_service.dart';
import 'core/router/app_router.dart';
import 'core/services/firebase/firebase_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Configure URL strategy for web
  if (kIsWeb) {
    setPathUrlStrategy();
  }

  // 1. Load environment variables
  await EnvConfig.load();
  if (kDebugMode) {
    EnvConfig.printConfig();
  }

  // 2. Initialize Firebase with platform-specific implementation
  try {
    await initializeFirebase();
    debugPrint('✅ Firebase initialized');
  } catch (e) {
    debugPrint('❌ Firebase initialization error: $e');
    // Continue l'exécution même en cas d'erreur
  }

  // 3. Use Firebase Emulators in debug mode
  if (kDebugMode) {
    try {
      FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
      FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
      FirebaseFunctions.instance.useFunctionsEmulator('localhost', 5001);
      FirebaseStorage.instance.useStorageEmulator('localhost', 9199);
      debugPrint('✅ Firebase Emulators connected');
    } catch (e) {
      debugPrint('⚠️ Firebase Emulators not available: $e');
      // Continue without emulators (use real Firebase)
    }
  }

  // 4. Initialize Storage Service
  try {
    await AdaptiveStorageService.instance.initialize();
    if (kDebugMode) {
      final storageInfo =
          await AdaptiveStorageService.instance.getStorageInfo();
      debugPrint('✅ Storage initialized: $storageInfo');
    }
  } catch (e) {
    debugPrint('⚠️ Storage initialization failed: $e');
    // Continue without storage - the app should still work with reduced functionality
  }

  // 5. Initialize Stripe
  try {
    await StripeService.instance.initialize();
    debugPrint('✅ Stripe initialized');
  } catch (e) {
    debugPrint('⚠️ Stripe initialization failed: $e');
    // Continue without Stripe - payments won't work
  }

  // 6. Initialize Firebase Messaging
  try {
    await FirebaseMessagingService.instance.initialize();
    debugPrint('✅ Firebase Messaging initialized');
  } catch (e) {
    debugPrint('⚠️ Messaging initialization failed: $e');
    // Continue without messaging - notifications won't work
  }

  runApp(
    const ProviderScope(
      child: SocialFinanceApp(),
    ),
  );
}

class SocialFinanceApp extends ConsumerWidget {
  const SocialFinanceApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: 'Social Finance Impact Platform',
      debugShowCheckedModeBanner: false,

      // Adaptive themes
      theme: AdaptiveTheme.lightTheme,
      darkTheme: AdaptiveTheme.darkTheme,
      themeMode: ThemeMode.system,

      // Router configuration
      routerConfig: router,

      // Localization (will be expanded later)
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('fr', 'FR'),
      ],
    );
  }
}
