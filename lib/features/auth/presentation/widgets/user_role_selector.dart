import 'package:flutter/material.dart';
import '../../domain/entities/user.dart';

/// User role selector widget for registration
/// Allows users to choose their role with descriptive information
class UserRoleSelector extends StatelessWidget {
  final UserRole selectedRole;
  final ValueChanged<UserRole> onRoleChanged;

  const UserRoleSelector({
    super.key,
    required this.selectedRole,
    required this.onRoleChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'I am joining as...',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        _buildRoleOption(
          context,
          role: UserRole.investor,
          title: 'Investor',
          description: 'I want to invest in social impact projects',
          icon: Icons.trending_up,
        ),
        const SizedBox(height: 12),
        _buildRoleOption(
          context,
          role: UserRole.organization,
          title: 'Organization',
          description: 'I represent a social enterprise or NGO seeking funding',
          icon: Icons.business,
        ),
      ],
    );
  }

  Widget _buildRoleOption(
    BuildContext context, {
    required UserRole role,
    required String title,
    required String description,
    required IconData icon,
  }) {
    final isSelected = selectedRole == role;
    
    return GestureDetector(
      onTap: () => onRoleChanged(role),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.outline.withOpacity(0.5),
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(12),
          color: isSelected
              ? Theme.of(context).colorScheme.primary.withOpacity(0.05)
              : null,
        ),
        child: Row(
          children: [
            Radio<UserRole>(
              value: role,
              groupValue: selectedRole,
              onChanged: (UserRole? value) {
                if (value != null) onRoleChanged(value);
              },
            ),
            const SizedBox(width: 12),
            Icon(
              icon,
              color: isSelected
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: isSelected
                          ? Theme.of(context).colorScheme.primary
                          : null,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}