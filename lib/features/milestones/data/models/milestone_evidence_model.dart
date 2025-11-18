import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/milestone_evidence.dart';

part 'milestone_evidence_model.freezed.dart';
part 'milestone_evidence_model.g.dart';

/// Milestone evidence model for data layer
@freezed
class MilestoneEvidenceModel with _$MilestoneEvidenceModel {
  const MilestoneEvidenceModel._();

  const factory MilestoneEvidenceModel({
    String? id,
    required String milestoneId,
    required String projectId,
    required String submittedBy,
    required String title,
    required String description,
    @Default([]) List<String> fileUrls,
    @Default([]) List<String> imageUrls,
    @Default('pending') String status,
    String? reviewerNotes,
    String? reviewerId,
    @TimestampConverter() DateTime? submittedAt,
    @TimestampConverter() DateTime? reviewedAt,
    @TimestampConverter() DateTime? createdAt,
  }) = _MilestoneEvidenceModel;

  factory MilestoneEvidenceModel.fromJson(Map<String, dynamic> json) =>
      _$MilestoneEvidenceModelFromJson(json);

  /// Convert from domain entity
  factory MilestoneEvidenceModel.fromEntity(MilestoneEvidence evidence) {
    return MilestoneEvidenceModel(
      id: evidence.id.isEmpty ? null : evidence.id,
      milestoneId: evidence.milestoneId,
      projectId: evidence.projectId,
      submittedBy: evidence.submittedBy,
      title: evidence.title,
      description: evidence.description,
      fileUrls: evidence.fileUrls,
      imageUrls: evidence.imageUrls,
      status: evidence.status.name,
      reviewerNotes: evidence.reviewerNotes,
      reviewerId: evidence.reviewerId,
      submittedAt: evidence.submittedAt,
      reviewedAt: evidence.reviewedAt,
      createdAt: evidence.createdAt,
    );
  }

  /// Convert to domain entity
  MilestoneEvidence toEntity() {
    return MilestoneEvidence(
      id: id ?? '',
      milestoneId: milestoneId,
      projectId: projectId,
      submittedBy: submittedBy,
      title: title,
      description: description,
      fileUrls: fileUrls,
      imageUrls: imageUrls,
      status: EvidenceStatus.values.firstWhere(
        (s) => s.name == status,
        orElse: () => EvidenceStatus.pending,
      ),
      reviewerNotes: reviewerNotes,
      reviewerId: reviewerId,
      submittedAt: submittedAt,
      reviewedAt: reviewedAt,
      createdAt: createdAt,
    );
  }
}

/// Custom converter for Firestore Timestamps
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
