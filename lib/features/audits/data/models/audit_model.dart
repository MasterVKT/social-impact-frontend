import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/audit.dart';

part 'audit_model.freezed.dart';
part 'audit_model.g.dart';

/// Audit model for data layer
@freezed
class AuditModel with _$AuditModel {
  const AuditModel._();

  const factory AuditModel({
    String? id,
    required String projectId,
    String? milestoneId,
    required String type,
    required String status,
    required String assignedTo,
    String? assignedBy,
    @TimestampConverter() DateTime? assignedAt,
    @TimestampConverter() DateTime? completedAt,
    @TimestampConverter() DateTime? dueDate,
    @Default([]) List<AuditCriterionModel> criteria,
    double? overallScore,
    String? reportId,
    String? notes,
    @TimestampConverter() DateTime? createdAt,
    @TimestampConverter() DateTime? updatedAt,
  }) = _AuditModel;

  factory AuditModel.fromJson(Map<String, dynamic> json) =>
      _$AuditModelFromJson(json);

  factory AuditModel.fromEntity(Audit audit) {
    return AuditModel(
      id: audit.id.isEmpty ? null : audit.id,
      projectId: audit.projectId,
      milestoneId: audit.milestoneId,
      type: audit.type.name,
      status: audit.status.name,
      assignedTo: audit.assignedTo,
      assignedBy: audit.assignedBy,
      assignedAt: audit.assignedAt,
      completedAt: audit.completedAt,
      dueDate: audit.dueDate,
      criteria: audit.criteria
          .map((c) => AuditCriterionModel.fromEntity(c))
          .toList(),
      overallScore: audit.overallScore,
      reportId: audit.reportId,
      notes: audit.notes,
      createdAt: audit.createdAt,
      updatedAt: audit.updatedAt,
    );
  }

  Audit toEntity() {
    return Audit(
      id: id ?? '',
      projectId: projectId,
      milestoneId: milestoneId,
      type: AuditType.values.firstWhere((t) => t.name == type),
      status: AuditStatus.values.firstWhere((s) => s.name == status),
      assignedTo: assignedTo,
      assignedBy: assignedBy,
      assignedAt: assignedAt,
      completedAt: completedAt,
      dueDate: dueDate,
      criteria: criteria.map((c) => c.toEntity()).toList(),
      overallScore: overallScore,
      reportId: reportId,
      notes: notes,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

@freezed
class AuditCriterionModel with _$AuditCriterionModel {
  const AuditCriterionModel._();

  const factory AuditCriterionModel({
    required String id,
    required String name,
    required String description,
    required int weight,
    double? score,
    String? notes,
    @Default([]) List<String> evidenceUrls,
  }) = _AuditCriterionModel;

  factory AuditCriterionModel.fromJson(Map<String, dynamic> json) =>
      _$AuditCriterionModelFromJson(json);

  factory AuditCriterionModel.fromEntity(AuditCriterion criterion) {
    return AuditCriterionModel(
      id: criterion.id,
      name: criterion.name,
      description: criterion.description,
      weight: criterion.weight,
      score: criterion.score,
      notes: criterion.notes,
      evidenceUrls: criterion.evidenceUrls,
    );
  }

  AuditCriterion toEntity() {
    return AuditCriterion(
      id: id,
      name: name,
      description: description,
      weight: weight,
      score: score,
      notes: notes,
      evidenceUrls: evidenceUrls,
    );
  }
}

@freezed
class AuditReportModel with _$AuditReportModel {
  const AuditReportModel._();

  const factory AuditReportModel({
    String? id,
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
    required String decision,
    String? rejectionReason,
    @TimestampConverter() DateTime? submittedAt,
    @TimestampConverter() DateTime? createdAt,
  }) = _AuditReportModel;

  factory AuditReportModel.fromJson(Map<String, dynamic> json) =>
      _$AuditReportModelFromJson(json);

  factory AuditReportModel.fromEntity(AuditReport report) {
    return AuditReportModel(
      id: report.id.isEmpty ? null : report.id,
      auditId: report.auditId,
      projectId: report.projectId,
      milestoneId: report.milestoneId,
      auditorId: report.auditorId,
      overallScore: report.overallScore,
      summary: report.summary,
      recommendations: report.recommendations,
      strengths: report.strengths,
      weaknesses: report.weaknesses,
      attachments: report.attachments,
      decision: report.decision.name,
      rejectionReason: report.rejectionReason,
      submittedAt: report.submittedAt,
      createdAt: report.createdAt,
    );
  }

  AuditReport toEntity() {
    return AuditReport(
      id: id ?? '',
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
      decision: AuditDecision.values.firstWhere((d) => d.name == decision),
      rejectionReason: rejectionReason,
      submittedAt: submittedAt,
      createdAt: createdAt,
    );
  }
}

class TimestampConverter implements JsonConverter<DateTime?, Object?> {
  const TimestampConverter();

  @override
  DateTime? fromJson(Object? json) {
    if (json == null) return null;
    if (json is Timestamp) return json.toDate();
    if (json is String) return DateTime.parse(json);
    if (json is int) return DateTime.fromMillisecondsSinceEpoch(json);
    return null;
  }

  @override
  Object? toJson(DateTime? object) {
    if (object == null) return null;
    return Timestamp.fromDate(object);
  }
}
