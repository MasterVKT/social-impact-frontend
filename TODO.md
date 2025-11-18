# 📝 TODO - IMPLÉMENTATION COMPLÈTE
## Liste Exhaustive de Tout ce qui Reste à Implémenter

**Date:** 18 Novembre 2025
**État Actuel:** ~45% complet
**Objectif:** 100% fonctionnel avec tous les boutons UI opérationnels

---

## ✅ DÉJÀ COMPLÉTÉ

- [x] Configuration pubspec.yaml (packages ajoutés)
- [x] Variables d'environnement (.env.example créé)
- [x] Firestore Security Rules (robustes avec rôles)
- [x] Structure Cloud Functions (package.json, tsconfig.json)
- [x] Service Stripe de base (stripe_service.dart)
- [x] SETUP_DEVELOPMENT.md (guide complet)
- [x] SETUP_PRODUCTION.md (guide complet)
- [x] .gitignore mis à jour

---

## 🔴 PRIORITÉ CRITIQUE - À FAIRE IMMÉDIATEMENT

### 1. CORE SERVICES (Sans ça, rien ne fonctionne)

#### 1.1 Firebase Storage Service
**Fichier:** `lib/core/services/storage/firebase_storage_service.dart`

```dart
class FirebaseStorageService {
  // Upload file (image, document, video)
  Future<String> uploadFile(File file, String path);

  // Upload file with progress callback
  Future<String> uploadFileWithProgress(
    File file,
    String path,
    Function(double progress) onProgress,
  );

  // Download file URL
  Future<String> getDownloadUrl(String path);

  // Delete file
  Future<void> deleteFile(String path);

  // Upload multiple files
  Future<List<String>> uploadMultipleFiles(
    List<File> files,
    String basePath,
  );

  // Compress image before upload
  Future<File> compressImage(File image);
}
```

**Paths requis:**
- `users/{userId}/profile/avatar.jpg`
- `projects/{projectId}/images/cover.jpg`
- `projects/{projectId}/images/additional_{index}.jpg`
- `milestones/{milestoneId}/evidence/{filename}`
- `kyc/{userId}/{filename}`

#### 1.2 Firebase Messaging Service
**Fichier:** `lib/core/services/messaging/firebase_messaging_service.dart`

```dart
class FirebaseMessagingService {
  // Initialize messaging
  Future<void> initialize();

  // Request permissions (iOS)
  Future<bool> requestPermissions();

  // Get FCM token
  Future<String?> getToken();

  // Save token to Firestore
  Future<void> saveTokenToFirestore(String token, String userId);

  // Handle foreground messages
  void handleForegroundMessages(Function(RemoteMessage) handler);

  // Handle background messages
  static Future<void> handleBackgroundMessage(RemoteMessage message);

  // Subscribe to topic
  Future<void> subscribeToTopic(String topic);

  // Unsubscribe from topic
  Future<void> unsubscribeFromTopic(String topic);

  // Send notification via Cloud Function
  Future<void> sendNotification({
    required String userId,
    required String title,
    required String body,
    Map<String, String>? data,
  });
}
```

**Topics:**
- `all_users`
- `investors`
- `creators`
- `auditors`
- `project_{projectId}`

#### 1.3 Environment Config Service
**Fichier:** `lib/core/config/env_config.dart`

```dart
class EnvConfig {
  static late bool _initialized;

  static Future<void> load() async {
    await dotenv.load(fileName: ".env");
    _initialized = true;
  }

  // Stripe
  static String get stripePublishableKey => ...;
  static String get stripeSecretKey => ...;

  // Sumsub
  static String get sumsubAppToken => ...;
  static String get sumsubSecretKey => ...;

  // Firebase
  static String get firebaseProjectId => ...;

  // Feature flags
  static bool get isTestMode => ...;
  static bool get enableAnalytics => ...;
  static bool get enableBiometric => ...;
  static bool get enableApplePay => ...;
  static bool get enableGooglePay => ...;
}
```

