# Flutter Frontend Development - Complete Implementation Prompt

## 🎯 Mission Objective

You are an AI agent tasked with **completing the Flutter frontend development** for the Social Impact Platform. Your goal is to deliver a **100% functional, production-ready mobile application** that seamlessly integrates with the existing Firebase backend.

---

## 📂 Critical Resources Available to You

### Backend Integration Documentation (MUST READ - Priority Order)

Located in: `docs/backend/`

1. **START HERE: `README_FRONTEND_DOCS.md`**
   - Complete overview of the backend system
   - Framework compatibility guide
   - Quick start instructions
   - **READ THIS FIRST** to understand the system architecture

2. **`DOCUMENTATION_INDEX.md`**
   - System architecture diagrams
   - Feature overview
   - Financial configuration
   - Security features
   - Complete documentation map

3. **`API_ENDPOINTS_REFERENCE.md`** ⭐ CRITICAL
   - All 20+ API endpoints documented
   - Complete request/response formats
   - Authentication requirements
   - Working code examples (adapt from TypeScript to Dart)
   - Error handling patterns

4. **`TYPESCRIPT_TYPES_REFERENCE.md`** ⭐ CRITICAL
   - Complete data models
   - Convert TypeScript interfaces to Dart classes
   - User, Project, Contribution, Audit types
   - Enum definitions
   - Constants and configuration

5. **`FRONTEND_API_DOCUMENTATION.md`**
   - Authentication flow implementation
   - API client architecture
   - State management patterns
   - Protected routes logic

6. **`QUICK_START_GUIDE.md`**
   - Step-by-step integration examples
   - Common use cases with code
   - Testing strategies
   - Deployment guidelines

### Frontend Specifications (Your Requirements)

Located in: `docs/frontend-specs/`

**Available specification documents:**
- `description_mvp_mobile.md` - MVP description
- `frontend_ai_guide_mobile.md` - AI development guide
- `frontend_architecture_mobile.md` - Architecture specifications
- `frontend_development_plan_mobile.md` - Development plan
- `frontend_firebase_mobile.md` - Firebase integration specs
- `frontend_pages_mobile.md` - Page/screen specifications
- `frontend_uiux_mobile.md` - UI/UX guidelines
- `claude-rules.md` - Development rules

**READ ALL THESE DOCUMENTS** to understand the complete requirements.

---

## 📱 Project Context

### Current State Assessment Required

**Project Location**: `/mnt/d/Projets/Social Impact/social_impact_mvp/`

**Before starting, you MUST:**

1. **Analyze Existing Code**
   ```bash
   # Check what's already implemented
   find lib -name "*.dart" -type f | grep -v ".g.dart" | grep -v ".freezed.dart"

   # Analyze project structure
   tree lib/ -L 3 -I "generated|*.g.dart|*.freezed.dart"

   # Check dependencies
   cat pubspec.yaml

   # Review existing documentation
   ls -la docs/frontend-specs/
   cat README.md
   ```

2. **Identify Completed Features**
   - List all existing screens/pages
   - List all existing models/services
   - Check Firebase integration status
   - Document what's working vs. what's missing

3. **Create Status Report**
   - Create a file: `DEVELOPMENT_STATUS.md`
   - Document current completion percentage
   - List implemented features
   - List pending features
   - Identify any blockers or issues

### Technology Stack

**Confirmed Stack:**
- **Framework**: Flutter (Dart)
- **Backend**: Firebase (Auth, Firestore, Functions, Storage)
- **State Management**: Riverpod (check if already used, or implement)
- **API**: REST API + Firebase Callable Functions
- **Payments**: Stripe (via backend)
- **KYC**: Sumsub (via backend)

---

## 🏗️ Architecture Guidelines

### 1. Project Structure (Extend Existing)

