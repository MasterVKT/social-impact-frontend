import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/constants/spacing.dart';

/// Support quick actions widget providing easy access to common support functions
class SupportQuickActions extends ConsumerWidget {
  const SupportQuickActions({super.key});

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
            _buildActionGrid(context),
            AdaptiveSpacing.verticalLarge(),
            _buildContactInfo(context),
          ],
        ),
      ),
    );
  }
  
  /// Build header section
  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.support_agent,
          color: Theme.of(context).colorScheme.primary,
          size: 24,
        ),
        const SizedBox(width: Spacing.sm),
        Text(
          'Need Help?',
          style: AdaptiveTextStyles.titleMedium(context).copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
  
  /// Build action grid
  Widget _buildActionGrid(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildActionButton(
                context,
                'Create Ticket',
                'Submit a detailed support request',
                Icons.add_circle_outline,
                Colors.blue,
                () => _createTicket(context),
              ),
            ),
            const SizedBox(width: Spacing.md),
            Expanded(
              child: _buildActionButton(
                context,
                'Live Chat',
                'Chat with our support team',
                Icons.chat,
                Colors.green,
                () => _startLiveChat(context),
              ),
            ),
          ],
        ),
        const SizedBox(height: Spacing.md),
        Row(
          children: [
            Expanded(
              child: _buildActionButton(
                context,
                'My Tickets',
                'View your support tickets',
                Icons.confirmation_number,
                Colors.orange,
                () => _viewTickets(context),
              ),
            ),
            const SizedBox(width: Spacing.md),
            Expanded(
              child: _buildActionButton(
                context,
                'Call Support',
                'Speak with a support agent',
                Icons.phone,
                Colors.purple,
                () => _callSupport(context),
              ),
            ),
          ],
        ),
      ],
    );
  }
  
  /// Build action button
  Widget _buildActionButton(
    BuildContext context,
    String title,
    String description,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(Spacing.md),
        decoration: BoxDecoration(
          color: color.withOpacity(0.08),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: color.withOpacity(0.2),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(Spacing.sm),
              decoration: BoxDecoration(
                color: color.withOpacity(0.15),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: color,
                size: 20,
              ),
            ),
            AdaptiveSpacing.verticalMedium(),
            Text(
              title,
              style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: AdaptiveTextStyles.bodySmall(context).copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                height: 1.3,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
  
  /// Build contact information
  Widget _buildContactInfo(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Spacing.md),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.info_outline,
                color: Theme.of(context).colorScheme.primary,
                size: 16,
              ),
              const SizedBox(width: Spacing.sm),
              Text(
                'Support Hours',
                style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: Spacing.sm),
          _buildInfoRow(
            context,
            Icons.schedule,
            'Monday - Friday: 9:00 AM - 6:00 PM GMT',
          ),
          const SizedBox(height: Spacing.xs),
          _buildInfoRow(
            context,
            Icons.speed,
            'Average response time: 15 minutes',
          ),
          const SizedBox(height: Spacing.xs),
          _buildInfoRow(
            context,
            Icons.language,
            'Available in English, French, Spanish',
          ),
        ],
      ),
    );
  }
  
  /// Build information row
  Widget _buildInfoRow(BuildContext context, IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          size: 14,
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
        ),
        const SizedBox(width: Spacing.sm),
        Expanded(
          child: Text(
            text,
            style: AdaptiveTextStyles.bodySmall(context).copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
            ),
          ),
        ),
      ],
    );
  }
  
  /// Create support ticket
  void _createTicket(BuildContext context) {
    context.push('/support/ticket/create');
  }
  
  /// Start live chat
  void _startLiveChat(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Start Live Chat'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Connect with a support agent for immediate assistance.'),
            const SizedBox(height: Spacing.lg),
            Row(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: Spacing.sm),
                const Text('3 agents available'),
              ],
            ),
            const SizedBox(height: Spacing.sm),
            const Row(
              children: [
                Icon(Icons.access_time, size: 14),
                SizedBox(width: Spacing.sm),
                Text('Average wait time: 2 minutes'),
              ],
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Starting live chat session...')),
              );
            },
            child: const Text('Start Chat'),
          ),
        ],
      ),
    );
  }
  
  /// View support tickets
  void _viewTickets(BuildContext context) {
    context.push('/support/tickets');
  }
  
  /// Call support
  void _callSupport(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Call Support'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Call our support team for immediate assistance.'),
            const SizedBox(height: Spacing.lg),
            Container(
              padding: const EdgeInsets.all(Spacing.md),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.phone,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: Spacing.sm),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '+44 20 7123 4567',
                        style: AdaptiveTextStyles.titleMedium(context).copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Monday - Friday, 9 AM - 6 PM GMT',
                        style: AdaptiveTextStyles.bodySmall(context),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Opening phone dialer...')),
              );
            },
            child: const Text('Call Now'),
          ),
        ],
      ),
    );
  }
}