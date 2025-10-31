import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/constants/spacing.dart';

/// Transaction list card showing user's transaction history
class TransactionListCard extends ConsumerStatefulWidget {
  final String title;
  final bool showAll;
  final int? maxItems;
  final bool showFilters;
  
  const TransactionListCard({
    super.key,
    required this.title,
    this.showAll = false,
    this.maxItems,
    this.showFilters = false,
  });

  @override
  ConsumerState<TransactionListCard> createState() => _TransactionListCardState();
}

class _TransactionListCardState extends ConsumerState<TransactionListCard> {
  String _selectedFilter = 'all';
  String _selectedSort = 'date';
  
  @override
  Widget build(BuildContext context) {
    return AdaptiveCard(
      child: Column(
        children: [
          _buildHeader(context),
          if (widget.showFilters) _buildFilters(context),
          _buildTransactionList(context),
        ],
      ),
    );
  }
  
  /// Build card header
  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Spacing.lg),
      child: Row(
        children: [
          Icon(
            Icons.list_alt,
            color: Theme.of(context).colorScheme.primary,
            size: 24,
          ),
          const SizedBox(width: Spacing.sm),
          Text(
            widget.title,
            style: AdaptiveTextStyles.titleMedium(context),
          ),
          const Spacer(),
          if (!widget.showAll)
            TextButton(
              onPressed: () => _navigateToAllTransactions(),
              child: const Text('View All'),
            ),
          if (widget.showAll)
            PopupMenuButton<String>(
              onSelected: _handleAction,
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'export',
                  child: ListTile(
                    leading: Icon(Icons.download),
                    title: Text('Export List'),
                  ),
                ),
                const PopupMenuItem(
                  value: 'refresh',
                  child: ListTile(
                    leading: Icon(Icons.refresh),
                    title: Text('Refresh'),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
  
  /// Build filter chips
  Widget _buildFilters(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: Spacing.lg),
      child: Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildFilterChip('all', 'All', Icons.list),
                  _buildFilterChip('investment', 'Investments', Icons.trending_up),
                  _buildFilterChip('dividend', 'Dividends', Icons.payments),
                  _buildFilterChip('withdrawal', 'Withdrawals', Icons.account_balance),
                  _buildFilterChip('pending', 'Pending', Icons.hourglass_empty),
                ],
              ),
            ),
          ),
          const SizedBox(width: Spacing.sm),
          PopupMenuButton<String>(
            initialValue: _selectedSort,
            onSelected: (value) {
              setState(() {
                _selectedSort = value;
              });
            },
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'date', child: Text('Sort by Date')),
              const PopupMenuItem(value: 'amount', child: Text('Sort by Amount')),
              const PopupMenuItem(value: 'type', child: Text('Sort by Type')),
              const PopupMenuItem(value: 'status', child: Text('Sort by Status')),
            ],
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: Spacing.sm, vertical: Spacing.xs),
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).colorScheme.outline),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.sort, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    _getSortLabel(_selectedSort),
                    style: AdaptiveTextStyles.bodySmall(context),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  /// Build filter chip
  Widget _buildFilterChip(String value, String label, IconData icon) {
    final isSelected = _selectedFilter == value;
    return Padding(
      padding: const EdgeInsets.only(right: Spacing.sm),
      child: FilterChip(
        selected: isSelected,
        onSelected: (selected) {
          setState(() {
            _selectedFilter = value;
          });
        },
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16),
            const SizedBox(width: 4),
            Text(label),
          ],
        ),
      ),
    );
  }
  
  /// Build transaction list
  Widget _buildTransactionList(BuildContext context) {
    final transactions = _getMockTransactions();
    final filteredTransactions = _filterTransactions(transactions);
    final displayTransactions = widget.showAll 
        ? filteredTransactions 
        : filteredTransactions.take(widget.maxItems ?? 5).toList();
    
    if (displayTransactions.isEmpty) {
      return _buildEmptyState(context);
    }
    
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: displayTransactions.length,
      separatorBuilder: (context, index) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final transaction = displayTransactions[index];
        return _buildTransactionItem(context, transaction);
      },
    );
  }
  
  /// Build individual transaction item
  Widget _buildTransactionItem(BuildContext context, Map<String, dynamic> transaction) {
    return InkWell(
      onTap: () => _navigateToTransactionDetails(transaction['id']),
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Row(
          children: [
            // Transaction icon
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: _getTransactionColor(transaction['type']).withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                _getTransactionIcon(transaction['type']),
                color: _getTransactionColor(transaction['type']),
                size: 24,
              ),
            ),
            
            const SizedBox(width: Spacing.md),
            
            // Transaction details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          transaction['description'],
                          style: AdaptiveTextStyles.titleSmall(context),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        _formatAmount(transaction['amount'], transaction['type']),
                        style: AdaptiveTextStyles.titleSmall(context).copyWith(
                          fontWeight: FontWeight.bold,
                          color: _getAmountColor(transaction['type']),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      _buildStatusChip(transaction['status']),
                      const SizedBox(width: Spacing.sm),
                      Text(
                        transaction['date'],
                        style: AdaptiveTextStyles.bodySmall(context).copyWith(
                          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                        ),
                      ),
                      if (transaction['reference'] != null) ...[
                        const SizedBox(width: Spacing.sm),
                        Text(
                          '• ${transaction['reference']}',
                          style: AdaptiveTextStyles.bodySmall(context).copyWith(
                            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
            
            // Action button
            IconButton(
              onPressed: () => _showTransactionMenu(context, transaction),
              icon: const Icon(Icons.more_vert),
              iconSize: 20,
            ),
          ],
        ),
      ),
    );
  }
  
  /// Build status chip
  Widget _buildStatusChip(String status) {
    Color color;
    switch (status) {
      case 'completed':
        color = Colors.green;
        break;
      case 'pending':
        color = Colors.orange;
        break;
      case 'processing':
        color = Colors.blue;
        break;
      case 'failed':
        color = Colors.red;
        break;
      default:
        color = Colors.grey;
    }
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.xs, vertical: 2),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        status.toUpperCase(),
        style: AdaptiveTextStyles.bodySmall(context).copyWith(
          color: color,
          fontWeight: FontWeight.w500,
          fontSize: 10,
        ),
      ),
    );
  }
  
  /// Build empty state
  Widget _buildEmptyState(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Spacing.xl),
      child: Column(
        children: [
          Icon(
            Icons.receipt_outlined,
            size: 64,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
          ),
          AdaptiveSpacing.verticalMedium(),
          Text(
            'No transactions found',
            style: AdaptiveTextStyles.titleMedium(context),
          ),
          const SizedBox(height: Spacing.sm),
          Text(
            'Your transactions will appear here once you start investing',
            style: AdaptiveTextStyles.bodyMedium(context).copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
  
  /// Get mock transaction data
  List<Map<String, dynamic>> _getMockTransactions() {
    return [
      {
        'id': 'tx1',
        'type': 'investment',
        'description': 'Investment in Clean Water Project',
        'amount': 5000.0,
        'status': 'completed',
        'date': '2 days ago',
        'reference': 'INV-001',
      },
      {
        'id': 'tx2',
        'type': 'dividend',
        'description': 'Dividend from Solar Farm Project',
        'amount': 250.0,
        'status': 'completed',
        'date': '1 week ago',
        'reference': 'DIV-002',
      },
      {
        'id': 'tx3',
        'type': 'withdrawal',
        'description': 'Withdrawal to Bank Account',
        'amount': 1200.0,
        'status': 'processing',
        'date': '3 days ago',
        'reference': 'WTH-003',
      },
      {
        'id': 'tx4',
        'type': 'investment',
        'description': 'Investment in Education Initiative',
        'amount': 3500.0,
        'status': 'completed',
        'date': '1 week ago',
        'reference': 'INV-004',
      },
      {
        'id': 'tx5',
        'type': 'deposit',
        'description': 'Bank Transfer Deposit',
        'amount': 10000.0,
        'status': 'completed',
        'date': '2 weeks ago',
        'reference': 'DEP-005',
      },
      {
        'id': 'tx6',
        'type': 'fee',
        'description': 'Platform Transaction Fee',
        'amount': 15.0,
        'status': 'completed',
        'date': '3 days ago',
        'reference': 'FEE-006',
      },
    ];
  }
  
  /// Filter transactions based on selected filter
  List<Map<String, dynamic>> _filterTransactions(List<Map<String, dynamic>> transactions) {
    if (_selectedFilter == 'all') return transactions;
    return transactions.where((tx) => tx['type'] == _selectedFilter).toList();
  }
  
  /// Get transaction icon
  IconData _getTransactionIcon(String type) {
    switch (type) {
      case 'investment': return Icons.trending_up;
      case 'dividend': return Icons.payments;
      case 'withdrawal': return Icons.account_balance;
      case 'deposit': return Icons.add_circle;
      case 'fee': return Icons.receipt;
      default: return Icons.circle;
    }
  }
  
  /// Get transaction color
  Color _getTransactionColor(String type) {
    switch (type) {
      case 'investment': return Colors.blue;
      case 'dividend': return Colors.green;
      case 'withdrawal': return Colors.orange;
      case 'deposit': return Colors.purple;
      case 'fee': return Colors.red;
      default: return Colors.grey;
    }
  }
  
  /// Get amount color (green for incoming, red for outgoing)
  Color _getAmountColor(String type) {
    switch (type) {
      case 'dividend':
      case 'deposit':
        return Colors.green;
      case 'investment':
      case 'withdrawal':
      case 'fee':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
  
  /// Format amount with sign
  String _formatAmount(double amount, String type) {
    final prefix = ['dividend', 'deposit'].contains(type) ? '+' : '-';
    return '$prefix€${amount.toStringAsFixed(2)}';
  }
  
  /// Get sort label
  String _getSortLabel(String sort) {
    switch (sort) {
      case 'date': return 'Date';
      case 'amount': return 'Amount';
      case 'type': return 'Type';
      case 'status': return 'Status';
      default: return 'Sort';
    }
  }
  
  /// Show transaction context menu
  void _showTransactionMenu(BuildContext context, Map<String, dynamic> transaction) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.visibility),
            title: const Text('View Details'),
            onTap: () {
              Navigator.pop(context);
              _navigateToTransactionDetails(transaction['id']);
            },
          ),
          ListTile(
            leading: const Icon(Icons.receipt),
            title: const Text('Download Receipt'),
            onTap: () {
              Navigator.pop(context);
              _downloadReceipt(transaction['id']);
            },
          ),
          if (transaction['status'] == 'pending')
            ListTile(
              leading: const Icon(Icons.cancel, color: Colors.red),
              title: const Text('Cancel Transaction', style: TextStyle(color: Colors.red)),
              onTap: () {
                Navigator.pop(context);
                _cancelTransaction(transaction['id']);
              },
            ),
        ],
      ),
    );
  }
  
  /// Handle header actions
  void _handleAction(String action) {
    switch (action) {
      case 'export':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Export feature coming soon')),
        );
        break;
      case 'refresh':
        // Refresh transactions
        break;
    }
  }
  
  /// Navigate to all transactions
  void _navigateToAllTransactions() {
    context.go('/transactions');
  }
  
  /// Navigate to transaction details
  void _navigateToTransactionDetails(String transactionId) {
    context.go('/transactions/$transactionId');
  }
  
  /// Download transaction receipt
  void _downloadReceipt(String transactionId) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Receipt download feature coming soon')),
    );
  }
  
  /// Cancel transaction
  void _cancelTransaction(String transactionId) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Transaction cancelled successfully')),
    );
  }
}