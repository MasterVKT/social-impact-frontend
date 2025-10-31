import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/widgets/responsive/responsive_layout.dart';
import '../../../../shared/constants/spacing.dart';
import '../widgets/settings_category_card.dart';
import '../widgets/settings_search_bar.dart';
import '../widgets/settings_sync_status.dart';
import '../../domain/entities/app_settings.dart';

/// Main settings screen with comprehensive settings management
class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  String _searchQuery = '';
  PreferenceCategory? _selectedCategory;
  bool _showAdvanced = false;

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: _buildMobileLayout(context),
      tablet: _buildTabletLayout(context),
      desktop: _buildDesktopLayout(context),
    );
  }

  /// Build mobile layout with scrollable categories
  Widget _buildMobileLayout(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: AdaptiveTextStyles.titleLarge(context),
        ),
        actions: [
          IconButton(
            onPressed: () => _showSettingsMenu(context),
            icon: const Icon(Icons.more_vert),
            tooltip: 'Settings Menu',
          ),
        ],
      ),
      body: Column(
        children: [
          // Search and sync status
          Padding(
            padding: const EdgeInsets.all(Spacing.md),
            child: Column(
              children: [
                SettingsSearchBar(
                  onChanged: (query) => setState(() => _searchQuery = query),
                ),
                AdaptiveSpacing.verticalMedium(),
                const SettingsSyncStatusWidget(),
              ],
            ),
          ),

          // Settings categories
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: Spacing.md),
              children: [
                ..._buildFilteredCategories(context),
                AdaptiveSpacing.verticalLarge(),
                _buildQuickActions(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Build tablet layout with categories sidebar
  Widget _buildTabletLayout(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: AdaptiveTextStyles.titleLarge(context),
        ),
        actions: [
          TextButton.icon(
            onPressed: () => _exportSettings(context),
            icon: const Icon(Icons.download, size: 18),
            label: const Text('Export'),
          ),
          TextButton.icon(
            onPressed: () => _importSettings(context),
            icon: const Icon(Icons.upload, size: 18),
            label: const Text('Import'),
          ),
          IconButton(
            onPressed: () => _showSettingsMenu(context),
            icon: const Icon(Icons.settings),
            tooltip: 'Settings Menu',
          ),
        ],
      ),
      body: Row(
        children: [
          // Categories sidebar
          SizedBox(
            width: 280,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(Spacing.md),
                  child: Column(
                    children: [
                      SettingsSearchBar(
                        onChanged: (query) =>
                            setState(() => _searchQuery = query),
                      ),
                      AdaptiveSpacing.verticalMedium(),
                      const SettingsSyncStatusWidget(),
                    ],
                  ),
                ),
                Expanded(
                  child: _buildCategoryNavigation(context),
                ),
              ],
            ),
          ),

          const VerticalDivider(thickness: 1, width: 1),

          // Main content
          Expanded(
            child: _selectedCategory != null
                ? _buildCategoryContent(context, _selectedCategory!)
                : _buildOverviewContent(context),
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
          'Settings & Preferences',
          style: AdaptiveTextStyles.titleLarge(context),
        ),
        actions: [
          Switch.adaptive(
            value: _showAdvanced,
            onChanged: (value) => setState(() => _showAdvanced = value),
          ),
          const SizedBox(width: Spacing.xs),
          const Text('Advanced'),
          const SizedBox(width: Spacing.lg),
          TextButton.icon(
            onPressed: () => _resetToDefaults(context),
            icon: const Icon(Icons.refresh, size: 18),
            label: const Text('Reset to Defaults'),
          ),
          const SizedBox(width: Spacing.sm),
          TextButton.icon(
            onPressed: () => _exportSettings(context),
            icon: const Icon(Icons.download, size: 18),
            label: const Text('Export Settings'),
          ),
          const SizedBox(width: Spacing.sm),
          ElevatedButton.icon(
            onPressed: () => _saveAllSettings(context),
            icon: const Icon(Icons.save, size: 18),
            label: const Text('Save All'),
          ),
          const SizedBox(width: Spacing.lg),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          children: [
            // Top bar with search and sync
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: SettingsSearchBar(
                    onChanged: (query) => setState(() => _searchQuery = query),
                  ),
                ),
                const SizedBox(width: Spacing.lg),
                const Expanded(
                  child: SettingsSyncStatusWidget(),
                ),
              ],
            ),

            AdaptiveSpacing.verticalLarge(),

            // Settings grid
            Expanded(
              child: _buildSettingsGrid(context),
            ),
          ],
        ),
      ),
    );
  }

  /// Build category navigation
  Widget _buildCategoryNavigation(BuildContext context) {
    const categories = PreferenceCategory.values;

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.md),
      itemCount: categories.length,
      separatorBuilder: (context, index) => const SizedBox(height: Spacing.xs),
      itemBuilder: (context, index) {
        final category = categories[index];
        final isSelected = _selectedCategory == category;

        return InkWell(
          onTap: () => setState(() => _selectedCategory = category),
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: Spacing.md,
              vertical: Spacing.sm,
            ),
            decoration: BoxDecoration(
              color: isSelected
                  ? Theme.of(context).colorScheme.primaryContainer
                  : null,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(
                  _getCategoryIcon(category),
                  color: isSelected
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.onSurface,
                  size: 20,
                ),
                const SizedBox(width: Spacing.sm),
                Text(
                  category.displayName,
                  style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                    fontWeight: isSelected ? FontWeight.w600 : null,
                    color: isSelected
                        ? Theme.of(context).colorScheme.primary
                        : null,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// Build category content
  Widget _buildCategoryContent(
      BuildContext context, PreferenceCategory category) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(Spacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            category.displayName,
            style: AdaptiveTextStyles.titleLarge(context),
          ),
          AdaptiveSpacing.verticalMedium(),
          Text(
            _getCategoryDescription(category),
            style: AdaptiveTextStyles.bodyMedium(context).copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
            ),
          ),
          AdaptiveSpacing.verticalLarge(),
          _buildCategorySettings(context, category),
        ],
      ),
    );
  }

  /// Build overview content
  Widget _buildOverviewContent(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(Spacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Settings Overview',
            style: AdaptiveTextStyles.titleLarge(context),
          ),
          AdaptiveSpacing.verticalMedium(),
          Text(
            'Manage your application preferences and account settings',
            style: AdaptiveTextStyles.bodyMedium(context).copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
            ),
          ),
          AdaptiveSpacing.verticalLarge(),
          ..._buildFilteredCategories(context),
        ],
      ),
    );
  }

  /// Build settings grid for desktop
  Widget _buildSettingsGrid(BuildContext context) {
    final categories = _buildFilteredCategories(context);

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: Spacing.lg,
        mainAxisSpacing: Spacing.lg,
        childAspectRatio: 1.2,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) => categories[index],
    );
  }

  /// Build filtered categories
  List<Widget> _buildFilteredCategories(BuildContext context) {
    var categories = PreferenceCategory.values;

    if (!_showAdvanced) {
      categories =
          categories.where((c) => c != PreferenceCategory.advanced).toList();
    }

    if (_searchQuery.isNotEmpty) {
      categories = categories.where((category) {
        return category.displayName
                .toLowerCase()
                .contains(_searchQuery.toLowerCase()) ||
            _getCategoryDescription(category)
                .toLowerCase()
                .contains(_searchQuery.toLowerCase());
      }).toList();
    }

    return categories.map((category) {
      return SettingsCategoryCard(
        category: category,
        icon: _getCategoryIcon(category),
        onTap: () => _navigateToCategory(context, category),
      );
    }).toList();
  }

  /// Build category settings
  Widget _buildCategorySettings(
      BuildContext context, PreferenceCategory category) {
    switch (category) {
      case PreferenceCategory.general:
        return _buildGeneralSettings(context);
      case PreferenceCategory.notifications:
        return _buildNotificationSettings(context);
      case PreferenceCategory.display:
        return _buildDisplaySettings(context);
      case PreferenceCategory.privacy:
        return _buildPrivacySettings(context);
      case PreferenceCategory.security:
        return _buildSecuritySettings(context);
      case PreferenceCategory.accessibility:
        return _buildAccessibilitySettings(context);
      case PreferenceCategory.advanced:
        return _buildAdvancedSettings(context);
    }
  }

  /// Build general settings
  Widget _buildGeneralSettings(BuildContext context) {
    return Column(
      children: [
        _buildSettingsGroup(
          context,
          'Language & Region',
          [
            _buildDropdownSetting(
              context,
              'Language',
              'English',
              ['English', 'French', 'Spanish', 'German'],
              (value) => _updateSetting('language', value),
            ),
            _buildDropdownSetting(
              context,
              'Currency',
              'EUR',
              ['EUR', 'USD', 'GBP', 'JPY'],
              (value) => _updateSetting('currency', value),
            ),
            _buildDropdownSetting(
              context,
              'Timezone',
              'Europe/London',
              ['Europe/London', 'America/New_York', 'Asia/Tokyo'],
              (value) => _updateSetting('timezone', value),
            ),
          ],
        ),
        AdaptiveSpacing.verticalLarge(),
        _buildSettingsGroup(
          context,
          'Application Behavior',
          [
            _buildSwitchSetting(
              context,
              'Auto-save changes',
              'Automatically save changes as you make them',
              true,
              (value) => _updateSetting('autoSave', value),
            ),
            _buildSwitchSetting(
              context,
              'Offline mode',
              'Allow the app to work without internet connection',
              true,
              (value) => _updateSetting('offlineMode', value),
            ),
            _buildSwitchSetting(
              context,
              'Analytics',
              'Help improve the app by sharing usage analytics',
              false,
              (value) => _updateSetting('analytics', value),
            ),
          ],
        ),
      ],
    );
  }

  /// Build notification settings
  Widget _buildNotificationSettings(BuildContext context) {
    return Column(
      children: [
        _buildSettingsGroup(
          context,
          'Notification Channels',
          [
            _buildSwitchSetting(
              context,
              'Email notifications',
              'Receive notifications via email',
              true,
              (value) => _updateSetting('emailNotifications', value),
            ),
            _buildSwitchSetting(
              context,
              'Push notifications',
              'Receive push notifications on this device',
              true,
              (value) => _updateSetting('pushNotifications', value),
            ),
            _buildSwitchSetting(
              context,
              'SMS notifications',
              'Receive important notifications via SMS',
              false,
              (value) => _updateSetting('smsNotifications', value),
            ),
          ],
        ),
        AdaptiveSpacing.verticalLarge(),
        _buildSettingsGroup(
          context,
          'Notification Types',
          [
            _buildSwitchSetting(
              context,
              'Investment alerts',
              'Get notified about investment opportunities',
              true,
              (value) => _updateSetting('investmentAlerts', value),
            ),
            _buildSwitchSetting(
              context,
              'Portfolio updates',
              'Receive updates about your portfolio performance',
              true,
              (value) => _updateSetting('portfolioUpdates', value),
            ),
            _buildSwitchSetting(
              context,
              'Project news',
              'Get updates about projects you follow',
              true,
              (value) => _updateSetting('projectNews', value),
            ),
          ],
        ),
      ],
    );
  }

  /// Build display settings
  Widget _buildDisplaySettings(BuildContext context) {
    return Column(
      children: [
        _buildSettingsGroup(
          context,
          'Appearance',
          [
            _buildDropdownSetting(
              context,
              'Theme',
              'System',
              ['Light', 'Dark', 'System'],
              (value) => _updateSetting('theme', value),
            ),
            _buildDropdownSetting(
              context,
              'Accent color',
              'Blue',
              ['Blue', 'Green', 'Purple', 'Orange'],
              (value) => _updateSetting('accentColor', value),
            ),
            _buildSwitchSetting(
              context,
              'High contrast',
              'Increase contrast for better visibility',
              false,
              (value) => _updateSetting('highContrast', value),
            ),
          ],
        ),
        AdaptiveSpacing.verticalLarge(),
        _buildSettingsGroup(
          context,
          'Layout',
          [
            _buildSliderSetting(
              context,
              'Text size',
              1.0,
              0.8,
              1.5,
              (value) => _updateSetting('textSize', value),
            ),
            _buildDropdownSetting(
              context,
              'Density',
              'Comfortable',
              ['Compact', 'Comfortable', 'Spacious'],
              (value) => _updateSetting('density', value),
            ),
          ],
        ),
      ],
    );
  }

  /// Build privacy settings
  Widget _buildPrivacySettings(BuildContext context) {
    return Column(
      children: [
        _buildSettingsGroup(
          context,
          'Profile Privacy',
          [
            _buildSwitchSetting(
              context,
              'Profile visibility',
              'Make your profile visible to other users',
              true,
              (value) => _updateSetting('profileVisibility', value),
            ),
            _buildSwitchSetting(
              context,
              'Show online status',
              'Let others see when you\'re online',
              true,
              (value) => _updateSetting('showOnlineStatus', value),
            ),
            _buildSwitchSetting(
              context,
              'Show in search results',
              'Allow your profile to appear in search results',
              true,
              (value) => _updateSetting('showInSearchResults', value),
            ),
          ],
        ),
        AdaptiveSpacing.verticalLarge(),
        _buildSettingsGroup(
          context,
          'Data & Analytics',
          [
            _buildSwitchSetting(
              context,
              'Share analytics',
              'Help improve the service by sharing usage data',
              false,
              (value) => _updateSetting('shareAnalytics', value),
            ),
            _buildSwitchSetting(
              context,
              'Allow tracking',
              'Allow tracking for personalized experience',
              false,
              (value) => _updateSetting('allowTracking', value),
            ),
          ],
        ),
      ],
    );
  }

  /// Build security settings
  Widget _buildSecuritySettings(BuildContext context) {
    return Column(
      children: [
        _buildSettingsGroup(
          context,
          'Authentication',
          [
            _buildSwitchSetting(
              context,
              'Two-factor authentication',
              'Add an extra layer of security to your account',
              false,
              (value) => _setup2FA(context, value),
            ),
            _buildSwitchSetting(
              context,
              'Biometric authentication',
              'Use fingerprint or face recognition',
              false,
              (value) => _setupBiometric(context, value),
            ),
          ],
        ),
        AdaptiveSpacing.verticalLarge(),
        _buildSettingsGroup(
          context,
          'Session Management',
          [
            _buildSliderSetting(
              context,
              'Session timeout (minutes)',
              30.0,
              5.0,
              120.0,
              (value) => _updateSetting('sessionTimeout', value),
            ),
            _buildActionSetting(
              context,
              'Active sessions',
              'Manage devices and active sessions',
              () => _manageActiveSessions(context),
            ),
          ],
        ),
      ],
    );
  }

  /// Build accessibility settings
  Widget _buildAccessibilitySettings(BuildContext context) {
    return Column(
      children: [
        _buildSettingsGroup(
          context,
          'Visual Accessibility',
          [
            _buildSwitchSetting(
              context,
              'Screen reader support',
              'Enable screen reader optimizations',
              false,
              (value) => _updateSetting('screenReader', value),
            ),
            _buildSwitchSetting(
              context,
              'High contrast text',
              'Increase text contrast for better readability',
              false,
              (value) => _updateSetting('highContrastText', value),
            ),
            _buildSwitchSetting(
              context,
              'Large text',
              'Use larger text throughout the app',
              false,
              (value) => _updateSetting('largeText', value),
            ),
          ],
        ),
        AdaptiveSpacing.verticalLarge(),
        _buildSettingsGroup(
          context,
          'Motor Accessibility',
          [
            _buildSwitchSetting(
              context,
              'Reduced motion',
              'Reduce animations and transitions',
              false,
              (value) => _updateSetting('reducedMotion', value),
            ),
            _buildSwitchSetting(
              context,
              'Haptic feedback',
              'Enable vibration feedback for interactions',
              true,
              (value) => _updateSetting('hapticFeedback', value),
            ),
          ],
        ),
      ],
    );
  }

  /// Build advanced settings
  Widget _buildAdvancedSettings(BuildContext context) {
    return Column(
      children: [
        _buildSettingsGroup(
          context,
          'Developer Options',
          [
            _buildSwitchSetting(
              context,
              'Debug mode',
              'Enable debug information and logging',
              false,
              (value) => _updateSetting('debugMode', value),
            ),
            _buildSwitchSetting(
              context,
              'Crash reporting',
              'Automatically send crash reports',
              false,
              (value) => _updateSetting('crashReporting', value),
            ),
          ],
        ),
        AdaptiveSpacing.verticalLarge(),
        _buildSettingsGroup(
          context,
          'Data Management',
          [
            _buildActionSetting(
              context,
              'Export settings',
              'Download your settings as a backup file',
              () => _exportSettings(context),
            ),
            _buildActionSetting(
              context,
              'Import settings',
              'Restore settings from a backup file',
              () => _importSettings(context),
            ),
            _buildActionSetting(
              context,
              'Reset to defaults',
              'Restore all settings to their default values',
              () => _resetToDefaults(context),
            ),
          ],
        ),
      ],
    );
  }

  /// Build quick actions
  Widget _buildQuickActions(BuildContext context) {
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Quick Actions',
              style: AdaptiveTextStyles.titleMedium(context),
            ),
            AdaptiveSpacing.verticalMedium(),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => _exportSettings(context),
                    icon: const Icon(Icons.download),
                    label: const Text('Export'),
                  ),
                ),
                const SizedBox(width: Spacing.sm),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => _importSettings(context),
                    icon: const Icon(Icons.upload),
                    label: const Text('Import'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: Spacing.sm),
            SizedBox(
              width: double.infinity,
              child: TextButton.icon(
                onPressed: () => _resetToDefaults(context),
                icon: const Icon(Icons.refresh),
                label: const Text('Reset to Defaults'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Build settings group
  Widget _buildSettingsGroup(
    BuildContext context,
    String title,
    List<Widget> children,
  ) {
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AdaptiveTextStyles.titleSmall(context),
            ),
            AdaptiveSpacing.verticalMedium(),
            ...children,
          ],
        ),
      ),
    );
  }

  /// Build switch setting
  Widget _buildSwitchSetting(
    BuildContext context,
    String title,
    String description,
    bool value,
    Function(bool) onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Spacing.sm),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  description,
                  style: AdaptiveTextStyles.bodySmall(context).copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),
          Switch.adaptive(
            value: value,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  /// Build dropdown setting
  Widget _buildDropdownSetting(
    BuildContext context,
    String title,
    String value,
    List<String> options,
    Function(String) onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Spacing.sm),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          DropdownButton<String>(
            value: value,
            onChanged: (newValue) {
              if (newValue != null) onChanged(newValue);
            },
            items: options.map((option) {
              return DropdownMenuItem(
                value: option,
                child: Text(option),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  /// Build slider setting
  Widget _buildSliderSetting(
    BuildContext context,
    String title,
    double value,
    double min,
    double max,
    Function(double) onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Spacing.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                value.toStringAsFixed(1),
                style: AdaptiveTextStyles.bodySmall(context),
              ),
            ],
          ),
          Slider(
            value: value,
            min: min,
            max: max,
            divisions: ((max - min) * 10).round(),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  /// Build action setting
  Widget _buildActionSetting(
    BuildContext context,
    String title,
    String description,
    VoidCallback onTap,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Spacing.sm),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: Spacing.sm),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      description,
                      style: AdaptiveTextStyles.bodySmall(context).copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.4),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Get category icon
  IconData _getCategoryIcon(PreferenceCategory category) {
    switch (category) {
      case PreferenceCategory.general:
        return Icons.settings;
      case PreferenceCategory.notifications:
        return Icons.notifications;
      case PreferenceCategory.display:
        return Icons.display_settings;
      case PreferenceCategory.privacy:
        return Icons.privacy_tip;
      case PreferenceCategory.security:
        return Icons.security;
      case PreferenceCategory.accessibility:
        return Icons.accessibility;
      case PreferenceCategory.advanced:
        return Icons.developer_mode;
    }
  }

  /// Get category description
  String _getCategoryDescription(PreferenceCategory category) {
    switch (category) {
      case PreferenceCategory.general:
        return 'Configure general application settings and preferences';
      case PreferenceCategory.notifications:
        return 'Manage how and when you receive notifications';
      case PreferenceCategory.display:
        return 'Customize the appearance and layout of the application';
      case PreferenceCategory.privacy:
        return 'Control your privacy settings and data sharing preferences';
      case PreferenceCategory.security:
        return 'Manage security features and account protection';
      case PreferenceCategory.accessibility:
        return 'Configure accessibility features for better usability';
      case PreferenceCategory.advanced:
        return 'Advanced settings for power users and developers';
    }
  }

  /// Navigate to category
  void _navigateToCategory(BuildContext context, PreferenceCategory category) {
    if (Theme.of(context).platform == TargetPlatform.iOS ||
        Theme.of(context).platform == TargetPlatform.android) {
      // On mobile, navigate to full screen
      context.push('/settings/${category.name}');
    } else {
      // On tablet/desktop, update selection
      setState(() => _selectedCategory = category);
    }
  }

  /// Update setting
  void _updateSetting(String key, dynamic value) {
    // Update setting logic would go here
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Updated $key: $value')),
    );
  }

  /// Setup 2FA
  void _setup2FA(BuildContext context, bool enable) {
    if (enable) {
      // Navigate to 2FA setup
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Navigate to 2FA setup')),
      );
    } else {
      // Disable 2FA
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Two-factor authentication disabled')),
      );
    }
  }

  /// Setup biometric authentication
  void _setupBiometric(BuildContext context, bool enable) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(
              'Biometric authentication ${enable ? 'enabled' : 'disabled'}')),
    );
  }

  /// Manage active sessions
  void _manageActiveSessions(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Navigate to active sessions')),
    );
  }

  /// Export settings
  void _exportSettings(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Export Settings'),
        content: const Text('Export your settings to a backup file?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Settings exported successfully')),
              );
            },
            child: const Text('Export'),
          ),
        ],
      ),
    );
  }

  /// Import settings
  void _importSettings(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Import Settings'),
        content: const Text('Import settings from a backup file?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Settings imported successfully')),
              );
            },
            child: const Text('Import'),
          ),
        ],
      ),
    );
  }

  /// Reset to defaults
  void _resetToDefaults(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Reset to Defaults'),
        content: const Text(
            'This will reset all settings to their default values. This action cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Settings reset to defaults')),
              );
            },
            style: ElevatedButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Reset'),
          ),
        ],
      ),
    );
  }

  /// Save all settings
  void _saveAllSettings(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('All settings saved successfully')),
    );
  }

  /// Show settings menu
  void _showSettingsMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.download),
              title: const Text('Export Settings'),
              onTap: () {
                Navigator.pop(context);
                _exportSettings(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.upload),
              title: const Text('Import Settings'),
              onTap: () {
                Navigator.pop(context);
                _importSettings(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.refresh),
              title: const Text('Reset to Defaults'),
              onTap: () {
                Navigator.pop(context);
                _resetToDefaults(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text('Settings Help'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Navigate to settings help')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
