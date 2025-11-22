import '../../domain/entities/project.dart';
import '../../domain/repositories/projects_repository.dart';
import 'create_project_usecase.dart';

/// Use case for deleting a project
class DeleteProjectUseCase {
  final ProjectsRepository repository;

  DeleteProjectUseCase(this.repository);

  /// Delete a project
  /// Only allows deleting draft projects
  Future<Result<void>> call(String projectId) async {
    try {
      // Get project to check status
      final project = await repository.getProject(projectId);
      if (project == null) {
        return Result.failure('Project not found');
      }

      // Only allow deleting draft projects
      if (project.status != ProjectStatus.draft) {
        return Result.failure(
          'Only draft projects can be deleted. Current status: ${project.status.name}',
        );
      }

      // Delete from repository
      await repository.deleteProject(projectId);

      return Result.success(null);
    } catch (e) {
      return Result.failure('Failed to delete project: $e');
    }
  }
}
