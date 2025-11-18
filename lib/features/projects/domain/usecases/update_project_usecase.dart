import 'dart:io';
import '../../domain/entities/project.dart';
import '../../domain/repositories/projects_repository.dart';
import 'create_project_usecase.dart';

/// Use case for updating an existing project
class UpdateProjectUseCase {
  final ProjectsRepository repository;

  UpdateProjectUseCase(this.repository);

  /// Update a project
  /// Only allows updating projects in draft or pending status
  Future<Result<Project>> call({
    required String projectId,
    String? name,
    String? description,
    ProjectCategory? category,
    double? fundingGoal,
    int? duration,
    String? location,
    List<ProjectMilestone>? milestones,
    File? coverImage,
    List<File>? additionalImages,
  }) async {
    try {
      // Get existing project
      final existingProject = await repository.getProject(projectId);
      if (existingProject == null) {
        return Result.failure('Project not found');
      }

      // Check if project can be updated
      if (existingProject.status != ProjectStatus.draft &&
          existingProject.status != ProjectStatus.pending) {
        return Result.failure(
          'Cannot update project in ${existingProject.status.name} status',
        );
      }

      // Create updated project
      final updatedProject = existingProject.copyWith(
        name: name ?? existingProject.name,
        description: description ?? existingProject.description,
        category: category ?? existingProject.category,
        fundingGoal: fundingGoal ?? existingProject.fundingGoal,
        duration: duration ?? existingProject.duration,
        location: location ?? existingProject.location,
        milestones: milestones ?? existingProject.milestones,
        updatedAt: DateTime.now(),
      );

      // Update in repository
      final result = await repository.updateProject(
        updatedProject,
        coverImage: coverImage,
        additionalImages: additionalImages,
      );

      return result;
    } catch (e) {
      return Result.failure('Failed to update project: $e');
    }
  }
}
