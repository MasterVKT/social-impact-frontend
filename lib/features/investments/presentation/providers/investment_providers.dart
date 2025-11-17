import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/project.dart' as project;

part 'investment_providers.g.dart';

// Mock providers removed - Use real Firestore providers from investments_providers.dart:
// - portfolioSummaryProvider (replaces Portfolio)
// - contributionsProvider (replaces InvestmentTransactions)
// - performanceProvider (replaces PerformanceData)

/// Available projects provider
@riverpod
class AvailableProjects extends _$AvailableProjects {
  @override
  List<project.Project> build() {
    return _getMockProjects();
  }

  /// Filter projects by criteria
  List<project.Project> filterProjects(project.ProjectSearchCriteria criteria) {
    var filtered = state;

    if (criteria.query != null && criteria.query!.isNotEmpty) {
      filtered = filtered
          .where((proj) =>
              (proj.name)
                  .toLowerCase()
                  .contains(criteria.query?.toLowerCase() ?? '') ||
              (proj.description)
                  .toLowerCase()
                  .contains(criteria.query?.toLowerCase() ?? ''))
          .toList();
    }

    if (criteria.categories != null && criteria.categories!.isNotEmpty) {
      filtered = filtered
          .where((proj) =>
              criteria.categories
                  ?.contains(proj.category) ??
              false)
          .toList();
    }

    if (criteria.statuses != null && criteria.statuses!.isNotEmpty) {
      filtered = filtered
          .where((proj) =>
              criteria.statuses
                  ?.contains(proj.status) ??
              false)
          .toList();
    }

    if (criteria.minFunding != null) {
      filtered = filtered
          .where((proj) =>
              proj.fundingGoal >= (criteria.minFunding ?? 0))
          .toList();
    }

    if (criteria.maxFunding != null) {
      filtered = filtered
          .where((proj) =>
              proj.fundingGoal <=
              (criteria.maxFunding ?? double.infinity))
          .toList();
    }

    if (criteria.location != null && criteria.location!.isNotEmpty) {
      filtered = filtered
          .where((proj) => (proj.location)
              .toLowerCase()
              .contains(criteria.location?.toLowerCase() ?? ''))
          .toList();
    }

    // Sort results
    if (criteria.sortBy != null) {
      filtered = _sortProjects(filtered, criteria.sortBy!,
          criteria.sortOrder ?? project.SortOrder.ascending);
    }

    return filtered;
  }

  /// Sort projects by specified criteria
  List<project.Project> _sortProjects(List<project.Project> projects,
      project.ProjectSortBy sortBy, project.SortOrder order) {
    final sorted = List<project.Project>.from(projects);

    switch (sortBy) {
      case project.ProjectSortBy.name:
        sorted.sort((a, b) => a.name.compareTo(b.name));
        break;
      case project.ProjectSortBy.fundingGoal:
        sorted.sort((a, b) => a.fundingGoal.compareTo(b.fundingGoal));
        break;
      case project.ProjectSortBy.currentFunding:
        sorted.sort((a, b) => a.currentFunding.compareTo(b.currentFunding));
        break;
      case project.ProjectSortBy.startDate:
        sorted.sort((a, b) => a.startDate.compareTo(b.startDate));
        break;
      case project.ProjectSortBy.category:
        sorted.sort(
            (a, b) => a.category.displayName.compareTo(b.category.displayName));
        break;
      case project.ProjectSortBy.status:
        sorted.sort(
            (a, b) => a.status.displayName.compareTo(b.status.displayName));
        break;
    }

    if (order == project.SortOrder.descending) {
      return sorted.reversed.toList();
    }

    return sorted;
  }

  /// Mock project data
  List<project.Project> _getMockProjects() {
    return [
      project.Project(
        id: 'proj1',
        organizationId: 'org1',
        name: 'Clean Water Access Project',
        description:
            'Providing clean water access to rural communities through well construction and water purification systems.',
        category: project.ProjectCategory.waterSanitation,
        status: project.ProjectStatus.fundingActive,
        fundingGoal: 50000.0,
        currentFunding: 37500.0,
        currency: 'EUR',
        startDate: DateTime.now().add(const Duration(days: 30)),
        endDate: DateTime.now().add(const Duration(days: 365)),
        location: 'Kenya, East Africa',
        images: ['water_project_1.jpg', 'water_project_2.jpg'],
        milestones: [
          project.ProjectMilestone(
            id: 'milestone1',
            projectId: 'proj1',
            title: 'Site Survey and Planning',
            description:
                'Complete geological survey and community consultation',
            targetDate: DateTime.now().add(const Duration(days: 45)),
            status: project.MilestoneStatus.completed,
            fundingRequired: 5000.0,
            completedDate: DateTime.now().subtract(const Duration(days: 10)),
          ),
          project.ProjectMilestone(
            id: 'milestone2',
            projectId: 'proj1',
            title: 'Well Construction',
            description: 'Drill wells and install pumping systems',
            targetDate: DateTime.now().add(const Duration(days: 120)),
            status: project.MilestoneStatus.inProgress,
            fundingRequired: 30000.0,
          ),
        ],
        impactMetrics: [
          const project.ImpactMetric(
            id: 'metric1',
            projectId: 'proj1',
            name: 'People with Clean Water Access',
            description: 'Number of people gaining access to clean water',
            unit: 'people',
            targetValue: 2000.0,
            currentValue: 0.0,
            type: project.MetricType.beneficiaries,
          ),
        ],
      ),
      project.Project(
        id: 'proj2',
        organizationId: 'org2',
        name: 'Solar Power for Schools',
        description:
            'Installing solar power systems in rural schools to provide reliable electricity for education.',
        category: project.ProjectCategory.cleanEnergy,
        status: project.ProjectStatus.fundingActive,
        fundingGoal: 75000.0,
        currentFunding: 45000.0,
        currency: 'EUR',
        startDate: DateTime.now().add(const Duration(days: 15)),
        endDate: DateTime.now().add(const Duration(days: 300)),
        location: 'Ghana, West Africa',
        images: ['solar_project_1.jpg'],
        impactMetrics: [
          const project.ImpactMetric(
            id: 'metric2',
            projectId: 'proj2',
            name: 'Schools Electrified',
            description: 'Number of schools receiving solar power',
            unit: 'schools',
            targetValue: 25.0,
            currentValue: 0.0,
            type: project.MetricType.beneficiaries,
          ),
        ],
      ),
      project.Project(
        id: 'proj3',
        organizationId: 'org3',
        name: 'Microfinance for Women Entrepreneurs',
        description:
            'Providing microloans to women entrepreneurs to start and grow their businesses.',
        category: project.ProjectCategory.financialInclusion,
        status: project.ProjectStatus.implementation,
        fundingGoal: 25000.0,
        currentFunding: 25000.0,
        currency: 'EUR',
        startDate: DateTime.now().subtract(const Duration(days: 60)),
        endDate: DateTime.now().add(const Duration(days: 240)),
        location: 'Bangladesh, South Asia',
        impactMetrics: [
          const project.ImpactMetric(
            id: 'metric3',
            projectId: 'proj3',
            name: 'Women Entrepreneurs Supported',
            description: 'Number of women receiving microloans',
            unit: 'women',
            targetValue: 500.0,
            currentValue: 200.0,
            type: project.MetricType.beneficiaries,
          ),
        ],
      ),
    ];
  }
}

// InvestmentTransactions provider removed - Use contributionsProvider from investments_providers.dart instead
// PerformanceData provider removed - Use performanceProvider from investments_providers.dart instead