#### 1.4 Mettre à Jour main.dart
**Fichier:** `lib/main.dart`

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load environment variables
  await EnvConfig.load();

  // Initialize Firebase
  if (kIsWeb) {
    setPathUrlStrategy();
  }

  try {
    await initializeFirebase();
  } catch (e) {
    debugPrint('Firebase init error: $e');
  }

  // Initialize Storage
  try {
    await AdaptiveStorageService.instance.initialize();
  } catch (e) {
    debugPrint('Storage init error: $e');
  }

  // Initialize Stripe
  try {
    await StripeService.instance.initialize();
  } catch (e) {
    debugPrint('Stripe init error: $e');
  }

  // Initialize Firebase Messaging
  try {
    await FirebaseMessagingService.instance.initialize();
  } catch (e) {
    debugPrint('Messaging init error: $e');
  }

  // Use emulators in debug mode
  if (kDebugMode) {
    FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
    FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
    FirebaseFunctions.instance.useFunctionsEmulator('localhost', 5001);
    FirebaseStorage.instance.useStorageEmulator('localhost', 9199);
  }

  runApp(
    const ProviderScope(
      child: SocialFinanceApp(),
    ),
  );
}
```

---

### 2. CLOUD FUNCTIONS (Toutes CRITIQUES)

**Localisation:** `functions/src/`

#### 2.1 Stripe Payment Functions

**`functions/src/payments/create-payment-intent.ts`:**
```typescript
export const stripeCreatePaymentIntent = functions.https.onCall(async (data, context) => {
  // Vérifier authentification
  if (!context.auth) throw new Error('Unauthorized');

  const { amount, currency, projectId, contributorId, metadata } = data;

  // Créer Payment Intent Stripe
  const paymentIntent = await stripe.paymentIntents.create({
    amount,
    currency,
    metadata: {
      projectId,
      contributorId,
      ...metadata,
    },
  });

  return { clientSecret: paymentIntent.client_secret };
});
```

**`functions/src/payments/stripe-webhook.ts`:**
```typescript
export const stripeWebhook = functions.https.onRequest(async (req, res) => {
  const sig = req.headers['stripe-signature'];

  // Vérifier signature
  const event = stripe.webhooks.constructEvent(
    req.rawBody,
    sig,
    webhookSecret,
  );

  // Traiter selon type d'event
  switch (event.type) {
    case 'payment_intent.succeeded':
      await handlePaymentSuccess(event.data.object);
      break;
    case 'payment_intent.payment_failed':
      await handlePaymentFailure(event.data.object);
      break;
    // etc.
  }

  res.json({ received: true });
});
```

**Autres fonctions Stripe:**
- `stripe-cancel-payment-intent.ts`
- `stripe-create-refund.ts`
- `stripe-get-payment-method.ts`

#### 2.2 Notification Functions

**`functions/src/notifications/send-notification.ts`:**
```typescript
export const sendNotification = functions.https.onCall(async (data) => {
  const { userId, title, body, dataPayload } = data;

  // Get user FCM token from Firestore
  const userDoc = await admin.firestore().collection('users').doc(userId).get();
  const fcmToken = userDoc.data()?.fcmToken;

  if (!fcmToken) return { success: false, error: 'No FCM token' };

  // Send notification
  await admin.messaging().send({
    token: fcmToken,
    notification: { title, body },
    data: dataPayload,
  });

  // Save to Firestore notifications collection
  await admin.firestore().collection('notifications').add({
    userId,
    title,
    body,
    data: dataPayload,
    isRead: false,
    createdAt: admin.firestore.FieldValue.serverTimestamp(),
  });

  return { success: true };
});
```

**`functions/src/notifications/on-new-notification.ts`:**
```typescript
export const onNewNotification = functions.firestore
  .document('notifications/{notificationId}')
  .onCreate(async (snap, context) => {
    const notification = snap.data();

    // Send push notification if user has FCM token
    // ...
  });
```

#### 2.3 Project Functions

**`functions/src/projects/on-project-created.ts`:**
```typescript
export const onProjectCreated = functions.firestore
  .document('projects/{projectId}')
  .onCreate(async (snap, context) => {
    const project = snap.data();

    // Send notification to admins for approval
    await notifyAdminsForApproval(project);

    // Create audit trail entry
    await createAuditTrailEntry({
      action: 'project_created',
      projectId: context.params.projectId,
      userId: project.creatorId,
      timestamp: admin.firestore.FieldValue.serverTimestamp(),
    });
  });
```

**`functions/src/projects/approve-project.ts`:**
```typescript
export const approveProject = functions.https.onCall(async (data, context) => {
  // Vérifier admin
  if (!context.auth) throw new Error('Unauthorized');

  const userDoc = await admin.firestore()
    .collection('users')
    .doc(context.auth.uid)
    .get();

  if (userDoc.data()?.role !== 'admin') {
    throw new Error('Forbidden');
  }

  const { projectId, approved } = data;

  // Update project status
  await admin.firestore().collection('projects').doc(projectId).update({
    status: approved ? 'approved' : 'rejected',
    updatedAt: admin.firestore.FieldValue.serverTimestamp(),
  });

  // Notify project creator
  await sendNotificationToCreator(projectId, approved);

  return { success: true };
});
```

#### 2.4 Audit Functions

**À créer:**
- `assign-audit.ts` - Assigner audit à un auditeur
- `on-milestone-submitted.ts` - Trigger quand milestone soumis
- `on-audit-completed.ts` - Trigger quand audit terminé
- `release-funds.ts` - Libérer fonds après approval audit

#### 2.5 User Functions

**À créer:**
- `on-user-created.ts` - Trigger création user (email bienvenue)
- `update-kyc-status.ts` - Mettre à jour statut KYC via Sumsub

#### 2.6 Analytics Functions

**À créer:**
- `generate-analytics.ts` - Générer analytics utilisateur/plateforme
- `create-audit-trail.ts` - Enregistrer actions importantes

---

### 3. DATA LAYERS - TOUS LES MODULES

#### 3.1 PROJECTS MODULE COMPLET

**Domain Layer:**

**`lib/features/projects/domain/usecases/create_project_usecase.dart`:**
```dart
class CreateProjectUseCase {
  final ProjectsRepository repository;

