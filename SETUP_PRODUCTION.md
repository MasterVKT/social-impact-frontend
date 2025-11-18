# 🚀 GUIDE DE DÉPLOIEMENT PRODUCTION
## Social Finance Impact Platform - Mise en Production Complète

**Version:** 1.0.0
**Date:** 18 Novembre 2025
**⚠️ IMPORTANT:** Ne déployez en production qu'après avoir testé exhaustivement en développement

---

## 📋 TABLE DES MATIÈRES

1. [Prérequis Production](#1-prérequis-production)
2. [Configuration Firebase Production](#2-configuration-firebase-production)
3. [Configuration Stripe Production](#3-configuration-stripe-production)
4. [Build & Optimisation](#4-build--optimisation)
5. [Déploiement Android (Google Play)](#5-déploiement-android-google-play)
6. [Déploiement iOS (App Store)](#6-déploiement-ios-app-store)
7. [Déploiement Web (Firebase Hosting)](#7-déploiement-web-firebase-hosting)
8. [Cloud Functions Production](#8-cloud-functions-production)
9. [Monitoring & Analytics](#9-monitoring--analytics)
10. [Maintenance & Updates](#10-maintenance--updates)

---

## 1. PRÉREQUIS PRODUCTION

### 1.1 Checklist Avant Déploiement

**Tests:**
- [ ] ✅ Couverture tests >80%
- [ ] ✅ Tous les tests unitaires passent
- [ ] ✅ Tous les tests d'intégration passent
- [ ] ✅ Tests E2E sur Android/iOS/Web passent
- [ ] ✅ Tests manuels sur devices réels

**Sécurité:**
- [ ] ✅ Firestore Rules validées et testées
- [ ] ✅ Storage Rules validées
- [ ] ✅ Aucune clé API hardcodée dans le code
- [ ] ✅ `.env` configuré pour production
- [ ] ✅ HTTPS forcé partout
- [ ] ✅ Rate limiting configuré (Cloud Functions)

**Performance:**
- [ ] ✅ Lighthouse score web >90
- [ ] ✅ Temps de démarrage app <3s
- [ ] ✅ Images optimisées
- [ ] ✅ Code minifié/obfusqué

**Legal & Compliance:**
- [ ] ✅ Privacy Policy rédigée
- [ ] ✅ Terms of Service rédigés
- [ ] ✅ RGPD compliant
- [ ] ✅ Cookies consent (web)

### 1.2 Comptes Requis

| Service | URL | Statut |
|---------|-----|--------|
| Firebase | console.firebase.google.com | Plan Blaze activé |
| Google Play Console | play.google.com/console | Compte développeur (25$ one-time) |
| Apple Developer | developer.apple.com | Compte développeur (99$/an) |
| Stripe | dashboard.stripe.com | Compte activé (KYC complété) |
| Sumsub | cockpit.sumsub.com | Compte production |

---

## 2. CONFIGURATION FIREBASE PRODUCTION

### 2.1 Projet Firebase Séparé (Recommandé)

**Option 1: Projet Production Séparé**
```bash
# Créer nouveau projet Firebase "Social Impact PROD"
# Avantages:
# - Séparation complète dev/prod
# - Aucun risque de contamination données
# - Meilleure gestion budgets

# Dans le projet local:
firebase use --add
# Sélectionner le projet PROD
# Alias: production

# Switch entre projets:
firebase use development
firebase use production
```

**Option 2: Même Projet avec Environnements**
```bash
# Utiliser le même projet mais bases différentes
# Moins recommandé mais possible
```

### 2.2 Configuration Production Firebase

**a) Firestore Database:**
- Région: Choisir proche de vos utilisateurs (ex: `europe-west1`)
- **IMPORTANT:** Activer Point-in-Time Recovery (backup)
```bash
gcloud firestore databases update --location=europe-west1 --enable-pitr
```

**b) Storage:**
- Activer versioning pour les fichiers critiques
- Configurer lifecycle rules (suppression auto fichiers temporaires)

**c) Authentication:**
- Activer email/password
- Configurer Google Sign-In:
  - Ajouter domaines autorisés: `socialimpact.app`, `www.socialimpact.app`
  - Support email: votre email professionnel
- Configurer Apple Sign-In:
  - Team ID Apple
  - Service ID
  - Key ID + Private Key

**d) Cloud Functions:**
- Plan Blaze REQUIS
- Quotas par défaut suffisants (vérifier)
- Timeouts: 300s pour fonctions longues

**e) Firebase Hosting (Web):**
- Domaine custom: `socialimpact.app`
- SSL automatique (Firebase gère)
- CDN global activé

### 2.3 Sécurité Firestore

**Déployer les rules production:**
```bash
firebase use production
firebase deploy --only firestore:rules
firebase deploy --only storage:rules
```

**Tester les rules:**
```bash
# Dans Firebase Console > Firestore > Rules > Simulator
# Tester différents scénarios:
# - Utilisateur non authentifié
# - Utilisateur role investor
# - Utilisateur role organization
# - Admin
```

### 2.4 Budget Alerts

**Configurer alertes budget:**
1. Firebase Console > Project Settings > Usage and Billing
2. Set budget: 100€/mois (ajuster selon besoins)
3. Alertes à: 50%, 80%, 100%
4. Email notifications activées

---

## 3. CONFIGURATION STRIPE PRODUCTION

### 3.1 Activer le Compte Stripe

**KYC Stripe (Identity Verification):**
1. Stripe Dashboard > Settings > Account Details
2. Fournir informations légales:
   - Type business (SAS, SARL, etc.)
   - SIRET/SIREN
   - Adresse siège social
   - Identité gérant
   - RIB (pour paiements)

**Durée validation:** 1-3 jours ouvrés

### 3.2 Clés API Production

```bash
# ATTENTION: NE JAMAIS commiter ces clés !

# Dans Stripe Dashboard > Developers > API Keys
# Copier (MODE LIVE):
Publishable key: pk_live_...
Secret key: sk_live_...

# Mettre à jour .env:
STRIPE_PUBLISHABLE_KEY_LIVE=pk_live_...
STRIPE_SECRET_KEY_LIVE=sk_live_...
USE_TEST_MODE=false
```

### 3.3 Webhooks Production

**Créer endpoint webhook:**
1. Stripe Dashboard > Developers > Webhooks > Add endpoint
2. URL: `https://us-central1-social-impact-prod.cloudfunctions.net/stripeWebhook`
3. Description: "Production Webhook"
4. Events:
   - `payment_intent.succeeded`
   - `payment_intent.payment_failed`
   - `payment_intent.canceled`
   - `charge.refunded`
   - `customer.created`
   - `customer.updated`

5. Copier **Signing secret**: `whsec_...`

**Mettre à jour Cloud Functions config:**
```bash
firebase use production
firebase functions:config:set \
  stripe.secret_key="sk_live_VOTRE_CLE" \
  stripe.webhook_secret="whsec_VOTRE_SECRET"
```

### 3.4 Apple Pay & Google Pay Production

**Apple Pay:**
1. Stripe Dashboard > Settings > Payment Methods > Apple Pay
2. Add domain: `socialimpact.app`
3. Download verification file
4. Placer dans `web/.well-known/`

**Google Pay:**
1. Stripe Dashboard > Settings > Payment Methods > Google Pay
2. Activer production
3. Business name: "Social Impact"

### 3.5 Taxes & Invoicing

**Configurer TVA:**
```
Stripe Dashboard > Settings > Tax Settings
- Activer Tax automatique
- Configurer taux TVA selon pays
```

---

## 4. BUILD & OPTIMISATION

### 4.1 Version & Build Number

**Mettre à jour `pubspec.yaml`:**
```yaml
version: 1.0.0+1  # Format: version+buildNumber
```

**Semantic Versioning:**
- Major.Minor.Patch+BuildNumber
- Ex: 1.0.0+1 → 1ère release
- Ex: 1.0.1+2 → Bugfix
- Ex: 1.1.0+3 → New feature

### 4.2 Configuration Production

**Créer `.env.production`:**
```env
ENVIRONMENT=production
USE_TEST_MODE=false
STRIPE_PUBLISHABLE_KEY=pk_live_...
STRIPE_SECRET_KEY=sk_live_...
API_BASE_URL=https://us-central1-social-impact-prod.cloudfunctions.net
APP_URL_WEB=https://socialimpact.app
ENABLE_CRASHLYTICS=true
ENABLE_ANALYTICS=true
```

### 4.3 Code Obfuscation

**Android - `android/app/build.gradle`:**
```gradle
buildTypes {
    release {
        minifyEnabled true
        shrinkResources true
        proguardFiles getDefaultProguardFile('proguard-android-optimize.txt'), 'proguard-rules.pro'
        signingConfig signingConfigs.release
    }
}
```

**iOS - Xcode:**
1. Open `ios/Runner.xcworkspace`
2. Product > Scheme > Edit Scheme > Run > Build Configuration → **Release**
3. Build Settings > Optimization Level → **Fastest, Smallest**

### 4.4 Assets Optimisation

**Images:**
```bash
# Optimiser toutes les images
find assets/images -name "*.png" -exec pngquant --ext .png --force 256 {} \;
find assets/images -name "*.jpg" -exec jpegoptim --max=85 {} \;
```

**Icons:**
```bash
# Générer les icons pour toutes plateformes
flutter pub run flutter_launcher_icons:main
```

**Splash Screens:**
```bash
flutter pub run flutter_native_splash:create
```

---

## 5. DÉPLOIEMENT ANDROID (GOOGLE PLAY)

### 5.1 Génération Clé de Signature

**Créer keystore:**
```bash
keytool -genkey -v -keystore ~/upload-keystore.jks \
  -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 \
  -alias upload

# Entrer informations:
# - Password keystore (NOTER PRÉCIEUSEMENT)
# - Password key (NOTER PRÉCIEUSEMENT)
# - Nom: Votre nom/entreprise
# - Organisation: Votre entreprise
# - Ville, Pays, etc.
```

**⚠️ IMPORTANT: Sauvegarder le keystore:**
```bash
# Copier dans un endroit sûr (1Password, etc.)
# NE JAMAIS perdre ce fichier ni les passwords
# Impossible de publier updates sans ça
```

### 5.2 Configuration Signature

**Créer `android/key.properties`:**
```properties
storePassword=VOTRE_STORE_PASSWORD
keyPassword=VOTRE_KEY_PASSWORD
keyAlias=upload
storeFile=/Users/VOUS/upload-keystore.jks
```

**Ajouter à `.gitignore`:**
```
android/key.properties
upload-keystore.jks
```

**Configurer `android/app/build.gradle`:**
```gradle
def keystoreProperties = new Properties()
def keystorePropertiesFile = rootProject.file('key.properties')
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(new FileInputStream(keystorePropertiesFile))
}

android {
    ...
    signingConfigs {
        release {
            keyAlias keystoreProperties['keyAlias']
            keyPassword keystoreProperties['keyPassword']
            storeFile keystoreProperties['storeFile'] ? file(keystoreProperties['storeFile']) : null
            storePassword keystoreProperties['storePassword']
        }
    }
    buildTypes {
        release {
            signingConfig signingConfigs.release
        }
    }
}
```

### 5.3 Build APK/App Bundle

**App Bundle (Recommandé pour Play Store):**
```bash
flutter build appbundle --release

# Fichier généré:
# build/app/outputs/bundle/release/app-release.aab
```

**APK (Pour distribution directe):**
```bash
flutter build apk --release --split-per-abi

# 3 fichiers générés (pour ARM, ARM64, x86):
# build/app/outputs/flutter-apk/app-armeabi-v7a-release.apk
# build/app/outputs/flutter-apk/app-arm64-v8a-release.apk
# build/app/outputs/flutter-apk/app-x86_64-release.apk
```

### 5.4 Google Play Console

**a) Créer Application:**
1. https://play.google.com/console
2. Create app
3. Nom: "Social Finance Impact"
4. Langue par défaut: Français
5. Type: App

**b) Store Listing:**
- **Nom app:** Social Finance Impact
- **Description courte:** Investissez dans des projets à impact social
- **Description complète:** (500+ mots décrivant l'app)
- **Screenshots:**
  - Minimum 2 par format (phone, tablet, 7-inch, 10-inch)
  - Format PNG/JPEG
  - Utiliser captures réelles de l'app
- **Icône:** 512x512 PNG
- **Feature Graphic:** 1024x500 PNG
- **Catégorie:** Finance
- **Email contact:** support@socialimpact.app
- **Privacy Policy URL:** https://socialimpact.app/privacy

**c) Content Rating:**
1. Remplir questionnaire
2. App contient: Aucun contenu sensible
3. Âge minimum: 18+ (car finance)

**d) App Content:**
- **Privacy Policy:** Lien vers votre politique
- **Data Safety:** Déclarer toutes données collectées:
  - Données personnelles (nom, email)
  - Données financières
  - Données KYC
  - Analytics
- **Encryption:** Oui (app utilise HTTPS)

**e) Release - Production:**
1. Create new release
2. Upload `app-release.aab`
3. Release name: "1.0.0 - Initial Release"
4. Release notes (français + anglais):
```
Version 1.0.0
- Première version publique
- Investissement dans projets sociaux
- Suivi de l'impact en temps réel
- KYC intégré
- Paiements sécurisés Stripe
```
5. **Review & Rollout**

**Durée review:** 1-7 jours

### 5.5 Updates Futures

```bash
# 1. Incrémenter version dans pubspec.yaml
version: 1.0.1+2

# 2. Build
flutter build appbundle --release

# 3. Upload sur Play Console > Production > Create new release
```

---

## 6. DÉPLOIEMENT IOS (APP STORE)

### 6.1 Prérequis Apple

**a) Apple Developer Account:**
- Inscription: https://developer.apple.com/programs/
- Coût: 99$/an
- Type: Individual ou Organization

