import '../entities/audit.dart';

/// Repository interface for audits operations
abstract class AuditsRepository {
  /// Get audit by ID
  Future<Audit?> getAudit(String auditId);

  /// Get audits for a project
  Stream<List<Audit>> getProjectAudits(String projectId);

  /// Get audits for an auditor
  Stream<List<Audit>> getAuditorAudits(String auditorId);

  /// Create new audit
  Future<Result<Audit>> createAudit({
    required String projectId,
    String? milestoneId,
    required AuditType type,
    required String assignedTo,
    required String assignedBy,
    required DateTime dueDate,
    required List<AuditCriterion> criteria,
  });

  /// Update audit status
  Future<void> updateAuditStatus(String auditId, AuditStatus status);

  /// Update audit criterion score
  Future<void> updateCriterionScore({
    required String auditId,
    required String criterionId,
    required double score,
    String? notes,
  });

  /// Submit audit report
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
    required AuditDecision decision,
    String? rejectionReason,
  });

  /// Get audit report
  Future<AuditReport?> getAuditReport(String auditId);

  /// Get audits by status
  Stream<List<Audit>> getAuditsByStatus(AuditStatus status);

  /// Delete audit
  Future<void> deleteAudit(String auditId);
}

/// Result wrapper for operations
class Result<T> {
  final T? data;
  final String? error;
  final bool isSuccess;

  Result._({this.data, this.error, required this.isSuccess});

  factory Result.success(T data) {
    return Result._(data: data, isSuccess: true);
  }

  factory Result.failure(String error) {
    return Result._(error: error, isSuccess: false);
  }

  bool get isFailure => !isSuccess;
}
