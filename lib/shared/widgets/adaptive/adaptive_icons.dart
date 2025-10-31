import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/platform_detector.dart';
import '../../../core/utils/responsive_utils.dart';
import '../../../core/themes/color_scheme.dart';

/// AdaptiveIcons provides platform-appropriate icon styles and sizing
/// with responsive scaling and platform-specific icon selections.
class AdaptiveIcons {
  // Icon size constants
  static double get small => _getSize(16);
  static double get medium => _getSize(24);
  static double get large => _getSize(32);
  static double get extraLarge => _getSize(48);

  // Platform-adjusted icon size
  static double _getSize(double baseSize) {
    double platformMultiplier = 1.0;
    if (PlatformDetector.isIOS) {
      platformMultiplier = 1.0; // iOS standard sizing
    } else if (PlatformDetector.isWeb) {
      platformMultiplier = 1.1; // Slightly larger for web
    }
    return baseSize * platformMultiplier;
  }

  // Responsive icon size
  static double responsiveSize(BuildContext context, double baseSize) {
    final scale = ResponsiveUtils.isMobileScreen(context)
        ? 1.0
        : ResponsiveUtils.isTabletScreen(context)
            ? 1.1
            : 1.2;
    return _getSize(baseSize) * scale;
  }

  // Platform-specific icons
  static IconData get back =>
      PlatformDetector.isIOS ? CupertinoIcons.back : Icons.arrow_back;

  static IconData get forward =>
      PlatformDetector.isIOS ? CupertinoIcons.forward : Icons.arrow_forward;

  static IconData get close =>
      PlatformDetector.isIOS ? CupertinoIcons.xmark : Icons.close;

  static IconData get add =>
      PlatformDetector.isIOS ? CupertinoIcons.add : Icons.add;

  static IconData get search =>
      PlatformDetector.isIOS ? CupertinoIcons.search : Icons.search;

  static IconData get settings =>
      PlatformDetector.isIOS ? CupertinoIcons.settings : Icons.settings;

  static IconData get person =>
      PlatformDetector.isIOS ? CupertinoIcons.person : Icons.person;

  static IconData get home =>
      PlatformDetector.isIOS ? CupertinoIcons.home : Icons.home;

  static IconData get menu =>
      PlatformDetector.isIOS ? CupertinoIcons.bars : Icons.menu;

  static IconData get favorite =>
      PlatformDetector.isIOS ? CupertinoIcons.heart : Icons.favorite;

  static IconData get favoriteFilled =>
      PlatformDetector.isIOS ? CupertinoIcons.heart_fill : Icons.favorite;

  static IconData get share =>
      PlatformDetector.isIOS ? CupertinoIcons.share : Icons.share;

  static IconData get edit =>
      PlatformDetector.isIOS ? CupertinoIcons.pencil : Icons.edit;

  static IconData get delete =>
      PlatformDetector.isIOS ? CupertinoIcons.delete : Icons.delete;

  static IconData get checkmark =>
      PlatformDetector.isIOS ? CupertinoIcons.checkmark : Icons.check;

  static IconData get error => PlatformDetector.isIOS
      ? CupertinoIcons.exclamationmark_triangle
      : Icons.error;

  static IconData get warning => PlatformDetector.isIOS
      ? CupertinoIcons.exclamationmark_triangle
      : Icons.warning;

  static IconData get info =>
      PlatformDetector.isIOS ? CupertinoIcons.info : Icons.info;

  static IconData get refresh =>
      PlatformDetector.isIOS ? CupertinoIcons.refresh : Icons.refresh;
}

/// AdaptiveIcon widget that provides platform-appropriate styling
class AdaptiveIcon extends StatelessWidget {
  final IconData icon;
  final double? size;
  final Color? color;
  final String? semanticLabel;
  final TextDirection? textDirection;

  const AdaptiveIcon(
    this.icon, {
    Key? key,
    this.size,
    this.color,
    this.semanticLabel,
    this.textDirection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: size ?? AdaptiveIcons.medium,
      color: color ?? _getDefaultColor(context),
      semanticLabel: semanticLabel,
      textDirection: textDirection,
    );
  }

  Color _getDefaultColor(BuildContext context) {
    if (PlatformDetector.isIOS) {
      return CupertinoColors.label.resolveFrom(context);
    } else {
      return Theme.of(context).brightness == Brightness.light
          ? AdaptiveColors.onSurface
          : AdaptiveColors.onSurfaceDark;
    }
  }
}

