import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Accessibility wrapper that enhances widgets with accessibility features
class AccessibilityWrapper extends ConsumerWidget {
  final Widget child;
  final String? semanticsLabel;
  final String? semanticsHint;
  final bool focusable;
  final bool excludeSemantics;
  final VoidCallback? onTap;
  final String? tooltip;
  final bool announceOnFocus;
  final SemanticsRole? role;

  const AccessibilityWrapper({
    super.key,
    required this.child,
    this.semanticsLabel,
    this.semanticsHint,
    this.focusable = true,
    this.excludeSemantics = false,
    this.onTap,
    this.tooltip,
    this.announceOnFocus = false,
    this.role,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget wrappedChild = child;

    // Add tooltip if provided
    if (tooltip != null) {
      wrappedChild = Tooltip(
        message: tooltip!,
        child: wrappedChild,
      );
    }

    // Add focus support
    if (focusable) {
      wrappedChild = Focus(
        onFocusChange: (hasFocus) {
          if (hasFocus && announceOnFocus && semanticsLabel != null) {
            SemanticsService.announce(semanticsLabel!, TextDirection.ltr);
          }
        },
        child: wrappedChild,
      );
    }

    // Add semantics
    if (!excludeSemantics) {
      wrappedChild = Semantics(
        label: semanticsLabel,
        hint: semanticsHint,
        focusable: focusable,
        onTap: onTap,
        button: role == SemanticsRole.button,
        link: role == SemanticsRole.link,
        header: role == SemanticsRole.header,
        textField: role == SemanticsRole.textField,
        child: wrappedChild,
      );
    }

    return wrappedChild;
  }
}

/// Accessibility role definitions
enum SemanticsRole {
  button,
  link,
  header,
  textField,
  image,
  list,
  listItem,
}

/// Screen reader announcement utility
class ScreenReader {
  /// Announce a message to screen readers
  static void announce(String message,
      {TextDirection direction = TextDirection.ltr}) {
    SemanticsService.announce(message, direction);
  }

  /// Announce a live region update
  static void announceLive(String message,
      {Assertiveness assertiveness = Assertiveness.polite}) {
    SemanticsService.announce(
      message,
      TextDirection.ltr,
      assertiveness: assertiveness,
    );
  }
}

/// High contrast theme detector
class HighContrastDetector extends ConsumerWidget {
  final Widget Function(BuildContext context, bool isHighContrast) builder;

  const HighContrastDetector({
    super.key,
    required this.builder,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final bool isHighContrast = mediaQuery.highContrast;

    return builder(context, isHighContrast);
  }
}

/// Reduced motion detector
class ReducedMotionDetector extends ConsumerWidget {
  final Widget Function(BuildContext context, bool reduceMotion) builder;

  const ReducedMotionDetector({
    super.key,
    required this.builder,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final bool reduceMotion = mediaQuery.disableAnimations;

    return builder(context, reduceMotion);
  }
}

/// Accessibility-aware animated widget
class AccessibleAnimatedWidget extends ConsumerWidget {
  final Widget child;
  final Duration duration;
  final Curve curve;
  final AnimationController? controller;
  final Animation<double>? animation;

  const AccessibleAnimatedWidget({
    super.key,
    required this.child,
    required this.duration,
    this.curve = Curves.easeInOut,
    this.controller,
    this.animation,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ReducedMotionDetector(
      builder: (context, reduceMotion) {
        if (reduceMotion) {
          // Skip animations when reduce motion is enabled
          return child;
        }

        if (controller != null && animation != null) {
          return AnimatedBuilder(
            animation: animation!,
            builder: (context, child) => this.child,
          );
        }

        return AnimatedSwitcher(
          duration: duration,
          switchInCurve: curve,
          switchOutCurve: curve,
          child: child,
        );
      },
    );
  }
}

/// Accessibility utilities
class AccessibilityUtils {
  /// Check if large text is enabled
  static bool isLargeText(BuildContext context) {
    return MediaQuery.of(context).textScaleFactor > 1.3;
  }

  /// Check if high contrast is enabled
  static bool isHighContrast(BuildContext context) {
    return MediaQuery.of(context).highContrast;
  }

  /// Check if animations should be reduced
  static bool shouldReduceMotion(BuildContext context) {
    return MediaQuery.of(context).disableAnimations;
  }

  /// Check if device is using screen reader
  static bool isScreenReaderEnabled(BuildContext context) {
    return MediaQuery.of(context).accessibleNavigation;
  }

  /// Get appropriate touch target size
  static Size getTouchTargetSize(BuildContext context) {
    final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    // Minimum 44x44 logical pixels for touch targets
    return Size(44.0 * devicePixelRatio, 44.0 * devicePixelRatio);
  }