  CreateProjectUseCase(this.repository);

  Future<Result<Project>> call({
    required String name,
    required String description,
    required ProjectCategory category,
    required double fundingGoal,
    required int duration,
    required List<Milestone> milestones,
    required File coverImage,
    required List<File> additionalImages,
  }) async {
    // Validation
    if (milestones.length > 3) {
      return Result.failure('Maximum 3 milestones allowed');
    }

    // Upload images
    final coverImageUrl = await _uploadCoverImage(coverImage);
    final additionalImageUrls = await _uploadAdditionalImages(additionalImages);

    // Create project
    final project = Project(
      name: name,
      description: description,
      category: category,
      fundingGoal: fundingGoal,
      duration: duration,
      milestones: milestones,
      coverImageUrl: coverImageUrl,
      additionalImages: additionalImageUrls,
      status: ProjectStatus.draft,
    );

    return await repository.createProject(project);
  }
}
```

**Autres use cases à créer:**
- `update_project_usecase.dart`
- `submit_project_usecase.dart` - Soumettre pour approval
- `publish_project_usecase.dart` - Publier après approval
- `delete_project_usecase.dart`
- `get_project_detail_usecase.dart`
- `search_projects_usecase.dart`

**Data Layer:**

**`lib/features/projects/data/datasources/projects_firestore_datasource.dart`:**
```dart
class ProjectsFirestoreDataSource {
  final FirebaseFirestore _firestore;

  ProjectsFirestoreDataSource(this._firestore);

  Future<void> createProject(ProjectModel project) async {
    await _firestore.collection('projects').add(project.toJson());
  }

  Future<void> updateProject(String id, Map<String, dynamic> data) async {
    await _firestore.collection('projects').doc(id).update(data);
  }

  Future<ProjectModel?> getProject(String id) async {
    final doc = await _firestore.collection('projects').doc(id).get();
    if (!doc.exists) return null;
    return ProjectModel.fromJson(doc.data()!);
  }

  Stream<List<ProjectModel>> getProjects({
    ProjectCategory? category,
    ProjectStatus? status,
    String? creatorId,
  }) {
    Query query = _firestore.collection('projects');

    if (category != null) {
      query = query.where('category', isEqualTo: category.name);
    }
    if (status != null) {
      query = query.where('status', isEqualTo: status.name);
    }
    if (creatorId != null) {
      query = query.where('creatorId', isEqualTo: creatorId);
    }

    return query.snapshots().map((snapshot) =>
      snapshot.docs.map((doc) =>
        ProjectModel.fromJson(doc.data() as Map<String, dynamic>)
      ).toList()
    );
  }

  Future<void> deleteProject(String id) async {
    await _firestore.collection('projects').doc(id).delete();
  }
}
```

**`lib/features/projects/data/datasources/projects_storage_datasource.dart`:**
```dart
class ProjectsStorageDataSource {
  final FirebaseStorageService _storage;

  Future<String> uploadCoverImage(File image, String projectId) async {
    final compressed = await _storage.compressImage(image);
    return await _storage.uploadFile(
      compressed,
      'projects/$projectId/images/cover.jpg',
    );
  }

  Future<List<String>> uploadAdditionalImages(
    List<File> images,
    String projectId,
  ) async {
    final urls = <String>[];
    for (var i = 0; i < images.length; i++) {
      final compressed = await _storage.compressImage(images[i]);
      final url = await _storage.uploadFile(
        compressed,
        'projects/$projectId/images/additional_$i.jpg',
      );
      urls.add(url);
    }
    return urls;
  }
}
```

**`lib/features/projects/data/repositories/projects_repository_impl.dart`:**
```dart
class ProjectsRepositoryImpl implements ProjectsRepository {
  final ProjectsFirestoreDataSource _firestoreDataSource;
  final ProjectsStorageDataSource _storageDataSource;

  ProjectsRepositoryImpl(this._firestoreDataSource, this._storageDataSource);

