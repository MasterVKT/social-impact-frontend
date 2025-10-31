import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/constants/spacing.dart';

/// Payment methods card showing user's saved payment methods
class PaymentMethodsCard extends ConsumerWidget {
  final bool showDetailed;
  
  const PaymentMethodsCard({
    super.key,
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
            _buildPaymentMethodsList(context),
            AdaptiveSpacing.verticalMedium(),
            _buildAddPaymentMethodButton(context),
            if (showDetailed) ...[
              AdaptiveSpacing.verticalLarge(),
              _buildPaymentMethodStats(context),
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
        Icon(
          Icons.payment,
          color: Theme.of(context).colorScheme.primary,
          size: 24,
        ),
        const SizedBox(width: Spacing.sm),
        Text(
          'Payment Methods',
          style: AdaptiveTextStyles.titleMedium(context),
        ),
        const Spacer(),
        if (showDetailed)
          PopupMenuButton<String>(
            onSelected: _handleAction,
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'manage',
                child: Text('Manage All'),
              ),
              const PopupMenuItem(
                value: 'security',
                child: Text('Security Settings'),
              ),
            ],
            child: const Icon(Icons.more_vert),
          ),
      ],
    );
  }
  
  /// Build payment methods list
  Widget _buildPaymentMethodsList(BuildContext context) {
    final paymentMethods = _getMockPaymentMethods();
    
    return Column(
      children: paymentMethods.map((method) => _buildPaymentMethodItem(context, method)).toList(),
    );
  }
  
  /// Build individual payment method item
  Widget _buildPaymentMethodItem(BuildContext context, Map<String, dynamic> method) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Spacing.sm),
      child: Container(
        padding: const EdgeInsets.all(Spacing.md),
        decoration: BoxDecoration(
          color: method['isDefault'] 
              ? Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3)
              : Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: method['isDefault']
                ? Theme.of(context).colorScheme.primary.withOpacity(0.3)
                : Theme.of(context).colorScheme.outline.withOpacity(0.2),
          ),
        ),
        child: Row(
          children: [
            // Payment method icon
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: _getPaymentMethodColor(method['type']).withOpacity(0.1),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Icon(
                _getPaymentMethodIcon(method['type']),
                color: _getPaymentMethodColor(method['type']),
                size: 20,
              ),
            ),
            
            const SizedBox(width: Spacing.md),
            
            // Payment method details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        method['name'],
                        style: AdaptiveTextStyles.titleSmall(context),
                      ),
                      if (method['isDefault']) ...[
                        const SizedBox(width: Spacing.sm),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            'DEFAULT',
                            style: AdaptiveTextStyles.bodySmall(context).copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 9,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    method['details'],
                    style: AdaptiveTextStyles.bodySmall(context).copyWith(
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                    ),
                  ),
                  if (method['expiryDate'] != null)
                    Text(
                      'Expires ${method['expiryDate']}',
                      style: AdaptiveTextStyles.bodySmall(context).copyWith(
                        color: _isExpiringSoon(method['expiryDate']) ? Colors.orange : 
                               Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                        fontSize: 10,
                      ),
                    ),
                ],
              ),
            ),
            
            // Status indicator
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: method['isActive'] ? Colors.green : Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
            
            const SizedBox(width: Spacing.sm),
            
            // More options
            PopupMenuButton<String>(
              onSelected: (value) => _handlePaymentMethodAction(value, method['id']),
              itemBuilder: (context) => [
                if (!method['isDefault'])
                  const PopupMenuItem(
                    value: 'set_default',
                    child: Text('Set as Default'),
                  ),
                const PopupMenuItem(
                  value: 'edit',
                  child: Text('Edit Details'),
                ),
                const PopupMenuItem(
                  value: 'remove',
                  child: Text('Remove', style: TextStyle(color: Colors.red)),
                ),
              ],
              child: const Icon(Icons.more_vert, size: 16),
            ),
          ],
        ),
      ),
    );
  }
  
  /// Build add payment method button
  Widget _buildAddPaymentMethodButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: () => _navigateToAddPaymentMethod(),
        icon: const Icon(Icons.add),
        label: const Text('Add Payment Method'),
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(Spacing.md),
        ),
      ),
    );
  }
  
  /// Build payment method statistics (only shown in detailed view)
  Widget _buildPaymentMethodStats(BuildContext context) {
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
          Text(
            'Payment Method Usage (This Month)',
            style: AdaptiveTextStyles.titleSmall(context),
          ),
          AdaptiveSpacing.verticalMedium(),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStatItem(context, 'Transactions', '24', Icons.receipt),
              _buildStatItem(context, 'Total Amount', '€18.5K', Icons.attach_money),
              _buildStatItem(context, 'Success Rate', '98%', Icons.check_circle),
            ],
          ),
        ],
      ),
    );
  }
  
  /// Build stat item
  Widget _buildStatItem(BuildContext context, String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Theme.of(context).colorScheme.primary, size: 20),
        AdaptiveSpacing.verticalSmall(),
        Text(
          value,
          style: AdaptiveTextStyles.titleSmall(context).copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: AdaptiveTextStyles.bodySmall(context),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
  
  /// Get mock payment methods data
  List<Map<String, dynamic>> _getMockPaymentMethods() {
    return [
      {
        'id': '1',
        'type': 'visa',
        'name': 'Visa •••• 4242',
        'details': 'Primary Credit Card',
        'isDefault': true,
        'isActive': true,
        'expiryDate': '12/25',
      },
      {
        'id': '2',
        'type': 'bank',
        'name': 'Deutsche Bank',
        'details': 'Checking Account •••• 8901',
        'isDefault': false,
        'isActive': true,
        'expiryDate': null,
      },
      {
        'id': '3',
        'type': 'paypal',
        'name': 'PayPal',
        'details': 'user@example.com',
        'isDefault': false,
        'isActive': true,
        'expiryDate': null,
      },
    ];
  }
  
  /// Get payment method icon
  IconData _getPaymentMethodIcon(String type) {
    switch (type) {
      case 'visa':
      case 'mastercard':
        return Icons.credit_card;
      case 'bank':
        return Icons.account_balance;
      case 'paypal':
        return Icons.account_balance_wallet;
      case 'apple_pay':
        return Icons.phone_iphone;
      case 'google_pay':
        return Icons.android;
      default:
        return Icons.payment;
    }
  }
  
  /// Get payment method color
  Color _getPaymentMethodColor(String type) {
    switch (type) {
      case 'visa':
        return Colors.blue;
      case 'mastercard':
        return Colors.red;
      case 'bank':
        return Colors.green;
      case 'paypal':
        return Colors.indigo;
      case 'apple_pay':
        return Colors.grey;
      case 'google_pay':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }
  
  /// Check if payment method is expiring soon
  bool _isExpiringSoon(String? expiryDate) {
    if (expiryDate == null) return false;
    // Simple check - in real app would parse date properly
    return expiryDate.startsWith('12/24') || expiryDate.startsWith('01/25');
  }
  
  /// Handle card header actions
  void _handleAction(String action) {
    switch (action) {
      case 'manage':
        _navigateToManagePaymentMethods();
        break;
      case 'security':
        _navigateToSecuritySettings();
        break;
    }
  }
  
  /// Handle payment method actions
  void _handlePaymentMethodAction(String action, String methodId) {
    switch (action) {
      case 'set_default':
        _setDefaultPaymentMethod(methodId);
        break;
      case 'edit':
        _editPaymentMethod(methodId);
        break;
      case 'remove':
        _removePaymentMethod(methodId);
        break;
    }
  }
  
  /// Navigate to add payment method
  void _navigateToAddPaymentMethod() {
    // Navigate to add payment method screen
  }
  
  /// Navigate to manage payment methods
  void _navigateToManagePaymentMethods() {
    // Navigate to payment methods management screen
  }
  
  /// Navigate to security settings
  void _navigateToSecuritySettings() {
    // Navigate to payment security settings
  }
  
  /// Set default payment method
  void _setDefaultPaymentMethod(String methodId) {
    // Implement setting default payment method
  }
  
  /// Edit payment method
  void _editPaymentMethod(String methodId) {
    // Navigate to edit payment method screen
  }
  
  /// Remove payment method
  void _removePaymentMethod(String methodId) {
    // Implement payment method removal with confirmation
  }
}