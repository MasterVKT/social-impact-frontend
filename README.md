# Social Impact MVP

Application mobile et web pour la plateforme d'investissement à impact social.

## Présentation

Cette application permet aux utilisateurs de découvrir, investir et suivre des projets à impact social. Elle offre des fonctionnalités complètes de gestion de compte, d'authentification, de vérification KYC et de suivi des investissements.

## Plateformes supportées

- **Mobile** : Android et iOS
- **Web** : Chrome, Edge, Firefox
- **Desktop** : Windows

## Configuration requise

- Flutter SDK 3.13.0 ou supérieur
- Dart SDK 3.1.0 ou supérieur
- Firebase CLI (pour le déploiement)
- Android Studio / Xcode (pour le développement mobile)
- Visual Studio (pour le développement Windows)

## Installation

1. Clonez le dépôt :
   ```bash
   git clone https://github.com/votre-organisation/social_impact_mvp.git
   cd social_impact_mvp
   ```

2. Installez les dépendances :
   ```bash
   flutter pub get
   ```

3. Générez les fichiers de code :
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

## Exécution de l'application

Vous pouvez utiliser les scripts fournis pour lancer l'application sur différentes plateformes :

### Windows

```bash
# Utilisez le script batch
run_app.bat

# OU directement avec Flutter
flutter run -d windows
```

### Web

```bash
# Utilisez le script batch
run_app.bat

# OU directement avec Flutter (version complète)
flutter run -d chrome --web-renderer html

# OU version simplifiée pour le web
flutter run -d chrome --web-renderer html lib/main_web.dart
```

### Mobile

```bash
# Version complète
flutter run

# Version simplifiée
flutter run lib/main_simplified.dart
```

## Versions alternatives

L'application propose plusieurs points d'entrée pour faciliter le développement et les tests :

- `lib/main.dart` : Application complète avec toutes les fonctionnalités
- `lib/main_simplified.dart` : Version simplifiée sans dépendances Firebase pour les tests rapides
- `lib/main_web.dart` : Version optimisée pour le web sans problèmes de compatibilité Firebase

## Structure du projet

```
lib/
├── core/               # Fonctionnalités de base et configuration
│   ├── config/         # Configuration de l'application
│   ├── constants/      # Constantes globales
│   ├── error/          # Gestion des erreurs
│   ├── navigation/     # Navigation et routage
│   ├── providers/      # Providers globaux
│   ├── router/         # Configuration du routeur
│   ├── services/       # Services partagés
│   ├── themes/         # Thèmes de l'application
│   └── utils/          # Utilitaires
├── features/           # Fonctionnalités de l'application
│   ├── analytics/      # Analytiques
│   ├── auth/           # Authentification et KYC
│   ├── compliance/     # Conformité
│   ├── help_support/   # Aide et support
│   ├── impact/         # Mesure d'impact
│   ├── investments/    # Investissements
│   ├── notifications/  # Notifications
│   ├── organizations/  # Organisations
│   ├── search/         # Recherche
│   ├── settings/       # Paramètres
│   ├── transactions/   # Transactions
│   └── user_profile/   # Profil utilisateur
├── l10n/               # Internationalisation
├── platform/           # Code spécifique aux plateformes
│   ├── mobile/         # Code spécifique aux mobiles
│   └── web/            # Code spécifique au web
└── shared/             # Composants partagés
    ├── constants/      # Constantes partagées
    ├── providers/      # Providers partagés
    ├── services/       # Services partagés
    ├── utils/          # Utilitaires partagés
    └── widgets/        # Widgets partagés
```

## Résolution des problèmes

### Erreurs Firebase sur le web

Si vous rencontrez des erreurs liées à Firebase sur le web, utilisez la version simplifiée de l'application :

```bash
flutter run -d chrome --web-renderer html lib/main_web.dart
```

### Erreurs de compilation sur Windows

Si vous rencontrez des erreurs de compilation sur Windows liées à local_auth ou à d'autres plugins, assurez-vous que les fichiers de configuration Windows sont correctement configurés :

- Vérifiez `windows/flutter/generated_plugin_registrant.cc`
- Vérifiez `windows/flutter/generated_plugins.cmake`

### Erreurs de génération de code

Si vous rencontrez des erreurs lors de la génération de code avec build_runner, essayez :

```bash
# Nettoyer les fichiers générés précédemment
flutter clean
# Récupérer les dépendances
flutter pub get
# Générer les fichiers avec l'option de suppression des conflits
dart run build_runner build --delete-conflicting-outputs
```

## Contribution

1. Fork le projet
2. Créez votre branche de fonctionnalité (`git checkout -b feature/amazing-feature`)
3. Committez vos changements (`git commit -m 'Add some amazing feature'`)
4. Push vers la branche (`git push origin feature/amazing-feature`)
5. Ouvrez une Pull Request

## Licence

Ce projet est sous licence propriétaire. Tous droits réservés.