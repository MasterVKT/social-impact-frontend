import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/constants/spacing.dart';
import '../../domain/entities/user_profile.dart';
import '../providers/user_profile_providers.dart';

/// Profile activity card showing user's recent activity and engagement
class ProfileActivityCard extends ConsumerWidget {
  final String? userId;
  final bool showDetailed;

  const ProfileActivityCard({
    super.key,
    this.userId,
    this.showDetailed = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activitiesAsync = ref.watch(userActivitiesPageProvider((limit: showDetailed ? 50 : 10, cursor: null)));

    return activitiesAsync.when(
      data: (page) => AdaptiveCard(
        child: Padding(
          padding: const EdgeInsets.all(Spacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              AdaptiveSpacing.verticalLarge(),
              _buildActivitySummary(context, page.items),
              AdaptiveSpacing.verticalLarge(),
              _buildRecentActivity(context, page.items),
              if (showDetailed) ...[
                AdaptiveSpacing.verticalLarge(),
                _buildActivityTrends(context),
              ],
            ],
          ),
        ),
      ),
      loading: () => const AdaptiveCard(
        child: Padding(
          padding: EdgeInsets.all(Spacing.lg),
          child: Center(child: CircularProgressIndicator()),
        ),
      ),
      error: (e, _) => AdaptiveCard(
        child: Padding(
          padding: const EdgeInsets.all(Spacing.lg),
          child: Text(e.toString()),
        ),
      ),
    );
  }

