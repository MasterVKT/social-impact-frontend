import 'package:flutter/material.dart';
import '../../../core/utils/responsive_utils.dart';
import '../responsive/responsive_layout.dart';

/// AdaptiveGrid provides responsive grid layouts that adapt to different screen sizes
/// with platform-appropriate spacing and column counts for optimal content display.
class AdaptiveGrid extends StatelessWidget {
  final List<Widget> children;
  final double? spacing;
  final double? runSpacing;
  final int? mobileColumns;
  final int? tabletColumns;
  final int? desktopColumns;
  final int? largeDesktopColumns;
  final double? childAspectRatio;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final EdgeInsets? padding;
  final Axis scrollDirection;
  final bool reverse;
  final ScrollController? controller;
  final bool primary;
  final GridType gridType;
  final double? maxCrossAxisExtent;
  final double? mainAxisSpacing;
  final double? crossAxisSpacing;

  const AdaptiveGrid({
    Key? key,
    required this.children,
    this.spacing,
    this.runSpacing,
    this.mobileColumns,
    this.tabletColumns,
    this.desktopColumns,
    this.largeDesktopColumns,
    this.childAspectRatio = 1.0,
    this.shrinkWrap = false,
    this.physics,
    this.padding,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.controller,
    this.primary = false,
    this.gridType = GridType.fixedCount,
    this.maxCrossAxisExtent,
    this.mainAxisSpacing,
    this.crossAxisSpacing,
  }) : super(key: key);

  /// Named constructor for project grids
  const AdaptiveGrid.projects({
    Key? key,
    required this.children,
    this.shrinkWrap = false,
    this.physics,
    this.padding,
    this.controller,
  }) : spacing = null,
       runSpacing = null,
       mobileColumns = 1,
       tabletColumns = 2,
       desktopColumns = 3,
       largeDesktopColumns = 4,
       childAspectRatio = 0.75,
       scrollDirection = Axis.vertical,
       reverse = false,
       primary = false,
       gridType = GridType.fixedCount,
       maxCrossAxisExtent = null,
       mainAxisSpacing = null,
       crossAxisSpacing = null,
       super(key: key);

  /// Named constructor for dashboard widgets
  const AdaptiveGrid.dashboard({
    Key? key,
    required this.children,
    this.shrinkWrap = true,
    this.physics,
    this.padding,
  }) : spacing = null,
       runSpacing = null,
       mobileColumns = 2,
       tabletColumns = 3,
       desktopColumns = 4,
       largeDesktopColumns = 6,
       childAspectRatio = 1.2,
       scrollDirection = Axis.vertical,
       reverse = false,
       controller = null,
       primary = false,
       gridType = GridType.fixedCount,
       maxCrossAxisExtent = null,
       mainAxisSpacing = null,
       crossAxisSpacing = null,
       super(key: key);

  /// Named constructor for image galleries
  const AdaptiveGrid.gallery({
    Key? key,
    required this.children,
    this.shrinkWrap = false,
    this.physics,
    this.padding,
    this.controller,
  }) : spacing = null,
       runSpacing = null,
       mobileColumns = 2,
       tabletColumns = 3,
       desktopColumns = 4,
       largeDesktopColumns = 5,
       childAspectRatio = 1.0,
       scrollDirection = Axis.vertical,
       reverse = false,
       primary = false,
       gridType = GridType.fixedCount,
       maxCrossAxisExtent = null,
       mainAxisSpacing = null,
       crossAxisSpacing = null,
       super(key: key);

  @override
  Widget build(BuildContext context) {
    final effectiveSpacing = _getEffectiveSpacing(context);
    final effectiveRunSpacing = _getEffectiveRunSpacing(context);
    final effectivePadding = _getEffectivePadding(context);

    switch (gridType) {
      case GridType.fixedCount:
        return _buildFixedCountGrid(context, effectiveSpacing, effectiveRunSpacing, effectivePadding);
      case GridType.maxCrossAxisExtent:
        return _buildMaxExtentGrid(context, effectiveSpacing, effectiveRunSpacing, effectivePadding);
      case GridType.staggered:
        return _buildStaggeredGrid(context, effectiveSpacing, effectiveRunSpacing, effectivePadding);
    }
  }