```
lib/
├── main.dart
├── app/
│   ├── app.dart                    # Root app widget
│   └── routes.dart                 # App routing
├── core/                           # ALREADY EXISTS - extend it
│   ├── config/
│   │   ├── security_config.dart    # EXISTS
│   │   ├── firebase_config.dart    # ADD: Firebase initialization
│   │   └── app_config.dart         # ADD: Environment config
│   ├── constants/
│   │   ├── api_constants.dart      # ADD: API endpoints, URLs
│   │   ├── app_constants.dart      # ADD: App-wide constants
│   │   └── theme_constants.dart    # EXISTS (check themes/)
│   ├── router/                     # EXISTS
│   │   ├── app_router.dart         # EXISTS
│   │   └── route_names.dart        # EXISTS
│   ├── services/                   # EXISTS - extend
│   │   ├── firebase/               # EXISTS
│   │   ├── storage/                # EXISTS
│   │   └── biometric/              # EXISTS
│   ├── themes/                     # EXISTS
│   ├── utils/                      # EXISTS
│   ├── errors/
│   │   ├── exceptions.dart         # ADD: Custom exceptions
│   │   └── failures.dart           # ADD: Failure classes
│   └── navigation/                 # EXISTS
├── data/
│   ├── models/                     # ADD: Data models (from TypeScript types)
│   │   ├── user_model.dart
│   │   ├── project_model.dart
│   │   ├── contribution_model.dart
│   │   ├── audit_model.dart
│   │   └── notification_model.dart
│   ├── repositories/               # ADD: Data layer
│   │   ├── auth_repository.dart
│   │   ├── user_repository.dart
│   │   ├── project_repository.dart
│   │   ├── contribution_repository.dart
│   │   └── audit_repository.dart
│   └── providers/                  # ADD: Riverpod providers
│       ├── auth_provider.dart
│       ├── user_provider.dart
│       └── project_provider.dart
├── services/                       # ADD: API services
│   ├── api/
│   │   ├── api_client.dart        # HTTP client wrapper
│   │   ├── firebase_functions.dart # Callable functions
│   │   └── interceptors.dart       # Auth, logging interceptors
│   ├── auth_service.dart          # Firebase Auth wrapper
│   └── local_storage_service.dart # SharedPreferences/Hive
├── presentation/
│   ├── screens/                   # ADD: All app screens
│   │   ├── auth/
│   │   │   ├── login_screen.dart
│   │   │   ├── register_screen.dart
│   │   │   ├── complete_profile_screen.dart
│   │   │   └── kyc_verification_screen.dart
│   │   ├── home/
│   │   │   ├── home_screen.dart
│   │   │   └── dashboard_screen.dart
│   │   ├── projects/
│   │   │   ├── projects_list_screen.dart
│   │   │   ├── project_details_screen.dart
│   │   │   ├── create_project_screen.dart
│   │   │   └── edit_project_screen.dart
│   │   ├── contributions/
│   │   │   ├── contribute_screen.dart
│   │   │   ├── payment_screen.dart
│   │   │   └── contribution_history_screen.dart
│   │   ├── audits/
│   │   │   ├── auditor_dashboard_screen.dart
│   │   │   ├── audit_workspace_screen.dart
│   │   │   └── submit_audit_screen.dart
│   │   └── profile/
│   │       ├── profile_screen.dart
│   │       ├── settings_screen.dart
│   │       └── notifications_screen.dart
│   ├── widgets/                   # ADD: Reusable widgets
│   │   ├── common/
│   │   │   ├── loading_indicator.dart
│   │   │   ├── error_widget.dart
│   │   │   ├── empty_state.dart
│   │   │   └── custom_button.dart
│   │   ├── project/
│   │   │   ├── project_card.dart
│   │   │   ├── funding_progress.dart
│   │   │   └── milestone_item.dart
│   │   └── auth/
│   │       ├── auth_text_field.dart
│   │       └── auth_button.dart
│   └── theme/                     # EXISTS (check core/themes/)
└── l10n/                          # ADD: Internationalization
    ├── app_en.arb
    └── app_fr.arb
```

### 2. Data Models (Convert from TypeScript)

**CRITICAL TASK**: Convert all TypeScript types to Dart classes

Reference: `docs/backend/TYPESCRIPT_TYPES_REFERENCE.md`

**Example Conversion**:

