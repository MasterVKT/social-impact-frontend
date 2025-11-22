import '../../domain/entities/audit.dart';
import '../../domain/repositories/audits_repository.dart';
import '../datasources/audits_firestore_datasource.dart';
import '../models/audit_model.dart';

class AuditsRepositoryImpl implements AuditsRepository {
  final AuditsFirestoreDataSource _firestoreDataSource;

  AuditsRepositoryImpl(this._firestoreDataSource);

  @override
  Future<Result<Audit>> createAudit({
    required String projectId,
    String? milestoneId,
    required AuditType type,
    required String assignedTo,
    required String assignedBy,
    required DateTime dueDate,
    required List<AuditCriterion> criteria,
  }) async {
    try {
      final audit = AuditModel(
        projectId: projectId,
        milestoneId: milestoneId,
        type: type.name,
        status: AuditStatus.assigned.name,
        assignedTo: assignedTo,
        assignedBy: assignedBy,
        assignedAt: DateTime.now(),
        dueDate: dueDate,
        criteria: criteria.map((c) => AuditCriterionModel.fromEntity(c)).toList(),
        createdAt: DateTime.now(),
      );

      final auditId = await _firestoreDataSource.createAudit(audit);
      final createdAudit = await _firestoreDataSource.getAudit(auditId);

      if (createdAudit == null) {
        return Result.failure('Failed to retrieve created audit');
      }

      return Result.success(createdAudit.toEntity());
    } catch (e) {
      return Result.failure('Failed to create audit: $e');
    }
  }

  @override
  Future<Audit?> getAudit(String auditId) async {
    try {
      final audit = await _firestoreDataSource.getAudit(auditId);
      return audit?.toEntity();
    } catch (e) {
      return null;
    }
  }

  @override
  Stream<List<Audit>> getProjectAudits(String projectId) {
    return _firestoreDataSource
        .getProjectAudits(projectId)
        .map((audits) => audits.map((a) => a.toEntity()).toList());
  }

  @override
  Stream<List<Audit>> getAuditorAudits(String auditorId) {
    return _firestoreDataSource
        .getAuditorAudits(auditorId)
        .map((audits) => audits.map((a) => a.toEntity()).toList());
  }

  @override
  Stream<List<Audit>> getAuditsByStatus(AuditStatus status) {
    return _firestoreDataSource
        .getAuditsByStatus(status)
        .map((audits) => audits.map((a) => a.toEntity()).toList());
  }

  @override
  Future<Result<void>> updateAuditStatus(String auditId, AuditStatus status) async {
    try {
      await _firestoreDataSource.updateAuditStatus(auditId, status);
      return Result.success(null);
    } catch (e) {
      return Result.failure('Failed to update audit status: $e');
    }
  }

  @override
  Future<Result<void>> updateCriterionScore({
    required String auditId,
    required String criterionId,
    required double score,
    String? notes,
  }) async {
    try {
      await _firestoreDataSource.updateCriterionScore(
        auditId: auditId,
        criterionId: criterionId,
        score: score,
        notes: notes,
      );
      return Result.success(null);
    } catch (e) {
      return Result.failure('Failed to update criterion score: $e');
    }
  }

  @override
  Future<Result<AuditReport>> submitAuditReport({
    required String auditId,
    required String projectId,
    String? milestoneId,
    required String auditorId,
    required double overallScore,
    required String summary,
    required String recommendations,
    required List<String> strengths,
    required List<String> weaknesses,
    required List<String> attachments,
    required AuditDecision decision,
    String? rejectionReason,
  }) async {
    try {
      final report = AuditReportModel(
        auditId: auditId,
        projectId: projectId,
        milestoneId: milestoneId,
        auditorId: auditorId,
        overallScore: overallScore,
        summary: summary,
        recommendations: recommendations,
        strengths: strengths,
        weaknesses: weaknesses,
        attachments: attachments,
        decision: decision.name,
        rejectionReason: rejectionReason,
        submittedAt: DateTime.now(),
        createdAt: DateTime.now(),
      );

      final reportId = await _firestoreDataSource.createAuditReport(report);

      // Update audit status to completed and link to report
      await _firestoreDataSource.updateAuditStatus(auditId, AuditStatus.completed);

      final createdReport = await _firestoreDataSource.getAuditReport(auditId);

      if (createdReport == null) {
        return Result.failure('Failed to retrieve created report');
      }

      return Result.success(createdReport.toEntity());
    } catch (e) {
      return Result.failure('Failed to submit audit report: $e');
    }
  }

  @override
  Future<AuditReport?> getAuditReport(String auditId) async {
    try {
      final report = await _firestoreDataSource.getAuditReport(auditId);
      return report?.toEntity();
    } catch (e) {
      return null;
    }
  }

  @override
  Future<Result<void>> deleteAudit(String auditId) async {
    try {
      await _firestoreDataSource.deleteAudit(auditId);
      return Result.success(null);
    } catch (e) {
      return Result.failure('Failed to delete audit: $e');
    }
  }
}