  @override
  Future<Result<Project>> createProject(Project project) async {
    try {
      // Convert to model and save
      final model = ProjectModel.fromEntity(project);
      await _firestoreDataSource.createProject(model);
      return Result.success(project);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }

  // Implémenter toutes les méthodes de l'interface...
}
```

**Providers:**

**`lib/features/projects/presentation/providers/projects_providers.dart`:**
```dart
@riverpod
ProjectsFirestoreDataSource projectsFirestoreDataSource(
  ProjectsFirestoreDataSourceRef ref,
) {
  return ProjectsFirestoreDataSource(FirebaseFirestore.instance);
}

@riverpod
ProjectsStorageDataSource projectsStorageDataSource(
  ProjectsStorageDataSourceRef ref,
) {
  return ProjectsStorageDataSource(FirebaseStorageService.instance);
}

@riverpod
ProjectsRepository projectsRepository(ProjectsRepositoryRef ref) {
  return ProjectsRepositoryImpl(
    ref.watch(projectsFirestoreDataSourceProvider),
    ref.watch(projectsStorageDataSourceProvider),
  );
}

@riverpod
CreateProjectUseCase createProjectUseCase(CreateProjectUseCaseRef ref) {
  return CreateProjectUseCase(ref.watch(projectsRepositoryProvider));
}

// Stream de tous les projets actifs
@riverpod
Stream<List<Project>> activeProjects(ActiveProjectsRef ref) {
  final repository = ref.watch(projectsRepositoryProvider);
  return repository.getProjects(status: ProjectStatus.fundingActive);
}

// Stream des projets d'un créateur
@riverpod
Stream<List<Project>> creatorProjects(
  CreatorProjectsRef ref,
  String creatorId,
) {
  final repository = ref.watch(projectsRepositoryProvider);
  return repository.getProjects(creatorId: creatorId);
}
```

#### 3.2 MILESTONES MODULE COMPLET (NOUVEAU)

**Créer toute la structure:**
```
lib/features/milestones/
├── domain/
│   ├── entities/
│   │   ├── milestone.dart
│   │   ├── evidence.dart
│   │   └── milestone_deadline.dart
│   ├── repositories/
│   │   └── milestones_repository.dart
│   └── usecases/
│       ├── submit_evidence_usecase.dart
│       ├── request_review_usecase.dart
│       └── track_deadline_usecase.dart
├── data/
│   ├── models/
│   │   ├── milestone_model.dart
│   │   └── evidence_model.dart
│   ├── datasources/
│   │   ├── milestones_firestore_datasource.dart
│   │   └── evidence_storage_datasource.dart
│   └── repositories/
│       └── milestones_repository_impl.dart
└── presentation/
    ├── screens/
    │   ├── milestone_detail_screen.dart
    │   ├── submit_evidence_screen.dart
    │   └── milestone_timeline_screen.dart
    ├── widgets/
    │   ├── timeline_visualization_widget.dart
    │   ├── evidence_upload_widget.dart
    │   ├── deadline_tracker_widget.dart
    │   └── milestone_status_indicator.dart
    └── providers/
        ├── milestone_providers.dart
        └── evidence_upload_providers.dart
```

**Logique critique:**
- Upload evidence (camera + gallery + documents)
- Offline queue avec retry automatique
- Timeline visualization
- Notifications deadlines (7 jours, 1 jour)
- Changement statut: pending → submitted → under_review → approved/rejected

#### 3.3 AUDITS MODULE COMPLET (NOUVEAU)

**Créer toute la structure similaire à Milestones**

**Screens critiques:**
1. `audits_list_screen.dart` - Liste des audits assignés
2. `audit_detail_screen.dart` - Détail audit avec evidence
3. `evidence_review_screen.dart` - Gallery pour review evidence
4. `scoring_screen.dart` - Interface de scoring 0-100

**Widgets critiques:**
1. `evidence_gallery_widget.dart` - Swipe entre images/videos
2. `scoring_slider_widget.dart` - Slider avec haptic feedback
3. `comment_editor_widget.dart` - Rich text editor pour commentaires
4. `verdict_selector_widget.dart` - Approve/Reject radio buttons

**Logique:**
- Assignment automatique via Cloud Function
- Scoring 0-100 obligatoire
- Commentaires obligatoires
- Changement statut milestone après verdict
- Libération fonds si approved (via Stripe/Cloud Function)

#### 3.4 CONTRIBUTIONS MODULE (Compléter)

**Screens manquants:**
1. `contribute_screen.dart` - Flow complet contribution
2. `payment_method_screen.dart` - Sélection moyen paiement
3. `payment_confirm_screen.dart` - Confirmation avant paiement
4. `contribution_success_screen.dart` - Success + receipt

**Widgets:**
1. `preset_amounts_widget.dart` - Boutons 25€, 50€, 100€, 250€, 500€
2. `stripe_card_input_widget.dart` - Input carte avec validation
3. `apple_pay_button.dart` - Bouton Apple Pay (iOS)
4. `google_pay_button.dart` - Bouton Google Pay (Android)

**Flow complet:**
```
Browse Project → Tap "Contribute"
    ↓
Select Amount (preset ou custom)
    ↓
Select Payment Method (Card, Apple Pay, Google Pay)
    ↓
Enter Card Details OU One-tap Apple/Google Pay
    ↓
Confirm Payment
    ↓
Success Screen + Receipt
```

#### 3.5 ADMIN MODULE (Compléter)

**Remplacer TOUS les placeholders:**

1. **User Management Screen:**
   - Table utilisateurs avec filtres (role, status, date)
   - Actions: Suspend, Activate, Change Role, Delete
   - Search utilisateurs
   - Détails utilisateur avec activité

2. **Project Management Screen:**
   - Liste projets pending approval
   - Actions: Approve, Reject, Request Changes
   - Modération projets actifs
   - Stats projets (funding, status, etc.)

3. **Platform Analytics Screen:**
   - Charts interactifs (fl_chart)
   - KPIs: Users actifs, Contributions total, Projects actifs
   - Filtres temporels (jour, semaine, mois, année)
   - Export CSV/PDF

#### 3.6 Features avec Data Layer Manquant

**Pour CHACUNE de ces features, créer:**
- Data sources (Firestore)
- Repository implementation
- Providers Riverpod
- Connexion aux screens existants

**Features:**
1. **Analytics** - Connecter aux vraies données Firebase Analytics
2. **Impact** - Connecter projets/milestones pour calculer impact réel
3. **Transactions** - Connecter Stripe pour historique transactions
4. **Settings** - Persistence des préférences utilisateur
5. **Notifications** - Connecter Firebase Messaging
6. **Help & Support** - Système de tickets Firestore
7. **Organizations** - Dashboard créateurs avec vraies données
8. **Compliance** - Audit trail avec Firestore

---

### 4. UI - TOUS LES ÉCRANS MANQUANTS

#### 4.1 Projects UI

**Créer:**
1. `project_detail_screen.dart`:
   - Tabs: Overview, Milestones, Impact, Contributors
   - Bouton "Contribute" fonctionnel
   - Bouton "Share" fonctionnel
   - Bouton "Favorite" (déjà fait dans browse_projects)
   - Charts funding progress
   - Timeline milestones

2. `create_project_screen.dart`:
   - **Mobile:** Multi-step wizard (4 étapes)
     - Step 1: Basic Info (nom, description, catégorie)
     - Step 2: Milestones (max 3)
     - Step 3: Images (cover + 3 additional)
     - Step 4: Review & Submit
   - **Web:** Form complet avec drag-and-drop images
   - **Tablet:** 2 colonnes (form + preview temps réel)
   - Validation progressive
   - Auto-save draft (localStorage)

3. `edit_project_screen.dart`:
   - Similaire create mais avec données existantes
   - Seulement pour projets draft ou pending

#### 4.2 Milestones UI

**Créer tous les écrans listés section 3.2**

#### 4.3 Audits UI

**Créer tous les écrans listés section 3.3**

#### 4.4 Payments UI

**Créer tous les écrans listés section 3.4**

#### 4.5 Fonctionnalités TOUS Boutons Existants

**AUDIT COMPLET DE L'UI - Rendre TOUS les boutons fonctionnels:**

**Dans `browse_projects_screen.dart`:**
- [x] Favorite button - DÉJÀ FONCTIONNEL
- [x] Share button - DÉJÀ FONCTIONNEL
- [ ] Filter button - Connecter aux vrais filtres Firestore
- [ ] Sort options - Implémenter tri réel
- [ ] "Load More" button - DÉJÀ FONCTIONNEL
- [ ] Project card tap - Naviguer vers project_detail (À CRÉER)

**Dans `investments_screen.dart`:**
- [ ] Tab navigation (Overview, Portfolio, Performance, History, Receipts, Preferences)
- [ ] Export button → Générer PDF/CSV
- [ ] Filter par date → Implémenter
- [ ] Refresh button → Reload données
- [ ] Contribution row tap → Voir détails contribution

**Dans `user_profile_screen.dart`:**
- [ ] Edit profile button → Naviguer vers edit_profile_screen (À CRÉER)
- [ ] Upload avatar button → Image picker + upload
- [ ] Achievements tap → Détails achievement
- [ ] Activity item tap → Détails activité

**Dans `settings_screen.dart`:**
- [ ] Tous les toggles → Persistence Firestore
- [ ] Language selector → Changer locale app
- [ ] Theme toggle → Dark/Light mode
- [ ] Notification preferences → Sauvegarder dans Firestore
- [ ] Logout button → Implémenter déconnexion propre
- [ ] Delete account → Confirmation + suppression Firestore + Auth

**Dans `dashboard_screen.dart`:**
- [ ] View all projects button → Naviguer browse_projects
- [ ] View all contributions button → Naviguer investments
- [ ] Quick actions buttons → Implémenter actions
- [ ] Notification bell → Naviguer notifications avec badge count

**Dans `notifications_screen.dart`:**
- [ ] Mark as read button → Update Firestore
- [ ] Delete notification → Supprimer Firestore
- [ ] Notification tap → Naviguer vers ressource (project, contribution, etc.)
- [ ] Mark all as read → Batch update Firestore

**Dans `analytics_dashboard_screen.dart`:**
- [ ] Date range selector → Filter données
- [ ] Export button → PDF/CSV
- [ ] Chart interactions → Tooltips, zoom
- [ ] Filters → Appliquer aux queries Firestore

**Dans `impact_dashboard_screen.dart`:**
- [ ] SDG selector → Filter projets par SDG
- [ ] Beneficiaries counter → Calculer depuis milestones
- [ ] Impact metrics → Calculer depuis projets complétés
- [ ] Reports download → Générer PDF

**Dans `transactions_screen.dart`:**
- [ ] Transaction row tap → Détails transaction
- [ ] Filter par type → Implémenter
- [ ] Export button → CSV/PDF
- [ ] Receipt download → Générer PDF receipt

**Dans `help_support_screen.dart`:**
- [ ] FAQ item tap → Expand/collapse
- [ ] Contact support button → Ouvrir ticket system
- [ ] Live chat button → Intégrer chat (ou désactiver si pas implémenté)
- [ ] Search help → Filter FAQs

**Dans `organization_dashboard_screen.dart`:**
- [ ] View project details → Naviguer project_detail
- [ ] Manage milestones → Naviguer milestone_timeline
- [ ] View contributors → Liste contributeurs
- [ ] Communication tools → Message contributors (À CRÉER ou désactiver)

---

### 5. TESTS - >80% COVERAGE

**Structure à créer:**
```
test/
├── unit/
│   ├── core/
│   │   ├── services/
│   │   │   ├── stripe_service_test.dart
│   │   │   ├── storage_service_test.dart
│   │   │   └── messaging_service_test.dart
│   │   └── utils/
│   │       ├── platform_detector_test.dart
│   │       └── responsive_utils_test.dart
│   ├── features/
│   │   ├── auth/
│   │   │   ├── domain/
│   │   │   │   └── usecases/
│   │   │   │       ├── sign_in_usecase_test.dart
│   │   │   │       └── register_usecase_test.dart
│   │   │   ├── data/
│   │   │   │   └── repositories/
│   │   │   │       └── auth_repository_impl_test.dart
│   │   │   └── presentation/
│   │   │       └── providers/
│   │   │           └── auth_providers_test.dart
│   │   ├── projects/
│   │   │   ├── domain/
│   │   │   │   └── usecases/
│   │   │   │       ├── create_project_usecase_test.dart
│   │   │   │       └── submit_project_usecase_test.dart
│   │   │   └── data/
│   │   │       └── repositories/
│   │   │           └── projects_repository_impl_test.dart
│   │   └── ... (tous les autres features)
├── widget/
│   ├── adaptive/
│   │   ├── adaptive_button_test.dart
│   │   ├── adaptive_text_field_test.dart
│   │   └── ... (tous les 16 adaptive widgets)
│   ├── responsive/
│   │   └── responsive_layout_test.dart
│   └── features/
│       ├── auth/
│       │   ├── login_page_test.dart
│       │   └── register_page_test.dart
│       └── projects/
│           ├── browse_projects_screen_test.dart
│           └── create_project_screen_test.dart
├── integration_test/
│   ├── auth_flow_test.dart (EXISTE déjà)
│   ├── project_creation_flow_test.dart
│   ├── contribution_flow_test.dart
│   ├── milestone_submission_flow_test.dart
│   ├── audit_review_flow_test.dart
│   └── admin_moderation_flow_test.dart
└── helpers/
    ├── mock_firebase.dart
    ├── mock_stripe.dart
    ├── test_data.dart
    └── widget_test_helpers.dart
```

**Pour CHAQUE test:**
```dart
// Unit test example
void main() {
  group('CreateProjectUseCase', () {
    late MockProjectsRepository mockRepository;
    late CreateProjectUseCase useCase;

    setUp(() {
      mockRepository = MockProjectsRepository();
      useCase = CreateProjectUseCase(mockRepository);
    });

    test('should create project successfully', () async {
      // Arrange
      when(mockRepository.createProject(any))
          .thenAnswer((_) async => Result.success(mockProject));

      // Act
      final result = await useCase.call(
        name: 'Test Project',
        description: 'Test Description',
        // ...
      );

      // Assert
      expect(result.isSuccess, true);
      verify(mockRepository.createProject(any)).called(1);
    });

    test('should fail when more than 3 milestones', () async {
      // Test validation
    });

    test('should handle repository errors', () async {
      // Test error handling
    });
  });
}
```

---

### 6. OPTIMISATIONS & POLISH

#### 6.1 Performance

- [ ] Lazy loading images (cached_network_image)
- [ ] Pagination Firestore (limit + startAfter)
- [ ] Debounce search inputs
- [ ] Optimize build methods (const where possible)
- [ ] Profile app avec DevTools
- [ ] Reduce widget rebuilds (ConsumerStatefulWidget vs Consumer)

#### 6.2 Animations

**Créer dans `lib/shared/animations/`:**
- `page_transitions.dart` - Transitions adaptatives
- `loading_animations.dart` - Skeletons, shimmers
- `success_animations.dart` - Animations success (Lottie?)
- `error_animations.dart` - Shake, error states

#### 6.3 Error Handling

**Créer `lib/core/error/`:**
- `error_handler.dart` - Gestionnaire global erreurs
- `custom_exceptions.dart` - Exceptions custom
- `error_widgets.dart` - Widgets d'erreur réutilisables

#### 6.4 Internationalization

**Compléter:**
- `lib/l10n/app_en.arb` - Toutes les strings en anglais
- `lib/l10n/app_fr.arb` - Toutes les strings en français
- Générer avec `flutter gen-l10n`

**Strings manquantes:**
- Tous les textes des nouveaux écrans
- Messages d'erreur
- Notifications
- Emails

#### 6.5 Accessibility

- [ ] Tous les widgets ont semanticLabel
- [ ] Contrast ratios WCAG AA minimum
- [ ] Focus indicators visibles
- [ ] Screen reader testing complet
- [ ] Keyboard navigation web

---

### 7. DOCUMENTATION CODE

#### 7.1 DartDoc Comments

**Ajouter pour TOUS:**
- Classes publiques
- Méthodes publiques
- Propriétés publiques

```dart
/// Creates a new project in the system.
///
/// This method validates the project data, uploads images to Firebase Storage,
/// and creates the project document in Firestore with status 'draft'.
///
/// Returns [Result.success] with the created [Project] if successful,
/// or [Result.failure] with an error message if validation fails or
/// an exception occurs.
///
/// Throws [ValidationException] if project data is invalid.
/// Throws [StorageException] if image upload fails.
///
/// Example:
/// ```dart
/// final result = await useCase.call(
///   name: 'My Project',
///   description: 'Description',
///   // ...
/// );
/// ```
Future<Result<Project>> call({...}) async {
  // ...
}
```

#### 7.2 README Updates

**Mettre à jour `README.md` avec:**
- Description projet
- Features implémentées
- Screenshots
- Installation rapide
- Contribution guidelines
- License

#### 7.3 Architecture Documentation

**Créer `docs/ARCHITECTURE.md`:**
- Schéma architecture (Clean + Riverpod)
- Patterns utilisés
- Structure dossiers expliquée
- Flux de données
- Décisions architecturales (ADR)

---

### 8. SCRIPTS & OUTILS

#### 8.1 Script Création Utilisateurs Test

**`scripts/create_test_users.dart`:**
```dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> main() async {
  await createTestUsers();
}

Future<void> createTestUsers() async {
  // Détails dans SETUP_DEVELOPMENT.md
  // 4 users: investor, creator, auditor, admin
}
```

**Exécuter:**
```bash
dart run scripts/create_test_users.dart
```

#### 8.2 Script Création Données Test

**`scripts/seed_test_data.dart`:**
```dart
Future<void> seedTestData() async {
  await createTestProjects();
  await createTestContributions();
  await createTestMilestones();
  await createTestAudits();
}
```

#### 8.3 Script Génération Assets

**`scripts/generate_assets.sh`:**
```bash
#!/bin/bash
# Optimize images
find assets/images -name "*.png" -exec pngquant --ext .png --force 256 {} \;

# Generate launcher icons
flutter pub run flutter_launcher_icons:main

# Generate splash screens
flutter pub run flutter_native_splash:create
```

---

### 9. CI/CD

#### 9.1 GitHub Actions

**Créer `.github/workflows/ci.yml`:**
```yaml
name: CI

on:
  push:
    branches: [main, develop]
  pull_request:
    branches: [main, develop]

jobs:
  analyze:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: subosito/flutter-action@v2
      - run: flutter pub get
      - run: flutter analyze

  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: subosito/flutter-action@v2
      - run: flutter pub get
      - run: flutter test --coverage
      - run: genhtml coverage/lcov.info -o coverage/html
      - name: Upload coverage
        uses: codecov/codecov-action@v3

