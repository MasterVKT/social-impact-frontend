import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/foundation.dart';
import '../../data/datasources/audits_firestore_datasource.dart';
import '../../data/repositories/audits_repository_impl.dart';
import '../../domain/entities/audit.dart';
import '../../domain/repositories/audits_repository.dart';
import '../../domain/usecases/create_audit_usecase.dart';
import '../../domain/usecases/submit_audit_report_usecase.dart';
import '../../domain/usecases/update_audit_criterion_usecase.dart';

part 'audits_providers.g.dart';

// ========== DATA SOURCES ==========

/// Firestore data source provider
@riverpod
AuditsFirestoreDataSource auditsFirestoreDataSource(
  AuditsFirestoreDataSourceRef ref,
) {
  final firestore = FirebaseFirestore.instance;
  return AuditsFirestoreDataSource(firestore);
}

// ========== REPOSITORY ==========

/// Audits repository provider
@riverpod
AuditsRepository auditsRepository(AuditsRepositoryRef ref) {
  final firestoreDataSource = ref.watch(auditsFirestoreDataSourceProvider);
  return AuditsRepositoryImpl(firestoreDataSource);
}

// ========== USE CASES ==========

/// Create audit use case provider
@riverpod
CreateAuditUseCase createAuditUseCase(CreateAuditUseCaseRef ref) {
  final repository = ref.watch(auditsRepositoryProvider);
  return CreateAuditUseCase(repository);
}

/// Submit audit report use case provider
@riverpod
SubmitAuditReportUseCase submitAuditReportUseCase(
  SubmitAuditReportUseCaseRef ref,
) {
  final repository = ref.watch(auditsRepositoryProvider);
  return SubmitAuditReportUseCase(repository);
}

/// Update audit criterion use case provider
@riverpod
UpdateAuditCriterionUseCase updateAuditCriterionUseCase(
  UpdateAuditCriterionUseCaseRef ref,
) {
  final repository = ref.watch(auditsRepositoryProvider);
  return UpdateAuditCriterionUseCase(repository);
}

// ========== DATA PROVIDERS ==========

/// Get single audit by ID
@riverpod
Future<Audit?> audit(AuditRef ref, String auditId) async {
  final repository = ref.watch(auditsRepositoryProvider);
  return repository.getAudit(auditId);
}

/// Stream of audits for a project
@riverpod
Stream<List<Audit>> projectAudits(
  ProjectAuditsRef ref,
  String projectId,
) {
  final repository = ref.watch(auditsRepositoryProvider);
  return repository.getProjectAudits(projectId);
}

/// Stream of audits assigned to an auditor
@riverpod
Stream<List<Audit>> auditorAudits(
  AuditorAuditsRef ref,
  String auditorId,
) {
  final repository = ref.watch(auditsRepositoryProvider);
  return repository.getAuditorAudits(auditorId);
}

/// Stream of audits by status
@riverpod
Stream<List<Audit>> auditsByStatus(
  AuditsByStatusRef ref,
  AuditStatus status,
) {
  final repository = ref.watch(auditsRepositoryProvider);
  return repository.getAuditsByStatus(status);
}

/// Get audit report for an audit
@riverpod
Future<AuditReport?> auditReport(AuditReportRef ref, String auditId) async {
  final repository = ref.watch(auditsRepositoryProvider);
  return repository.getAuditReport(auditId);
}

// ========== STATE NOTIFIERS ==========

/// State for audit criterion scoring
@riverpod
class AuditScoringNotifier extends _$AuditScoringNotifier {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  /// Update criterion score
  Future<void> updateCriterionScore({
    required String auditId,
    required String criterionId,
    required double score,
    String? notes,
  }) async {
    state = const AsyncValue.loading();

    final useCase = ref.read(updateAuditCriterionUseCaseProvider);
    final result = await useCase(
      auditId: auditId,
      criterionId: criterionId,
      score: score,
      notes: notes,
    );

    state = result.when(
      success: (_) {
        debugPrint('✅ Criterion scored successfully');
        return const AsyncValue.data(null);
      },
      failure: (error) {
        debugPrint('❌ Failed to score criterion: $error');
        return AsyncValue.error(error, StackTrace.current);
      },
    );
  }

  /// Start audit (change status to in_progress)
  Future<void> startAudit(String auditId) async {
    state = const AsyncValue.loading();

    final repository = ref.read(auditsRepositoryProvider);
    final result = await repository.updateAuditStatus(
      auditId,
      AuditStatus.inProgress,
    );

    state = result.when(
      success: (_) {
        debugPrint('✅ Audit started successfully');
        return const AsyncValue.data(null);
      },
      failure: (error) {
        debugPrint('❌ Failed to start audit: $error');
        return AsyncValue.error(error, StackTrace.current);
      },
    );
  }
}

