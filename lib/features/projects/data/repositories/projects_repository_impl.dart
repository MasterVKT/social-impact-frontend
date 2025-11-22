import 'dart:io';
import 'package:flutter/foundation.dart';
import '../../domain/entities/project.dart';
import '../../domain/repositories/projects_repository.dart';
import '../../domain/usecases/create_project_usecase.dart';
import '../datasources/projects_firestore_datasource.dart';
import '../datasources/projects_storage_datasource.dart';
import '../models/project_model.dart';

/// Implementation of ProjectsRepository
/// Coordinates between Firestore and Storage data sources
class ProjectsRepositoryImpl implements ProjectsRepository {
  final ProjectsFirestoreDataSource _firestoreDataSource;
  final ProjectsStorageDataSource _storageDataSource;

  ProjectsRepositoryImpl(
    this._firestoreDataSource,
    this._storageDataSource,
  );

  @override
  Future<Result<Project>> createProject(
    Project project, {
    File? coverImage,
    List<File>? additionalImages,
  }) async {
    try {
      // Convert to model
      final model = ProjectModel.fromEntity(project);

      // Create project in Firestore first (to get ID)
      final projectId = await _firestoreDataSource.createProject(model);

      // Upload images if provided
      String coverImageUrl = project.coverImageUrl;
      List<String> additionalImageUrls = [];

      if (coverImage != null) {
        coverImageUrl = await _storageDataSource.uploadCoverImage(
          coverImage,
          projectId,
        );
      }

      if (additionalImages != null && additionalImages.isNotEmpty) {
        additionalImageUrls = await _storageDataSource.uploadAdditionalImages(
          additionalImages,
          projectId,
        );
      }

      // Update project with image URLs
      if (coverImage != null || (additionalImages?.isNotEmpty ?? false)) {
        await _firestoreDataSource.updateProject(projectId, {
          'coverImageUrl': coverImageUrl,
          'additionalImages': additionalImageUrls,
        });
      }

      // Return created project with ID and image URLs
      final createdProject = project.copyWith(
        id: projectId,
        coverImageUrl: coverImageUrl,
        additionalImages: additionalImageUrls,
      );

      debugPrint('✅ Project created successfully: $projectId');
      return Result.success(createdProject);
    } catch (e) {
      debugPrint('❌ Error creating project: $e');
      return Result.failure('Failed to create project: $e');
    }
  }

  @override
  Future<Result<Project>> updateProject(
    Project project, {
    File? coverImage,
    List<File>? additionalImages,
  }) async {
    try {
      // Upload new images if provided
      String coverImageUrl = project.coverImageUrl;
      List<String> additionalImageUrls = List.from(project.additionalImages);

      if (coverImage != null) {
        coverImageUrl = await _storageDataSource.uploadCoverImage(
          coverImage,
          project.id,
        );
      }

      if (additionalImages != null && additionalImages.isNotEmpty) {
        final newUrls = await _storageDataSource.uploadAdditionalImages(
          additionalImages,
          project.id,
        );
        additionalImageUrls = newUrls;
      }

      // Update project with new data
      final updatedProject = project.copyWith(
        coverImageUrl: coverImageUrl,
        additionalImages: additionalImageUrls,
        updatedAt: DateTime.now(),
      );

      // Convert to model and update in Firestore
      final model = ProjectModel.fromEntity(updatedProject);
      await _firestoreDataSource.updateProject(
        project.id,
        model.toJson(),
      );

      debugPrint('✅ Project updated successfully: ${project.id}');
      return Result.success(updatedProject);
    } catch (e) {
      debugPrint('❌ Error updating project: $e');
      return Result.failure('Failed to update project: $e');
    }
  }

  @override
  Future<void> updateProjectStatus(String projectId, ProjectStatus status) async {
    try {
      await _firestoreDataSource.updateProjectStatus(projectId, status);
    } catch (e) {
      debugPrint('❌ Error updating project status: $e');
      rethrow;
    }
  }

  @override
  Future<void> updateProjectFunding(String projectId, double newFunding) async {
    try {
      await _firestoreDataSource.updateProjectFunding(projectId, newFunding);
    } catch (e) {
      debugPrint('❌ Error updating project funding: $e');
      rethrow;
    }
  }

  @override
  Future<Project?> getProject(String projectId) async {
    try {
      final model = await _firestoreDataSource.getProject(projectId);
      return model?.toEntity();
    } catch (e) {
      debugPrint('❌ Error getting project: $e');
      return null;
    }
  }

  @override
  Stream<List<Project>> getProjects({
    ProjectCategory? category,
    ProjectStatus? status,
    String? creatorId,
    int? limit,
  }) {
    try {
      return _firestoreDataSource
          .getProjectsStream(
            category: category,
            status: status,
            creatorId: creatorId,
            limit: limit,
          )
          .map((models) => models.map((m) => m.toEntity()).toList());
    } catch (e) {
      debugPrint('❌ Error getting projects stream: $e');
      return Stream.value([]);
    }
  }

  @override
  Stream<List<Project>> getCreatorProjects(String creatorId) {
    return getProjects(creatorId: creatorId);
  }

  @override
  Stream<List<Project>> getActiveProjects({int? limit}) {
    return getProjects(status: ProjectStatus.fundingActive, limit: limit);
  }

  @override
  Stream<List<Project>> getProjectsByCategory(
    ProjectCategory category, {
    int? limit,
  }) {
    return getProjects(category: category, limit: limit);
  }

  @override
  Future<List<Project>> searchProjects(String query) async {
    try {
      final models = await _firestoreDataSource.searchProjects(query);
      return models.map((m) => m.toEntity()).toList();
    } catch (e) {
      debugPrint('❌ Error searching projects: $e');
      return [];
    }
  }

  @override
  Future<void> deleteProject(String projectId) async {
    try {
      // Delete images from storage
      await _storageDataSource.deleteProjectImages(projectId);

      // Delete project from Firestore
      await _firestoreDataSource.deleteProject(projectId);

      debugPrint('✅ Project deleted successfully: $projectId');
    } catch (e) {
      debugPrint('❌ Error deleting project: $e');
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> getCreatorStats(String creatorId) async {
    try {
      return await _firestoreDataSource.getCreatorStats(creatorId);
    } catch (e) {
      debugPrint('❌ Error getting creator stats: $e');
      return {};
    }
  }
}
