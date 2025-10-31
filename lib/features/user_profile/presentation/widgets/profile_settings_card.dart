import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/constants/spacing.dart';
import '../../domain/entities/user_profile.dart';
import '../providers/user_profile_providers.dart';
import '../../../../core/services/analytics/analytics_service.dart';

/// Profile settings card showing quick settings and preferences
class ProfileSettingsCard extends ConsumerWidget {
  final String? userId;
  final bool isCurrentUser;
  
  const ProfileSettingsCard({
    super.key,
    this.userId,
    required this.isCurrentUser,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!isCurrentUser) {
      return AdaptiveCard(
        child: Padding(
          padding: const EdgeInsets.all(Spacing.lg),
          child: Column(
            children: [
              Icon(
                Icons.lock,
                size: 48,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
              ),
              AdaptiveSpacing.verticalMedium(),
              Text(
                'Settings Private',
                style: AdaptiveTextStyles.titleMedium(context),
              ),
              const SizedBox(height: Spacing.sm),
              Text(
                'User settings are only visible to the profile owner',
                style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }
    
    final prefsAsync = ref.watch(userPreferencesProvider);
    final updatePrefs = ref.watch(updateUserPreferencesProvider);
    
    return prefsAsync.when(
      data: (prefs) {
        final effective = prefs ?? const UserPreferences(
          userId: '',
          language: 'en',
          theme: 'light',
          currency: 'EUR',
          timezone: 'UTC',
        );
        return AdaptiveCard(
          child: Padding(
            padding: const EdgeInsets.all(Spacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context),
                AdaptiveSpacing.verticalLarge(),
                _buildQuickSettings(context, effective, updatePrefs),
                AdaptiveSpacing.verticalLarge(),
                _buildPreferencesOverview(context, effective, updatePrefs),
                AdaptiveSpacing.verticalLarge(),
                _buildSecurityOverview(context),
              ],
            ),
          ),
        );
      },
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
          Icons.settings_outlined,
          color: Theme.of(context).colorScheme.primary,
          size: 24,
        ),
        const SizedBox(width: Spacing.sm),
        Text(
          'Quick Settings',
          style: AdaptiveTextStyles.titleMedium(context),
        ),
        const Spacer(),
        TextButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.open_in_new, size: 16),
          label: const Text('All Settings'),
        ),
      ],
    );
  }
  
  /// Build quick settings
  Widget _buildQuickSettings(BuildContext context, UserPreferences prefs, Future<void> Function(UserPreferences) update) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Toggles',
          style: AdaptiveTextStyles.titleSmall(context),
        ),
        AdaptiveSpacing.verticalMedium(),
        _buildToggleItem(
          context,
          'Email Notifications',
          'Receive investment updates via email',
          Icons.email_outlined,
          prefs.emailNotifications,
          (value) => _saveToggle('email_notifications', value, update, prefs.copyWith(emailNotifications: value)),
        ),
        _buildToggleItem(
          context,
          'Push Notifications',
          'Get real-time alerts on your device',
          Icons.notifications_outlined,
          prefs.pushNotifications,
          (value) => _saveToggle('push_notifications', value, update, prefs.copyWith(pushNotifications: value)),
        ),
        _buildToggleItem(
          context,
          'Marketing Emails',
          'Receive product updates and offers',
          Icons.campaign_outlined,
          prefs.marketingEmails,
          (value) => _saveToggle('marketing_emails', value, update, prefs.copyWith(marketingEmails: value)),
        ),
        _buildToggleItem(
          context,
          'Profile Visibility',
          'Make your profile visible to other users',
          Icons.visibility_outlined,
          prefs.profileVisibility,
          (value) => _saveToggle('profile_visibility', value, update, prefs.copyWith(profileVisibility: value)),
        ),
      ],
    );
  }
  
  /// Build toggle item
  Widget _buildToggleItem(
    BuildContext context,
    String title,
    String description,
    IconData icon,
    bool value,
    Function(bool) onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Spacing.sm),
      child: Container(
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
              icon,
              color: Theme.of(context).colorScheme.primary,
              size: 20,
            ),
            const SizedBox(width: Spacing.sm),
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
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
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
      ),
    );
  }
  
  /// Build preferences overview
  Widget _buildPreferencesOverview(BuildContext context, UserPreferences prefs, Future<void> Function(UserPreferences) update) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Preferences',
          style: AdaptiveTextStyles.titleSmall(context),
        ),
        AdaptiveSpacing.verticalMedium(),
        _buildPreferenceItem(
          context,
          'Language',
          prefs.language.toUpperCase(),
          Icons.language,
          () => _savePref('language', prefs.language == 'en' ? 'fr' : 'en', update, prefs.copyWith(language: prefs.language == 'en' ? 'fr' : 'en')),
        ),
        _buildPreferenceItem(
          context,
          'Theme',
          prefs.theme == 'light' ? 'Light Mode' : 'Dark Mode',
          prefs.theme == 'light' ? Icons.light_mode : Icons.dark_mode,
          () => _savePref('theme', prefs.theme == 'light' ? 'dark' : 'light', update, prefs.copyWith(theme: prefs.theme == 'light' ? 'dark' : 'light')),
        ),
        _buildPreferenceItem(
          context,
          'Currency',
          prefs.currency,
          Icons.attach_money,
          () => _savePref('currency', prefs.currency == 'EUR' ? 'USD' : 'EUR', update, prefs.copyWith(currency: prefs.currency == 'EUR' ? 'USD' : 'EUR')),
        ),
        _buildPreferenceItem(
          context,
          'Timezone',
          prefs.timezone,
          Icons.schedule,
          () => _savePref('timezone', prefs.timezone, update, prefs.copyWith(timezone: prefs.timezone)),
        ),
      ],
    );
  }
  
  /// Build preference item
  Widget _buildPreferenceItem(
    BuildContext context,
    String title,
    String value,
    IconData icon,
    VoidCallback onTap,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Spacing.sm),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
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
                icon,
                color: Theme.of(context).colorScheme.primary,
                size: 20,
              ),
              const SizedBox(width: Spacing.sm),
              Expanded(
                child: Text(
                  title,
                  style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                value,
                style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                ),
              ),
              const SizedBox(width: Spacing.xs),
              Icon(
                Icons.chevron_right,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.4),
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  /// Build security overview
  Widget _buildSecurityOverview(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Security & Privacy',
          style: AdaptiveTextStyles.titleSmall(context),
        ),
        AdaptiveSpacing.verticalMedium(),
        _buildSecurityItem(
          context,
          'Two-Factor Authentication',
          'Enabled',
          Icons.security,
          true,
          () {},
        ),
        _buildSecurityItem(
          context,
          'Active Sessions',
          '3 devices',
          Icons.devices,
          false,
          () {},
        ),
        _buildSecurityItem(
          context,
          'Password',
          'Last changed 45 days ago',
          Icons.lock_outline,
          false,
          () {},
        ),
        _buildSecurityItem(
          context,
          'Account Verification',
          'Verified',
          Icons.verified_user,
          true,
          () {},
        ),
      ],
    );
  }
  
  /// Build security item
  Widget _buildSecurityItem(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    bool isSecure,
    VoidCallback onTap,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Spacing.sm),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
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
                icon,
                color: isSecure ? Colors.green : Theme.of(context).colorScheme.primary,
                size: 20,
              ),
              const SizedBox(width: Spacing.sm),
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
                      subtitle,
                      style: AdaptiveTextStyles.bodySmall(context).copyWith(
                        color: isSecure ? Colors.green : Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
              if (isSecure)
                const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 16,
                ),
              const SizedBox(width: Spacing.xs),
              Icon(
                Icons.chevron_right,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.4),
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _save(Future<void> Function(UserPreferences) update, UserPreferences prefs) async {
    await update(prefs);
  }

  Future<void> _saveToggle(String key, bool value, Future<void> Function(UserPreferences) update, UserPreferences prefs) async {
    await update(prefs);
    await AnalyticsService.instance.logTogglePreference(key: key, value: value);
  }

  Future<void> _savePref(String key, String value, Future<void> Function(UserPreferences) update, UserPreferences prefs) async {
    await update(prefs);
    await AnalyticsService.instance.logUpdatePreference(key: key, value: value);
  }

  void _changeLanguage(BuildContext context, UserPreferences prefs, Future<void> Function(UserPreferences) update) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select Language'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('English'),
              onTap: () {
                Navigator.pop(context);
                _save(update, prefs.copyWith(language: 'en'));
              },
            ),
            ListTile(
              title: const Text('Français'),
              onTap: () {
                Navigator.pop(context);
                _save(update, prefs.copyWith(language: 'fr'));
              },
            ),
            ListTile(
              title: const Text('Español'),
              onTap: () {
                Navigator.pop(context);
                _save(update, prefs.copyWith(language: 'es'));
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