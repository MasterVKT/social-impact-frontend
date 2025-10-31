import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/constants/spacing.dart';

/// Recent activities card for dashboard
class RecentActivitiesCard extends ConsumerWidget {
  const RecentActivitiesCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // In a real app, this would watch actual activities provider
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            AdaptiveSpacing.verticalMedium(),
            _buildActivitiesList(context),
            AdaptiveSpacing.verticalMedium(),
            _buildViewAllButton(context),
          ],
        ),
      ),
    );
  }
  
  /// Build card header
  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(Spacing.sm),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            Icons.history,
            color: Theme.of(context).colorScheme.secondary,
            size: 24,
          ),
        ),
        const SizedBox(width: Spacing.md),
        Expanded(
          child: Text(
            'Recent Activities',
            style: AdaptiveTextStyles.titleMedium(context),
          ),
        ),
      ],
    );
  }
  
  /// Build activities list
  Widget _buildActivitiesList(BuildContext context) {
    // Mock activities data - in real app this would come from provider
    final activities = _getMockActivities();
    
    if (activities.isEmpty) {
      return _buildEmptyState(context);
    }
    
    return Column(
      children: activities
          .take(3) // Show only first 3 activities
          .map((activity) => _buildActivityItem(context, activity))
          .toList(),
    );
  }
  
  /// Build individual activity item
  Widget _buildActivityItem(BuildContext context, DashboardActivity activity) {
    return Container(
      margin: const EdgeInsets.only(bottom: Spacing.sm),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: activity.color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(
              activity.icon,
              color: activity.color,
              size: 16,
            ),
          ),
          const SizedBox(width: Spacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  activity.title,
                  style: AdaptiveTextStyles.bodyMedium(context),
                ),
                Text(
                  activity.subtitle,
                  style: AdaptiveTextStyles.bodySmall(context).copyWith(
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),
          Text(
            activity.timeAgo,
            style: AdaptiveTextStyles.bodySmall(context).copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }
  
  /// Build empty state
  Widget _buildEmptyState(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(Spacing.lg),
      child: Column(
        children: [
          Icon(
            Icons.inbox_outlined,
            size: 48,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
          ),
          AdaptiveSpacing.verticalSmall(),
          Text(
            'No recent activities',
            style: AdaptiveTextStyles.bodyMedium(context).copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
            ),
          ),
          Text(
            'Your activities will appear here',
            style: AdaptiveTextStyles.bodySmall(context).copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }
  
  /// Build view all button
  Widget _buildViewAllButton(BuildContext context) {
    return InkWell(
      onTap: () => _navigateToActivities(context),
      borderRadius: BorderRadius.circular(6),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: Spacing.sm),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'View All Activities',
              style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: Spacing.xs),
            Icon(
              Icons.arrow_forward,
              size: 16,
              color: Theme.of(context).colorScheme.primary,
            ),
          ],
        ),
      ),
    );
  }
  
  /// Get mock activities data
  List<DashboardActivity> _getMockActivities() {
    // This would be replaced with actual data from provider
    return [
      const DashboardActivity(
        title: 'Account Created',
        subtitle: 'Welcome to Social Impact Platform',
        timeAgo: '2 days ago',
        icon: Icons.account_circle,
        color: Colors.green,
      ),
      const DashboardActivity(
        title: 'Email Verified',
        subtitle: 'Your email address has been verified',
        timeAgo: '2 days ago',
        icon: Icons.verified,
        color: Colors.blue,
      ),
      const DashboardActivity(
        title: 'Profile Updated',
        subtitle: 'You updated your profile information',
        timeAgo: '1 day ago',
        icon: Icons.edit,
        color: Colors.orange,
      ),
    ];
  }
  
  /// Navigate to activities screen
  void _navigateToActivities(BuildContext context) {
    context.go('/activities');
  }
}

/// Data class for dashboard activities
class DashboardActivity {
  final String title;
  final String subtitle;
  final String timeAgo;
  final IconData icon;
  final Color color;
  
  const DashboardActivity({
    required this.title,
    required this.subtitle,
    required this.timeAgo,
    required this.icon,
    required this.color,
  });
}