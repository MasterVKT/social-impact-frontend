import 'dart:io';
import '../entities/milestone_evidence.dart';
import '../repositories/milestones_repository.dart';

/// Use case for submitting milestone evidence
class SubmitMilestoneEvidenceUseCase {
  final MilestonesRepository repository;

  SubmitMilestoneEvidenceUseCase(this.repository);

  /// Submit evidence for a milestone
  Future<Result<MilestoneEvidence>> call({
    required String milestoneId,
    required String projectId,
    required String submittedBy,
    required String title,
    required String description,
    List<File>? files,
    List<File>? images,
  }) async {
    // Validation
    final validationError = _validate(
      title: title,
      description: description,
      files: files,
      images: images,
    );

    if (validationError != null) {
      return Result.failure(validationError);
    }

    try {
      return await repository.submitEvidence(
        milestoneId: milestoneId,
        projectId: projectId,
        submittedBy: submittedBy,
        title: title,
        description: description,
        files: files,
        images: images,
      );
    } catch (e) {
      return Result.failure('Failed to submit evidence: $e');
    }
  }

  /// Validate evidence submission
  String? _validate({
    required String title,
    required String description,
    List<File>? files,
    List<File>? images,
  }) {
    if (title.trim().isEmpty) {
      return 'Evidence title is required';
    }

    if (title.length < 5) {
      return 'Title must be at least 5 characters';
    }

    if (description.trim().isEmpty) {
      return 'Evidence description is required';
    }

    if (description.length < 20) {
      return 'Description must be at least 20 characters';
    }

    // Must have at least one file or image
    final hasFiles = files != null && files.isNotEmpty;
    final hasImages = images != null && images.isNotEmpty;

    if (!hasFiles && !hasImages) {
      return 'At least one file or image is required as evidence';
    }

    // Max 5 files
    if (files != null && files.length > 5) {
      return 'Maximum 5 files allowed';
    }

    // Max 5 images
    if (images != null && images.length > 5) {
      return 'Maximum 5 images allowed';
    }

    return null;
  }
}
