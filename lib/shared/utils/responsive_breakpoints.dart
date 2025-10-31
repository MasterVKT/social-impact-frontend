import 'package:flutter/material.dart';

/// Responsive breakpoints utility for consistent screen size handling
class ResponsiveBreakpoints {
  // Breakpoint values
  static const double mobile = 600;
  static const double tablet = 1200;
  static const double desktop = 1920;

  // Content width constraints
  static const double maxContentWidth = 1400;
  static const double maxCardWidth = 800;
  static const double maxFormWidth = 600;

  // Grid columns for different breakpoints
  static const int mobileColumns = 1;
  static const int tabletColumns = 2;
  static const int desktopColumns = 4;
  static const int largeDesktopColumns = 6;

  /// Check if current screen is mobile
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < mobile;
  }

  /// Check if current screen is tablet
  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= mobile && width < tablet;
  }

  /// Check if current screen is desktop
  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= tablet;
  }

  /// Check if current screen is large desktop
  static bool isLargeDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= desktop;
  }

  /// Get appropriate number of columns for current screen
  static int getColumns(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width >= desktop) return largeDesktopColumns;
    if (width >= tablet) return desktopColumns;
    if (width >= mobile) return tabletColumns;
    return mobileColumns;
  }

  /// Get appropriate grid columns for cards
  static int getCardColumns(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width >= desktop) return 4;
    if (width >= tablet) return 3;
    if (width >= mobile) return 2;
    return 1;
  }

  /// Get appropriate padding for current screen
  static EdgeInsets getPadding(BuildContext context) {
    if (isMobile(context)) {
      return const EdgeInsets.all(16);
    } else if (isTablet(context)) {
      return const EdgeInsets.all(24);
    } else {
      return const EdgeInsets.all(32);
    }
  }

  /// Get appropriate margin for current screen
  static EdgeInsets getMargin(BuildContext context) {
    if (isMobile(context)) {
      return const EdgeInsets.all(8);
    } else if (isTablet(context)) {
      return const EdgeInsets.all(16);
    } else {
      return const EdgeInsets.all(24);
    }
  }

  /// Get maximum width for content container
  static double getMaxWidth(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (isDesktop(context)) {
      return screenWidth > maxContentWidth
          ? maxContentWidth
          : screenWidth * 0.9;
    } else if (isTablet(context)) {
      return screenWidth * 0.95;
    } else {
      return screenWidth;
    }
  }

  /// Get appropriate font scale for current screen
  static double getFontScale(BuildContext context) {
    if (isMobile(context)) {
      return 1.0;
    } else if (isTablet(context)) {
      return 1.1;
    } else {
      return 1.2;
    }
  }

  /// Get appropriate icon size for current screen
  static double getIconSize(BuildContext context, {double base = 24}) {
    if (isMobile(context)) {
      return base;
    } else if (isTablet(context)) {
      return base * 1.1;
    } else {
      return base * 1.2;
    }
  }

  /// Get appropriate button height for current screen
  static double getButtonHeight(BuildContext context) {
    if (isMobile(context)) {
      return 48;
    } else if (isTablet(context)) {
      return 52;
    } else {
      return 56;
    }
  }

  /// Get appropriate app bar height for current screen
  static double getAppBarHeight(BuildContext context) {
    if (isMobile(context)) {
      return kToolbarHeight;
    } else if (isTablet(context)) {
      return kToolbarHeight + 8;
    } else {
      return kToolbarHeight + 16;
    }
  }

  /// Get responsive value based on screen size
  static T getResponsiveValue<T>(
    BuildContext context, {
    required T mobile,
    T? tablet,
    T? desktop,
    T? largeDesktop,
  }) {
    final width = MediaQuery.of(context).size.width;

    // Utilisation de double.infinity pour éviter les comparaisons directes avec T
    if (width >= ResponsiveBreakpoints.desktop && largeDesktop != null) {
      return largeDesktop;
    } else if (width >= ResponsiveBreakpoints.tablet && desktop != null) {
      return desktop;
    } else if (width >= ResponsiveBreakpoints.mobile && tablet != null) {
      return tablet;
    } else {
      return mobile;
    }
  }

  /// Get grid aspect ratio based on screen size
  static double getGridAspectRatio(BuildContext context) {
    if (isMobile(context)) {
      return 1.2;
    } else if (isTablet(context)) {
      return 1.1;
    } else {
      return 1.0;
    }
  }

  /// Get sidebar width for desktop layouts
  static double getSidebarWidth(BuildContext context) {
    if (isLargeDesktop(context)) {
      return 280;
    } else if (isDesktop(context)) {
      return 240;
    } else {
      return 200;
    }
  }

  /// Get navigation rail width
  static double getNavigationRailWidth(BuildContext context) {
    if (isDesktop(context)) {
      return 72;
    } else {
      return 56;
    }
  }

  /// Check if should use drawer instead of rail navigation
  static bool shouldUseDrawer(BuildContext context) {
    return !isDesktop(context);
  }

  /// Get appropriate dialog width
  static double getDialogWidth(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (isMobile(context)) {
      return screenWidth * 0.9;
    } else if (isTablet(context)) {
      return screenWidth * 0.7;
    } else {
      return screenWidth * 0.5;
    }
  }

  /// Get appropriate bottom sheet height
  static double getBottomSheetHeight(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    if (isMobile(context)) {
      return screenHeight * 0.9;
    } else if (isTablet(context)) {
      return screenHeight * 0.8;
    } else {
      return screenHeight * 0.7;
    }
  }

  /// Get card elevation based on screen size
  static double getCardElevation(BuildContext context) {
    if (isMobile(context)) {
      return 2;
    } else if (isTablet(context)) {
      return 4;
    } else {
      return 6;
    }
  }

  /// Get border radius based on screen size
  static double getBorderRadius(BuildContext context, {double base = 8}) {
    if (isMobile(context)) {
      return base;
    } else if (isTablet(context)) {
      return base * 1.25;
    } else {
      return base * 1.5;
    }
  }
}

