# Intégrations Firebase et APIs - Mobile Hybride + Web Responsive
## Social Finance Impact Platform MVP

## 1. Configuration Firebase Multi-Plateforme

### 1.1 Initialisation Firebase adaptative

```dart
// main.dart - Point d'entrée universel
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Configuration spécifique web
  if (kIsWeb) {
    await _initializeWeb();
  } else {
    await _initializeMobile();
  }
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  // Configuration post-initialisation
  await _postInitializeSetup();
  
  runApp(ProviderScope(child: MyApp()));
}

Future<void> _initializeWeb() async {
  // Configuration spécifique web
  if (kIsWeb) {
    setPathUrlStrategy(); // URLs propres
  }
}

Future<void> _initializeMobile() async {
  // Configuration spécifique mobile
  if (PlatformDetector.isMobile) {
    await FirebaseFirestore.instance.enablePersistence();
    await _configureMobileNotifications();
  }
}

Future<void> _postInitializeSetup() async {
  // Configuration universelle post-init
  if (kDebugMode) {
    // Émulateurs en développement
    if (PlatformDetector.isMobile) {
      await _connectToEmulators();
    }
  }
}

Future<void> _configureMobileNotifications() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  
  // Demande de permissions
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  
  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('User granted permission');
  }
}
```

### 1.2 Dependencies pubspec.yaml multi-plateforme

```yaml
name: social_impact_mvp
description: Social Finance Impact Platform MVP - Mobile + Web

# Configuration multi-plateforme
flutter:
  uses-material-design: true
  
  # Assets universels
  assets:
    - assets/images/
    - assets/icons/
    - assets/fonts/
  
  # Fonts adaptatives
  fonts:
    - family: Roboto
      fonts:
        - asset: assets/fonts/Roboto-Regular.ttf
        - asset: assets/fonts/Roboto-Bold.ttf
          weight: 700

dependencies:
  flutter:
    sdk: flutter
    
  # Firebase Core Multi-Platform
  firebase_core: ^2.15.0
  firebase_auth: ^4.7.2
  cloud_firestore: ^4.8.4
  firebase_storage: ^11.2.5
  firebase_analytics: ^10.4.5
  cloud_functions: ^4.3.3
  
  # Firebase Mobile-Specific
  firebase_messaging: ^14.6.6  # Push notifications
  firebase_dynamic_links: ^5.3.5  # Deep linking mobile
  
  # State Management Universal
  flutter_riverpod: ^2.4.0
  riverpod_annotation: ^2.3.0
  
  # Navigation Multi-Platform
  go_router: ^10.0.0
  url_strategy: ^0.2.0  # Web URLs propres
  
  # UI Universal
  flutter_localizations:
    sdk: flutter
  intl: ^0.18.0
  cached_network_image: ^3.3.0
  
  # Platform Detection
  device_info_plus: ^9.1.0
  connectivity_plus: ^4.0.2
  package_info_plus: ^4.2.0
  
  # Authentication Multi-Platform
  google_sign_in: ^6.1.5
  sign_in_with_apple: ^5.0.0  # iOS uniquement
  
  # Storage Adaptatif
  shared_preferences: ^2.2.1  # Mobile
  universal_html: ^2.2.4      # Web localStorage
  
  # Permissions (Mobile uniquement)
  permission_handler: ^11.0.1
  
  # Biométrie (Mobile uniquement)
  local_auth: ^2.1.6
  
  # File System (Mobile)
  path_provider: ^2.1.1
  file_picker: ^5.5.0
  
  # HTTP et APIs
  dio: ^5.3.0
  http: ^1.1.0
  
  # Utils
  logger: ^2.0.0
  equatable: ^2.0.5
  freezed_annotation: ^2.4.1
  json_annotation: ^4.8.1

dev_dependencies:
  flutter_test:
    sdk: flutter
  integration_test:
    sdk: flutter
    
  # Génération de code
  build_runner: ^2.4.6
  json_serializable: ^6.7.1
  freezed: ^2.4.5
  riverpod_generator: ^2.3.0
  
  # Tests
  mockito: ^5.4.2
  
  # Configuration multi-plateforme
  flutter_launcher_icons: ^0.13.1
  flutter_native_splash: ^2.3.2
  
  # Analyse
  flutter_lints: ^2.0.0

# Configuration par plateforme
flutter_launcher_icons:
  android: true
  ios: true
  web:
    generate: true
    image_path: "assets/images/icon.png"
    background_color: "#2563EB"
    theme_color: "#2563EB"

flutter_native_splash:
  color: "#2563EB"
  image: assets/images/splash.png
  android: true
  ios: true
  web: true
```

