import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/constants/spacing.dart';
import '../../../../core/utils/platform_detector.dart';

/// SDG alignment card showing UN Sustainable Development Goals progress
class SDGAlignmentCard extends ConsumerWidget {
  final String timeframe;
  final bool showDetailed;

  const SDGAlignmentCard({
    super.key,
    required this.timeframe,
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
            _buildSDGOverview(context),
            AdaptiveSpacing.verticalLarge(),
            _buildTopSDGs(context),
            if (showDetailed) ...[
              AdaptiveSpacing.verticalLarge(),
              _buildAllSDGs(context),
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
        Container(
          padding: const EdgeInsets.all(Spacing.sm),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            Icons.public,
            color: Theme.of(context).colorScheme.primary,
            size: 24,
          ),
        ),
        const SizedBox(width: Spacing.sm),
        Text(
          'SDG Alignment',
          style: AdaptiveTextStyles.titleMedium(context),
        ),
        const Spacer(),
        PopupMenuButton<String>(
          onSelected: _handleAction,
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'learn_more',
              child: Text('Learn About SDGs'),
            ),
            const PopupMenuItem(
              value: 'detailed_report',
              child: Text('Detailed Report'),
            ),
          ],
          child: const Icon(Icons.more_vert),
        ),
      ],
    );
  }

  /// Build SDG overview summary
  Widget _buildSDGOverview(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Spacing.md),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF00A651).withOpacity(0.1), // UN Green
            const Color(0xFF009BDF).withOpacity(0.1), // UN Blue
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFF00A651).withOpacity(0.3),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'SDG Alignment Score',
                    style: AdaptiveTextStyles.titleMedium(context).copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: Spacing.sm),
                  Text(
                    '8.4/10',
                    style: AdaptiveTextStyles.headlineLarge(context).copyWith(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF00A651),
                    ),
                  ),
                ],
              ),
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: const Color(0xFF00A651).withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 70,
                      height: 70,
                      child: CircularProgressIndicator(
                        value: 0.84, // 8.4/10
                        strokeWidth: 6,
                        backgroundColor:
                            const Color(0xFF00A651).withOpacity(0.2),
                        valueColor: const AlwaysStoppedAnimation<Color>(
                            Color(0xFF00A651)),
                      ),
                    ),
                    Text(
                      '84%',
                      style: AdaptiveTextStyles.titleMedium(context).copyWith(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF00A651),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          AdaptiveSpacing.verticalMedium(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildScoreItem(context, 'Active Goals', '7/17'),
              _buildScoreItem(context, 'High Impact', '4 goals'),
              _buildScoreItem(context, 'Progress', '+12%'),
            ],
          ),
        ],
      ),
    );
  }

  /// Build score item
  Widget _buildScoreItem(BuildContext context, String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: AdaptiveTextStyles.titleSmall(context).copyWith(
            fontWeight: FontWeight.bold,
            color: const Color(0xFF00A651),
          ),
        ),
        Text(
          label,
          style: AdaptiveTextStyles.bodySmall(context),
        ),
      ],
    );
  }

  /// Build top performing SDGs
  Widget _buildTopSDGs(BuildContext context) {
    final topSDGs = [
      {
        'number': 3,
        'title': 'Good Health and Well-being',
        'score': 9.2,
        'progress': 0.92
      },
      {
        'number': 6,
        'title': 'Clean Water and Sanitation',
        'score': 8.8,
        'progress': 0.88
      },
      {
        'number': 4,
        'title': 'Quality Education',
        'score': 8.1,
        'progress': 0.81
      },
      {'number': 13, 'title': 'Climate Action', 'score': 7.6, 'progress': 0.76},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          showDetailed ? 'Top Performing SDGs' : 'Key SDG Contributions',
          style: AdaptiveTextStyles.titleMedium(context),
        ),
        AdaptiveSpacing.verticalMedium(),
        ...topSDGs.take(showDetailed ? 4 : 3).map(
              (sdg) => _buildSDGItem(
                context,
                sdg['number'] as int,
                sdg['title'] as String,
                sdg['score'] as double,
                sdg['progress'] as double,
              ),
            ),
      ],
    );
  }

  /// Build all SDGs (only shown in detailed view)
  Widget _buildAllSDGs(BuildContext context) {
    final allSDGs = [
      {'number': 1, 'title': 'No Poverty', 'score': 6.5, 'progress': 0.65},
      {'number': 2, 'title': 'Zero Hunger', 'score': 7.2, 'progress': 0.72},
      {
        'number': 3,
        'title': 'Good Health and Well-being',
        'score': 9.2,
        'progress': 0.92
      },
      {
        'number': 4,
        'title': 'Quality Education',
        'score': 8.1,
        'progress': 0.81
      },
      {'number': 5, 'title': 'Gender Equality', 'score': 6.8, 'progress': 0.68},
      {
        'number': 6,
        'title': 'Clean Water and Sanitation',
        'score': 8.8,
        'progress': 0.88
      },
      {
        'number': 7,
        'title': 'Affordable and Clean Energy',
        'score': 7.9,
        'progress': 0.79
      },
      {
        'number': 8,
        'title': 'Decent Work and Economic Growth',
        'score': 7.3,
        'progress': 0.73
      },
      {'number': 13, 'title': 'Climate Action', 'score': 7.6, 'progress': 0.76},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'All SDG Contributions',
          style: AdaptiveTextStyles.titleMedium(context),
        ),
        AdaptiveSpacing.verticalMedium(),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: PlatformDetector.isMobile ? 1 : 2,
            childAspectRatio: PlatformDetector.isMobile ? 4 : 3.5,
            mainAxisSpacing: Spacing.sm,
            crossAxisSpacing: Spacing.sm,
          ),
          itemCount: allSDGs.length,
          itemBuilder: (context, index) {
            final sdg = allSDGs[index];
            return _buildSDGItem(
              context,
              sdg['number'] as int,
              sdg['title'] as String,
              sdg['score'] as double,
              sdg['progress'] as double,
            );
          },
        ),
      ],
    );
  }

  /// Build individual SDG item
  Widget _buildSDGItem(
    BuildContext context,
    int number,
    String title,
    double score,
    double progress,
  ) {
    return Container(
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
          // SDG icon with number
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: _getSDGColor(number),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Center(
              child: Text(
                number.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ),

          const SizedBox(width: Spacing.sm),

          // SDG details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      score.toStringAsFixed(1),
                      style: AdaptiveTextStyles.titleSmall(context).copyWith(
                        fontWeight: FontWeight.bold,
                        color: _getScoreColor(score),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor:
                      Theme.of(context).colorScheme.outline.withOpacity(0.2),
                  valueColor:
                      AlwaysStoppedAnimation<Color>(_getSDGColor(number)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Get SDG color based on goal number
  Color _getSDGColor(int sdgNumber) {
    switch (sdgNumber) {
      case 1:
        return const Color(0xFFE5243B);
      case 2:
        return const Color(0xFFDDA63A);
      case 3:
        return const Color(0xFF4C9F38);
      case 4:
        return const Color(0xFFC5192D);
      case 5:
        return const Color(0xFFFF3A21);
      case 6:
        return const Color(0xFF26BDE2);
      case 7:
        return const Color(0xFFFCC30B);
      case 8:
        return const Color(0xFFA21942);
      case 9:
        return const Color(0xFFFD6925);
      case 10:
        return const Color(0xFFDD1367);
      case 11:
        return const Color(0xFFFD9D24);
      case 12:
        return const Color(0xFFBF8B2E);
      case 13:
        return const Color(0xFF3F7E44);
      case 14:
        return const Color(0xFF0A97D9);
      case 15:
        return const Color(0xFF56C02B);
      case 16:
        return const Color(0xFF00689D);
      case 17:
        return const Color(0xFF19486A);
      default:
        return Colors.grey;
    }
  }

  /// Get score color based on performance
  Color _getScoreColor(double score) {
    if (score >= 8.0) return Colors.green;
    if (score >= 6.0) return Colors.orange;
    return Colors.red;
  }

  /// Handle card actions
  void _handleAction(String action) {
    switch (action) {
      case 'learn_more':
        // Navigate to SDG information
        break;
      case 'detailed_report':
        // Generate detailed SDG report
        break;
    }
  }
}
