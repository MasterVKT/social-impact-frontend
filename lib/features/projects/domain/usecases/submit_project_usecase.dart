import '../../domain/entities/project.dart';
import '../../domain/repositories/projects_repository.dart';
import 'create_project_usecase.dart';

/// Use case for submitting a project for approval
class SubmitProjectUseCase {
  final ProjectsRepository repository;

  SubmitProjectUseCase(this.repository);

  /// Submit a project for admin approval
  Future<Result<Project>> call(String projectId) async {
    try {
      // Get project
      final project = await repository.getProject(projectId);
      if (project == null) {
        return Result.failure('Project not found');
      }

      // Validate project can be submitted
      if (project.status != ProjectStatus.draft) {
        return Result.failure(
          'Only draft projects can be submitted',
        );
      }

      // Validate project is complete
      final validationError = _validateForSubmission(project);
      if (validationError != null) {
        return Result.failure(validationError);
      }

      // Update status to submitted
      final submittedProject = project.copyWith(
        status: ProjectStatus.submitted,
        updatedAt: DateTime.now(),
      );

      // Update in repository
      await repository.updateProjectStatus(
        projectId,
        ProjectStatus.submitted,
      );

      return Result.success(submittedProject);
    } catch (e) {
      return Result.failure('Failed to submit project: $e');
    }
  }

  /// Validate project is ready for submission
  String? _validateForSubmission(Project project) {
    if (project.name.trim().isEmpty) {
      return 'Project name is required';
    }

    if (project.description.trim().isEmpty) {
      return 'Project description is required';
    }

    if (project.coverImageUrl.isEmpty) {
      return 'Cover image is required';
    }

    if (project.milestones.isEmpty) {
      return 'At least 1 milestone is required';
    }

    if (project.milestones.length > 3) {
      return 'Maximum 3 milestones allowed';
    }

    if (project.fundingGoal <= 0) {
      return 'Funding goal must be set';
    }

    if (project.location.trim().isEmpty) {
      return 'Location is required';
    }

    return null;
  }
}
