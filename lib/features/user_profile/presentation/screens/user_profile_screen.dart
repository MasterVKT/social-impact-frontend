import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/widgets/responsive/responsive_layout.dart';
import '../../../../shared/constants/spacing.dart';
import '../widgets/profile_header_card.dart';
import '../widgets/profile_overview_card.dart';
import '../widgets/profile_portfolio_card.dart';
import '../widgets/profile_achievements_card.dart';
import '../widgets/profile_activity_card.dart';
import '../widgets/profile_settings_card.dart';
import '../providers/user_profile_providers.dart';
import '../../../../core/services/analytics/analytics_service.dart';

/// User profile screen with comprehensive profile management
class UserProfileScreen extends ConsumerStatefulWidget {
  final String? userId;
  
  const UserProfileScreen({
    super.key,
    this.userId,
  });

  @override
  ConsumerState<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends ConsumerState<UserProfileScreen> 
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isCurrentUser = true;
  
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _isCurrentUser = widget.userId == null; // Assume null means current user

    // Log view profile
    WidgetsBinding.instance.addPostFrameCallback((_) {
      AnalyticsService.instance.logViewProfile(
        viewedUserId: widget.userId,
        isOwner: _isCurrentUser,
      );
      _logCurrentTab();
    });

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) return;
      _logCurrentTab();
    });
  }
  
  void _logCurrentTab() {
    final tabs = ['overview', 'portfolio', 'activity', 'achievements', 'settings'];
    final current = tabs[_tabController.index];
    AnalyticsService.instance.logViewProfileTab(tab: current, viewedUserId: widget.userId);
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
          _isCurrentUser ? 'My Profile' : 'User Profile',
          style: AdaptiveTextStyles.titleLarge(context),
        ),
        actions: [
          if (_isCurrentUser)
            IconButton(
              onPressed: () => _navigateToEditProfile(),
              icon: const Icon(Icons.edit),
              tooltip: 'Edit Profile',
            ),
          PopupMenuButton<String>(
            onSelected: _handleMenuAction,
            itemBuilder: (context) => [
              if (_isCurrentUser) ...[
                const PopupMenuItem(
                  value: 'settings',
                  child: ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Settings'),
                  ),
                ),
                const PopupMenuItem(
                  value: 'privacy',
                  child: ListTile(
                    leading: Icon(Icons.privacy_tip),
                    title: Text('Privacy'),
                  ),
                ),
                const PopupMenuItem(
                  value: 'security',
                  child: ListTile(
                    leading: Icon(Icons.security),
                    title: Text('Security'),
                  ),
                ),
              ] else ...[
                const PopupMenuItem(
                  value: 'message',
                  child: ListTile(
                    leading: Icon(Icons.message),
                    title: Text('Send Message'),
                  ),
                ),
                const PopupMenuItem(
                  value: 'report',
                  child: ListTile(
                    leading: Icon(Icons.report),
                    title: Text('Report User'),
                  ),
                ),
              ],
              const PopupMenuItem(
                value: 'share',
                child: ListTile(
                  leading: Icon(Icons.share),
                  title: Text('Share Profile'),
                ),
              ),
            ],
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: const [
            Tab(text: 'Overview', icon: Icon(Icons.person_outlined)),
            Tab(text: 'Portfolio', icon: Icon(Icons.account_balance_wallet_outlined)),
            Tab(text: 'Activity', icon: Icon(Icons.history_outlined)),
            Tab(text: 'Achievements', icon: Icon(Icons.emoji_events_outlined)),
            Tab(text: 'Settings', icon: Icon(Icons.settings_outlined)),
          ],
        ),
      ),
      body: Column(
        children: [
          // Profile header (always visible)
          ProfileHeaderCard(
            userId: widget.userId,
            isCurrentUser: _isCurrentUser,
          ),
          
          // Tab content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildOverviewTab(context),
                _buildPortfolioTab(context),
                _buildActivityTab(context),
                _buildAchievementsTab(context),
                _buildSettingsTab(context),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  /// Build tablet layout with navigation rail
  Widget _buildTabletLayout(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _isCurrentUser ? 'My Profile' : 'User Profile',
          style: AdaptiveTextStyles.titleLarge(context),
        ),
        actions: [
          if (_isCurrentUser)
            TextButton.icon(
              onPressed: () => _navigateToEditProfile(),
              icon: const Icon(Icons.edit, size: 18),
              label: const Text('Edit Profile'),
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
          // Profile sidebar
          SizedBox(
            width: 300,
            child: Column(
              children: [
                ProfileHeaderCard(
                  userId: widget.userId,
                  isCurrentUser: _isCurrentUser,
                ),
                Expanded(
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
                        icon: Icon(Icons.person_outlined),
                        selectedIcon: Icon(Icons.person),
                        label: Text('Overview'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.account_balance_wallet_outlined),
                        selectedIcon: Icon(Icons.account_balance_wallet),
                        label: Text('Portfolio'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.history_outlined),
                        selectedIcon: Icon(Icons.history),
                        label: Text('Activity'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.emoji_events_outlined),
                        selectedIcon: Icon(Icons.emoji_events),
                        label: Text('Achievements'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.settings_outlined),
                        selectedIcon: Icon(Icons.settings),
                        label: Text('Settings'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          const VerticalDivider(thickness: 1, width: 1),
          
          // Main content
          Expanded(
            child: IndexedStack(
              index: _tabController.index,
              children: [
                _buildOverviewTab(context),
                _buildPortfolioTab(context),
                _buildActivityTab(context),
                _buildAchievementsTab(context),
                _buildSettingsTab(context),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  /// Build desktop layout with comprehensive profile dashboard
  Widget _buildDesktopLayout(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _isCurrentUser ? 'My Profile Dashboard' : 'User Profile',
          style: AdaptiveTextStyles.titleLarge(context),
        ),
        actions: [
          if (_isCurrentUser) ...[
            TextButton.icon(
              onPressed: () => _navigateToEditProfile(),
              icon: const Icon(Icons.edit, size: 18),
              label: const Text('Edit Profile'),
            ),
            const SizedBox(width: Spacing.sm),
            TextButton.icon(
              onPressed: () => _handleMenuAction('settings'),
              icon: const Icon(Icons.settings, size: 18),
              label: const Text('Settings'),
            ),
            const SizedBox(width: Spacing.sm),
            ElevatedButton.icon(
              onPressed: () => _handleMenuAction('share'),
              icon: const Icon(Icons.share, size: 18),
              label: const Text('Share Profile'),
            ),
          ] else ...[
            ElevatedButton.icon(
              onPressed: () => _handleMenuAction('message'),
              icon: const Icon(Icons.message, size: 18),
              label: const Text('Send Message'),
            ),
          ],
          const SizedBox(width: Spacing.lg),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top row - Profile header and overview
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: ProfileHeaderCard(
                    userId: widget.userId,
                    isCurrentUser: _isCurrentUser,
                  ),
                ),
                const SizedBox(width: Spacing.lg),
                Expanded(
                  flex: 2,
                  child: ProfileOverviewCard(
                    userId: widget.userId,
                    showDetailed: true,
                  ),
                ),
              ],
            ),
            
            AdaptiveSpacing.verticalLarge(),
            
            // Second row - Portfolio and achievements
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ProfilePortfolioCard(
                    userId: widget.userId,
                    showDetailed: false,
                  ),
                ),
                const SizedBox(width: Spacing.lg),
                Expanded(
                  child: ProfileAchievementsCard(
                    userId: widget.userId,
                    showDetailed: false,
                  ),
                ),
              ],
            ),
            
            AdaptiveSpacing.verticalLarge(),
            
            // Bottom row - Activity and settings
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: ProfileActivityCard(
                    userId: widget.userId,
                    showDetailed: false,
                  ),
                ),
                const SizedBox(width: Spacing.lg),
                Expanded(
                  child: ProfileSettingsCard(
                    userId: widget.userId,
                    isCurrentUser: _isCurrentUser,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  
  /// Build overview tab content
  Widget _buildOverviewTab(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(Spacing.md),
      child: ProfileOverviewCard(
        userId: widget.userId,
        showDetailed: true,
      ),
    );
  }
  
  /// Build portfolio tab content
  Widget _buildPortfolioTab(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(Spacing.md),
      child: ProfilePortfolioCard(
        userId: widget.userId,
        showDetailed: true,
      ),
    );
  }
  
  /// Build activity tab content
  Widget _buildActivityTab(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(Spacing.md),
      child: ProfileActivityCard(
        userId: widget.userId,
        showDetailed: true,
      ),
    );
  }
  
  /// Build achievements tab content
  Widget _buildAchievementsTab(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(Spacing.md),
      child: ProfileAchievementsCard(
        userId: widget.userId,
        showDetailed: true,
      ),
    );
  }
  
  /// Build settings tab content
  Widget _buildSettingsTab(BuildContext context) {
    if (!_isCurrentUser) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.lock,
              size: 64,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
            ),
            AdaptiveSpacing.verticalMedium(),
            Text(
              'Settings Not Available',
              style: AdaptiveTextStyles.titleMedium(context),
            ),
            const SizedBox(height: Spacing.sm),
            Text(
              'You can only view settings for your own profile',
              style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }
    
    return SingleChildScrollView(
      padding: const EdgeInsets.all(Spacing.md),
      child: ProfileSettingsCard(
        userId: widget.userId,
        isCurrentUser: _isCurrentUser,
      ),
    );
  }
  
  /// Handle menu actions
  void _handleMenuAction(String action) {
    switch (action) {
      case 'settings':
        _navigateToSettings();
        break;
      case 'privacy':
        _navigateToPrivacySettings();
        break;
      case 'security':
        _navigateToSecuritySettings();
        break;
      case 'message':
        _sendMessage();
        break;
      case 'report':
        _reportUser();
        break;
      case 'share':
        _shareProfile();
        break;
    }
  }
  
  /// Navigate to edit profile
  void _navigateToEditProfile() {
    context.go('/profile/edit');
  }
  
  /// Navigate to settings
  void _navigateToSettings() {
    context.go('/settings');
  }
  
  /// Navigate to privacy settings
  void _navigateToPrivacySettings() {
    context.go('/settings/privacy');
  }
  
  /// Navigate to security settings
  void _navigateToSecuritySettings() {
    context.go('/settings/security');
  }
  
  /// Send message to user
  void _sendMessage() {
    final createThread = ref.read(createThreadProvider);
    final sendMessage = ref.read(sendMessageProvider);
    showDialog(
      context: context,
      builder: (context) {
        final controller = TextEditingController();
        return AlertDialog(
          title: const Text('Send Message'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(
              labelText: 'Message',
              hintText: 'Type your message...',
            ),
            maxLines: 4,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                final text = controller.text.trim();
                if (text.isEmpty) return;
                final viewedUid = widget.userId;
                if (viewedUid == null) {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Cannot message yourself')),
                  );
                  return;
                }
                final threadId = await createThread([viewedUid]);
                await sendMessage(threadId: threadId, text: text);
                await AnalyticsService.instance.logSendMessage(toUserId: viewedUid);
                if (mounted) {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Message sent successfully')),
                  );
                }
              },
              child: const Text('Send'),
            ),
          ],
        );
      },
    );
  }
  
  /// Report user
  void _reportUser() {
    final reportUser = ref.read(reportUserProvider);
    showDialog(
      context: context,
      builder: (context) {
        String? reason;
        final detailsController = TextEditingController();
        return AlertDialog(
          title: const Text('Report User'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Why are you reporting this user?'),
              const SizedBox(height: Spacing.md),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Reason',
                ),
                items: const [
                  DropdownMenuItem(value: 'spam', child: Text('Spam')),
                  DropdownMenuItem(value: 'harassment', child: Text('Harassment')),
                  DropdownMenuItem(value: 'inappropriate', child: Text('Inappropriate Content')),
                  DropdownMenuItem(value: 'fraud', child: Text('Fraud')),
                  DropdownMenuItem(value: 'other', child: Text('Other')),
                ],
                onChanged: (value) => reason = value,
              ),
              const SizedBox(height: Spacing.md),
              TextField(
                controller: detailsController,
                decoration: const InputDecoration(
                  labelText: 'Additional Details',
                  hintText: 'Provide more context...',
                ),
                maxLines: 3,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                final viewedUid = widget.userId;
                if (viewedUid == null || reason == null) {
                  Navigator.of(context).pop();
                  return;
                }
                await reportUser(
                  reportedUid: viewedUid,
                  reason: reason!,
                  details: detailsController.text.trim().isEmpty ? null : detailsController.text.trim(),
                );
                await AnalyticsService.instance.logReportUser(reportedUserId: viewedUid, reason: reason!);
                if (mounted) {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Report submitted successfully')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(foregroundColor: Colors.red),
              child: const Text('Submit Report'),
            ),
          ],
        );
      },
    );
  }
  
  /// Share profile
  void _shareProfile() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Share Profile'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Share this profile with others:'),
            const SizedBox(height: Spacing.md),
            Container(
              padding: const EdgeInsets.all(Spacing.md),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'https://socialimpact.app/profile/${widget.userId ?? "current"}',
                      style: AdaptiveTextStyles.bodySmall(context),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Link copied to clipboard')),
                      );
                    },
                    icon: const Icon(Icons.copy, size: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(height: Spacing.md),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildShareButton(context, 'Email', Icons.email, Colors.blue),
                _buildShareButton(context, 'LinkedIn', Icons.business, Colors.indigo),
                _buildShareButton(context, 'Twitter', Icons.share, Colors.lightBlue),
                _buildShareButton(context, 'WhatsApp', Icons.message, Colors.green),
              ],
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
  
  /// Build share button
  Widget _buildShareButton(BuildContext context, String platform, IconData icon, Color color) {
    return InkWell(
      onTap: () async {
        Navigator.of(context).pop();
        await AnalyticsService.instance.logShareProfile(viewedUserId: widget.userId, channel: platform);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Shared to $platform')),
        );
      },
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(Spacing.sm),
        child: Column(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: color, size: 20),
            ),
            const SizedBox(height: 4),
            Text(
              platform,
              style: AdaptiveTextStyles.bodySmall(context).copyWith(
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}