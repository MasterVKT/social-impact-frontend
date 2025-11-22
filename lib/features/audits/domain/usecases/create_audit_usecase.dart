import '../entities/audit.dart';
import '../repositories/audits_repository.dart';

/// Use case for creating a new audit
class CreateAuditUseCase {
  final AuditsRepository repository;

  CreateAuditUseCase(this.repository);

  /// Create a new audit
  Future<Result<Audit>> call({
    required String projectId,
    String? milestoneId,
    required AuditType type,
    required String assignedTo,
    required String assignedBy,
    required DateTime dueDate,
  }) async {
    // Validation
    final validationError = _validate(
      projectId: projectId,
      dueDate: dueDate,
    );

    if (validationError != null) {
      return Result.failure(validationError);
    }

    try {
      // Define criteria based on audit type
      final criteria = _getCriteriaForType(type);

      return await repository.createAudit(
        projectId: projectId,
        milestoneId: milestoneId,
        type: type,
        assignedTo: assignedTo,
        assignedBy: assignedBy,
        dueDate: dueDate,
        criteria: criteria,
      );
    } catch (e) {
      return Result.failure('Failed to create audit: $e');
    }
  }

  /// Validate audit creation
  String? _validate({
    required String projectId,
    required DateTime dueDate,
  }) {
    if (projectId.trim().isEmpty) {
      return 'Project ID is required';
    }

    if (dueDate.isBefore(DateTime.now())) {
      return 'Due date must be in the future';
    }

    return null;
  }

  /// Get default criteria for audit type
  List<AuditCriterion> _getCriteriaForType(AuditType type) {
    switch (type) {
      case AuditType.projectInitial:
        return [
          const AuditCriterion(
            id: '1',
            name: 'Project Documentation',
            description: 'Completeness and quality of project documentation',
            weight: 20,
          ),
          const AuditCriterion(
            id: '2',
            name: 'Feasibility Assessment',
            description: 'Viability and realistic nature of project goals',
            weight: 25,
          ),
          const AuditCriterion(
            id: '3',
            name: 'Budget Planning',
            description: 'Adequacy and transparency of budget allocation',
            weight: 20,
          ),
          const AuditCriterion(
            id: '4',
            name: 'Team Capacity',
            description: 'Capability of team to execute the project',
            weight: 15,
          ),
          const AuditCriterion(
            id: '5',
            name: 'Social Impact Potential',
            description: 'Expected positive impact on target beneficiaries',
            weight: 20,
          ),
        ];

      case AuditType.projectInterim:
        return [
          const AuditCriterion(
            id: '1',
            name: 'Progress Against Plan',
            description: 'Actual progress compared to planned milestones',
            weight: 25,
          ),
          const AuditCriterion(
            id: '2',
            name: 'Budget Utilization',
            description: 'Appropriate use of allocated funds',
            weight: 20,
          ),
          const AuditCriterion(
            id: '3',
            name: 'Impact Evidence',
            description: 'Documented evidence of social impact achieved',
            weight: 25,
          ),
          const AuditCriterion(
            id: '4',
            name: 'Risk Management',
            description: 'Identification and mitigation of project risks',
            weight: 15,
          ),
          const AuditCriterion(
            id: '5',
            name: 'Stakeholder Engagement',
            description: 'Communication and involvement of stakeholders',
            weight: 15,
          ),
        ];

      case AuditType.projectFinal:
        return [
          const AuditCriterion(
            id: '1',
            name: 'Goal Achievement',
            description: 'Extent to which project goals were achieved',
            weight: 30,
          ),
          const AuditCriterion(
            id: '2',
            name: 'Impact Measurement',
            description: 'Quality of impact data and measurement methods',
            weight: 25,
          ),
          const AuditCriterion(
            id: '3',
            name: 'Financial Accountability',
            description: 'Transparency and accuracy of financial reporting',
            weight: 20,
          ),
          const AuditCriterion(
            id: '4',
            name: 'Sustainability Plan',
            description: 'Long-term sustainability of project outcomes',
            weight: 15,
          ),
          const AuditCriterion(
            id: '5',
            name: 'Lessons Learned',
            description: 'Documentation of insights and recommendations',
            weight: 10,
          ),
        ];

      case AuditType.milestoneCompletion:
        return [
          const AuditCriterion(
            id: '1',
            name: 'Completion Evidence',
            description: 'Quality and adequacy of completion evidence',
            weight: 35,
          ),
          const AuditCriterion(
            id: '2',
            name: 'Quality of Deliverables',
            description: 'Standard and quality of milestone deliverables',
            weight: 30,
          ),
          const AuditCriterion(
            id: '3',
            name: 'Timeline Adherence',
            description: 'Completion within planned timeline',
            weight: 20,
          ),
          const AuditCriterion(
            id: '4',
            name: 'Budget Compliance',
            description: 'Adherence to milestone budget',
            weight: 15,
          ),
        ];
    }
  }
}
