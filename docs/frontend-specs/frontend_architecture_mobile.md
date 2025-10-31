# Architecture Frontend - Mobile Hybride + Web Responsive
## Social Finance Impact Platform MVP

## 1. Stack technologique frontend multi-plateforme

### 1.1 Frameworks et langages

**Flutter 3.19+ Multi-Platform**
- Framework principal pour mobile (Android/iOS) et web
- Applications natives compilées pour Android et iOS
- Single Page Application (SPA) pour web
- Code source unique avec adaptations par plateforme
- Hot reload pour développement rapide toutes plateformes

**Dart 3.2+**
- Langage de programmation principal
- Type safety et null safety natifs
- Performance optimisée mobile et web
- Compilation native (mobile) et JavaScript (web)

### 1.2 Librairies clés multi-plateformes

**State Management Universal**
```dart
dependencies:
  flutter_riverpod: ^2.4.0  # Gestion d'état réactive universelle
  riverpod_annotation: ^2.3.0  # Génération de code Riverpod
```

**Firebase Integration Multi-Platform**
```dart
dependencies:
  firebase_core: ^2.15.0
  firebase_auth: ^4.7.2
  cloud_firestore: ^4.8.4
  firebase_storage: ^11.2.5
  firebase_analytics: ^10.4.5
  cloud_functions: ^4.3.3
  firebase_messaging: ^14.6.6  # Push notifications mobile
```

**UI et Navigation Adaptative**
```dart
dependencies:
  go_router: ^10.0.0  # Routing universel mobile/web
  flutter_localizations: ^3.10.0  # Internationalisation
  intl: ^0.18.0  # Formatage dates et nombres
  cached_network_image: ^3.3.0  # Cache images optimisé
  url_strategy: ^0.2.0  # URLs propres web
```

**Platform-Specific**
```dart
dependencies:
  device_info_plus: ^9.1.0  # Informations device
  connectivity_plus: ^4.0.2  # État connectivité
  permission_handler: ^11.0.1  # Permissions (mobile uniquement)
  package_info_plus: ^4.2.0  # Informations app
  google_sign_in: ^6.1.5  # Authentification Google
  local_auth: ^2.1.6  # Biométrie mobile
```

**Utilitaires et Helpers**
```dart
dependencies:
  dio: ^5.3.0  # Client HTTP avancé
  logger: ^2.0.0  # Logging structuré
  equatable: ^2.0.5  # Comparaison d'objets
  freezed_annotation: ^2.4.1  # Modèles de données immutables
  path_provider: ^2.1.1  # Accès système fichiers mobile
```

**Dev Dependencies**
```dart
dev_dependencies:
  flutter_test: any
  integration_test: any  # Tests d'intégration
  mockito: ^5.4.2  # Mocking pour tests
  build_runner: ^2.4.6  # Génération de code
  freezed: ^2.4.5  # Générateur modèles immutables
  riverpod_generator: ^2.3.0  # Générateur providers
  flutter_launcher_icons: ^0.13.1  # Icônes multi-plateformes
  flutter_native_splash: ^2.3.2  # Splash screen natif
```

## 2. Architecture modulaire multi-plateforme

### 2.1 Structure hiérarchique adaptative

