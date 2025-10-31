import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../core/utils/platform_detector.dart';

/// Adaptive snackbar/toast notification
class AdaptiveSnackbar {
  /// Shows an adaptive snackbar with platform-specific styling
  static void show({
    required BuildContext context,
    required String message,
    AdaptiveSnackbarType type = AdaptiveSnackbarType.info,
    Duration duration = const Duration(seconds: 3),
    String? actionLabel,
    VoidCallback? onAction,
    IconData? icon,
  }) {
    if (PlatformDetector.isIOS) {
      _showIOSSnackbar(
        context: context,
        message: message,
        type: type,
        duration: duration,
        actionLabel: actionLabel,
        onAction: onAction,
        icon: icon,
      );
    } else {
      _showMaterialSnackbar(
        context: context,
        message: message,
        type: type,
        duration: duration,
        actionLabel: actionLabel,
        onAction: onAction,
        icon: icon,
      );
    }
  }

  static void _showMaterialSnackbar({
    required BuildContext context,
    required String message,
    required AdaptiveSnackbarType type,
    required Duration duration,
    String? actionLabel,
    VoidCallback? onAction,
    IconData? icon,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final backgroundColor = _getBackgroundColor(type, colorScheme);
    final textColor = _getTextColor(type, colorScheme);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            if (icon != null) ...[
              Icon(icon, color: textColor, size: 20),
              const SizedBox(width: 12),
            ] else if (_getDefaultIcon(type) != null) ...[
              Icon(_getDefaultIcon(type), color: textColor, size: 20),
              const SizedBox(width: 12),
            ],
            Expanded(
              child: Text(
                message,
                style: TextStyle(color: textColor),
              ),
            ),
          ],
        ),
        backgroundColor: backgroundColor,
        duration: duration,
        action: actionLabel != null && onAction != null
            ? SnackBarAction(
                label: actionLabel,
                textColor: textColor,
                onPressed: onAction,
              )
            : null,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  static void _showIOSSnackbar({
    required BuildContext context,
    required String message,
    required AdaptiveSnackbarType type,
    required Duration duration,
    String? actionLabel,
    VoidCallback? onAction,
    IconData? icon,
  }) {
    final overlay = Overlay.of(context);
    late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: MediaQuery.of(context).padding.bottom + 16,
        left: 16,
        right: 16,
        child: _IOSSnackbarWidget(
          message: message,
          type: type,
          actionLabel: actionLabel,
          onAction: () {
            overlayEntry.remove();
            onAction?.call();
          },
          icon: icon ?? _getDefaultIcon(type),
          onDismiss: () => overlayEntry.remove(),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    // Auto dismiss
    Future.delayed(duration, () {
      if (overlayEntry.mounted) {
        overlayEntry.remove();
      }
    });
  }

  static Color _getBackgroundColor(
    AdaptiveSnackbarType type,
    ColorScheme colorScheme,
  ) {
    switch (type) {
      case AdaptiveSnackbarType.success:
        return Colors.green.shade600;
      case AdaptiveSnackbarType.error:
        return colorScheme.error;
      case AdaptiveSnackbarType.warning:
        return Colors.orange.shade600;
      case AdaptiveSnackbarType.info:
        return colorScheme.inverseSurface;
    }
  }

  static Color _getTextColor(
    AdaptiveSnackbarType type,
    ColorScheme colorScheme,
  ) {
    switch (type) {
      case AdaptiveSnackbarType.success:
      case AdaptiveSnackbarType.error:
      case AdaptiveSnackbarType.warning:
        return Colors.white;
      case AdaptiveSnackbarType.info:
        return colorScheme.onInverseSurface;
    }
  }

  static IconData? _getDefaultIcon(AdaptiveSnackbarType type) {
    if (PlatformDetector.isIOS) {
      switch (type) {
        case AdaptiveSnackbarType.success:
          return CupertinoIcons.checkmark_circle_fill;
        case AdaptiveSnackbarType.error:
          return CupertinoIcons.exclamationmark_circle_fill;
        case AdaptiveSnackbarType.warning:
          return CupertinoIcons.exclamationmark_triangle_fill;
        case AdaptiveSnackbarType.info:
          return CupertinoIcons.info_circle_fill;
      }
    } else {
      switch (type) {
        case AdaptiveSnackbarType.success:
          return Icons.check_circle;
        case AdaptiveSnackbarType.error:
          return Icons.error;
        case AdaptiveSnackbarType.warning:
          return Icons.warning;
        case AdaptiveSnackbarType.info:
          return Icons.info;
      }
    }
  }
}

/// iOS-style snackbar widget
class _IOSSnackbarWidget extends StatefulWidget {
  final String message;
  final AdaptiveSnackbarType type;
  final String? actionLabel;
  final VoidCallback? onAction;
  final IconData? icon;
  final VoidCallback onDismiss;

