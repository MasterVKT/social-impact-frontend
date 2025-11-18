import 'dart:io';
import '../../domain/entities/milestone_evidence.dart';
import '../../../projects/domain/entities/project.dart';

/// Repository interface for milestones operations
abstract class MilestonesRepository {
  /// Get milestone by ID
  Future<ProjectMilestone?> getMilestone(String milestoneId);

  /// Get milestones for a project
  Stream<List<ProjectMilestone>> getProjectMilestones(String projectId);

  /// Update milestone status
  Future<void> updateMilestoneStatus(
    String milestoneId,
    MilestoneStatus status,
  );

  /// Submit evidence for milestone
  Future<Result<MilestoneEvidence>> submitEvidence({
    required String milestoneId,
    required String projectId,
    required String submittedBy,
    required String title,
    required String description,
    List<File>? files,
    List<File>? images,
  });

  /// Get evidence for a milestone
  Future<MilestoneEvidence?> getMilestoneEvidence(String milestoneId);

  /// Update evidence
  Future<Result<MilestoneEvidence>> updateEvidence({
    required String evidenceId,
    required String title,
    required String description,
    List<File>? newFiles,
    List<File>? newImages,
  });

  /// Review evidence (auditor only)
  Future<void> reviewEvidence({
    required String evidenceId,
    required String reviewerId,
    required EvidenceStatus status,
    String? reviewerNotes,
  });

  /// Delete evidence
  Future<void> deleteEvidence(String evidenceId);

  /// Get milestones by status
  Stream<List<ProjectMilestone>> getMilestonesByStatus(
    String projectId,
    MilestoneStatus status,
  );
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
