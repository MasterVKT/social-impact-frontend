import 'package:flutter/material.dart';
import '../../../core/utils/platform_detector.dart';
import '../../../core/utils/responsive_utils.dart';

/// ResponsiveLayout provides a widget that adapts its layout based on screen size
/// and platform, supporting mobile, tablet, desktop and watch layouts with platform-aware behavior.
class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;
  final Widget? watch; // Support for future smartwatch implementation
  final Widget? largeDesktop; // Support for large desktop screens (>1920px)
  final Widget?
      mobileBody; // For compatibility with older code using mobileBody
  final bool adaptToOrientation;
  final bool centerContent;
  final double? maxContentWidth;
  final bool debugShowSizeInfo; // Shows screen size info for debugging
  final bool enableWatchSupport; // Enable smartwatch detection

  const ResponsiveLayout({
    Key? key,
    required this.mobile,
    this.tablet,
    required this.desktop,
    this.watch,
    this.largeDesktop,
    this.mobileBody,
    this.adaptToOrientation = true,
    this.centerContent = false,
    this.maxContentWidth,
    this.debugShowSizeInfo = false,
    this.enableWatchSupport = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Check for watch size first if enabled
        if (enableWatchSupport && _isWatchSize(constraints)) {
          Widget child = watch ?? mobile;
          return debugShowSizeInfo
              ? _wrapWithDebugInfo(child, constraints)
              : child;
        }

        Widget child = _getLayoutForConstraints(context, constraints);

        // Apply content width constraints if specified
        if (maxContentWidth != null) {
          child = _constrainContentWidth(child, constraints);
        }

        // Center content if requested
        if (centerContent) {
          child = Center(child: child);
        }

        // Add debug info if requested
        if (debugShowSizeInfo) {
          child = _wrapWithDebugInfo(child, constraints);
        }

        return child;
      },
    );
  }

  Widget _getLayoutForConstraints(
      BuildContext context, BoxConstraints constraints) {
    // Handle platform-specific logic
    if (PlatformDetector.isMobile) {
      return _buildMobileLayout(context, constraints);
    } else if (PlatformDetector.isWeb) {
      return _buildWebLayout(context, constraints);
    } else {
      return _buildDesktopLayout(context, constraints);
    }
  }

  Widget _buildMobileLayout(BuildContext context, BoxConstraints constraints) {
    if (adaptToOrientation) {
      return OrientationBuilder(
        builder: (context, orientation) {
          // In landscape mode on mobile, use tablet layout if available and screen is wide enough
          if (orientation == Orientation.landscape &&
              constraints.maxWidth >= ResponsiveUtils.tabletBreakpoint) {
            return tablet ?? desktop;
          }
          return mobileBody ?? mobile;
        },
      );
    }
    return mobileBody ?? mobile;
  }

  Widget _buildWebLayout(BuildContext context, BoxConstraints constraints) {
    // Web responsive breakpoints with large desktop support
    if (constraints.maxWidth < ResponsiveUtils.mobileBreakpoint) {
      return mobile;
    } else if (constraints.maxWidth < ResponsiveUtils.desktopBreakpoint) {
      return tablet ?? mobile;
    } else if (constraints.maxWidth >= ResponsiveUtils.largeDesktopBreakpoint) {
      return largeDesktop ?? desktop;
    } else {
      return desktop;
    }
  }

  Widget _buildDesktopLayout(BuildContext context, BoxConstraints constraints) {
    // Desktop always uses the largest appropriate layout
    if (constraints.maxWidth < ResponsiveUtils.mobileBreakpoint) {
      return mobile;
    } else if (constraints.maxWidth < ResponsiveUtils.desktopBreakpoint) {
      return tablet ?? desktop;
    } else if (constraints.maxWidth >= ResponsiveUtils.largeDesktopBreakpoint) {
      return largeDesktop ?? desktop;
    } else {
      return desktop;
    }
  }

  Widget _constrainContentWidth(Widget child, BoxConstraints constraints) {
    final maxWidth = maxContentWidth ?? 1200.0;

    if (constraints.maxWidth > maxWidth) {
      return SizedBox(
        width: maxWidth,
        child: child,
      );
    }

    return child;
  }

  /// Check if the current constraints indicate a watch-sized screen
  bool _isWatchSize(BoxConstraints constraints) {
    // Typical smartwatch screen sizes are around 200-400px
    return constraints.maxWidth <= 400 && constraints.maxHeight <= 400;
  }

  /// Wrap widget with debug information showing screen size and platform
  Widget _wrapWithDebugInfo(Widget child, BoxConstraints constraints) {
    return Stack(
      children: [
        child,
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.7),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              '${constraints.maxWidth.toInt()}x${constraints.maxHeight.toInt()}\n'
              'Platform: ${PlatformDetector.currentPlatform.name}\n'
              'Layout: ${_getCurrentLayoutName(constraints)}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// Get the name of the current layout for debugging
  String _getCurrentLayoutName(BoxConstraints constraints) {
    if (enableWatchSupport && _isWatchSize(constraints)) {
      return 'Watch';
    } else if (constraints.maxWidth < ResponsiveUtils.mobileBreakpoint) {
      return 'Mobile';
    } else if (constraints.maxWidth < ResponsiveUtils.desktopBreakpoint) {
      return 'Tablet';
    } else if (constraints.maxWidth >= ResponsiveUtils.largeDesktopBreakpoint) {
      return 'Large Desktop';
    } else {
      return 'Desktop';
    }
  }
}

/// ResponsiveContainer provides a container that adapts its padding and margins
/// based on screen size and platform.
class ResponsiveContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final bool useAdaptivePadding;
  final bool useAdaptiveMargin;
  final Color? backgroundColor;
  final Decoration? decoration;
  final double? width;
  final double? height;
  final AlignmentGeometry? alignment;

  const ResponsiveContainer({
    Key? key,
    required this.child,
    this.padding,
    this.margin,
    this.useAdaptivePadding = true,
    this.useAdaptiveMargin = true,
    this.backgroundColor,
    this.decoration,
    this.width,
    this.height,
    this.alignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: alignment,
      padding: _getPadding(context),
      margin: _getMargin(context),
      decoration: decoration ??
          (backgroundColor != null
              ? BoxDecoration(color: backgroundColor)
              : null),
      child: child,
    );
  }

  EdgeInsets? _getPadding(BuildContext context) {
    if (padding != null) return padding;
    if (!useAdaptivePadding) return null;

    final adaptivePadding = ResponsiveUtils.getAdaptivePadding(context);
    return EdgeInsets.all(adaptivePadding);
  }

  EdgeInsets? _getMargin(BuildContext context) {
    if (margin != null) return margin;
    if (!useAdaptiveMargin) return null;

    final adaptiveMargin = ResponsiveUtils.getAdaptiveMargin(context);
    return EdgeInsets.all(adaptiveMargin);
  }
}

