import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/constants/spacing.dart';
import '../../domain/entities/user.dart';

/// User profile card for dashboard
class UserProfileCard extends StatelessWidget {
  final User user;
  
  const UserProfileCard({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileHeader(context),
            AdaptiveSpacing.verticalMedium(),
            _buildProfileInfo(context),
            AdaptiveSpacing.verticalMedium(),
            _buildActionButtons(context),
          ],
        ),
      ),
    );
  }
  
  /// Build profile header with avatar and welcome message
  Widget _buildProfileHeader(BuildContext context) {
    return Row(
      children: [
        _buildAvatar(context),
        const SizedBox(width: Spacing.md),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome back,',
                style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
                ),
              ),
              Text(
                user.fullName,
                style: AdaptiveTextStyles.titleLarge(context),
              ),
              Text(
                user.role.displayName,
                style: AdaptiveTextStyles.bodySmall(context).copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
  
  /// Build user avatar
  Widget _buildAvatar(BuildContext context) {
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).colorScheme.primaryContainer,
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.3),
          width: 2,
        ),
      ),
      child: user.photoURL != null
          ? ClipOval(
              child: Image.network(
                user.photoURL!,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => _buildInitials(context),
              ),
            )
          : _buildInitials(context),
    );
  }
  
  /// Build initials fallback
  Widget _buildInitials(BuildContext context) {
    return Center(
      child: Text(
        user.initials,
        style: AdaptiveTextStyles.headlineSmall(context).copyWith(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
  
  /// Build profile information
  Widget _buildProfileInfo(BuildContext context) {
    return Column(
      children: [
        _buildInfoRow(
          context,
          'Email',
          user.email,
          icon: Icons.email_outlined,
          isVerified: user.isEmailVerified,
        ),
        if (user.phoneNumber != null)
          _buildInfoRow(
            context,
            'Phone',
            user.phoneNumber!,
            icon: Icons.phone_outlined,
          ),
        _buildInfoRow(
          context,
          'KYC Status',
          user.kycStatus.displayName,
          icon: Icons.verified_user_outlined,
          statusColor: _getKYCStatusColor(context, user.kycStatus),
        ),
        _buildInfoRow(
          context,
          'Profile',
          '${(user.profileCompletionPercentage * 100).toInt()}% complete',
          icon: Icons.person_outline,
        ),
      ],
    );
  }
  
  /// Build information row
  Widget _buildInfoRow(
    BuildContext context,
    String label,
    String value, {
    IconData? icon,
    bool? isVerified,
    Color? statusColor,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Spacing.sm),
      child: Row(
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              size: 16,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
            ),
            const SizedBox(width: Spacing.sm),
          ],
          Expanded(
            child: Text(
              '$label:',
              style: AdaptiveTextStyles.bodySmall(context).copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
              ),
            ),
          ),
          Text(
            value,
            style: AdaptiveTextStyles.bodySmall(context).copyWith(
              color: statusColor ?? Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.w500,
            ),
          ),
          if (isVerified != null) ...[
            const SizedBox(width: Spacing.xs),
            Icon(
              isVerified ? Icons.verified : Icons.warning_outlined,
              size: 14,
              color: isVerified
                  ? Colors.green
                  : Theme.of(context).colorScheme.error,
            ),
          ],
        ],
      ),
    );
  }
  
  /// Build action buttons
  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () => _navigateToProfile(context),
            icon: const Icon(Icons.edit_outlined, size: 16),
            label: const Text('Edit Profile'),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: Spacing.sm),
            ),
          ),
        ),
        const SizedBox(width: Spacing.sm),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () => _navigateToSettings(context),
            icon: const Icon(Icons.settings_outlined, size: 16),
            label: const Text('Settings'),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: Spacing.sm),
            ),
          ),
        ),
      ],
    );
  }
  
  /// Get KYC status color
  Color _getKYCStatusColor(BuildContext context, KYCStatus status) {
    switch (status) {
      case KYCStatus.verified:
        return Colors.green;
      case KYCStatus.inReview:
        return Colors.orange;
      case KYCStatus.rejected:
      case KYCStatus.expired:
        return Theme.of(context).colorScheme.error;
      case KYCStatus.pending:
      default:
        return Theme.of(context).colorScheme.onSurface.withOpacity(0.6);
    }
  }
  
  /// Navigate to profile screen
  void _navigateToProfile(BuildContext context) {
    context.go('/profile');
  }
  
  /// Navigate to settings screen
  void _navigateToSettings(BuildContext context) {
    context.go('/settings');
  }
}