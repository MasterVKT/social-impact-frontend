import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/constants/spacing.dart';
import '../../domain/entities/help_support.dart';

/// Help category card displaying category information and article count
class HelpCategoryCard extends ConsumerWidget {
  final HelpCategory category;
  final VoidCallback onTap;
  
  const HelpCategoryCard({
    super.key,
    required this.category,
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
              _buildFooter(context),
            ],
          ),
        ),
      ),
    );
  }
  
  /// Build category header with icon and title
  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(Spacing.sm),
          decoration: BoxDecoration(
            color: _getCategoryColor().withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            _getCategoryIcon(),
            color: _getCategoryColor(),
            size: 24,
          ),
        ),
        const SizedBox(width: Spacing.sm),
        Expanded(
          child: Text(
            category.name,
            style: AdaptiveTextStyles.titleMedium(context).copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
  
  /// Build category description
  Widget _buildDescription(BuildContext context) {
    return Text(
      category.description,
      style: AdaptiveTextStyles.bodyMedium(context).copyWith(
        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
        height: 1.4,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
  
  /// Build footer with article count and arrow
  Widget _buildFooter(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: Spacing.sm,
            vertical: Spacing.xs,
          ),
          decoration: BoxDecoration(
            color: _getCategoryColor().withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: _getCategoryColor().withOpacity(0.3),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.article,
                size: 12,
                color: _getCategoryColor(),
              ),
              const SizedBox(width: 4),
              Text(
                '${category.articleIds.length} articles',
                style: AdaptiveTextStyles.bodySmall(context).copyWith(
                  color: _getCategoryColor(),
                  fontWeight: FontWeight.w600,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.arrow_forward,
            size: 16,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }
  
  /// Get category color based on category ID or configured color
  Color _getCategoryColor() {
    if (category.color != null && category.color!.isNotEmpty) {
      try {
        return Color(int.parse(category.color!.replaceFirst('#', '0xFF')));
      } catch (e) {
        // Fallback to default color based on category ID
      }
    }
    
    // Default colors based on common category patterns
    switch (category.id.toLowerCase()) {
      case 'getting-started':
      case 'onboarding':
        return Colors.green;
      case 'investments':
      case 'portfolio':
      case 'trading':
        return Colors.blue;
      case 'reports':
      case 'analytics':
      case 'reporting':
        return Colors.orange;
      case 'account':
      case 'settings':
      case 'profile':
        return Colors.purple;
      case 'billing':
      case 'payments':
      case 'subscription':
        return Colors.red;
      case 'security':
      case 'privacy':
        return Colors.amber;
      case 'mobile':
      case 'app':
        return Colors.cyan;
      case 'api':
      case 'integration':
        return Colors.indigo;
      default:
        return Colors.grey;
    }
  }
  
  /// Get category icon based on icon name or category ID
  IconData _getCategoryIcon() {
    if (category.iconName != null && category.iconName!.isNotEmpty) {
      // Map string icon names to IconData
      switch (category.iconName!.toLowerCase()) {
        case 'play_arrow':
          return Icons.play_arrow;
        case 'account_balance_wallet':
          return Icons.account_balance_wallet;
        case 'analytics':
          return Icons.analytics;
        case 'settings':
          return Icons.settings;
        case 'payment':
          return Icons.payment;
        case 'security':
          return Icons.security;
        case 'phone_android':
          return Icons.phone_android;
        case 'api':
          return Icons.api;
        case 'help':
          return Icons.help;
        case 'support':
          return Icons.support;
        case 'forum':
          return Icons.forum;
        default:
          return Icons.folder;
      }
    }
    
    // Default icons based on category ID patterns
    switch (category.id.toLowerCase()) {
      case 'getting-started':
      case 'onboarding':
        return Icons.play_arrow;
      case 'investments':
      case 'portfolio':
      case 'trading':
        return Icons.account_balance_wallet;
      case 'reports':
      case 'analytics':
      case 'reporting':
        return Icons.analytics;
      case 'account':
      case 'settings':
      case 'profile':
        return Icons.settings;
      case 'billing':
      case 'payments':
      case 'subscription':
        return Icons.payment;
      case 'security':
      case 'privacy':
        return Icons.security;
      case 'mobile':
      case 'app':
        return Icons.phone_android;
      case 'api':
      case 'integration':
        return Icons.api;
      default:
        return Icons.help_outline;
    }
  }
}