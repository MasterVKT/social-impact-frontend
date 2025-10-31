import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/constants/spacing.dart';
import '../../domain/entities/app_settings.dart';

/// Settings category card showing category overview and quick access
class SettingsCategoryCard extends ConsumerWidget {
  final PreferenceCategory category;
  final IconData icon;
  final VoidCallback onTap;
  
  const SettingsCategoryCard({
    super.key,
    required this.category,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AdaptiveCard(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(Spacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              AdaptiveSpacing.verticalMedium(),
              _buildDescription(context),
              const Spacer(),
              _buildQuickStats(context),
              AdaptiveSpacing.verticalSmall(),
              _buildActionButton(context),
            ],
          ),
        ),
      ),
    );
  }
  
  /// Build category header
  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(Spacing.sm),
          decoration: BoxDecoration(
            color: _getCategoryColor().withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: _getCategoryColor(),
            size: 24,
          ),
        ),
        const SizedBox(width: Spacing.sm),
        Expanded(
          child: Text(
            category.displayName,
            style: AdaptiveTextStyles.titleMedium(context),
          ),
        ),
        Icon(
          Icons.chevron_right,
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.4),
          size: 20,
        ),
      ],
    );
  }
  
  /// Build category description
  Widget _buildDescription(BuildContext context) {
    return Text(
      _getCategoryDescription(),
      style: AdaptiveTextStyles.bodyMedium(context).copyWith(
        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
        height: 1.4,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
  
  /// Build quick stats
  Widget _buildQuickStats(BuildContext context) {
    final stats = _getCategoryStats();
    
    return Row(
      children: [
        Expanded(
          child: _buildStatItem(
            context,
            stats['configured'].toString(),
            'Configured',
            Colors.green,
          ),
        ),
        Container(
          width: 1,
          height: 30,
          color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
        ),
        Expanded(
          child: _buildStatItem(
            context,
            stats['total'].toString(),
            'Total',
            Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }
  
  /// Build stat item
  Widget _buildStatItem(BuildContext context, String value, String label, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: AdaptiveTextStyles.titleSmall(context).copyWith(
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: AdaptiveTextStyles.bodySmall(context).copyWith(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
          ),
        ),
      ],
    );
  }
  
  /// Build action button
  Widget _buildActionButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onTap,
        child: Text('Manage ${category.displayName}'),
      ),
    );
  }
  
  /// Get category color
  Color _getCategoryColor() {
    switch (category) {
      case PreferenceCategory.general:
        return Colors.blue;
      case PreferenceCategory.notifications:
        return Colors.orange;
      case PreferenceCategory.display:
        return Colors.purple;
      case PreferenceCategory.privacy:
        return Colors.green;
      case PreferenceCategory.security:
        return Colors.red;
      case PreferenceCategory.accessibility:
        return Colors.indigo;
      case PreferenceCategory.advanced:
        return Colors.grey;
    }
  }
  
  /// Get category description
  String _getCategoryDescription() {
    switch (category) {
      case PreferenceCategory.general:
        return 'Language, region, and basic app preferences';
      case PreferenceCategory.notifications:
        return 'Control how and when you receive notifications';
      case PreferenceCategory.display:
        return 'Customize appearance, theme, and layout';
      case PreferenceCategory.privacy:
        return 'Manage your privacy and data sharing settings';
      case PreferenceCategory.security:
        return 'Secure your account with authentication options';
      case PreferenceCategory.accessibility:
        return 'Features to improve app accessibility';
      case PreferenceCategory.advanced:
        return 'Developer tools and advanced configurations';
    }
  }
  
  /// Get category stats
  Map<String, int> _getCategoryStats() {
    // Mock data - in real app, this would come from settings state
    switch (category) {
      case PreferenceCategory.general:
        return {'configured': 8, 'total': 12};
      case PreferenceCategory.notifications:
        return {'configured': 6, 'total': 15};
      case PreferenceCategory.display:
        return {'configured': 5, 'total': 10};
      case PreferenceCategory.privacy:
        return {'configured': 7, 'total': 11};
      case PreferenceCategory.security:
        return {'configured': 3, 'total': 8};
      case PreferenceCategory.accessibility:
        return {'configured': 2, 'total': 9};
      case PreferenceCategory.advanced:
        return {'configured': 1, 'total': 6};
    }
  }
}