  Widget _buildFixedCountGrid(BuildContext context, double spacing, double runSpacing, EdgeInsets padding) {
    final crossAxisCount = _getCrossAxisCount(context);
    
    return GridView.builder(
      padding: padding,
      shrinkWrap: shrinkWrap,
      physics: physics,
      scrollDirection: scrollDirection,
      reverse: reverse,
      controller: controller,
      primary: primary,
      itemCount: children.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: spacing,
        mainAxisSpacing: runSpacing,
        childAspectRatio: childAspectRatio ?? 1.0,
      ),
      itemBuilder: (context, index) => children[index],
    );
  }

  Widget _buildMaxExtentGrid(BuildContext context, double spacing, double runSpacing, EdgeInsets padding) {
    final maxExtent = maxCrossAxisExtent ?? _getDefaultMaxExtent(context);
    
    return GridView.builder(
      padding: padding,
      shrinkWrap: shrinkWrap,
      physics: physics,
      scrollDirection: scrollDirection,
      reverse: reverse,
      controller: controller,
      primary: primary,
      itemCount: children.length,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: maxExtent,
        crossAxisSpacing: spacing,
        mainAxisSpacing: runSpacing,
        childAspectRatio: childAspectRatio ?? 1.0,
      ),
      itemBuilder: (context, index) => children[index],
    );
  }

  Widget _buildStaggeredGrid(BuildContext context, double spacing, double runSpacing, EdgeInsets padding) {
    // For now, fall back to fixed count grid
    // In a real implementation, you might use flutter_staggered_grid_view
    return _buildFixedCountGrid(context, spacing, runSpacing, padding);
  }

  int _getCrossAxisCount(BuildContext context) {
    if (ResponsiveUtils.isMobileScreen(context)) {
      return mobileColumns ?? 1;
    } else if (ResponsiveUtils.isTabletScreen(context)) {
      return tabletColumns ?? 2;
    } else if (ResponsiveUtils.isLargeDesktopScreen(context)) {
      return largeDesktopColumns ?? desktopColumns ?? 4;
    } else {
      return desktopColumns ?? 3;
    }
  }

  double _getDefaultMaxExtent(BuildContext context) {
    if (ResponsiveUtils.isMobileScreen(context)) {
      return 200.0;
    } else if (ResponsiveUtils.isTabletScreen(context)) {
      return 250.0;
    } else {
      return 300.0;
    }
  }

  double _getEffectiveSpacing(BuildContext context) {
    if (spacing != null) return spacing!;
    if (crossAxisSpacing != null) return crossAxisSpacing!;
    return ResponsiveUtils.getAdaptiveMargin(context);
  }

  double _getEffectiveRunSpacing(BuildContext context) {
    if (runSpacing != null) return runSpacing!;
    if (mainAxisSpacing != null) return mainAxisSpacing!;
    return ResponsiveUtils.getAdaptiveMargin(context);
  }

  EdgeInsets _getEffectivePadding(BuildContext context) {
    if (padding != null) return padding!;
    final adaptivePadding = ResponsiveUtils.getAdaptivePadding(context);
    return EdgeInsets.all(adaptivePadding);
  }
}

/// AdaptiveSliverGrid for use in CustomScrollView with slivers
class AdaptiveSliverGrid extends StatelessWidget {
  final List<Widget> children;
  final double? spacing;
  final double? runSpacing;
  final int? mobileColumns;
  final int? tabletColumns;
  final int? desktopColumns;
  final int? largeDesktopColumns;
  final double? childAspectRatio;
  final GridType gridType;
  final double? maxCrossAxisExtent;

  const AdaptiveSliverGrid({
    Key? key,
    required this.children,
    this.spacing,
    this.runSpacing,
    this.mobileColumns,
    this.tabletColumns,
    this.desktopColumns,
    this.largeDesktopColumns,
    this.childAspectRatio = 1.0,
    this.gridType = GridType.fixedCount,
    this.maxCrossAxisExtent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final effectiveSpacing = spacing ?? ResponsiveUtils.getAdaptiveMargin(context);
    final effectiveRunSpacing = runSpacing ?? ResponsiveUtils.getAdaptiveMargin(context);

    switch (gridType) {
      case GridType.fixedCount:
        return SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) => children[index],
            childCount: children.length,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: _getCrossAxisCount(context),
            crossAxisSpacing: effectiveSpacing,
            mainAxisSpacing: effectiveRunSpacing,
            childAspectRatio: childAspectRatio ?? 1.0,
          ),
        );
      case GridType.maxCrossAxisExtent:
        return SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) => children[index],
            childCount: children.length,
          ),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: maxCrossAxisExtent ?? _getDefaultMaxExtent(context),
            crossAxisSpacing: effectiveSpacing,
            mainAxisSpacing: effectiveRunSpacing,
            childAspectRatio: childAspectRatio ?? 1.0,
          ),
        );
      case GridType.staggered:
        // Fallback to fixed count for now
        return SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) => children[index],
            childCount: children.length,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: _getCrossAxisCount(context),
            crossAxisSpacing: effectiveSpacing,
            mainAxisSpacing: effectiveRunSpacing,
            childAspectRatio: childAspectRatio ?? 1.0,
          ),
        );
    }
  }

  int _getCrossAxisCount(BuildContext context) {
    if (ResponsiveUtils.isMobileScreen(context)) {
      return mobileColumns ?? 1;
    } else if (ResponsiveUtils.isTabletScreen(context)) {
      return tabletColumns ?? 2;
    } else if (ResponsiveUtils.isLargeDesktopScreen(context)) {
      return largeDesktopColumns ?? desktopColumns ?? 4;
    } else {
      return desktopColumns ?? 3;
    }
  }

  double _getDefaultMaxExtent(BuildContext context) {
    if (ResponsiveUtils.isMobileScreen(context)) {
      return 200.0;
    } else if (ResponsiveUtils.isTabletScreen(context)) {
      return 250.0;
    } else {
      return 300.0;
    }
  }
}