```
lib/
├── main.dart                    # Point d'entrée universel
├── main_mobile.dart            # Configuration mobile spécifique
├── main_web.dart               # Configuration web spécifique
├── app.dart                    # Configuration app multi-plateforme
├── core/                       # Code partagé universel
│   ├── constants/
│   │   ├── app_constants.dart   # Constantes universelles
│   │   ├── api_constants.dart   # URLs et endpoints
│   │   ├── ui_constants.dart    # Constantes UI responsive
│   │   └── platform_constants.dart # Spécificités plateformes
│   ├── themes/
│   │   ├── app_theme.dart       # Thème Material 3 adaptatif
│   │   ├── mobile_theme.dart    # Adaptations mobiles
│   │   ├── web_theme.dart       # Adaptations web
│   │   ├── color_scheme.dart    # Couleurs universelles
│   │   └── text_theme.dart      # Typographie responsive
│   ├── router/
│   │   ├── app_router.dart      # Router principal adaptatif
│   │   ├── mobile_router.dart   # Navigation mobile
│   │   ├── web_router.dart      # Navigation web + URL
│   │   └── route_names.dart     # Constantes routes
│   ├── utils/
│   │   ├── platform_detector.dart # Détection plateforme
│   │   ├── responsive_helper.dart # Utilitaires responsive
│   │   ├── device_utils.dart     # Informations device
│   │   ├── connectivity_manager.dart # Gestion connectivité
│   │   └── permission_manager.dart   # Gestion permissions
│   ├── services/               # Services universels
│   │   ├── platform_service.dart # Service abstrait plateforme
│   │   ├── storage_service.dart  # Stockage adaptatif
│   │   ├── notification_service.dart # Notifications
│   │   └── analytics_service.dart    # Analytics multi-plateforme
│   └── errors/
│       ├── app_exceptions.dart  # Exceptions personnalisées
│       └── error_handler.dart   # Gestionnaire d'erreurs global
├── features/                   # Fonctionnalités par domaine
│   ├── auth/                   # Module authentification
│   │   ├── data/              # Couche données
│   │   │   ├── repositories/   # Implémentations repositories
│   │   │   ├── data_sources/   # Sources données Firebase
│   │   │   │   ├── mobile_auth_source.dart # Auth mobile
│   │   │   │   └── web_auth_source.dart    # Auth web
│   │   │   └── models/         # Modèles avec JSON serialization
│   │   ├── domain/            # Logique métier pure
│   │   │   ├── entities/       # Entités métier
│   │   │   ├── use_cases/      # Cas d'usage universels
│   │   │   └── repositories/   # Interfaces repositories
│   │   └── presentation/      # Interface utilisateur
│   │       ├── pages/          # Pages/écrans adaptatifs
│   │       │   ├── mobile/     # UI mobile
│   │       │   ├── tablet/     # UI tablette
│   │       │   └── desktop/    # UI desktop
│   │       ├── widgets/        # Widgets spécifiques auth
│   │       ├── providers/      # Providers Riverpod
│   │       └── state/          # Classes d'état
│   ├── projects/              # Module projets (même structure)
│   ├── contributions/         # Module contributions
│   ├── audits/               # Module audits
│   └── admin/                # Module administration
├── shared/                   # Composants partagés adaptatifs
│   ├── widgets/             # Widgets universels responsive
│   │   ├── buttons/          # Boutons adaptatifs
│   │   │   ├── adaptive_button.dart
│   │   │   ├── mobile_button.dart
│   │   │   └── web_button.dart
│   │   ├── cards/            # Cards responsives
│   │   │   ├── project_card.dart
│   │   │   ├── mobile_card.dart
│   │   │   └── desktop_card.dart
│   │   ├── forms/            # Formulaires adaptatifs
│   │   │   ├── adaptive_textfield.dart
│   │   │   ├── mobile_form.dart
│   │   │   └── web_form.dart
│   │   ├── navigation/       # Navigation par plateforme
│   │   │   ├── adaptive_navigation.dart
│   │   │   ├── mobile_bottom_nav.dart
│   │   │   ├── tablet_rail_nav.dart
│   │   │   └── desktop_sidebar.dart
│   │   └── layouts/          # Layouts responsifs
│   │       ├── responsive_layout.dart
│   │       ├── mobile_layout.dart
│   │       ├── tablet_layout.dart
│   │       └── desktop_layout.dart
│   ├── providers/            # Providers globaux
│   └── services/             # Services partagés
├── platform/                # Code spécifique plateforme
│   ├── mobile/              # Code mobile uniquement
│   │   ├── widgets/         # Widgets mobiles natifs
│   │   ├── services/        # Services mobiles (permissions, etc.)
│   │   ├── plugins/         # Plugins mobiles
│   │   └── utils/           # Utilitaires mobiles
│   └── web/                 # Code web uniquement
│       ├── widgets/         # Widgets web
│       ├── services/        # Services web (localStorage, etc.)
│       ├── plugins/         # Plugins web
│       └── utils/           # Utilitaires web
└── l10n/                   # Internationalisation
    ├── app_en.arb          # Textes anglais
    └── app_fr.arb          # Textes français (principal)
```