**b) Identifiants:**
- **Bundle ID:** `com.socialimpact.mvp`
- **Team ID:** (dans Apple Developer > Membership)

### 6.2 Certificates & Provisioning

**a) Créer App ID:**
1. Apple Developer > Certificates, IDs & Profiles
2. Identifiers > + > App IDs
3. Description: Social Finance Impact
4. Bundle ID: `com.socialimpact.mvp`
5. Capabilities:
   - Push Notifications
   - Sign in with Apple
   - Associated Domains (pour deep linking)

**b) Créer Certificates:**
```bash
# Sur votre Mac
# Distribution Certificate (pour App Store)
# Xcode > Preferences > Accounts > Manage Certificates > +
# Apple Distribution
```

**c) Provisioning Profile:**
1. Apple Developer > Profiles > + > App Store
2. Sélectionner App ID créé
3. Sélectionner certificate
4. Download et double-click pour installer

### 6.3 Configuration Xcode

**a) Ouvrir projet:**
```bash
cd ios
open Runner.xcworkspace
```

**b) Signing & Capabilities:**
1. Runner target > Signing & Capabilities
2. Team: Sélectionner votre team
3. Bundle Identifier: `com.socialimpact.mvp`
4. Signing Certificate: Apple Distribution
5. Provisioning Profile: Sélectionner celui créé

