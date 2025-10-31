# Description Textuelle MVP - Mobile Hybride + Web Responsive
## Social Finance Impact Platform - Version Minimum Viable

### Vue d'ensemble du MVP

Le MVP (Minimum Viable Product) de la Social Finance Impact Platform est une **application mobile hybride native (Android/iOS) ET web responsive** complète, conçue pour valider le concept auprès des utilisateurs avec un budget et un délai réduits. Cette version multi-plateforme se concentre sur les fonctionnalités essentielles permettant de créer, financer et suivre des projets à impact social sur tous les appareils.

### Objectif du MVP

Permettre à 100-500 utilisateurs de tester le concept de financement participatif à impact social avec :
- **Applications mobiles natives** pour Android et iOS avec expérience utilisateur optimisée
- **Application web responsive** pour desktop et navigation mobile
- Création de projets simples par des porteurs authentifiés
- Contributions financières sécurisées de la part de contributeurs vérifiés
- Suivi basique de l'avancement des projets
- Validation simple des milestones par des auditeurs externes

### Fonctionnalités incluses dans le MVP

**1. Authentification et profils utilisateur multi-plateforme**

Le système d'authentification utilise Firebase Authentication avec des profils utilisateur adaptatifs selon la plateforme. Les utilisateurs peuvent s'inscrire via :
- **Mobile** : Email/mot de passe, Google Sign-In, Apple Sign-In (iOS), authentification biométrique
- **Web** : Email/mot de passe, Google Sign-In (popup/redirect), Remember Me avec localStorage

La vérification d'identité est simplifiée à un niveau basique utilisant l'API Sumsub pour la validation automatique des documents d'identité, avec interface adaptée par plateforme :
- **Mobile** : Interface native avec camera intégrée pour capture documents
- **Web** : Interface d'upload avec drag & drop et preview

