import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/platform_detector.dart';
import '../../../core/utils/responsive_utils.dart';
import '../../../core/themes/color_scheme.dart';
import 'adaptive_button_variant.dart';

/// AdaptiveButton provides platform-aware button styling with Material Design for Android/Web
/// and Cupertino styling for iOS, with responsive sizing and proper accessibility support.
class AdaptiveButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final ButtonType type;
  final ButtonSize size;
  final bool isLoading;
  final bool enabled;
  final Widget? icon;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final bool autofocus;
  final FocusNode? focusNode;
  final String? tooltip;
  final AdaptiveButtonVariant? variant;
  final Widget? child;

  const AdaptiveButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.type = ButtonType.primary,
    this.size = ButtonSize.medium,
    this.isLoading = false,
    this.enabled = true,
    this.icon,
    this.width,
    this.height,
    this.padding,
    this.autofocus = false,
    this.focusNode,
    this.tooltip,
    this.variant,
    this.child,
  }) : super(key: key);

  /// Named constructor for icon buttons
  const AdaptiveButton.icon({
    Key? key,
    required this.text,
    required this.icon,
    this.onPressed,
    this.type = ButtonType.primary,
    this.size = ButtonSize.medium,
    this.isLoading = false,
    this.enabled = true,
    this.width,
    this.height,
    this.padding,
    this.autofocus = false,
    this.focusNode,
    this.tooltip,
    this.variant,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Platform-specific button implementation
    if (PlatformDetector.isIOS) {
      return _buildIOSButton(context);
    } else if (PlatformDetector.isAndroid) {
      return _buildAndroidButton(context);
    } else {
      return _buildWebButton(context);
    }
  }

  Widget _buildIOSButton(BuildContext context) {
    final isDisabled = !enabled || onPressed == null;
    final buttonHeight = _getButtonHeight(context);
    final buttonColor = _getIOSButtonColor();

    Widget button = CupertinoButton(
      onPressed: isDisabled ? null : (isLoading ? null : onPressed),
      color: type == ButtonType.primary ? buttonColor : null,
      disabledColor: CupertinoColors.systemGrey4,
      padding: _getButtonPadding(context),
      child: SizedBox(
        height: buttonHeight,
        width: width,
        child: _buildButtonContent(context, true),
      ),
    );

    return _wrapWithTooltip(button);
  }

  Widget _buildAndroidButton(BuildContext context) {
    final isDisabled = !enabled || onPressed == null;
    final buttonHeight = _getButtonHeight(context);

    Widget button;
    switch (type) {
      case ButtonType.primary:
        button = ElevatedButton(
          onPressed: isDisabled ? null : (isLoading ? null : onPressed),
          focusNode: focusNode,
          autofocus: autofocus,
          style: ElevatedButton.styleFrom(
            minimumSize: Size(width ?? double.infinity, buttonHeight),
            padding: _getButtonPadding(context),
            elevation: 2,
            backgroundColor: AdaptiveColors.primary,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: _buildButtonContent(context, false),
        );
        break;
      case ButtonType.secondary:
        button = OutlinedButton(
          onPressed: isDisabled ? null : (isLoading ? null : onPressed),
          focusNode: focusNode,
          autofocus: autofocus,
          style: OutlinedButton.styleFrom(
            minimumSize: Size(width ?? double.infinity, buttonHeight),
            padding: _getButtonPadding(context),
            foregroundColor: AdaptiveColors.primary,
            side: const BorderSide(color: AdaptiveColors.primary),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: _buildButtonContent(context, false),
        );
        break;
      case ButtonType.text:
        button = TextButton(
          onPressed: isDisabled ? null : (isLoading ? null : onPressed),
          focusNode: focusNode,
          autofocus: autofocus,
          style: TextButton.styleFrom(
            minimumSize: Size(width ?? double.infinity, buttonHeight),
            padding: _getButtonPadding(context),
            foregroundColor: AdaptiveColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: _buildButtonContent(context, false),
        );
        break;
    }

    return _wrapWithTooltip(button);
  }

  Widget _buildWebButton(BuildContext context) {
    final isDisabled = !enabled || onPressed == null;
    final buttonHeight = _getButtonHeight(context);

    Widget button;
    switch (type) {
      case ButtonType.primary:
        button = ElevatedButton(
          onPressed: isDisabled ? null : (isLoading ? null : onPressed),
          focusNode: focusNode,
          autofocus: autofocus,
          style: ElevatedButton.styleFrom(
            minimumSize: Size(width ?? double.infinity, buttonHeight),
            padding: _getButtonPadding(context),
            elevation: 2,
            backgroundColor: AdaptiveColors.primary,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            // Web-specific: hover and focus states
          ).copyWith(
            overlayColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.hovered)) {
                  return Colors.white.withOpacity(0.1);
                }
                if (states.contains(WidgetState.focused)) {
                  return Colors.white.withOpacity(0.2);
                }
                return null;
              },
            ),
          ),
          child: _buildButtonContent(context, false),
        );
        break;
      case ButtonType.secondary:
        button = OutlinedButton(
          onPressed: isDisabled ? null : (isLoading ? null : onPressed),
          focusNode: focusNode,
          autofocus: autofocus,
          style: OutlinedButton.styleFrom(
            minimumSize: Size(width ?? double.infinity, buttonHeight),
            padding: _getButtonPadding(context),
            foregroundColor: AdaptiveColors.primary,
            side: const BorderSide(color: AdaptiveColors.primary),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ).copyWith(
            overlayColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.hovered)) {
                  return AdaptiveColors.primary.withOpacity(0.1);
                }
                return null;
              },
            ),
          ),
          child: _buildButtonContent(context, false),
        );
        break;
      case ButtonType.text:
        button = TextButton(
          onPressed: isDisabled ? null : (isLoading ? null : onPressed),
          focusNode: focusNode,
          autofocus: autofocus,
          style: TextButton.styleFrom(
            minimumSize: Size(width ?? double.infinity, buttonHeight),
            padding: _getButtonPadding(context),
            foregroundColor: AdaptiveColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ).copyWith(
            overlayColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.hovered)) {
                  return AdaptiveColors.primary.withOpacity(0.1);
                }
                return null;
              },
            ),
          ),
          child: _buildButtonContent(context, false),
        );
        break;
    }

    return _wrapWithTooltip(button);
  }

  Widget _buildButtonContent(BuildContext context, bool isIOS) {
    if (isLoading) {
      return _buildLoadingIndicator(isIOS);
    }

    if (child != null) {
      return child!;
    }

    if (icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon!,
          const SizedBox(width: 8),
          Text(text),
        ],
      );
    }

    return Text(text);
  }

  Widget _buildLoadingIndicator(bool isIOS) {
    final size = _getLoadingIndicatorSize();

    if (isIOS) {
      return SizedBox(
        width: size,
        height: size,
        child: const CupertinoActivityIndicator(color: Colors.white),
      );
    } else {
      return SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(
            type == ButtonType.primary ? Colors.white : AdaptiveColors.primary,
          ),
        ),
      );
    }
  }

  Widget _wrapWithTooltip(Widget button) {
    if (tooltip != null && PlatformDetector.isWeb) {
      return Tooltip(
        message: tooltip!,
        child: button,
      );
    }
    return button;
  }

  // Helper methods for responsive sizing
  double _getButtonHeight(BuildContext context) {
    if (height != null) return height!;

    switch (size) {
      case ButtonSize.small:
        return ResponsiveUtils.isMobileScreen(context) ? 36 : 40;
      case ButtonSize.medium:
        return ResponsiveUtils.getAdaptiveButtonHeight(context);
      case ButtonSize.large:
        return ResponsiveUtils.isMobileScreen(context) ? 56 : 60;
    }
  }

  EdgeInsets _getButtonPadding(BuildContext context) {
    if (padding != null) return padding!;

    final horizontalPadding = ResponsiveUtils.getAdaptivePadding(context);

    switch (size) {
      case ButtonSize.small:
        return EdgeInsets.symmetric(
            horizontal: horizontalPadding * 0.75, vertical: 8);
      case ButtonSize.medium:
        return EdgeInsets.symmetric(
            horizontal: horizontalPadding, vertical: 12);
      case ButtonSize.large:
        return EdgeInsets.symmetric(
            horizontal: horizontalPadding * 1.5, vertical: 16);
    }
  }

  double _getLoadingIndicatorSize() {
    switch (size) {
      case ButtonSize.small:
        return 16;
      case ButtonSize.medium:
        return 20;
      case ButtonSize.large:
        return 24;
    }
  }

  Color _getIOSButtonColor() {
    switch (type) {
      case ButtonType.primary:
        return CupertinoColors.activeBlue;
      case ButtonType.secondary:
      case ButtonType.text:
        return CupertinoColors.systemGrey;
    }
  }
}