**c) Capabilities à activer:**
- Push Notifications
- Sign in with Apple
- Associated Domains
  - Domains: `applinks:socialimpact.app`

**d) Build Settings:**
- Deployment Target: iOS 11.0 minimum
- Architectures: arm64 (pour devices réels)

### 6.4 Build & Archive

**a) Dans Xcode:**
1. Product > Scheme > Edit Scheme
2. Run > Build Configuration: **Release**
3. Product > Destination > **Any iOS Device (arm64)**
4. Product > Archive

**Durée:** 5-10 minutes

**b) Upload vers App Store Connect:**
1. Window > Organizer
2. Sélectionner archive
3. Distribute App > App Store Connect > Upload
4. Options:
   - Include bitcode: Yes
   - Upload symbols: Yes
   - Manage Version: Automatically

### 6.5 App Store Connect

**a) Créer App:**
1. https://appstoreconnect.apple.com
2. My Apps > + > New App
3. Platforms: iOS
4. Name: Social Finance Impact
5. Primary Language: French
6. Bundle ID: com.socialimpact.mvp
7. SKU: socialimpact-mvp-001

**b) App Information:**
- **Nom:** Social Finance Impact
- **Subtitle:** Investissement à impact social
- **Catégorie:** Finance
- **License Agreement:** Standard Apple EULA

