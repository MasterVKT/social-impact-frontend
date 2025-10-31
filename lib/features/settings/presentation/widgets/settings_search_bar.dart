import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/constants/spacing.dart';

/// Settings search bar for finding specific settings quickly
class SettingsSearchBar extends ConsumerStatefulWidget {
  final Function(String) onChanged;
  final String? hintText;
  
  const SettingsSearchBar({
    super.key,
    required this.onChanged,
    this.hintText,
  });

  @override
  ConsumerState<SettingsSearchBar> createState() => _SettingsSearchBarState();
}

class _SettingsSearchBarState extends ConsumerState<SettingsSearchBar> {
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
      height: 48,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: _isSearchActive
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.outline.withOpacity(0.3),
          width: _isSearchActive ? 2 : 1,
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Spacing.sm),
            child: Icon(
              Icons.search,
              color: _isSearchActive
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
              size: 20,
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
              style: AdaptiveTextStyles.bodyMedium(context),
              decoration: InputDecoration(
                hintText: widget.hintText ?? 'Search settings...',
                hintStyle: AdaptiveTextStyles.bodyMedium(context).copyWith(
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
          if (_controller.text.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(right: Spacing.xs),
              child: IconButton(
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
                padding: const EdgeInsets.all(4),
                constraints: const BoxConstraints(),
              ),
            ),
          if (_controller.text.isEmpty && _isSearchActive)
            Padding(
              padding: const EdgeInsets.only(right: Spacing.sm),
              child: _buildSearchSuggestions(context),
            ),
        ],
      ),
    );
  }
  
  /// Build search suggestions dropdown
  Widget _buildSearchSuggestions(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Icon(
        Icons.tune,
        color: Theme.of(context).colorScheme.primary,
        size: 20,
      ),
      tooltip: 'Quick Filters',
      onSelected: (value) {
        _controller.text = value;
        widget.onChanged(value);
        setState(() {});
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 'notification',
          child: _buildSuggestionItem(
            context,
            'notification',
            'Notifications',
            Icons.notifications,
          ),
        ),
        PopupMenuItem(
          value: 'security',
          child: _buildSuggestionItem(
            context,
            'security',
            'Security',
            Icons.security,
          ),
        ),
        PopupMenuItem(
          value: 'privacy',
          child: _buildSuggestionItem(
            context,
            'privacy',
            'Privacy',
            Icons.privacy_tip,
          ),
        ),
        PopupMenuItem(
          value: 'theme',
          child: _buildSuggestionItem(
            context,
            'theme',
            'Theme',
            Icons.palette,
          ),
        ),
        PopupMenuItem(
          value: 'accessibility',
          child: _buildSuggestionItem(
            context,
            'accessibility',
            'Accessibility',
            Icons.accessibility,
          ),
        ),
        const PopupMenuDivider(),
        PopupMenuItem(
          value: 'two-factor',
          child: _buildSuggestionItem(
            context,
            'two-factor',
            'Two-Factor Auth',
            Icons.verified_user,
          ),
        ),
        PopupMenuItem(
          value: 'biometric',
          child: _buildSuggestionItem(
            context,
            'biometric',
            'Biometric Auth',
            Icons.fingerprint,
          ),
        ),
        PopupMenuItem(
          value: 'language',
          child: _buildSuggestionItem(
            context,
            'language',
            'Language',
            Icons.language,
          ),
        ),
      ],
    );
  }
  
  /// Build suggestion item
  Widget _buildSuggestionItem(
    BuildContext context,
    String value,
    String title,
    IconData icon,
  ) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: Theme.of(context).colorScheme.primary,
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