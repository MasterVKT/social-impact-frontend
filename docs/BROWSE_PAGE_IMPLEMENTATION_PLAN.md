# Browse Page - Complete Implementation Plan
## Social Finance Impact Platform MVP

**Document Version**: 1.0
**Last Updated**: 2025-01-03
**Status**: Ready for Implementation
**Estimated Total Effort**: 6-8 weeks (full-time development)

---

## Table of Contents

1. [Overview](#overview)
2. [Architecture Principles](#architecture-principles)
3. [Prerequisites & Dependencies](#prerequisites--dependencies)
4. [Phase 0: Foundation & Refactoring](#phase-0-foundation--refactoring)
5. [Phase 1: Essential Features (P0)](#phase-1-essential-features-p0)
6. [Phase 2: Enhanced UX (P1)](#phase-2-enhanced-ux-p1)
7. [Phase 3: Platform-Specific (P2)](#phase-3-platform-specific-p2)
8. [Phase 4: Advanced Features (P3)](#phase-4-advanced-features-p3)
9. [Testing Strategy](#testing-strategy)
10. [Performance Benchmarks](#performance-benchmarks)
11. [Rollout Plan](#rollout-plan)

---

## Overview

This plan outlines the complete implementation of the Browse Projects page, addressing the 60% missing functionality identified in the comprehensive feature audit. The implementation follows Clean Architecture principles, Riverpod state management, and multi-platform adaptive design (Android, iOS, Web).

### Current State
- ✅ Basic layout structure (mobile/tablet/desktop)
- ✅ Simple search bar
- ✅ Category filter chips
- ✅ Basic project cards
- ✅ Navigation to project details

### Target State
- 100% feature-complete browse experience
- Advanced filtering and sorting
- Responsive, accessible, internationalized
- Analytics-instrumented
- Performance-optimized for all platforms
- AI-powered recommendations

---

## Architecture Principles

### MANDATORY RULES (from CLAUDE.md)

1. **Multi-Platform Compatibility**
   - EVERY component MUST work on Android, iOS, AND Web
   - Use ResponsiveLayout wrapper for ALL layouts
   - Apply PlatformDetector for platform-specific features
   - Implement adaptive styling per frontend specifications

2. **Clean Architecture + Riverpod**
   - Use @riverpod annotations for ALL providers
   - Implement freezed classes for ALL data models
   - Follow feature-based folder structure
   - Separate data/domain/presentation layers

3. **Testing Requirements**
   - Test on Android, iOS, AND Web after each component
   - Run `flutter test` and `flutter analyze` continuously
   - Achieve >80% test coverage before next phase
   - Widget tests for ALL UI components

4. **Absolute Prohibitions**
   - Never skip multi-platform validation
   - Never use platform-specific code without adaptive wrappers
   - Never proceed without testing responsive behavior
   - Never use static/mock data (must connect to real Firestore)

---

## Prerequisites & Dependencies

### 1. Backend Requirements

#### Firestore Collections Needed
```typescript
// projects collection - VERIFY schema
{
  id: string;
  title: string;
  shortDescription: string;
  longDescription: string;
  category: ProjectCategory; // enum
  status: ProjectStatus; // enum
  location: string;
  locationCoords?: GeoPoint;
  coverImageUrl: string;
  imageUrls: string[];
  creatorId: string;
  creatorName: string;
  organizationName?: string;
  fundingGoal: number;
  currentFunding: number;
  currency: 'EUR';
  contributorsCount: number;
  createdAt: Timestamp;
  updatedAt: Timestamp;
  endDate: Timestamp;
  featured: boolean;
  verified: boolean;
  riskLevel: 'low' | 'medium' | 'high';
  impactMetrics?: {
    type: string;
    value: number;
    unit: string;
  }[];
  minimumContribution: number;
  sdgGoals?: number[]; // UN SDG alignment
}

// user_favorites/{userId}/projects/{projectId}
{
  projectId: string;
  savedAt: Timestamp;
}

// project_views collection (for trending)
{
  projectId: string;
  userId?: string;
  viewedAt: Timestamp;
  sessionId: string;
}
```

#### Firestore Indexes Required
```javascript
// firestore.indexes.json additions
{
  "collectionGroup": "projects",
  "fields": [
    { "fieldPath": "status", "order": "ASCENDING" },
    { "fieldPath": "createdAt", "order": "DESCENDING" }
  ]
},
{
  "collectionGroup": "projects",
  "fields": [
    { "fieldPath": "category", "order": "ASCENDING" },
    { "fieldPath": "createdAt", "order": "DESCENDING" }
  ]
},
{
  "collectionGroup": "projects",
  "fields": [
    { "fieldPath": "status", "order": "ASCENDING" },
    { "fieldPath": "currentFunding", "order": "DESCENDING" }
  ]
},
{
  "collectionGroup": "projects",
  "fields": [
    { "fieldPath": "status", "order": "ASCENDING" },
    { "fieldPath": "featured", "order": "DESCENDING" },
    { "fieldPath": "createdAt", "order": "DESCENDING" }
  ]
}
```

#### Cloud Functions Needed
```typescript
// functions/src/projects/searchProjects.ts
export const searchProjects = functions.https.onCall(async (data, context) => {
  // Advanced search with Algolia or Firestore queries
  // Support pagination, filtering, sorting
});

// functions/src/projects/getTrendingProjects.ts
export const getTrendingProjects = functions.https.onCall(async (data, context) => {
  // Calculate trending based on views, contributions, shares
});

// functions/src/recommendations/getPersonalizedProjects.ts (Phase 4)
export const getPersonalizedProjects = functions.https.onCall(async (data, context) => {
  // AI-powered recommendations using Vertex AI
});
```

### 2. Flutter Dependencies

Add to `pubspec.yaml`:
```yaml
dependencies:
  # Existing dependencies
  flutter_riverpod: ^2.4.0
  riverpod_annotation: ^2.3.0
  freezed_annotation: ^2.4.1
  go_router: ^13.0.0

  # New dependencies for browse page
  infinite_scroll_pagination: ^4.0.0  # Pagination
  share_plus: ^7.2.0                   # Social sharing
  url_launcher: ^6.2.0                 # Deep linking
  cached_network_image: ^3.3.0         # Image caching (verify version)
  shimmer: ^3.0.0                      # Loading skeletons
  pull_to_refresh: ^2.0.0              # Pull-to-refresh
  speech_to_text: ^6.5.0               # Voice search (mobile)
  flutter_cache_manager: ^3.3.1        # Cache management
  shared_preferences: ^2.2.0           # Filter persistence
  geolocator: ^10.1.0                  # Location services

dev_dependencies:
  # Existing
  build_runner: ^2.4.0
  riverpod_generator: ^2.3.0
  freezed: ^2.4.0

  # Testing
  mockito: ^5.4.0
  integration_test:
    sdk: flutter
```

### 3. Assets & Localization

```yaml
# pubspec.yaml - assets
flutter:
  assets:
    - assets/images/
    - assets/icons/
    - assets/illustrations/empty_state.svg

  # Internationalization
  generate: true
```

Create/Update ARB files:
```
lib/l10n/
├── app_en.arb (English)
├── app_fr.arb (French - PRIMARY)
└── intl_*.arb (generated)
```

---

## Phase 0: Foundation & Refactoring

**Duration**: 1 week
**Priority**: CRITICAL (must complete before Phase 1)

### Goals
- Refactor existing code to follow Clean Architecture
- Establish proper state management with Riverpod
- Create reusable domain models and repositories
- Set up testing infrastructure

### Tasks

#### 0.1 Domain Layer Setup

**File**: `lib/features/projects/domain/entities/project_search_criteria.dart`

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_search_criteria.freezed.dart';
part 'project_search_criteria.g.dart';

@freezed
class ProjectSearchCriteria with _$ProjectSearchCriteria {
  const factory ProjectSearchCriteria({
    String? query,
    @Default([]) List<ProjectCategory> categories,
    @Default([]) List<ProjectStatus> statuses,
    double? minFunding,
    double? maxFunding,
    String? location,
    DateTime? startDate,
    DateTime? endDate,
    @Default([]) List<String> sdgGoals,
    String? riskLevel,
    bool? featured,
    bool? verified,
    ProjectSortBy? sortBy,
    SortOrder? sortOrder,
    int? limit,
    dynamic lastDocument, // For pagination
  }) = _ProjectSearchCriteria;

  factory ProjectSearchCriteria.fromJson(Map<String, dynamic> json) =>
      _$ProjectSearchCriteriaFromJson(json);
}

enum ProjectSortBy {
  createdAt,
  fundingAmount,
  progress,
  popularity,
  endingSoon,
  relevance,
}

enum SortOrder {
  ascending,
  descending,
}
```

**File**: `lib/features/projects/domain/entities/project.dart`

```dart
// REFACTOR existing Project entity to include ALL fields
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'project.freezed.dart';
part 'project.g.dart';

@freezed
class Project with _$Project {
  const factory Project({
    required String id,
    required String title,
    required String shortDescription,
    required String longDescription,
    required ProjectCategory category,
    required ProjectStatus status,
    required String location,
    GeoPoint? locationCoords,
    required String coverImageUrl,
    @Default([]) List<String> imageUrls,
    required String creatorId,
    required String creatorName,
    String? organizationName,
    required double fundingGoal,
    required double currentFunding,
    @Default('EUR') String currency,
    @Default(0) int contributorsCount,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? endDate,
    @Default(false) bool featured,
    @Default(false) bool verified,
    @Default('medium') String riskLevel,
    @Default([]) List<ImpactMetric> impactMetrics,
    @Default(25.0) double minimumContribution,
    @Default([]) List<int> sdgGoals,
    @Default(0) int viewsCount,
    @Default(0) int sharesCount,
  }) = _Project;

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);

  factory Project.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Project.fromJson({
      ...data,
      'id': doc.id,
      'createdAt': (data['createdAt'] as Timestamp).toDate().toIso8601String(),
      'updatedAt': (data['updatedAt'] as Timestamp).toDate().toIso8601String(),
      'endDate': data['endDate'] != null
          ? (data['endDate'] as Timestamp).toDate().toIso8601String()
          : null,
    });
  }
}

@freezed
class ImpactMetric with _$ImpactMetric {
  const factory ImpactMetric({
    required String type,
    required double value,
    required String unit,
  }) = _ImpactMetric;

  factory ImpactMetric.fromJson(Map<String, dynamic> json) =>
      _$ImpactMetricFromJson(json);
}

enum ProjectCategory {
  healthcare,
  education,
  environment,
  cleanEnergy,
  waterSanitation,
  financialInclusion,
}

enum ProjectStatus {
  draft,
  published,
  active,
  funded,
  completed,
  archived,
}

extension ProjectCategoryX on ProjectCategory {
  String get displayName {
    switch (this) {
      case ProjectCategory.healthcare:
        return 'Healthcare';
      case ProjectCategory.education:
        return 'Education';
      case ProjectCategory.environment:
        return 'Environment';
      case ProjectCategory.cleanEnergy:
        return 'Clean Energy';
      case ProjectCategory.waterSanitation:
        return 'Water & Sanitation';
      case ProjectCategory.financialInclusion:
        return 'Financial Inclusion';
    }
  }
}

extension ProjectStatusX on ProjectStatus {
  String get displayName {
    switch (this) {
      case ProjectStatus.draft:
        return 'Draft';
      case ProjectStatus.published:
        return 'Published';
      case ProjectStatus.active:
        return 'Active';
      case ProjectStatus.funded:
        return 'Funded';
      case ProjectStatus.completed:
        return 'Completed';
      case ProjectStatus.archived:
        return 'Archived';
    }
  }
}
```

#### 0.2 Repository Interface

**File**: `lib/features/projects/domain/repositories/projects_repository.dart`

```dart
import 'package:dartz/dartz.dart';
import '../entities/project.dart';
import '../entities/project_search_criteria.dart';
import '../../../../core/errors/failures.dart';

abstract class ProjectsRepository {
  /// Search projects with advanced filtering and pagination
  Future<Either<Failure, List<Project>>> searchProjects(
    ProjectSearchCriteria criteria,
  );

  /// Get a single project by ID
  Future<Either<Failure, Project>> getProject(String projectId);

  /// Get featured projects
  Future<Either<Failure, List<Project>>> getFeaturedProjects({
    int limit = 10,
  });

  /// Get trending projects (Phase 4)
  Future<Either<Failure, List<Project>>> getTrendingProjects({
    int limit = 10,
  });

  /// Save/favorite a project
  Future<Either<Failure, void>> saveProject(String projectId);

  /// Unsave/unfavorite a project
  Future<Either<Failure, void>> unsaveProject(String projectId);

  /// Check if project is saved
  Future<Either<Failure, bool>> isProjectSaved(String projectId);

  /// Get user's saved projects
  Future<Either<Failure, List<Project>>> getSavedProjects();

  /// Track project view (for analytics/trending)
  Future<Either<Failure, void>> trackProjectView(String projectId);

  /// Get personalized recommendations (Phase 4)
  Future<Either<Failure, List<Project>>> getRecommendedProjects({
    int limit = 10,
  });
}
```

#### 0.3 Data Source Implementation

**File**: `lib/features/projects/data/datasources/projects_firestore_data_source.dart`

```dart
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/project.dart';
import '../../domain/entities/project_search_criteria.dart';
import '../../../../core/services/firebase/firebase_service.dart';
import '../../../../core/services/analytics/analytics_service.dart';

class ProjectsFirestoreDataSource {
  final FirebaseFirestore _firestore;
  final String? _userId;
  final AnalyticsService _analytics;

  ProjectsFirestoreDataSource({
    required FirebaseFirestore firestore,
    String? userId,
    required AnalyticsService analytics,
  })  : _firestore = firestore,
        _userId = userId,
        _analytics = analytics;

  /// Search projects with advanced criteria
  Future<List<Project>> searchProjects(ProjectSearchCriteria criteria) async {
    Query<Map<String, dynamic>> query = _firestore.collection('projects');

    // Status filter (default to published/active)
    if (criteria.statuses.isNotEmpty) {
      query = query.where(
        'status',
        whereIn: criteria.statuses.map((s) => s.name).toList(),
      );
    } else {
      // Default: only show published and active projects
      query = query.where('status', whereIn: ['published', 'active']);
    }

    // Category filter
    if (criteria.categories.isNotEmpty) {
      query = query.where(
        'category',
        whereIn: criteria.categories.map((c) => c.name).toList(),
      );
    }

    // Funding range filter
    if (criteria.minFunding != null) {
      query = query.where('fundingGoal', isGreaterThanOrEqualTo: criteria.minFunding);
    }
    if (criteria.maxFunding != null) {
      query = query.where('fundingGoal', isLessThanOrEqualTo: criteria.maxFunding);
    }

    // Featured filter
    if (criteria.featured == true) {
      query = query.where('featured', isEqualTo: true);
    }

    // Verified filter
    if (criteria.verified == true) {
      query = query.where('verified', isEqualTo: true);
    }

    // Sorting
    switch (criteria.sortBy) {
      case ProjectSortBy.createdAt:
        query = query.orderBy(
          'createdAt',
          descending: criteria.sortOrder == SortOrder.descending,
        );
        break;
      case ProjectSortBy.fundingAmount:
        query = query.orderBy(
          'fundingGoal',
          descending: criteria.sortOrder == SortOrder.descending,
        );
        break;
      case ProjectSortBy.progress:
        query = query.orderBy(
          'currentFunding',
          descending: criteria.sortOrder == SortOrder.descending,
        );
        break;
      case ProjectSortBy.popularity:
        query = query.orderBy(
          'contributorsCount',
          descending: criteria.sortOrder == SortOrder.descending,
        );
        break;
      case ProjectSortBy.endingSoon:
        query = query
            .orderBy('endDate', descending: false)
            .where('endDate', isGreaterThan: Timestamp.now());
        break;
      default:
        query = query.orderBy('createdAt', descending: true);
    }

    // Pagination
    if (criteria.lastDocument != null) {
      query = query.startAfterDocument(criteria.lastDocument as DocumentSnapshot);
    }

    // Limit
    final limit = criteria.limit ?? 20;
    query = query.limit(limit);

    // Execute query
    final snapshot = await query.get();

    // Convert to Project entities
    final projects = snapshot.docs
        .map((doc) => Project.fromFirestore(doc))
        .toList();

    // Client-side filtering for search query (if needed)
    if (criteria.query != null && criteria.query!.isNotEmpty) {
      final searchQuery = criteria.query!.toLowerCase();
      return projects.where((project) {
        return project.title.toLowerCase().contains(searchQuery) ||
               project.shortDescription.toLowerCase().contains(searchQuery) ||
               project.location.toLowerCase().contains(searchQuery);
      }).toList();
    }

    return projects;
  }

  /// Get single project
  Future<Project> getProject(String projectId) async {
    final doc = await _firestore.collection('projects').doc(projectId).get();

    if (!doc.exists) {
      throw Exception('Project not found');
    }

    return Project.fromFirestore(doc);
  }

  /// Get featured projects
  Future<List<Project>> getFeaturedProjects({int limit = 10}) async {
    final snapshot = await _firestore
        .collection('projects')
        .where('status', whereIn: ['published', 'active'])
        .where('featured', isEqualTo: true)
        .orderBy('createdAt', descending: true)
        .limit(limit)
        .get();

    return snapshot.docs.map((doc) => Project.fromFirestore(doc)).toList();
  }

  /// Save/favorite project
  Future<void> saveProject(String projectId) async {
    if (_userId == null) throw Exception('User not authenticated');

    await _firestore
        .collection('user_favorites')
        .doc(_userId)
        .collection('projects')
        .doc(projectId)
        .set({
      'projectId': projectId,
      'savedAt': FieldValue.serverTimestamp(),
    });

    await _analytics.logEvent('save_project', parameters: {
      'project_id': projectId,
    });
  }

  /// Unsave project
  Future<void> unsaveProject(String projectId) async {
    if (_userId == null) throw Exception('User not authenticated');

    await _firestore
        .collection('user_favorites')
        .doc(_userId)
        .collection('projects')
        .doc(projectId)
        .delete();

    await _analytics.logEvent('unsave_project', parameters: {
      'project_id': projectId,
    });
  }

  /// Check if project is saved
  Future<bool> isProjectSaved(String projectId) async {
    if (_userId == null) return false;

    final doc = await _firestore
        .collection('user_favorites')
        .doc(_userId)
        .collection('projects')
        .doc(projectId)
        .get();

    return doc.exists;
  }

  /// Get saved projects
  Future<List<Project>> getSavedProjects() async {
    if (_userId == null) throw Exception('User not authenticated');

    final favoritesSnapshot = await _firestore
        .collection('user_favorites')
        .doc(_userId)
        .collection('projects')
        .orderBy('savedAt', descending: true)
        .get();

    final projectIds = favoritesSnapshot.docs
        .map((doc) => doc.data()['projectId'] as String)
        .toList();

    if (projectIds.isEmpty) return [];

    // Firestore 'in' query limit is 10, batch if needed
    final projects = <Project>[];
    for (var i = 0; i < projectIds.length; i += 10) {
      final batch = projectIds.skip(i).take(10).toList();
      final snapshot = await _firestore
          .collection('projects')
          .where(FieldPath.documentId, whereIn: batch)
          .get();

      projects.addAll(
        snapshot.docs.map((doc) => Project.fromFirestore(doc)),
      );
    }

    return projects;
  }

  /// Track project view
  Future<void> trackProjectView(String projectId) async {
    await _firestore.collection('project_views').add({
      'projectId': projectId,
      'userId': _userId,
      'viewedAt': FieldValue.serverTimestamp(),
      'sessionId': DateTime.now().millisecondsSinceEpoch.toString(),
    });

    await _analytics.logEvent('view_project_card', parameters: {
      'project_id': projectId,
    });
  }
}
```

#### 0.4 Repository Implementation

**File**: `lib/features/projects/data/repositories/projects_repository_impl.dart`

```dart
import 'package:dartz/dartz.dart';
import '../../domain/entities/project.dart';
import '../../domain/entities/project_search_criteria.dart';
import '../../domain/repositories/projects_repository.dart';
import '../datasources/projects_firestore_data_source.dart';
import '../../../../core/errors/failures.dart';

class ProjectsRepositoryImpl implements ProjectsRepository {
  final ProjectsFirestoreDataSource _dataSource;

  ProjectsRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, List<Project>>> searchProjects(
    ProjectSearchCriteria criteria,
  ) async {
    try {
      final projects = await _dataSource.searchProjects(criteria);
      return Right(projects);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Project>> getProject(String projectId) async {
    try {
      final project = await _dataSource.getProject(projectId);
      return Right(project);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Project>>> getFeaturedProjects({
    int limit = 10,
  }) async {
    try {
      final projects = await _dataSource.getFeaturedProjects(limit: limit);
      return Right(projects);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> saveProject(String projectId) async {
    try {
      await _dataSource.saveProject(projectId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> unsaveProject(String projectId) async {
    try {
      await _dataSource.unsaveProject(projectId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> isProjectSaved(String projectId) async {
    try {
      final isSaved = await _dataSource.isProjectSaved(projectId);
      return Right(isSaved);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Project>>> getSavedProjects() async {
    try {
      final projects = await _dataSource.getSavedProjects();
      return Right(projects);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> trackProjectView(String projectId) async {
    try {
      await _dataSource.trackProjectView(projectId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  // Placeholder implementations for Phase 4
  @override
  Future<Either<Failure, List<Project>>> getTrendingProjects({
    int limit = 10,
  }) async {
    // TODO: Implement in Phase 4
    return Left(ServerFailure('Not implemented yet'));
  }

  @override
  Future<Either<Failure, List<Project>>> getRecommendedProjects({
    int limit = 10,
  }) async {
    // TODO: Implement in Phase 4
    return Left(ServerFailure('Not implemented yet'));
  }
}
```

#### 0.5 Riverpod Providers

**File**: `lib/features/projects/presentation/providers/projects_providers.dart`

```dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/project.dart';
import '../../domain/entities/project_search_criteria.dart';
import '../../domain/repositories/projects_repository.dart';
import '../../data/repositories/projects_repository_impl.dart';
import '../../data/datasources/projects_firestore_data_source.dart';
import '../../../../core/services/analytics/analytics_service.dart';
import '../../../auth/presentation/providers/auth_provider_aliases.dart';

part 'projects_providers.g.dart';

/// Projects repository provider
@riverpod
ProjectsRepository projectsRepository(ProjectsRepositoryRef ref) {
  final firestore = FirebaseFirestore.instance;
  final userId = ref.watch(currentUserIdProvider);
  final analytics = ref.watch(analyticsServiceProvider);

  final dataSource = ProjectsFirestoreDataSource(
    firestore: firestore,
    userId: userId,
    analytics: analytics,
  );

  return ProjectsRepositoryImpl(dataSource);
}

/// Search criteria state provider (for UI state)
@riverpod
class SearchCriteria extends _$SearchCriteria {
  @override
  ProjectSearchCriteria build() {
    return const ProjectSearchCriteria(
      sortBy: ProjectSortBy.createdAt,
      sortOrder: SortOrder.descending,
      limit: 20,
    );
  }

  void updateQuery(String? query) {
    state = state.copyWith(query: query);
  }

  void updateCategories(List<ProjectCategory> categories) {
    state = state.copyWith(categories: categories);
  }

  void updateStatuses(List<ProjectStatus> statuses) {
    state = state.copyWith(statuses: statuses);
  }

  void updateFundingRange(double? min, double? max) {
    state = state.copyWith(minFunding: min, maxFunding: max);
  }

  void updateSorting(ProjectSortBy sortBy, SortOrder order) {
    state = state.copyWith(sortBy: sortBy, sortOrder: order);
  }

  void updateFeatured(bool? featured) {
    state = state.copyWith(featured: featured);
  }

  void updateVerified(bool? verified) {
    state = state.copyWith(verified: verified);
  }

  void reset() {
    state = const ProjectSearchCriteria(
      sortBy: ProjectSortBy.createdAt,
      sortOrder: SortOrder.descending,
      limit: 20,
    );
  }
}

/// Projects search provider
@riverpod
Future<List<Project>> projects(
  ProjectsRef ref,
  ProjectSearchCriteria criteria,
) async {
  final repository = ref.watch(projectsRepositoryProvider);
  final result = await repository.searchProjects(criteria);

  return result.fold(
    (failure) => throw Exception(failure.message),
    (projects) => projects,
  );
}

/// Featured projects provider
@riverpod
Future<List<Project>> featuredProjects(FeaturedProjectsRef ref) async {
  final repository = ref.watch(projectsRepositoryProvider);
  final result = await repository.getFeaturedProjects(limit: 10);

  return result.fold(
    (failure) => throw Exception(failure.message),
    (projects) => projects,
  );
}

/// Saved projects provider
@riverpod
Future<List<Project>> savedProjects(SavedProjectsRef ref) async {
  final repository = ref.watch(projectsRepositoryProvider);
  final result = await repository.getSavedProjects();

  return result.fold(
    (failure) => throw Exception(failure.message),
    (projects) => projects,
  );
}

/// Check if project is saved
@riverpod
Future<bool> isProjectSaved(
  IsProjectSavedRef ref,
  String projectId,
) async {
  final repository = ref.watch(projectsRepositoryProvider);
  final result = await repository.isProjectSaved(projectId);

  return result.fold(
    (failure) => false,
    (isSaved) => isSaved,
  );
}
```

#### 0.6 Testing Setup

**File**: `test/features/projects/data/repositories/projects_repository_impl_test.dart`

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:dartz/dartz.dart';

// Import your actual files
import 'package:social_impact_mvp/features/projects/data/repositories/projects_repository_impl.dart';
import 'package:social_impact_mvp/features/projects/data/datasources/projects_firestore_data_source.dart';
import 'package:social_impact_mvp/features/projects/domain/entities/project.dart';
import 'package:social_impact_mvp/features/projects/domain/entities/project_search_criteria.dart';

@GenerateMocks([ProjectsFirestoreDataSource])
import 'projects_repository_impl_test.mocks.dart';

void main() {
  late ProjectsRepositoryImpl repository;
  late MockProjectsFirestoreDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockProjectsFirestoreDataSource();
    repository = ProjectsRepositoryImpl(mockDataSource);
  });

  group('searchProjects', () {
    test('should return list of projects when data source succeeds', () async {
      // Arrange
      final criteria = const ProjectSearchCriteria();
      final projects = [
        Project(
          id: '1',
          title: 'Test Project',
          shortDescription: 'Test',
          longDescription: 'Test Long',
          category: ProjectCategory.education,
          status: ProjectStatus.active,
          location: 'Paris, France',
          coverImageUrl: 'https://example.com/image.jpg',
          creatorId: 'creator1',
          creatorName: 'John Doe',
          fundingGoal: 10000,
          currentFunding: 5000,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      ];

      when(mockDataSource.searchProjects(criteria))
          .thenAnswer((_) async => projects);

      // Act
      final result = await repository.searchProjects(criteria);

      // Assert
      expect(result, equals(Right(projects)));
      verify(mockDataSource.searchProjects(criteria));
      verifyNoMoreInteractions(mockDataSource);
    });

    test('should return failure when data source throws exception', () async {
      // Arrange
      final criteria = const ProjectSearchCriteria();
      when(mockDataSource.searchProjects(criteria))
          .thenThrow(Exception('Network error'));

      // Act
      final result = await repository.searchProjects(criteria);

      // Assert
      expect(result.isLeft(), true);
      verify(mockDataSource.searchProjects(criteria));
    });
  });

  // Add more tests for other methods...
}
```

**Validation Checklist for Phase 0:**
- [ ] Run `flutter pub get` successfully
- [ ] Run `flutter pub run build_runner build --delete-conflicting-outputs`
- [ ] All freezed/riverpod code generated without errors
- [ ] Run `flutter analyze` - 0 errors
- [ ] Run `flutter test` - all unit tests pass
- [ ] Verify on Android emulator
- [ ] Verify on iOS simulator
- [ ] Verify on Web browser (Chrome)

---

## Phase 1: Essential Features (P0)

**Duration**: 2 weeks
**Priority**: CRITICAL

### 1.1 Sorting Implementation

**File**: `lib/features/projects/presentation/widgets/browse/sort_dropdown.dart`

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../../core/utils/platform_detector.dart';
import '../../../../domain/entities/project_search_criteria.dart';
import '../../../providers/projects_providers.dart';

class SortDropdown extends ConsumerWidget {
  const SortDropdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final criteria = ref.watch(searchCriteriaProvider);

    return PopupMenuButton<ProjectSortBy>(
      icon: const Icon(Icons.sort),
      tooltip: 'Sort by',
      onSelected: (sortBy) {
        ref.read(searchCriteriaProvider.notifier).updateSorting(
              sortBy,
              _getDefaultSortOrder(sortBy),
            );
      },
      itemBuilder: (context) => [
        _buildMenuItem(
          context,
          ProjectSortBy.createdAt,
          'Date Created',
          Icons.calendar_today,
          criteria.sortBy == ProjectSortBy.createdAt,
        ),
        _buildMenuItem(
          context,
          ProjectSortBy.fundingAmount,
          'Funding Goal',
          Icons.attach_money,
          criteria.sortBy == ProjectSortBy.fundingAmount,
        ),
        _buildMenuItem(
          context,
          ProjectSortBy.progress,
          'Progress',
          Icons.trending_up,
          criteria.sortBy == ProjectSortBy.progress,
        ),
        _buildMenuItem(
          context,
          ProjectSortBy.popularity,
          'Popularity',
          Icons.people,
          criteria.sortBy == ProjectSortBy.popularity,
        ),
        _buildMenuItem(
          context,
          ProjectSortBy.endingSoon,
          'Ending Soon',
          Icons.timer,
          criteria.sortBy == ProjectSortBy.endingSoon,
        ),
      ],
    );
  }

  PopupMenuItem<ProjectSortBy> _buildMenuItem(
    BuildContext context,
    ProjectSortBy value,
    String label,
    IconData icon,
    bool selected,
  ) {
    return PopupMenuItem<ProjectSortBy>(
      value: value,
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
            color: selected
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.onSurface,
          ),
          const SizedBox(width: 12),
          Text(
            label,
            style: AdaptiveTextStyles.bodyMedium(context).copyWith(
              fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
              color: selected
                  ? Theme.of(context).colorScheme.primary
                  : null,
            ),
          ),
          if (selected) ...[
            const Spacer(),
            Icon(
              Icons.check,
              size: 20,
              color: Theme.of(context).colorScheme.primary,
            ),
          ],
        ],
      ),
    );
  }

  SortOrder _getDefaultSortOrder(ProjectSortBy sortBy) {
    switch (sortBy) {
      case ProjectSortBy.createdAt:
      case ProjectSortBy.fundingAmount:
      case ProjectSortBy.progress:
      case ProjectSortBy.popularity:
        return SortOrder.descending;
      case ProjectSortBy.endingSoon:
        return SortOrder.ascending;
      default:
        return SortOrder.descending;
    }
  }
}
```

### 1.2 Advanced Filters Implementation

**File**: `lib/features/projects/presentation/widgets/browse/advanced_filters_dialog.dart`

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../../core/utils/platform_detector.dart';
import '../../../../domain/entities/project.dart';
import '../../../../domain/entities/project_search_criteria.dart';
import '../../../providers/projects_providers.dart';

class AdvancedFiltersDialog extends ConsumerStatefulWidget {
  const AdvancedFiltersDialog({super.key});

  @override
  ConsumerState<AdvancedFiltersDialog> createState() =>
      _AdvancedFiltersDialogState();
}

class _AdvancedFiltersDialogState extends ConsumerState<AdvancedFiltersDialog> {
  late ProjectSearchCriteria _tempCriteria;
  final _minFundingController = TextEditingController();
  final _maxFundingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tempCriteria = ref.read(searchCriteriaProvider);
    _minFundingController.text = _tempCriteria.minFunding?.toString() ?? '';
    _maxFundingController.text = _tempCriteria.maxFunding?.toString() ?? '';
  }

  @override
  void dispose() {
    _minFundingController.dispose();
    _maxFundingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 600, maxHeight: 700),
        child: Column(
          children: [
            // Header
            _buildHeader(context),

            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildStatusFilters(context),
                    AdaptiveSpacing.verticalLarge(),
                    _buildFundingRangeFilters(context),
                    AdaptiveSpacing.verticalLarge(),
                    _buildSpecialFilters(context),
                  ],
                ),
              ),
            ),

            // Actions
            _buildActions(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).dividerColor,
          ),
        ),
      ),
      child: Row(
        children: [
          Text(
            'Advanced Filters',
            style: AdaptiveTextStyles.titleLarge(context),
          ),
          const Spacer(),
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.close),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusFilters(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Project Status',
          style: AdaptiveTextStyles.titleMedium(context),
        ),
        AdaptiveSpacing.verticalSmall(),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: ProjectStatus.values.map((status) {
            final isSelected = _tempCriteria.statuses.contains(status);
            return FilterChip(
              selected: isSelected,
              label: Text(status.displayName),
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    _tempCriteria = _tempCriteria.copyWith(
                      statuses: [..._tempCriteria.statuses, status],
                    );
                  } else {
                    _tempCriteria = _tempCriteria.copyWith(
                      statuses: _tempCriteria.statuses
                          .where((s) => s != status)
                          .toList(),
                    );
                  }
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildFundingRangeFilters(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Funding Goal Range (€)',
          style: AdaptiveTextStyles.titleMedium(context),
        ),
        AdaptiveSpacing.verticalSmall(),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _minFundingController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Min',
                  prefixText: '€',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  final minValue = double.tryParse(value);
                  setState(() {
                    _tempCriteria = _tempCriteria.copyWith(
                      minFunding: minValue,
                    );
                  });
                },
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: TextField(
                controller: _maxFundingController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Max',
                  prefixText: '€',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  final maxValue = double.tryParse(value);
                  setState(() {
                    _tempCriteria = _tempCriteria.copyWith(
                      maxFunding: maxValue,
                    );
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSpecialFilters(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Special Filters',
          style: AdaptiveTextStyles.titleMedium(context),
        ),
        AdaptiveSpacing.verticalSmall(),
        CheckboxListTile(
          title: Row(
            children: [
              const Icon(Icons.star, size: 20, color: Colors.amber),
              const SizedBox(width: 8),
              Text('Featured Projects Only'),
            ],
          ),
          value: _tempCriteria.featured ?? false,
          onChanged: (value) {
            setState(() {
              _tempCriteria = _tempCriteria.copyWith(
                featured: value == true ? true : null,
              );
            });
          },
        ),
        CheckboxListTile(
          title: Row(
            children: [
              const Icon(Icons.verified, size: 20, color: Colors.blue),
              const SizedBox(width: 8),
              Text('Verified Projects Only'),
            ],
          ),
          value: _tempCriteria.verified ?? false,
          onChanged: (value) {
            setState(() {
              _tempCriteria = _tempCriteria.copyWith(
                verified: value == true ? true : null,
              );
            });
          },
        ),
      ],
    );
  }

  Widget _buildActions(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Theme.of(context).dividerColor,
          ),
        ),
      ),
      child: Row(
        children: [
          TextButton(
            onPressed: () {
              ref.read(searchCriteriaProvider.notifier).reset();
              Navigator.of(context).pop();
            },
            child: const Text('Clear All'),
          ),
          const Spacer(),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: () {
              ref.read(searchCriteriaProvider.notifier).state = _tempCriteria;
              Navigator.of(context).pop();
            },
            child: const Text('Apply Filters'),
          ),
        ],
      ),
    );
  }
}
```

### 1.3 Infinite Scroll / Pagination

**File**: `lib/features/projects/presentation/widgets/browse/projects_pagination_list.dart`

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../../shared/constants/spacing.dart';
import '../../../../domain/entities/project.dart';
import '../../../../domain/entities/project_search_criteria.dart';
import '../../../providers/projects_providers.dart';
import 'project_card_enhanced.dart';

class ProjectsPaginationList extends ConsumerStatefulWidget {
  const ProjectsPaginationList({super.key});

  @override
  ConsumerState<ProjectsPaginationList> createState() =>
      _ProjectsPaginationListState();
}

class _ProjectsPaginationListState
    extends ConsumerState<ProjectsPaginationList> {
  final PagingController<int, Project> _pagingController =
      PagingController(firstPageKey: 0);

  dynamic _lastDocument;
  static const _pageSize = 20;

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final criteria = ref.read(searchCriteriaProvider);
      final criteriaWithPagination = criteria.copyWith(
        limit: _pageSize,
        lastDocument: pageKey == 0 ? null : _lastDocument,
      );

      final repository = ref.read(projectsRepositoryProvider);
      final result = await repository.searchProjects(criteriaWithPagination);

      result.fold(
        (failure) {
          _pagingController.error = failure.message;
        },
        (projects) {
          final isLastPage = projects.length < _pageSize;
          if (isLastPage) {
            _pagingController.appendLastPage(projects);
          } else {
            // Store last document for next page
            _lastDocument = projects.isNotEmpty ? projects.last : null;
            final nextPageKey = pageKey + 1;
            _pagingController.appendPage(projects, nextPageKey);
          }
        },
      );
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Listen to criteria changes to refresh list
    ref.listen(searchCriteriaProvider, (previous, next) {
      if (previous != next) {
        _lastDocument = null;
        _pagingController.refresh();
      }
    });

    return PagedListView<int, Project>(
      pagingController: _pagingController,
      padding: const EdgeInsets.all(Spacing.md),
      builderDelegate: PagedChildBuilderDelegate<Project>(
        itemBuilder: (context, project, index) =>
            ProjectCardEnhanced(project: project),
        firstPageErrorIndicatorBuilder: (context) =>
            _buildErrorIndicator(context),
        newPageErrorIndicatorBuilder: (context) =>
            _buildErrorIndicator(context),
        firstPageProgressIndicatorBuilder: (context) =>
            _buildLoadingIndicator(context),
        newPageProgressIndicatorBuilder: (context) =>
            _buildLoadingIndicator(context),
        noItemsFoundIndicatorBuilder: (context) => _buildEmptyState(context),
      ),
    );
  }

  Widget _buildLoadingIndicator(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(Spacing.xl),
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildErrorIndicator(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.xl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 48,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: Spacing.md),
            Text(
              'Failed to load projects',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: Spacing.sm),
            Text(
              _pagingController.error.toString(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: Spacing.lg),
            ElevatedButton.icon(
              onPressed: () => _pagingController.refresh(),
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.xl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_off,
              size: 64,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
            ),
            const SizedBox(height: Spacing.lg),
            Text(
              'No projects found',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: Spacing.sm),
            Text(
              'Try adjusting your search criteria',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.6),
                  ),
            ),
            const SizedBox(height: Spacing.lg),
            ElevatedButton(
              onPressed: () {
                ref.read(searchCriteriaProvider.notifier).reset();
              },
              child: const Text('Clear Filters'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
```

### 1.4 Enhanced Project Card

**File**: `lib/features/projects/presentation/widgets/browse/project_card_enhanced.dart`

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import '../../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../../shared/constants/spacing.dart';
import '../../../../../core/utils/platform_detector.dart';
import '../../../../domain/entities/project.dart';
import '../../../providers/projects_providers.dart';

class ProjectCardEnhanced extends ConsumerWidget {
  final Project project;

  const ProjectCardEnhanced({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fundingPercentage =
        (project.currentFunding / project.fundingGoal).clamp(0.0, 1.0);
    final daysRemaining = project.endDate != null
        ? project.endDate!.difference(DateTime.now()).inDays
        : null;

    return Padding(
      padding: const EdgeInsets.only(bottom: Spacing.md),
      child: AdaptiveCard(
        child: InkWell(
          onTap: () {
            // Track view
            ref
                .read(projectsRepositoryProvider)
                .trackProjectView(project.id);

            // Navigate to details
            context.go('/projects/${project.id}');
          },
          borderRadius: BorderRadius.circular(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image with badges
              _buildImageHeader(context, ref, daysRemaining),

              Padding(
                padding: const EdgeInsets.all(Spacing.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Creator name
                    _buildCreatorInfo(context),

                    AdaptiveSpacing.verticalSmall(),

                    // Title
                    Text(
                      project.title,
                      style: AdaptiveTextStyles.titleMedium(context),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    AdaptiveSpacing.verticalSmall(),

                    // Location
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 16,
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.6),
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            project.location,
                            style: AdaptiveTextStyles.bodySmall(context)
                                .copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurface
                                  .withOpacity(0.6),
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),

                    AdaptiveSpacing.verticalMedium(),

                    // Funding progress
                    _buildFundingProgress(context, fundingPercentage),

                    AdaptiveSpacing.verticalSmall(),

                    // Stats row
                    _buildStatsRow(context, fundingPercentage),

                    AdaptiveSpacing.verticalMedium(),

                    // Bottom row: Category + Favorite
                    _buildBottomRow(context, ref),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageHeader(
    BuildContext context,
    WidgetRef ref,
    int? daysRemaining,
  ) {
    return Stack(
      children: [
        // Project image
        AspectRatio(
          aspectRatio: 16 / 9,
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(12),
            ),
            child: CachedNetworkImage(
              imageUrl: project.coverImageUrl,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                color: _getCategoryColor(project.category).withOpacity(0.1),
                child: Center(
                  child: Icon(
                    _getCategoryIcon(project.category),
                    size: 48,
                    color: _getCategoryColor(project.category),
                  ),
                ),
              ),
              errorWidget: (context, url, error) => Container(
                color: _getCategoryColor(project.category).withOpacity(0.1),
                child: Center(
                  child: Icon(
                    _getCategoryIcon(project.category),
                    size: 48,
                    color: _getCategoryColor(project.category),
                  ),
                ),
              ),
            ),
          ),
        ),

        // Badges overlay
        Positioned(
          top: 8,
          left: 8,
          right: 8,
          child: Row(
            children: [
              // Featured badge
              if (project.featured)
                _buildBadge(
                  context,
                  'Featured',
                  Icons.star,
                  Colors.amber,
                ),

              // Verified badge
              if (project.verified) ...[
                if (project.featured) const SizedBox(width: 8),
                _buildBadge(
                  context,
                  'Verified',
                  Icons.verified,
                  Colors.blue,
                ),
              ],

              const Spacer(),

              // Days remaining badge
              if (daysRemaining != null && daysRemaining > 0 && daysRemaining <= 7)
                _buildBadge(
                  context,
                  '$daysRemaining days left',
                  Icons.timer,
                  Colors.red,
                ),
            ],
          ),
        ),

        // Favorite button
        Positioned(
          bottom: 8,
          right: 8,
          child: _buildFavoriteButton(context, ref),
        ),
      ],
    );
  }

  Widget _buildBadge(
    BuildContext context,
    String label,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: Colors.white),
          const SizedBox(width: 4),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFavoriteButton(BuildContext context, WidgetRef ref) {
    final isSavedAsync = ref.watch(isProjectSavedProvider(project.id));

    return isSavedAsync.when(
      data: (isSaved) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: IconButton(
          onPressed: () async {
            final repository = ref.read(projectsRepositoryProvider);
            if (isSaved) {
              await repository.unsaveProject(project.id);
            } else {
              await repository.saveProject(project.id);
            }
            ref.invalidate(isProjectSavedProvider(project.id));
            ref.invalidate(savedProjectsProvider);
          },
          icon: Icon(
            isSaved ? Icons.favorite : Icons.favorite_border,
            color: isSaved ? Colors.red : Colors.grey,
          ),
        ),
      ),
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
    );
  }

  Widget _buildCreatorInfo(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 12,
          backgroundColor:
              _getCategoryColor(project.category).withOpacity(0.2),
          child: Text(
            project.creatorName[0].toUpperCase(),
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: _getCategoryColor(project.category),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            project.organizationName ?? project.creatorName,
            style: AdaptiveTextStyles.bodySmall(context).copyWith(
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildFundingProgress(
    BuildContext context,
    double fundingPercentage,
  ) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '€${_formatAmount(project.currentFunding)}',
              style: AdaptiveTextStyles.titleSmall(context).copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '${(fundingPercentage * 100).toInt()}%',
              style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                color: _getCategoryColor(project.category),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: fundingPercentage,
            minHeight: 8,
            backgroundColor:
                Theme.of(context).colorScheme.outline.withOpacity(0.2),
            valueColor: AlwaysStoppedAnimation<Color>(
              _getCategoryColor(project.category),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            'of €${_formatAmount(project.fundingGoal)} goal',
            style: AdaptiveTextStyles.bodySmall(context).copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatsRow(BuildContext context, double fundingPercentage) {
    return Row(
      children: [
        _buildStatItem(
          context,
          Icons.people,
          '${project.contributorsCount} backers',
        ),
        const SizedBox(width: 16),
        if (project.endDate != null)
          _buildStatItem(
            context,
            Icons.calendar_today,
            '${project.endDate!.difference(DateTime.now()).inDays} days left',
          ),
      ],
    );
  }

  Widget _buildStatItem(BuildContext context, IconData icon, String label) {
    return Row(
      children: [
        Icon(
          icon,
          size: 14,
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: AdaptiveTextStyles.bodySmall(context).copyWith(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomRow(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        // Category chip
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: _getCategoryColor(project.category).withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                _getCategoryIcon(project.category),
                size: 14,
                color: _getCategoryColor(project.category),
              ),
              const SizedBox(width: 6),
              Text(
                project.category.displayName,
                style: AdaptiveTextStyles.bodySmall(context).copyWith(
                  color: _getCategoryColor(project.category),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),

        const Spacer(),

        // Risk indicator (if not low)
        if (project.riskLevel != 'low')
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: _getRiskColor(project.riskLevel).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: _getRiskColor(project.riskLevel).withOpacity(0.3),
              ),
            ),
            child: Text(
              '${project.riskLevel.toUpperCase()} RISK',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: _getRiskColor(project.riskLevel),
              ),
            ),
          ),
      ],
    );
  }

  Color _getCategoryColor(ProjectCategory category) {
    switch (category) {
      case ProjectCategory.healthcare:
        return Colors.red;
      case ProjectCategory.education:
        return Colors.blue;
      case ProjectCategory.environment:
        return Colors.green;
      case ProjectCategory.cleanEnergy:
        return Colors.orange;
      case ProjectCategory.waterSanitation:
        return Colors.cyan;
      case ProjectCategory.financialInclusion:
        return Colors.purple;
    }
  }

  IconData _getCategoryIcon(ProjectCategory category) {
    switch (category) {
      case ProjectCategory.healthcare:
        return Icons.local_hospital;
      case ProjectCategory.education:
        return Icons.school;
      case ProjectCategory.environment:
        return Icons.eco;
      case ProjectCategory.cleanEnergy:
        return Icons.wb_sunny;
      case ProjectCategory.waterSanitation:
        return Icons.water_drop;
      case ProjectCategory.financialInclusion:
        return Icons.account_balance;
    }
  }

  Color _getRiskColor(String riskLevel) {
    switch (riskLevel.toLowerCase()) {
      case 'low':
        return Colors.green;
      case 'medium':
        return Colors.orange;
      case 'high':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  String _formatAmount(double amount) {
    if (amount >= 1000000) {
      return '${(amount / 1000000).toStringAsFixed(1)}M';
    } else if (amount >= 1000) {
      return '${(amount / 1000).toStringAsFixed(0)}K';
    } else {
      return amount.toStringAsFixed(0);
    }
  }
}
```

### 1.5 Analytics Integration

**File**: `lib/core/services/analytics/analytics_events.dart`

```dart
/// Analytics event names for browse page
class BrowseAnalyticsEvents {
  static const String viewBrowsePage = 'view_browse_page';
  static const String searchProjects = 'search_projects';
  static const String filterProjects = 'filter_projects';
  static const String sortProjects = 'sort_projects';
  static const String viewProjectCard = 'view_project_card';
  static const String clickProjectCard = 'click_project_card';
  static const String saveProject = 'save_project';
  static const String unsaveProject = 'unsave_project';
  static const String shareProject = 'share_project';
  static const String clearFilters = 'clear_filters';
  static const String applyAdvancedFilters = 'apply_advanced_filters';
}
```

Add analytics tracking to BrowseProjectsScreen init:

```dart
@override
void initState() {
  super.initState();

  // Track page view
  WidgetsBinding.instance.addPostFrameCallback((_) {
    ref.read(analyticsServiceProvider).logEvent(
      BrowseAnalyticsEvents.viewBrowsePage,
      parameters: {
        'timestamp': DateTime.now().toIso8601String(),
      },
    );
  });
}
```

### 1.6 Pull-to-Refresh (Mobile)

Update BrowseProjectsScreen mobile layout:

```dart
Widget _buildMobileLayout(BuildContext context) {
  return Scaffold(
    appBar: AppBar(...),
    body: RefreshIndicator(
      onRefresh: () async {
        // Invalidate providers to refresh data
        ref.invalidate(projectsProvider);
        ref.invalidate(featuredProjectsProvider);

        // Wait for refresh to complete
        await Future.delayed(const Duration(milliseconds: 500));

        // Track analytics
        ref.read(analyticsServiceProvider).logEvent(
          'refresh_projects',
          parameters: {'source': 'pull_to_refresh'},
        );
      },
      child: Column(
        children: [
          _buildSearchBar(context),
          _buildCategoryFilters(context),
          Expanded(child: ProjectsPaginationList()),
        ],
      ),
    ),
  );
}
```

**Validation Checklist for Phase 1:**
- [ ] Sorting dropdown works on all platforms (Android/iOS/Web)
- [ ] Advanced filters dialog functional with all filter types
- [ ] Infinite scroll pagination working smoothly
- [ ] Enhanced project cards display all information correctly
- [ ] Images load with proper caching and placeholders
- [ ] Favorite/unfavorite functionality works
- [ ] Analytics events firing correctly (verify in Firebase Console)
- [ ] Pull-to-refresh works on mobile (Android/iOS)
- [ ] Error handling displays proper messages
- [ ] Empty states show correct UI
- [ ] All filters persist when scrolling/pagination
- [ ] Run `flutter analyze` - 0 errors
- [ ] Run `flutter test` - all tests pass
- [ ] Performance: smooth 60fps scrolling on all platforms
- [ ] Memory: no leaks during extended scrolling

---

## Phase 2: Enhanced UX (P1)

**Duration**: 1.5 weeks
**Priority**: HIGH

### 2.1 Search Enhancements

**File**: `lib/features/projects/presentation/widgets/browse/search_bar_enhanced.dart`

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class SearchBarEnhanced extends ConsumerStatefulWidget {
  const SearchBarEnhanced({super.key});

  @override
  ConsumerState<SearchBarEnhanced> createState() => _SearchBarEnhancedState();
}

class _SearchBarEnhancedState extends ConsumerState<SearchBarEnhanced> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  Timer? _debounce;
  List<String> _searchHistory = [];
  bool _showSuggestions = false;

  @override
  void initState() {
    super.initState();
    _loadSearchHistory();

    _focusNode.addListener(() {
      setState(() {
        _showSuggestions = _focusNode.hasFocus;
      });
    });
  }

  Future<void> _loadSearchHistory() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _searchHistory = prefs.getStringList('search_history') ?? [];
    });
  }

  Future<void> _saveSearchQuery(String query) async {
    if (query.isEmpty) return;

    final prefs = await SharedPreferences.getInstance();
    _searchHistory.remove(query); // Remove if exists
    _searchHistory.insert(0, query); // Add to beginning
    _searchHistory = _searchHistory.take(10).toList(); // Keep last 10
    await prefs.setStringList('search_history', _searchHistory);
  }

  Future<void> _clearSearchHistory() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('search_history');
    setState(() {
      _searchHistory = [];
    });
  }

  void _onSearchChanged(String query) {
    // Debounce search
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 300), () {
      ref.read(searchCriteriaProvider.notifier).updateQuery(query);

      // Track analytics
      if (query.isNotEmpty) {
        ref.read(analyticsServiceProvider).logEvent(
          BrowseAnalyticsEvents.searchProjects,
          parameters: {
            'query': query,
            'query_length': query.length,
          },
        );
      }
    });
  }

  void _onSearchSubmitted(String query) {
    if (query.isNotEmpty) {
      _saveSearchQuery(query);
      _focusNode.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            controller: _controller,
            focusNode: _focusNode,
            decoration: InputDecoration(
              hintText: 'Search projects...',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: _controller.text.isNotEmpty
                  ? IconButton(
                      onPressed: () {
                        _controller.clear();
                        _onSearchChanged('');
                      },
                      icon: const Icon(Icons.clear),
                    )
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
            ),
            onChanged: _onSearchChanged,
            onSubmitted: _onSearchSubmitted,
          ),
        ),

        // Search suggestions/history
        if (_showSuggestions && _searchHistory.isNotEmpty)
          _buildSearchSuggestions(context),
      ],
    );
  }

  Widget _buildSearchSuggestions(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 200),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(8),
        child: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Text(
                    'Recent Searches',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: _clearSearchHistory,
                    child: const Text('Clear'),
                  ),
                ],
              ),
            ),
            ..._searchHistory.map((query) => ListTile(
              dense: true,
              leading: const Icon(Icons.history, size: 20),
              title: Text(query),
              onTap: () {
                _controller.text = query;
                _onSearchChanged(query);
                _onSearchSubmitted(query);
              },
            )),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    _debounce?.cancel();
    super.dispose();
  }
}
```

### 2.2 Social Sharing

**File**: `lib/features/projects/presentation/widgets/browse/share_project_button.dart`

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';
import '../../../../domain/entities/project.dart';
import '../../../../../core/services/analytics/analytics_service.dart';
import '../../../providers/projects_providers.dart';

class ShareProjectButton extends ConsumerWidget {
  final Project project;

  const ShareProjectButton({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () => _shareProject(context, ref),
      icon: const Icon(Icons.share),
      tooltip: 'Share project',
    );
  }

  Future<void> _shareProject(BuildContext context, WidgetRef ref) async {
    try {
      final shareUrl = 'https://yourapp.com/projects/${project.id}';
      final shareText = '''
${project.title}

${project.shortDescription}

Support this project: $shareUrl
''';

      await Share.share(
        shareText,
        subject: project.title,
      );

      // Track analytics
      ref.read(analyticsServiceProvider).logEvent(
        BrowseAnalyticsEvents.shareProject,
        parameters: {
          'project_id': project.id,
          'project_title': project.title,
          'share_method': 'native_share',
        },
      );
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to share project'),
          ),
        );
      }
    }
  }
}
```

Add to ProjectCardEnhanced:

```dart
// In _buildImageHeader, add share button alongside favorite
Positioned(
  bottom: 8,
  left: 8,
  child: Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 4,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: ShareProjectButton(project: project),
  ),
),
```

### 2.3 Filter Persistence (URL Parameters for Web)

**File**: `lib/features/projects/presentation/utils/filter_url_utils.dart`

```dart
import '../../domain/entities/project_search_criteria.dart';
import '../../domain/entities/project.dart';

class FilterUrlUtils {
  /// Convert criteria to URL query parameters
  static Map<String, String> toQueryParams(ProjectSearchCriteria criteria) {
    final params = <String, String>{};

    if (criteria.query != null && criteria.query!.isNotEmpty) {
      params['q'] = criteria.query!;
    }

    if (criteria.categories.isNotEmpty) {
      params['categories'] = criteria.categories
          .map((c) => c.name)
          .join(',');
    }

    if (criteria.statuses.isNotEmpty) {
      params['statuses'] = criteria.statuses
          .map((s) => s.name)
          .join(',');
    }

    if (criteria.minFunding != null) {
      params['min_funding'] = criteria.minFunding.toString();
    }

    if (criteria.maxFunding != null) {
      params['max_funding'] = criteria.maxFunding.toString();
    }

    if (criteria.featured == true) {
      params['featured'] = 'true';
    }

    if (criteria.verified == true) {
      params['verified'] = 'true';
    }

    if (criteria.sortBy != null) {
      params['sort_by'] = criteria.sortBy!.name;
    }

    if (criteria.sortOrder != null) {
      params['sort_order'] = criteria.sortOrder!.name;
    }

    return params;
  }

  /// Parse URL query parameters to criteria
  static ProjectSearchCriteria fromQueryParams(
    Map<String, String> params,
  ) {
    return ProjectSearchCriteria(
      query: params['q'],
      categories: params['categories']
              ?.split(',')
              .map((name) => ProjectCategory.values
                  .firstWhere((e) => e.name == name))
              .toList() ??
          [],
      statuses: params['statuses']
              ?.split(',')
              .map((name) =>
                  ProjectStatus.values.firstWhere((e) => e.name == name))
              .toList() ??
          [],
      minFunding: params['min_funding'] != null
          ? double.tryParse(params['min_funding']!)
          : null,
      maxFunding: params['max_funding'] != null
          ? double.tryParse(params['max_funding']!)
          : null,
      featured: params['featured'] == 'true' ? true : null,
      verified: params['verified'] == 'true' ? true : null,
      sortBy: params['sort_by'] != null
          ? ProjectSortBy.values
              .firstWhere((e) => e.name == params['sort_by'])
          : null,
      sortOrder: params['sort_order'] != null
          ? SortOrder.values
              .firstWhere((e) => e.name == params['sort_order'])
          : null,
    );
  }
}
```

Update BrowseProjectsScreen for web:

```dart
@override
void initState() {
  super.initState();

  // For web: read filters from URL on init
  if (PlatformDetector.isWeb) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final uri = Uri.parse(window.location.href);
      if (uri.queryParameters.isNotEmpty) {
        final criteria = FilterUrlUtils.fromQueryParams(uri.queryParameters);
        ref.read(searchCriteriaProvider.notifier).state = criteria;
      }
    });
  }

  // Listen to criteria changes and update URL (web only)
  if (PlatformDetector.isWeb) {
    ref.listenManual(searchCriteriaProvider, (previous, next) {
      final params = FilterUrlUtils.toQueryParams(next);
      final uri = Uri(
        path: '/browse',
        queryParameters: params.isEmpty ? null : params,
      );
      window.history.pushState(null, '', uri.toString());
    });
  }
}
```

### 2.4 Loading Skeletons

**File**: `lib/shared/widgets/loading/project_card_skeleton.dart`

```dart
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProjectCardSkeleton extends StatelessWidget {
  const ProjectCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image skeleton
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: 200,
              width: double.infinity,
              color: Colors.white,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title skeleton
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    height: 20,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                const SizedBox(height: 8),

                // Subtitle skeleton
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    height: 16,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Progress bar skeleton
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    height: 8,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
```

Use in pagination list:

```dart
firstPageProgressIndicatorBuilder: (context) => ListView.builder(
  padding: const EdgeInsets.all(16),
  itemCount: 5,
  itemBuilder: (context, index) => const ProjectCardSkeleton(),
),
```

### 2.5 Accessibility Improvements

**File**: Add accessibility to ProjectCardEnhanced:

```dart
return Semantics(
  label: '''
    ${project.title}.
    Created by ${project.creatorName}.
    Located in ${project.location}.
    ${(fundingPercentage * 100).toInt()} percent funded.
    ${project.contributorsCount} contributors.
    ${project.category.displayName} category.
    ${project.featured ? 'Featured project.' : ''}
    ${project.verified ? 'Verified project.' : ''}
    Tap to view details.
  ''',
  button: true,
  enabled: true,
  child: AdaptiveCard(...),
);
```

Add to search bar:

```dart
TextField(
  controller: _controller,
  focusNode: _focusNode,
  decoration: InputDecoration(
    hintText: 'Search projects...',
    semanticLabel: 'Search projects input field',
    prefixIcon: const Icon(Icons.search),
    ...
  ),
)
```

**Validation Checklist for Phase 2:**
- [ ] Search debounce working (no lag)
- [ ] Search history saves and loads correctly
- [ ] Social sharing works on all platforms (native share on mobile)
- [ ] URL parameters update on web when filters change
- [ ] Bookmarkable URLs work (copy/paste link loads same filters)
- [ ] Loading skeletons display during data fetch
- [ ] Screen reader announces card content correctly
- [ ] All interactive elements have minimum 44x44 touch targets
- [ ] Keyboard navigation works on web (tab through cards)
- [ ] Focus indicators visible
- [ ] Run accessibility scanner (Flutter DevTools)
- [ ] Test with TalkBack (Android) and VoiceOver (iOS)

---

## Phase 3: Platform-Specific (P2)

**Duration**: 1 week
**Priority**: MEDIUM

### 3.1 Voice Search (Mobile)

**File**: `lib/features/projects/presentation/widgets/browse/voice_search_button.dart`

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import '../../../../../core/utils/platform_detector.dart';

class VoiceSearchButton extends ConsumerStatefulWidget {
  final Function(String) onResult;

  const VoiceSearchButton({
    super.key,
    required this.onResult,
  });

  @override
  ConsumerState<VoiceSearchButton> createState() => _VoiceSearchButtonState();
}

class _VoiceSearchButtonState extends ConsumerState<VoiceSearchButton> {
  final stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;
  bool _isAvailable = false;

  @override
  void initState() {
    super.initState();
    if (PlatformDetector.isMobile) {
      _initSpeech();
    }
  }

  Future<void> _initSpeech() async {
    _isAvailable = await _speech.initialize(
      onError: (error) => debugPrint('Speech recognition error: $error'),
      onStatus: (status) => debugPrint('Speech recognition status: $status'),
    );
    setState(() {});
  }

  Future<void> _startListening() async {
    if (!_isAvailable) return;

    setState(() => _isListening = true);

    await _speech.listen(
      onResult: (result) {
        if (result.finalResult) {
          widget.onResult(result.recognizedWords);
          _stopListening();
        }
      },
      localeId: 'fr_FR', // French - adapt based on app locale
    );
  }

  Future<void> _stopListening() async {
    await _speech.stop();
    setState(() => _isListening = false);
  }

  @override
  Widget build(BuildContext context) {
    if (!PlatformDetector.isMobile || !_isAvailable) {
      return const SizedBox.shrink();
    }

    return IconButton(
      onPressed: _isListening ? _stopListening : _startListening,
      icon: Icon(
        _isListening ? Icons.mic : Icons.mic_none,
        color: _isListening ? Colors.red : null,
      ),
      tooltip: 'Voice search',
    );
  }

  @override
  void dispose() {
    _speech.cancel();
    super.dispose();
  }
}
```

Add to SearchBarEnhanced:

```dart
suffixIcon: Row(
  mainAxisSize: MainAxisSize.min,
  children: [
    if (PlatformDetector.isMobile)
      VoiceSearchButton(
        onResult: (text) {
          _controller.text = text;
          _onSearchChanged(text);
        },
      ),
    if (_controller.text.isNotEmpty)
      IconButton(
        onPressed: () {
          _controller.clear();
          _onSearchChanged('');
        },
        icon: const Icon(Icons.clear),
      ),
  ],
),
```

### 3.2 Keyboard Shortcuts (Web)

**File**: `lib/features/projects/presentation/widgets/browse/keyboard_shortcuts.dart`

```dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../core/utils/platform_detector.dart';

class KeyboardShortcuts extends StatelessWidget {
  final FocusNode searchFocusNode;
  final VoidCallback onExport;
  final VoidCallback onRefresh;

  const KeyboardShortcuts({
    super.key,
    required this.searchFocusNode,
    required this.onExport,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    if (!PlatformDetector.isWeb) {
      return const SizedBox.shrink();
    }

    return Focus(
      autofocus: true,
      onKeyEvent: (node, event) {
        if (event is KeyDownEvent) {
          // "/" - Focus search
          if (event.logicalKey == LogicalKeyboardKey.slash) {
            searchFocusNode.requestFocus();
            return KeyEventResult.handled;
          }

          // Ctrl/Cmd + K - Focus search
          if ((event.logicalKey == LogicalKeyboardKey.keyK) &&
              (HardwareKeyboard.instance.isControlPressed ||
                  HardwareKeyboard.instance.isMetaPressed)) {
            searchFocusNode.requestFocus();
            return KeyEventResult.handled;
          }

          // Ctrl/Cmd + E - Export
          if ((event.logicalKey == LogicalKeyboardKey.keyE) &&
              (HardwareKeyboard.instance.isControlPressed ||
                  HardwareKeyboard.instance.isMetaPressed)) {
            onExport();
            return KeyEventResult.handled;
          }

          // Ctrl/Cmd + R - Refresh
          if ((event.logicalKey == LogicalKeyboardKey.keyR) &&
              (HardwareKeyboard.instance.isControlPressed ||
                  HardwareKeyboard.instance.isMetaPressed)) {
            onRefresh();
            return KeyEventResult.handled;
          }

          // Escape - Clear search
          if (event.logicalKey == LogicalKeyboardKey.escape) {
            searchFocusNode.unfocus();
            return KeyEventResult.handled;
          }
        }

        return KeyEventResult.ignored;
      },
      child: const SizedBox.shrink(),
    );
  }
}
```

Add shortcuts help dialog:

```dart
void _showKeyboardShortcuts(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Keyboard Shortcuts'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildShortcutRow('/', 'Focus search'),
          _buildShortcutRow('Ctrl/Cmd + K', 'Focus search'),
          _buildShortcutRow('Ctrl/Cmd + E', 'Export data'),
          _buildShortcutRow('Ctrl/Cmd + R', 'Refresh'),
          _buildShortcutRow('Esc', 'Clear search'),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Close'),
        ),
      ],
    ),
  );
}

Widget _buildShortcutRow(String keys, String action) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            keys,
            style: const TextStyle(fontFamily: 'monospace'),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(child: Text(action)),
      ],
    ),
  );
}
```

### 3.3 Swipe Gestures (Mobile)

**File**: Add to ProjectCardEnhanced:

```dart
return Dismissible(
  key: Key(project.id),
  confirmDismiss: (direction) async {
    if (direction == DismissDirection.endToStart) {
      // Swipe left to save/unsave
      final repository = ref.read(projectsRepositoryProvider);
      final isSaved = await repository.isProjectSaved(project.id);

      isSaved.fold(
        (failure) => null,
        (saved) async {
          if (saved) {
            await repository.unsaveProject(project.id);
          } else {
            await repository.saveProject(project.id);
          }
          ref.invalidate(isProjectSavedProvider(project.id));
        },
      );

      return false; // Don't actually dismiss
    } else if (direction == DismissDirection.startToEnd) {
      // Swipe right to share
      _shareProject(context, ref);
      return false;
    }
    return false;
  },
  background: Container(
    color: Colors.blue,
    alignment: Alignment.centerLeft,
    padding: const EdgeInsets.only(left: 20),
    child: const Icon(Icons.share, color: Colors.white),
  ),
  secondaryBackground: Container(
    color: Colors.red,
    alignment: Alignment.centerRight,
    padding: const EdgeInsets.only(right: 20),
    child: const Icon(Icons.favorite, color: Colors.white),
  ),
  child: // ... existing card content
);
```

### 3.4 SEO & Meta Tags (Web)

**File**: `web/index.html` - Update:

```html
<!DOCTYPE html>
<html lang="fr">
<head>
  <base href="$FLUTTER_BASE_HREF">

  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- SEO Meta Tags -->
  <meta name="description" content="Découvrez et financez des projets à impact social. Plateforme de financement participatif pour l'éducation, la santé, l'environnement et plus.">
  <meta name="keywords" content="financement participatif, impact social, projets sociaux, investissement éthique, crowdfunding">
  <meta name="author" content="Social Impact Platform">

  <!-- Open Graph / Facebook -->
  <meta property="og:type" content="website">
  <meta property="og:url" content="https://yourapp.com/">
  <meta property="og:title" content="Social Impact Platform - Financez des projets à impact">
  <meta property="og:description" content="Découvrez et financez des projets à impact social">
  <meta property="og:image" content="https://yourapp.com/og-image.jpg">

  <!-- Twitter -->
  <meta property="twitter:card" content="summary_large_image">
  <meta property="twitter:url" content="https://yourapp.com/">
  <meta property="twitter:title" content="Social Impact Platform - Financez des projets à impact">
  <meta property="twitter:description" content="Découvrez et financez des projets à impact social">
  <meta property="twitter:image" content="https://yourapp.com/og-image.jpg">

  <title>Browse Projects - Social Impact Platform</title>
  <link rel="manifest" href="manifest.json">
  <link rel="icon" type="image/png" href="favicon.png"/>
</head>
<body>
  <script src="flutter.js" defer></script>
</body>
</html>
```

**Validation Checklist for Phase 3:**
- [ ] Voice search works on Android
- [ ] Voice search works on iOS
- [ ] Voice search respects language/locale
- [ ] Keyboard shortcuts work on web
- [ ] Help dialog displays all shortcuts
- [ ] Swipe gestures smooth on mobile
- [ ] Swipe left saves/unsaves project
- [ ] Swipe right shares project
- [ ] SEO meta tags present in HTML
- [ ] Open Graph tags validate on Facebook debugger
- [ ] Twitter card validates on Twitter validator
- [ ] Test with screen reader + keyboard navigation

---

## Phase 4: Advanced Features (P3)

**Duration**: 1.5 weeks
**Priority**: LOW (Post-MVP)

### 4.1 AI-Powered Recommendations

**Backend**: Cloud Function for recommendations

```typescript
// functions/src/recommendations/getPersonalizedProjects.ts
import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';
import { VertexAI } from '@google-cloud/vertexai';

export const getPersonalizedProjects = functions.https.onCall(
  async (data, context) => {
    if (!context.auth) {
      throw new functions.https.HttpsError(
        'unauthenticated',
        'Must be authenticated'
      );
    }

    const userId = context.auth.uid;
    const limit = data.limit || 10;

    try {
      // Get user's contribution history
      const contributionsSnapshot = await admin
        .firestore()
        .collection('users')
        .doc(userId)
        .collection('contributions')
        .where('status', '==', 'confirmed')
        .limit(20)
        .get();

      const contributedProjectIds = contributionsSnapshot.docs.map(
        (doc) => doc.data().projectId
      );

      // Get contributed projects details
      const contributedProjects = await Promise.all(
        contributedProjectIds.map((id) =>
          admin.firestore().collection('projects').doc(id).get()
        )
      );

      // Extract categories and keywords
      const preferredCategories = contributedProjects
        .map((doc) => doc.data()?.category)
        .filter(Boolean);

      // Get recommendations using Vertex AI (optional - Phase 4+)
      // For MVP, use simple category-based recommendations
      const recommendedProjectsQuery = admin
        .firestore()
        .collection('projects')
        .where('status', 'in', ['published', 'active'])
        .where('category', 'in', preferredCategories.length > 0
          ? preferredCategories
          : ['education', 'healthcare', 'environment']
        )
        .orderBy('createdAt', 'desc')
        .limit(limit);

      const recommendedSnapshot = await recommendedProjectsQuery.get();

      const recommendations = recommendedSnapshot.docs
        .filter((doc) => !contributedProjectIds.includes(doc.id))
        .map((doc) => ({
          id: doc.id,
          ...doc.data(),
        }));

      return {
        success: true,
        recommendations,
        reason: preferredCategories.length > 0
          ? 'Based on your contribution history'
          : 'Popular projects',
      };
    } catch (error) {
      console.error('Error getting recommendations:', error);
      throw new functions.https.HttpsError(
        'internal',
        'Failed to get recommendations'
      );
    }
  }
);
```

**Frontend**: Add recommendations section

```dart
// providers/projects_providers.dart
@riverpod
Future<List<Project>> recommendedProjects(
  RecommendedProjectsRef ref,
) async {
  final functions = FirebaseFunctions.instance;

  try {
    final result = await functions
        .httpsCallable('getPersonalizedProjects')
        .call({'limit': 10});

    final data = result.data as Map<String, dynamic>;
    final projectsData = data['recommendations'] as List;

    return projectsData
        .map((json) => Project.fromJson(json as Map<String, dynamic>))
        .toList();
  } catch (e) {
    throw Exception('Failed to get recommendations: $e');
  }
}
```

### 4.2 Trending Projects

**Backend**: Cloud Function

```typescript
// functions/src/projects/getTrendingProjects.ts
import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';

export const getTrendingProjects = functions.https.onCall(
  async (data, context) => {
    const limit = data.limit || 10;
    const timeWindow = data.timeWindow || 7; // days

    try {
      const cutoffDate = new Date();
      cutoffDate.setDate(cutoffDate.getDate() - timeWindow);

      // Get projects with most views/contributions in time window
      const projectViewsSnapshot = await admin
        .firestore()
        .collection('project_views')
        .where('viewedAt', '>=', admin.firestore.Timestamp.fromDate(cutoffDate))
        .get();

      // Count views per project
      const viewCounts: Record<string, number> = {};
      projectViewsSnapshot.docs.forEach((doc) => {
        const projectId = doc.data().projectId;
        viewCounts[projectId] = (viewCounts[projectId] || 0) + 1;
      });

      // Sort by view count
      const sortedProjectIds = Object.entries(viewCounts)
        .sort(([, a], [, b]) => b - a)
        .slice(0, limit)
        .map(([id]) => id);

      // Fetch project details
      const projects = await Promise.all(
        sortedProjectIds.map((id) =>
          admin.firestore().collection('projects').doc(id).get()
        )
      );

      return {
        success: true,
        projects: projects
          .filter((doc) => doc.exists)
          .map((doc) => ({
            id: doc.id,
            ...doc.data(),
            trendingScore: viewCounts[doc.id],
          })),
      };
    } catch (error) {
      console.error('Error getting trending projects:', error);
      throw new functions.https.HttpsError(
        'internal',
        'Failed to get trending projects'
      );
    }
  }
);
```

### 4.3 Saved Filter Presets

**File**: `lib/features/projects/presentation/widgets/browse/filter_presets.dart`

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

@freezed
class FilterPreset with _$FilterPreset {
  const factory FilterPreset({
    required String id,
    required String name,
    required ProjectSearchCriteria criteria,
    required DateTime createdAt,
  }) = _FilterPreset;

  factory FilterPreset.fromJson(Map<String, dynamic> json) =>
      _$FilterPresetFromJson(json);
}

class FilterPresetsManager {
  static const String _key = 'filter_presets';

  Future<List<FilterPreset>> loadPresets() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = prefs.getStringList(_key) ?? [];

    return jsonList
        .map((json) => FilterPreset.fromJson(jsonDecode(json)))
        .toList();
  }

  Future<void> savePreset(String name, ProjectSearchCriteria criteria) async {
    final presets = await loadPresets();

    final newPreset = FilterPreset(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      criteria: criteria,
      createdAt: DateTime.now(),
    );

    presets.add(newPreset);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      _key,
      presets.map((p) => jsonEncode(p.toJson())).toList(),
    );
  }

  Future<void> deletePreset(String presetId) async {
    final presets = await loadPresets();
    presets.removeWhere((p) => p.id == presetId);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      _key,
      presets.map((p) => jsonEncode(p.toJson())).toList(),
    );
  }
}
```

**Validation Checklist for Phase 4:**
- [ ] Recommendations endpoint deployed
- [ ] Recommendations display on browse page
- [ ] Recommendations update based on user history
- [ ] Trending projects calculated correctly
- [ ] Trending badge displays on cards
- [ ] Filter presets save successfully
- [ ] Filter presets load and apply correctly
- [ ] Preset management UI works

---

## Testing Strategy

### Unit Tests

**Target**: >80% coverage

```bash
# Run unit tests
flutter test --coverage

# Generate coverage report
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

**Key areas to test:**
- Repository methods (mock Firestore)
- Provider logic (Riverpod testing)
- Utility functions (FilterUrlUtils, etc.)
- Entity serialization/deserialization

### Widget Tests

```dart
// test/features/projects/presentation/widgets/project_card_enhanced_test.dart
void main() {
  testWidgets('ProjectCardEnhanced displays project info correctly',
      (tester) async {
    final project = Project(
      id: 'test-1',
      title: 'Test Project',
      // ... other fields
    );

    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: ProjectCardEnhanced(project: project),
          ),
        ),
      ),
    );

    expect(find.text('Test Project'), findsOneWidget);
    expect(find.text(project.location), findsOneWidget);
    // ... more assertions
  });
}
```

### Integration Tests

```dart
// integration_test/browse_flow_test.dart
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Browse projects end-to-end flow', (tester) async {
    app.main();
    await tester.pumpAndSettle();

    // Navigate to browse page
    await tester.tap(find.text('Browse'));
    await tester.pumpAndSettle();

    // Search for project
    await tester.enterText(find.byType(TextField), 'education');
    await tester.pumpAndSettle(const Duration(seconds: 1));

    // Verify results
    expect(find.byType(ProjectCardEnhanced), findsWidgets);

    // Apply filter
    await tester.tap(find.byIcon(Icons.filter_list));
    await tester.pumpAndSettle();

    // Select category
    await tester.tap(find.text('Education'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Apply Filters'));
    await tester.pumpAndSettle();

    // Verify filtered results
    expect(find.byType(ProjectCardEnhanced), findsWidgets);

    // Tap project card
    await tester.tap(find.byType(ProjectCardEnhanced).first);
    await tester.pumpAndSettle();

    // Verify navigation to project detail
    expect(find.text('Project Details'), findsOneWidget);
  });
}
```

Run integration tests:
```bash
# Android
flutter test integration_test/browse_flow_test.dart --device-id=<android_device>

