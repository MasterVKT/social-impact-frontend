import 'package:flutter/material.dart' hide TimeOfDay;
import 'package:flutter/material.dart' as material show TimeOfDay;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/constants/spacing.dart';
import '../../domain/entities/notification.dart';

/// Notification preferences card for managing user preferences
class NotificationPreferencesCard extends ConsumerStatefulWidget {
  final bool showDetailed;
  
  const NotificationPreferencesCard({
    super.key,
    this.showDetailed = false,
  });

  @override
  ConsumerState<NotificationPreferencesCard> createState() => _NotificationPreferencesCardState();
}

class _NotificationPreferencesCardState extends ConsumerState<NotificationPreferencesCard> {
  // Mock preferences state
  final Map<NotificationType, bool> _typePreferences = {
    NotificationType.investment: true,
    NotificationType.dividend: true,
    NotificationType.projectUpdate: true,
    NotificationType.milestoneAchieved: true,
    NotificationType.fundingComplete: true,
    NotificationType.impactReport: true,
    NotificationType.compliance: true,
    NotificationType.security: true,
    NotificationType.systemUpdate: false,
    NotificationType.marketing: false,
    NotificationType.reminder: true,
    NotificationType.welcome: true,
    NotificationType.achievement: true,
    NotificationType.socialUpdate: false,
  };

  final Map<NotificationChannel, bool> _channelPreferences = {
    NotificationChannel.inApp: true,
    NotificationChannel.push: true,
    NotificationChannel.email: true,
    NotificationChannel.sms: false,
    NotificationChannel.webhook: false,
  };

  material.TimeOfDay _quietHoursStart = const material.TimeOfDay(hour: 22, minute: 0);
  material.TimeOfDay _quietHoursEnd = const material.TimeOfDay(hour: 8, minute: 0);
  bool _allowMarketing = false;
  bool _allowReminders = true;

