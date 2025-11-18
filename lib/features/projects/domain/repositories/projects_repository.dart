import 'dart:io';
import '../entities/project.dart';
import '../usecases/create_project_usecase.dart';

/// Repository interface for projects
/// Defines all operations that can be performed on projects
abstract class ProjectsRepository {
  /// Create a new project with optional images
  Future<Result<Project>> createProject(
    Project project, {
    File? coverImage,
    List<File>? additionalImages,
  });

  /// Update an existing project
  Future<Result<Project>> updateProject(
    Project project, {
    File? coverImage,
    List<File>? additionalImages,
  });

  /// Update project status
  Future<void> updateProjectStatus(String projectId, ProjectStatus status);

  /// Update project funding
  Future<void> updateProjectFunding(String projectId, double newFunding);

  /// Get a single project by ID
  Future<Project?> getProject(String projectId);

  /// Get projects stream with filters
  Stream<List<Project>> getProjects({
    ProjectCategory? category,
    ProjectStatus? status,
    String? creatorId,
    int? limit,
  });

  /// Get creator's projects
  Stream<List<Project>> getCreatorProjects(String creatorId);

  /// Get active projects
  Stream<List<Project>> getActiveProjects({int? limit});

  /// Get projects by category
  Stream<List<Project>> getProjectsByCategory(
    ProjectCategory category, {
    int? limit,
  });

  /// Search projects
  Future<List<Project>> searchProjects(String query);

  /// Delete a project
  Future<void> deleteProject(String projectId);

  /// Get creator statistics
  Future<Map<String, dynamic>> getCreatorStats(String creatorId);
}