# iOS
flutter test integration_test/browse_flow_test.dart --device-id=<ios_device>

# Web
flutter drive --driver=test_driver/integration_test.dart \
  --target=integration_test/browse_flow_test.dart -d chrome
```

---

## Performance Benchmarks

### Target Metrics

| Platform | Metric | Target | Measurement Method |
|----------|--------|--------|-------------------|
| All | First meaningful paint | < 2s | DevTools Timeline |
| All | Time to interactive | < 3s | DevTools Timeline |
| Mobile | Scroll FPS | 60fps | DevTools Performance |
| Mobile | Memory usage | < 200MB | DevTools Memory |
| Web | Lighthouse Score | > 90 | Chrome Lighthouse |
| Web | Bundle size | < 10MB | Build output |

### Performance Testing

```dart
// test/performance/scroll_performance_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Scroll performance test', (tester) async {
    await tester.pumpWidget(MyApp());
    await tester.pumpAndSettle();

    // Navigate to browse page
    await tester.tap(find.text('Browse'));
    await tester.pumpAndSettle();

    // Record timeline while scrolling
    await binding.traceAction(() async {
      final listFinder = find.byType(Scrollable);

      // Scroll down
      for (var i = 0; i < 10; i++) {
        await tester.drag(listFinder, const Offset(0, -300));
        await tester.pumpAndSettle();
      }

      // Scroll up
      for (var i = 0; i < 10; i++) {
        await tester.drag(listFinder, const Offset(0, 300));
        await tester.pumpAndSettle();
      }
    });
  });
}
```

Run performance test:
```bash
flutter drive --profile \
  --driver=test_driver/perf_driver.dart \
  --target=test/performance/scroll_performance_test.dart