TypeScript (from docs):
```typescript
interface UserProfile {
  uid: string;
  email: string;
  firstName: string;
  lastName: string;
  userType: 'contributor' | 'creator' | 'auditor';
  kyc: {
    status: string;
    level: number;
  };
}
```

Convert to Dart:
```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String uid,
    required String email,
    required String firstName,
    required String lastName,
    required UserType userType,
    required KycInfo kyc,
    required UserPreferences preferences,
    required UserStats stats,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}

enum UserType {
  @JsonValue('contributor')
  contributor,
  @JsonValue('creator')
  creator,
  @JsonValue('auditor')
  auditor,
  @JsonValue('admin')
  admin,
}

@freezed
class KycInfo with _$KycInfo {
  const factory KycInfo({
    required String status,
    required int level,
    String? externalId,
    DateTime? approvedAt,
  }) = _KycInfo;

  factory KycInfo.fromJson(Map<String, dynamic> json) =>
      _$KycInfoFromJson(json);
}

// ... continue for all types
```

**MUST CONVERT ALL THESE TYPES**:
- ✅ UserProfile and related types
- ✅ Project and related types (Milestone, ImpactGoals, etc.)
- ✅ Contribution and payment types
- ✅ Audit types
- ✅ Notification types
- ✅ All enums (UserType, ProjectStatus, etc.)

### 3. API Integration

**Reference**: `docs/backend/API_ENDPOINTS_REFERENCE.md`

#### API Client Setup

```dart
// services/api/api_client.dart
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ApiClient {
  final Dio _dio;
  final FirebaseAuth _auth;

  static const String baseUrl =
      'https://europe-west1-YOUR_PROJECT.cloudfunctions.net/api';
  static const String apiVersion = 'v2';

  ApiClient(this._dio, this._auth) {
    _dio.options.baseUrl = '$baseUrl/$apiVersion';
    _dio.interceptors.add(_authInterceptor());
    _dio.interceptors.add(_loggingInterceptor());
  }

  Interceptor _authInterceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) async {
        final user = _auth.currentUser;
        if (user != null) {
          final token = await user.getIdToken();
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
    );
  }

  // GET request
  Future<T> get<T>(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      final response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
      );
      return fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // POST request
  Future<T> post<T>(
    String endpoint, {
    required Map<String, dynamic> data,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      final response = await _dio.post(endpoint, data: data);
      return fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // ... PUT, DELETE methods

  Exception _handleError(DioException error) {
    // Map backend errors to app exceptions
    if (error.response?.statusCode == 401) {
      return UnauthorizedException(error.response?.data['message']);
    }
    // ... handle other errors
    return ServerException(error.message ?? 'Unknown error');
  }
}
```

#### Firebase Callable Functions

```dart
// services/api/firebase_functions.dart
import 'package:cloud_functions/cloud_functions.dart';

class FirebaseFunctionsService {
  final FirebaseFunctions _functions;

  FirebaseFunctionsService(this._functions);

  // Complete Profile
  Future<CompleteProfileResponse> completeProfile({
    required CompleteProfileRequest request,
  }) async {
    final callable = _functions.httpsCallable('completeProfile');
    final result = await callable.call(request.toJson());
    return CompleteProfileResponse.fromJson(result.data);
  }

  // Create Project
  Future<CreateProjectResponse> createProject({
    required CreateProjectRequest request,
  }) async {
    final callable = _functions.httpsCallable('createProject');
    final result = await callable.call(request.toJson());
    return CreateProjectResponse.fromJson(result.data);
  }

  // Create Contribution
  Future<CreateContributionResponse> createContribution({
    required CreateContributionRequest request,
  }) async {
    final callable = _functions.httpsCallable('createContribution');
    final result = await callable.call(request.toJson());
    return CreateContributionResponse.fromJson(result.data);
  }

  // ... all other callable functions from docs/backend/API_ENDPOINTS_REFERENCE.md
}
```

### 4. Authentication Flow

**Reference**: `docs/backend/FRONTEND_API_DOCUMENTATION.md` Section 3
**Also check existing**: `lib/core/services/firebase/firebase_service.dart`