## 2. Service d'Authentification Multi-Plateforme

### 2.1 AuthService adaptatif

```dart
// core/services/adaptive_auth_service.dart
abstract class AuthService {
  Future<UserCredential?> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
  
  Future<UserCredential?> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String userType,
  });
  
  Future<UserCredential?> signInWithGoogle();
  Future<UserCredential?> signInWithApple(); // iOS uniquement
  Future<bool> signInWithBiometrics(); // Mobile uniquement
  
  Future<void> sendPasswordResetEmail(String email);
  Future<void> sendEmailVerification();
  Future<void> signOut();
  
  User? get currentUser;
  Stream<User?> get authStateChanges;
  
  // Capacités par plateforme
  Future<bool> get supportsBiometrics;
  Future<bool> get supportsAppleSignIn;
}

class FirebaseAuthService implements AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  late final LocalAuthentication _localAuth;
  
  FirebaseAuthService() {
    if (PlatformDetector.isMobile) {
      _localAuth = LocalAuthentication();
    }
  }

  @override
  Future<UserCredential?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      // Analytics multi-plateforme
      await _trackAuthEvent('email_signin', {
        'platform': PlatformDetector.currentPlatform.name,
        'method': 'email_password',
      });
      
      return credential;
    } on FirebaseAuthException catch (e) {
      throw _handleAuthException(e);
    }
  }

  @override
  Future<UserCredential?> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String userType,
  }) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      if (credential.user != null) {
        // Création du profil utilisateur
        await _createUserProfile(
          user: credential.user!,
          firstName: firstName,
          lastName: lastName,
          userType: userType,
        );
        
        // Envoi email de vérification
        await credential.user!.sendEmailVerification();
      }
      
      await _trackAuthEvent('email_signup', {
        'platform': PlatformDetector.currentPlatform.name,
        'user_type': userType,
      });
      
      return credential;
    } on FirebaseAuthException catch (e) {
      throw _handleAuthException(e);
    }
  }

  @override
  Future<UserCredential?> signInWithGoogle() async {
    try {
      if (PlatformDetector.isWeb) {
        return await _signInWithGoogleWeb();
      } else if (PlatformDetector.isMobile) {
        return await _signInWithGoogleMobile();
      }
      throw UnsupportedError('Platform not supported for Google Sign-In');
    } catch (e) {
      throw AuthException('Erreur lors de la connexion Google: $e');
    }
  }
  
  Future<UserCredential?> _signInWithGoogleWeb() async {
    GoogleAuthProvider googleProvider = GoogleAuthProvider();
    googleProvider.addScope('email');
    googleProvider.addScope('profile');
    
    try {
      final result = await _auth.signInWithPopup(googleProvider);
      await _trackAuthEvent('google_signin_web', {});
      return result;
    } catch (e) {
      // Fallback vers redirect sur mobile web
      if (PlatformDetector.isWeb) {
        final result = await _auth.signInWithRedirect(googleProvider);
        return result;
      }
      rethrow;
    }
  }
  
  Future<UserCredential?> _signInWithGoogleMobile() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser == null) return null;
    
    final GoogleSignInAuthentication googleAuth = 
        await googleUser.authentication;
    
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    
    final result = await _auth.signInWithCredential(credential);
    await _trackAuthEvent('google_signin_mobile', {});
    return result;
  }

  @override
  Future<UserCredential?> signInWithApple() async {
    if (!PlatformDetector.isIOS) {
      throw UnsupportedError('Apple Sign-In uniquement disponible sur iOS');
    }
    
    try {
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
      
      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode,
      );
      
      final result = await _auth.signInWithCredential(oauthCredential);
      await _trackAuthEvent('apple_signin', {});
      return result;
    } catch (e) {
      throw AuthException('Erreur lors de la connexion Apple: $e');
    }
  }

  @override
  Future<bool> signInWithBiometrics() async {
    if (!PlatformDetector.isMobile) {
      throw UnsupportedError('Biométrie uniquement disponible sur mobile');
    }
    
    try {
      final isAvailable = await _localAuth.canCheckBiometrics;
      if (!isAvailable) return false;
      
      final isAuthenticated = await _localAuth.authenticate(
        localizedReason: 'Utilisez votre biométrie pour vous connecter',
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
        ),
      );
      
      if (isAuthenticated) {
        await _trackAuthEvent('biometric_signin', {});
      }
      
      return isAuthenticated;
    } catch (e) {
      throw AuthException('Erreur lors de l\'authentification biométrique: $e');
    }
  }

  @override
  Future<bool> get supportsBiometrics async {
    if (!PlatformDetector.isMobile) return false;
    
    try {
      return await _localAuth.canCheckBiometrics;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> get supportsAppleSignIn async {
    return PlatformDetector.isIOS;
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      await _trackAuthEvent('password_reset_sent', {'email': email});
    } on FirebaseAuthException catch (e) {
      throw _handleAuthException(e);
    }
  }

  @override
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
      await _trackAuthEvent('email_verification_sent', {});
    } on FirebaseAuthException catch (e) {
      throw _handleAuthException(e);
    }
  }

  @override
  Future<void> signOut() async {
    try {
      // Déconnexion Google si nécessaire
      if (PlatformDetector.isMobile) {
        await _googleSignIn.signOut();
      }
      
      await _auth.signOut();
      await _trackAuthEvent('signout', {});
    } catch (e) {
      throw AuthException('Erreur lors de la déconnexion: $e');
    }
  }

  @override
  User? get currentUser => _auth.currentUser;

  @override
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Méthodes privées
  Future<void> _createUserProfile({
    required User user,
    required String firstName,
    required String lastName,
    required String userType,
  }) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .set({
      'uid': user.uid,
      'email': user.email,
      'firstName': firstName,
      'lastName': lastName,
      'displayName': '$firstName $lastName',
      'userType': userType,
      'profilePicture': user.photoURL,
      'createdAt': FieldValue.serverTimestamp(),
      'platform': PlatformDetector.currentPlatform.name,
      'kyc': {
        'status': 'pending',
        'level': 0,
      },
      'accountStatus': 'active',
    });
  }
  
  AuthException _handleAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return AuthException('Aucun utilisateur trouvé avec cet email');
      case 'wrong-password':
        return AuthException('Mot de passe incorrect');
      case 'email-already-in-use':
        return AuthException('Cet email est déjà utilisé');
      case 'weak-password':
        return AuthException('Le mot de passe est trop faible');
      case 'invalid-email':
        return AuthException('Email invalide');
      case 'user-disabled':
        return AuthException('Ce compte a été désactivé');
      case 'too-many-requests':
        return AuthException('Trop de tentatives. Réessayez plus tard');
      default:
        return AuthException('Erreur d\'authentification: ${e.message}');
    }
  }
  
  Future<void> _trackAuthEvent(String eventName, Map<String, dynamic> parameters) async {
    await FirebaseAnalytics.instance.logEvent(
      name: eventName,
      parameters: parameters,
    );
  }
}

// Exception personnalisée
class AuthException implements Exception {
  final String message;
  AuthException(this.message);
  
  @override
  String toString() => message;
}
```

