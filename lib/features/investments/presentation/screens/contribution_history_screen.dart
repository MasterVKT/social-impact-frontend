import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../shared/widgets/responsive/responsive_layout.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/constants/spacing.dart';
import '../../../auth/presentation/providers/auth_provider_aliases.dart';

/// Contribution model for displaying user contributions
class Contribution {
  final String id;
  final String projectId;
  final String? projectTitle;
  final double amount;
  final String status;
  final DateTime createdAt;
  final String? milestoneId;

  const Contribution({
    required this.id,
    required this.projectId,
    this.projectTitle,
    required this.amount,
    required this.status,
    required this.createdAt,
    this.milestoneId,
  });

  factory Contribution.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Contribution(
      id: doc.id,
      projectId: data['projectId'] ?? '',
      projectTitle: data['projectTitle'],
      amount: (data['amount'] ?? 0).toDouble(),
      status: data['status'] ?? 'pending',
      createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      milestoneId: data['milestoneId'],
    );
  }
}

/// Provider to fetch user contributions
final contributionsProvider = StreamProvider.family<List<Contribution>, String>(
  (ref, userId) {
    return FirebaseFirestore.instance
        .collection('contributions')
        .where('contributorId', isEqualTo: userId)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Contribution.fromFirestore(doc)).toList());
  },
);

