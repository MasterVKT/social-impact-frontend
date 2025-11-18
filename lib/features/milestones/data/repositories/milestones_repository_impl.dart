import 'dart:io';
import 'package:flutter/foundation.dart';
import '../../domain/entities/milestone_evidence.dart';
import '../../domain/repositories/milestones_repository.dart';
import '../../../projects/domain/entities/project.dart';
import '../datasources/milestones_firestore_datasource.dart';
import '../datasources/milestones_storage_datasource.dart';
import '../models/milestone_evidence_model.dart';

/// Implementation of MilestonesRepository
class MilestonesRepositoryImpl implements MilestonesRepository {
  final MilestonesFirestoreDataSource _firestoreDataSource;
  final MilestonesStorageDataSource _storageDataSource;

  MilestonesRepositoryImpl(
    this._firestoreDataSource,
    this._storageDataSource,
  );

  @override
  Future<ProjectMilestone?> getMilestone(String milestoneId) async {
    try {
      // Note: We need projectId to fetch milestone
      // This is a limitation - milestones are embedded in projects
      // For now, return null - caller should use getProjectMilestones
      debugPrint('⚠️ getMilestone requires projectId - use getProjectMilestones');
      return null;
    } catch (e) {
      debugPrint('❌ Error getting milestone: $e');
      return null;
    }
  }

  @override
  Stream<List<ProjectMilestone>> getProjectMilestones(String projectId) {
    return _firestoreDataSource.getProjectMilestones(projectId);
  }

  @override
  Future<void> updateMilestoneStatus(
    String milestoneId,
    MilestoneStatus status,
  ) async {
    // Note: We need projectId - this should be refactored
    // For now, throw an exception
    throw UnimplementedError(
      'updateMilestoneStatus requires projectId - use overloaded version',
    );
  }

  /// Update milestone status (with projectId)
  Future<void> updateMilestoneStatusWithProject(
    String projectId,
    String milestoneId,
    MilestoneStatus status,
  ) async {
    try {
      await _firestoreDataSource.updateMilestoneStatus(
        projectId,
        milestoneId,
        status,
      );
    } catch (e) {
      debugPrint('❌ Error updating milestone status: $e');
      rethrow;
    }
  }

  @override
  Future<Result<MilestoneEvidence>> submitEvidence({
    required String milestoneId,
    required String projectId,
    required String submittedBy,
    required String title,
    required String description,
    List<File>? files,
    List<File>? images,
  }) async {
    try {
      // Create evidence model
      final evidence = MilestoneEvidenceModel(
        milestoneId: milestoneId,
        projectId: projectId,
        submittedBy: submittedBy,
        title: title,
        description: description,
        status: EvidenceStatus.submitted.name,
      );

      // Create evidence in Firestore first (to get ID)
      final evidenceId = await _firestoreDataSource.createEvidence(evidence);

      // Upload files if provided
      List<String> fileUrls = [];
      List<String> imageUrls = [];

      if (files != null && files.isNotEmpty) {
        fileUrls = await _storageDataSource.uploadEvidenceFiles(
          files,
          projectId,
          milestoneId,
        );
      }

      if (images != null && images.isNotEmpty) {
        imageUrls = await _storageDataSource.uploadEvidenceImages(
          images,
          projectId,
          milestoneId,
        );
      }

      // Update evidence with file URLs
      if (fileUrls.isNotEmpty || imageUrls.isNotEmpty) {
        await _firestoreDataSource.updateEvidence(evidenceId, {
          'fileUrls': fileUrls,
          'imageUrls': imageUrls,
        });
      }

      // Update milestone status to submitted
      await _firestoreDataSource.updateMilestoneStatus(
        projectId,
        milestoneId,
        MilestoneStatus.submitted,
      );

      // Return created evidence with ID and URLs
      final createdEvidence = evidence.toEntity().copyWith(
        id: evidenceId,
        fileUrls: fileUrls,
        imageUrls: imageUrls,
      );

      debugPrint('✅ Evidence submitted successfully: $evidenceId');
      return Result.success(createdEvidence);
    } catch (e) {
      debugPrint('❌ Error submitting evidence: $e');
      return Result.failure('Failed to submit evidence: $e');
    }
  }

  @override
  Future<MilestoneEvidence?> getMilestoneEvidence(String milestoneId) async {
    try {
      final model = await _firestoreDataSource.getEvidence(milestoneId);
      return model?.toEntity();
    } catch (e) {
      debugPrint('❌ Error getting milestone evidence: $e');
      return null;
    }
  }

