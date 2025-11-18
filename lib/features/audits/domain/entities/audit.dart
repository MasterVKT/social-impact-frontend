import 'package:freezed_annotation/freezed_annotation.dart';

part 'audit.freezed.dart';
part 'audit.g.dart';

/// Audit entity for project/milestone verification
@freezed
class Audit with _$Audit {
  const Audit._();

  const factory Audit({
    @Default('') String id,
    required String projectId,
    String? milestoneId,
    required AuditType type,
    required AuditStatus status,
    required String assignedTo,
    String? assignedBy,
    DateTime? assignedAt,
    DateTime? completedAt,
    DateTime? dueDate,
    @Default([]) List<AuditCriterion> criteria,
    double? overallScore,
    String? reportId,
    String? notes,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Audit;

  factory Audit.fromJson(Map<String, dynamic> json) => _$AuditFromJson(json);

  /// Check if audit is overdue
  bool get isOverdue {
    if (status == AuditStatus.completed) return false;
    if (dueDate == null) return false;
    return dueDate!.isBefore(DateTime.now());
  }

  /// Check if audit is completed
  bool get isCompleted => status == AuditStatus.completed;

  /// Check if audit is in progress
  bool get isInProgress => status == AuditStatus.inProgress;

  /// Calculate completion percentage based on criteria
  double get completionPercentage {
    if (criteria.isEmpty) return 0.0;
    final scoredCriteria = criteria.where((c) => c.score != null).length;
    return (scoredCriteria / criteria.length * 100).clamp(0.0, 100.0);
  }
}

/// Audit type enum
enum AuditType {
  projectInitial,
  projectInterim,
  projectFinal,
  milestoneCompletion;

  String get displayName {
    switch (this) {
      case AuditType.projectInitial:
        return 'Initial Project Audit';
      case AuditType.projectInterim:
        return 'Interim Project Audit';
      case AuditType.projectFinal:
        return 'Final Project Audit';
      case AuditType.milestoneCompletion:
        return 'Milestone Completion Audit';
    }
  }
}

/// Audit status enum
enum AuditStatus {
  assigned,
  inProgress,
  completed,
  rejected;

  String get displayName {
    switch (this) {
      case AuditStatus.assigned:
        return 'Assigned';
      case AuditStatus.inProgress:
        return 'In Progress';
      case AuditStatus.completed:
        return 'Completed';
      case AuditStatus.rejected:
        return 'Rejected';
    }
  }
}

/// Audit criterion for scoring
@freezed
class AuditCriterion with _$AuditCriterion {
  const AuditCriterion._();

  const factory AuditCriterion({
    required String id,
    required String name,
    required String description,
    required int weight, // Weight percentage (1-100)
    double? score, // Score out of 10
    String? notes,
    @Default([]) List<String> evidenceUrls,
  }) = _AuditCriterion;

  factory AuditCriterion.fromJson(Map<String, dynamic> json) =>
      _$AuditCriterionFromJson(json);

  /// Calculate weighted score
  double get weightedScore {
    if (score == null) return 0.0;
    return (score! / 10) * weight;
  }
}

/// Audit report entity
@freezed
class AuditReport with _$AuditReport {
  const AuditReport._();

  const factory AuditReport({
    @Default('') String id,
    required String auditId,
    required String projectId,
    String? milestoneId,
    required String auditorId,
    required double overallScore,
    required String summary,
    required String recommendations,
    @Default([]) List<String> strengths,
    @Default([]) List<String> weaknesses,
    @Default([]) List<String> attachments,
    required AuditDecision decision,
    String? rejectionReason,
    DateTime? submittedAt,
    DateTime? createdAt,
  }) = _AuditReport;

  factory AuditReport.fromJson(Map<String, dynamic> json) =>
      _$AuditReportFromJson(json);

  /// Get score grade
  String get scoreGrade {
    if (overallScore >= 9.0) return 'A+';
    if (overallScore >= 8.0) return 'A';
    if (overallScore >= 7.0) return 'B';
    if (overallScore >= 6.0) return 'C';
    if (overallScore >= 5.0) return 'D';
    return 'F';
  }

  /// Check if report is approved
  bool get isApproved => decision == AuditDecision.approved;

  /// Check if report is rejected
  bool get isRejected => decision == AuditDecision.rejected;
}

/// Audit decision enum
enum AuditDecision {
  approved,
  approvedWithConditions,
  rejected;

  String get displayName {
    switch (this) {
      case AuditDecision.approved:
        return 'Approved';
      case AuditDecision.approvedWithConditions:
        return 'Approved with Conditions';
      case AuditDecision.rejected:
        return 'Rejected';
    }
  }
}
