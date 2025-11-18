import 'package:freezed_annotation/freezed_annotation.dart';

part 'project.freezed.dart';
part 'project.g.dart';

/// Project entity for the projects module
/// This represents a social impact project with funding goals and milestones
@freezed
class Project with _$Project {
  const Project._();

  const factory Project({
    @Default('') String id,
    required String name,
    required String description,
    required ProjectCategory category,
    required ProjectStatus status,
    required double fundingGoal,
    @Default(0.0) double currentFunding,
    @Default('EUR') String currency,
    required int duration, // Duration in days (30, 60, or 90)
    required String location,
    required String creatorId,
    @Default('') String coverImageUrl,
    @Default([]) List<String> additionalImages,
    @Default([]) List<ProjectMilestone> milestones,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Project;

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);

  /// Calculate funding progress percentage
  double get fundingProgress {
    if (fundingGoal == 0) return 0.0;
    return (currentFunding / fundingGoal * 100).clamp(0.0, 100.0);
  }

  /// Check if project is fully funded
  bool get isFullyFunded => currentFunding >= fundingGoal;

  /// Calculate end date based on creation date and duration
  DateTime? get endDate {
    if (createdAt == null) return null;
    return createdAt!.add(Duration(days: duration));
  }

  /// Calculate days remaining
  int? get daysRemaining {
    if (endDate == null) return null;
    final now = DateTime.now();
    if (endDate!.isBefore(now)) return 0;
    return endDate!.difference(now).inDays;
  }

  /// Copy with method for updating project
  Project copyWith({
    String? id,
    String? name,
    String? description,
    ProjectCategory? category,
    ProjectStatus? status,
    double? fundingGoal,
    double? currentFunding,
    String? currency,
    int? duration,
    String? location,
    String? creatorId,
    String? coverImageUrl,
    List<String>? additionalImages,
    List<ProjectMilestone>? milestones,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Project(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      category: category ?? this.category,
      status: status ?? this.status,
      fundingGoal: fundingGoal ?? this.fundingGoal,
      currentFunding: currentFunding ?? this.currentFunding,
      currency: currency ?? this.currency,
      duration: duration ?? this.duration,
      location: location ?? this.location,
      creatorId: creatorId ?? this.creatorId,
      coverImageUrl: coverImageUrl ?? this.coverImageUrl,
      additionalImages: additionalImages ?? this.additionalImages,
      milestones: milestones ?? this.milestones,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

/// Project category enum
enum ProjectCategory {
  education,
  healthcare,
  environment,
  poverty,
  infrastructure,
  agriculture,
  technology,
  waterSanitation,
  cleanEnergy,
  financialInclusion;

  String get displayName {
    switch (this) {
      case ProjectCategory.education:
        return 'Education';
      case ProjectCategory.healthcare:
        return 'Healthcare';
      case ProjectCategory.environment:
        return 'Environment';
      case ProjectCategory.poverty:
        return 'Poverty Alleviation';
      case ProjectCategory.infrastructure:
        return 'Infrastructure';
      case ProjectCategory.agriculture:
        return 'Agriculture';
      case ProjectCategory.technology:
        return 'Technology';
      case ProjectCategory.waterSanitation:
        return 'Water & Sanitation';
      case ProjectCategory.cleanEnergy:
        return 'Clean Energy';
      case ProjectCategory.financialInclusion:
        return 'Financial Inclusion';
    }
  }
}

/// Project status enum
enum ProjectStatus {
  draft,
  submitted,
  underReview,
  approved,
  fundingActive,
  fundingComplete,
  implementation,
  completed,
  suspended,
  cancelled;

  String get displayName {
    switch (this) {
      case ProjectStatus.draft:
        return 'Draft';
      case ProjectStatus.submitted:
        return 'Submitted';
      case ProjectStatus.underReview:
        return 'Under Review';
      case ProjectStatus.approved:
        return 'Approved';
      case ProjectStatus.fundingActive:
        return 'Funding Active';
      case ProjectStatus.fundingComplete:
        return 'Funding Complete';
      case ProjectStatus.implementation:
        return 'Implementation';
      case ProjectStatus.completed:
        return 'Completed';
      case ProjectStatus.suspended:
        return 'Suspended';
      case ProjectStatus.cancelled:
        return 'Cancelled';
    }
  }
}

/// Project milestone entity
@freezed
class ProjectMilestone with _$ProjectMilestone {
  const ProjectMilestone._();

  const factory ProjectMilestone({
    @Default('') String id,
    @Default('') String projectId,
    required String title,
    required String description,
    required DateTime targetDate,
    @Default(MilestoneStatus.pending) MilestoneStatus status,
    double? fundingRequired,
    String? evidenceUrl,
    DateTime? completedDate,
    String? notes,
  }) = _ProjectMilestone;

  factory ProjectMilestone.fromJson(Map<String, dynamic> json) =>
      _$ProjectMilestoneFromJson(json);

  /// Check if milestone is overdue
  bool get isOverdue {
    if (status == MilestoneStatus.completed) return false;
    return targetDate.isBefore(DateTime.now());
  }

  /// Calculate days until target date
  int get daysUntilTarget {
    final now = DateTime.now();
    if (targetDate.isBefore(now)) return 0;
    return targetDate.difference(now).inDays;
  }
}

/// Milestone status enum
enum MilestoneStatus {
  pending,
  inProgress,
  submitted,
  underReview,
  completed,
  delayed,
  rejected;

  String get displayName {
    switch (this) {
      case MilestoneStatus.pending:
        return 'Pending';
      case MilestoneStatus.inProgress:
        return 'In Progress';
      case MilestoneStatus.submitted:
        return 'Submitted';
      case MilestoneStatus.underReview:
        return 'Under Review';
      case MilestoneStatus.completed:
        return 'Completed';
      case MilestoneStatus.delayed:
        return 'Delayed';
      case MilestoneStatus.rejected:
        return 'Rejected';
    }
  }
}
