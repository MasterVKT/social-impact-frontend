import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/constants/spacing.dart';
import '../../domain/entities/user_profile.dart';
import '../providers/user_profile_providers.dart';

/// Profile achievements card showing user's achievements and badges
class ProfileAchievementsCard extends ConsumerWidget {
  final String? userId;
  final bool showDetailed;

  const ProfileAchievementsCard({
    super.key,
    this.userId,
    this.showDetailed = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final achievementsAsync = ref.watch(userAchievementsProvider);
    final statsAsync = ref.watch(userAchievementsStatsProvider);

    return achievementsAsync.when(
      data: (items) => AdaptiveCard(
        child: Padding(
          padding: const EdgeInsets.all(Spacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              AdaptiveSpacing.verticalLarge(),
              _buildAchievementStats(context, statsAsync.asData?.value),
              AdaptiveSpacing.verticalLarge(),
              _buildRecentAchievements(context, items),
              if (showDetailed) ...[
                AdaptiveSpacing.verticalLarge(),
                _buildAchievementCategories(context, items),
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
          Icons.emoji_events_outlined,
          color: Theme.of(context).colorScheme.primary,
          size: 24,
        ),
        const SizedBox(width: Spacing.sm),
        Text(
          'Achievements & Badges',
          style: AdaptiveTextStyles.titleMedium(context),
        ),
        const Spacer(),
        if (showDetailed)
          TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              textStyle: const TextStyle(fontSize: 10),
              minimumSize: const Size(0, 0),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: () => _viewAllAchievements(context),
            child: const Text('View All'),
          ),
      ],
    );
  }

  /// Build achievement stats (optionnel si stats null)
  Widget _buildAchievementStats(BuildContext context, Map<String, dynamic>? stats) {
    final totalBadges = stats?['totalBadges']?.toString() ?? '-';
    final points = stats?['points']?.toString() ?? '-';
    final rank = stats?['rank']?.toString() ?? '-';

    return Container(
      padding: const EdgeInsets.all(Spacing.md),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.amber.withOpacity(0.1),
            Colors.orange.withOpacity(0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.amber.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildStatItem(context, totalBadges, 'Total Badges', Icons.military_tech),
          ),
          Container(width: 1, height: 40, color: Colors.amber.withOpacity(0.3)),
          Expanded(
            child: _buildStatItem(context, points, 'Points Earned', Icons.stars),
          ),
          Container(width: 1, height: 40, color: Colors.amber.withOpacity(0.3)),
          Expanded(
            child: _buildStatItem(context, rank, 'Community Rank', Icons.leaderboard),
          ),
        ],
      ),
    );
  }

