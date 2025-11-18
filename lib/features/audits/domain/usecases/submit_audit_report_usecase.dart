import '../entities/audit.dart';
import '../repositories/audits_repository.dart';

/// Use case for submitting an audit report
class SubmitAuditReportUseCase {
  final AuditsRepository repository;

  SubmitAuditReportUseCase(this.repository);

  /// Submit audit report
  Future<Result<AuditReport>> call({
    required String auditId,
    required String projectId,
    String? milestoneId,
    required String auditorId,
    required String summary,
    required String recommendations,
    required List<String> strengths,
    required List<String> weaknesses,
    required AuditDecision decision,
    String? rejectionReason,
    required List<AuditCriterion> criteria,
  }) async {
    // Validation
    final validationError = _validate(
      summary: summary,
      recommendations: recommendations,
      strengths: strengths,
      weaknesses: weaknesses,
      decision: decision,
      rejectionReason: rejectionReason,
      criteria: criteria,
    );

    if (validationError != null) {
      return Result.failure(validationError);
    }

    try {
      // Calculate overall score from criteria
      final overallScore = _calculateOverallScore(criteria);

      return await repository.submitAuditReport(
        auditId: auditId,
        projectId: projectId,
        milestoneId: milestoneId,
        auditorId: auditorId,
        overallScore: overallScore,
        summary: summary,
        recommendations: recommendations,
        strengths: strengths,
        weaknesses: weaknesses,
        decision: decision,
        rejectionReason: rejectionReason,
      );
    } catch (e) {
      return Result.failure('Failed to submit audit report: $e');
    }
  }

  /// Validate report submission
  String? _validate({
    required String summary,
    required String recommendations,
    required List<String> strengths,
    required List<String> weaknesses,
    required AuditDecision decision,
    String? rejectionReason,
    required List<AuditCriterion> criteria,
  }) {
    if (summary.trim().isEmpty) {
      return 'Summary is required';
    }

    if (summary.length < 50) {
      return 'Summary must be at least 50 characters';
    }

    if (recommendations.trim().isEmpty) {
      return 'Recommendations are required';
    }

    if (recommendations.length < 50) {
      return 'Recommendations must be at least 50 characters';
    }

    if (strengths.isEmpty) {
      return 'At least one strength must be identified';
    }

    if (weaknesses.isEmpty) {
      return 'At least one weakness or area for improvement must be identified';
    }

    // All criteria must be scored
    for (final criterion in criteria) {
      if (criterion.score == null) {
        return 'All criteria must be scored';
      }
    }

    // Rejection requires reason
    if (decision == AuditDecision.rejected &&
        (rejectionReason == null || rejectionReason.trim().isEmpty)) {
      return 'Rejection reason is required when rejecting a project';
    }

    return null;
  }

  /// Calculate overall score from weighted criteria
  double _calculateOverallScore(List<AuditCriterion> criteria) {
    if (criteria.isEmpty) return 0.0;

    // Calculate weighted average
    double totalWeightedScore = 0.0;
    int totalWeight = 0;

    for (final criterion in criteria) {
      if (criterion.score != null) {
        totalWeightedScore += criterion.weightedScore;
        totalWeight += criterion.weight;
      }
    }

    if (totalWeight == 0) return 0.0;

    // Normalize to 0-10 scale
    return (totalWeightedScore / totalWeight) * 10;
  }
}