/// Contribution history screen showing user's investment history
class ContributionHistoryScreen extends ConsumerWidget {
  const ContributionHistoryScreen({super.key});

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
        title: const Text('Contribution History'),
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
        title: const Text('Contribution History'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () => _showFilterDialog(context),
          ),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: _buildContent(context, ref),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contribution History'),
        actions: [
          TextButton.icon(
            icon: const Icon(Icons.download),
            label: const Text('Export'),
            onPressed: () => _exportContributions(context),
          ),
          const SizedBox(width: Spacing.sm),
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
            // Main content
            Expanded(
              child: _buildContent(context, ref),
            ),
            const SizedBox(width: Spacing.xl),
            // Stats sidebar
            SizedBox(
              width: 300,
              child: _buildStatsSidebar(context, ref),
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
        final contributionsAsync = ref.watch(contributionsProvider(user.id));

        return contributionsAsync.when(
          data: (contributions) {
            if (contributions.isEmpty) {
              return _buildEmptyState(context);
            }

            return Column(
              children: [
                // Summary cards
                Padding(
                  padding: const EdgeInsets.all(Spacing.md),
                  child: _buildSummaryCards(context, contributions),
                ),

                // Contributions list
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(Spacing.md),
                    itemCount: contributions.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: Spacing.md),
                    itemBuilder: (context, index) {
                      return _buildContributionCard(
                        context,
                        contributions[index],
                      );
                    },
                  ),
                ),
              ],
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => _buildErrorState(context, error.toString()),
        );
      },
      orElse: () => const Center(child: Text('Not authenticated')),
    );
  }

  Widget _buildSummaryCards(BuildContext context, List<Contribution> contributions) {
    final totalAmount = contributions
        .where((c) => c.status == 'completed')
        .fold<double>(0, (sum, c) => sum + c.amount);

    final completedCount =
        contributions.where((c) => c.status == 'completed').length;

    final pendingCount =
        contributions.where((c) => c.status == 'pending').length;

    return Row(
      children: [
        Expanded(
          child: _buildSummaryCard(
            context,
            title: 'Total Contributed',
            value: '\$${totalAmount.toStringAsFixed(2)}',
            icon: Icons.account_balance_wallet,
            color: Colors.green,
          ),
        ),
        const SizedBox(width: Spacing.md),
        Expanded(
          child: _buildSummaryCard(
            context,
            title: 'Completed',
            value: completedCount.toString(),
            icon: Icons.check_circle,
            color: Colors.blue,
          ),
        ),
        const SizedBox(width: Spacing.md),
        Expanded(
          child: _buildSummaryCard(
            context,
            title: 'Pending',
            value: pendingCount.toString(),
            icon: Icons.pending,
            color: Colors.orange,
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryCard(
    BuildContext context, {
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.md),
        child: Column(
          children: [
            Icon(icon, color: color, size: 32),
            const SizedBox(height: Spacing.sm),
            Text(
              value,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContributionCard(BuildContext context, Contribution contribution) {
    final theme = Theme.of(context);
    final statusColor = _getStatusColor(contribution.status);

    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        contribution.projectTitle ?? 'Project ${contribution.projectId}',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: Spacing.xs),
                      Text(
                        DateFormat('MMM dd, yyyy HH:mm')
                            .format(contribution.createdAt),
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '\$${contribution.amount.toStringAsFixed(2)}',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.green.shade700,
                      ),
                    ),
                    const SizedBox(height: Spacing.xs),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Spacing.sm,
                        vertical: Spacing.xs,
                      ),
                      decoration: BoxDecoration(
                        color: statusColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: statusColor.withOpacity(0.3)),
                      ),
                      child: Text(
                        contribution.status.toUpperCase(),
                        style: TextStyle(
                          color: statusColor,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            if (contribution.milestoneId != null) ...[
              const SizedBox(height: Spacing.sm),
              Row(
                children: [
                  Icon(
                    Icons.flag,
                    size: 16,
                    color: Colors.grey.shade600,
                  ),
                  const SizedBox(width: Spacing.xs),
                  Text(
                    'Milestone Contribution',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ],
            const SizedBox(height: Spacing.sm),
            Row(
              children: [
                Icon(
                  Icons.payment,
                  size: 16,
                  color: Colors.grey.shade600,
                ),
                const SizedBox(width: Spacing.xs),
                Text(
                  'Transaction ID: ${contribution.id.substring(0, 8)}...',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsSidebar(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return authState.maybeWhen(
      authenticated: (user) {
        final contributionsAsync = ref.watch(contributionsProvider(user.id));

        return contributionsAsync.when(
          data: (contributions) {
            final monthlyData = _getMonthlyContributions(contributions);

            return Column(
              children: [
                AdaptiveCard(
                  child: Padding(
                    padding: const EdgeInsets.all(Spacing.md),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Monthly Breakdown',
                          style: AdaptiveTextStyles.titleMedium(context),
                        ),
                        const SizedBox(height: Spacing.md),
                        ...monthlyData.entries.map((entry) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: Spacing.xs),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(entry.key),
                                Text(
                                  '\$${entry.value.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
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

  Map<String, double> _getMonthlyContributions(List<Contribution> contributions) {
    final Map<String, double> monthly = {};
    final now = DateTime.now();

    for (int i = 0; i < 6; i++) {
      final month = DateTime(now.year, now.month - i, 1);
      final monthKey = DateFormat('MMM yyyy').format(month);
      monthly[monthKey] = 0.0;
    }

    for (final contribution in contributions) {
      if (contribution.status == 'completed') {
        final monthKey = DateFormat('MMM yyyy').format(contribution.createdAt);
        monthly[monthKey] = (monthly[monthKey] ?? 0) + contribution.amount;
      }
    }

    return Map.fromEntries(
      monthly.entries.where((e) => e.value > 0).toList()
        ..sort((a, b) => b.key.compareTo(a.key)),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.xl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.account_balance_wallet_outlined,
              size: 100,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: Spacing.lg),
            Text(
              'No Contributions Yet',
              style: AdaptiveTextStyles.headlineMedium(context),
            ),
            const SizedBox(height: Spacing.sm),
            Text(
              'Your contribution history will appear here',
              style: TextStyle(color: Colors.grey.shade600),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: Spacing.xl),
            FilledButton.icon(
              onPressed: () {
                // Navigate to browse projects
              },
              icon: const Icon(Icons.explore),
              label: const Text('Browse Projects'),
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
              'Error Loading Contributions',
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

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'completed':
        return Colors.green;
      case 'pending':
        return Colors.orange;
      case 'failed':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  void _showFilterDialog(BuildContext context) {
    // TODO: Implement filter dialog
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Filter functionality coming soon')),
    );
  }

  void _exportContributions(BuildContext context) {
    // TODO: Implement export functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Export functionality coming soon')),
    );
  }
}
