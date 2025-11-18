import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/widgets/responsive/responsive_layout.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/constants/spacing.dart';
import '../../../auth/presentation/providers/auth_provider_aliases.dart';
import '../../domain/entities/audit.dart';
import '../providers/audits_providers.dart';
import '../widgets/audit_card.dart';

/// Auditor Dashboard Screen - Shows all audits assigned to the auditor
class AuditorDashboardScreen extends ConsumerWidget {
  const AuditorDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ResponsiveLayout(
      mobile: _buildMobileLayout(context, ref),
      tablet: _buildTabletLayout(context, ref),
      desktop: _buildDesktopLayout(context, ref),
    );
  }

  Widget _buildMobileLayout(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Audits'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () => _showFilterDialog(context),
          ),
        ],
      ),
      body: _buildContent(context, ref),
    );
  }

  Widget _buildTabletLayout(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Audits'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () => _showFilterDialog(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: _buildContent(context, ref),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Audits'),
        actions: [
          TextButton.icon(
            icon: const Icon(Icons.filter_list),
            label: const Text('Filter'),
            onPressed: () => _showFilterDialog(context),
          ),
          const SizedBox(width: Spacing.md),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(Spacing.xl),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Sidebar with stats
            SizedBox(
              width: 300,
              child: _buildStatsSidebar(context, ref),
            ),
            const SizedBox(width: Spacing.xl),
            // Main content
            Expanded(
              child: _buildContent(context, ref),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return authState.maybeWhen(
      authenticated: (user) {
        return DefaultTabController(
          length: 4,
          child: Column(
            children: [
              const TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.schedule), text: 'Pending'),
                  Tab(icon: Icon(Icons.play_arrow), text: 'In Progress'),
                  Tab(icon: Icon(Icons.warning), text: 'Overdue'),
                  Tab(icon: Icon(Icons.check_circle), text: 'Completed'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    _buildPendingTab(context, ref, user.id),
                    _buildInProgressTab(context, ref, user.id),
                    _buildOverdueTab(context, ref, user.id),
                    _buildCompletedTab(context, ref, user.id),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      orElse: () => const Center(child: Text('Not authenticated')),
    );
  }

  Widget _buildPendingTab(BuildContext context, WidgetRef ref, String auditorId) {
    final auditsAsync = ref.watch(pendingAuditsProvider(auditorId));

    return auditsAsync.when(
      data: (audits) {
        if (audits.isEmpty) {
          return _buildEmptyState(
            context,
            icon: Icons.inbox,
            message: 'No pending audits',
            description: 'You\'ll see new audit assignments here',
          );
        }

        return _buildAuditsList(context, ref, audits);
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => _buildErrorState(context, error.toString()),
    );
  }

  Widget _buildInProgressTab(BuildContext context, WidgetRef ref, String auditorId) {
    final auditsAsync = ref.watch(inProgressAuditsProvider(auditorId));

    return auditsAsync.when(
      data: (audits) {
        if (audits.isEmpty) {
          return _buildEmptyState(
            context,
            icon: Icons.play_arrow,
            message: 'No audits in progress',
            description: 'Start a pending audit to see it here',
          );
        }

        return _buildAuditsList(context, ref, audits);
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => _buildErrorState(context, error.toString()),
    );
  }

  Widget _buildOverdueTab(BuildContext context, WidgetRef ref, String auditorId) {
    final auditsAsync = ref.watch(overdueAuditsProvider(auditorId));

    return auditsAsync.when(
      data: (audits) {
        if (audits.isEmpty) {
          return _buildEmptyState(
            context,
            icon: Icons.check_circle_outline,
            message: 'No overdue audits',
            description: 'Great job staying on schedule!',
          );
        }

        return _buildAuditsList(context, ref, audits, isOverdue: true);
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => _buildErrorState(context, error.toString()),
    );
  }

  Widget _buildCompletedTab(BuildContext context, WidgetRef ref, String auditorId) {
    final auditsAsync = ref.watch(completedAuditsProvider(auditorId));

    return auditsAsync.when(
      data: (audits) {
        if (audits.isEmpty) {
          return _buildEmptyState(
            context,
            icon: Icons.history,
            message: 'No completed audits',
            description: 'Your completed audits will appear here',
          );
        }

        return _buildAuditsList(context, ref, audits);
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => _buildErrorState(context, error.toString()),
    );
  }

  Widget _buildAuditsList(
    BuildContext context,
    WidgetRef ref,
    List<Audit> audits, {
    bool isOverdue = false,
  }) {
    return ListView.separated(
      padding: const EdgeInsets.all(Spacing.md),
      itemCount: audits.length,
      separatorBuilder: (context, index) => const SizedBox(height: Spacing.md),
      itemBuilder: (context, index) {
        final audit = audits[index];
        return AuditCard(
          audit: audit,
          isOverdue: isOverdue,
          onTap: () => _navigateToAuditDetail(context, audit.id),
        );
      },
    );
  }

  Widget _buildStatsSidebar(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return authState.maybeWhen(
      authenticated: (user) {
        final allAuditsAsync = ref.watch(auditorAuditsProvider(user.id));

        return allAuditsAsync.when(
          data: (allAudits) {
            final pending = allAudits.where((a) => a.status == AuditStatus.assigned).length;
            final inProgress = allAudits.where((a) => a.status == AuditStatus.inProgress).length;
            final completed = allAudits.where((a) => a.status == AuditStatus.completed).length;
            final overdue = allAudits.where((a) {
              return a.dueDate != null &&
                  a.dueDate!.isBefore(DateTime.now()) &&
                  a.status != AuditStatus.completed;
            }).length;

            return Column(
              children: [
                AdaptiveCard(
                  child: Padding(
                    padding: const EdgeInsets.all(Spacing.md),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Overview',
                          style: AdaptiveTextStyles.headlineSmall(context),
                        ),
                        const SizedBox(height: Spacing.md),
                        _buildStatItem('Pending', pending, Icons.schedule, Colors.orange),
                        const Divider(),
                        _buildStatItem('In Progress', inProgress, Icons.play_arrow, Colors.blue),
                        const Divider(),
                        _buildStatItem('Overdue', overdue, Icons.warning, Colors.red),
                        const Divider(),
                        _buildStatItem('Completed', completed, Icons.check_circle, Colors.green),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => const SizedBox.shrink(),
        );
      },
      orElse: () => const SizedBox.shrink(),
    );
  }

  Widget _buildStatItem(String label, int value, IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Spacing.sm),
      child: Row(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(width: Spacing.sm),
          Expanded(
            child: Text(label),
          ),
          Text(
            value.toString(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: color,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(
    BuildContext context, {
    required IconData icon,
    required String message,
    required String description,
  }) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.xl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 80,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: Spacing.lg),
            Text(
              message,
              style: AdaptiveTextStyles.headlineMedium(context),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: Spacing.sm),
            Text(
              description,
              style: TextStyle(color: Colors.grey.shade600),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, String error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.xl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 80,
              color: Colors.red,
            ),
            const SizedBox(height: Spacing.lg),
            Text(
              'Error loading audits',
              style: AdaptiveTextStyles.headlineMedium(context),
            ),
            const SizedBox(height: Spacing.sm),
            Text(
              error,
              style: const TextStyle(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  void _showFilterDialog(BuildContext context) {
    // TODO: Implement filter dialog
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Filter functionality coming soon')),
    );
  }

  void _navigateToAuditDetail(BuildContext context, String auditId) {
    context.push('/audits/$auditId');
  }
}