**c) Pricing:**
- Price: Free
- Availability: All countries (ou sélectionner)

**d) Prepare for Submission:**

**App Store Previews:**
- Screenshots iPhone 6.5" (1242x2688)
- Screenshots iPhone 5.5" (1242x2208)
- Screenshots iPad Pro 12.9" (2048x2732)
- Format PNG/JPEG

**Description:**
```
Social Finance Impact permet d'investir dans des projets à fort impact social en toute transparence.

FONCTIONNALITÉS:
• Browse de projets sociaux vérifiés
• Investissements sécurisés via Stripe
• Suivi en temps réel de l'impact
• Validation par auditeurs indépendants
• KYC intégré conforme RGPD

SÉCURITÉ:
• Paiements 100% sécurisés
• Données chiffrées
• KYC vérifié par Sumsub
```

**Keywords:** finance, social, impact, investissement, projets

**Support URL:** https://socialimpact.app/support
**Privacy Policy URL:** https://socialimpact.app/privacy

**e) Build:**
- Sélectionner le build uploadé
- Export Compliance: Non (car pas de cryptographie custom)

**f) Submit for Review:**
- Review information:
  - Contact: Votre email
  - Phone: Votre téléphone
  - Demo account (TEST):
    - Email: demo@test.com
    - Password: Demo123456!
  - Notes: "Application de financement participatif à impact social"