### 2.2 Architecture en couches multi-plateforme (Clean Architecture)

**Couche Présentation Adaptative (Presentation Layer)**
- **Pages Responsives** : Écrans adaptatifs mobile/tablette/desktop
- **Widgets Universels** : Composants réutilisables toutes plateformes
- **Platform-Specific Widgets** : Composants spécialisés par plateforme
- **Providers Multi-Platform** : Gestion d'état universelle avec Riverpod
- **State Classes** : Classes d'état immutables avec Freezed

**Couche Domaine Universelle (Domain Layer)**
- **Entities** : Entités métier indépendantes de la plateforme
- **Use Cases** : Logique métier pure réutilisable
- **Repository Interfaces** : Contrats d'accès aux données universels
- **Value Objects** : Objets valeur typés et validés

**Couche Données Adaptative (Data Layer)**
- **Repository Implementations** : Implémentations avec adaptation plateforme
- **Data Sources** : Sources de données spécialisées (mobile/web)
- **Models** : Modèles de données avec sérialisation JSON
- **Local Storage** : Stockage local adaptatif (SQLite mobile, IndexedDB web)

## 3. Système de design responsive

### 3.1 Breakpoints et adaptabilité

```dart
// responsive_breakpoints.dart
class ResponsiveBreakpoints {
  // Breakpoints universels
  static const double mobile = 600;
  static const double tablet = 1024;
  static const double desktop = 1440;
  static const double largeDesktop = 1920;

  // Détection contexte
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < mobile;
      
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= mobile &&
      MediaQuery.of(context).size.width < desktop;
      
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= desktop;

  // Platform-aware responsive
  static bool isHandheld(BuildContext context) =>
      PlatformDetector.isMobile && isMobile(context);
      
  static bool isTabletDevice(BuildContext context) =>
      PlatformDetector.isMobile && isTablet(context);
}
```

### 3.2 Layout adaptatif universel

```dart
// responsive_layout.dart
class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;
  final Widget? watch; // Support futur smartwatch

  const ResponsiveLayout({
    Key? key,
    required this.mobile,
    this.tablet,
    required this.desktop,
    this.watch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Détection combinée taille d'écran + plateforme
        if (PlatformDetector.isMobile) {
          // Mobile natif - adaptation selon orientation
          return OrientationBuilder(
            builder: (context, orientation) {
              if (orientation == Orientation.landscape &&
                  constraints.maxWidth > ResponsiveBreakpoints.tablet) {
                return tablet ?? desktop; // Mode tablette landscape
              }
              return mobile;
            },
          );
        } else if (PlatformDetector.isWeb) {
          // Web - responsive classique
          if (constraints.maxWidth < ResponsiveBreakpoints.mobile) {
            return mobile;
          } else if (constraints.maxWidth < ResponsiveBreakpoints.desktop) {
            return tablet ?? mobile;
          } else {
            return desktop;
          }
        }
        
        return mobile; // Fallback
      },
    );
  }
}
```

### 3.3 Navigation avec GoRouter adaptatif