  const _IOSSnackbarWidget({
    required this.message,
    required this.type,
    this.actionLabel,
    this.onAction,
    this.icon,
    required this.onDismiss,
  });

  @override
  State<_IOSSnackbarWidget> createState() => _IOSSnackbarWidgetState();
}

class _IOSSnackbarWidgetState extends State<_IOSSnackbarWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color _getBackgroundColor() {
    switch (widget.type) {
      case AdaptiveSnackbarType.success:
        return CupertinoColors.systemGreen;
      case AdaptiveSnackbarType.error:
        return CupertinoColors.systemRed;
      case AdaptiveSnackbarType.warning:
        return CupertinoColors.systemOrange;
      case AdaptiveSnackbarType.info:
        return CupertinoColors.systemGrey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: _getBackgroundColor(),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                if (widget.icon != null) ...[
                  Icon(widget.icon, color: Colors.white, size: 20),
                  const SizedBox(width: 12),
                ],
                Expanded(
                  child: Text(
                    widget.message,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                if (widget.actionLabel != null && widget.onAction != null)
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: widget.onAction,
                    child: Text(
                      widget.actionLabel!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Snackbar type enumeration
enum AdaptiveSnackbarType {
  success,
  error,
  warning,
  info,
}

/// Toast-style notification (always at the top)
class AdaptiveToast {
  static void show({
    required BuildContext context,
    required String message,
    AdaptiveSnackbarType type = AdaptiveSnackbarType.info,
    Duration duration = const Duration(seconds: 2),
    IconData? icon,
  }) {
    final overlay = Overlay.of(context);
    late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).padding.top + 16,
        left: 16,
        right: 16,
        child: _ToastWidget(
          message: message,
          type: type,
          icon: icon,
          onDismiss: () => overlayEntry.remove(),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    Future.delayed(duration, () {
      if (overlayEntry.mounted) {
        overlayEntry.remove();
      }
    });
  }
}

class _ToastWidget extends StatefulWidget {
  final String message;
  final AdaptiveSnackbarType type;
  final IconData? icon;
  final VoidCallback onDismiss;

  const _ToastWidget({
    required this.message,
    required this.type,
    this.icon,
    required this.onDismiss,
  });

  @override
  State<_ToastWidget> createState() => _ToastWidgetState();
}

class _ToastWidgetState extends State<_ToastWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SlideTransition(
      position: _slideAnimation,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: isDark ? Colors.grey[850] : Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              if (widget.icon != null)
                Icon(
                  widget.icon,
                  color: _getIconColor(),
                  size: 20,
                ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  widget.message,
                  style: TextStyle(
                    color: isDark ? Colors.white : Colors.black87,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getIconColor() {
    switch (widget.type) {
      case AdaptiveSnackbarType.success:
        return Colors.green;
      case AdaptiveSnackbarType.error:
        return Colors.red;
      case AdaptiveSnackbarType.warning:
        return Colors.orange;
      case AdaptiveSnackbarType.info:
        return Colors.blue;
    }
  }
}
