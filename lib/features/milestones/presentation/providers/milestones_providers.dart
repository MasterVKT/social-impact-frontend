import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/services/storage/firebase_storage_service.dart';
import '../../../projects/domain/entities/project.dart';
import '../../data/datasources/milestones_firestore_datasource.dart';
import '../../data/datasources/milestones_storage_datasource.dart';
import '../../data/repositories/milestones_repository_impl.dart';
import '../../domain/entities/milestone_evidence.dart';
import '../../domain/repositories/milestones_repository.dart';
import '../../domain/usecases/submit_milestone_evidence_usecase.dart';
import '../../domain/usecases/update_milestone_status_usecase.dart';
import '../../domain/usecases/review_evidence_usecase.dart';

part 'milestones_providers.g.dart';

// ========== DATA SOURCES ==========

/// Firestore data source provider
@riverpod
MilestonesFirestoreDataSource milestonesFirestoreDataSource(
  MilestonesFirestoreDataSourceRef ref,
) {
  final firestore = FirebaseFirestore.instance;
  return MilestonesFirestoreDataSource(firestore);
}

/// Storage data source provider
@riverpod
MilestonesStorageDataSource milestonesStorageDataSource(
  MilestonesStorageDataSourceRef ref,
) {
  final storageService = FirebaseStorageService.instance;
  return MilestonesStorageDataSource(storageService);
}

// ========== REPOSITORY ==========

/// Milestones repository provider
@riverpod
MilestonesRepository milestonesRepository(MilestonesRepositoryRef ref) {
  final firestoreDataSource = ref.watch(milestonesFirestoreDataSourceProvider);
  final storageDataSource = ref.watch(milestonesStorageDataSourceProvider);
  return MilestonesRepositoryImpl(firestoreDataSource, storageDataSource);
}

// ========== USE CASES ==========

/// Submit milestone evidence use case provider
@riverpod
SubmitMilestoneEvidenceUseCase submitMilestoneEvidenceUseCase(
  SubmitMilestoneEvidenceUseCaseRef ref,
) {
  final repository = ref.watch(milestonesRepositoryProvider);
  return SubmitMilestoneEvidenceUseCase(repository);
}

/// Update milestone status use case provider
@riverpod
UpdateMilestoneStatusUseCase updateMilestoneStatusUseCase(
  UpdateMilestoneStatusUseCaseRef ref,
) {
  final repository = ref.watch(milestonesRepositoryProvider);
  return UpdateMilestoneStatusUseCase(repository);
}

/// Review evidence use case provider
@riverpod
ReviewEvidenceUseCase reviewEvidenceUseCase(ReviewEvidenceUseCaseRef ref) {
  final repository = ref.watch(milestonesRepositoryProvider);
  return ReviewEvidenceUseCase(repository);
}

// ========== DATA PROVIDERS ==========

/// Get project milestones stream
@riverpod
Stream<List<ProjectMilestone>> projectMilestones(
  ProjectMilestonesRef ref,
  String projectId,
) {
  final repository = ref.watch(milestonesRepositoryProvider);
  return repository.getProjectMilestones(projectId);
}

/// Get milestones by status
@riverpod
Stream<List<ProjectMilestone>> milestonesByStatus(
  MilestonesByStatusRef ref,
  String projectId,
  MilestoneStatus status,
) {
  final repository = ref.watch(milestonesRepositoryProvider);
  return repository.getMilestonesByStatus(projectId, status);
}

/// Get milestone evidence
@riverpod
Future<MilestoneEvidence?> milestoneEvidence(
  MilestoneEvidenceRef ref,
  String milestoneId,
) async {
  final repository = ref.watch(milestonesRepositoryProvider);
  return repository.getMilestoneEvidence(milestoneId);
}

// ========== STATE MANAGEMENT ==========

/// Evidence submission state
@riverpod
class EvidenceSubmissionNotifier extends _$EvidenceSubmissionNotifier {
  @override
  FutureOr<void> build() {}

  /// Submit evidence for a milestone
  Future<Result<MilestoneEvidence>> submitEvidence({
    required String milestoneId,
    required String projectId,
    required String submittedBy,
    required String title,
    required String description,
    List<File>? files,
    List<File>? images,
  }) async {
    state = const AsyncValue.loading();

    final useCase = ref.read(submitMilestoneEvidenceUseCaseProvider);

    final result = await useCase.call(
      milestoneId: milestoneId,
      projectId: projectId,
      submittedBy: submittedBy,
      title: title,
      description: description,
      files: files,
      images: images,
    );

    if (result.isSuccess) {
      state = const AsyncValue.data(null);
      // Invalidate project milestones to refresh
      ref.invalidate(projectMilestonesProvider(projectId));
    } else {
      state = AsyncValue.error(
        result.error ?? 'Unknown error',
        StackTrace.current,
      );
    }

    return result;
  }

  /// Update evidence
  Future<Result<MilestoneEvidence>> updateEvidence({
    required String evidenceId,
    required String title,
    required String description,
    List<File>? newFiles,
    List<File>? newImages,
  }) async {
    state = const AsyncValue.loading();

    try {
      final repository = ref.read(milestonesRepositoryProvider);

      final result = await repository.updateEvidence(
        evidenceId: evidenceId,
        title: title,
        description: description,
        newFiles: newFiles,
        newImages: newImages,
      );

      if (result.isSuccess) {
        state = const AsyncValue.data(null);
        // Invalidate evidence to refresh
        ref.invalidate(milestoneEvidenceProvider);
      } else {
        state = AsyncValue.error(
          result.error ?? 'Unknown error',
          StackTrace.current,
        );
      }

      return result;
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
      return Result.failure(e.toString());
    }
  }
}

/// Milestone status update notifier
@riverpod
class MilestoneStatusNotifier extends _$MilestoneStatusNotifier {
  @override
  FutureOr<void> build() {}

  /// Update milestone status
  Future<Result<void>> updateStatus({
    required String projectId,
    required String milestoneId,
    required MilestoneStatus newStatus,
  }) async {
    state = const AsyncValue.loading();

    try {
      final repository = ref.read(milestonesRepositoryProvider) as MilestonesRepositoryImpl;

      await repository.updateMilestoneStatusWithProject(
        projectId,
        milestoneId,
        newStatus,
      );

      state = const AsyncValue.data(null);

      // Invalidate project milestones to refresh
      ref.invalidate(projectMilestonesProvider(projectId));

      return Result.success(null);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
      return Result.failure(e.toString());
    }
  }
}

/// Evidence review notifier (for auditors)
@riverpod
class EvidenceReviewNotifier extends _$EvidenceReviewNotifier {
  @override
  FutureOr<void> build() {}

  /// Review evidence
  Future<Result<void>> reviewEvidence({
    required String evidenceId,
    required String reviewerId,
    required bool approved,
    String? reviewerNotes,
  }) async {
    state = const AsyncValue.loading();

    final useCase = ref.read(reviewEvidenceUseCaseProvider);

    final result = await useCase.call(
      evidenceId: evidenceId,
      reviewerId: reviewerId,
      approved: approved,
      reviewerNotes: reviewerNotes,
    );

    if (result.isSuccess) {
      state = const AsyncValue.data(null);
      // Invalidate evidence to refresh
      ref.invalidate(milestoneEvidenceProvider);
    } else {
      state = AsyncValue.error(
        result.error ?? 'Unknown error',
        StackTrace.current,
      );
    }

    return result;
  }
}