```

---

## Rollout Plan

### Phase 0: Foundation (Week 1)
- ✅ Complete refactoring
- ✅ Set up testing infrastructure
- ✅ Deploy Firestore indexes
- ✅ Validate multi-platform compatibility

### Phase 1: Essential Features (Week 2-3)
- ✅ Sorting implementation
- ✅ Advanced filters
- ✅ Pagination
- ✅ Enhanced cards
- ✅ Analytics integration
- 🚀 Deploy to internal testing (TestFlight/Internal Track)

### Phase 2: Enhanced UX (Week 4-5)
- ✅ Search enhancements
- ✅ Social sharing
- ✅ Filter persistence
- ✅ Loading states
- ✅ Accessibility
- 🚀 Deploy to beta testing (100 users)

### Phase 3: Platform-Specific (Week 6)
- ✅ Voice search
- ✅ Keyboard shortcuts
- ✅ Swipe gestures
- ✅ SEO optimization
- 🚀 Deploy to production (staged rollout)

### Phase 4: Advanced Features (Week 7-8)
- ✅ AI recommendations
- ✅ Trending projects
- ✅ Filter presets
- 🚀 Feature flag release

---

## Success Criteria

### Functional Requirements
- [ ] All P0 features implemented and tested
- [ ] All P1 features implemented and tested
- [ ] Multi-platform compatibility verified (Android/iOS/Web)
- [ ] Responsive design working on all breakpoints
- [ ] Analytics events tracking correctly

### Quality Requirements
- [ ] Test coverage > 80%
- [ ] Zero critical bugs
- [ ] Performance metrics met (see benchmarks)
- [ ] Accessibility audit passed (WCAG 2.1 AA)
- [ ] Code review approved

### User Acceptance
- [ ] Beta users can complete browse-to-contribute flow
- [ ] Search/filter satisfaction rating > 4/5
- [ ] Page load time acceptable (< 3s)
- [ ] No user-reported blocking issues

---

## Risk Mitigation

### Technical Risks

| Risk | Impact | Mitigation |
|------|--------|------------|
| Firestore query limits | High | Implement proper indexing, pagination |
| Image loading performance | Medium | Use CachedNetworkImage with size optimization |
| Memory leaks in pagination | High | Dispose controllers properly, test with memory profiler |
| Web bundle size too large | Medium | Implement code splitting, tree shaking |

### Schedule Risks

| Risk | Impact | Mitigation |
|------|--------|------------|
| Backend dependencies delayed | High | Mock data for frontend development |
| Testing takes longer than expected | Medium | Parallelize testing across platforms |
| Performance issues discovered late | High | Continuous performance monitoring |

---

## Appendix

### A. Dependencies Reference

See Prerequisites section for complete dependency list.

### B. Firebase Configuration

Ensure Firebase is configured for all platforms:
- Android: `android/app/google-services.json`
- iOS: `ios/Runner/GoogleService-Info.plist`
- Web: Firebase config in `web/index.html`

### C. Troubleshooting

**Issue**: Firestore queries timeout
- **Solution**: Check indexes are deployed (`firebase deploy --only firestore:indexes`)

**Issue**: Images not loading
- **Solution**: Verify Storage security rules allow read access

**Issue**: Analytics not tracking
- **Solution**: Verify Firebase Analytics is initialized in `main.dart`

---

## Document Maintenance

This plan should be updated:
- When requirements change
- After each phase completion
- When technical decisions are made
- When blockers are encountered

**Last Updated**: 2025-01-03
**Next Review**: After Phase 0 completion
