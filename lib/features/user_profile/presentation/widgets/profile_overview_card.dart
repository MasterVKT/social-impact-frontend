import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/widgets/adaptive/adaptive_loading_indicator.dart';
import '../../../../shared/constants/spacing.dart';
import '../../presentation/providers/user_profile_providers.dart';

/// Profile overview card showing detailed user information
class ProfileOverviewCard extends ConsumerWidget {
  final String? userId;
  final bool showDetailed;
  
  const ProfileOverviewCard({
    super.key,
    this.userId,
    this.showDetailed = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(currentUserProfileProvider);

    return profileAsync.when(
      data: (user) {
        if (user == null) {
          return const AdaptiveCard(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(Spacing.lg),
                child: AdaptiveLoadingIndicator(),
              ),
            ),
          );
        }

        return AdaptiveCard(
          child: Padding(
            padding: const EdgeInsets.all(Spacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context, user.isVerified == true),
                AdaptiveSpacing.verticalLarge(),
                _buildPersonalInfo(context, user),
                AdaptiveSpacing.verticalLarge(),
                _buildProfessionalInfo(context, user),
                if (showDetailed) ...[
                  AdaptiveSpacing.verticalLarge(),
                  _buildInterestsAndSkills(context, user),
                  AdaptiveSpacing.verticalLarge(),
                  _buildContactInfo(context, user),
                ],
              ],
            ),
          ),
        );
      },
      loading: () => const AdaptiveCard(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(Spacing.lg),
            child: AdaptiveLoadingIndicator(),
          ),
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
  Widget _buildHeader(BuildContext context, bool isVerified) {
    return Row(
      children: [
        Icon(
          Icons.person_outline,
          color: Theme.of(context).colorScheme.primary,
          size: 24,
        ),
        const SizedBox(width: Spacing.sm),
        Text(
          'Profile Overview',
          style: AdaptiveTextStyles.titleMedium(context),
        ),
        const Spacer(),
        if (isVerified)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'VERIFIED',
              style: AdaptiveTextStyles.bodySmall(context).copyWith(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
            ),
          ),
      ],
    );
  }
  
  /// Build personal information section
  Widget _buildPersonalInfo(context, user) {
    final fullName = (user.firstName + ' ' + user.lastName).trim();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Personal Information',
          style: AdaptiveTextStyles.titleSmall(context),
        ),
        AdaptiveSpacing.verticalMedium(),

        _buildInfoGrid(context, [
          _buildInfoItem(context, 'Full Name', fullName.isNotEmpty ? fullName : 'Not provided', Icons.person),
          _buildInfoItem(context, 'Email', user.email, Icons.email),
          _buildInfoItem(context, 'Phone', user.phoneNumber ?? 'Not provided', Icons.phone),
          _buildInfoItem(context, 'Location', user.location ?? 'Not provided', Icons.location_on),
        ]),
      ],
    );
  }
  
  /// Build professional information section
  Widget _buildProfessionalInfo(BuildContext context, user) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Professional Information',
          style: AdaptiveTextStyles.titleSmall(context),
        ),
        AdaptiveSpacing.verticalMedium(),

        _buildInfoGrid(context, [
          _buildInfoItem(context, 'Role', user.role.displayName, Icons.work),
          _buildInfoItem(context, 'Status', user.status.displayName, Icons.verified_user),
          _buildInfoItem(context, 'KYC Status', (user.isVerified == true) ? 'Verified' : 'Pending', Icons.assignment_turned_in),
          _buildInfoItem(context, 'Member Since', _formatDate(user.createdAt), Icons.calendar_today),
        ]),
      ],
    );
  }

  String _formatDate(DateTime? date) {
    if (date == null) return 'Not available';
    final now = DateTime.now();
    final difference = now.difference(date);
    if (difference.inDays < 30) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays < 365) {
      return '${(difference.inDays / 30).floor()} months ago';
    } else {
      return '${(difference.inDays / 365).floor()} years ago';
    }
  }
  
  /// Build interests and skills section (detailed view only)
  Widget _buildInterestsAndSkills(BuildContext context, user) {
    final interests = user.interests.isNotEmpty ? user.interests : [
      'Renewable Energy', 'Education', 'Healthcare', 'Sustainable Agriculture', 'Clean Water', 'Climate Change'
    ];
    final skills = user.skills.isNotEmpty ? user.skills : [
      'Investment Analysis', 'ESG Evaluation', 'Project Management', 'Risk Assessment', 'Financial Modeling', 'Impact Measurement'
    ];
    final languages = user.languages.isNotEmpty ? user.languages : ['English', 'French', 'Spanish'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Interests & Skills',
          style: AdaptiveTextStyles.titleSmall(context),
        ),
        AdaptiveSpacing.verticalMedium(),
        _buildChipSection(context, 'Interests', interests, Colors.blue),
        AdaptiveSpacing.verticalMedium(),
        _buildChipSection(context, 'Skills', skills, Colors.green),
        AdaptiveSpacing.verticalMedium(),
        _buildChipSection(context, 'Languages', languages, Colors.orange),
      ],
    );
  }
  
  /// Build contact information section (detailed view only)
  Widget _buildContactInfo(BuildContext context, user) {
    final social = user.socialLinks;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact & Social',
          style: AdaptiveTextStyles.titleSmall(context),
        ),
        AdaptiveSpacing.verticalMedium(),
        Row(
          children: [
            Expanded(
              child: _buildSocialLink(context, 'LinkedIn', Icons.business, (social['linkedin'] ?? 'not-set').toString()),
            ),
            const SizedBox(width: Spacing.sm),
            Expanded(
              child: _buildSocialLink(context, 'Twitter', Icons.alternate_email, (social['twitter'] ?? 'not-set').toString()),
            ),
          ],
        ),
        const SizedBox(height: Spacing.sm),
        Row(
          children: [
            Expanded(
              child: _buildSocialLink(context, 'Website', Icons.web, (social['website'] ?? user.website ?? 'not-set').toString()),
            ),
            const SizedBox(width: Spacing.sm),
            Expanded(
              child: _buildSocialLink(context, 'GitHub', Icons.code, (social['github'] ?? 'not-set').toString()),
            ),
          ],
        ),
      ],
    );
  }

  /// Build info grid
  Widget _buildInfoGrid(BuildContext context, List<Widget> items) {
    return Column(
      children: [
        for (int i = 0; i < items.length; i += 2)
          Padding(
            padding: EdgeInsets.only(
              bottom: i + 2 < items.length ? Spacing.sm : 0,
            ),
            child: Row(
              children: [
                Expanded(child: items[i]),
                if (i + 1 < items.length) ...[
                  const SizedBox(width: Spacing.sm),
                  Expanded(child: items[i + 1]),
                ] else
                  const Expanded(child: SizedBox()),
              ],
            ),
          ),
      ],
    );
  }
  
  /// Build info item
  Widget _buildInfoItem(BuildContext context, String label, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(Spacing.md),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 16,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: Spacing.sm),
              Text(
                label,
                style: AdaptiveTextStyles.bodySmall(context).copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: AdaptiveTextStyles.bodyMedium(context),
          ),
        ],
      ),
    );
  }
  
  /// Build chip section
  Widget _buildChipSection(
    BuildContext context,
    String title,
    List<String> items,
    Color color,
  ) {
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
        Wrap(
          spacing: Spacing.sm,
          runSpacing: Spacing.sm,
          children: items.map((item) {
            return Container(
              padding: const EdgeInsets.symmetric(
                horizontal: Spacing.sm,
                vertical: Spacing.xs,
              ),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: color.withOpacity(0.3)),
              ),
              child: Text(
                item,
                style: AdaptiveTextStyles.bodySmall(context).copyWith(
                  color: color,
                  fontWeight: FontWeight.w600,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
  
  /// Build social link
  Widget _buildSocialLink(BuildContext context, String platform, IconData icon, String handle) {
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
          Icon(
            icon,
            size: 16,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(width: Spacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  platform,
                  style: AdaptiveTextStyles.bodySmall(context).copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  handle,
                  style: AdaptiveTextStyles.bodySmall(context).copyWith(
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.open_in_new, size: 16),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }
}