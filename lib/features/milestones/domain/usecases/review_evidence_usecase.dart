import '../entities/milestone_evidence.dart';
import '../repositories/milestones_repository.dart';

/// Use case for reviewing milestone evidence (auditor)
class ReviewEvidenceUseCase {
  final MilestonesRepository repository;

  ReviewEvidenceUseCase(this.repository);

  /// Review evidence and approve or reject
  Future<Result<void>> call({
    required String evidenceId,
    required String reviewerId,
    required bool approved,
    String? reviewerNotes,
  }) async {
    // Validation
    if (!approved && (reviewerNotes == null || reviewerNotes.trim().isEmpty)) {
      return Result.failure(
        'Reviewer notes are required when rejecting evidence',
      );
    }

    try {
      final status = approved
          ? EvidenceStatus.approved
          : EvidenceStatus.rejected;

      await repository.reviewEvidence(
        evidenceId: evidenceId,
        reviewerId: reviewerId,
        status: status,
        reviewerNotes: reviewerNotes,
      );

      return Result.success(null);
    } catch (e) {
      return Result.failure('Failed to review evidence: $e');
    }
  }
}
