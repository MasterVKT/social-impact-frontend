import 'dart:io';
import '../../domain/entities/project.dart';
import '../../domain/repositories/projects_repository.dart';

/// Result wrapper for use case operations
class Result<T> {
  final T? data;
  final String? error;
  final bool isSuccess;

  Result._({this.data, this.error, required this.isSuccess});

  factory Result.success(T data) {
    return Result._(data: data, isSuccess: true);
  }

  factory Result.failure(String error) {
    return Result._(error: error, isSuccess: false);
  }

  bool get isFailure => !isSuccess;
}

/// Use case for creating a new project
/// Validates project data and handles image uploads
class CreateProjectUseCase {
  final ProjectsRepository repository;

  CreateProjectUseCase(this.repository);

  /// Create a new project with validation
  Future<Result<Project>> call({
    required String name,
    required String description,
    required ProjectCategory category,
    required double fundingGoal,
    required String currency,
    required int duration,
    required String location,
    required String creatorId,
    required List<ProjectMilestone> milestones,
    File? coverImage,
    List<File>? additionalImages,
  }) async {
    // Validation
    final validationError = _validate(
      name: name,
      description: description,
      fundingGoal: fundingGoal,
      duration: duration,
      milestones: milestones,
    );

    if (validationError != null) {
      return Result.failure(validationError);
    }

    try {
      // Create project entity
      final project = Project(
        id: '', // Will be set by Firestore
        name: name,
        description: description,
        category: category,
        fundingGoal: fundingGoal,
        currentFunding: 0.0,
        currency: currency,
        duration: duration,
        location: location,
        creatorId: creatorId,
        status: ProjectStatus.draft,
        milestones: milestones,
        coverImageUrl: '', // Will be set after upload
        additionalImages: [],
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      // Create project in repository (handles image uploads)
      final result = await repository.createProject(
        project,
        coverImage: coverImage,
        additionalImages: additionalImages,
      );

      return result;
    } catch (e) {
      return Result.failure('Failed to create project: $e');
    }
  }

  /// Validate project data
  String? _validate({
    required String name,
    required String description,
    required double fundingGoal,
    required int duration,
    required List<ProjectMilestone> milestones,
  }) {
    if (name.trim().isEmpty) {
      return 'Project name is required';
    }

    if (name.length < 3) {
      return 'Project name must be at least 3 characters';
    }

    if (name.length > 100) {
      return 'Project name must be less than 100 characters';
    }

    if (description.trim().isEmpty) {
      return 'Project description is required';
    }

    if (description.length < 50) {
      return 'Project description must be at least 50 characters';
    }

    if (description.length > 5000) {
      return 'Project description must be less than 5000 characters';
    }

    if (fundingGoal <= 0) {
      return 'Funding goal must be greater than 0';
    }

    if (fundingGoal < 1000) {
      return 'Funding goal must be at least €1,000';
    }

    if (fundingGoal > 1000000) {
      return 'Funding goal must be less than €1,000,000';
    }

    if (![30, 60, 90].contains(duration)) {
      return 'Duration must be 30, 60, or 90 days';
    }

    if (milestones.isEmpty) {
      return 'At least 1 milestone is required';
    }

    if (milestones.length > 3) {
      return 'Maximum 3 milestones allowed';
    }

    // Validate each milestone
    for (var i = 0; i < milestones.length; i++) {
      final milestone = milestones[i];

      if (milestone.title.trim().isEmpty) {
        return 'Milestone ${i + 1}: Title is required';
      }

      if (milestone.description.trim().isEmpty) {
        return 'Milestone ${i + 1}: Description is required';
      }

      if (milestone.targetDate.isBefore(DateTime.now())) {
        return 'Milestone ${i + 1}: Target date must be in the future';
      }
    }

    return null;
  }
}