**g) Review Checklist:**
- [ ] Screenshots de qualité
- [ ] Description complète
- [ ] Privacy policy accessible
- [ ] Demo account fonctionnel
- [ ] App stable (pas de crash)

**Durée review:** 1-3 jours (peut aller jusqu'à 7 jours)

### 6.6 TestFlight (Beta Testing)

**Avant submission App Store:**
```
App Store Connect > TestFlight > Internal Testing
- Ajouter testeurs (max 100)
- Ils recevront email pour télécharger
- Collecter feedback
```

---

## 7. DÉPLOIEMENT WEB (FIREBASE HOSTING)

### 7.1 Build Web Production

**a) Optimisation:**
```bash
# Build release avec optimisations
flutter build web --release \
  --web-renderer canvaskit \
  --pwa-strategy offline-first
```

**Options:**
- `canvaskit`: Meilleur rendu, plus lourd (recommandé)
- `html`: Plus léger mais rendu moins bon
- `auto`: Détection automatique

**b) Fichiers générés:**
```
build/web/
├── index.html
├── main.dart.js
├── flutter.js
├── assets/
└── ...
```

### 7.2 Configuration Firebase Hosting

**a) `firebase.json` (déjà configuré):**
```json
{
  "hosting": {
    "public": "build/web",
    "ignore": [
      "firebase.json",
      "**/.*",
      "**/node_modules/**"
    ],
    "rewrites": [
      {
        "source": "**",
        "destination": "/index.html"
      }
    ],
    "headers": [
      {
        "source": "**/*.@(js|css|woff2)",
        "headers": [
          {
            "key": "Cache-Control",
            "value": "public, max-age=31536000, immutable"
          }
        ]
      }
    ]
  }
}
```

**b) Domaine Custom:**
1. Firebase Console > Hosting > Add custom domain
2. Domain: `socialimpact.app`
3. Vérifier propriété (TXT record DNS)
4. Attendre propagation DNS (24-48h)

**DNS Configuration (chez votre registrar):**
```
Type  | Host | Value
------|------|-------
A     | @    | [IP fournie par Firebase]
A     | www  | [IP fournie par Firebase]
TXT   | @    | [Verification token]
```

### 7.3 Déploiement

```bash
# Switch vers production
firebase use production

# Deploy web
firebase deploy --only hosting

# URL déployée:
# https://social-impact-prod.web.app
# https://socialimpact.app (après config domaine)
```

### 7.4 Performance Web

**a) Lighthouse Audit:**
```bash
# Chrome DevTools > Lighthouse > Generate report
# Targets:
# - Performance: >90
# - Accessibility: >90
# - Best Practices: >90
# - SEO: >90
# - PWA: 100
```

**b) Optimisations si scores faibles:**

**Performance <90:**
```bash
# Lazy loading
# Code splitting
# Image optimization
# Compression gzip/brotli
```

**SEO <90:**
```html
<!-- Vérifier meta tags dans web/index.html -->
<meta name="description" content="...">
<meta property="og:title" content="Social Finance Impact">
<meta property="og:description" content="...">
<meta property="og:image" content="https://socialimpact.app/og-image.png">
```

### 7.5 PWA Features

**a) Service Worker (généré automatiquement):**
```
build/web/flutter_service_worker.js
```

**b) Manifest (vérifier):**
```json
{
  "name": "Social Finance Impact",
  "short_name": "Social Impact",
  "start_url": "/",
  "display": "standalone",
  "background_color": "#2563EB",
  "theme_color": "#2563EB",
  "icons": [
    {
      "src": "icons/Icon-192.png",
      "sizes": "192x192",
      "type": "image/png"
    },
    {
      "src": "icons/Icon-512.png",
      "sizes": "512x512",
      "type": "image/png"
    }
  ]
}
```

