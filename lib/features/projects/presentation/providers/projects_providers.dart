import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/services/storage/firebase_storage_service.dart';
import '../../data/datasources/projects_firestore_datasource.dart';
import '../../data/datasources/projects_storage_datasource.dart';
import '../../data/repositories/projects_repository_impl.dart';
import '../../domain/entities/project.dart';
import '../../domain/repositories/projects_repository.dart';
import '../../domain/usecases/create_project_usecase.dart';
import '../../domain/usecases/update_project_usecase.dart';
import '../../domain/usecases/submit_project_usecase.dart';
import '../../domain/usecases/delete_project_usecase.dart';

part 'projects_providers.g.dart';

// ========== DATA SOURCES ==========

/// Firestore data source provider
@riverpod
ProjectsFirestoreDataSource projectsFirestoreDataSource(
  ProjectsFirestoreDataSourceRef ref,
) {
  final firestore = FirebaseFirestore.instance;
  return ProjectsFirestoreDataSource(firestore);
}

/// Storage data source provider
@riverpod
ProjectsStorageDataSource projectsStorageDataSource(
  ProjectsStorageDataSourceRef ref,
) {
  final storageService = FirebaseStorageService.instance;
  return ProjectsStorageDataSource(storageService);
}

// ========== REPOSITORY ==========

/// Projects repository provider
@riverpod
ProjectsRepository projectsRepository(ProjectsRepositoryRef ref) {
  final firestoreDataSource = ref.watch(projectsFirestoreDataSourceProvider);
  final storageDataSource = ref.watch(projectsStorageDataSourceProvider);
  return ProjectsRepositoryImpl(firestoreDataSource, storageDataSource);
}

// ========== USE CASES ==========

/// Create project use case provider
@riverpod
CreateProjectUseCase createProjectUseCase(CreateProjectUseCaseRef ref) {
  final repository = ref.watch(projectsRepositoryProvider);
  return CreateProjectUseCase(repository);
}

/// Update project use case provider
@riverpod
UpdateProjectUseCase updateProjectUseCase(UpdateProjectUseCaseRef ref) {
  final repository = ref.watch(projectsRepositoryProvider);
  return UpdateProjectUseCase(repository);
}

/// Submit project use case provider
@riverpod
SubmitProjectUseCase submitProjectUseCase(SubmitProjectUseCaseRef ref) {
  final repository = ref.watch(projectsRepositoryProvider);
  return SubmitProjectUseCase(repository);
}

/// Delete project use case provider
@riverpod
DeleteProjectUseCase deleteProjectUseCase(DeleteProjectUseCaseRef ref) {
  final repository = ref.watch(projectsRepositoryProvider);
  return DeleteProjectUseCase(repository);
}

// ========== DATA PROVIDERS ==========

/// Get single project by ID
@riverpod
Future<Project?> project(ProjectRef ref, String projectId) async {
  final repository = ref.watch(projectsRepositoryProvider);
  return repository.getProject(projectId);
}

/// Stream of projects with optional filters
@riverpod
Stream<List<Project>> projects(
  ProjectsRef ref, {
  ProjectCategory? category,
  ProjectStatus? status,
  String? creatorId,
  int? limit,
}) {
  final repository = ref.watch(projectsRepositoryProvider);
  return repository.getProjects(
    category: category,
    status: status,
    creatorId: creatorId,
    limit: limit,
  );
}

/// Stream of active projects (fundingActive status)
@riverpod
Stream<List<Project>> activeProjects(
  ActiveProjectsRef ref, {
  int? limit,
}) {
  final repository = ref.watch(projectsRepositoryProvider);
  return repository.getActiveProjects(limit: limit);
}

/// Stream of projects for a specific creator
@riverpod
Stream<List<Project>> creatorProjects(
  CreatorProjectsRef ref,
  String creatorId,
) {
  final repository = ref.watch(projectsRepositoryProvider);
  return repository.getCreatorProjects(creatorId);
}

/// Stream of projects by category
@riverpod
Stream<List<Project>> projectsByCategory(
  ProjectsByCategoryRef ref,
  ProjectCategory category, {
  int? limit,
}) {
  final repository = ref.watch(projectsRepositoryProvider);
  return repository.getProjectsByCategory(category, limit: limit);
}

/// Search projects
@riverpod
Future<List<Project>> searchProjects(
  SearchProjectsRef ref,
  String query,
) async {
  final repository = ref.watch(projectsRepositoryProvider);
  return repository.searchProjects(query);
}