```dart
// data/repositories/auth_repository.dart
class AuthRepository {
  final FirebaseAuth _auth;
  final FirebaseFunctionsService _functions;
  final FirebaseFirestore _firestore;

  // Sign up
  Future<User> signUp({
    required String email,
    required String password,
  }) async {
    final credential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // Send verification email
    await credential.user!.sendEmailVerification();

    return credential.user!;
  }

  // Sign in
  Future<User> signIn({
    required String email,
    required String password,
  }) async {
    final credential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return credential.user!;
  }

  // Complete profile (after signup)
  Future<CompleteProfileResponse> completeProfile({
    required CompleteProfileRequest request,
  }) async {
    return await _functions.completeProfile(request: request);
  }

  // Get user profile
  Future<UserProfile> getUserProfile(String uid) async {
    final doc = await _firestore.collection('users').doc(uid).get();
    return UserProfile.fromJson(doc.data()!);
  }

  // Stream user profile
  Stream<UserProfile?> watchUserProfile(String uid) {
    return _firestore
        .collection('users')
        .doc(uid)
        .snapshots()
        .map((doc) =>
            doc.exists ? UserProfile.fromJson(doc.data()!) : null);
  }

  // Sign out
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
```

**Protected Routes Implementation**:
Check existing `lib/core/router/app_router.dart` and extend it.

### 5. State Management (Riverpod)

```dart
// data/providers/auth_provider.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@riverpod
Stream<User?> authStateChanges(AuthStateChangesRef ref) {
  return FirebaseAuth.instance.authStateChanges();
}

@riverpod
class UserProfile extends _$UserProfile {
  @override
  Future<UserProfileModel?> build() async {
    final user = ref.watch(authStateChangesProvider).value;
    if (user == null) return null;

    final repository = ref.read(authRepositoryProvider);
    return await repository.getUserProfile(user.uid);
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => build());
  }
}
```

---

## 🎨 UI/UX Implementation

**IMPORTANT**: Follow specifications in `docs/frontend-specs/`

### Core Screens to Implement

Reference your existing specs in `docs/frontend-specs/frontend_pages_mobile.md` and `docs/frontend-specs/frontend_uiux_mobile.md`

#### Authentication Flow (PRIORITY)
- ✅ **Login Screen** - Reference: frontend_pages_mobile.md
- ✅ **Register Screen** - Reference: frontend_pages_mobile.md
- ✅ **Complete Profile Screen** - Multi-step form (user type, personal info, address, preferences)
  - **API**: Call `completeProfile` function
- ✅ **KYC Verification Screen** - Sumsub integration
  - **API**: Call `initKYC` function

#### Main Features
- ✅ **Home/Dashboard** - Project discovery, stats
- ✅ **Projects List** - Browse, filter, search
- ✅ **Project Details** - Full info, milestones, contribute button
- ✅ **Create Project** - Multi-step wizard
- ✅ **Contribute Flow** - Amount, fees, Stripe payment
- ✅ **Profile & Settings** - User info, preferences, KYC status

---

## 🔐 Critical Implementation Requirements

### 1. Security
- ✅ Never store API keys in code (use environment variables)
- ✅ Always validate user input before API calls
- ✅ Implement proper error handling
- ✅ Use Firebase security rules (already configured backend)
- ✅ Sanitize displayed data (prevent XSS)

### 2. Payment Integration (Stripe)
```dart
// Use flutter_stripe package
import 'package:flutter_stripe/flutter_stripe.dart';

// Initialize in main.dart
void main() async {
  Stripe.publishableKey = 'pk_test_...'; // From environment
  runApp(MyApp());
}

// Payment flow
Future<void> processContribution(String projectId, int amount) async {
  // 1. Create contribution (get PaymentIntent)
  final contribution = await _functions.createContribution(
    request: CreateContributionRequest(
      projectId: projectId,
      amount: amount,
      // ...
    ),
  );

  // 2. Present payment sheet
  await Stripe.instance.initPaymentSheet(
    paymentSheetParameters: SetupPaymentSheetParameters(
      paymentIntentClientSecret: contribution.paymentIntent.clientSecret,
      merchantDisplayName: 'Social Impact Platform',
    ),
  );

  // 3. Display payment sheet
  await Stripe.instance.presentPaymentSheet();

  // 4. Confirm payment
  await _functions.confirmPayment(
    request: ConfirmPaymentRequest(
      paymentIntentId: contribution.paymentIntent.id,
      stripeClientSecret: contribution.paymentIntent.clientSecret,
    ),
  );
}
```

