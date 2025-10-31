import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/widgets/responsive/responsive_layout.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/constants/spacing.dart';
import '../widgets/dashboard_stats_card.dart';
import '../widgets/user_profile_card.dart';
import '../widgets/kyc_status_card.dart';
import '../../domain/entities/user.dart';
import '../widgets/recent_activities_card.dart';
import '../providers/auth_provider_aliases.dart';
import '../providers/dashboard_providers.dart';

/// Main dashboard screen with adaptive layout and role-based content
class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ResponsiveLayout(
      mobile: _buildMobileLayout(context, ref),
      tablet: _buildTabletLayout(context, ref),
      desktop: _buildDesktopLayout(context, ref),
    );
  }

  /// Build mobile layout (single column)
  Widget _buildMobileLayout(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(Spacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: _buildDashboardCards(context, ref),
          ),
        ),
      ),
    );
  }

  /// Build tablet layout (two columns)
  Widget _buildTabletLayout(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(Spacing.lg),
          child: _buildGridLayout(context, ref, crossAxisCount: 2),
        ),
      ),
    );
  }

  /// Build desktop layout (three columns with sidebar)
  Widget _buildDesktopLayout(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            // Sidebar would be handled by the main navigation wrapper
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(Spacing.xl),
                child: _buildGridLayout(context, ref, crossAxisCount: 3),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Build grid layout for tablet/desktop
  Widget _buildGridLayout(BuildContext context, WidgetRef ref,
      {required int crossAxisCount}) {
    final cards = _buildDashboardCards(context, ref);

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: Spacing.lg,
        mainAxisSpacing: Spacing.lg,
        childAspectRatio: crossAxisCount == 3 ? 1.2 : 1.0,
      ),
      itemCount: cards.length,
      itemBuilder: (context, index) => cards[index],
    );
  }

  /// Build dashboard cards based on user role and status
  List<Widget> _buildDashboardCards(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return authState.maybeWhen(
      authenticated: (user) {
        final cards = <Widget>[];

        // Welcome/Profile card (always shown)
        cards.add(UserProfileCard(user: user));

        // KYC Status card (always shown for verification status)
        cards.add(const KYCStatusCard());

        // Role-specific cards
        switch (user.role) {
          case UserRole.investor:
            cards.addAll(_buildInvestorCards(context, user));
            break;
          case UserRole.organization:
            cards.addAll(_buildOrganizationCards(context, user));
            break;
          case UserRole.auditor:
            cards.addAll(_buildAuditorCards(context, user));
            break;
          case UserRole.admin:
            cards.addAll(_buildAdminCards(context, user));
            break;
        }

        // Common cards for all authenticated users
        cards.add(const RecentActivitiesCard());
        cards.add(_buildQuickActionsCard(context, user));

        return cards;
      },
      loading: () => [_buildLoadingCard(context)],
      error: (error, code) => [_buildErrorCard(context, error)],
      orElse: () => [_buildNotAuthenticatedCard(context)],
    );
  }

  /// Build investor-specific cards
  List<Widget> _buildInvestorCards(BuildContext context, User user) {
    return [
      Consumer(
        builder: (context, ref, child) {
          final statsAsync = ref.watch(dashboardStatsProvider);

          return statsAsync.when(
            data: (stats) => DashboardStatsCard(
              title: 'My Investments',
              stats: [
                DashboardStat(
                  label: 'Total Invested',
                  value: '\$${stats.totalAmountInvested.toStringAsFixed(0)}',
                  trend: null,
                ),
                DashboardStat(
                  label: 'Active Projects',
                  value: '${stats.activeProjects}',
                  trend: null,
                ),
                DashboardStat(
                  label: 'Expected Returns',
                  value: '\$${stats.expectedReturns.toStringAsFixed(0)}',
                  trend: null,
                ),
              ],
              icon: Icons.trending_up,
              onTap: () => _navigateToInvestments(context),
            ),
            loading: () => _buildLoadingCard(context),
            error: (error, stack) => _buildPermissionErrorCard(context),
          );
        },
      ),
      Consumer(
        builder: (context, ref, child) {
          final statsAsync = ref.watch(dashboardStatsProvider);

          return statsAsync.when(
            data: (stats) {
              final returnPercent = stats.totalAmountInvested > 0
                  ? ((stats.totalReturn / stats.totalAmountInvested) * 100)
                  : 0.0;

              return DashboardStatsCard(
                title: 'Portfolio Performance',
                stats: [
                  DashboardStat(
                    label: 'Current Value',
                    value:
                        '\$${stats.currentPortfolioValue.toStringAsFixed(0)}',
                    trend: null,
                  ),
                  DashboardStat(
                    label: 'Total Return',
                    value: '${returnPercent.toStringAsFixed(1)}%',
                    trend: returnPercent > 0
                        ? const TrendIndicator(direction: TrendDirection.up)
                        : const TrendIndicator(direction: TrendDirection.down),
                  ),
                ],
                icon: Icons.account_balance_wallet,
                onTap: () => _navigateToPortfolio(context),
              );
            },
            loading: () => _buildLoadingCard(context),
            error: (error, stack) => _buildPermissionErrorCard(context),
          );
        },
      ),
    ];
  }

  /// Build organization-specific cards
  List<Widget> _buildOrganizationCards(BuildContext context, User user) {
    return [
      Consumer(
        builder: (context, ref, child) {
          final statsAsync = ref.watch(dashboardStatsProvider);

          return statsAsync.when(
            data: (stats) => DashboardStatsCard(
              title: 'My Projects',
              stats: [
                DashboardStat(
                  label: 'Active Projects',
                  value: '${stats.activeProjects}',
                  trend: null,
                ),
                DashboardStat(
                  label: 'Total Funding',
                  value: '\$${stats.totalRaised.toStringAsFixed(0)}',
                  trend: null,
                ),
                DashboardStat(
                  label: 'Completion Rate',
                  value: '${stats.completionRate.toStringAsFixed(1)}%',
                  trend: stats.completionRate > 50
                      ? const TrendIndicator(direction: TrendDirection.up)
                      : const TrendIndicator(direction: TrendDirection.down),
                ),
              ],
              icon: Icons.business_center,
              onTap: () => _navigateToProjects(context),
            ),
            loading: () => _buildLoadingCard(context),
            error: (error, stack) => _buildPermissionErrorCard(context),
          );
        },
      ),
      Consumer(
        builder: (context, ref, child) {
          final statsAsync = ref.watch(dashboardStatsProvider);

          return statsAsync.when(
            data: (stats) => DashboardStatsCard(
              title: 'Impact Metrics',
              stats: [
                DashboardStat(
                  label: 'People Helped',
                  value: '${stats.peopleHelped}',
                  trend: stats.peopleHelped > 0
                      ? const TrendIndicator(direction: TrendDirection.up)
                      : null,
                ),
                DashboardStat(
                  label: 'SDG Goals',
                  value: '${stats.sdgGoals}',
                  trend: stats.sdgGoals > 0
                      ? const TrendIndicator(direction: TrendDirection.up)
                      : null,
                ),
              ],
              icon: Icons.public,
              onTap: () => _navigateToImpact(context),
            ),
            loading: () => _buildLoadingCard(context),
            error: (error, stack) => _buildPermissionErrorCard(context),
          );
        },
      ),
    ];
  }

  /// Build auditor-specific cards
  List<Widget> _buildAuditorCards(BuildContext context, User user) {
    return [
      Consumer(
        builder: (context, ref, child) {
          final statsAsync = ref.watch(dashboardStatsProvider);

          return statsAsync.when(
            data: (stats) => DashboardStatsCard(
              title: 'Audit Queue',
              stats: [
                DashboardStat(
                  label: 'Pending Reviews',
                  value: '${stats.pendingAudits}',
                  trend: null,
                ),
                DashboardStat(
                  label: 'Completed',
                  value: '${stats.completedAudits}',
                  trend: stats.completedAudits > 0
                      ? const TrendIndicator(direction: TrendDirection.up)
                      : null,
                ),
              ],
              icon: Icons.fact_check,
              onTap: () => _navigateToAudits(context),
            ),
            loading: () => _buildLoadingCard(context),
            error: (error, stack) => _buildPermissionErrorCard(context),
          );
        },
      ),
    ];
  }

  /// Build admin-specific cards
  List<Widget> _buildAdminCards(BuildContext context, User user) {
    return [
      Consumer(
        builder: (context, ref, child) {
          final statsAsync = ref.watch(dashboardStatsProvider);

          return statsAsync.when(
            data: (stats) => DashboardStatsCard(
              title: 'Platform Overview',
              stats: [
                DashboardStat(
                  label: 'Total Users',
                  value: '${stats.totalUsers}',
                  trend: stats.totalUsers > 0
                      ? const TrendIndicator(direction: TrendDirection.up)
                      : null,
                ),
                DashboardStat(
                  label: 'Active Projects',
                  value: '${stats.activeProjects}',
                  trend: stats.activeProjects > 0
                      ? const TrendIndicator(direction: TrendDirection.up)
                      : null,
                ),
                DashboardStat(
                  label: 'Platform Revenue',
                  value: '\$${stats.platformRevenue.toStringAsFixed(0)}',
                  trend: stats.platformRevenue > 0
                      ? const TrendIndicator(direction: TrendDirection.up)
                      : null,
                ),
              ],
              icon: Icons.admin_panel_settings,
              onTap: () => _navigateToAdmin(context),
            ),
            loading: () => _buildLoadingCard(context),
            error: (error, stack) => _buildPermissionErrorCard(context),
          );
        },
      ),
    ];
  }

  /// Build quick actions card
  Widget _buildQuickActionsCard(BuildContext context, User user) {
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.flash_on,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: Spacing.sm),
                Text(
                  'Quick Actions',
                  style: AdaptiveTextStyles.titleMedium(context),
                ),
              ],
            ),
            AdaptiveSpacing.verticalMedium(),
            _buildQuickActionButtons(context, user),
          ],
        ),
      ),
    );
  }

  /// Build quick action buttons based on user role
  Widget _buildQuickActionButtons(BuildContext context, User user) {
    switch (user.role) {
      case UserRole.investor:
        return Wrap(
          spacing: Spacing.sm,
          runSpacing: Spacing.sm,
          children: [
            _buildActionChip(context, 'Browse Projects', Icons.search,
                () => context.go('/browse')),
            _buildActionChip(context, 'Make Investment', Icons.add,
                () => context.go('/investments')),
            _buildActionChip(context, 'View Portfolio', Icons.pie_chart,
                () => context.go('/portfolio')),
          ],
        );

      case UserRole.organization:
        return Wrap(
          spacing: Spacing.sm,
          runSpacing: Spacing.sm,
          children: [
            _buildActionChip(context, 'Create Project', Icons.add_business,
                () => context.go('/projects/create')),
            _buildActionChip(context, 'Update Impact', Icons.update,
                () => context.go('/impact')),
            _buildActionChip(context, 'View Analytics', Icons.analytics,
                () => context.go('/analytics')),
          ],
        );

      case UserRole.auditor:
        return Wrap(
          spacing: Spacing.sm,
          runSpacing: Spacing.sm,
          children: [
            _buildActionChip(context, 'Review Projects', Icons.rate_review,
                () => context.go('/audits')),
            _buildActionChip(context, 'Audit Reports', Icons.assignment,
                () => context.go('/reports')),
          ],
        );

      case UserRole.admin:
        return Wrap(
          spacing: Spacing.sm,
          runSpacing: Spacing.sm,
          children: [
            _buildActionChip(context, 'User Management', Icons.people,
                () => context.go('/admin/users')),
            _buildActionChip(context, 'Platform Settings', Icons.settings,
                () => context.go('/settings')),
            _buildActionChip(context, 'System Reports', Icons.bar_chart,
                () => context.go('/admin/analytics')),
          ],
        );
    }
  }

  /// Build individual action chip
  Widget _buildActionChip(
    BuildContext context,
    String label,
    IconData icon,
    VoidCallback onTap,
  ) {
    return ActionChip(
      avatar: Icon(icon, size: 18),
      label: Text(label),
      onPressed: onTap,
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      labelStyle: AdaptiveTextStyles.bodySmall(context).copyWith(
        color: Theme.of(context).colorScheme.onSecondaryContainer,
      ),
    );
  }

  /// Build loading card
  Widget _buildLoadingCard(BuildContext context) {
    return const AdaptiveCard(
      child: Padding(
        padding: EdgeInsets.all(Spacing.lg),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  /// Build error card
  Widget _buildErrorCard(BuildContext context, String error) {
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          children: [
            Icon(
              Icons.error_outline,
              color: Theme.of(context).colorScheme.error,
              size: 48,
            ),
            AdaptiveSpacing.verticalMedium(),
            Text(
              'Error loading dashboard',
              style: AdaptiveTextStyles.titleMedium(context),
            ),
            AdaptiveSpacing.verticalSmall(),
            Text(
              error,
              style: AdaptiveTextStyles.bodySmall(context).copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  /// Build permission error card for Firestore permission issues
  Widget _buildPermissionErrorCard(BuildContext context) {
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          children: [
            Icon(
              Icons.lock_outline,
              color: Theme.of(context).colorScheme.primary,
              size: 48,
            ),
            AdaptiveSpacing.verticalMedium(),
            Text(
              'Permission Required',
              style: AdaptiveTextStyles.titleMedium(context),
            ),
            AdaptiveSpacing.verticalSmall(),
            Text(
              'Please complete your profile verification to access dashboard data.',
              style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
              ),
              textAlign: TextAlign.center,
            ),
            AdaptiveSpacing.verticalMedium(),
            ElevatedButton.icon(
              onPressed: () => context.go('/kyc'),
              icon: const Icon(Icons.verified_user),
              label: const Text('Complete Verification'),
            ),
          ],
        ),
      ),
    );
  }

  /// Build not authenticated card
  Widget _buildNotAuthenticatedCard(BuildContext context) {
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          children: [
            Icon(
              Icons.login,
              color: Theme.of(context).colorScheme.primary,
              size: 48,
            ),
            AdaptiveSpacing.verticalMedium(),
            Text(
              'Please sign in',
              style: AdaptiveTextStyles.titleMedium(context),
            ),
            AdaptiveSpacing.verticalSmall(),
            Text(
              'You need to be signed in to access the dashboard',
              style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  // Navigation methods
  void _navigateToInvestments(BuildContext context) {
    context.go('/investments');
  }

  void _navigateToPortfolio(BuildContext context) {
    context.go('/portfolio');
  }

  void _navigateToProjects(BuildContext context) {
    context.go('/projects');
  }

  void _navigateToImpact(BuildContext context) {
    context.go('/impact');
  }

  void _navigateToAudits(BuildContext context) {
    context.go('/audits');
  }

  void _navigateToAdmin(BuildContext context) {
    context.go('/admin/users');
  }
}
