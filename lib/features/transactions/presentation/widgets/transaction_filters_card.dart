import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/constants/spacing.dart';
import '../../../../core/utils/platform_detector.dart';

/// Transaction filters card for filtering and searching transactions
class TransactionFiltersCard extends ConsumerStatefulWidget {
  const TransactionFiltersCard({super.key});

  @override
  ConsumerState<TransactionFiltersCard> createState() => _TransactionFiltersCardState();
}

class _TransactionFiltersCardState extends ConsumerState<TransactionFiltersCard> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedPeriod = '30_days';
  String _selectedType = 'all';
  String _selectedStatus = 'all';
  DateTimeRange? _customDateRange;
  
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            AdaptiveSpacing.verticalMedium(),
            if (PlatformDetector.isMobile)
              _buildMobileFilters(context)
            else
              _buildDesktopFilters(context),
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
          Icons.filter_list,
          color: Theme.of(context).colorScheme.primary,
          size: 24,
        ),
        const SizedBox(width: Spacing.sm),
        Text(
          'Transaction Filters',
          style: AdaptiveTextStyles.titleMedium(context),
        ),
        const Spacer(),
        TextButton(
          onPressed: _clearAllFilters,
          child: const Text('Clear All'),
        ),
      ],
    );
  }
  
  /// Build mobile filters (stacked vertically)
  Widget _buildMobileFilters(BuildContext context) {
    return Column(
      children: [
        _buildSearchField(context),
        AdaptiveSpacing.verticalMedium(),
        _buildPeriodFilter(context),
        AdaptiveSpacing.verticalMedium(),
        _buildTypeAndStatusFilters(context),
      ],
    );
  }
  
  /// Build desktop filters (arranged horizontally)
  Widget _buildDesktopFilters(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: _buildSearchField(context)),
            const SizedBox(width: Spacing.md),
            Expanded(child: _buildPeriodFilter(context)),
          ],
        ),
        AdaptiveSpacing.verticalMedium(),
        _buildTypeAndStatusFilters(context),
      ],
    );
  }
  
  /// Build search field
  Widget _buildSearchField(BuildContext context) {
    return TextField(
      controller: _searchController,
      decoration: InputDecoration(
        labelText: 'Search transactions',
        hintText: 'Search by description, amount, or reference',
        prefixIcon: const Icon(Icons.search),
        suffixIcon: _searchController.text.isNotEmpty
            ? IconButton(
                onPressed: () {
                  _searchController.clear();
                  _applyFilters();
                },
                icon: const Icon(Icons.clear),
              )
            : null,
        border: const OutlineInputBorder(),
      ),
      onChanged: (_) => _applyFilters(),
    );
  }
  
  /// Build period filter
  Widget _buildPeriodFilter(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Time Period',
          style: AdaptiveTextStyles.titleSmall(context),
        ),
        AdaptiveSpacing.verticalSmall(),
        Row(
          children: [
            Expanded(
              child: DropdownButtonFormField<String>(
                value: _selectedPeriod,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
                items: const [
                  DropdownMenuItem(value: '7_days', child: Text('Last 7 days')),
                  DropdownMenuItem(value: '30_days', child: Text('Last 30 days')),
                  DropdownMenuItem(value: '90_days', child: Text('Last 3 months')),
                  DropdownMenuItem(value: '1_year', child: Text('Last year')),
                  DropdownMenuItem(value: 'custom', child: Text('Custom range')),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedPeriod = value!;
                  });
                  if (value == 'custom') {
                    _showDateRangePicker();
                  } else {
                    _customDateRange = null;
                  }
                  _applyFilters();
                },
              ),
            ),
            if (_selectedPeriod == 'custom' && _customDateRange != null) ...[
              const SizedBox(width: Spacing.sm),
              IconButton(
                onPressed: _showDateRangePicker,
                icon: const Icon(Icons.date_range),
                tooltip: 'Change date range',
              ),
            ],
          ],
        ),
        if (_customDateRange != null) ...[
          AdaptiveSpacing.verticalSmall(),
          Text(
            '${_formatDate(_customDateRange!.start)} - ${_formatDate(_customDateRange!.end)}',
            style: AdaptiveTextStyles.bodySmall(context).copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
            ),
          ),
        ],
      ],
    );
  }
  
  /// Build type and status filters
  Widget _buildTypeAndStatusFilters(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _buildTypeFilter(context)),
        const SizedBox(width: Spacing.md),
        Expanded(child: _buildStatusFilter(context)),
      ],
    );
  }
  
  /// Build transaction type filter
  Widget _buildTypeFilter(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Transaction Type',
          style: AdaptiveTextStyles.titleSmall(context),
        ),
        AdaptiveSpacing.verticalSmall(),
        DropdownButtonFormField<String>(
          value: _selectedType,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
          items: const [
            DropdownMenuItem(value: 'all', child: Text('All Types')),
            DropdownMenuItem(value: 'investment', child: Text('Investments')),
            DropdownMenuItem(value: 'dividend', child: Text('Dividends')),
            DropdownMenuItem(value: 'withdrawal', child: Text('Withdrawals')),
            DropdownMenuItem(value: 'deposit', child: Text('Deposits')),
            DropdownMenuItem(value: 'fee', child: Text('Fees')),
          ],
          onChanged: (value) {
            setState(() {
              _selectedType = value!;
            });
            _applyFilters();
          },
        ),
      ],
    );
  }
  
  /// Build transaction status filter
  Widget _buildStatusFilter(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Status',
          style: AdaptiveTextStyles.titleSmall(context),
        ),
        AdaptiveSpacing.verticalSmall(),
        DropdownButtonFormField<String>(
          value: _selectedStatus,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
          items: const [
            DropdownMenuItem(value: 'all', child: Text('All Statuses')),
            DropdownMenuItem(value: 'completed', child: Text('Completed')),
            DropdownMenuItem(value: 'pending', child: Text('Pending')),
            DropdownMenuItem(value: 'processing', child: Text('Processing')),
            DropdownMenuItem(value: 'failed', child: Text('Failed')),
          ],
          onChanged: (value) {
            setState(() {
              _selectedStatus = value!;
            });
            _applyFilters();
          },
        ),
      ],
    );
  }
  
  /// Show date range picker
  Future<void> _showDateRangePicker() async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      initialDateRange: _customDateRange ?? DateTimeRange(
        start: DateTime.now().subtract(const Duration(days: 30)),
        end: DateTime.now(),
      ),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    
    if (picked != null) {
      setState(() {
        _customDateRange = picked;
      });
      _applyFilters();
    }
  }
  
  /// Format date for display
  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
  
  /// Apply filters
  void _applyFilters() {
    // In a real app, this would update the transaction list provider
    // with the current filter criteria
    final filters = {
      'search': _searchController.text,
      'period': _selectedPeriod,
      'type': _selectedType,
      'status': _selectedStatus,
      'dateRange': _customDateRange,
    };
    
    // Notify listeners about filter changes
    debugPrint('Applying filters: $filters');
  }
  
  /// Clear all filters
  void _clearAllFilters() {
    setState(() {
      _searchController.clear();
      _selectedPeriod = '30_days';
      _selectedType = 'all';
      _selectedStatus = 'all';
      _customDateRange = null;
    });
    _applyFilters();
  }
}