### 3. KYC Integration (Sumsub)
```dart
// Use sumsub_flutter package or WebView
// Get token from backend
final kycResponse = await _functions.initKYC(
  request: InitKYCRequest(kycLevel: 'basic'),
);

// Open Sumsub verification
// Use package or WebView with kycResponse.sumsubUrl
```

---

## 📦 Required Dependencies

Check existing `pubspec.yaml` and add missing:

```yaml
dependencies:
  flutter:
    sdk: flutter

  # State Management
  flutter_riverpod: ^2.4.9
  riverpod_annotation: ^2.3.3

  # Firebase
  firebase_core: ^2.24.2
  firebase_auth: ^4.15.3
  cloud_firestore: ^4.13.6
  cloud_functions: ^4.5.12
  firebase_storage: ^11.5.6

  # Networking
  dio: ^5.4.0

  # Payments
  flutter_stripe: ^10.1.1

  # UI
  go_router: ^13.0.0  # Check if already exists
  cached_network_image: ^3.3.1
  flutter_svg: ^2.0.9
  shimmer: ^3.0.0

  # Utilities
  freezed_annotation: ^2.4.1
  json_annotation: ^4.8.1
  intl: ^0.18.1

  # Local Storage (check if already exists)
  shared_preferences: ^2.2.2
  hive_flutter: ^1.1.0

dev_dependencies:
  flutter_test:
    sdk: flutter

  # Code Generation
  build_runner: ^2.4.7
  freezed: ^2.4.6
  json_serializable: ^6.7.1
  riverpod_generator: ^2.3.9

  # Linting
  flutter_lints: ^3.0.1
```

---

## 🎯 Development Workflow

### Phase 1: Analysis & Planning (Day 1)
1. ✅ Read ALL backend documentation in `docs/backend/`
2. ✅ Read ALL frontend specifications in `docs/frontend-specs/`
3. ✅ Analyze existing code in `lib/`
4. ✅ Review existing documentation (README.md, etc.)
5. ✅ Create `DEVELOPMENT_STATUS.md` with current state
6. ✅ Identify what needs to be built vs. what exists

### Phase 2: Core Implementation (Days 2-5)
1. ✅ Convert ALL TypeScript types to Dart models
2. ✅ Implement API client and Firebase Functions service
3. ✅ Extend authentication implementation
4. ✅ Enhance routing with protection
5. ✅ Implement state management providers

### Phase 3: UI Implementation (Days 6-12)
1. ✅ Authentication screens (extend or build from scratch)
2. ✅ Home & Dashboard
3. ✅ Projects screens (List, Details, Create)
4. ✅ Contribution flow with Stripe
5. ✅ Auditor features
6. ✅ Profile & Settings
7. ✅ Notifications

### Phase 4: Integration & Testing (Days 13-15)
1. ✅ End-to-end testing of all flows
2. ✅ Error handling polish
3. ✅ Loading states
4. ✅ Empty states
5. ✅ Accessibility
6. ✅ Internationalization (French + English)

### Phase 5: Polish & Deployment Prep (Days 16-17)
1. ✅ Performance optimization
2. ✅ UI/UX polish per specs
3. ✅ Documentation updates
4. ✅ Build APK/IPA for testing

---

## ✅ Definition of Done

Your work is complete when:

