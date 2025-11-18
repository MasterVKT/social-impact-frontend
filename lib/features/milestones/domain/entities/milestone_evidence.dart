import 'package:freezed_annotation/freezed_annotation.dart';

part 'milestone_evidence.freezed.dart';
part 'milestone_evidence.g.dart';

/// Evidence submitted for a milestone completion
@freezed
class MilestoneEvidence with _$MilestoneEvidence {
  const MilestoneEvidence._();

  const factory MilestoneEvidence({
    @Default('') String id,
    required String milestoneId,
    required String projectId,
    required String submittedBy,
    required String title,
    required String description,
    @Default([]) List<String> fileUrls,
    @Default([]) List<String> imageUrls,
    @Default(EvidenceStatus.pending) EvidenceStatus status,
    String? reviewerNotes,
    String? reviewerId,
    DateTime? submittedAt,
    DateTime? reviewedAt,
    DateTime? createdAt,
  }) = _MilestoneEvidence;

  factory MilestoneEvidence.fromJson(Map<String, dynamic> json) =>
      _$MilestoneEvidenceFromJson(json);

  /// Check if evidence is approved
  bool get isApproved => status == EvidenceStatus.approved;

  /// Check if evidence is rejected
  bool get isRejected => status == EvidenceStatus.rejected;

  /// Check if evidence is under review
  bool get isUnderReview => status == EvidenceStatus.underReview;

  /// Check if evidence can be edited
  bool get canEdit =>
      status == EvidenceStatus.pending || status == EvidenceStatus.rejected;
}

/// Evidence submission status
enum EvidenceStatus {
  pending,
  submitted,
  underReview,
  approved,
  rejected;

  String get displayName {
    switch (this) {
      case EvidenceStatus.pending:
        return 'Pending Submission';
      case EvidenceStatus.submitted:
        return 'Submitted';
      case EvidenceStatus.underReview:
        return 'Under Review';
      case EvidenceStatus.approved:
        return 'Approved';
      case EvidenceStatus.rejected:
        return 'Rejected';
    }
  }
}

/// Milestone update request
@freezed
class MilestoneUpdate with _$MilestoneUpdate {
  const factory MilestoneUpdate({
    required String milestoneId,
    required String projectId,
    String? title,
    String? description,
    DateTime? targetDate,
    String? status,
    double? fundingRequired,
    String? evidenceUrl,
    DateTime? completedDate,
    String? notes,
  }) = _MilestoneUpdate;

  factory MilestoneUpdate.fromJson(Map<String, dynamic> json) =>
      _$MilestoneUpdateFromJson(json);
}
