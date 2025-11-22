import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/project.dart';

part 'project_model.freezed.dart';
part 'project_model.g.dart';

/// Project model for data layer
/// Handles JSON serialization/deserialization for Firestore
@freezed
class ProjectModel with _$ProjectModel {
  const ProjectModel._();

  const factory ProjectModel({
    String? id,
    required String name,
    required String description,
    required String category,
    required String status,
    required double fundingGoal,
    @Default(0.0) double currentFunding,
    @Default('EUR') String currency,
    required int duration,
    required String location,
    required String creatorId,
    @Default('') String coverImageUrl,
    @Default([]) List<String> additionalImages,
    @Default([]) List<ProjectMilestoneModel> milestones,
    @TimestampConverter() DateTime? createdAt,
    @TimestampConverter() DateTime? updatedAt,
  }) = _ProjectModel;

  factory ProjectModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectModelFromJson(json);

  /// Convert from domain entity
  factory ProjectModel.fromEntity(Project project) {
    return ProjectModel(
      id: project.id.isEmpty ? null : project.id,
      name: project.name,
      description: project.description,
      category: project.category.name,
      status: project.status.name,
      fundingGoal: project.fundingGoal,
      currentFunding: project.currentFunding,
      currency: project.currency,
      duration: project.duration,
      location: project.location,
      creatorId: project.creatorId,
      coverImageUrl: project.coverImageUrl,
      additionalImages: project.additionalImages,
      milestones: project.milestones
          .map((m) => ProjectMilestoneModel.fromEntity(m))
          .toList(),
      createdAt: project.createdAt,
      updatedAt: project.updatedAt,
    );
  }

  /// Convert to domain entity
  Project toEntity() {
    return Project(
      id: id ?? '',
      name: name,
      description: description,
      category: ProjectCategory.values.firstWhere(
        (c) => c.name == category,
        orElse: () => ProjectCategory.education,
      ),
      status: ProjectStatus.values.firstWhere(
        (s) => s.name == status,
        orElse: () => ProjectStatus.draft,
      ),
      fundingGoal: fundingGoal,
      currentFunding: currentFunding,
      currency: currency,
      duration: duration,
      location: location,
      creatorId: creatorId,
      coverImageUrl: coverImageUrl,
      additionalImages: additionalImages,
      milestones: milestones.map((m) => m.toEntity()).toList(),
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

/// Project milestone model for data layer
@freezed
class ProjectMilestoneModel with _$ProjectMilestoneModel {
  const ProjectMilestoneModel._();

  const factory ProjectMilestoneModel({
    String? id,
    @Default('') String projectId,
    required String title,
    required String description,
    @TimestampConverter() required DateTime targetDate,
    @Default('pending') String status,
    double? fundingRequired,
    String? evidenceUrl,
    @TimestampConverter() DateTime? completedDate,
    String? notes,
  }) = _ProjectMilestoneModel;

  factory ProjectMilestoneModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectMilestoneModelFromJson(json);

  /// Convert from domain entity
  factory ProjectMilestoneModel.fromEntity(ProjectMilestone milestone) {
    return ProjectMilestoneModel(
      id: milestone.id.isEmpty ? null : milestone.id,
      projectId: milestone.projectId,
      title: milestone.title,
      description: milestone.description,
      targetDate: milestone.targetDate,
      status: milestone.status.name,
      fundingRequired: milestone.fundingRequired,
      evidenceUrl: milestone.evidenceUrl,
      completedDate: milestone.completedDate,
      notes: milestone.notes,
    );
  }

  /// Convert to domain entity
  ProjectMilestone toEntity() {
    return ProjectMilestone(
      id: id ?? '',
      projectId: projectId,
      title: title,
      description: description,
      targetDate: targetDate,
      status: MilestoneStatus.values.firstWhere(
        (s) => s.name == status,
        orElse: () => MilestoneStatus.pending,
      ),
      fundingRequired: fundingRequired,
      evidenceUrl: evidenceUrl,
      completedDate: completedDate,
      notes: notes,
    );
  }
}

/// Custom converter for Firestore Timestamps
class TimestampConverter implements JsonConverter<DateTime?, Object?> {
  const TimestampConverter();

  @override
  DateTime? fromJson(Object? json) {
    if (json == null) return null;
    if (json is Timestamp) return json.toDate();
    if (json is String) return DateTime.parse(json);
    if (json is int) return DateTime.fromMillisecondsSinceEpoch(json);
    return null;
  }

  @override
  Object? toJson(DateTime? object) {
    if (object == null) return null;
    return Timestamp.fromDate(object);
  }
}
