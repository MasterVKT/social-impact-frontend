import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/user.dart';
import 'auth_providers.dart';

part 'dashboard_providers.g.dart';

/// Dashboard statistics data model
class DashboardStats {
  final int totalInvestments;
  final double totalAmountInvested;
  final int activeProjects;
  final int projectsSupported;
  final int projectsCreated;
  final double totalRaised;
  final double expectedReturns;
  final double currentPortfolioValue;
  final double totalReturn;
  final int pendingAudits;
  final int completedAudits;
  final int totalUsers;
  final double platformRevenue;
  final int peopleHelped;
  final int sdgGoals;
  final double completionRate;

  const DashboardStats({
    this.totalInvestments = 0,
    this.totalAmountInvested = 0.0,
    this.activeProjects = 0,
    this.projectsSupported = 0,
    this.projectsCreated = 0,
    this.totalRaised = 0.0,
    this.expectedReturns = 0.0,
    this.currentPortfolioValue = 0.0,
    this.totalReturn = 0.0,
    this.pendingAudits = 0,
    this.completedAudits = 0,
    this.totalUsers = 0,
    this.platformRevenue = 0.0,
    this.peopleHelped = 0,
    this.sdgGoals = 0,
    this.completionRate = 0.0,
  });

  DashboardStats copyWith({
    int? totalInvestments,
    double? totalAmountInvested,
    int? activeProjects,
    int? projectsSupported,
    int? projectsCreated,
    double? totalRaised,
    double? expectedReturns,
    double? currentPortfolioValue,
    double? totalReturn,
    int? pendingAudits,
    int? completedAudits,
    int? totalUsers,
    double? platformRevenue,
    int? peopleHelped,
    int? sdgGoals,
    double? completionRate,
  }) {
    return DashboardStats(
      totalInvestments: totalInvestments ?? this.totalInvestments,
      totalAmountInvested: totalAmountInvested ?? this.totalAmountInvested,
      activeProjects: activeProjects ?? this.activeProjects,
      projectsSupported: projectsSupported ?? this.projectsSupported,
      projectsCreated: projectsCreated ?? this.projectsCreated,
      totalRaised: totalRaised ?? this.totalRaised,
      expectedReturns: expectedReturns ?? this.expectedReturns,
      currentPortfolioValue:
          currentPortfolioValue ?? this.currentPortfolioValue,
      totalReturn: totalReturn ?? this.totalReturn,
      pendingAudits: pendingAudits ?? this.pendingAudits,
      completedAudits: completedAudits ?? this.completedAudits,
      totalUsers: totalUsers ?? this.totalUsers,
      platformRevenue: platformRevenue ?? this.platformRevenue,
      peopleHelped: peopleHelped ?? this.peopleHelped,
      sdgGoals: sdgGoals ?? this.sdgGoals,
      completionRate: completionRate ?? this.completionRate,
    );
  }
}

/// Recent activity data model
class RecentActivity {
  final String id;
  final String type;
  final String title;
  final String description;
  final DateTime timestamp;
  final String? projectId;
  final String? investmentId;
  final double? amount;

  const RecentActivity({
    required this.id,
    required this.type,
    required this.title,
    required this.description,
    required this.timestamp,
    this.projectId,
    this.investmentId,
    this.amount,
  });