/// State for audit report submission
@riverpod
class AuditReportSubmissionNotifier extends _$AuditReportSubmissionNotifier {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  /// Submit audit report
  Future<AuditReport?> submitReport({
    required String auditId,
    required String projectId,
    String? milestoneId,
    required String auditorId,
    required List<AuditCriterion> criteria,
    required String summary,
    required String recommendations,
    required List<String> strengths,
    required List<String> weaknesses,
    required AuditDecision decision,
    String? rejectionReason,
    List<String>? attachments,
  }) async {
    state = const AsyncValue.loading();

    final useCase = ref.read(submitAuditReportUseCaseProvider);
    final result = await useCase(
      auditId: auditId,
      projectId: projectId,
      milestoneId: milestoneId,
      auditorId: auditorId,
      criteria: criteria,
      summary: summary,
      recommendations: recommendations,
      strengths: strengths,
      weaknesses: weaknesses,
      decision: decision,
      rejectionReason: rejectionReason,
      attachments: attachments ?? [],
    );

    return result.when(
      success: (report) {
        debugPrint('✅ Audit report submitted successfully');
        state = const AsyncValue.data(null);
        return report;
      },
      failure: (error) {
        debugPrint('❌ Failed to submit audit report: $error');
        state = AsyncValue.error(error, StackTrace.current);
        return null;
      },
    );
  }
}

/// State for audit creation (admin only)
@riverpod
class AuditCreationNotifier extends _$AuditCreationNotifier {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  /// Create new audit assignment
  Future<Audit?> createAudit({
    required String projectId,
    String? milestoneId,
    required AuditType type,
    required String assignedTo,
    required String assignedBy,
    required DateTime dueDate,
  }) async {
    state = const AsyncValue.loading();

    final useCase = ref.read(createAuditUseCaseProvider);
    final result = await useCase(
      projectId: projectId,
      milestoneId: milestoneId,
      type: type,
      assignedTo: assignedTo,
      assignedBy: assignedBy,
      dueDate: dueDate,
    );

    return result.when(
      success: (audit) {
        debugPrint('✅ Audit created successfully');
        state = const AsyncValue.data(null);
        return audit;
      },
      failure: (error) {
        debugPrint('❌ Failed to create audit: $error');
        state = AsyncValue.error(error, StackTrace.current);
        return null;
      },
    );
  }
}

// ========== COMPUTED PROVIDERS ==========

/// Get overdue audits for an auditor
@riverpod
Stream<List<Audit>> overdueAudits(
  OverdueAuditsRef ref,
  String auditorId,
) {
  final auditsStream = ref.watch(auditorAuditsProvider(auditorId));

  return auditsStream.map((audits) {
    final now = DateTime.now();
    return audits.where((audit) {
      return audit.dueDate != null &&
          audit.dueDate!.isBefore(now) &&
          audit.status != AuditStatus.completed;
    }).toList();
  });
}

/// Get pending audits (assigned but not started)
@riverpod
Stream<List<Audit>> pendingAudits(
  PendingAuditsRef ref,
  String auditorId,
) {
  final auditsStream = ref.watch(auditorAuditsProvider(auditorId));

  return auditsStream.map((audits) {
    return audits.where((audit) => audit.status == AuditStatus.assigned).toList();
  });
}

/// Get in-progress audits
@riverpod
Stream<List<Audit>> inProgressAudits(
  InProgressAuditsRef ref,
  String auditorId,
) {
  final auditsStream = ref.watch(auditorAuditsProvider(auditorId));

  return auditsStream.map((audits) {
    return audits.where((audit) => audit.status == AuditStatus.inProgress).toList();
  });
}

/// Get completed audits for an auditor
@riverpod
Stream<List<Audit>> completedAudits(
  CompletedAuditsRef ref,
  String auditorId,
) {
  final auditsStream = ref.watch(auditorAuditsProvider(auditorId));

  return auditsStream.map((audits) {
    return audits.where((audit) => audit.status == AuditStatus.completed).toList();
  });
}

/// Calculate audit progress percentage
@riverpod
double auditProgress(AuditProgressRef ref, Audit audit) {
  final totalCriteria = audit.criteria.length;
  if (totalCriteria == 0) return 0.0;

  final scoredCriteria = audit.criteria.where((c) => c.score != null).length;
  return (scoredCriteria / totalCriteria) * 100;
}