**c) Tester PWA:**
1. Chrome > DevTools > Application
2. Manifest: Vérifier
3. Service Worker: Activé
4. Add to Home Screen: Fonctionnel

---

## 8. CLOUD FUNCTIONS PRODUCTION

### 8.1 Build Functions

```bash
cd functions

# Install dependencies
npm install --production

# Build TypeScript
npm run build

# Test locally avant deploy
npm run serve
```

### 8.2 Environment Variables

```bash
firebase use production

# Set all environment variables
firebase functions:config:set \
  stripe.secret_key="sk_live_..." \
  stripe.webhook_secret="whsec_..." \
  sumsub.app_token="..." \
  sumsub.secret_key="..." \
  app.url="https://socialimpact.app"

# Vérifier config
firebase functions:config:get
```

### 8.3 Déploiement

```bash
# Deploy toutes les functions
firebase deploy --only functions

# OU déployer fonction par fonction
firebase deploy --only functions:stripeCreatePaymentIntent
firebase deploy --only functions:stripeWebhook

# Vérifier déploiement
firebase functions:list
```

**URLs des functions:**
```
https://us-central1-social-impact-prod.cloudfunctions.net/stripeCreatePaymentIntent
https://us-central1-social-impact-prod.cloudfunctions.net/stripeWebhook
etc.
```

### 8.4 Monitoring Functions

```bash
# Logs en temps réel
firebase functions:log

# Logs d'une fonction spécifique
firebase functions:log --only stripeWebhook

# Dans Firebase Console:
# Functions > Logs
```

### 8.5 Quotas & Limites

**Vérifier quotas:**
```
Firebase Console > Functions > Usage
- Invocations
- Compute time
- Outbound networking
```

**Augmenter quotas si nécessaire:**
```
Google Cloud Console > IAM & Admin > Quotas
```

---

## 9. MONITORING & ANALYTICS

### 9.1 Firebase Crashlytics (Mobile)

**Android - déjà configuré:**
```gradle
// android/app/build.gradle
apply plugin: 'com.google.firebase.crashlytics'
```

**iOS - configurer:**
```bash
cd ios
pod install
```

**Dans code:**
```dart
// Crashes automatiquement reportés
// Pour erreurs custom:
FirebaseCrashlytics.instance.recordError(error, stackTrace);
```

**Monitoring:**
```
Firebase Console > Crashlytics
- Crash-free users: >99.9% target
- Temps réponse: <24h
```

### 9.2 Firebase Analytics

**Events à tracker:**
```dart
// Dans l'app
FirebaseAnalytics.instance.logEvent(
  name: 'project_view',
  parameters: {'project_id': projectId},
);

// Events critiques:
// - user_signup
// - user_login
// - project_view
// - contribution_initiated
// - contribution_completed
// - kyc_started
// - kyc_completed
```

**Dashboards:**
```
Firebase Console > Analytics
- User engagement
- User retention
- Conversion funnels
```

### 9.3 Performance Monitoring

**Web:**
```html
<!-- Firebase Performance déjà inclus -->
<script src="/__/firebase/performance.js"></script>
```

**Mobile:**
```dart
FirebasePerformance.instance;
// Traces automatiques pour:
// - App start
// - Screen rendering
// - Network requests
```

**Métriques à surveiller:**
- App start time: <3s
- Screen load time: <1s
- API calls: <2s
- FPS: >55

### 9.4 Uptime Monitoring

**Configurer UptimeRobot (gratuit):**
1. https://uptimerobot.com
2. Add monitor:
   - Type: HTTPS
   - URL: https://socialimpact.app
   - Interval: 5 min
3. Alertes par email si down

**Cloud Functions Health Checks:**
```typescript
export const healthCheck = functions.https.onRequest((req, res) => {
  res.json({ status: 'ok', timestamp: Date.now() });
});

// Monitorer:
// https://us-central1-social-impact-prod.cloudfunctions.net/healthCheck
```

### 9.5 Error Tracking - Sentry (Optionnel)

**Si besoin tracking avancé:**
```bash
flutter pub add sentry_flutter

# Configuration dans main.dart
await SentryFlutter.init(
  (options) => options.dsn = 'VOTRE_DSN_SENTRY',
  appRunner: () => runApp(MyApp()),
);
```

---

## 10. MAINTENANCE & UPDATES

### 10.1 Stratégie de Releases

**Versioning:**
- **Patch (1.0.X):** Bugfixes uniquement
- **Minor (1.X.0):** Nouvelles features non-breaking
- **Major (X.0.0):** Breaking changes