  factory RecentActivity.fromJson(Map<String, dynamic> json) {
    return RecentActivity(
      id: json['id'] as String,
      type: json['type'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      timestamp: (json['timestamp'] as Timestamp).toDate(),
      projectId: json['projectId'] as String?,
      investmentId: json['investmentId'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
    );
  }
}

/// Dashboard statistics provider for authenticated users
@riverpod
Future<DashboardStats> dashboardStats(DashboardStatsRef ref) async {
  final user = ref.watch(currentUserProvider);

  if (user == null) {
    return const DashboardStats();
  }

  try {
    final firestore = FirebaseFirestore.instance;

    switch (user.role) {
      case UserRole.investor:
        return await _getInvestorStats(firestore, user.uid);
      case UserRole.organization:
        return await _getOrganizationStats(firestore, user.uid);
      case UserRole.auditor:
        return await _getAuditorStats(firestore, user.uid);
      case UserRole.admin:
        return await _getAdminStats(firestore);
    }
  } catch (e) {
    if (kDebugMode) {
      print('Error fetching dashboard stats: $e');
    }
    // Retourner des stats par défaut avec un indicateur d'erreur
    return const DashboardStats();
  }
}

/// Recent activities provider for authenticated users
@riverpod
Future<List<RecentActivity>> recentActivities(RecentActivitiesRef ref) async {
  final user = ref.watch(currentUserProvider);

  if (user == null) {
    return [];
  }

  try {
    final firestore = FirebaseFirestore.instance;

    final querySnapshot = await firestore
        .collection('activities')
        .where('userId', isEqualTo: user.uid)
        .orderBy('timestamp', descending: true)
        .limit(10)
        .get();

    return querySnapshot.docs
        .map((doc) => RecentActivity.fromJson({
              'id': doc.id,
              ...doc.data(),
            }))
        .toList();
  } catch (e) {
    if (kDebugMode) {
      print('Error fetching recent activities: $e');
    }
    return [];
  }
}

/// Get investor-specific statistics
Future<DashboardStats> _getInvestorStats(
    FirebaseFirestore firestore, String userId) async {
  final investmentsQuery = await firestore
      .collection('investments')
      .where('investorId', isEqualTo: userId)
      .get();

  double totalAmountInvested = 0.0;
  double currentPortfolioValue = 0.0;
  double expectedReturns = 0.0;
  Set<String> supportedProjectIds = {};

  for (final doc in investmentsQuery.docs) {
    final data = doc.data();
    final amount = (data['amount'] as num?)?.toDouble() ?? 0.0;
    final currentValue = (data['currentValue'] as num?)?.toDouble() ?? amount;
    final expectedReturn = (data['expectedReturn'] as num?)?.toDouble() ?? 0.0;

    totalAmountInvested += amount;
    currentPortfolioValue += currentValue;
    expectedReturns += expectedReturn;

    if (data['projectId'] != null) {
      supportedProjectIds.add(data['projectId'] as String);
    }
  }

  // Only query projects if there are any supported project IDs
  int activeProjectsCount = 0;
  if (supportedProjectIds.isNotEmpty) {
    final activeProjectsQuery = await firestore
        .collection('projects')
        .where(FieldPath.documentId, whereIn: supportedProjectIds.toList())
        .where('status', isEqualTo: 'active')
        .get();
    activeProjectsCount = activeProjectsQuery.docs.length;
  }

  final totalReturn = currentPortfolioValue - totalAmountInvested;

  return DashboardStats(
    totalInvestments: investmentsQuery.docs.length,
    totalAmountInvested: totalAmountInvested,
    activeProjects: activeProjectsCount,
    projectsSupported: supportedProjectIds.length,
    expectedReturns: expectedReturns,
    currentPortfolioValue: currentPortfolioValue,
    totalReturn: totalReturn,
  );
}

/// Get organization-specific statistics
Future<DashboardStats> _getOrganizationStats(
    FirebaseFirestore firestore, String userId) async {
  final projectsQuery = await firestore
      .collection('projects')
      .where('creatorId', isEqualTo: userId)
      .get();

  double totalRaised = 0.0;
  int activeProjects = 0;
  int peopleHelped = 0;
  int sdgGoals = 0;
  double totalTargetAmount = 0.0;

  for (final doc in projectsQuery.docs) {
    final data = doc.data();
    final raised = (data['currentAmount'] as num?)?.toDouble() ?? 0.0;
    final target = (data['targetAmount'] as num?)?.toDouble() ?? 0.0;
    final status = data['status'] as String?;
    final impact = data['impact'] as Map<String, dynamic>?;

    totalRaised += raised;
    totalTargetAmount += target;

    if (status == 'active') {
      activeProjects++;
    }

    if (impact != null) {
      peopleHelped += (impact['peopleHelped'] as num?)?.toInt() ?? 0;
      final goals = impact['sdgGoals'] as List?;
      if (goals != null) {
        sdgGoals += goals.length;
      }
    }
  }

  final completionRate =
      totalTargetAmount > 0 ? (totalRaised / totalTargetAmount) * 100 : 0.0;

  return DashboardStats(
    projectsCreated: projectsQuery.docs.length,
    activeProjects: activeProjects,
    totalRaised: totalRaised,
    peopleHelped: peopleHelped,
    sdgGoals: sdgGoals,
    completionRate: completionRate,
  );
}

/// Get auditor-specific statistics
Future<DashboardStats> _getAuditorStats(
    FirebaseFirestore firestore, String userId) async {
  final auditsQuery = await firestore
      .collection('audits')
      .where('auditorId', isEqualTo: userId)
      .get();

  int pendingAudits = 0;
  int completedAudits = 0;

  for (final doc in auditsQuery.docs) {
    final data = doc.data();
    final status = data['status'] as String?;

    if (status == 'pending' || status == 'in_progress') {
      pendingAudits++;
    } else if (status == 'completed') {
      completedAudits++;
    }
  }

  return DashboardStats(
    pendingAudits: pendingAudits,
    completedAudits: completedAudits,
  );
}

/// Get admin-specific statistics
Future<DashboardStats> _getAdminStats(FirebaseFirestore firestore) async {
  final usersQuery = await firestore.collection('users').get();
  final projectsQuery = await firestore.collection('projects').get();
  final investmentsQuery = await firestore.collection('investments').get();

  double platformRevenue = 0.0;
  int activeProjects = 0;

  for (final doc in projectsQuery.docs) {
    final data = doc.data();
    final status = data['status'] as String?;
    if (status == 'active') {
      activeProjects++;
    }
  }

  for (final doc in investmentsQuery.docs) {
    final data = doc.data();
    final fee = (data['platformFee'] as num?)?.toDouble() ?? 0.0;
    platformRevenue += fee;
  }

  return DashboardStats(
    totalUsers: usersQuery.docs.length,
    activeProjects: activeProjects,
    platformRevenue: platformRevenue,
  );
}