### 2.2 Providers Riverpod adaptatifs

```dart
// features/auth/presentation/providers/auth_providers.dart
@riverpod
AuthService authService(AuthServiceRef ref) {
  return FirebaseAuthService();
}

@riverpod
Stream<User?> authState(AuthStateRef ref) {
  final authService = ref.watch(authServiceProvider);
  return authService.authStateChanges;
}

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  AsyncValue<User?> build() {
    final authStateStream = ref.watch(authStateProvider);
    return authStateStream.when(
      data: (user) => AsyncValue.data(user),
      error: (error, stack) => AsyncValue.error(error, stack),
      loading: () => const AsyncValue.loading(),
    );
  }

  Future<void> signInWithEmail({
    required String email,
    required String password,
    bool rememberMe = false,
  }) async {
    state = const AsyncValue.loading();
    
    try {
      final authService = ref.read(authServiceProvider);
      final credential = await authService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      // Gestion Remember Me adaptatif
      if (rememberMe) {
        await _saveCredentials(email, password);
      }
      
      state = AsyncValue.data(credential?.user);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
      rethrow;
    }
  }
  
  Future<void> signInWithGoogle() async {
    state = const AsyncValue.loading();
    
    try {
      final authService = ref.read(authServiceProvider);
      final credential = await authService.signInWithGoogle();
      state = AsyncValue.data(credential?.user);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
      rethrow;
    }
  }
  
  Future<void> signInWithApple() async {
    if (!PlatformDetector.isIOS) {
      throw UnsupportedError('Apple Sign-In uniquement sur iOS');
    }
    
    state = const AsyncValue.loading();
    
    try {
      final authService = ref.read(authServiceProvider);
      final credential = await authService.signInWithApple();
      state = AsyncValue.data(credential?.user);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
      rethrow;
    }
  }
  
  Future<void> signInWithBiometrics() async {
    if (!PlatformDetector.isMobile) {
      throw UnsupportedError('Biométrie uniquement sur mobile');
    }
    
    try {
      final authService = ref.read(authServiceProvider);
      final success = await authService.signInWithBiometrics();
      
      if (!success) {
        throw AuthException('Authentification biométrique échouée');
      }
      
      // L'utilisateur est déjà connecté, on met à jour juste le state
      state = AsyncValue.data(authService.currentUser);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
      rethrow;
    }
  }

  Future<void> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String userType,
  }) async {
    state = const AsyncValue.loading();
    
    try {
      final authService = ref.read(authServiceProvider);
      final credential = await authService.createUserWithEmailAndPassword(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
        userType: userType,
      );
      
      state = AsyncValue.data(credential?.user);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      final authService = ref.read(authServiceProvider);
      await authService.signOut();
      
      // Nettoyage credentials sauvées
      await _clearSavedCredentials();
      
      state = const AsyncValue.data(null);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
  
  // Gestion Remember Me adaptative
  Future<void> _saveCredentials(String email, String password) async {
    final storageService = ref.read(adaptiveStorageServiceProvider);
    await storageService.setString('saved_email', email);
    // Note: En production, utiliser un stockage sécurisé pour le mot de passe
  }
  
  Future<void> _clearSavedCredentials() async {
    final storageService = ref.read(adaptiveStorageServiceProvider);
    await storageService.remove('saved_email');
  }
}

// Provider pour les capacités d'authentification
@riverpod
Future<AuthCapabilities> authCapabilities(AuthCapabilitiesRef ref) async {
  final authService = ref.watch(authServiceProvider);
  
  return AuthCapabilities(
    supportsBiometrics: await authService.supportsBiometrics,
    supportsAppleSignIn: await authService.supportsAppleSignIn,
    supportsGoogleSignIn: true, // Disponible sur toutes plateformes
  );
}

class AuthCapabilities {
  final bool supportsBiometrics;
  final bool supportsAppleSignIn;
  final bool supportsGoogleSignIn;

  const AuthCapabilities({
    required this.supportsBiometrics,
    required this.supportsAppleSignIn,
    required this.supportsGoogleSignIn,
  });
}
```