Types d'utilisateurs supportés :
- **Contributeurs** : Personnes souhaitant financer des projets (vérification KYC niveau 1 seulement)
- **Porteurs de projet** : Créateurs de projets à impact social (vérification KYC niveau 2)
- **Auditeurs externes** : Professionnels validant les milestones (système d'invitation seulement)
- **Administrateur** : Gestion et modération de la plateforme

**2. Création et gestion de projets adaptative**

Les porteurs de projet peuvent créer des projets via un formulaire assisté par l'IA Firebase AI Logic, avec interface adaptée :

**Mobile (Android/iOS) :**
- Interface wizard multi-étapes optimisée touch
- Capture photo native avec preview et édition
- Géolocalisation automatique du projet
- Mode offline avec synchronisation automatique
- Notifications push pour updates

**Web responsive :**
- Interface desktop avec drag & drop
- Upload multiple fichiers simultané
- Aperçu en temps réel du projet
- Barre de progression visuelle
- Shortcuts clavier pour navigation rapide

Le processus est volontairement simplifié avec :
- Titre et description du projet (assistance IA pour améliorer la rédaction)
- Catégorie d'impact parmi 5 choix prédéfinis (Environnement, Éducation, Santé, Communauté, Innovation)
- Objectif financier et devise (EUR uniquement pour le MVP)
- Durée de campagne (30, 60 ou 90 jours)
- 3 milestones maximum avec descriptions simples
- Une image de couverture et jusqu'à 3 images supplémentaires

La modération est automatisée via Firebase AI Logic pour détecter le contenu inapproprié, avec validation manuelle par l'administrateur pour tous les projets.

**3. Système de contribution multi-plateforme**

Les contributeurs peuvent découvrir les projets via des interfaces optimisées :

**Mobile native :**
- Navigation par swipe et gestures natifs
- Pull-to-refresh pour actualiser
- Filtres en bottom sheet modal
- Recherche vocale (speech-to-text)
- Partage natif vers réseaux sociaux
- Mode favoris avec stockage local sécurisé

**Web responsive :**
- Navigation breadcrumb et pagination
- Filtres sidebar avec recherche instantanée
- Grille adaptative selon taille écran
- Keyboard shortcuts (/, Ctrl+F, etc.)
- URL bookmarkable pour chaque projet
- Système de tags cliquables

Système de contribution via Stripe avec montants prédéfinis (25€, 50€, 100€, 250€, 500€) et interfaces adaptées :
- **Mobile** : Modal payment native avec Apple Pay/Google Pay
- **Web** : Checkout intégré avec validation temps réel

Confirmation immédiate et reçu par email via l'extension Firebase Email.

Le système d'escrow est géré automatiquement par Firestore avec déblocage des fonds après validation des milestones.

**4. Suivi de projet et milestones adaptatif**

Chaque projet a 3 milestones maximum avec un workflow simplifié adapté par plateforme :

**Pour les porteurs (mobile) :**
- Soumission de preuves via capture photo/vidéo native
- Upload de documents depuis stockage local
- Notifications push pour deadlines milestones
- Mode offline avec queue d'upload

**Pour les porteurs (web) :**
- Interface drag & drop multi-fichiers
- Édition en ligne avec preview
- Calendrier intégré pour planning
- Historique complet des soumissions

**Pour les auditeurs :**
- Tableau de bord spécialisé responsive
- Système de scoring avec commentaires
- Validation en un clic avec justification
- Notifications email et push (mobile)

**Pour les contributeurs :**
- Timeline visuelle de progression
- Notifications personnalisées selon préférences
- Accès mobile aux mises à jour projet
- Possibilité de poser questions au porteur

**5. Dashboard utilisateur adaptatif**

Chaque type d'utilisateur a un dashboard optimisé par plateforme :

**Mobile (portrait/landscape) :**
- Cards scrollables avec statistiques animées
- Actions rapides en floating action buttons
- Navigation par onglets en bas d'écran
- Swipe gestures pour navigation rapide
- Mode sombre automatique selon préférences système

**Tablette :**
- Layout deux colonnes optimisé
- Navigation rail latérale
- Multi-tasking avec fenêtres redimensionnables
- Support clavier/souris externe

**Desktop :**
- Interface trois colonnes avec sidebar
- Graphiques interactifs avancés
- Raccourcis clavier complets
- Multi-fenêtres pour workflow professionnel

**Dashboard Contributeurs :**
- Liste des projets soutenus avec statut temps réel
- Montant total investi avec breakdown
- Statut des projets avec timeline visuelle
- Recommandations personnalisées basées sur historique

**Dashboard Porteurs :**
- Leurs projets créés avec analytics détaillées
- Montants collectés avec prévisions IA
- Prochaines milestones avec deadlines
- Outils de communication avec contributeurs

**Dashboard Auditeurs :**
- Liste des audits assignés avec priorités
- Historique des validations avec ratings
- Calendrier intégré pour planning
- Statistiques de performance personnelles

### Architecture technique multi-plateforme

**Frontend Flutter Multi-Platform :** Applications natives pour Android et iOS, plus application web responsive. Code source unique avec adaptations spécifiques par plateforme pour optimiser l'expérience utilisateur.

**Spécificités Mobile :**
- Compilation native pour performance optimale
- Intégration deep linking pour partage
- Support notifications push Firebase
- Accès caméra et stockage local sécurisé
- Authentification biométrique (Touch ID/Face ID/Fingerprint)
- Synchronisation offline avec queue intelligente
- Optimisations batterie et mémoire

**Spécificités Web :**
- Progressive Web App (PWA) avec service worker
- URLs propres et SEO optimisé
- Keyboard navigation complète
- Responsive design avec breakpoints adaptatifs
- LocalStorage pour preferences utilisateur
- Support drag & drop natif
- Optimisations performance bundle splitting

**Firebase comme backend universel :** Utilisation exclusive de Firebase pour toutes les fonctionnalités backend, avec configuration adaptée par plateforme :
- Firebase Authentication (multi-plateforme avec providers spécifiques)
- Firestore avec offline persistence (mobile) et cache optimisé (web)
- Firebase Storage avec upload progressif adaptatif
- Firebase Functions pour logique métier universelle
- Firebase Hosting pour déploiement web
- Firebase AI Logic pour assistance IA
- Firebase Analytics avec événements spécifiques par plateforme
- Firebase Crashlytics pour monitoring erreurs natives

**APIs externes stratégiques :**
- **Sumsub API** pour vérification KYC adaptée (mobile camera + web upload)
- **Stripe API** pour paiements avec Apple Pay/Google Pay (mobile) et checkout web
- **SendGrid via Firebase Extension** pour emails transactionnels
- **Firebase Cloud Messaging** pour notifications push mobile et web

### Workflow utilisateur typique multi-plateforme

**Pour un contributeur :**

*Mobile (Android/iOS) :*
1. Installation app depuis Google Play/App Store
2. Inscription native avec Touch ID/Face ID ou Google/Apple Sign-In
3. Vérification automatique identité via camera intégrée Sumsub
4. Navigation projets avec swipe et pull-to-refresh
5. Sélection projet avec preview immersif
6. Contribution via Apple Pay/Google Pay instantané
7. Ajout au dashboard avec synchronisation cloud
8. Réception notifications push pour updates milestones

*Web responsive :*
1. Accès via navigateur avec URL bookmarkable
2. Inscription avec Google Sign-In popup ou email
3. Vérification identité via upload documents web
4. Navigation avec filtres sidebar et search instantanée
5. Consultation détails avec galleries images
6. Contribution via Stripe checkout intégré
7. Tableau de bord web avec graphiques interactifs
8. Notifications email et web push pour updates

**Pour un porteur de projet :**

*Mobile optimisé :*
1. Inscription et vérification identité renforcée mobile
2. Création projet avec wizard mobile optimisé touch
3. Capture photos natives avec géolocalisation
4. Soumission modération avec preview temps réel
5. Publication avec notifications contributeurs ciblées
6. Soumission preuves milestones via camera native
7. Réception fonds avec notifications push instantanées

*Web professionnel :*
1. Interface création avancée avec assistants IA
2. Upload multiple fichiers avec drag & drop
3. Édition collaborative avec preview live
4. Analytics avancées avec export données
5. Communication contributeurs avec templates
6. Gestion milestones avec calendrier intégré
7. Tableau de bord analytics avec KPIs détaillés

**Pour un auditeur externe :**
1. Invitation administrateur avec credentials multi-plateforme
2. Dashboard audit responsive avec priorisation intelligente
3. Évaluation preuves avec outils annotation (mobile/web)
4. Validation workflow avec justifications required
5. Historique audits avec search et filtres avancés
6. Notifications temps réel toutes plateformes
7. Reporting performance avec métriques personnalisées

### Métriques de succès du MVP multi-plateforme

**Adoption par plateforme :**
- **Mobile** : 1000+ downloads (500 Android + 500 iOS) dans les 3 premiers mois
- **Web** : 5000+ sessions uniques mensuelles
- 50 projets créés répartis 60% mobile / 40% web
- 300 utilisateurs contributeurs actifs (70% mobile / 30% web)
- 50 000€ de financement total collecté toutes plateformes
- 80% de taux de complétion des projets

**Engagement par plateforme :**
- **Mobile** : Temps moyen session 8 minutes, 15 écrans/session
- **Web** : Temps moyen session 12 minutes, 25 pages/session
- Taux de conversion visiteur → contributeur : 7% mobile, 4% web
- Retention 7 jours : 45% mobile, 35% web
- Taux de validation des milestones : 85%
- Satisfaction utilisateur (NPS) : > 7/10 toutes plateformes

**Technique par plateforme :**
- **Mobile** : Temps démarrage < 3s, crash rate < 0.1%, notation stores > 4.5/5
- **Web** : Lighthouse score > 90, First Paint < 2s, Bundle < 10MB
- Disponibilité > 99.5% toutes plateformes
- Coût infrastructure < 800€/mois (mobile + web + backend)

### Stratégie de validation du concept multi-plateforme

**Phase 1 (Mois 1)** : Beta fermée avec 20 utilisateurs sélectionnés testant sur les 3 plateformes
- 10 contributeurs (6 mobile + 4 web)
- 5 porteurs (3 mobile + 2 web)  
- 5 auditeurs (mixed mobile/web selon contexte)

**Phase 2 (Mois 2-3)** : Ouverture graduelle à 100 puis 300 utilisateurs
- Déploiement Google Play Store et App Store
- Lancement web avec campagne SEO
- A/B testing features par plateforme
- Collecte feedback intensive cross-platform

**Phase 3 (Mois 4-6)** : Ouverture publique avec marketing multi-canal
- Campagne app stores avec ASO optimisé
- Marketing digital web avec landing pages
- Partenariats influenceurs mobile-first
- Relations presse tech multi-plateforme

### Évolution vers la version complète

Le MVP multi-plateforme sert de base pour valider :
- L'appétit du marché pour financement participatif sur mobile vs web
- Préférences utilisateurs selon type d'interaction et plateforme
- Viabilité modèle avec auditeurs externes cross-platform
- Efficacité processus validation milestones par type appareil
- Optimisations UX spécifiques à chaque environnement

Les données collectées et retours utilisateurs guideront :
- Priorisation fonctionnalités avancées par plateforme
- Optimisations performance spécifiques mobile/web
- Développement features exclusives (ex: AR mobile, analytics web avancées)
- Stratégie expansion internationale avec localisation
- Intégration gouvernance participative cross-platform

### Avantages de l'approche multi-plateforme

**Pour les utilisateurs :**
- Expérience native optimisée sur leur plateforme préférée
- Synchronisation données en temps réel toutes plateformes
- Flexibilité usage selon contexte (mobile en déplacement, web au bureau)
- Fonctionnalités adaptées aux capacités de chaque appareil

**Pour l'entreprise :**
- Reach market maximum avec codebase principalement unifié
- Données comportementales riches pour optimisations
- Réduction coûts développement vs applications séparées
- Flexibilité déploiement et mise à jour simultanée
- Analytics cross-platform pour insights stratégiques

Cette approche MVP multi-plateforme permet de tester le concept avec un investissement optimal tout en maximisant l'adoption utilisateur et en conservant la possibilité d'évolution vers une plateforme complète selon les besoins validés du marché sur chaque type d'appareil.