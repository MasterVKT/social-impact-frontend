import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/widgets/adaptive/adaptive_loading_indicator.dart';
import '../../../../shared/constants/spacing.dart';
import '../../../auth/presentation/providers/providers.dart';

/// Profile header card showing user's basic information and profile image
class ProfileHeaderCard extends ConsumerWidget {
  final String? userId;
  final bool isCurrentUser;

  const ProfileHeaderCard({
    super.key,
    this.userId,
    required this.isCurrentUser,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);

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
          children: [
            _buildProfileImage(context, user),
            AdaptiveSpacing.verticalMedium(),
            _buildUserInfo(context, user),
            AdaptiveSpacing.verticalMedium(),
            _buildQuickStats(context, user),
            AdaptiveSpacing.verticalMedium(),
            _buildActionButtons(context),
          ],
        ),
      ),
    );
  }

  /// Build profile image with upload functionality
  Widget _buildProfileImage(BuildContext context, user) {
    return Stack(
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Theme.of(context).colorScheme.primary,
              width: 3,
            ),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.shadow.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 0,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: user.photoURL != null
                ? Image.network(
                    user.photoURL!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        _buildInitialsAvatar(context, user),
                  )
                : _buildInitialsAvatar(context, user),
          ),
        ),

        // Verification badge
        if (user.isEmailVerified)
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Theme.of(context).colorScheme.surface,
                  width: 2,
                ),
              ),
              child: const Icon(
                Icons.verified,
                color: Colors.white,
                size: 16,
              ),
            ),
          ),

        // Edit button for current user
        if (isCurrentUser)
          Positioned(
            bottom: 0,
            right: 8,
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Theme.of(context).colorScheme.surface,
                  width: 2,
                ),
              ),
              child: IconButton(
                onPressed: () => _changeProfileImage(context),
                icon: const Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: 16,
                ),
                padding: EdgeInsets.zero,
              ),
            ),
          ),
      ],
    );
  }

  /// Build user information
  Widget _buildUserInfo(BuildContext context, user) {
    final displayName = user.displayName ?? user.email;

    return Column(
      children: [
        Text(
          displayName,
          style: AdaptiveTextStyles.titleLarge(context).copyWith(
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                user.role.displayName,
                style: AdaptiveTextStyles.bodySmall(context).copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            if (user.isEmailVerified) ...[
              const SizedBox(width: Spacing.sm),
              const Icon(
                Icons.verified,
                size: 16,
                color: Colors.green,
              ),
              const SizedBox(width: 2),
              Text(
                'Verified',
                style: AdaptiveTextStyles.bodySmall(context).copyWith(
                  color: Colors.green,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ],
        ),
        const SizedBox(height: 4),
        Text(
          user.email,
          style: AdaptiveTextStyles.bodyMedium(context).copyWith(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  /// Build quick stats
  Widget _buildQuickStats(BuildContext context, user) {
    // Mock data - will be replaced with real data from portfolio/investment providers
    return Container(
      padding: const EdgeInsets.all(Spacing.md),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatItem(context, 'Investments', '0', Icons.trending_up),
          _buildStatDivider(context),
          _buildStatItem(
              context, 'Portfolio', '€0', Icons.account_balance_wallet),
          _buildStatDivider(context),
          _buildStatItem(context, 'Impact Score', '0', Icons.favorite),
        ],
      ),
    );
  }

  /// Build stat item
  Widget _buildStatItem(
      BuildContext context, String label, String value, IconData icon) {
    return Expanded(
      child: Column(
        children: [
          Icon(
            icon,
            color: Theme.of(context).colorScheme.primary,
            size: 20,
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: AdaptiveTextStyles.titleSmall(context).copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            label,
            style: AdaptiveTextStyles.bodySmall(context).copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  /// Build stat divider
  Widget _buildStatDivider(BuildContext context) {
    return Container(
      width: 1,
      height: 40,
      color: Theme.of(context).colorScheme.outline.withOpacity(0.3),
    );
  }

  /// Build action buttons
  Widget _buildActionButtons(BuildContext context) {
    if (isCurrentUser) {
      return Row(
        children: [
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () => _editProfile(context),
              icon: const Icon(Icons.edit, size: 18),
              label: const Text('Edit Profile'),
            ),
          ),
          const SizedBox(width: Spacing.sm),
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () => _shareProfile(context),
              icon: const Icon(Icons.share, size: 18),
              label: const Text('Share'),
            ),
          ),
        ],
      );
    } else {
      return Row(
        children: [
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () => _followUser(context),
              icon: const Icon(Icons.person_add, size: 18),
              label: const Text('Follow'),
            ),
          ),
          const SizedBox(width: Spacing.sm),
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () => _messageUser(context),
              icon: const Icon(Icons.message, size: 18),
              label: const Text('Message'),
            ),
          ),
        ],
      );
    }
  }

  /// Build initials avatar
  Widget _buildInitialsAvatar(BuildContext context, user) {
    final displayName = user.displayName ?? user.email;
    String initials = 'U';

    if (displayName.isNotEmpty) {
      final parts = displayName.split(' ');
      if (parts.length >= 2) {
        initials = '${parts[0][0]}${parts[1][0]}'.toUpperCase();
      } else {
        initials = displayName.substring(0, 1).toUpperCase();
      }
    }

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.secondary,
          ],
        ),
      ),
      child: Center(
        child: Text(
          initials,
          style: AdaptiveTextStyles.titleLarge(context).copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
        ),
      ),
    );
  }

  /// Change profile image
  void _changeProfileImage(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Take Photo'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text(
                          'Camera functionality would be implemented here')),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Choose from Gallery'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text(
                          'Gallery functionality would be implemented here')),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete),
              title: const Text('Remove Photo'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Profile photo removed')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  /// Edit profile
  void _editProfile(BuildContext context) {
    // Navigate to edit profile screen
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Edit profile functionality')),
    );
  }

  /// Share profile
  void _shareProfile(BuildContext context) {
    // Share profile functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profile shared')),
    );
  }

  /// Follow user
  void _followUser(BuildContext context) {
    // Follow user functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('User followed')),
    );
  }

  /// Message user
  void _messageUser(BuildContext context) {
    // Message user functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Message sent')),
    );
  }
}