/// Get creator statistics
@riverpod
Future<Map<String, dynamic>> creatorStats(
  CreatorStatsRef ref,
  String creatorId,
) async {
  final repository = ref.watch(projectsRepositoryProvider);
  return repository.getCreatorStats(creatorId);
}

// ========== STATE MANAGEMENT ==========

/// Project creation state
@riverpod
class ProjectCreationNotifier extends _$ProjectCreationNotifier {
  @override
  FutureOr<void> build() {}

  /// Create a new project
  Future<Result<Project>> createProject({
    required String name,
    required String description,
    required ProjectCategory category,
    required double fundingGoal,
    required String currency,
    required int duration,
    required String location,
    required String creatorId,
    required List<ProjectMilestone> milestones,
    File? coverImage,
    List<File>? additionalImages,
  }) async {
    state = const AsyncValue.loading();

    final useCase = ref.read(createProjectUseCaseProvider);

    final result = await useCase.call(
      name: name,
      description: description,
      category: category,
      fundingGoal: fundingGoal,
      currency: currency,
      duration: duration,
      location: location,
      creatorId: creatorId,
      milestones: milestones,
      coverImage: coverImage,
      additionalImages: additionalImages,
    );

    if (result.isSuccess) {
      state = const AsyncValue.data(null);
      // Invalidate projects list to refresh
      ref.invalidate(projectsProvider);
      ref.invalidate(creatorProjectsProvider);
    } else {
      state = AsyncValue.error(
        result.error ?? 'Unknown error',
        StackTrace.current,
      );
    }

    return result;
  }
}

/// Project update state
@riverpod
class ProjectUpdateNotifier extends _$ProjectUpdateNotifier {
  @override
  FutureOr<void> build() {}

  /// Update an existing project
  Future<Result<Project>> updateProject({
    required Project project,
    File? coverImage,
    List<File>? additionalImages,
  }) async {
    state = const AsyncValue.loading();

    final useCase = ref.read(updateProjectUseCaseProvider);

    final result = await useCase.call(
      project,
      coverImage: coverImage,
      additionalImages: additionalImages,
    );

    if (result.isSuccess) {
      state = const AsyncValue.data(null);
      // Invalidate related providers
      ref.invalidate(projectProvider(project.id));
      ref.invalidate(projectsProvider);
      ref.invalidate(creatorProjectsProvider);
    } else {
      state = AsyncValue.error(
        result.error ?? 'Unknown error',
        StackTrace.current,
      );
    }

    return result;
  }

  /// Submit project for approval
  Future<Result<Project>> submitProject(String projectId) async {
    state = const AsyncValue.loading();

    final useCase = ref.read(submitProjectUseCaseProvider);

    final result = await useCase.call(projectId);

    if (result.isSuccess) {
      state = const AsyncValue.data(null);
      // Invalidate related providers
      ref.invalidate(projectProvider(projectId));
      ref.invalidate(projectsProvider);
      ref.invalidate(creatorProjectsProvider);
    } else {
      state = AsyncValue.error(
        result.error ?? 'Unknown error',
        StackTrace.current,
      );
    }

    return result;
  }

  /// Delete a project
  Future<Result<void>> deleteProject(String projectId) async {
    state = const AsyncValue.loading();

    final useCase = ref.read(deleteProjectUseCaseProvider);

    final result = await useCase.call(projectId);

    if (result.isSuccess) {
      state = const AsyncValue.data(null);
      // Invalidate related providers
      ref.invalidate(projectsProvider);
      ref.invalidate(creatorProjectsProvider);
    } else {
      state = AsyncValue.error(
        result.error ?? 'Unknown error',
        StackTrace.current,
      );
    }

    return result;
  }
}

/// Project status update notifier
@riverpod
class ProjectStatusNotifier extends _$ProjectStatusNotifier {
  @override
  FutureOr<void> build() {}

  /// Update project status
  Future<void> updateStatus(String projectId, ProjectStatus status) async {
    state = const AsyncValue.loading();

    try {
      final repository = ref.read(projectsRepositoryProvider);
      await repository.updateProjectStatus(projectId, status);

      state = const AsyncValue.data(null);

      // Invalidate related providers
      ref.invalidate(projectProvider(projectId));
      ref.invalidate(projectsProvider);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
      rethrow;
    }
  }

  /// Update project funding
  Future<void> updateFunding(String projectId, double newFunding) async {
    state = const AsyncValue.loading();

    try {
      final repository = ref.read(projectsRepositoryProvider);
      await repository.updateProjectFunding(projectId, newFunding);

      state = const AsyncValue.data(null);

      // Invalidate related providers
      ref.invalidate(projectProvider(projectId));
      ref.invalidate(projectsProvider);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
      rethrow;
    }
  }
}