/// Types of adaptive buttons
enum ButtonType {
  primary, // Filled button with primary color
  secondary, // Outlined button
  text, // Text-only button
}

/// Sizes for adaptive buttons
enum ButtonSize {
  small, // Compact button
  medium, // Standard button
  large, // Large button for important actions
}

/// Specialized adaptive button for floating action buttons
class AdaptiveFloatingActionButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final String? tooltip;
  final bool mini;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? elevation;

  const AdaptiveFloatingActionButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.tooltip,
    this.mini = false,
    this.backgroundColor,
    this.foregroundColor,
    this.elevation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (PlatformDetector.isIOS) {
      return CupertinoButton(
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        child: Container(
          width: mini ? 40 : 56,
          height: mini ? 40 : 56,
          decoration: BoxDecoration(
            color: backgroundColor ?? CupertinoColors.activeBlue,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Center(
            child: IconTheme(
              data: IconThemeData(
                color: foregroundColor ?? Colors.white,
                size: mini ? 20 : 24,
              ),
              child: child,
            ),
          ),
        ),
      );
    } else {
      return FloatingActionButton(
        onPressed: onPressed,
        mini: mini,
        tooltip: tooltip,
        backgroundColor: backgroundColor ?? AdaptiveColors.primary,
        foregroundColor: foregroundColor ?? Colors.white,
        elevation: elevation,
        child: child,
      );
    }
  }
}
