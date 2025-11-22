import '../repositories/audits_repository.dart';

/// Use case for updating audit criterion score
class UpdateAuditCriterionUseCase {
  final AuditsRepository repository;

  UpdateAuditCriterionUseCase(this.repository);

  /// Update criterion score
  Future<Result<void>> call({
    required String auditId,
    required String criterionId,
    required double score,
    String? notes,
  }) async {
    // Validation
    final validationError = _validate(score: score);

    if (validationError != null) {
      return Result.failure(validationError);
    }

    try {
      await repository.updateCriterionScore(
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

  /// Validate score
  String? _validate({required double score}) {
    if (score < 0 || score > 10) {
      return 'Score must be between 0 and 10';
    }

    return null;
  }
}
