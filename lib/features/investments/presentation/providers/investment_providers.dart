import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/investment.dart' as investment;
import '../../domain/entities/project.dart' as project;

part 'investment_providers.g.dart';

/// Portfolio provider
@riverpod
class Portfolio extends _$Portfolio {
  @override
  investment.Portfolio build() {
    return _getMockPortfolio();
  }

  /// Update portfolio data
  void updatePortfolio(investment.Portfolio portfolio) {
    state = portfolio;
  }

  /// Add investment to portfolio
  void addInvestment(investment.Investment investment) {
    final updatedInvestments = [...state.investments, investment];
    final totalValue = updatedInvestments.fold<double>(
      0.0,
      (sum, inv) => sum + inv.currentValue,
    );
    final totalInvested = updatedInvestments.fold<double>(
      0.0,
      (sum, inv) => sum + inv.amount,
    );

    state = state.copyWith(
      investments: updatedInvestments,
      currentValue: totalValue,
      totalInvested: totalInvested,
      totalReturns: totalValue - totalInvested,
      returnPercentage: totalInvested > 0
          ? ((totalValue - totalInvested) / totalInvested) * 100
          : 0.0,
    );
  }

  /// Mock portfolio data
  investment.Portfolio _getMockPortfolio() {
    final mockInvestments = [
      investment.Investment(
        id: '1',
        investorId: 'user123',
        projectId: 'proj1',
        amount: 5000.0,
        currency: 'EUR',
        investmentDate: DateTime.now().subtract(const Duration(days: 60)),
        status: investment.InvestmentStatus.active,
        type: investment.InvestmentType.equity,
        currentValue: 5625.0,
      ),
      investment.Investment(
        id: '2',
        investorId: 'user123',
        projectId: 'proj2',
        amount: 3500.0,
        currency: 'EUR',
        investmentDate: DateTime.now().subtract(const Duration(days: 30)),
        status: investment.InvestmentStatus.active,
        type: investment.InvestmentType.debt,
        currentValue: 3790.5,
      ),
      investment.Investment(
        id: '3',
        investorId: 'user123',
        projectId: 'proj3',
        amount: 2000.0,
        currency: 'EUR',
        investmentDate: DateTime.now().subtract(const Duration(days: 90)),
        status: investment.InvestmentStatus.completed,
        type: investment.InvestmentType.hybrid,
        currentValue: 2314.0,
      ),
    ];

    final totalValue = mockInvestments.fold<double>(
      0.0,
      (sum, inv) => sum + inv.currentValue,
    );
    final totalInvested = mockInvestments.fold<double>(
      0.0,
      (sum, inv) => sum + inv.amount,
    );

    return investment.Portfolio(
      userId: 'user123',
      currentValue: totalValue,
      totalInvested: totalInvested,
      totalReturns: totalValue - totalInvested,
      returnPercentage: ((totalValue - totalInvested) / totalInvested) * 100,
      activeInvestments: mockInvestments
          .where((inv) => inv.status == investment.InvestmentStatus.active)
          .length,
      completedInvestments: mockInvestments
          .where((inv) => inv.status == investment.InvestmentStatus.completed)
          .length,
      investments: mockInvestments,
      lastUpdated: DateTime.now(),
    );
  }
}

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

/// Investment transactions provider
@riverpod
class InvestmentTransactions extends _$InvestmentTransactions {
  @override
  List<investment.InvestmentTransaction> build() {
    return _getMockTransactions();
  }

  /// Add new transaction
  void addTransaction(investment.InvestmentTransaction transaction) {
    state = [...state, transaction];
  }

  /// Get transactions for a specific investment
  List<investment.InvestmentTransaction> getTransactionsForInvestment(
      String investmentId) {
    return state
        .where((transaction) =>
            transaction.investmentId == investmentId)
        .toList();
  }

  /// Mock transaction data
  List<investment.InvestmentTransaction> _getMockTransactions() {
    return [
      investment.InvestmentTransaction(
        id: 'tx1',
        investmentId: '1',
        type: investment.TransactionType.investment,
        amount: 5000.0,
        currency: 'EUR',
        date: DateTime.now().subtract(const Duration(days: 60)),
        status: investment.TransactionStatus.completed,
        description: 'Initial investment in Clean Water Access Project',
      ),
      investment.InvestmentTransaction(
        id: 'tx2',
        investmentId: '1',
        type: investment.TransactionType.dividend,
        amount: 125.0,
        currency: 'EUR',
        date: DateTime.now().subtract(const Duration(days: 30)),
        status: investment.TransactionStatus.completed,
        description: 'Quarterly dividend payment',
      ),
      investment.InvestmentTransaction(
        id: 'tx3',
        investmentId: '2',
        type: investment.TransactionType.investment,
        amount: 3500.0,
        currency: 'EUR',
        date: DateTime.now().subtract(const Duration(days: 30)),
        status: investment.TransactionStatus.completed,
        description: 'Initial investment in Solar Power for Schools',
      ),
    ];
  }
}

/// Performance data provider
@riverpod
class PerformanceData extends _$PerformanceData {
  @override
  List<investment.PerformanceMetric> build() {
    return _getMockPerformanceData();
  }

  /// Get performance for specific period
  List<investment.PerformanceMetric> getPerformanceForPeriod(String period) {
    // Filter and return data based on period
    final now = DateTime.now();
    DateTime cutoffDate;

    switch (period) {
      case '1M':
        cutoffDate = now.subtract(const Duration(days: 30));
        break;
      case '3M':
        cutoffDate = now.subtract(const Duration(days: 90));
        break;
      case '6M':
        cutoffDate = now.subtract(const Duration(days: 180));
        break;
      case '1Y':
        cutoffDate = now.subtract(const Duration(days: 365));
        break;
      default:
        return state; // Return all data for 'ALL'
    }

    return state
        .where((metric) => (metric.date).isAfter(cutoffDate))
        .toList();
  }

  /// Mock performance data
  List<investment.PerformanceMetric> _getMockPerformanceData() {
    final data = <investment.PerformanceMetric>[];
    final now = DateTime.now();

    // Generate daily data for the past year
    for (int i = 365; i >= 0; i--) {
      final date = now.subtract(Duration(days: i));
      final baseValue = 100000 + (i * 150); // Growing portfolio
      final dailyVariation =
          (i % 7 == 0) ? baseValue * 0.02 : baseValue * 0.005;
      final value = baseValue + (dailyVariation * (i % 3 == 0 ? 1 : -1));

      data.add(investment.PerformanceMetric(
          id: 'perf_$i',
          portfolioId: 'portfolio123',
          date: date,
          totalValue: value.clamp(90000, 200000),
          totalInvested: 100000, // Initial investment
          totalReturn: (value - 100000).clamp(-10000, 100000),
          returnPercentage:
              ((value - 100000) / 100000 * 100).clamp(-10.0, 100.0),
          benchmarkReturn: (i * 0.1).clamp(0, 50) // Steady benchmark growth
          ));
    }

    return data;
  }
}