/// Responsive size utility
class ResponsiveSize {
  final double mobile;
  final double tablet;
  final double desktop;

  const ResponsiveSize({
    required this.mobile,
    required this.tablet,
    required this.desktop,
  });

  /// Get size for current context
  double get(BuildContext context) {
    if (ResponsiveBreakpoints.isDesktop(context)) {
      return desktop;
    } else if (ResponsiveBreakpoints.isTablet(context)) {
      return tablet;
    } else {
      return mobile;
    }
  }
}

/// Responsive spacing utility
class ResponsiveSpacing {
  static const xxs = ResponsiveSize(mobile: 2, tablet: 3, desktop: 4);
  static const xs = ResponsiveSize(mobile: 4, tablet: 6, desktop: 8);
  static const sm = ResponsiveSize(mobile: 8, tablet: 12, desktop: 16);
  static const md = ResponsiveSize(mobile: 16, tablet: 20, desktop: 24);
  static const lg = ResponsiveSize(mobile: 24, tablet: 32, desktop: 40);
  static const xl = ResponsiveSize(mobile: 32, tablet: 40, desktop: 48);
  static const xxl = ResponsiveSize(mobile: 40, tablet: 48, desktop: 64);
}

/// Responsive typography utility
class ResponsiveTypography {
  static const displayLarge =
      ResponsiveSize(mobile: 32, tablet: 36, desktop: 40);
  static const displayMedium =
      ResponsiveSize(mobile: 28, tablet: 32, desktop: 36);
  static const displaySmall =
      ResponsiveSize(mobile: 24, tablet: 28, desktop: 32);

  static const headlineLarge =
      ResponsiveSize(mobile: 22, tablet: 26, desktop: 30);
  static const headlineMedium =
      ResponsiveSize(mobile: 20, tablet: 24, desktop: 28);
  static const headlineSmall =
      ResponsiveSize(mobile: 18, tablet: 22, desktop: 26);

  static const titleLarge = ResponsiveSize(mobile: 16, tablet: 18, desktop: 20);
  static const titleMedium =
      ResponsiveSize(mobile: 14, tablet: 16, desktop: 18);
  static const titleSmall = ResponsiveSize(mobile: 12, tablet: 14, desktop: 16);

  static const bodyLarge = ResponsiveSize(mobile: 14, tablet: 16, desktop: 18);
  static const bodyMedium = ResponsiveSize(mobile: 12, tablet: 14, desktop: 16);
  static const bodySmall = ResponsiveSize(mobile: 11, tablet: 12, desktop: 14);

  static const labelLarge = ResponsiveSize(mobile: 12, tablet: 14, desktop: 16);
  static const labelMedium =
      ResponsiveSize(mobile: 11, tablet: 12, desktop: 14);
  static const labelSmall = ResponsiveSize(mobile: 10, tablet: 11, desktop: 12);
}