  /// Build card header
  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.history_outlined,
          color: Theme.of(context).colorScheme.primary,
          size: 24,
        ),
        const SizedBox(width: Spacing.sm),
        Text(
          'Recent Activity',
          style: AdaptiveTextStyles.titleMedium(context),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.green.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            'ACTIVE NOW',
            style: AdaptiveTextStyles.bodySmall(context).copyWith(
              color: Colors.green,
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          ),
        ),
      ],
    );
  }

  /// Build activity summary (simple dérivé de la liste)
  Widget _buildActivitySummary(BuildContext context, List<UserActivity> activities) {
    final today = DateTime.now();
    final actionsToday = activities.where((a) => a.timestamp.difference(today).inDays == 0).length;
    final last7Days = activities.where((a) => today.difference(a.timestamp).inDays < 7).length;
    final streak = last7Days > 0 ? 1 : 0; // simplifié (à améliorer si nécessaire)

    return Container(
      padding: const EdgeInsets.all(Spacing.md),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).colorScheme.surfaceContainerHighest.withOpacity(0.3),
            Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3),
          ],
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildSummaryItem(
                context, 'Actions Today', actionsToday.toString(), Icons.touch_app),
          ),
          Container(
              width: 1,
              height: 40,
              color: Theme.of(context).colorScheme.outline.withOpacity(0.3)),
          Expanded(
            child: _buildSummaryItem(
                context, 'This Week', last7Days.toString(), Icons.calendar_today),
          ),
          Container(
              width: 1,
              height: 40,
              color: Theme.of(context).colorScheme.outline.withOpacity(0.3)),
          Expanded(
            child: _buildSummaryItem(
                context, 'Streak Days', streak.toString(), Icons.local_fire_department),
          ),
        ],
      ),
    );
  }

  /// Build summary item
  Widget _buildSummaryItem(
      BuildContext context, String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(
          icon,
          color: Theme.of(context).colorScheme.primary,
          size: 20,
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: AdaptiveTextStyles.titleMedium(context).copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: AdaptiveTextStyles.bodySmall(context).copyWith(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  /// Build recent activity
  Widget _buildRecentActivity(BuildContext context, List<UserActivity> activities) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Activity Timeline',
              style: AdaptiveTextStyles.titleSmall(context),
            ),
            const Spacer(),
            if (!showDetailed)
              Text(
                'Last 24 hours',
                style: AdaptiveTextStyles.bodySmall(context).copyWith(
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                ),
              ),
          ],
        ),
        AdaptiveSpacing.verticalMedium(),
        Container(
          constraints: BoxConstraints(
            maxHeight: showDetailed ? 400 : 300,
          ),
          child: ListView.separated(
            itemCount: showDetailed ? activities.length : (activities.length > 5 ? 5 : activities.length),
            separatorBuilder: (context, index) => const SizedBox(height: Spacing.sm),
            itemBuilder: (context, index) {
              final activity = activities[index];
              return _buildActivityItem(context, activity, index == 0);
            },
          ),
        ),
      ],
    );
  }

  /// Build activity item
  Widget _buildActivityItem(
      BuildContext context, UserActivity activity, bool isFirst) {
    final colors = _getActivityTypeColors(activity.type);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Timeline indicator
        Column(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: colors['main'],
                shape: BoxShape.circle,
                border: Border.all(
                  color: Theme.of(context).colorScheme.surface,
                  width: 2,
                ),
              ),
              child: Icon(
                _getActivityTypeIcon(activity.type),
                color: Colors.white,
                size: 16,
              ),
            ),
            if (!isFirst)
              Container(
                width: 2,
                height: 40,
                color: Theme.of(context).colorScheme.outline.withOpacity(0.3),
              ),
          ],
        ),

        const SizedBox(width: Spacing.sm),

        // Activity content
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(Spacing.sm),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        activity.description,
                        style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(
                      _formatTimestamp(activity.timestamp),
                      style: AdaptiveTextStyles.bodySmall(context).copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.5),
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: colors['background'],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: colors['border']!),
                      ),
                      child: Text(
                        activity.type.displayName,
                        style: AdaptiveTextStyles.bodySmall(context).copyWith(
                          color: colors['main'],
                          fontWeight: FontWeight.w600,
                          fontSize: 10,
                        ),
                      ),
                    ),
                    if (activity.location != null) ...[
                      const SizedBox(width: Spacing.xs),
                      Icon(
                        Icons.location_on,
                        size: 10,
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.4),
                      ),
                      Text(
                        activity.location!,
                        style: AdaptiveTextStyles.bodySmall(context).copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.5),
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// Build activity trends (detailed view only)
  Widget _buildActivityTrends(BuildContext context) {
    final trends = [
      {'day': 'Mon', 'count': 8},
      {'day': 'Tue', 'count': 12},
      {'day': 'Wed', 'count': 6},
      {'day': 'Thu', 'count': 15},
      {'day': 'Fri', 'count': 11},
      {'day': 'Sat', 'count': 4},
      {'day': 'Sun', 'count': 7},
    ];

    final maxCount =
        trends.map((t) => t['count'] as int).reduce((a, b) => a > b ? a : b);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Weekly Activity Trend',
          style: AdaptiveTextStyles.titleSmall(context),
        ),
        AdaptiveSpacing.verticalMedium(),
        Container(
          padding: const EdgeInsets.all(Spacing.md),
          decoration: BoxDecoration(
            color:
                Theme.of(context).colorScheme.surfaceContainerHighest.withOpacity(0.3),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: trends.map((trend) {
              final count = trend['count'] as int;
              final height = (count / maxCount) * 60.0;

              return Column(
                children: [
                  Text(
                    count.toString(),
                    style: AdaptiveTextStyles.bodySmall(context).copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 10,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    width: 24,
                    height: height,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    trend['day'] as String,
                    style: AdaptiveTextStyles.bodySmall(context).copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.6),
                      fontSize: 10,
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Map<String, Color> _getActivityTypeColors(ActivityType type) {
    switch (type) {
      case ActivityType.investment:
        return {
          'main': Colors.green,
          'background': Colors.green.withOpacity(0.1),
          'border': Colors.green.withOpacity(0.3),
        };
      case ActivityType.login:
      case ActivityType.logout:
        return {
          'main': Colors.blue,
          'background': Colors.blue.withOpacity(0.1),
          'border': Colors.blue.withOpacity(0.3),
        };
      case ActivityType.profileUpdate:
      case ActivityType.settingsUpdate:
        return {
          'main': Colors.orange,
          'background': Colors.orange.withOpacity(0.1),
          'border': Colors.orange.withOpacity(0.3),
        };
      case ActivityType.reportGeneration:
      case ActivityType.dataExport:
        return {
          'main': Colors.purple,
          'background': Colors.purple.withOpacity(0.1),
          'border': Colors.purple.withOpacity(0.3),
        };
      case ActivityType.projectView:
      case ActivityType.search:
        return {
          'main': Colors.cyan,
          'background': Colors.cyan.withOpacity(0.1),
          'border': Colors.cyan.withOpacity(0.3),
        };
      case ActivityType.passwordChange:
      case ActivityType.emailChange:
        return {
          'main': Colors.red,
          'background': Colors.red.withOpacity(0.1),
          'border': Colors.red.withOpacity(0.3),
        };
      case ActivityType.fileUpload:
      case ActivityType.systemAction:
        return {
          'main': Colors.grey,
          'background': Colors.grey.withOpacity(0.1),
          'border': Colors.grey.withOpacity(0.3),
        };
    }
  }

  IconData _getActivityTypeIcon(ActivityType type) {
    switch (type) {
      case ActivityType.login:
        return Icons.login;
      case ActivityType.logout:
        return Icons.logout;
      case ActivityType.profileUpdate:
        return Icons.person;
      case ActivityType.passwordChange:
        return Icons.lock;
      case ActivityType.emailChange:
        return Icons.email;
      case ActivityType.settingsUpdate:
        return Icons.settings;
      case ActivityType.investment:
        return Icons.trending_up;
      case ActivityType.projectView:
        return Icons.visibility;
      case ActivityType.reportGeneration:
        return Icons.assessment;
      case ActivityType.search:
        return Icons.search;
      case ActivityType.dataExport:
        return Icons.download;
      case ActivityType.fileUpload:
        return Icons.upload;
      case ActivityType.systemAction:
        return Icons.settings_applications;
    }
  }

  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else {
      return '${timestamp.day}/${timestamp.month}';
    }
  }
}
