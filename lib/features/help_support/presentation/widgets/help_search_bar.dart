import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/constants/spacing.dart';

/// Help search bar for finding articles, FAQs, and support content
class HelpSearchBar extends ConsumerStatefulWidget {
  final Function(String) onChanged;
  final String? hintText;
  
  const HelpSearchBar({
    super.key,
    required this.onChanged,
    this.hintText,
  });

  @override
  ConsumerState<HelpSearchBar> createState() => _HelpSearchBarState();
}

class _HelpSearchBarState extends ConsumerState<HelpSearchBar> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isSearchActive = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isSearchActive = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: _isSearchActive
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.outline.withOpacity(0.3),
          width: _isSearchActive ? 2 : 1,
        ),
        boxShadow: _isSearchActive
            ? [
                BoxShadow(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  blurRadius: 8,
                  spreadRadius: 0,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Spacing.md),
            child: Icon(
              Icons.search,
              color: _isSearchActive
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
              size: 24,
            ),
          ),
          Expanded(
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              onChanged: (value) {
                widget.onChanged(value);
                setState(() {});
              },
              style: AdaptiveTextStyles.bodyLarge(context),
              decoration: InputDecoration(
                hintText: widget.hintText ?? 'Search help articles, FAQs, and guides...',
                hintStyle: AdaptiveTextStyles.bodyLarge(context).copyWith(
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
          if (_controller.text.isNotEmpty)
            IconButton(
              onPressed: () {
                _controller.clear();
                widget.onChanged('');
                setState(() {});
              },
              icon: Icon(
                Icons.clear,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                size: 20,
              ),
            ),
          if (_controller.text.isEmpty && _isSearchActive)
            Padding(
              padding: const EdgeInsets.only(right: Spacing.sm),
              child: _buildQuickFilters(context),
            ),
        ],
      ),
    );
  }
  
  /// Build quick filters dropdown
  Widget _buildQuickFilters(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Icon(
          Icons.filter_list,
          color: Theme.of(context).colorScheme.primary,
          size: 16,
        ),
      ),
      tooltip: 'Quick Filters',
      onSelected: (value) {
        _controller.text = value;
        widget.onChanged(value);
        setState(() {});
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 'getting started',
          child: _buildFilterItem(
            context,
            'getting started',
            'Getting Started',
            Icons.play_arrow,
            Colors.green,
          ),
        ),
        PopupMenuItem(
          value: 'investment',
          child: _buildFilterItem(
            context,
            'investment',
            'Investments',
            Icons.account_balance_wallet,
            Colors.blue,
          ),
        ),
        PopupMenuItem(
          value: 'portfolio',
          child: _buildFilterItem(
            context,
            'portfolio',
            'Portfolio',
            Icons.pie_chart,
            Colors.orange,
          ),
        ),
        PopupMenuItem(
          value: 'reports',
          child: _buildFilterItem(
            context,
            'reports',
            'Reports',
            Icons.analytics,
            Colors.purple,
          ),
        ),
        const PopupMenuDivider(),
        PopupMenuItem(
          value: 'account settings',
          child: _buildFilterItem(
            context,
            'account settings',
            'Account Settings',
            Icons.settings,
            Colors.grey,
          ),
        ),
        PopupMenuItem(
          value: 'billing',
          child: _buildFilterItem(
            context,
            'billing',
            'Billing & Payments',
            Icons.payment,
            Colors.red,
          ),
        ),
        PopupMenuItem(
          value: 'security',
          child: _buildFilterItem(
            context,
            'security',
            'Security',
            Icons.security,
            Colors.amber,
          ),
        ),
      ],
    );
  }
  
  /// Build filter item
  Widget _buildFilterItem(
    BuildContext context,
    String value,
    String title,
    IconData icon,
    Color color,
  ) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: color,
        ),
        const SizedBox(width: Spacing.sm),
        Text(
          title,
          style: AdaptiveTextStyles.bodyMedium(context),
        ),
      ],
    );
  }
}