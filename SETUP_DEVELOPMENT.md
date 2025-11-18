# 🚀 GUIDE DE CONFIGURATION DÉVELOPPEMENT
## Social Finance Impact Platform - Configuration Complète

**Version:** 1.0.0
**Date:** 18 Novembre 2025
**Auteur:** Claude Code Assistant

---

## 📋 TABLE DES MATIÈRES

1. [Prérequis Système](#1-prérequis-système)
2. [Installation de l'Environnement](#2-installation-de-lenvironnement)
3. [Configuration Firebase](#3-configuration-firebase)
4. [Configuration Stripe](#4-configuration-stripe)
5. [Configuration Sumsub KYC](#5-configuration-sumsub-kyc)
6. [Installation des Dépendances](#6-installation-des-dépendances)
7. [Configuration des Variables d'Environnement](#7-configuration-des-variables-denvironnement)
8. [Cloud Functions Setup](#8-cloud-functions-setup)
9. [Création des Utilisateurs Fictifs de Test](#9-création-des-utilisateurs-fictifs-de-test)
10. [Tests de l'Application](#10-tests-de-lapplication)
11. [Résolution des Problèmes](#11-résolution-des-problèmes)

---

## 1. PRÉREQUIS SYSTÈME

### 1.1 Logiciels Requis

| Logiciel | Version Minimale | Commande de Vérification |
|----------|------------------|--------------------------|
| Flutter | 3.13.0 | `flutter --version` |
| Dart | 3.1.0 | `dart --version` |
| Node.js | 18.0.0 | `node --version` |
| npm | 9.0.0 | `npm --version` |
| Firebase CLI | 12.0.0 | `firebase --version` |
| Git | 2.30.0 | `git --version` |
| Android Studio | 2023+ | (Pour émulateur Android) |
| Xcode | 14+ | (Pour émulateur iOS - Mac only) |

### 1.2 Installation des Outils

**Flutter:**
```bash
# macOS/Linux
curl -fsSL https://flutter.dev/install.sh | bash

# Vérification
flutter doctor
```

**Firebase CLI:**
```bash
npm install -g firebase-tools

# Login Firebase
firebase login
```

**Android Studio:**
- Télécharger depuis: https://developer.android.com/studio
- Installer Android SDK (API Level 28+)
- Configurer un émulateur Android

**Xcode (macOS uniquement):**
```bash
# Installer depuis App Store
xcode-select --install
```

---

## 2. INSTALLATION DE L'ENVIRONNEMENT

### 2.1 Cloner le Projet

```bash
cd ~/Projects
git clone <votre-repo-url> social-impact-frontend
cd social-impact-frontend
```

### 2.2 Vérifier la Structure

```bash
ls -la
# Vous devriez voir:
# - lib/
# - android/
# - ios/
# - web/
# - functions/
# - pubspec.yaml
# - firebase.json
# - firestore.rules
```

---

## 3. CONFIGURATION FIREBASE

### 3.1 Créer un Projet Firebase

1. **Aller sur Firebase Console:** https://console.firebase.google.com/
2. **Créer un nouveau projet:**
   - Nom: `Social Impact MVP` (ou votre nom)
   - Activer Google Analytics: **OUI**
   - Région: **Europe (ou votre région)**

3. **Activer les services Firebase:**

**a) Authentication:**
```
Console > Build > Authentication > Get Started
```
- Activer **Email/Password**
- Activer **Google Sign-In**
- Activer **Apple Sign-In** (iOS uniquement)

**Configurer Google Sign-In:**
- Support email: votre email
- Ajouter domaine autorisé: `localhost`, `socialimpact.app`

**b) Firestore Database:**
```
Console > Build > Firestore Database > Create Database
```
- Mode: **Production** (on utilisera les rules déjà créées)
- Région: **europe-west1** (ou votre région)

**c) Storage:**
```
Console > Build > Storage > Get Started
```
- Mode: **Production**
- Règles de sécurité: Nous les mettrons à jour plus tard

**d) Cloud Functions:**
```
Console > Build > Functions
```
- Activer Cloud Functions
- Plan Blaze (Pay as you go) **REQUIS** pour fonctions HTTP

**e) Cloud Messaging:**
```
Console > Build > Cloud Messaging
```
- Activer Cloud Messaging (pour push notifications)

### 3.2 Configuration des Apps

**a) Application Android:**

1. Dans Firebase Console: **Ajouter une application > Android**
2. Package Android: `com.socialimpact.mvp` (vérifier dans `android/app/build.gradle`)
3. Télécharger `google-services.json`
4. Placer dans: `android/app/google-services.json`

```bash
# Vérifier l'emplacement
ls -la android/app/google-services.json
```

**b) Application iOS:**

1. Dans Firebase Console: **Ajouter une application > iOS**
2. Bundle ID iOS: `com.socialimpact.mvp` (vérifier dans `ios/Runner.xcodeproj`)
3. Télécharger `GoogleService-Info.plist`
4. Placer dans: `ios/Runner/GoogleService-Info.plist`

**Avec Xcode:**
```bash
open ios/Runner.xcworkspace
# Drag & drop GoogleService-Info.plist dans Runner folder
```

**c) Application Web:**

1. Dans Firebase Console: **Ajouter une application > Web**
2. Nom de l'app: `Social Impact Web`
3. Activer **Firebase Hosting**: OUI
4. Copier la configuration Firebase Config Object
5. Mettre à jour `web/index.html` avec les valeurs:

```html
<!-- Dans web/index.html, chercher firebaseConfig et remplacer -->
<script>
  const firebaseConfig = {
    apiKey: "VOTRE_API_KEY",
    authDomain: "VOTRE_AUTH_DOMAIN",
    projectId: "social-impact-mvp",
    storageBucket: "VOTRE_STORAGE_BUCKET",
    messagingSenderId: "VOTRE_SENDER_ID",
    appId: "VOTRE_APP_ID",
    measurementId: "VOTRE_MEASUREMENT_ID"
  };
</script>
```

### 3.3 Déployer les Firestore Rules

```bash
# À la racine du projet
firebase deploy --only firestore:rules

# Vérifier dans Console > Firestore > Rules
```

### 3.4 Créer les Index Firestore

```bash
# Déployer les index
firebase deploy --only firestore:indexes

# OU créer manuellement dans Console
```

**Index requis (à créer manuellement si nécessaire):**

**Collection `projects`:**
- Fields: `status` (Ascending), `createdAt` (Descending)
- Fields: `category` (Ascending), `createdAt` (Descending)
- Fields: `creatorId` (Ascending), `createdAt` (Descending)

**Collection `contributions`:**
- Fields: `contributorId` (Ascending), `createdAt` (Descending)
- Fields: `projectId` (Ascending), `createdAt` (Descending)

**Collection `audits`:**
- Fields: `auditorId` (Ascending), `createdAt` (Descending)
- Fields: `status` (Ascending), `createdAt` (Descending)

### 3.5 Configurer Storage Rules

Dans Firebase Console > Storage > Rules:

```
rules_version = '2';
service firebase.storage {
  match /b/{bucket}/o {
    // Users can upload their profile pictures
    match /users/{userId}/profile/{fileName} {
      allow read: if true;
      allow write: if request.auth != null && request.auth.uid == userId;
    }

    // Project images
    match /projects/{projectId}/{fileName} {
      allow read: if true;
      allow write: if request.auth != null;
    }

    // Milestone evidence
    match /milestones/{milestoneId}/evidence/{fileName} {
      allow read: if request.auth != null;
      allow write: if request.auth != null;
    }

    // KYC documents
    match /kyc/{userId}/{fileName} {
      allow read: if request.auth != null && request.auth.uid == userId;
      allow write: if request.auth != null && request.auth.uid == userId;
    }
  }
}
```

Puis déployer:
```bash
firebase deploy --only storage
```

---

## 4. CONFIGURATION STRIPE

### 4.1 Créer un Compte Stripe

1. **S'inscrire:** https://dashboard.stripe.com/register
2. **Activer le mode Test** (toggle en haut à droite)
3. **Ne PAS activer le compte réel** pour le développement

### 4.2 Obtenir les Clés API

**Dans Stripe Dashboard > Developers > API Keys:**

```
Mode TEST:
Publishable key: pk_test_...
Secret key: sk_test_...
```

**Copier ces clés** - nous les utiliserons dans le `.env`

### 4.3 Configurer les Webhooks (Pour Cloud Functions)

**Plus tard, après déploiement des Cloud Functions:**

1. Stripe Dashboard > Developers > Webhooks
2. Add endpoint
3. URL: `https://us-central1-social-impact-mvp.cloudfunctions.net/stripeWebhook`
4. Events à écouter:
   - `payment_intent.succeeded`
   - `payment_intent.payment_failed`
   - `charge.refunded`

5. Copier le **Webhook signing secret** (`whsec_...`)

### 4.4 Cartes de Test

**Pour tester les paiements:**

| Scénario | Numéro de Carte | Expiration | CVC |
|----------|----------------|------------|-----|
| Succès | 4242 4242 4242 4242 | n'importe | n'importe |
| Échec | 4000 0000 0000 0002 | n'importe | n'importe |
| 3D Secure requis | 4000 0027 6000 3184 | n'importe | n'importe |

---

## 5. CONFIGURATION SUMSUB KYC

### 5.1 Créer un Compte Sumsub

1. **S'inscrire:** https://cockpit.sumsub.com/
2. **Mode Sandbox** pour développement
3. **Créer un niveau KYC:**
   - Level 1: Basic KYC (Contributors) - ID verification
   - Level 2: Advanced KYC (Project Creators) - ID + Address proof

### 5.2 Obtenir les Clés API

**Dans Sumsub Dashboard > Settings > API:**

```
App Token: sbx:...
Secret Key: ...
```

### 5.3 Configurer les Flow Names

**Créer 2 flows:**
- `basic-kyc-level` (pour contributors)
- `advanced-kyc-level` (pour project creators)

---

## 6. INSTALLATION DES DÉPENDANCES

### 6.1 Dépendances Flutter

```bash
cd /path/to/social-impact-frontend

# Nettoyer les anciennes dépendances
flutter clean

# Installer les packages
flutter pub get

# Générer le code (freezed, riverpod, json_serializable)
flutter pub run build_runner build --delete-conflicting-outputs
```

**Si erreurs de compilation:**
```bash
# Nettoyer complètement
rm -rf .dart_tool
rm pubspec.lock
flutter clean
flutter pub get
flutter pub run build_runner clean
flutter pub run build_runner build --delete-conflicting-outputs
```

### 6.2 Dépendances Cloud Functions

```bash
cd functions

# Installer les packages Node.js
npm install

# Compiler TypeScript
npm run build
```

### 6.3 Vérification de l'Installation

```bash
# Retour à la racine
cd ..

# Flutter Doctor (doit être tout vert)
flutter doctor -v

# Vérifier les devices disponibles
flutter devices

# Tester compilation Android
flutter build apk --debug

# Tester compilation iOS (macOS only)
flutter build ios --debug --no-codesign

# Tester compilation Web
flutter build web --release
```

---

## 7. CONFIGURATION DES VARIABLES D'ENVIRONNEMENT

### 7.1 Créer le Fichier .env

```bash
# À la racine du projet
cp .env.example .env
```

### 7.2 Remplir les Variables

**Éditer `.env` avec vos vraies valeurs:**

```env
# ======================================
# STRIPE CONFIGURATION
# ======================================
STRIPE_PUBLISHABLE_KEY_TEST=pk_test_VOTRE_CLE_ICI
STRIPE_SECRET_KEY_TEST=sk_test_VOTRE_CLE_ICI
STRIPE_PUBLISHABLE_KEY_LIVE=pk_live_LAISSEZ_VIDE_POUR_DEVELOPPEMENT
STRIPE_SECRET_KEY_LIVE=sk_live_LAISSEZ_VIDE_POUR_DEVELOPPEMENT
STRIPE_WEBHOOK_SECRET=whsec_VOTRE_SECRET_ICI

# ======================================
# SUMSUB KYC CONFIGURATION
# ======================================
SUMSUB_APP_TOKEN=sbx:VOTRE_TOKEN_ICI
SUMSUB_SECRET_KEY=VOTRE_SECRET_ICI
SUMSUB_LEVEL_NAME_CONTRIBUTOR=basic-kyc-level
SUMSUB_LEVEL_NAME_CREATOR=advanced-kyc-level

# ======================================
# FIREBASE CONFIGURATION
# ======================================
FIREBASE_PROJECT_ID=social-impact-mvp
FIREBASE_WEB_API_KEY=VOTRE_API_KEY_ICI
FIREBASE_MESSAGING_SERVER_KEY=VOTRE_SERVER_KEY_ICI

# ======================================
# APP CONFIGURATION
# ======================================
ENVIRONMENT=development
API_BASE_URL=http://localhost:5001/social-impact-mvp/us-central1
APP_URL_ANDROID=http://localhost
APP_URL_IOS=http://localhost
APP_URL_WEB=http://localhost:5000

# ======================================
# FEATURE FLAGS
# ======================================
ENABLE_ANALYTICS=true
ENABLE_CRASHLYTICS=false
ENABLE_BIOMETRIC_AUTH=true
ENABLE_APPLE_PAY=false
ENABLE_GOOGLE_PAY=false

# ======================================
# TESTING
# ======================================
USE_TEST_MODE=true
```

### 7.3 Configuration Firebase dans le Code

**Pour l'app Flutter, créer:** `lib/core/config/env_config.dart`

```dart
import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  static String get stripePublishableKey =>
      dotenv.env['STRIPE_PUBLISHABLE_KEY_TEST'] ?? '';

  static String get sumsubAppToken =>
      dotenv.env['SUMSUB_APP_TOKEN'] ?? '';

  static bool get isTestMode =>
      dotenv.env['USE_TEST_MODE'] == 'true';

  static String get apiBaseUrl =>
      dotenv.env['API_BASE_URL'] ?? '';
}
```

---

## 8. CLOUD FUNCTIONS SETUP

### 8.1 Initialiser Firebase dans le Projet

```bash
# À la racine du projet
firebase init

# Sélectionner:
# - Functions (déjà fait normalement)
# - Firestore (déjà fait)
# - Hosting (pour web)
# - Storage

# Language: TypeScript
# ESLint: Yes
# Install dependencies: Yes
```

### 8.2 Configurer les Variables d'Environnement Cloud Functions

```bash
cd functions

# Créer .env local
cp ../.env .env

# Pour le déploiement, utiliser Firebase Config:
firebase functions:config:set \
  stripe.secret_key_test="sk_test_VOTRE_CLE" \
  stripe.webhook_secret="whsec_VOTRE_SECRET" \
  sumsub.app_token="sbx:VOTRE_TOKEN" \
  sumsub.secret_key="VOTRE_SECRET"
```

### 8.3 Compiler et Tester Localement

```bash
# Dans functions/
npm run build

# Démarrer émulateurs Firebase
cd ..
firebase emulators:start

# Les émulateurs démarrent sur:
# - Firestore: http://localhost:8080
# - Functions: http://localhost:5001
# - Auth: http://localhost:9099
# - UI: http://localhost:4000
```

**Configurer l'app pour utiliser les émulateurs:**

Dans `lib/main.dart`, ajouter après `initializeFirebase()`:

```dart
if (kDebugMode) {
  // Use Firebase Emulators
  FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
  FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  FirebaseFunctions.instance.useFunctionsEmulator('localhost', 5001);
}
```

### 8.4 Déployer Cloud Functions (Production)

```bash
# Build
cd functions
npm run build

# Deploy toutes les functions
firebase deploy --only functions

# OU déployer une seule function
firebase deploy --only functions:stripeCreatePaymentIntent
```

---

## 9. CRÉATION DES UTILISATEURS FICTIFS DE TEST

### 9.1 Script de Création des Utilisateurs

**Créer:** `scripts/create_test_users.dart`

```dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> createTestUsers() async {
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  // Test users
  final users = [
    {
      'email': 'investor@test.com',
      'password': 'Test123456!',
      'role': 'investor',
      'firstName': 'Jean',
      'lastName': 'Dupont',
    },
    {
      'email': 'creator@test.com',
      'password': 'Test123456!',
      'role': 'organization',
      'firstName': 'Marie',
      'lastName': 'Martin',
    },
    {
      'email': 'auditor@test.com',
      'password': 'Test123456!',
      'role': 'auditor',
      'firstName': 'Pierre',
      'lastName': 'Durand',
    },
    {
      'email': 'admin@test.com',
      'password': 'Test123456!',
      'role': 'admin',
      'firstName': 'Admin',
      'lastName': 'System',
    },
  ];

  for (final userData in users) {
    try {
      // Create auth user
      final userCredential = await auth.createUserWithEmailAndPassword(
        email: userData['email'] as String,
        password: userData['password'] as String,
      );

      // Create Firestore profile
      await firestore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': userData['email'],
        'firstName': userData['firstName'],
        'lastName': userData['lastName'],
        'displayName': '${userData['firstName']} ${userData['lastName']}',
        'role': userData['role'],
        'accountStatus': 'active',
        'kyc': {
          'status': 'approved',
          'level': 2,
        },
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      });

      print('✅ Created: ${userData['email']} (${userData['role']})');
    } catch (e) {
      print('❌ Error creating ${userData['email']}: $e');
    }
  }
}
```

### 9.2 Exécuter le Script

**Option 1: Via l'app Flutter**

Dans `lib/main.dart`, ajouter temporairement:

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeFirebase();

  // DEVELOPMENT ONLY: Create test users
  if (kDebugMode) {
    try {
      // await createTestUsers(); // Décommenter pour créer users
    } catch (e) {
      print('Error creating test users: $e');
    }
  }

  runApp(const ProviderScope(child: SocialFinanceApp()));
}
```

Puis lancer l'app une fois:
```bash
flutter run
```

**Option 2: Manuellement dans Firebase Console**

1. Firebase Console > Authentication > Users > Add User
2. Créer les 4 utilisateurs avec emails/passwords ci-dessus
3. Pour chaque user, aller dans Firestore et créer document `users/{uid}` avec les données

### 9.3 Créer des Données de Test

**Script pour créer projets de test:**

```dart
Future<void> createTestProjects() async {
  final firestore = FirebaseFirestore.instance;

  // Get creator user ID
  final creatorEmail = 'creator@test.com';
  final creatorSnapshot = await firestore
      .collection('users')
      .where('email', isEqualTo: creatorEmail)
      .get();

  if (creatorSnapshot.docs.isEmpty) {
    print('❌ Creator user not found');
    return;
  }

  final creatorId = creatorSnapshot.docs.first.id;

  final projects = [
    {
      'name': 'École Rurale Sénégal',
      'description': 'Construction d\'une école pour 200 enfants',
      'category': 'education',
      'fundingGoal': 50000.0,
      'currentFunding': 15000.0,
      'status': 'fundingActive',
      'location': 'Dakar, Sénégal',
    },
    {
      'name': 'Puits Villageois Mali',
      'description': 'Accès à l\'eau potable pour 500 personnes',
      'category': 'waterSanitation',
      'fundingGoal': 30000.0,
      'currentFunding': 30000.0,
      'status': 'implementation',
      'location': 'Bamako, Mali',
    },
  ];

  for (final projectData in projects) {
    await firestore.collection('projects').add({
      ...projectData,
      'creatorId': creatorId,
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
    });

    print('✅ Created project: ${projectData['name']}');
  }
}
```

---

## 10. TESTS DE L'APPLICATION

### 10.1 Lancer l'App en Mode Dev

**Android:**
```bash
# Démarrer émulateur Android
~/Library/Android/sdk/emulator/emulator -avd Pixel_5_API_33

# Lancer l'app
flutter run
```

**iOS (macOS only):**
```bash
# Lister simulateurs iOS
xcrun simctl list devices

# Démarrer un simulateur
open -a Simulator

# Lancer l'app
flutter run
```

**Web:**
```bash
flutter run -d chrome

# OU en mode release pour performances
flutter run -d chrome --release
```

### 10.2 Tester les Fonctionnalités

**1. Authentification**
- [ ] Créer compte avec email/password
- [ ] Login avec compte créé
- [ ] Google Sign-In
- [ ] Reset password
- [ ] Email verification

**2. Navigation**
- [ ] Navigation adaptative (bottom/rail/drawer selon taille écran)
- [ ] Toutes les routes accessibles
- [ ] Role-based access fonctionne

**3. Projects**
- [ ] Browse projects
- [ ] Filtres et recherche
- [ ] Favorites
- [ ] Share project
- [ ] Pagination

**4. Contributions (À tester après déploiement Stripe)**
- [ ] Sélectionner montant
- [ ] Entrer carte test Stripe
- [ ] Confirmer paiement
- [ ] Voir receipt

**5. Responsive**
- [ ] Mobile layout correct
- [ ] Tablet layout correct
- [ ] Desktop layout correct
- [ ] Rotation écran (mobile/tablet)

### 10.3 Tests Automatisés

```bash
# Unit tests
flutter test

# Widget tests
flutter test test/widgets/

# Integration tests
flutter test integration_test/

# Coverage report
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

---

## 11. RÉSOLUTION DES PROBLÈMES

### 11.1 Problèmes Courants

**❌ Erreur: "firebase_storage not found"**
```bash
flutter clean
flutter pub get
```

**❌ Erreur: "MissingPluginException"**
```bash
flutter clean
cd ios && pod install && cd ..
flutter run
```

**❌ Erreur: "Google Services missing"**
- Vérifier que `google-services.json` est dans `android/app/`
- Vérifier que `GoogleService-Info.plist` est dans `ios/Runner/`

**❌ Erreur Build Android: "Execution failed for task ':app:processDebugGoogleServices'"**
```bash
cd android
./gradlew clean
cd ..
flutter clean
flutter run
```

**❌ Stripe ne fonctionne pas**
- Vérifier que `.env` contient les bonnes clés
- Vérifier que `flutter_dotenv` est chargé dans `main.dart`:
```dart
await dotenv.load(fileName: ".env");
```

**❌ Cloud Functions timeout**
- Vérifier que Firebase est en plan Blaze (payant)
- Augmenter timeout dans functions:
```typescript
export const myFunction = functions
  .runWith({ timeoutSeconds: 300 })
  .https.onRequest(...)
```

### 11.2 Logs et Debugging

**Logs Firebase:**
```bash
# Functions logs
firebase functions:log

# Firestore logs
# Dans Console > Firestore > Usage
```

**Logs Flutter:**
```bash
# Verbose logs
flutter run -v

# Logs Stripe
# Activer dans Stripe Dashboard > Developers > Logs
```

**Debugging:**
```bash
# Flutter DevTools
flutter pub global activate devtools
flutter pub global run devtools

# Puis dans VS Code:
# Cmd+Shift+P > "Dart: Open DevTools"
```

### 11.3 Support

**Documentation:**
- Flutter: https://docs.flutter.dev/
- Firebase: https://firebase.google.com/docs
- Stripe: https://stripe.com/docs
- Sumsub: https://developers.sumsub.com/

**Issues GitHub:**
- Créer une issue dans le repository avec:
  - Logs complets
  - Étapes pour reproduire
  - Version Flutter/packages

---

## ✅ CHECKLIST FINALE

Avant de considérer l'environnement prêt:

- [ ] Flutter Doctor: Tout vert
- [ ] Firebase configuré (Auth, Firestore, Storage, Functions)
- [ ] Stripe configuré (clés test)
- [ ] Sumsub configuré (compte sandbox)
- [ ] `.env` rempli avec toutes les variables
- [ ] `flutter pub get` sans erreurs
- [ ] `build_runner` généré tout le code
- [ ] Cloud Functions compilent (`npm run build`)
- [ ] Émulateurs Firebase démarrent
- [ ] App compile sur Android
- [ ] App compile sur iOS (si macOS)
- [ ] App compile sur Web
- [ ] Utilisateurs de test créés
- [ ] Projets de test créés
- [ ] Login fonctionne
- [ ] Navigation fonctionne
- [ ] Firestore rules déployées

---

**🎉 FÉLICITATIONS !**

Votre environnement de développement est maintenant configuré.

**Prochaines étapes:**
1. Implémenter les fonctionnalités manquantes (voir TODO.md)
2. Tester toutes les fonctionnalités
3. Atteindre >80% test coverage
4. Préparer déploiement production (voir SETUP_PRODUCTION.md)

**Support:** Pour toute question, consulter le README.md ou créer une issue GitHub.
