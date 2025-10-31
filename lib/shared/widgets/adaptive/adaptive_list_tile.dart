import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../core/utils/platform_detector.dart';

/// Adaptive list tile that displays platform-specific list items
class AdaptiveListTile extends StatelessWidget {
  final Widget? leading;
  final Widget title;
  final Widget? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final bool enabled;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? contentPadding;
  final bool selected;

  const AdaptiveListTile({
    Key? key,
    this.leading,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.onLongPress,
    this.enabled = true,
    this.backgroundColor,
    this.contentPadding,
    this.selected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (PlatformDetector.isIOS) {
      return _buildIOSListTile(context);
    } else {
      return _buildMaterialListTile(context);
    }
  }

  Widget _buildIOSListTile(BuildContext context) {
    return CupertinoListTile(
      leading: leading,
      title: title,
      subtitle: subtitle,
      trailing: trailing,
      onTap: enabled ? onTap : null,
      backgroundColor: backgroundColor,
      padding: contentPadding,
    );
  }

  Widget _buildMaterialListTile(BuildContext context) {
    return ListTile(
      leading: leading,
      title: title,
      subtitle: subtitle,
      trailing: trailing,
      onTap: enabled ? onTap : null,
      onLongPress: enabled ? onLongPress : null,
      enabled: enabled,
      tileColor: backgroundColor,
      contentPadding: contentPadding,
      selected: selected,
    );
  }
}

/// Adaptive dismissible list item
class AdaptiveDismissible extends StatelessWidget {
  @override
  final Key key;
  final Widget child;
  final DismissDirection direction;
  final void Function(DismissDirection)? onDismissed;
  final Future<bool?> Function(DismissDirection)? confirmDismiss;
  final Color? background;
  final Color? secondaryBackground;
  final Widget? dismissIcon;

  const AdaptiveDismissible({
    required this.key,
    required this.child,
    this.direction = DismissDirection.horizontal,
    this.onDismissed,
    this.confirmDismiss,
    this.background,
    this.secondaryBackground,
    this.dismissIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (PlatformDetector.isIOS) {
      // iOS uses slide actions
      return Dismissible(
        key: key,
        direction: direction,
        onDismissed: onDismissed,
        confirmDismiss: confirmDismiss,
        background: Container(
          color: background ?? CupertinoColors.destructiveRed,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 20),
          child: dismissIcon ?? const Icon(CupertinoIcons.delete, color: Colors.white),
        ),
        secondaryBackground: Container(
          color: secondaryBackground ?? CupertinoColors.destructiveRed,
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20),
          child: dismissIcon ?? const Icon(CupertinoIcons.delete, color: Colors.white),
        ),
        child: child,
      );
    } else {
      // Android uses swipe to dismiss
      return Dismissible(
        key: key,
        direction: direction,
        onDismissed: onDismissed,
        confirmDismiss: confirmDismiss,
        background: Container(
          color: background ?? Theme.of(context).colorScheme.error,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 20),
          child: dismissIcon ?? const Icon(Icons.delete, color: Colors.white),
        ),
        secondaryBackground: Container(
          color: secondaryBackground ?? Theme.of(context).colorScheme.error,
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20),
          child: dismissIcon ?? const Icon(Icons.delete, color: Colors.white),
        ),
        child: child,
      );
    }
  }
}

/// Adaptive expansion tile
class AdaptiveExpansionTile extends StatelessWidget {
  final Widget title;
  final Widget? subtitle;
  final Widget? leading;
  final List<Widget> children;
  final bool initiallyExpanded;
  final ValueChanged<bool>? onExpansionChanged;

  const AdaptiveExpansionTile({
    Key? key,
    required this.title,
    this.subtitle,
    this.leading,
    required this.children,
    this.initiallyExpanded = false,
    this.onExpansionChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (PlatformDetector.isIOS) {
      return _IOSExpansionTile(
        title: title,
        subtitle: subtitle,
        leading: leading,
        initiallyExpanded: initiallyExpanded,
        onExpansionChanged: onExpansionChanged,
        children: children,
      );
    } else {
      return ExpansionTile(
        title: title,
        subtitle: subtitle,
        leading: leading,
        initiallyExpanded: initiallyExpanded,
        onExpansionChanged: onExpansionChanged,
        children: children,
      );
    }
  }
}

class _IOSExpansionTile extends StatefulWidget {
  final Widget title;
  final Widget? subtitle;
  final Widget? leading;
  final List<Widget> children;
  final bool initiallyExpanded;
  final ValueChanged<bool>? onExpansionChanged;

  const _IOSExpansionTile({
    required this.title,
    this.subtitle,
    this.leading,
    required this.children,
    this.initiallyExpanded = false,
    this.onExpansionChanged,
  });

  @override
  State<_IOSExpansionTile> createState() => _IOSExpansionTileState();
}

class _IOSExpansionTileState extends State<_IOSExpansionTile> {
  late bool _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.initiallyExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CupertinoListTile(
          leading: widget.leading,
          title: widget.title,
          subtitle: widget.subtitle,
          trailing: AnimatedRotation(
            turns: _isExpanded ? 0.5 : 0,
            duration: const Duration(milliseconds: 200),
            child: const Icon(CupertinoIcons.chevron_down),
          ),
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
            widget.onExpansionChanged?.call(_isExpanded);
          },
        ),
        AnimatedCrossFade(
          firstChild: const SizedBox.shrink(),
          secondChild: Column(children: widget.children),
          crossFadeState: _isExpanded
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 200),
        ),
      ],
    );
  }
}

/// Adaptive section header for grouped lists
class AdaptiveSectionHeader extends StatelessWidget {
  final String title;
  final Widget? trailing;
  final EdgeInsetsGeometry? padding;

  const AdaptiveSectionHeader({
    Key? key,
    required this.title,
    this.trailing,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (PlatformDetector.isIOS) {
      return Container(
        padding: padding ??
            const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        color: CupertinoColors.systemGroupedBackground,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title.toUpperCase(),
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: CupertinoColors.secondaryLabel,
              ),
            ),
            if (trailing != null) trailing!,
          ],
        ),
      );
    } else {
      return Container(
        padding: padding ??
            const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
            if (trailing != null) trailing!,
          ],
        ),
      );
    }
  }
}

/// Adaptive empty state for lists
class AdaptiveEmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? message;
  final Widget? action;

  const AdaptiveEmptyState({
    Key? key,
    required this.icon,
    required this.title,
    this.message,
    this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 80,
              color: PlatformDetector.isIOS
                  ? CupertinoColors.systemGrey
                  : Theme.of(context).colorScheme.outline,
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: PlatformDetector.isIOS
                  ? const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.label,
                    )
                  : Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            if (message != null) ...[
              const SizedBox(height: 8),
              Text(
                message!,
                style: PlatformDetector.isIOS
                    ? const TextStyle(
                        fontSize: 14,
                        color: CupertinoColors.secondaryLabel,
                      )
                    : Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                textAlign: TextAlign.center,
              ),
            ],
            if (action != null) ...[
              const SizedBox(height: 24),
              action!,
            ],
          ],
        ),
      ),
    );
  }
}