  /// Build stat item
  Widget _buildStatItem(
      BuildContext context, String value, String label, IconData icon) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.amber[700],
          size: 20,
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: AdaptiveTextStyles.titleMedium(context).copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.amber[700],
          ),
        ),
        Text(
          label,
          style: AdaptiveTextStyles.bodySmall(context).copyWith(
            color: Colors.amber[600],
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  /// Build recent achievements
  Widget _buildRecentAchievements(BuildContext context, List<UserAchievement> items) {
    final recent = items..sort((a, b) => b.earnedAt.compareTo(a.earnedAt));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Recent Achievements',
              style: AdaptiveTextStyles.titleSmall(context),
            ),
            const Spacer(),
            if (!showDetailed)
              Text(
                '${recent.length} new',
                style: AdaptiveTextStyles.bodySmall(context).copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
          ],
        ),
        AdaptiveSpacing.verticalMedium(),
        ...recent.take(showDetailed ? 6 : 3).map((achievement) {
          return Padding(
            padding: const EdgeInsets.only(bottom: Spacing.sm),
            child: _buildAchievementItem(context, achievement),
          );
        }),
      ],
    );
  }

  /// Build achievement item
  Widget _buildAchievementItem(
      BuildContext context, UserAchievement achievement) {
    final colors = _getAchievementTypeColors(achievement.type);

    return Container(
      padding: const EdgeInsets.all(Spacing.sm),
      decoration: BoxDecoration(
        color: colors['background'],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: colors['border']!),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: colors['main'],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              _getAchievementTypeIcon(achievement.type),
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: Spacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  achievement.title,
                  style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  achievement.description,
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (achievement.points != null)
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: colors['main'],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    '+${achievement.points}',
                    style: AdaptiveTextStyles.bodySmall(context).copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ),
              const SizedBox(height: 2),
              Text(
                _formatDate(achievement.earnedAt),
                style: AdaptiveTextStyles.bodySmall(context).copyWith(
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Build achievement categories (dérivées des items si stats absentes)
  Widget _buildAchievementCategories(BuildContext context, List<UserAchievement> items) {
    final counts = <AchievementType, int>{};
    for (final a in items) {
      counts[a.type] = (counts[a.type] ?? 0) + 1;
    }

    final categories = counts.entries.map((e) => {
          'name': e.key.displayName,
          'count': e.value,
          'icon': _getAchievementTypeIcon(e.key),
          'color': _getAchievementTypeColors(e.key)['main']!,
        });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Achievement Categories',
          style: AdaptiveTextStyles.titleSmall(context),
        ),
        AdaptiveSpacing.verticalMedium(),
        Wrap(
          spacing: Spacing.sm,
          runSpacing: Spacing.sm,
          children: categories.map((category) {
            return Container(
              padding: const EdgeInsets.all(Spacing.sm),
              decoration: BoxDecoration(
                color: (category['color'] as Color).withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                    color: (category['color'] as Color).withOpacity(0.3)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    category['icon'] as IconData,
                    color: category['color'] as Color,
                    size: 16,
                  ),
                  const SizedBox(width: Spacing.xs),
                  Text(
                    category['name'] as String,
                    style: AdaptiveTextStyles.bodySmall(context).copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: Spacing.xs),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: category['color'] as Color,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '${category['count']}',
                      style: AdaptiveTextStyles.bodySmall(context).copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  List<UserAchievement> _sortByDateDesc(List<UserAchievement> list) {
    final copy = [...list];
    copy.sort((a, b) => b.earnedAt.compareTo(a.earnedAt));
    return copy;
  }

  Map<String, Color> _getAchievementTypeColors(AchievementType type) {
    switch (type) {
      case AchievementType.firstInvestment:
      case AchievementType.portfolioMilestone:
        return {
          'main': Colors.green,
          'background': Colors.green.withOpacity(0.1),
          'border': Colors.green.withOpacity(0.3),
        };
      case AchievementType.impactGoal:
        return {
          'main': Colors.red,
          'background': Colors.red.withOpacity(0.1),
          'border': Colors.red.withOpacity(0.3),
        };
      case AchievementType.communityContribution:
        return {
          'main': Colors.blue,
          'background': Colors.blue.withOpacity(0.1),
          'border': Colors.blue.withOpacity(0.3),
        };
      case AchievementType.knowledgeBadge:
        return {
          'main': Colors.purple,
          'background': Colors.purple.withOpacity(0.1),
          'border': Colors.purple.withOpacity(0.3),
        };
      case AchievementType.loyaltyBadge:
      case AchievementType.referralReward:
        return {
          'main': Colors.orange,
          'background': Colors.orange.withOpacity(0.1),
          'border': Colors.orange.withOpacity(0.3),
        };
    }
  }

  IconData _getAchievementTypeIcon(AchievementType type) {
    switch (type) {
      case AchievementType.firstInvestment:
      case AchievementType.portfolioMilestone:
        return Icons.trending_up;
      case AchievementType.impactGoal:
        return Icons.favorite;
      case AchievementType.communityContribution:
        return Icons.group;
      case AchievementType.knowledgeBadge:
        return Icons.school;
      case AchievementType.loyaltyBadge:
        return Icons.loyalty;
      case AchievementType.referralReward:
        return Icons.card_giftcard;
    }
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) {
      return 'Today';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays < 30) {
      return '${(difference.inDays / 7).floor()} weeks ago';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }

  /// View all achievements
  void _viewAllAchievements(BuildContext context) {
    // Navigate to achievements screen
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Navigate to achievements screen')),
    );
  }
}