  @override
  Widget build(BuildContext context) {
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            AdaptiveSpacing.verticalLarge(),
            _buildChannelPreferences(context),
            AdaptiveSpacing.verticalLarge(),
            _buildNotificationTypes(context),
            if (widget.showDetailed) ...[
              AdaptiveSpacing.verticalLarge(),
              _buildQuietHours(context),
              AdaptiveSpacing.verticalLarge(),
              _buildGeneralSettings(context),
              AdaptiveSpacing.verticalLarge(),
              _buildMutedProjects(context),
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
          Icons.settings,
          color: Theme.of(context).colorScheme.primary,
          size: 24,
        ),
        const SizedBox(width: Spacing.sm),
        Text(
          'Notification Preferences',
          style: AdaptiveTextStyles.titleMedium(context),
        ),
        const Spacer(),
        if (!widget.showDetailed)
          TextButton(
            onPressed: () => _navigateToDetailedSettings(),
            child: const Text('More Settings'),
          ),
      ],
    );
  }
  
  /// Build channel preferences
  Widget _buildChannelPreferences(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Delivery Channels',
          style: AdaptiveTextStyles.titleSmall(context),
        ),
        AdaptiveSpacing.verticalMedium(),
        
        ...NotificationChannel.values.map((channel) {
          return _buildChannelSwitch(context, channel);
        }),
      ],
    );
  }
  
  /// Build channel switch
  Widget _buildChannelSwitch(BuildContext context, NotificationChannel channel) {
    final isEnabled = _channelPreferences[channel] ?? false;
    
    return Container(
      margin: const EdgeInsets.only(bottom: Spacing.sm),
      padding: const EdgeInsets.all(Spacing.sm),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: Row(
        children: [
          Icon(
            _getChannelIcon(channel),
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
          ),
          const SizedBox(width: Spacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  channel.displayName,
                  style: AdaptiveTextStyles.bodyMedium(context),
                ),
                Text(
                  _getChannelDescription(channel),
                  style: AdaptiveTextStyles.bodySmall(context).copyWith(
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: isEnabled,
            onChanged: (value) {
              setState(() {
                _channelPreferences[channel] = value;
              });
            },
          ),
        ],
      ),
    );
  }
  
  /// Build notification types
  Widget _buildNotificationTypes(BuildContext context) {
    if (!widget.showDetailed) {
      // Show condensed view with main categories
      final mainTypes = [
        NotificationType.investment,
        NotificationType.projectUpdate,
        NotificationType.security,
        NotificationType.marketing,
      ];
      
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Notification Types',
            style: AdaptiveTextStyles.titleSmall(context),
          ),
          AdaptiveSpacing.verticalMedium(),
          
          ...mainTypes.map((type) {
            return _buildTypeSwitch(context, type);
          }),
        ],
      );
    }
    
    // Show detailed view with all types grouped
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Notification Types',
          style: AdaptiveTextStyles.titleSmall(context),
        ),
        AdaptiveSpacing.verticalMedium(),
        
        _buildTypeGroup(context, 'Investment & Finance', [
          NotificationType.investment,
          NotificationType.dividend,
          NotificationType.fundingComplete,
        ]),
        
        AdaptiveSpacing.verticalMedium(),
        
        _buildTypeGroup(context, 'Projects & Impact', [
          NotificationType.projectUpdate,
          NotificationType.milestoneAchieved,
          NotificationType.impactReport,
        ]),
        
        AdaptiveSpacing.verticalMedium(),
        
        _buildTypeGroup(context, 'System & Security', [
          NotificationType.security,
          NotificationType.systemUpdate,
          NotificationType.compliance,
        ]),
        
        AdaptiveSpacing.verticalMedium(),
        
        _buildTypeGroup(context, 'Communication', [
          NotificationType.marketing,
          NotificationType.reminder,
          NotificationType.socialUpdate,
          NotificationType.achievement,
        ]),
      ],
    );
  }
  
  /// Build type group
  Widget _buildTypeGroup(BuildContext context, String title, List<NotificationType> types) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AdaptiveTextStyles.bodyMedium(context).copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: Spacing.sm),
        
        ...types.map((type) => _buildTypeSwitch(context, type)),
      ],
    );
  }
  
  /// Build type switch
  Widget _buildTypeSwitch(BuildContext context, NotificationType type) {
    final isEnabled = _typePreferences[type] ?? false;
    
    return Container(
      margin: const EdgeInsets.only(bottom: Spacing.xs),
      child: SwitchListTile(
        title: Text(type.displayName),
        subtitle: Text(_getTypeDescription(type)),
        value: isEnabled,
        onChanged: (value) {
          setState(() {
            _typePreferences[type] = value;
          });
        },
        dense: true,
        contentPadding: EdgeInsets.zero,
      ),
    );
  }
  
  /// Build quiet hours settings
  Widget _buildQuietHours(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quiet Hours',
          style: AdaptiveTextStyles.titleSmall(context),
        ),
        const SizedBox(height: Spacing.sm),
        Text(
          'No notifications during these hours',
          style: AdaptiveTextStyles.bodySmall(context).copyWith(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
          ),
        ),
        AdaptiveSpacing.verticalMedium(),
        
        Container(
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
                  Expanded(
                    child: _buildTimeSelector(
                      context,
                      'From',
                      _quietHoursStart,
                      (time) => setState(() => _quietHoursStart = time),
                    ),
                  ),
                  const SizedBox(width: Spacing.md),
                  Expanded(
                    child: _buildTimeSelector(
                      context,
                      'To',
                      _quietHoursEnd,
                      (time) => setState(() => _quietHoursEnd = time),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
  
  /// Build time selector
  Widget _buildTimeSelector(
    BuildContext context,
    String label,
    material.TimeOfDay time,
    void Function(material.TimeOfDay) onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AdaptiveTextStyles.bodySmall(context),
        ),
        const SizedBox(height: Spacing.xs),
        InkWell(
          onTap: () async {
            final selectedTime = await showTimePicker(
              context: context,
              initialTime: time,
            );
            if (selectedTime != null) {
              onChanged(selectedTime);
            }
          },
          child: Container(
            padding: const EdgeInsets.all(Spacing.sm),
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).colorScheme.outline.withOpacity(0.5),
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              time.format(context),
              style: AdaptiveTextStyles.bodyMedium(context),
            ),
          ),
        ),
      ],
    );
  }
  
  /// Build general settings
  Widget _buildGeneralSettings(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'General Settings',
          style: AdaptiveTextStyles.titleSmall(context),
        ),
        AdaptiveSpacing.verticalMedium(),
        
        SwitchListTile(
          title: const Text('Marketing Communications'),
          subtitle: const Text('Receive promotional emails and updates'),
          value: _allowMarketing,
          onChanged: (value) {
            setState(() {
              _allowMarketing = value;
            });
          },
          contentPadding: EdgeInsets.zero,
        ),
        
        SwitchListTile(
          title: const Text('Reminders'),
          subtitle: const Text('Receive task and deadline reminders'),
          value: _allowReminders,
          onChanged: (value) {
            setState(() {
              _allowReminders = value;
            });
          },
          contentPadding: EdgeInsets.zero,
        ),
      ],
    );
  }
  
  /// Build muted projects
  Widget _buildMutedProjects(BuildContext context) {
    final mutedProjects = [
      'Solar Farm Initiative',
      'Water Conservation Project',
    ];
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Muted Projects',
              style: AdaptiveTextStyles.titleSmall(context),
            ),
            TextButton(
              onPressed: () => _showMuteProjectDialog(),
              child: const Text('Add Project'),
            ),
          ],
        ),
        
        if (mutedProjects.isEmpty)
          Text(
            'No muted projects',
            style: AdaptiveTextStyles.bodySmall(context).copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
            ),
          )
        else
          ...mutedProjects.map((project) => _buildMutedProjectItem(context, project)),
      ],
    );
  }
  
  /// Build muted project item
  Widget _buildMutedProjectItem(BuildContext context, String project) {
    return Container(
      margin: const EdgeInsets.only(bottom: Spacing.xs),
      padding: const EdgeInsets.all(Spacing.sm),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.errorContainer.withOpacity(0.1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Icon(
            Icons.volume_off,
            size: 16,
            color: Theme.of(context).colorScheme.error,
          ),
          const SizedBox(width: Spacing.sm),
          Expanded(
            child: Text(
              project,
              style: AdaptiveTextStyles.bodySmall(context),
            ),
          ),
          IconButton(
            onPressed: () => _unmuteProject(project),
            icon: const Icon(Icons.close, size: 16),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
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
  
  /// Get channel description
  String _getChannelDescription(NotificationChannel channel) {
    switch (channel) {
      case NotificationChannel.inApp:
        return 'Show notifications within the app';
      case NotificationChannel.push:
        return 'Send push notifications to your device';
      case NotificationChannel.email:
        return 'Send notifications via email';
      case NotificationChannel.sms:
        return 'Send urgent notifications via SMS';
      case NotificationChannel.webhook:
        return 'Send notifications to external systems';
    }
  }
  
  /// Get type description
  String _getTypeDescription(NotificationType type) {
    switch (type) {
      case NotificationType.investment:
        return 'New investment opportunities and updates';
      case NotificationType.dividend:
        return 'Dividend payments and distributions';
      case NotificationType.projectUpdate:
        return 'Progress updates from projects';
      case NotificationType.milestoneAchieved:
        return 'Project milestone completions';
      case NotificationType.fundingComplete:
        return 'Project funding completions';
      case NotificationType.impactReport:
        return 'New impact reports and assessments';
      case NotificationType.compliance:
        return 'Compliance alerts and requirements';
      case NotificationType.security:
        return 'Security alerts and login notifications';
      case NotificationType.systemUpdate:
        return 'System updates and maintenance notices';
      case NotificationType.marketing:
        return 'Promotional content and announcements';
      case NotificationType.reminder:
        return 'Task and deadline reminders';
      case NotificationType.welcome:
        return 'Welcome messages and onboarding';
      case NotificationType.achievement:
        return 'Achievement unlocks and badges';
      case NotificationType.socialUpdate:
        return 'Social activity and community updates';
    }
  }
  
  /// Navigate to detailed settings
  void _navigateToDetailedSettings() {
    // Navigate to detailed notification settings
  }
  
  /// Show mute project dialog
  void _showMuteProjectDialog() {
    // Show dialog to select projects to mute
  }
  
  /// Unmute project
  void _unmuteProject(String project) {
    // Remove project from muted list
    setState(() {
      // Update local state
    });
  }
}