  @override
  Future<Result<MilestoneEvidence>> updateEvidence({
    required String evidenceId,
    required String title,
    required String description,
    List<File>? newFiles,
    List<File>? newImages,
  }) async {
    try {
      // Get existing evidence
      final existing = await _firestoreDataSource.getEvidence(evidenceId);
      if (existing == null) {
        return Result.failure('Evidence not found');
      }

      // Upload new files/images if provided
      List<String> fileUrls = List.from(existing.fileUrls);
      List<String> imageUrls = List.from(existing.imageUrls);

      if (newFiles != null && newFiles.isNotEmpty) {
        final newFileUrls = await _storageDataSource.uploadEvidenceFiles(
          newFiles,
          existing.projectId,
          existing.milestoneId,
        );
        fileUrls.addAll(newFileUrls);
      }

      if (newImages != null && newImages.isNotEmpty) {
        final newImageUrls = await _storageDataSource.uploadEvidenceImages(
          newImages,
          existing.projectId,
          existing.milestoneId,
        );
        imageUrls.addAll(newImageUrls);
      }

      // Update evidence
      await _firestoreDataSource.updateEvidence(evidenceId, {
        'title': title,
        'description': description,
        'fileUrls': fileUrls,
        'imageUrls': imageUrls,
      });

      final updatedEvidence = existing.toEntity().copyWith(
        title: title,
        description: description,
        fileUrls: fileUrls,
        imageUrls: imageUrls,
      );

      debugPrint('✅ Evidence updated successfully: $evidenceId');
      return Result.success(updatedEvidence);
    } catch (e) {
      debugPrint('❌ Error updating evidence: $e');
      return Result.failure('Failed to update evidence: $e');
    }
  }

  @override
  Future<void> reviewEvidence({
    required String evidenceId,
    required String reviewerId,
    required EvidenceStatus status,
    String? reviewerNotes,
  }) async {
    try {
      await _firestoreDataSource.reviewEvidence(
        evidenceId: evidenceId,
        reviewerId: reviewerId,
        status: status,
        reviewerNotes: reviewerNotes,
      );

      // If approved, update milestone status to underReview
      if (status == EvidenceStatus.approved) {
        final evidence = await _firestoreDataSource.getEvidence(evidenceId);
        if (evidence != null) {
          await _firestoreDataSource.updateMilestoneStatus(
            evidence.projectId,
            evidence.milestoneId,
            MilestoneStatus.underReview,
          );
        }
      }
    } catch (e) {
      debugPrint('❌ Error reviewing evidence: $e');
      rethrow;
    }
  }

  @override
  Future<void> deleteEvidence(String evidenceId) async {
    try {
      // Get evidence to know projectId and milestoneId
      final evidence = await _firestoreDataSource.getEvidence(evidenceId);
      if (evidence == null) {
        throw Exception('Evidence not found');
      }

      // Delete files from storage
      await _storageDataSource.deleteEvidenceFiles(
        evidence.projectId,
        evidence.milestoneId,
      );

      // Delete evidence from Firestore
      await _firestoreDataSource.deleteEvidence(evidenceId);

      debugPrint('✅ Evidence deleted successfully: $evidenceId');
    } catch (e) {
      debugPrint('❌ Error deleting evidence: $e');
      rethrow;
    }
  }

  @override
  Stream<List<ProjectMilestone>> getMilestonesByStatus(
    String projectId,
    MilestoneStatus status,
  ) {
    return _firestoreDataSource.getMilestonesByStatus(projectId, status);
  }
}

/// Extension to add copyWith to MilestoneEvidence
extension MilestoneEvidenceCopyWith on MilestoneEvidence {
  MilestoneEvidence copyWith({
    String? id,
    String? milestoneId,
    String? projectId,
    String? submittedBy,
    String? title,
    String? description,
    List<String>? fileUrls,
    List<String>? imageUrls,
    EvidenceStatus? status,
    String? reviewerNotes,
    String? reviewerId,
    DateTime? submittedAt,
    DateTime? reviewedAt,
    DateTime? createdAt,
  }) {
    return MilestoneEvidence(
      id: id ?? this.id,
      milestoneId: milestoneId ?? this.milestoneId,
      projectId: projectId ?? this.projectId,
      submittedBy: submittedBy ?? this.submittedBy,
      title: title ?? this.title,
      description: description ?? this.description,
      fileUrls: fileUrls ?? this.fileUrls,
      imageUrls: imageUrls ?? this.imageUrls,
      status: status ?? this.status,
      reviewerNotes: reviewerNotes ?? this.reviewerNotes,
      reviewerId: reviewerId ?? this.reviewerId,
      submittedAt: submittedAt ?? this.submittedAt,
      reviewedAt: reviewedAt ?? this.reviewedAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
