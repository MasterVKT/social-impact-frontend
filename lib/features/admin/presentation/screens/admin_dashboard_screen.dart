import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../shared/widgets/responsive/responsive_layout.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/constants/spacing.dart';

/// Platform statistics model
class PlatformStats {
  final int totalUsers;
  final int totalProjects;
  final int activeProjects;
  final int pendingAudits;
  final int totalContributions;
  final double totalFunding;

  const PlatformStats({
    required this.totalUsers,
    required this.totalProjects,
    required this.activeProjects,
    required this.pendingAudits,
    required this.totalContributions,
    required this.totalFunding,
  });
}

/// Provider to fetch platform statistics
final platformStatsProvider = StreamProvider<PlatformStats>((ref) async* {
  final firestore = FirebaseFirestore.instance;

  // Fetch counts from Firestore
  final usersCount = await firestore.collection('users').count().get();
  final projectsCount = await firestore.collection('projects').count().get();
  final activeProjectsCount = await firestore
      .collection('projects')
      .where('status', isEqualTo: 'fundingActive')
      .count()
      .get();
  final auditsCount = await firestore
      .collection('audits')
      .where('status', isEqualTo: 'assigned')
      .count()
      .get();
  final contributionsCount = await firestore.collection('contributions').count().get();

  // Calculate total funding
  final contributionsSnapshot = await firestore
      .collection('contributions')
      .where('status', isEqualTo: 'completed')
      .get();

  double totalFunding = 0.0;
  for (final doc in contributionsSnapshot.docs) {
    totalFunding += (doc.data()['amount'] ?? 0).toDouble();
  }

  yield PlatformStats(
    totalUsers: usersCount.count ?? 0,
    totalProjects: projectsCount.count ?? 0,
    activeProjects: activeProjectsCount.count ?? 0,
    pendingAudits: auditsCount.count ?? 0,
    totalContributions: contributionsCount.count ?? 0,
    totalFunding: totalFunding,
  );
});

