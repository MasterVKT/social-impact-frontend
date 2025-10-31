import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/constants/spacing.dart';

/// Notification list card showing user notifications
class NotificationListCard extends ConsumerStatefulWidget {
  final String filter;
  
  const NotificationListCard({
    super.key,
    required this.filter,
  });

  @override
  ConsumerState<NotificationListCard> createState() => _NotificationListCardState();
}

class _NotificationListCardState extends ConsumerState<NotificationListCard> {
  @override
  Widget build(BuildContext context) {
    return AdaptiveCard(
      child: Column(
        children: [
          _buildHeader(context),
          _buildNotificationList(context),
        ],
      ),
    );
  }
  
  /// Build card header
  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Spacing.lg),
      child: Row(
        children: [
          Icon(
            Icons.notifications,
            color: Theme.of(context).colorScheme.primary,
            size: 24,
          ),
          const SizedBox(width: Spacing.sm),
          Text(
            _getHeaderTitle(),
            style: AdaptiveTextStyles.titleMedium(context),
          ),
          const Spacer(),
          PopupMenuButton<String>(
            onSelected: _handleAction,
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'mark_all_read',
                child: ListTile(
                  leading: Icon(Icons.done_all),
                  title: Text('Mark All as Read'),
                ),
              ),
              const PopupMenuItem(
                value: 'refresh',
                child: ListTile(
                  leading: Icon(Icons.refresh),
                  title: Text('Refresh'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  
  /// Build notification list
  Widget _buildNotificationList(BuildContext context) {
    final notifications = _getFilteredNotifications();
    
    if (notifications.isEmpty) {
      return _buildEmptyState(context);
    }
    
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: notifications.length,
      separatorBuilder: (context, index) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final notification = notifications[index];
        return _buildNotificationItem(context, notification);
      },
    );
  }
  
  /// Build individual notification item
  Widget _buildNotificationItem(BuildContext context, Map<String, dynamic> notification) {
    final isUnread = !(notification['isRead'] as bool);
    
    return InkWell(
      onTap: () => _handleNotificationTap(notification),
      child: Container(
        padding: const EdgeInsets.all(Spacing.lg),
        decoration: BoxDecoration(
          color: isUnread ? Theme.of(context).colorScheme.primaryContainer.withOpacity(0.1) : null,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Notification icon
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: _getNotificationColor(notification['type']).withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                _getNotificationIcon(notification['type']),
                color: _getNotificationColor(notification['type']),
                size: 24,
              ),
            ),
            
            const SizedBox(width: Spacing.md),
            
            // Notification content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          notification['title'],
                          style: AdaptiveTextStyles.titleSmall(context).copyWith(
                            fontWeight: isUnread ? FontWeight.bold : FontWeight.normal,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (isUnread)
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            shape: BoxShape.circle,
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    notification['message'],
                    style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      _buildPriorityChip(notification['priority']),
                      const SizedBox(width: Spacing.sm),
                      Text(
                        notification['time'],
                        style: AdaptiveTextStyles.bodySmall(context).copyWith(
                          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                        ),
                      ),
                      const Spacer(),
                      if (notification['hasAction'] == true)
                        Icon(
                          Icons.launch,
                          size: 14,
                          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            
            // Action menu
            PopupMenuButton<String>(
              onSelected: (value) => _handleNotificationAction(value, notification),
              itemBuilder: (context) => [
                if (isUnread)
                  const PopupMenuItem(
                    value: 'mark_read',
                    child: ListTile(
                      leading: Icon(Icons.mark_email_read),
                      title: Text('Mark as Read'),
                    ),
                  )
                else
                  const PopupMenuItem(
                    value: 'mark_unread',
                    child: ListTile(
                      leading: Icon(Icons.mark_email_unread),
                      title: Text('Mark as Unread'),
                    ),
                  ),
                const PopupMenuItem(
                  value: 'delete',
                  child: ListTile(
                    leading: Icon(Icons.delete, color: Colors.red),
                    title: Text('Delete', style: TextStyle(color: Colors.red)),
                  ),
                ),
                if (notification['hasAction'] == true)
                  const PopupMenuItem(
                    value: 'view_action',
                    child: ListTile(
                      leading: Icon(Icons.open_in_new),
                      title: Text('View Details'),
                    ),
                  ),
              ],
              child: const Icon(Icons.more_vert, size: 20),
            ),
          ],
        ),
      ),
    );
  }
  
  /// Build priority chip
  Widget _buildPriorityChip(String priority) {
    Color color;
    switch (priority.toLowerCase()) {
      case 'urgent':
        color = Colors.red;
        break;
      case 'high':
        color = Colors.orange;
        break;
      case 'medium':
        color = Colors.blue;
        break;
      case 'low':
        color = Colors.grey;
        break;
      default:
        color = Colors.grey;
    }
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        priority.toUpperCase(),
        style: AdaptiveTextStyles.bodySmall(context).copyWith(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: 9,
        ),
      ),
    );
  }
  
  /// Build empty state
  Widget _buildEmptyState(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Spacing.xl),
      child: Column(
        children: [
          Icon(
            Icons.notifications_off_outlined,
            size: 64,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
          ),
          AdaptiveSpacing.verticalMedium(),
          Text(
            _getEmptyStateTitle(),
            style: AdaptiveTextStyles.titleMedium(context),
          ),
          const SizedBox(height: Spacing.sm),
          Text(
            _getEmptyStateMessage(),
            style: AdaptiveTextStyles.bodyMedium(context).copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
  
  /// Get filtered notifications based on current filter
  List<Map<String, dynamic>> _getFilteredNotifications() {
    final allNotifications = _getMockNotifications();
    
    switch (widget.filter) {
      case 'unread':
        return allNotifications.where((n) => !(n['isRead'] as bool)).toList();
      case 'investment':
        return allNotifications.where((n) => n['type'] == 'investment' || n['type'] == 'dividend').toList();
      case 'project':
        return allNotifications.where((n) => n['type'] == 'project_update' || n['type'] == 'milestone').toList();
      case 'system':
        return allNotifications.where((n) => n['type'] == 'system' || n['type'] == 'security').toList();
      case 'priority':
        return allNotifications.where((n) => n['priority'] == 'urgent' || n['priority'] == 'high').toList();
      case 'all':
      default:
        return allNotifications;
    }
  }
  
  /// Get mock notifications data
  List<Map<String, dynamic>> _getMockNotifications() {
    return [
      {
        'id': '1',
        'title': 'Dividend Payment Received',
        'message': 'You received €250 dividend from Solar Farm Project',
        'type': 'dividend',
        'priority': 'medium',
        'time': '2 hours ago',
        'isRead': false,
        'hasAction': true,
      },
      {
        'id': '2',
        'title': 'Project Milestone Achieved',
        'message': 'Clean Water Access Project reached 75% completion milestone',
        'type': 'milestone',
        'priority': 'high',
        'time': '5 hours ago',
        'isRead': false,
        'hasAction': true,
      },
      {
        'id': '3',
        'title': 'New Investment Opportunity',
        'message': 'Healthcare Initiative is now accepting investments',
        'type': 'investment',
        'priority': 'medium',
        'time': '1 day ago',
        'isRead': true,
        'hasAction': true,
      },
      {
        'id': '4',
        'title': 'Monthly Impact Report',
        'message': 'Your November impact report is now available',
        'type': 'report',
        'priority': 'low',
        'time': '2 days ago',
        'isRead': true,
        'hasAction': true,
      },
      {
        'id': '5',
        'title': 'Security Alert',
        'message': 'New login detected from different device',
        'type': 'security',
        'priority': 'urgent',
        'time': '3 days ago',
        'isRead': true,
        'hasAction': false,
      },
      {
        'id': '6',
        'title': 'Project Update',
        'message': 'Education Program has shared a progress update',
        'type': 'project_update',
        'priority': 'low',
        'time': '1 week ago',
        'isRead': true,
        'hasAction': true,
      },
    ];
  }
  
  /// Get notification icon based on type
  IconData _getNotificationIcon(String type) {
    switch (type) {
      case 'dividend':
        return Icons.payments;
      case 'investment':
        return Icons.trending_up;
      case 'milestone':
        return Icons.flag;
      case 'project_update':
        return Icons.update;
      case 'report':
        return Icons.description;
      case 'security':
        return Icons.security;
      case 'system':
        return Icons.settings;
      default:
        return Icons.notifications;
    }
  }
  
  /// Get notification color based on type
  Color _getNotificationColor(String type) {
    switch (type) {
      case 'dividend':
        return Colors.green;
      case 'investment':
        return Colors.blue;
      case 'milestone':
        return Colors.orange;
      case 'project_update':
        return Colors.purple;
      case 'report':
        return Colors.teal;
      case 'security':
        return Colors.red;
      case 'system':
        return Colors.grey;
      default:
        return Colors.blue;
    }
  }
  
  /// Get header title based on filter
  String _getHeaderTitle() {
    switch (widget.filter) {
      case 'unread':
        return 'Unread Notifications';
      case 'investment':
        return 'Investment Notifications';
      case 'project':
        return 'Project Notifications';
      case 'system':
        return 'System Notifications';
      case 'priority':
        return 'Priority Notifications';
      case 'all':
      default:
        return 'All Notifications';
    }
  }
  
  /// Get empty state title
  String _getEmptyStateTitle() {
    switch (widget.filter) {
      case 'unread':
        return 'No unread notifications';
      case 'investment':
        return 'No investment notifications';
      case 'project':
        return 'No project notifications';
      case 'system':
        return 'No system notifications';
      case 'priority':
        return 'No priority notifications';
      case 'all':
      default:
        return 'No notifications';
    }
  }
  
  /// Get empty state message
  String _getEmptyStateMessage() {
    switch (widget.filter) {
      case 'unread':
        return 'All caught up! You have no unread notifications.';
      case 'investment':
        return 'No investment-related notifications at this time.';
      case 'project':
        return 'No project updates or milestone notifications.';
      case 'system':
        return 'No system or security notifications to show.';
      case 'priority':
        return 'No high priority notifications requiring attention.';
      case 'all':
      default:
        return 'You\'ll see important updates and alerts here.';
    }
  }
  
  /// Handle notification tap
  void _handleNotificationTap(Map<String, dynamic> notification) {
    // Mark as read if unread
    if (!(notification['isRead'] as bool)) {
      _markAsRead(notification['id']);
    }
    
    // Navigate to action if available
    if (notification['hasAction'] == true) {
      _navigateToAction(notification);
    }
  }
  
  /// Handle notification actions
  void _handleNotificationAction(String action, Map<String, dynamic> notification) {
    switch (action) {
      case 'mark_read':
        _markAsRead(notification['id']);
        break;
      case 'mark_unread':
        _markAsUnread(notification['id']);
        break;
      case 'delete':
        _deleteNotification(notification['id']);
        break;
      case 'view_action':
        _navigateToAction(notification);
        break;
    }
  }
  
  /// Handle header actions
  void _handleAction(String action) {
    switch (action) {
      case 'mark_all_read':
        _markAllAsRead();
        break;
      case 'refresh':
        _refreshNotifications();
        break;
    }
  }
  
  /// Mark notification as read
  void _markAsRead(String notificationId) {
    // Implement mark as read functionality
    setState(() {
      // Update local state
    });
  }
  
  /// Mark notification as unread
  void _markAsUnread(String notificationId) {
    // Implement mark as unread functionality
    setState(() {
      // Update local state
    });
  }
  
  /// Delete notification
  void _deleteNotification(String notificationId) {
    // Implement delete functionality
    setState(() {
      // Update local state
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Notification deleted')),
    );
  }
  
  /// Mark all notifications as read
  void _markAllAsRead() {
    // Implement mark all as read functionality
    setState(() {
      // Update local state
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('All notifications marked as read')),
    );
  }
  
  /// Refresh notifications
  void _refreshNotifications() {
    // Implement refresh functionality
    setState(() {
      // Update local state
    });
  }
  
  /// Navigate to notification action
  void _navigateToAction(Map<String, dynamic> notification) {
    // Implement navigation based on notification type
    switch (notification['type']) {
      case 'dividend':
      case 'investment':
        // Navigate to investments
        break;
      case 'milestone':
      case 'project_update':
        // Navigate to project details
        break;
      case 'report':
        // Navigate to reports
        break;
      case 'security':
        // Navigate to security settings
        break;
    }
  }
}