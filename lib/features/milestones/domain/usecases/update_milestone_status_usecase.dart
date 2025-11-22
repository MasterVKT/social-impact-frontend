import '../repositories/milestones_repository.dart';
import '../../../projects/domain/entities/project.dart';

/// Use case for updating milestone status
class UpdateMilestoneStatusUseCase {
  final MilestonesRepository repository;

  UpdateMilestoneStatusUseCase(this.repository);

  /// Update milestone status
  Future<Result<void>> call({
    required String milestoneId,
    required MilestoneStatus newStatus,
  }) async {
    try {
      // Get current milestone
      final milestone = await repository.getMilestone(milestoneId);

      if (milestone == null) {
        return Result.failure('Milestone not found');
      }

      // Validate status transition
      final validationError = _validateStatusTransition(
        milestone.status,
        newStatus,
      );

      if (validationError != null) {
        return Result.failure(validationError);
      }

      // Update status
      await repository.updateMilestoneStatus(milestoneId, newStatus);

      return Result.success(null);
    } catch (e) {
      return Result.failure('Failed to update milestone status: $e');
    }
  }

  /// Validate status transition
  String? _validateStatusTransition(
    MilestoneStatus currentStatus,
    MilestoneStatus newStatus,
  ) {
    // Define valid transitions
    final validTransitions = <MilestoneStatus, Set<MilestoneStatus>>{
      MilestoneStatus.pending: {
        MilestoneStatus.inProgress,
      },
      MilestoneStatus.inProgress: {
        MilestoneStatus.submitted,
        MilestoneStatus.delayed,
      },
      MilestoneStatus.submitted: {
        MilestoneStatus.underReview,
        MilestoneStatus.inProgress,
      },
      MilestoneStatus.underReview: {
        MilestoneStatus.completed,
        MilestoneStatus.rejected,
      },
      MilestoneStatus.rejected: {
        MilestoneStatus.inProgress,
      },
      MilestoneStatus.delayed: {
        MilestoneStatus.inProgress,
        MilestoneStatus.submitted,
      },
      MilestoneStatus.completed: {},
    };

    if (currentStatus == newStatus) {
      return 'Status is already ${newStatus.displayName}';
    }

    final allowedStatuses = validTransitions[currentStatus] ?? {};

    if (!allowedStatuses.contains(newStatus)) {
      return 'Cannot transition from ${currentStatus.displayName} to ${newStatus.displayName}';
    }

    return null;
  }
}
