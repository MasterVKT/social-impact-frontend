import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/widgets/responsive/responsive_layout.dart';
import '../../../../shared/constants/spacing.dart';
import '../widgets/notification_list_card.dart';
import '../widgets/notification_preferences_card.dart';
import '../widgets/notification_analytics_card.dart';

/// Notifications screen for managing user notifications
class NotificationsScreen extends ConsumerStatefulWidget {
  const NotificationsScreen({super.key});

  @override
  ConsumerState<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends ConsumerState<NotificationsScreen> 
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _selectedFilter = 'all';
  
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }
  
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: _buildMobileLayout(context),
      tablet: _buildTabletLayout(context),
      desktop: _buildDesktopLayout(context),
    );
  }
  
  /// Build mobile layout with tabs
  Widget _buildMobileLayout(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: AdaptiveTextStyles.titleLarge(context),
        ),
        actions: [
          IconButton(
            onPressed: () => _markAllAsRead(),
            icon: const Icon(Icons.done_all),
            tooltip: 'Mark All as Read',
          ),
          PopupMenuButton<String>(
            onSelected: _handleMenuAction,
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'settings',
                child: ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Notification Settings'),
                ),
              ),
              const PopupMenuItem(
                value: 'clear_all',
                child: ListTile(
                  leading: Icon(Icons.clear_all),
                  title: Text('Clear All'),
                ),
              ),
            ],
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'All', icon: Icon(Icons.notifications_outlined)),
            Tab(text: 'Preferences', icon: Icon(Icons.settings_outlined)),
            Tab(text: 'Analytics', icon: Icon(Icons.analytics_outlined)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildNotificationsTab(context),
          _buildPreferencesTab(context),
          _buildAnalyticsTab(context),
        ],
      ),
    );
  }
  
  /// Build tablet layout with navigation rail
  Widget _buildTabletLayout(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: AdaptiveTextStyles.titleLarge(context),
        ),
        actions: [
          IconButton(
            onPressed: () => _markAllAsRead(),
            icon: const Icon(Icons.done_all),
            tooltip: 'Mark All as Read',
          ),
          IconButton(
            onPressed: () => _handleMenuAction('settings'),
            icon: const Icon(Icons.settings),
            tooltip: 'Settings',
          ),
        ],
      ),
      body: Row(
        children: [
          SizedBox(
            width: 200,
            child: NavigationRail(
              selectedIndex: _tabController.index,
              onDestinationSelected: (index) {
                setState(() {
                  _tabController.index = index;
                });
              },
              extended: true,
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.notifications_outlined),
                  selectedIcon: Icon(Icons.notifications),
                  label: Text('Notifications'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.settings_outlined),
                  selectedIcon: Icon(Icons.settings),
                  label: Text('Preferences'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.analytics_outlined),
                  selectedIcon: Icon(Icons.analytics),
                  label: Text('Analytics'),
                ),
              ],
            ),
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: IndexedStack(
              index: _tabController.index,
              children: [
                _buildNotificationsTab(context),
                _buildPreferencesTab(context),
                _buildAnalyticsTab(context),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  /// Build desktop layout with comprehensive dashboard
  Widget _buildDesktopLayout(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications Center',
          style: AdaptiveTextStyles.titleLarge(context),
        ),
        actions: [
          TextButton.icon(
            onPressed: () => _markAllAsRead(),
            icon: const Icon(Icons.done_all),
            label: const Text('Mark All Read'),
          ),
          const SizedBox(width: Spacing.sm),
          IconButton(
            onPressed: () => _handleMenuAction('settings'),
            icon: const Icon(Icons.settings),
            tooltip: 'Settings',
          ),
          const SizedBox(width: Spacing.sm),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top row - Quick stats and filters
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: _buildQuickStatsCard(context),
                ),
                const SizedBox(width: Spacing.lg),
                Expanded(
                  child: _buildFiltersCard(context),
                ),
              ],
            ),
            AdaptiveSpacing.verticalLarge(),
            
            // Main content row
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: NotificationListCard(filter: _selectedFilter),
                ),
                const SizedBox(width: Spacing.lg),
                Expanded(
                  child: Column(
                    children: [
                      const NotificationPreferencesCard(),
                      AdaptiveSpacing.verticalLarge(),
                      const NotificationAnalyticsCard(),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  
  /// Build notifications tab content
  Widget _buildNotificationsTab(BuildContext context) {
    return Column(
      children: [
        _buildMobileFilters(context),
        Expanded(
          child: NotificationListCard(filter: _selectedFilter),
        ),
      ],
    );
  }
  
  /// Build preferences tab content
  Widget _buildPreferencesTab(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(Spacing.md),
      child: NotificationPreferencesCard(showDetailed: true),
    );
  }
  
  /// Build analytics tab content
  Widget _buildAnalyticsTab(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(Spacing.md),
      child: NotificationAnalyticsCard(showDetailed: true),
    );
  }
  
  /// Build quick stats card
  Widget _buildQuickStatsCard(BuildContext context) {
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Notification Overview',
              style: AdaptiveTextStyles.titleMedium(context),
            ),
            AdaptiveSpacing.verticalMedium(),
            
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 4,
              childAspectRatio: 1.5,
              mainAxisSpacing: Spacing.sm,
              crossAxisSpacing: Spacing.sm,
              children: [
                _buildStatItem(context, 'Total', '247', Colors.blue, Icons.notifications),
                _buildStatItem(context, 'Unread', '23', Colors.orange, Icons.mark_email_unread),
                _buildStatItem(context, 'Today', '8', Colors.green, Icons.today),
                _buildStatItem(context, 'Priority', '3', Colors.red, Icons.priority_high),
              ],
            ),
          ],
        ),
      ),
    );
  }
  
  /// Build stat item
  Widget _buildStatItem(BuildContext context, String title, String value, Color color, IconData icon) {
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
        ],
      ),
    );
  }
  
  /// Build filters card
  Widget _buildFiltersCard(BuildContext context) {
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Filter Notifications',
              style: AdaptiveTextStyles.titleMedium(context),
            ),
            AdaptiveSpacing.verticalMedium(),
            
            Wrap(
              spacing: Spacing.sm,
              runSpacing: Spacing.sm,
              children: [
                _buildFilterChip('all', 'All'),
                _buildFilterChip('unread', 'Unread'),
                _buildFilterChip('investment', 'Investment'),
                _buildFilterChip('project', 'Project'),
                _buildFilterChip('system', 'System'),
                _buildFilterChip('priority', 'Priority'),
              ],
            ),
          ],
        ),
      ),
    );
  }
  
  /// Build mobile filters
  Widget _buildMobileFilters(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.all(Spacing.md),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildFilterChip('all', 'All'),
            _buildFilterChip('unread', 'Unread'),
            _buildFilterChip('investment', 'Investment'),
            _buildFilterChip('project', 'Project'),
            _buildFilterChip('system', 'System'),
            _buildFilterChip('priority', 'Priority'),
          ],
        ),
      ),
    );
  }
  
  /// Build filter chip
  Widget _buildFilterChip(String value, String label) {
    final isSelected = _selectedFilter == value;
    return Padding(
      padding: const EdgeInsets.only(right: Spacing.sm),
      child: FilterChip(
        selected: isSelected,
        onSelected: (selected) {
          setState(() {
            _selectedFilter = value;
          });
        },
        label: Text(label),
      ),
    );
  }
  
  /// Handle menu actions
  void _handleMenuAction(String action) {
    switch (action) {
      case 'settings':
        _navigateToSettings();
        break;
      case 'clear_all':
        _showClearAllDialog();
        break;
    }
  }
  
  /// Mark all notifications as read
  void _markAllAsRead() {
    // Implement mark all as read functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('All notifications marked as read')),
    );
  }
  
  /// Show clear all dialog
  void _showClearAllDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Clear All Notifications'),
        content: const Text('Are you sure you want to clear all notifications? This action cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _clearAllNotifications();
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Clear All'),
          ),
        ],
      ),
    );
  }
  
  /// Clear all notifications
  void _clearAllNotifications() {
    // Implement clear all functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('All notifications cleared')),
    );
  }
  
  /// Navigate to notification settings
  void _navigateToSettings() {
    context.go('/settings/notifications');
  }
}