**Fréquence:**
- Bugfixes: Dès que critique
- Features: Toutes les 2-4 semaines
- Major: 1-2 fois par an

### 10.2 Process de Update

**1. Development:**
```bash
# Créer branch
git checkout -b feature/nouvelle-feature

# Développer + tests
# ...

# Merge vers develop
git checkout develop
git merge feature/nouvelle-feature
```

**2. Testing:**
```bash
# Tests automatisés
flutter test

# Tests manuels
flutter run

# TestFlight/Internal Testing
```

**3. Release:**
```bash
# Incrémenter version
# pubspec.yaml: 1.0.1+2

# Merge develop → main
git checkout main
git merge develop

# Tag
git tag v1.0.1
git push origin v1.0.1

# Build & Deploy
flutter build appbundle --release  # Android
flutter build ios --release        # iOS
flutter build web --release        # Web
firebase deploy                    # Functions + Hosting
```

**4. Monitoring:**
- Surveiller Crashlytics
- Vérifier logs Cloud Functions
- Monitorer analytics
- Lire reviews App Store/Play Store

### 10.3 Rollback Strategy

**Si problème critique après release:**

**Android:**
```
Google Play Console > Production > Manage Rollout
- Rollback to previous version
```

**iOS:**
```
App Store Connect > App Store > Remove from Sale
- Puis re-submit version précédente
```

**Web:**
```bash
firebase hosting:rollback
# OU redeploy version précédente
```

**Functions:**
```bash
# Redeploy version précédente
git checkout v1.0.0
cd functions
firebase deploy --only functions
```

### 10.4 Backup & Recovery

**Firestore Backup:**
```bash
# Automatique avec Point-in-Time Recovery
# OU export manuel:
gcloud firestore export gs://social-impact-backups/$(date +%Y-%m-%d)
```

**Code Backup:**
- Git repository (GitHub/GitLab)
- Backups automatiques du code

**Secrets Backup:**
- Clés API dans 1Password/Vault
- Keystore Android en lieu sûr
- Certificates iOS sauvegardés

### 10.5 Compliance & Legal

**RGPD:**
- [ ] Privacy policy à jour
- [ ] Consentement cookies (web)
- [ ] Export données utilisateur (à implémenter)
- [ ] Suppression compte (à implémenter)
- [ ] Data retention policy

**App Stores:**
- [ ] Respecter guidelines Apple/Google
- [ ] Updates privacy policy si changements
- [ ] Répondre aux reviews (<7 jours)

---

## ✅ CHECKLIST FINALE PRODUCTION

**Avant le lancement:**

**Infrastructure:**
- [ ] Firebase production configuré
- [ ] Firestore rules déployées
- [ ] Storage rules déployées
- [ ] Cloud Functions déployées
- [ ] Domaine custom configuré (web)
- [ ] SSL activé partout
- [ ] Backups configurés

**Services Externes:**
- [ ] Stripe production activé
- [ ] Webhooks Stripe configurés
- [ ] Sumsub production activé
- [ ] Apple/Google Sign-In configurés

**Applications:**
- [ ] Android sur Play Store
- [ ] iOS sur App Store
- [ ] Web sur Firebase Hosting
- [ ] PWA fonctionnelle

**Monitoring:**
- [ ] Crashlytics actif
- [ ] Analytics configuré
- [ ] Performance monitoring actif
- [ ] Uptime monitoring configuré
- [ ] Alertes budget activées

**Legal:**
- [ ] Privacy Policy publiée
- [ ] Terms of Service publiés
- [ ] Cookies consent (web)
- [ ] RGPD compliant

**Communication:**
- [ ] Email support actif
- [ ] Page support créée
- [ ] FAQ préparée
- [ ] Social media setup

---

## 🎉 FÉLICITATIONS !

**Votre application est maintenant en PRODUCTION !**

**Prochaines étapes:**
1. 📱 Monitorer les premiers utilisateurs
2. 📊 Analyser les métriques d'usage
3. 🐛 Corriger bugs remontés rapidement
4. ⭐ Collecter feedback utilisateurs
5. 🚀 Planifier prochaines features

**Ressources:**
- Monitoring: Firebase Console
- Support: support@socialimpact.app
- Status: https://status.socialimpact.app
- Documentation: https://docs.socialimpact.app

**🎊 Bonne chance avec votre lancement !**