/// Specialized icon button with platform-appropriate styling
class AdaptiveIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final double? iconSize;
  final Color? color;
  final Color? splashColor;
  final Color? highlightColor;
  final double? splashRadius;
  final EdgeInsets? padding;
  final String? tooltip;
  final bool autofocus;
  final FocusNode? focusNode;

  const AdaptiveIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.iconSize,
    this.color,
    this.splashColor,
    this.highlightColor,
    this.splashRadius,
    this.padding,
    this.tooltip,
    this.autofocus = false,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (PlatformDetector.isIOS) {
      return CupertinoButton(
        onPressed: onPressed,
        padding: padding ?? EdgeInsets.zero,
        child: AdaptiveIcon(
          icon,
          size: iconSize ?? AdaptiveIcons.medium,
          color: color,
        ),
      );
    } else {
      return IconButton(
        onPressed: onPressed,
        icon: AdaptiveIcon(
          icon,
          size: iconSize ?? AdaptiveIcons.medium,
          color: color,
        ),
        splashColor: splashColor,
        highlightColor: highlightColor,
        splashRadius: splashRadius,
        padding: padding ?? const EdgeInsets.all(8),
        tooltip: tooltip,
        autofocus: autofocus,
        focusNode: focusNode,
      );
    }
  }
}

/// Status indicators with appropriate icons and colors
class StatusIcon extends StatelessWidget {
  final StatusType status;
  final double? size;
  final bool showBackground;
  final Color? backgroundColor;

  const StatusIcon({
    Key? key,
    required this.status,
    this.size,
    this.showBackground = false,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final iconData = _getStatusIcon();
    final iconColor = _getStatusColor();
    final effectiveSize = size ?? AdaptiveIcons.medium;

    Widget icon = AdaptiveIcon(
      iconData,
      size: effectiveSize,
      color: iconColor,
    );

    if (showBackground) {
      icon = Container(
        padding: EdgeInsets.all(effectiveSize * 0.25),
        decoration: BoxDecoration(
          color: backgroundColor ?? iconColor.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: icon,
      );
    }

    return icon;
  }

  IconData _getStatusIcon() {
    switch (status) {
      case StatusType.success:
        return AdaptiveIcons.checkmark;
      case StatusType.error:
        return AdaptiveIcons.error;
      case StatusType.warning:
        return AdaptiveIcons.warning;
      case StatusType.info:
        return AdaptiveIcons.info;
      case StatusType.pending:
        return PlatformDetector.isIOS ? CupertinoIcons.clock : Icons.schedule;
    }
  }

  Color _getStatusColor() {
    switch (status) {
      case StatusType.success:
        return AdaptiveColors.success;
      case StatusType.error:
        return AdaptiveColors.error;
      case StatusType.warning:
        return AdaptiveColors.warning;
      case StatusType.info:
        return AdaptiveColors.info;
      case StatusType.pending:
        return AdaptiveColors.neutral500;
    }
  }
}

/// Financial/Impact icons specific to the Social Finance platform
class SocialFinanceIcons {
  static IconData get project =>
      PlatformDetector.isIOS ? CupertinoIcons.briefcase : Icons.work;

  static IconData get contribution =>
      PlatformDetector.isIOS ? CupertinoIcons.money_dollar : Icons.attach_money;

  static IconData get audit =>
      PlatformDetector.isIOS ? CupertinoIcons.doc_checkmark : Icons.assessment;

  static IconData get impact =>
      PlatformDetector.isIOS ? CupertinoIcons.graph_circle : Icons.trending_up;

  static IconData get dashboard =>
      PlatformDetector.isIOS ? CupertinoIcons.square_grid_2x2 : Icons.dashboard;

  static IconData get report =>
      PlatformDetector.isIOS ? CupertinoIcons.doc_text : Icons.description;

  static IconData get analytics =>
      PlatformDetector.isIOS ? CupertinoIcons.chart_bar : Icons.analytics;

  static IconData get funding =>
      PlatformDetector.isIOS ? CupertinoIcons.creditcard : Icons.credit_card;

  static IconData get investor =>
      PlatformDetector.isIOS ? CupertinoIcons.person_2 : Icons.people;

  static IconData get organization =>
      PlatformDetector.isIOS ? CupertinoIcons.building_2_fill : Icons.business;
}

/// Animated icon that provides loading states
class AdaptiveLoadingIcon extends StatefulWidget {
  final double? size;
  final Color? color;
  final Duration duration;

  const AdaptiveLoadingIcon({
    Key? key,
    this.size,
    this.color,
    this.duration = const Duration(seconds: 1),
  }) : super(key: key);

  @override
  State<AdaptiveLoadingIcon> createState() => _AdaptiveLoadingIconState();
}

class _AdaptiveLoadingIconState extends State<AdaptiveLoadingIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (PlatformDetector.isIOS) {
      return SizedBox(
        width: widget.size ?? AdaptiveIcons.medium,
        height: widget.size ?? AdaptiveIcons.medium,
        child: CupertinoActivityIndicator(
          color: widget.color,
        ),
      );
    } else {
      return AnimatedBuilder(
        animation: _controller,
        child: AdaptiveIcon(
          Icons.refresh,
          size: widget.size ?? AdaptiveIcons.medium,
          color: widget.color,
        ),
        builder: (context, child) {
          return Transform.rotate(
            angle: _controller.value * 2.0 * 3.141592653589793,
            child: child,
          );
        },
      );
    }
  }
}

enum StatusType {
  success,
  error,
  warning,
  info,
  pending,
}