## 3. Service Firestore Multi-Plateforme

### 3.1 Repository abstrait adaptatif

```dart
// core/services/firestore_repository.dart
abstract class FirestoreRepository<T> {
  final String collectionName;
  late final CollectionReference<Map<String, dynamic>> _collection;

  FirestoreRepository(this.collectionName) {
    _collection = FirebaseFirestore.instance.collection(collectionName);
    _configureForPlatform();
  }
  
  void _configureForPlatform() {
    if (PlatformDetector.isMobile) {
      // Configuration mobile - cache offline
      FirebaseFirestore.instance.settings = const Settings(
        persistenceEnabled: true,
        cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
      );
    } else if (PlatformDetector.isWeb) {
      // Configuration web - pas de persistence par défaut
      FirebaseFirestore.instance.settings = const Settings(
        persistenceEnabled: false,
      );
    }
  }

  // CRUD operations universelles
  Future<String> create(Map<String, dynamic> data) async {
    try {
      data['createdAt'] = FieldValue.serverTimestamp();
      data['updatedAt'] = FieldValue.serverTimestamp();
      data['platform'] = PlatformDetector.currentPlatform.name;
      
      final docRef = await _collection.add(data);
      return docRef.id;
    } catch (e) {
      throw FirestoreException('Erreur lors de la création: $e');
    }
  }

  Future<T?> getById(String id) async {
    try {
      final doc = await _collection.doc(id).get(
        // Source adaptative
        GetOptions(source: _getSourceForPlatform()),
      );
      
      if (!doc.exists) return null;
      return fromJson(doc.data()!..['id'] = doc.id);
    } catch (e) {
      throw FirestoreException('Erreur lors de la récupération: $e');
    }
  }

  Future<void> update(String id, Map<String, dynamic> data) async {
    try {
      data['updatedAt'] = FieldValue.serverTimestamp();
      await _collection.doc(id).update(data);
    } catch (e) {
      throw FirestoreException('Erreur lors de la mise à jour: $e');
    }
  }

  Future<void> delete(String id) async {
    try {
      await _collection.doc(id).delete();
    } catch (e) {
      throw FirestoreException('Erreur lors de la suppression: $e');
    }
  }

  // Requêtes avec support offline mobile
  Future<List<T>> query({
    List<QueryFilter>? filters,
    List<QueryOrderBy>? orderBy,
    int? limit,
    bool forceFromServer = false,
  }) async {
    try {
      Query<Map<String, dynamic>> firestoreQuery = _collection;
      
      // Application des filtres
      if (filters != null) {
        for (final filter in filters) {
          firestoreQuery = _applyFilter(firestoreQuery, filter);
        }
      }
      
      // Application de l'ordre
      if (orderBy != null) {
        for (final order in orderBy) {
          firestoreQuery = firestoreQuery.orderBy(
            order.field,
            descending: order.descending,
          );
        }
      }
      
      // Application de la limite
      if (limit != null) {
        firestoreQuery = firestoreQuery.limit(limit);
      }
      
      // Source adaptative
      final source = forceFromServer 
          ? Source.server 
          : _getSourceForPlatform();
      
      final querySnapshot = await firestoreQuery.get(
        GetOptions(source: source),
      );
      
      return querySnapshot.docs
          .map((doc) => fromJson(doc.data()..['id'] = doc.id))
          .toList();
    } catch (e) {
      throw FirestoreException('Erreur lors de la requête: $e');
    }
  }

  // Stream avec support offline
  Stream<List<T>> watchQuery({
    List<QueryFilter>? filters,
    List<QueryOrderBy>? orderBy,
    int? limit,
  }) {
    try {
      Query<Map<String, dynamic>> firestoreQuery = _collection;
      
      // Application des filtres et ordres
      if (filters != null) {
        for (final filter in filters) {
          firestoreQuery = _applyFilter(firestoreQuery, filter);
        }
      }
      
      if (orderBy != null) {
        for (final order in orderBy) {
          firestoreQuery = firestoreQuery.orderBy(
            order.field,
            descending: order.descending,
          );
        }
      }
      
      if (limit != null) {
        firestoreQuery = firestoreQuery.limit(limit);
      }
      
      return firestoreQuery.snapshots().map((querySnapshot) {
        return querySnapshot.docs
            .map((doc) => fromJson(doc.data()..['id'] = doc.id))
            .toList();
      });
    } catch (e) {
      throw FirestoreException('Erreur lors du stream: $e');
    }
  }

  // Pagination avec support offline
  Future<PaginatedResult<T>> getPaginated({
    List<QueryFilter>? filters,
    List<QueryOrderBy>? orderBy,
    int limit = 20,
    DocumentSnapshot? startAfterDocument,
  }) async {
    try {
      Query<Map<String, dynamic>> paginatedQuery = _collection;
      
      // Application des filtres et ordres
      if (filters != null) {
        for (final filter in filters) {
          paginatedQuery = _applyFilter(paginatedQuery, filter);
        }
      }
      
      if (orderBy != null) {
        for (final order in orderBy) {
          paginatedQuery = paginatedQuery.orderBy(
            order.field,
            descending: order.descending,
          );
        }
      }

      if (startAfterDocument != null) {
        paginatedQuery = paginatedQuery.startAfterDocument(startAfterDocument);
      }
      
      paginatedQuery = paginatedQuery.limit(limit);

      final querySnapshot = await paginatedQuery.get(
        GetOptions(source: _getSourceForPlatform()),
      );
      
      final items = querySnapshot.docs
          .map((doc) => fromJson(doc.data()..['id'] = doc.id))
          .toList();
      
      final lastDoc = querySnapshot.docs.isNotEmpty 
          ? querySnapshot.docs.last 
          : null;
      
      return PaginatedResult<T>(
        items: items,
        lastDocument: lastDoc,
        hasMore: items.length == limit,
      );
    } catch (e) {
      throw FirestoreException('Erreur lors de la pagination: $e');
    }
  }

  // Méthodes utilitaires
  Source _getSourceForPlatform() {
    if (PlatformDetector.isMobile) {
      // Mobile - cache d'abord, puis serveur
      return Source.cache;
    } else {
      // Web - serveur par défaut
      return Source.serverAndCache;
    }
  }
  
  Query<Map<String, dynamic>> _applyFilter(
    Query<Map<String, dynamic>> query,
    QueryFilter filter,
  ) {
    if (filter.isEqualTo != null) {
      return query.where(filter.field, isEqualTo: filter.isEqualTo);
    }
    if (filter.isNotEqualTo != null) {
      return query.where(filter.field, isNotEqualTo: filter.isNotEqualTo);
    }
    if (filter.isLessThan != null) {
      return query.where(filter.field, isLessThan: filter.isLessThan);
    }
    if (filter.isGreaterThan != null) {
      return query.where(filter.field, isGreaterThan: filter.isGreaterThan);
    }
    if (filter.arrayContains != null) {
      return query.where(filter.field, arrayContains: filter.arrayContains);
    }
    if (filter.whereIn != null) {
      return query.where(filter.field, whereIn: filter.whereIn);
    }
    return query;
  }

  // Méthode abstraite à implémenter
  T fromJson(Map<String, dynamic> json);
}

// Classes utilitaires
class PaginatedResult<T> {
  final List<T> items;
  final DocumentSnapshot? lastDocument;
  final bool hasMore;

  PaginatedResult({
    required this.items,
    this.lastDocument,
    required this.hasMore,
  });
}

class QueryFilter {
  final String field;
  final dynamic isEqualTo;
  final dynamic isNotEqualTo;
  final dynamic isLessThan;
  final dynamic isGreaterThan;
  final dynamic arrayContains;
  final List<dynamic>? whereIn;

  QueryFilter({
    required this.field,
    this.isEqualTo,
    this.isNotEqualTo,
    this.isLessThan,
    this.isGreaterThan,
    this.arrayContains,
    this.whereIn,
  });
}

class QueryOrderBy {
  final String field;
  final bool descending;

  QueryOrderBy(this.field, {this.descending = false});
}

class FirestoreException implements Exception {
  final String message;
  FirestoreException(this.message);
  
  @override
  String toString() => message;
}
```

