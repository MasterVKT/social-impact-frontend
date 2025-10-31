import 'package:flutter/material.dart';
import '../../core/utils/responsive_utils.dart';

/// Responsive layout widget that displays different layouts based on screen size
/// Provides mobile, tablet, and desktop specific layouts
class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  const ResponsiveLayout({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = ResponsiveUtils.getBreakpoint(context);
    
    switch (screenSize) {
      case ScreenSize.largeDesktop:
        return desktop ?? tablet ?? mobile;
      case ScreenSize.desktop:
        return desktop ?? tablet ?? mobile;
      case ScreenSize.tablet:
        return tablet ?? mobile;
      case ScreenSize.mobile:
        return mobile;
    }
  }
}