/// AdaptiveWrapGrid provides a wrap-based grid layout for irregular content
class AdaptiveWrapGrid extends StatelessWidget {
  final List<Widget> children;
  final double? spacing;
  final double? runSpacing;
  final WrapAlignment alignment;
  final WrapAlignment runAlignment;
  final WrapCrossAlignment crossAxisAlignment;
  final Axis direction;
  final double? itemWidth;
  final double? itemHeight;

  const AdaptiveWrapGrid({
    Key? key,
    required this.children,
    this.spacing,
    this.runSpacing,
    this.alignment = WrapAlignment.start,
    this.runAlignment = WrapAlignment.start,
    this.crossAxisAlignment = WrapCrossAlignment.start,
    this.direction = Axis.horizontal,
    this.itemWidth,
    this.itemHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final effectiveSpacing = spacing ?? ResponsiveUtils.getAdaptiveMargin(context);
    final effectiveRunSpacing = runSpacing ?? ResponsiveUtils.getAdaptiveMargin(context);

    List<Widget> wrappedChildren = children;
    
    // If item dimensions are specified, wrap each child in a SizedBox
    if (itemWidth != null || itemHeight != null) {
      wrappedChildren = children.map((child) => SizedBox(
        width: itemWidth,
        height: itemHeight,
        child: child,
      )).toList();
    }

    return Wrap(
      spacing: effectiveSpacing,
      runSpacing: effectiveRunSpacing,
      alignment: alignment,
      runAlignment: runAlignment,
      crossAxisAlignment: crossAxisAlignment,
      direction: direction,
      children: wrappedChildren,
    );
  }
}

/// Types of grid layouts
enum GridType {
  fixedCount,        // Fixed number of columns
  maxCrossAxisExtent, // Maximum width per item
  staggered,         // Staggered grid (requires external package)
}

/// AdaptiveGridView that automatically switches between different grid types
class AdaptiveGridView extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsets? padding;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final ScrollController? controller;

  // Grid configuration
  final int mobileColumns;
  final int tabletColumns;
  final int desktopColumns;
  final double childAspectRatio;
  final double spacing;
  final double runSpacing;

  const AdaptiveGridView({
    Key? key,
    required this.children,
    this.padding,
    this.shrinkWrap = false,
    this.physics,
    this.controller,
    this.mobileColumns = 1,
    this.tabletColumns = 2,
    this.desktopColumns = 3,
    this.childAspectRatio = 1.0,
    this.spacing = 16.0,
    this.runSpacing = 16.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: _buildGrid(context, mobileColumns),
      tablet: _buildGrid(context, tabletColumns),
      desktop: _buildGrid(context, desktopColumns),
    );
  }

  Widget _buildGrid(BuildContext context, int columns) {
    return GridView.builder(
      padding: padding,
      shrinkWrap: shrinkWrap,
      physics: physics,
      controller: controller,
      itemCount: children.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        crossAxisSpacing: spacing,
        mainAxisSpacing: runSpacing,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) => children[index],
    );
  }
}

/// Helper extension for easy grid creation
extension AdaptiveGridExtension on List<Widget> {
  Widget toAdaptiveGrid({
    int? mobileColumns,
    int? tabletColumns,
    int? desktopColumns,
    double? childAspectRatio,
    double? spacing,
    double? runSpacing,
    bool shrinkWrap = false,
    ScrollPhysics? physics,
    EdgeInsets? padding,
  }) {
    return AdaptiveGrid(
      mobileColumns: mobileColumns,
      tabletColumns: tabletColumns,
      desktopColumns: desktopColumns,
      childAspectRatio: childAspectRatio,
      spacing: spacing,
      runSpacing: runSpacing,
      shrinkWrap: shrinkWrap,
      physics: physics,
      padding: padding,
      children: this,
    );
  }

  Widget toProjectGrid({
    bool shrinkWrap = false,
    ScrollPhysics? physics,
    EdgeInsets? padding,
  }) {
    return AdaptiveGrid.projects(
      shrinkWrap: shrinkWrap,
      physics: physics,
      padding: padding,
      children: this,
    );
  }

  Widget toDashboardGrid({
    bool shrinkWrap = true,
    ScrollPhysics? physics,
    EdgeInsets? padding,
  }) {
    return AdaptiveGrid.dashboard(
      shrinkWrap: shrinkWrap,
      physics: physics,
      padding: padding,
      children: this,
    );
  }
}