## 4. Service de Storage Multi-Plateforme

### 4.1 Storage adaptatif

```dart
// core/services/adaptive_storage_service.dart
class AdaptiveStorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // Upload adaptatif par plateforme
  Future<String> uploadFile({
    required String path,
    required String fileName,
    required Uint8List fileBytes,
    String? contentType,
    Map<String, String>? metadata,
    Function(double)? onProgress,
  }) async {
    try {
      final ref = _storage.ref().child(path).child(fileName);
      
      // Métadonnées adaptatives
      final uploadMetadata = SettableMetadata(
        contentType: contentType,
        customMetadata: {
          'platform': PlatformDetector.currentPlatform.name,
          'uploadedAt': DateTime.now().toIso8601String(),
          ...?metadata,
        },
      );
      
      final uploadTask = ref.putData(fileBytes, uploadMetadata);
      
      // Suivi du progrès si demandé
      if (onProgress != null) {
        uploadTask.snapshotEvents.listen((snapshot) {
          final progress = snapshot.bytesTransferred / snapshot.totalBytes;
          onProgress(progress);
        });
      }
      
      final taskSnapshot = await uploadTask;
      return await taskSnapshot.ref.getDownloadURL();
    } catch (e) {
      throw StorageException('Erreur lors de l\'upload: $e');
    }
  }
  
  // Upload mobile depuis file picker
  Future<String> uploadFileFromPicker({
    required String path,
    required String fileName,
    Function(double)? onProgress,
  }) async {
    if (!PlatformDetector.isMobile) {
      throw UnsupportedError('File picker uniquement sur mobile');
    }
    
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false,
      );
      
      if (result != null && result.files.single.bytes != null) {
        return await uploadFile(
          path: path,
          fileName: fileName,
          fileBytes: result.files.single.bytes!,
          contentType: _getContentType(result.files.single.extension),
          onProgress: onProgress,
        );
      } else {
        throw StorageException('Aucun fichier sélectionné');
      }
    } catch (e) {
      throw StorageException('Erreur lors de la sélection: $e');
    }
  }
  
  // Upload web depuis input file
  Future<String> uploadFileFromWeb({
    required String path,
    required String fileName,
    required html.File file,
    Function(double)? onProgress,
  }) async {
    if (!PlatformDetector.isWeb) {
      throw UnsupportedError('Web file upload uniquement sur web');
    }
    
    try {
      final bytes = await _readFileBytes(file);
      return await uploadFile(
        path: path,
        fileName: fileName,
        fileBytes: bytes,
        contentType: file.type,
        onProgress: onProgress,
      );
    } catch (e) {
      throw StorageException('Erreur lors de l\'upload web: $e');
    }
  }
  
  // Upload d'images de projet
  Future<List<String>> uploadProjectImages({
    required String projectId,
    required List<ProjectImageUpload> images,
    Function(int, double)? onProgress,
  }) async {
    final uploadTasks = <Future<String>>[];
    
    for (int i = 0; i < images.length; i++) {
      final image = images[i];
      final fileName = image.isCover 
          ? 'cover_${DateTime.now().millisecondsSinceEpoch}.jpg'
          : 'image_${i}_${DateTime.now().millisecondsSinceEpoch}.jpg';
      
      uploadTasks.add(
        uploadFile(
          path: 'projects/$projectId/images',
          fileBytes: image.bytes,
          fileName: fileName,
          contentType: 'image/jpeg',
          metadata: {
            'projectId': projectId,
            'type': image.isCover ? 'cover' : 'additional',
            'order': i.toString(),
          },
          onProgress: onProgress != null 
              ? (progress) => onProgress(i, progress)
              : null,
        ),
      );
    }
    
    return await Future.wait(uploadTasks);
  }

  // Upload de documents KYC
  Future<String> uploadKYCDocument({
    required String userId,
    required Uint8List documentBytes,
    required String documentType,
    required String fileName,
  }) async {
    return await uploadFile(
      path: 'users/$userId/kyc',
      fileBytes: documentBytes,
      fileName: fileName,
      contentType: 'application/pdf',
      metadata: {
        'userId': userId,
        'type': 'kyc_document',
        'documentType': documentType,
      },
    );
  }

  // Upload de preuves de milestone
  Future<List<String>> uploadMilestoneEvidence({
    required String projectId,
    required String milestoneId,
    required List<Uint8List> evidenceFiles,
    required List<String> fileNames,
  }) async {
    final uploadTasks = <Future<String>>[];
    
    for (int i = 0; i < evidenceFiles.length; i++) {
      uploadTasks.add(
        uploadFile(
          path: 'milestones/$milestoneId/evidence',
          fileBytes: evidenceFiles[i],
          fileName: fileNames[i],
          metadata: {
            'projectId': projectId,
            'milestoneId': milestoneId,
            'type': 'milestone_evidence',
          },
        ),
      );
    }
    
    return await Future.wait(uploadTasks);
  }

  // Suppression d'un fichier
  Future<void> deleteFile(String downloadUrl) async {
    try {
      final ref = _storage.refFromURL(downloadUrl);
      await ref.delete();
    } catch (e) {
      throw StorageException('Erreur lors de la suppression: $e');
    }
  }

  // Obtenir les métadonnées d'un fichier
  Future<FullMetadata> getFileMetadata(String downloadUrl) async {
    try {
      final ref = _storage.refFromURL(downloadUrl);
      return await ref.getMetadata();
    } catch (e) {
      throw StorageException('Erreur lors de la récupération des métadonnées: $e');
    }
  }

  // Surveillance du progrès d'upload avec stream
  Stream<TaskSnapshot> uploadWithProgress({
    required String path,
    required String fileName,
    required Uint8List fileBytes,
    String? contentType,
  }) {
    final ref = _storage.ref().child(path).child(fileName);
    final uploadTask = ref.putData(
      fileBytes,
      SettableMetadata(contentType: contentType),
    );
    
    return uploadTask.snapshotEvents;
  }
  
  // Méthodes utilitaires
  String _getContentType(String? extension) {
    switch (extension?.toLowerCase()) {
      case 'jpg':
      case 'jpeg':
        return 'image/jpeg';
      case 'png':
        return 'image/png';
      case 'pdf':
        return 'application/pdf';
      case 'doc':
        return 'application/msword';
      case 'docx':
        return 'application/vnd.openxmlformats-officedocument.wordprocessingml.document';
      default:
        return 'application/octet-stream';
    }
  }
  
  Future<Uint8List> _readFileBytes(html.File file) async {
    final completer = Completer<Uint8List>();
    final reader = html.FileReader();
    
    reader.onLoadEnd.listen((_) {
      completer.complete(reader.result as Uint8List);
    });
    
    reader.onError.listen((error) {
      completer.completeError(error);
    });
    
    reader.readAsArrayBuffer(file);
    return completer.future;
  }
}

// Classes utilitaires
class ProjectImageUpload {
  final Uint8List bytes;
  final String fileName;
  final bool isCover;

  ProjectImageUpload({
    required this.bytes,
    required this.fileName,
    this.isCover = false,
  });
}

class StorageException implements Exception {
  final String message;
  StorageException(this.message);
  
  @override
  String toString() => message;
}
```

Cette architecture Firebase multi-plateforme assure une intégration native et optimisée sur mobile (Android/iOS) et web, avec des adaptations spécifiques aux capacités de chaque environnement.