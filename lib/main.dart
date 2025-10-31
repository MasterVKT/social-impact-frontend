import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_strategy/url_strategy.dart';
import 'core/themes/app_theme.dart';
import 'core/services/storage/adaptive_storage_service.dart';
import 'core/router/app_router.dart';
import 'core/services/firebase/firebase_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Configure URL strategy for web
  if (kIsWeb) {
    setPathUrlStrategy();
  }

  // Initialize Firebase with platform-specific implementation
  try {
    await initializeFirebase();
  } catch (e) {
    debugPrint('Erreur lors de l\'initialisation de Firebase: $e');
    // Continue l'exécution même en cas d'erreur
  }

  // Initialize Storage Service
  try {
    await AdaptiveStorageService.instance.initialize();
    if (kDebugMode) {
      final storageInfo =
          await AdaptiveStorageService.instance.getStorageInfo();
      print('Storage initialized: $storageInfo');
    }
  } catch (e) {
    if (kDebugMode) {
      print('Storage initialization failed: $e');
    }
    // Continue without storage - the app should still work with reduced functionality
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