```dart
// app_router.dart
final appRouter = GoRouter(
  initialLocation: '/',
  navigatorKey: GlobalKey<NavigatorState>(),
  
  // Configuration adaptative par plateforme
  routerDelegate: GoRouterDelegate(
    navigatorBuilder: (context, state, child) {
      if (PlatformDetector.isMobile) {
        return MobileNavigatorWrapper(child: child);
      } else {
        return WebNavigatorWrapper(child: child);
      }
    },
  ),
  
  redirect: (context, state) {
    // Logique de redirection adaptative
    final user = FirebaseAuth.instance.currentUser;
    final isLoggedIn = user != null;
    final isLoggingIn = state.location.startsWith('/auth');
    
    if (!isLoggedIn && !isLoggingIn) {
      // Redirection adaptée par plateforme
      return PlatformDetector.isMobile ? '/mobile/auth' : '/auth';
    }
    
    return null;
  },
  
  routes: [
    // Routes universelles
    GoRoute(
      path: '/',
      builder: (context, state) => ResponsiveLayout(
        mobile: MobileLandingPage(),
        tablet: TabletLandingPage(),
        desktop: DesktopLandingPage(),
      ),
    ),
    
    // Routes d'authentification adaptatives
    GoRoute(
      path: '/auth',
      builder: (context, state) => ResponsiveLayout(
        mobile: MobileAuthLayout(),
        desktop: DesktopAuthLayout(),
      ),
      routes: [
        GoRoute(
          path: '/login',
          pageBuilder: (context, state) {
            if (PlatformDetector.isMobile) {
              return MaterialPageRoute(
                builder: (_) => MobileLoginPage(),
              );
            } else {
              return NoTransitionPage(
                child: WebLoginPage(),
              );
            }
          },
        ),
      ],
    ),
    
    // Shell route adaptatif pour navigation principale
    ShellRoute(
      builder: (context, state, child) => ResponsiveLayout(
        mobile: MobileMainLayout(child: child),
        tablet: TabletMainLayout(child: child),
        desktop: DesktopMainLayout(child: child),
      ),
      routes: [
        GoRoute(
          path: '/dashboard',
          pageBuilder: (context, state) => _buildAdaptivePage(
            mobile: () => MobileDashboardPage(),
            tablet: () => TabletDashboardPage(),
            desktop: () => DesktopDashboardPage(),
          ),
        ),
      ],
    ),
  ],
);

// Helper pour pages adaptatives
Page _buildAdaptivePage({
  required Widget Function() mobile,
  Widget Function()? tablet,
  required Widget Function() desktop,
}) {
  return ResponsivePage(
    mobile: mobile(),
    tablet: tablet?.call(),
    desktop: desktop(),
  );
}
```

## 4. Performance et optimisations multi-plateformes

### 4.1 Lazy Loading et Code Splitting

```dart
// Platform-aware lazy loading
class PlatformLazyLoader {
  static Widget lazyLoad({
    required String routeName,
    required Map<PlatformType, Widget Function()> builders,
  }) {
    return FutureBuilder<Widget>(
      future: _loadPlatformWidget(routeName, builders),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return snapshot.data!;
        }
        return PlatformLoadingIndicator();
      },
    );
  }
  
  static Future<Widget> _loadPlatformWidget(
    String routeName,
    Map<PlatformType, Widget Function()> builders,
  ) async {
    final platform = PlatformDetector.currentPlatform;
    final builder = builders[platform] ?? builders[PlatformType.mobile]!;
    
    // Code splitting par plateforme
    await Future.delayed(Duration.zero); // Permet le code splitting
    return builder();
  }
}
```

### 4.2 Gestion d'état optimisée

```dart
// State management adaptatif
@riverpod
class AdaptiveAppState extends _$AdaptiveAppState {
  @override
  AppState build() {
    // État initial adapté par plateforme
    return AppState(
      platform: PlatformDetector.currentPlatform,
      isOnline: true,
      theme: _getInitialTheme(),
    );
  }
  
  ThemeData _getInitialTheme() {
    if (PlatformDetector.isMobile) {
      return MobileTheme.light;
    } else {
      return WebTheme.light;
    }
  }
  
  void updateConnectivity(bool isOnline) {
    state = state.copyWith(isOnline: isOnline);
    
    // Actions spécifiques par plateforme
    if (PlatformDetector.isMobile && !isOnline) {
      _enableOfflineMode();
    }
  }
  
  void _enableOfflineMode() async {
    await FirebaseFirestore.instance.enablePersistence();
  }
}
```

### 4.3 Optimisations spécifiques

