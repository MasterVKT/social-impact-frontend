// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dashboardStatsHash() => r'27a1e8cad91dbe8f577edce10c432a6c8888efc2';

/// Dashboard statistics provider for authenticated users
///
/// Copied from [dashboardStats].
@ProviderFor(dashboardStats)
final dashboardStatsProvider =
    AutoDisposeFutureProvider<DashboardStats>.internal(
  dashboardStats,
  name: r'dashboardStatsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$dashboardStatsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DashboardStatsRef = AutoDisposeFutureProviderRef<DashboardStats>;
String _$recentActivitiesHash() => r'6caa9aca77378f2e1a44c70cbce2509a86b5a12a';

/// Recent activities provider for authenticated users
///
/// Copied from [recentActivities].
@ProviderFor(recentActivities)
final recentActivitiesProvider =
    AutoDisposeFutureProvider<List<RecentActivity>>.internal(
  recentActivities,
  name: r'recentActivitiesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$recentActivitiesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RecentActivitiesRef
    = AutoDisposeFutureProviderRef<List<RecentActivity>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