/// ResponsiveGrid provides a grid that adapts its column count based on screen size
class ResponsiveGrid extends StatelessWidget {
  final List<Widget> children;
  final double spacing;
  final double runSpacing;
  final int? mobileColumns;
  final int? tabletColumns;
  final int? desktopColumns;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final EdgeInsets? padding;

  const ResponsiveGrid({
    Key? key,
    required this.children,
    this.spacing = 16.0,
    this.runSpacing = 16.0,
    this.mobileColumns,
    this.tabletColumns,
    this.desktopColumns,
    this.shrinkWrap = false,
    this.physics,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final columns = _getColumnCount(context);

    return GridView.builder(
      shrinkWrap: shrinkWrap,
      physics: physics,
      padding: padding ?? EdgeInsets.all(context.adaptivePadding),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        crossAxisSpacing: spacing,
        mainAxisSpacing: runSpacing,
        childAspectRatio: 1.0, // Can be made configurable if needed
      ),
      itemCount: children.length,
      itemBuilder: (context, index) => children[index],
    );
  }

  int _getColumnCount(BuildContext context) {
    if (ResponsiveUtils.isMobileScreen(context)) {
      return mobileColumns ?? 1;
    } else if (ResponsiveUtils.isTabletScreen(context)) {
      return tabletColumns ?? 2;
    } else {
      return desktopColumns ?? 3;
    }
  }
}

/// ResponsiveSliverGrid provides a sliver version of ResponsiveGrid
class ResponsiveSliverGrid extends StatelessWidget {
  final List<Widget> children;
  final double spacing;
  final double runSpacing;
  final int? mobileColumns;
  final int? tabletColumns;
  final int? desktopColumns;
  final double childAspectRatio;

  const ResponsiveSliverGrid({
    Key? key,
    required this.children,
    this.spacing = 16.0,
    this.runSpacing = 16.0,
    this.mobileColumns,
    this.tabletColumns,
    this.desktopColumns,
    this.childAspectRatio = 1.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final columns = _getColumnCount(context);

    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) => children[index],
        childCount: children.length,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        crossAxisSpacing: spacing,
        mainAxisSpacing: runSpacing,
        childAspectRatio: childAspectRatio,
      ),
    );
  }

  int _getColumnCount(BuildContext context) {
    if (ResponsiveUtils.isMobileScreen(context)) {
      return mobileColumns ?? 1;
    } else if (ResponsiveUtils.isTabletScreen(context)) {
      return tabletColumns ?? 2;
    } else {
      return desktopColumns ?? 3;
    }
  }
}

/// ResponsiveWrap provides a wrap widget that adapts its spacing based on screen size
class ResponsiveWrap extends StatelessWidget {
  final List<Widget> children;
  final Axis direction;
  final WrapAlignment alignment;
  final WrapAlignment runAlignment;
  final WrapCrossAlignment crossAxisAlignment;
  final double? spacing;
  final double? runSpacing;
  final bool useAdaptiveSpacing;

  const ResponsiveWrap({
    Key? key,
    required this.children,
    this.direction = Axis.horizontal,
    this.alignment = WrapAlignment.start,
    this.runAlignment = WrapAlignment.start,
    this.crossAxisAlignment = WrapCrossAlignment.start,
    this.spacing,
    this.runSpacing,
    this.useAdaptiveSpacing = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: direction,
      alignment: alignment,
      runAlignment: runAlignment,
      crossAxisAlignment: crossAxisAlignment,
      spacing: _getSpacing(context),
      runSpacing: _getRunSpacing(context),
      children: children,
    );
  }

  double _getSpacing(BuildContext context) {
    if (spacing != null) return spacing!;
    if (!useAdaptiveSpacing) return 8.0;
    return ResponsiveUtils.getAdaptiveMargin(context);
  }

  double _getRunSpacing(BuildContext context) {
    if (runSpacing != null) return runSpacing!;
    if (!useAdaptiveSpacing) return 8.0;
    return ResponsiveUtils.getAdaptiveMargin(context);
  }
}