- [ ] All TypeScript types converted to Dart models
- [ ] All API endpoints integrated
- [ ] All screens from specifications implemented
- [ ] Authentication flow 100% working
- [ ] KYC verification working
- [ ] Project creation working
- [ ] Contribution flow with Stripe working
- [ ] Auditor features working
- [ ] All error cases handled gracefully
- [ ] Loading and empty states implemented
- [ ] App works offline (with cached data)
- [ ] French and English localization complete
- [ ] No console errors or warnings
- [ ] Code follows existing patterns in project
- [ ] All specs from `docs/frontend-specs/` implemented
- [ ] `DEVELOPMENT_STATUS.md` shows 100%

---

## 🚨 Critical Notes

### DO NOT:
- ❌ Skip reading the backend documentation
- ❌ Hardcode API keys or secrets
- ❌ Ignore error handling
- ❌ Skip TypeScript to Dart conversion
- ❌ Ignore existing code patterns
- ❌ Break existing working features

### DO:
- ✅ Read `docs/backend/README_FRONTEND_DOCS.md` FIRST
- ✅ Read ALL files in `docs/frontend-specs/`
- ✅ Reference `API_ENDPOINTS_REFERENCE.md` for every API call
- ✅ Convert ALL types from `TYPESCRIPT_TYPES_REFERENCE.md`
- ✅ Follow existing code structure and patterns
- ✅ Extend existing services (don't duplicate)
- ✅ Write clean, maintainable code
- ✅ Document complex logic

### When Blocked:
1. Check backend documentation again
2. Check frontend specifications
3. Look at existing code patterns
4. Document the blocker clearly

---

## 📞 Resources & Support

### Documentation Priority Order:
1. **Backend Integration**: `docs/backend/README_FRONTEND_DOCS.md`
2. **API Reference**: `docs/backend/API_ENDPOINTS_REFERENCE.md`
3. **Type Definitions**: `docs/backend/TYPESCRIPT_TYPES_REFERENCE.md`
4. **Frontend Specs**: `docs/frontend-specs/*` (ALL FILES)
5. **Existing Code**: `lib/` and existing documentation

### Project-Specific Docs:
- `README.md` - Project overview
- `AUTHENTICATION_TEST_PLAN.md` - Auth testing
- `SECURITY_VALIDATION_REPORT.md` - Security review

---

## 🎉 Success Criteria

A successful implementation means:

1. **Functional Completeness**: All features from specifications work
2. **Backend Integration**: All API endpoints properly integrated
3. **User Experience**: Smooth, intuitive, no crashes
4. **Code Quality**: Clean, maintainable, follows existing patterns
5. **Production Ready**: Can be deployed to stores
6. **Spec Compliance**: Matches all requirements in `docs/frontend-specs/`

---

## 🚀 Final Checklist Before Completion

- [ ] All screens from specs implemented
- [ ] All API integrations tested
- [ ] Authentication flow complete (signup → profile → KYC → dashboard)
- [ ] Project creation and contribution flows working
- [ ] Payment integration with Stripe working
- [ ] Error handling comprehensive
- [ ] Loading states everywhere
- [ ] Offline mode functional
- [ ] Localization (FR + EN) complete
- [ ] Performance optimized (smooth 60fps)
- [ ] Code follows existing project patterns
- [ ] Existing features still work
- [ ] `DEVELOPMENT_STATUS.md` updated to 100%
- [ ] Build tested on real device

---

## 💪 You Got This!

You have:
- ✅ Complete backend documentation (6 comprehensive files)
- ✅ Complete frontend specifications (8 detailed files)
- ✅ Full API reference with examples
- ✅ Complete type definitions
- ✅ Existing project structure to build on
- ✅ Production-ready backend
- ✅ This detailed implementation guide

**Everything you need to build an amazing app is at your fingertips.**

**Start by:**
1. Reading `docs/backend/README_FRONTEND_DOCS.md`
2. Reading all files in `docs/frontend-specs/`
3. Analyzing existing code in `lib/`
4. Creating `DEVELOPMENT_STATUS.md`

**Let's build something great! 🚀**

---

**Document Version**: 1.0
**Created**: 2024
**For**: Flutter Frontend AI Development Agent
**Project**: Social Impact Platform MVP
**Location**: `/mnt/d/Projets/Social Impact/social_impact_mvp/`