  /// Get semantic label for numbers
  static String getSemanticNumber(double number, {String? unit}) {
    final formattedNumber =
        number.toStringAsFixed(number.truncateToDouble() == number ? 0 : 2);
    return unit != null ? '$formattedNumber $unit' : formattedNumber;
  }

  /// Get semantic label for dates
  static String getSemanticDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) {
      return 'Today, ${_formatTime(date)}';
    } else if (difference.inDays == 1) {
      return 'Yesterday, ${_formatTime(date)}';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago, ${_formatTime(date)}';
    } else {
      return '${date.day}/${date.month}/${date.year}, ${_formatTime(date)}';
    }
  }

  /// Format time for screen readers
  static String _formatTime(DateTime date) {
    final hour =
        date.hour == 0 ? 12 : (date.hour > 12 ? date.hour - 12 : date.hour);
    final period = date.hour >= 12 ? 'PM' : 'AM';
    final minute = date.minute.toString().padLeft(2, '0');
    return '$hour:$minute $period';
  }

  /// Get semantic label for currency
  static String getSemanticCurrency(double amount, String currency) {
    final formattedAmount = amount.toStringAsFixed(2);
    switch (currency.toUpperCase()) {
      case 'USD':
        return '$formattedAmount US dollars';
      case 'EUR':
        return '$formattedAmount euros';
      case 'GBP':
        return '$formattedAmount British pounds';
      default:
        return '$formattedAmount $currency';
    }
  }

  /// Get semantic label for percentages
  static String getSemanticPercentage(double percentage) {
    final formattedPercentage = percentage.toStringAsFixed(1);
    return '$formattedPercentage percent';
  }

  /// Get semantic label for status
  static String getSemanticStatus(String status) {
    switch (status.toLowerCase()) {
      case 'active':
        return 'Status: Active';
      case 'inactive':
        return 'Status: Inactive';
      case 'pending':
        return 'Status: Pending';
      case 'completed':
        return 'Status: Completed';
      case 'error':
        return 'Status: Error';
      default:
        return 'Status: $status';
    }
  }
}

/// Accessibility-enhanced button
class AccessibleButton extends ConsumerWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final String semanticsLabel;
  final String? semanticsHint;
  final ButtonStyle? style;
  final bool elevated;

  const AccessibleButton({
    super.key,
    required this.child,
    required this.onPressed,
    required this.semanticsLabel,
    this.semanticsHint,
    this.style,
    this.elevated = true,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final button = elevated
        ? ElevatedButton(
            onPressed: onPressed,
            style: style,
            child: child,
          )
        : TextButton(
            onPressed: onPressed,
            style: style,
            child: child,
          );

    return AccessibilityWrapper(
      semanticsLabel: semanticsLabel,
      semanticsHint: semanticsHint,
      onTap: onPressed,
      role: SemanticsRole.button,
      child: button,
    );
  }
}

/// Accessibility-enhanced text field
class AccessibleTextField extends ConsumerWidget {
  final TextEditingController? controller;
  final String labelText;
  final String? hintText;
  final String? errorText;
  final String? semanticsHint;
  final bool obscureText;
  final TextInputType keyboardType;
  final ValueChanged<String>? onChanged;
  final InputDecoration? decoration;

  const AccessibleTextField({
    super.key,
    this.controller,
    required this.labelText,
    this.hintText,
    this.errorText,
    this.semanticsHint,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.decoration,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inputDecoration = decoration ??
        InputDecoration(
          labelText: labelText,
          hintText: hintText,
          errorText: errorText,
          border: const OutlineInputBorder(),
        );

    return AccessibilityWrapper(
      semanticsLabel: labelText,
      semanticsHint: semanticsHint ?? hintText ?? 'Text input field',
      role: SemanticsRole.textField,
      child: TextField(
        controller: controller,
        decoration: inputDecoration,
        obscureText: obscureText,
        keyboardType: keyboardType,
        onChanged: onChanged,
      ),
    );
  }
}

/// Accessibility-enhanced list item
class AccessibleListItem extends ConsumerWidget {
  final Widget child;
  final VoidCallback? onTap;
  final String semanticsLabel;
  final String? semanticsHint;
  final bool selected;

  const AccessibleListItem({
    super.key,
    required this.child,
    this.onTap,
    required this.semanticsLabel,
    this.semanticsHint,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AccessibilityWrapper(
      semanticsLabel: semanticsLabel,
      semanticsHint: semanticsHint,
      onTap: onTap,
      role: SemanticsRole.listItem,
      child: Semantics(
        selected: selected,
        child: ListTile(
          onTap: onTap,
          selected: selected,
          title: child,
        ),
      ),
    );
  }
}
