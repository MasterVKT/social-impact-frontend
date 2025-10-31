import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/constants/spacing.dart';
import '../../domain/entities/notification.dart';

/// Notification analytics card for tracking delivery and engagement metrics
class NotificationAnalyticsCard extends ConsumerWidget {
  final bool showDetailed;
  
  const NotificationAnalyticsCard({
    super.key,
    this.showDetailed = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            AdaptiveSpacing.verticalLarge(),
            _buildOverviewStats(context),
            AdaptiveSpacing.verticalLarge(),
            _buildChannelPerformance(context),
            if (showDetailed) ...[
              AdaptiveSpacing.verticalLarge(),
              _buildEngagementTrends(context),
              AdaptiveSpacing.verticalLarge(),
              _buildTypeBreakdown(context),
              AdaptiveSpacing.verticalLarge(),
              _buildRecentActivity(context),
            ],
          ],
        ),
      ),
    );
  }
  
  /// Build card header
  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.analytics,
          color: Theme.of(context).colorScheme.primary,
          size: 24,
        ),
        const SizedBox(width: Spacing.sm),
        Text(
          'Analytics & Insights',
          style: AdaptiveTextStyles.titleMedium(context),
        ),
        const Spacer(),
        if (!showDetailed)
          TextButton(
            onPressed: () => _navigateToDetailedAnalytics(),
            child: const Text('View Details'),
          ),
      ],
    );
  }
  
  /// Build overview stats
  Widget _buildOverviewStats(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Last 30 Days',
          style: AdaptiveTextStyles.titleSmall(context),
        ),
        AdaptiveSpacing.verticalMedium(),
        
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: showDetailed ? 4 : 2,
          childAspectRatio: 1.5,
          mainAxisSpacing: Spacing.sm,
          crossAxisSpacing: Spacing.sm,
          children: [
            _buildStatCard(context, 'Sent', '2,847', '+12%', Colors.blue, Icons.send),
            _buildStatCard(context, 'Delivered', '2,681', '+8%', Colors.green, Icons.check_circle),
            if (showDetailed) ...[
              _buildStatCard(context, 'Opened', '1,923', '+15%', Colors.orange, Icons.mark_email_read),
              _buildStatCard(context, 'Clicked', '645', '+22%', Colors.purple, Icons.touch_app),
            ],
          ],
        ),
      ],
    );
  }
  
  /// Build stat card
  Widget _buildStatCard(
    BuildContext context,
    String title,
    String value,
    String change,
    Color color,
    IconData icon,
  ) {
    final isPositive = change.startsWith('+');
    
    return Container(
      padding: const EdgeInsets.all(Spacing.sm),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 20),
          AdaptiveSpacing.verticalSmall(),
          Text(
            value,
            style: AdaptiveTextStyles.titleMedium(context).copyWith(
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            title,
            style: AdaptiveTextStyles.bodySmall(context),
          ),
          const SizedBox(height: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isPositive ? Icons.trending_up : Icons.trending_down,
                size: 12,
                color: isPositive ? Colors.green : Colors.red,
              ),
              const SizedBox(width: 2),
              Text(
                change,
                style: AdaptiveTextStyles.bodySmall(context).copyWith(
                  color: isPositive ? Colors.green : Colors.red,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  
  /// Build channel performance
  Widget _buildChannelPerformance(BuildContext context) {
    final channels = [
      {
        'channel': NotificationChannel.inApp,
        'sent': 1245,
        'delivered': 1245,
        'opened': 892,
        'deliveryRate': 100.0,
        'openRate': 71.6,
      },
      {
        'channel': NotificationChannel.push,
        'sent': 983,
        'delivered': 934,
        'opened': 567,
        'deliveryRate': 95.0,
        'openRate': 60.7,
      },
      {
        'channel': NotificationChannel.email,
        'sent': 619,
        'delivered': 502,
        'opened': 464,
        'deliveryRate': 81.1,
        'openRate': 92.4,
      },
    ];
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Channel Performance',
          style: AdaptiveTextStyles.titleSmall(context),
        ),
        AdaptiveSpacing.verticalMedium(),
        
        ...channels.map((channelData) {
          final channel = channelData['channel'] as NotificationChannel;
          return _buildChannelItem(context, channel, channelData);
        }),
      ],
    );
  }
  
  /// Build channel performance item
  Widget _buildChannelItem(BuildContext context, NotificationChannel channel, Map<String, dynamic> data) {
    return Container(
      margin: const EdgeInsets.only(bottom: Spacing.sm),
      padding: const EdgeInsets.all(Spacing.md),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                _getChannelIcon(channel),
                color: Theme.of(context).colorScheme.primary,
                size: 20,
              ),
              const SizedBox(width: Spacing.sm),
              Expanded(
                child: Text(
                  channel.displayName,
                  style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                '${data['sent']} sent',
                style: AdaptiveTextStyles.bodySmall(context).copyWith(
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                ),
              ),
            ],
          ),
          AdaptiveSpacing.verticalSmall(),
          
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Delivery Rate',
                      style: AdaptiveTextStyles.bodySmall(context).copyWith(
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Expanded(
                          child: LinearProgressIndicator(
                            value: (data['deliveryRate'] as double) / 100,
                            backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
                            valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                          ),
                        ),
                        const SizedBox(width: Spacing.sm),
                        Text(
                          '${data['deliveryRate'].toStringAsFixed(1)}%',
                          style: AdaptiveTextStyles.bodySmall(context).copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: Spacing.lg),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Open Rate',
                      style: AdaptiveTextStyles.bodySmall(context).copyWith(
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Expanded(
                          child: LinearProgressIndicator(
                            value: (data['openRate'] as double) / 100,
                            backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
                            valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                          ),
                        ),
                        const SizedBox(width: Spacing.sm),
                        Text(
                          '${data['openRate'].toStringAsFixed(1)}%',
                          style: AdaptiveTextStyles.bodySmall(context).copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  
  /// Build engagement trends (detailed view only)
  Widget _buildEngagementTrends(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Engagement Trends',
          style: AdaptiveTextStyles.titleSmall(context),
        ),
        AdaptiveSpacing.verticalMedium(),
        
        Container(
          height: 200,
          padding: const EdgeInsets.all(Spacing.md),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.timeline,
                  size: 48,
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
                ),
                AdaptiveSpacing.verticalMedium(),
                Text(
                  'Engagement Chart',
                  style: AdaptiveTextStyles.titleMedium(context),
                ),
                const SizedBox(height: Spacing.sm),
                Text(
                  'Interactive chart showing engagement trends over time',
                  style: AdaptiveTextStyles.bodySmall(context).copyWith(
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
  
  /// Build notification type breakdown (detailed view only)
  Widget _buildTypeBreakdown(BuildContext context) {
    final typeData = [
      {'type': NotificationType.investment, 'count': 421, 'engagement': 82.3},
      {'type': NotificationType.projectUpdate, 'count': 384, 'engagement': 76.8},
      {'type': NotificationType.dividend, 'count': 267, 'engagement': 89.1},
      {'type': NotificationType.security, 'count': 156, 'engagement': 94.2},
      {'type': NotificationType.milestoneAchieved, 'count': 123, 'engagement': 88.7},
    ];
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Notification Type Performance',
          style: AdaptiveTextStyles.titleSmall(context),
        ),
        AdaptiveSpacing.verticalMedium(),
        
        ...typeData.map((data) {
          final type = data['type'] as NotificationType;
          return _buildTypeItem(context, type, data);
        }),
      ],
    );
  }
  
  /// Build type performance item
  Widget _buildTypeItem(BuildContext context, NotificationType type, Map<String, dynamic> data) {
    return Container(
      margin: const EdgeInsets.only(bottom: Spacing.sm),
      padding: const EdgeInsets.all(Spacing.sm),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Icon(
            _getTypeIcon(type),
            size: 16,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(width: Spacing.sm),
          Expanded(
            flex: 2,
            child: Text(
              type.displayName,
              style: AdaptiveTextStyles.bodySmall(context),
            ),
          ),
          Expanded(
            child: Text(
              '${data['count']} sent',
              style: AdaptiveTextStyles.bodySmall(context).copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: _getEngagementColor(data['engagement'] as double).withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              '${data['engagement'].toStringAsFixed(1)}%',
              style: AdaptiveTextStyles.bodySmall(context).copyWith(
                color: _getEngagementColor(data['engagement'] as double),
                fontWeight: FontWeight.w600,
                fontSize: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  /// Build recent activity (detailed view only)
  Widget _buildRecentActivity(BuildContext context) {
    final activities = [
      {
        'action': 'High engagement on dividend notifications',
        'time': '2 hours ago',
        'type': 'positive',
        'icon': Icons.trending_up,
      },
      {
        'action': 'Push delivery rate improved by 3%',
        'time': '5 hours ago',
        'type': 'positive',
        'icon': Icons.notification_important,
      },
      {
        'action': '15 users updated notification preferences',
        'time': '1 day ago',
        'type': 'neutral',
        'icon': Icons.settings,
      },
      {
        'action': 'Email delivery rate slightly decreased',
        'time': '2 days ago',
        'type': 'negative',
        'icon': Icons.trending_down,
      },
    ];
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recent Activity',
          style: AdaptiveTextStyles.titleSmall(context),
        ),
        AdaptiveSpacing.verticalMedium(),
        
        ...activities.map((activity) => _buildActivityItem(context, activity)),
      ],
    );
  }
  
  /// Build activity item
  Widget _buildActivityItem(BuildContext context, Map<String, dynamic> activity) {
    Color color;
    switch (activity['type'] as String) {
      case 'positive':
        color = Colors.green;
        break;
      case 'negative':
        color = Colors.red;
        break;
      case 'neutral':
      default:
        color = Theme.of(context).colorScheme.primary;
    }
    
    return Container(
      margin: const EdgeInsets.only(bottom: Spacing.sm),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              activity['icon'] as IconData,
              size: 16,
              color: color,
            ),
          ),
          const SizedBox(width: Spacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  activity['action'] as String,
                  style: AdaptiveTextStyles.bodySmall(context),
                ),
                Text(
                  activity['time'] as String,
                  style: AdaptiveTextStyles.bodySmall(context).copyWith(
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  /// Get channel icon
  IconData _getChannelIcon(NotificationChannel channel) {
    switch (channel) {
      case NotificationChannel.inApp:
        return Icons.notifications;
      case NotificationChannel.push:
        return Icons.phone_android;
      case NotificationChannel.email:
        return Icons.email;
      case NotificationChannel.sms:
        return Icons.sms;
      case NotificationChannel.webhook:
        return Icons.webhook;
    }
  }
  
  /// Get type icon
  IconData _getTypeIcon(NotificationType type) {
    switch (type) {
      case NotificationType.investment:
        return Icons.trending_up;
      case NotificationType.dividend:
        return Icons.payments;
      case NotificationType.projectUpdate:
        return Icons.update;
      case NotificationType.milestoneAchieved:
        return Icons.flag;
      case NotificationType.security:
        return Icons.security;
      default:
        return Icons.notifications;
    }
  }
  
  /// Get engagement color based on percentage
  Color _getEngagementColor(double engagement) {
    if (engagement >= 80) return Colors.green;
    if (engagement >= 60) return Colors.orange;
    return Colors.red;
  }
  
  /// Navigate to detailed analytics
  void _navigateToDetailedAnalytics() {
    // Navigate to detailed analytics view
  }
}