/// Admin Dashboard Screen - Platform overview and management
class AdminDashboardScreen extends ConsumerWidget {
  const AdminDashboardScreen({super.key});

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
        title: const Text('Admin Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.refresh(platformStatsProvider),
          ),
        ],
      ),
      body: _buildContent(context, ref),
      floatingActionButton: _buildFAB(context),
    );
  }

  Widget _buildTabletLayout(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.refresh(platformStatsProvider),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: _buildContent(context, ref),
      ),
      floatingActionButton: _buildFAB(context),
    );
  }

  Widget _buildDesktopLayout(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        actions: [
          TextButton.icon(
            icon: const Icon(Icons.refresh),
            label: const Text('Refresh'),
            onPressed: () => ref.refresh(platformStatsProvider),
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
              flex: 3,
              child: _buildContent(context, ref),
            ),
            const SizedBox(width: Spacing.xl),
            // Sidebar
            SizedBox(
              width: 350,
              child: _buildSidebar(context, ref),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, WidgetRef ref) {
    final statsAsync = ref.watch(platformStatsProvider);

    return statsAsync.when(
      data: (stats) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(Spacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Overview stats
              _buildStatsGrid(context, stats),

              const SizedBox(height: Spacing.xl),

              // Quick actions
              Text(
                'Quick Actions',
                style: AdaptiveTextStyles.headlineSmall(context),
              ),
              const SizedBox(height: Spacing.md),
              _buildQuickActions(context),

              const SizedBox(height: Spacing.xl),

              // Recent activity
              Text(
                'Recent Activity',
                style: AdaptiveTextStyles.headlineSmall(context),
              ),
              const SizedBox(height: Spacing.md),
              _buildRecentActivity(context, ref),
            ],
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: Spacing.md),
            Text('Error loading dashboard: $error'),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsGrid(BuildContext context, PlatformStats stats) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: MediaQuery.of(context).size.width > 900 ? 3 : 2,
      crossAxisSpacing: Spacing.md,
      mainAxisSpacing: Spacing.md,
      childAspectRatio: 1.5,
      children: [
        _buildStatCard(
          context,
          title: 'Total Users',
          value: stats.totalUsers.toString(),
          icon: Icons.people,
          color: Colors.blue,
        ),
        _buildStatCard(
          context,
          title: 'Total Projects',
          value: stats.totalProjects.toString(),
          icon: Icons.folder,
          color: Colors.green,
        ),
        _buildStatCard(
          context,
          title: 'Active Projects',
          value: stats.activeProjects.toString(),
          icon: Icons.rocket_launch,
          color: Colors.purple,
        ),
        _buildStatCard(
          context,
          title: 'Pending Audits',
          value: stats.pendingAudits.toString(),
          icon: Icons.pending_actions,
          color: Colors.orange,
        ),
        _buildStatCard(
          context,
          title: 'Total Contributions',
          value: stats.totalContributions.toString(),
          icon: Icons.payment,
          color: Colors.teal,
        ),
        _buildStatCard(
          context,
          title: 'Total Funding',
          value: '\$${stats.totalFunding.toStringAsFixed(0)}',
          icon: Icons.attach_money,
          color: Colors.green.shade700,
        ),
      ],
    );
  }

  Widget _buildStatCard(
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 40),
            const SizedBox(height: Spacing.sm),
            Text(
              value,
              style: TextStyle(
                fontSize: 28,
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
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Wrap(
      spacing: Spacing.md,
      runSpacing: Spacing.md,
      children: [
        _buildActionButton(
          context,
          label: 'Assign Audit',
          icon: Icons.assignment,
          onPressed: () => context.push('/admin/assign-audit'),
        ),
        _buildActionButton(
          context,
          label: 'Manage Users',
          icon: Icons.people_alt,
          onPressed: () => context.push('/admin/users'),
        ),
        _buildActionButton(
          context,
          label: 'Review Projects',
          icon: Icons.rate_review,
          onPressed: () => context.push('/admin/projects'),
        ),
        _buildActionButton(
          context,
          label: 'View Reports',
          icon: Icons.analytics,
          onPressed: () => context.push('/admin/reports'),
        ),
        _buildActionButton(
          context,
          label: 'Platform Settings',
          icon: Icons.settings,
          onPressed: () => context.push('/admin/settings'),
        ),
        _buildActionButton(
          context,
          label: 'Export Data',
          icon: Icons.download,
          onPressed: () => _showExportDialog(context),
        ),
      ],
    );
  }

  Widget _buildActionButton(
    BuildContext context, {
    required String label,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: 150,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: Spacing.md,
            vertical: Spacing.lg,
          ),
        ),
        child: Column(
          children: [
            Icon(icon, size: 32),
            const SizedBox(height: Spacing.xs),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentActivity(BuildContext context, WidgetRef ref) {
    // TODO: Implement real-time activity feed
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.md),
        child: Column(
          children: [
            _buildActivityItem(
              icon: Icons.add_circle,
              title: 'New project submitted',
              subtitle: '5 minutes ago',
              color: Colors.green,
            ),
            const Divider(),
            _buildActivityItem(
              icon: Icons.person_add,
              title: 'New user registered',
              subtitle: '12 minutes ago',
              color: Colors.blue,
            ),
            const Divider(),
            _buildActivityItem(
              icon: Icons.payment,
              title: 'Contribution received',
              subtitle: '28 minutes ago',
              color: Colors.purple,
            ),
            const Divider(),
            _buildActivityItem(
              icon: Icons.check_circle,
              title: 'Audit completed',
              subtitle: '1 hour ago',
              color: Colors.teal,
            ),
            const Divider(),
            _buildActivityItem(
              icon: Icons.flag,
              title: 'Milestone submitted',
              subtitle: '2 hours ago',
              color: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
  }) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color.withOpacity(0.1),
        child: Icon(icon, color: color, size: 20),
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      contentPadding: EdgeInsets.zero,
    );
  }

  Widget _buildSidebar(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        AdaptiveCard(
          child: Padding(
            padding: const EdgeInsets.all(Spacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'System Status',
                  style: AdaptiveTextStyles.titleMedium(context),
                ),
                const SizedBox(height: Spacing.md),
                _buildStatusItem('Database', 'Healthy', Colors.green),
                const Divider(),
                _buildStatusItem('Payment Gateway', 'Healthy', Colors.green),
                const Divider(),
                _buildStatusItem('Cloud Functions', 'Healthy', Colors.green),
                const Divider(),
                _buildStatusItem('Storage', 'Healthy', Colors.green),
              ],
            ),
          ),
        ),
        const SizedBox(height: Spacing.md),
        AdaptiveCard(
          child: Padding(
            padding: const EdgeInsets.all(Spacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Alerts & Notifications',
                  style: AdaptiveTextStyles.titleMedium(context),
                ),
                const SizedBox(height: Spacing.md),
                _buildAlertItem(
                  Icons.warning,
                  '3 projects pending approval',
                  Colors.orange,
                ),
                const SizedBox(height: Spacing.sm),
                _buildAlertItem(
                  Icons.error,
                  '2 audits overdue',
                  Colors.red,
                ),
                const SizedBox(height: Spacing.sm),
                _buildAlertItem(
                  Icons.info,
                  '5 new user verifications',
                  Colors.blue,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatusItem(String label, String status, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Row(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: Spacing.xs),
            Text(
              status,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAlertItem(IconData icon, String message, Color color) {
    return Row(
      children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(width: Spacing.sm),
        Expanded(
          child: Text(
            message,
            style: const TextStyle(fontSize: 12),
          ),
        ),
      ],
    );
  }

  Widget _buildFAB(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () => context.push('/admin/assign-audit'),
      icon: const Icon(Icons.assignment),
      label: const Text('Assign Audit'),
    );
  }

  void _showExportDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Export Data'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.people),
              title: const Text('Users'),
              trailing: const Icon(Icons.download),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Exporting users...')),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.folder),
              title: const Text('Projects'),
              trailing: const Icon(Icons.download),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Exporting projects...')),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.payment),
              title: const Text('Contributions'),
              trailing: const Icon(Icons.download),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Exporting contributions...')),
                );
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }
}