  build-android:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: subosito/flutter-action@v2
      - run: flutter build apk --debug

  build-ios:
    runs-on: macos-latest
    steps:
      - uses: actions/checkout@v3
      - uses: subosito/flutter-action@v2
      - run: flutter build ios --debug --no-codesign

  build-web:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: subosito/flutter-action@v2
      - run: flutter build web --release
```

**Créer `.github/workflows/deploy.yml`:**
```yaml
name: Deploy

on:
  push:
    tags:
      - 'v*'

jobs:
  deploy-web:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: subosito/flutter-action@v2
      - run: flutter build web --release
      - name: Deploy to Firebase Hosting
        uses: FirebaseExtended/action-hosting-deploy@v0
        with:
          repoToken: '${{ secrets.GITHUB_TOKEN }}'
          firebaseServiceAccount: '${{ secrets.FIREBASE_SERVICE_ACCOUNT }}'
          channelId: live
```

---

## 🎯 PRIORISATION RECOMMANDÉE

**Si temps limité, implémenter dans CET ORDRE:**

### Semaine 1:
1. ✅ Core Services (Stripe, Storage, Messaging)
2. ✅ Cloud Functions critiques (Stripe webhook, notifications)
3. ✅ Projects Data Layer complet
4. ✅ Projects UI (detail + create)

### Semaine 2:
5. ✅ Contributions Data Layer + UI complète
6. ✅ Milestones Module complet (data + UI)

### Semaine 3:
7. ✅ Audits Module complet (data + UI)
8. ✅ Admin Module UI (user management, project moderation)

### Semaine 4:
9. ✅ Compléter data layers 8 features restantes
10. ✅ Rendre fonctionnels TOUS boutons UI existants

### Semaine 5-6:
11. ✅ Tests unitaires + widget (>80% coverage)
12. ✅ Tests d'intégration flows complets
13. ✅ Polish UI/UX (animations, error handling)

---

## ✅ CHECKLIST FINALE COMPLÉTUDE

**Avant de considérer l'app "complète":**

**Infrastructure:**
- [ ] Tous packages installés sans erreurs
- [ ] `flutter analyze` → 0 errors, 0 warnings
- [ ] `flutter pub run build_runner build` → Success
- [ ] Firebase Storage activé et testé
- [ ] Firebase Messaging activé et testé
- [ ] Stripe initialisé et testé

**Core Services:**
- [ ] StripeService fonctionnel (paiements test réussis)
- [ ] FirebaseStorageService fonctionnel (upload/download OK)
- [ ] FirebaseMessagingService fonctionnel (notifications reçues)
- [ ] EnvConfig chargé correctement

**Cloud Functions:**
- [ ] Toutes fonctions compilent (`npm run build`)
- [ ] Webhook Stripe configuré et testé
- [ ] Notifications envoyées avec succès
- [ ] Project approval fonctionne
- [ ] Audit assignment fonctionne

**Data Layers:**
- [ ] Projects: CRUD complet fonctionnel
- [ ] Milestones: CRUD + evidence upload fonctionnel
- [ ] Audits: CRUD + scoring fonctionnel
- [ ] Contributions: Create + Stripe integration fonctionnel
- [ ] Admin: User/Project management fonctionnel
- [ ] 8 autres features: Data layers connectés

**UI:**
- [ ] Tous écrans Projects créés et fonctionnels
- [ ] Tous écrans Milestones créés et fonctionnels
- [ ] Tous écrans Audits créés et fonctionnels
- [ ] Tous écrans Payments créés et fonctionnels
- [ ] AUCUN bouton placeholder (tous fonctionnels)
- [ ] AUCUNE navigation cassée
- [ ] Responsive sur mobile/tablet/desktop

**Tests:**
- [ ] Coverage global >80%
- [ ] Tous tests unitaires passent
- [ ] Tous tests widget passent
- [ ] Tous tests integration passent
- [ ] Tests manuels sur Android réussis
- [ ] Tests manuels sur iOS réussis
- [ ] Tests manuels sur Web réussis

**Documentation:**
- [ ] SETUP_DEVELOPMENT.md complet
- [ ] SETUP_PRODUCTION.md complet
- [ ] README.md à jour
- [ ] ARCHITECTURE.md créé
- [ ] Tous fichiers ont DartDoc comments

**Polish:**
- [ ] Animations fluides
- [ ] Error handling robuste
- [ ] Loading states partout
- [ ] Internationalisation (EN + FR)
- [ ] Accessibility WCAG AA

**Production Ready:**
- [ ] Firestore rules déployées
- [ ] Cloud Functions déployées
- [ ] App testée avec vraies données
- [ ] Performance optimisée (Lighthouse >90)
- [ ] Aucun warning de sécurité

---

## 📊 ESTIMATION EFFORT

**Total estimation:** ~300-400 heures de développement

- Core Services: 20h
- Cloud Functions: 40h
- Data Layers: 80h
- UI Screens: 100h
- Boutons fonctionnels: 30h
- Tests: 60h
- Documentation: 20h
- Polish & Optimisations: 40h
- Debug & Fixes: 50h

**Avec 1 développeur à temps plein:** 8-10 semaines
**Avec 2 développeurs:** 4-5 semaines
**Avec AI assistance (Claude):** 2-3 semaines intensives

---

## 🚀 COMMENCER MAINTENANT

**Prochaine action immédiate:**

```bash
# 1. Installer dépendances
cd /home/user/social-impact-frontend
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs

# 2. Créer .env
cp .env.example .env
# Remplir avec vraies clés

# 3. Lancer émulateurs Firebase
firebase emulators:start

# 4. Lancer app
flutter run

# 5. Commencer implémentation dans l'ordre:
# → Core Services (Stripe, Storage, Messaging)
```

**Bonne chance ! 🎉**