**Mobile Optimizations:**
```dart
class MobileOptimizations {
  static void initialize() {
    // Cache optimisé mobile
    PaintingBinding.instance.imageCache.maximumSize = 100;
    PaintingBinding.instance.imageCache.maximumSizeBytes = 50 << 20; // 50MB
    
    // Performance rendering
    WidgetsBinding.instance.deferFirstFrame();
    
    // Memory management
    SystemChannels.lifecycle.setMessageHandler(_handleLifecycle);
  }
  
  static Future<String?> _handleLifecycle(String? message) async {
    if (message == AppLifecycleState.paused.toString()) {
      // Libérer ressources en arrière-plan
      await _clearNonEssentialCache();
    }
    return null;
  }
}
```

**Web Optimizations:**
```dart
class WebOptimizations {
  static void initialize() {
    // URLs propres
    setPathUrlStrategy();
    
    // Service Worker
    if ('serviceWorker' in window.navigator) {
      _registerServiceWorker();
    }
    
    // Preload critical resources
    _preloadCriticalAssets();
  }
  
  static void _registerServiceWorker() {
    window.navigator.serviceWorker!.register('/sw.js');
  }
}
```

## 5. Services adaptatifs

### 5.1 Service d'authentification multi-plateforme

```dart
abstract class AuthService {
  Future<UserCredential?> signInWithGoogle();
  Future<UserCredential?> signInWithApple(); // iOS uniquement
  Future<bool> canUseBiometrics(); // Mobile uniquement
  Stream<User?> get authStateChanges;
}

class FirebaseAuthService implements AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<UserCredential?> signInWithGoogle() async {
    if (PlatformDetector.isWeb) {
      return _signInWithGoogleWeb();
    } else {
      return _signInWithGoogleMobile();
    }
  }
  
  Future<UserCredential?> _signInWithGoogleWeb() async {
    GoogleAuthProvider googleProvider = GoogleAuthProvider();
    return await _auth.signInWithPopup(googleProvider);
  }
  
  Future<UserCredential?> _signInWithGoogleMobile() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) return null;
    
    final GoogleSignInAuthentication googleAuth = 
        await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    
    return await _auth.signInWithCredential(credential);
  }

  @override
  Future<bool> canUseBiometrics() async {
    if (!PlatformDetector.isMobile) return false;
    
    final LocalAuthentication localAuth = LocalAuthentication();
    return await localAuth.canCheckBiometrics;
  }
}
```

### 5.2 Service de stockage adaptatif

```dart
abstract class StorageService {
  Future<void> setString(String key, String value);
  Future<String?> getString(String key);
  Future<void> remove(String key);
  Future<void> clear();
}

class AdaptiveStorageService implements StorageService {
  late final StorageService _impl;
  
  AdaptiveStorageService() {
    if (PlatformDetector.isMobile) {
      _impl = MobileStorageService();
    } else {
      _impl = WebStorageService();
    }
  }
  
  @override
  Future<void> setString(String key, String value) =>
      _impl.setString(key, value);
      
  // ... autres méthodes déléguées
}

class MobileStorageService implements StorageService {
  @override
  Future<void> setString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }
  
  // ... implémentation mobile
}

class WebStorageService implements StorageService {
  @override
  Future<void> setString(String key, String value) async {
    window.localStorage[key] = value;
  }
  
  // ... implémentation web
}
```

## 6. Tests multi-plateformes

### 6.1 Stratégie de tests adaptative

```dart
// Tests par plateforme
void main() {
  group('Multi-Platform Tests', () {
    testWidgets('Authentication works on all platforms', (tester) async {
      await tester.pumpWidget(
        PlatformApp(
          platform: TargetPlatform.android,
          home: LoginPage(),
        ),
      );
      
      // Tests spécifiques Android
      await _testAndroidAuth(tester);
    });
    
    testWidgets('Web navigation works correctly', (tester) async {
      await tester.pumpWidget(
        PlatformApp(
          platform: TargetPlatform.web,
          home: HomePage(),
        ),
      );
      
      // Tests spécifiques Web
      await _testWebNavigation(tester);
    });
  });
}
```

Cette architecture multi-plateforme complète assure une expérience utilisateur optimale sur mobile (Android/iOS) et web, avec un code source principalement partagé et des adaptations spécifiques par plateforme selon les bonnes pratiques.