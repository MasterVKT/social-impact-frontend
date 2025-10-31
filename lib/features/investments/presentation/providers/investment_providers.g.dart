// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'investment_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$portfolioHash() => r'50620d195fdb1aece9b1978f67c2e29af242cf96';

/// Portfolio provider
///
/// Copied from [Portfolio].
@ProviderFor(Portfolio)
final portfolioProvider =
    AutoDisposeNotifierProvider<Portfolio, investment.Portfolio>.internal(
  Portfolio.new,
  name: r'portfolioProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$portfolioHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Portfolio = AutoDisposeNotifier<investment.Portfolio>;
String _$availableProjectsHash() => r'99dbee425d7dcbceca0df191892ce8296653ba2f';

/// Available projects provider
///
/// Copied from [AvailableProjects].
@ProviderFor(AvailableProjects)
final availableProjectsProvider = AutoDisposeNotifierProvider<AvailableProjects,
    List<project.Project>>.internal(
  AvailableProjects.new,
  name: r'availableProjectsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$availableProjectsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AvailableProjects = AutoDisposeNotifier<List<project.Project>>;
String _$investmentTransactionsHash() =>
    r'afad177157f05ffc82ee54375d66867a7c36986b';

/// Investment transactions provider
///
/// Copied from [InvestmentTransactions].
@ProviderFor(InvestmentTransactions)
final investmentTransactionsProvider = AutoDisposeNotifierProvider<
    InvestmentTransactions, List<investment.InvestmentTransaction>>.internal(
  InvestmentTransactions.new,
  name: r'investmentTransactionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$investmentTransactionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$InvestmentTransactions
    = AutoDisposeNotifier<List<investment.InvestmentTransaction>>;
String _$performanceDataHash() => r'c92699b0e8617e0edb9ecf9c1a0cda2597cffe60';

/// Performance data provider
///
/// Copied from [PerformanceData].
@ProviderFor(PerformanceData)
final performanceDataProvider = AutoDisposeNotifierProvider<PerformanceData,
    List<investment.PerformanceMetric>>.internal(
  PerformanceData.new,
  name: r'performanceDataProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$performanceDataHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PerformanceData
    = AutoDisposeNotifier<List<investment.PerformanceMetric>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
