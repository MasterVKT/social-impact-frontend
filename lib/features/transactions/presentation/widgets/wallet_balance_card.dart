import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/constants/spacing.dart';

/// Wallet balance card showing user's available funds
class WalletBalanceCard extends ConsumerWidget {
  const WalletBalanceCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AdaptiveCard(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(Spacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              AdaptiveSpacing.verticalLarge(),
              _buildBalance(context),
              AdaptiveSpacing.verticalLarge(),
              _buildBalanceBreakdown(context),
              AdaptiveSpacing.verticalMedium(),
              _buildActionButtons(context),
            ],
          ),
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
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(
            Icons.account_balance_wallet,
            color: Colors.white,
            size: 24,
          ),
        ),
        const SizedBox(width: Spacing.md),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Wallet Balance',
              style: AdaptiveTextStyles.titleMedium(context).copyWith(
                color: Colors.white,
              ),
            ),
            Text(
              'Last updated: 5 minutes ago',
              style: AdaptiveTextStyles.bodySmall(context).copyWith(
                color: Colors.white.withOpacity(0.8),
              ),
            ),
          ],
        ),
        const Spacer(),
        IconButton(
          onPressed: () => _refreshBalance(),
          icon: const Icon(Icons.refresh, color: Colors.white),
          tooltip: 'Refresh Balance',
        ),
      ],
    );
  }
  
  /// Build main balance display
  Widget _buildBalance(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Available Balance',
          style: AdaptiveTextStyles.bodyLarge(context).copyWith(
            color: Colors.white.withOpacity(0.9),
          ),
        ),
        const SizedBox(height: Spacing.sm),
        Text(
          '€24,750.50',
          style: AdaptiveTextStyles.headlineLarge(context).copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: Spacing.xs),
        Row(
          children: [
            Icon(
              Icons.trending_up,
              size: 16,
              color: Colors.green.shade300,
            ),
            const SizedBox(width: 4),
            Text(
              '+€1,250.00 this month',
              style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                color: Colors.green.shade300,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
  
  /// Build balance breakdown
  Widget _buildBalanceBreakdown(BuildContext context) {
    final breakdownItems = [
      {'label': 'Available', 'amount': '€24,750.50', 'color': Colors.white},
      {'label': 'Pending', 'amount': '€2,100.00', 'color': Colors.orange.shade300},
      {'label': 'Reserved', 'amount': '€500.00', 'color': Colors.red.shade300},
    ];
    
    return Container(
      padding: const EdgeInsets.all(Spacing.md),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Balance Breakdown',
            style: AdaptiveTextStyles.titleSmall(context).copyWith(
              color: Colors.white,
            ),
          ),
          AdaptiveSpacing.verticalSmall(),
          
          ...breakdownItems.map((item) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: item['color'] as Color,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: Spacing.sm),
                    Text(
                      item['label'] as String,
                      style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                  ],
                ),
                Text(
                  item['amount'] as String,
                  style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                    color: item['color'] as Color,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          )),
          
          AdaptiveSpacing.verticalSmall(),
          const Divider(color: Colors.white24),
          AdaptiveSpacing.verticalSmall(),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Balance',
                style: AdaptiveTextStyles.titleSmall(context).copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '€27,350.50',
                style: AdaptiveTextStyles.titleSmall(context).copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  
  /// Build action buttons
  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () => _navigateToAddFunds(),
            icon: const Icon(Icons.add, size: 18),
            label: const Text('Add Funds'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Theme.of(context).colorScheme.primary,
              elevation: 0,
            ),
          ),
        ),
        const SizedBox(width: Spacing.sm),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () => _navigateToWithdraw(),
            icon: const Icon(Icons.account_balance, size: 18),
            label: const Text('Withdraw'),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              side: const BorderSide(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(width: Spacing.sm),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () => _navigateToTransfer(),
            icon: const Icon(Icons.swap_horiz, size: 18),
            label: const Text('Transfer'),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              side: const BorderSide(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
  
  /// Refresh balance
  void _refreshBalance() {
    // Implement balance refresh
  }
  
  /// Navigate to add funds
  void _navigateToAddFunds() {
    // Navigate to add funds screen
  }
  
  /// Navigate to withdraw
  void _navigateToWithdraw() {
    // Navigate to withdraw screen
  }
  
  /// Navigate to transfer
  void _navigateToTransfer() {
    // Navigate to transfer screen
  }
}