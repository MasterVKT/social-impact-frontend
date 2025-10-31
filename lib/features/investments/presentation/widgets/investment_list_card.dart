import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/constants/spacing.dart';
import '../providers/investment_providers.dart';
import '../../domain/entities/investment.dart';

/// Investment list card showing user's investments
class InvestmentListCard extends ConsumerStatefulWidget {
  final String title;
  final bool showAll;
  final int? maxItems;
  final bool showFilters;

  const InvestmentListCard({
    super.key,
    required this.title,
    this.showAll = false,
    this.maxItems,
    this.showFilters = false,
  });

  @override
  ConsumerState<InvestmentListCard> createState() => _InvestmentListCardState();
}

class _InvestmentListCardState extends ConsumerState<InvestmentListCard> {
  String _selectedFilter = 'all';
  String _selectedSort = 'date';

  @override
  Widget build(BuildContext context) {
    return AdaptiveCard(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHeader(context),
          if (widget.showFilters) _buildFilters(context),
          _buildInvestmentList(context),
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
            Icons.trending_up,
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
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                textStyle: const TextStyle(fontSize: 10),
                minimumSize: const Size(0, 0),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: () => _navigateToAllInvestments(),
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
                  _buildFilterChip('active', 'Active', Icons.trending_up),
                  _buildFilterChip(
                      'completed', 'Completed', Icons.check_circle),
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
              const PopupMenuItem(
                  value: 'amount', child: Text('Sort by Amount')),
              const PopupMenuItem(
                  value: 'returns', child: Text('Sort by Returns')),
              const PopupMenuItem(
                  value: 'status', child: Text('Sort by Status')),
            ],
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: Spacing.sm, vertical: Spacing.xs),
              decoration: BoxDecoration(
                border:
                    Border.all(color: Theme.of(context).colorScheme.outline),
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

  /// Build investment list
  Widget _buildInvestmentList(BuildContext context) {
    final portfolio = ref.watch(portfolioProvider);
    final investments = portfolio.investments;
    final filteredInvestments = _filterInvestments(investments);
    final displayInvestments = widget.showAll
        ? filteredInvestments
        : filteredInvestments.take(widget.maxItems ?? 5).toList();

    if (displayInvestments.isEmpty) {
      return _buildEmptyState(context);
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: displayInvestments.length,
      separatorBuilder: (context, index) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final investment = displayInvestments[index];
        return _buildInvestmentItem(context, investment);
      },
    );
  }

  /// Build individual investment item
  Widget _buildInvestmentItem(BuildContext context, Investment investment) {
    final returns = investment.currentValue - investment.amount;
    final isPositive = returns >= 0;

    return InkWell(
      onTap: () => _navigateToInvestmentDetails(investment.id),
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: Spacing.sm, vertical: 6),
        child: Row(
          children: [
            // Project image/icon
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: _getStatusColor(investment.status).withOpacity(0.1),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Icon(
                _getTypeIcon(investment.type),
                color: _getStatusColor(investment.status),
                size: 16,
              ),
            ),

            const SizedBox(width: Spacing.sm),

            // Investment details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Investment #${investment.id.length >= 6 ? investment.id.substring(0, 6) : investment.id}',
                    style: AdaptiveTextStyles.titleSmall(context).copyWith(
                      fontSize: 11,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 1),
                  Row(
                    children: [
                      Text(
                        investment.type
                            .toString()
                            .split('.')
                            .last
                            .toUpperCase(),
                        style: AdaptiveTextStyles.bodySmall(context).copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.6),
                          fontSize: 8,
                        ),
                      ),
                      const SizedBox(width: Spacing.xs),
                      _buildStatusChip(
                          investment.status.toString().split('.').last),
                    ],
                  ),
                ],
              ),
            ),

            // Investment amount and return
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '€${investment.amount.toStringAsFixed(0)}',
                  style: AdaptiveTextStyles.titleSmall(context).copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                  ),
                ),
                const SizedBox(height: 1),
                Text(
                  '${isPositive ? '+' : ''}€${returns.toStringAsFixed(0)}',
                  style: AdaptiveTextStyles.bodySmall(context).copyWith(
                    color: isPositive ? Colors.green : Colors.red,
                    fontWeight: FontWeight.w500,
                    fontSize: 8,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
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
      case 'active':
        color = Colors.green;
        break;
      case 'completed':
        color = Colors.blue;
        break;
      case 'pending':
        color = Colors.orange;
        break;
      default:
        color = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 0.5),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        status.toUpperCase(),
        style: AdaptiveTextStyles.bodySmall(context).copyWith(
          color: color,
          fontWeight: FontWeight.w500,
          fontSize: 6,
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
            Icons.inbox_outlined,
            size: 64,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
          ),
          AdaptiveSpacing.verticalMedium(),
          Text(
            'No investments found',
            style: AdaptiveTextStyles.titleMedium(context),
          ),
          const SizedBox(height: Spacing.sm),
          Text(
            'Start investing in impactful projects to see them here',
            style: AdaptiveTextStyles.bodyMedium(context).copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
            ),
            textAlign: TextAlign.center,
          ),
          AdaptiveSpacing.verticalLarge(),
          ElevatedButton.icon(
            onPressed: () => _navigateToBrowseProjects(),
            icon: const Icon(Icons.add),
            label: const Text('Browse Projects'),
          ),
        ],
      ),
    );
  }

  /// Filter investments based on selected filter
  List<Investment> _filterInvestments(List<Investment> investments) {
    if (_selectedFilter == 'all') return investments;

    return investments.where((inv) {
      final status = inv.status.toString().split('.').last;
      return status == _selectedFilter;
    }).toList();
  }

  /// Get status color
  Color _getStatusColor(InvestmentStatus status) {
    switch (status) {
      case InvestmentStatus.active:
        return Colors.green;
      case InvestmentStatus.completed:
        return Colors.blue;
      case InvestmentStatus.pending:
        return Colors.orange;
      case InvestmentStatus.defaulted:
        return Colors.red;
      case InvestmentStatus.cancelled:
        return Colors.grey;
    }
  }

  /// Get type icon
  IconData _getTypeIcon(InvestmentType type) {
    switch (type) {
      case InvestmentType.equity:
        return Icons.trending_up;
      case InvestmentType.debt:
        return Icons.account_balance;
      case InvestmentType.hybrid:
        return Icons.merge_type;
      case InvestmentType.donation:
        return Icons.favorite;
    }
  }

  /// Get sort label
  String _getSortLabel(String sort) {
    switch (sort) {
      case 'date':
        return 'Date';
      case 'amount':
        return 'Amount';
      case 'returns':
        return 'Returns';
      case 'status':
        return 'Status';
      default:
        return 'Sort';
    }
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
        // Refresh investments
        break;
    }
  }

  /// Navigate to all investments
  void _navigateToAllInvestments() {
    context.go('/investments');
  }

  /// Navigate to investment details
  void _navigateToInvestmentDetails(String investmentId) {
    context.go('/investments/$investmentId');
  }

  /// Navigate to browse projects
  void _navigateToBrowseProjects() {
    context.go('/browse');
  }
}
