/// UI Constants for responsive design and adaptive styling
/// Multi-platform UI configuration

import 'package:flutter/material.dart';

class UIConstants {
  // Breakpoints (in pixels)
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 1024;
  static const double desktopBreakpoint = 1440;
  static const double largeDesktopBreakpoint = 1920;

  // Spacing Scale
  static const double spacingXXS = 2.0;
  static const double spacingXS = 4.0;
  static const double spacingSM = 8.0;
  static const double spacingMD = 16.0;
  static const double spacingLG = 24.0;
  static const double spacingXL = 32.0;
  static const double spacingXXL = 48.0;
  static const double spacingXXXL = 64.0;

  // Border Radius
  static const double radiusXS = 4.0;
  static const double radiusSM = 8.0;
  static const double radiusMD = 12.0;
  static const double radiusLG = 16.0;
  static const double radiusXL = 20.0;
  static const double radiusXXL = 24.0;
  static const double radiusFull = 999.0;

  // Elevation
  static const double elevationNone = 0.0;
  static const double elevationXS = 1.0;
  static const double elevationSM = 2.0;
  static const double elevationMD = 4.0;
  static const double elevationLG = 8.0;
  static const double elevationXL = 12.0;
  static const double elevationXXL = 16.0;

  // Icon Sizes
  static const double iconSizeXS = 16.0;
  static const double iconSizeSM = 20.0;
  static const double iconSizeMD = 24.0;
  static const double iconSizeLG = 32.0;
  static const double iconSizeXL = 48.0;
  static const double iconSizeXXL = 64.0;

  // Button Heights
  static const double buttonHeightSM = 36.0;
  static const double buttonHeightMD = 48.0;
  static const double buttonHeightLG = 56.0;

  // Input Field Heights
  static const double inputHeightSM = 40.0;
  static const double inputHeightMD = 48.0;
  static const double inputHeightLG = 56.0;

  // Max Content Widths
  static const double maxContentWidthMobile = 600.0;
  static const double maxContentWidthTablet = 768.0;
  static const double maxContentWidthDesktop = 1200.0;
  static const double maxContentWidthWide = 1440.0;

  // Card Dimensions
  static const double cardMinHeight = 80.0;
  static const double cardMaxWidth = 400.0;

  // Avatar Sizes
  static const double avatarSizeXS = 24.0;
  static const double avatarSizeSM = 32.0;
  static const double avatarSizeMD = 48.0;
  static const double avatarSizeLG = 64.0;
  static const double avatarSizeXL = 96.0;
  static const double avatarSizeXXL = 128.0;

  // AppBar Heights
  static const double appBarHeight = 56.0;
  static const double appBarHeightLarge = 64.0;

  // Navigation Bar Heights
  static const double navBarHeightMobile = 56.0;
  static const double navBarHeightTablet = 64.0;
  static const double navRailWidth = 72.0;
  static const double navDrawerWidth = 280.0;

  // Divider Thickness
  static const double dividerThickness = 1.0;
  static const double dividerThicknessBold = 2.0;

  // Border Width
  static const double borderWidthThin = 1.0;
  static const double borderWidthMedium = 2.0;
  static const double borderWidthThick = 4.0;

  // Opacity
  static const double opacityDisabled = 0.38;
  static const double opacityHover = 0.08;
  static const double opacityFocus = 0.12;
  static const double opacityPressed = 0.16;
  static const double opacityDrag = 0.16;

  // Z-Index Layers
  static const int zIndexBase = 0;
  static const int zIndexDropdown = 1000;
  static const int zIndexSticky = 1100;
  static const int zIndexFixed = 1200;
  static const int zIndexOverlay = 1300;
  static const int zIndexModal = 1400;
  static const int zIndexPopover = 1500;
  static const int zIndexTooltip = 1600;

  // Grid Columns
  static const int gridColumnsMobile = 4;
  static const int gridColumnsTablet = 8;
  static const int gridColumnsDesktop = 12;

  // Private constructor
  UIConstants._();
}

/// Adaptive Padding based on screen size
class AdaptivePadding {
  static EdgeInsets all(BuildContext context, double basePadding) {
    final width = MediaQuery.of(context).size.width;
    if (width < UIConstants.mobileBreakpoint) {
      return EdgeInsets.all(basePadding);
    } else if (width < UIConstants.desktopBreakpoint) {
      return EdgeInsets.all(basePadding * 1.5);
    } else {
      return EdgeInsets.all(basePadding * 2);
    }
  }

  static EdgeInsets symmetric({
    required BuildContext context,
    double horizontal = 0,
    double vertical = 0,
  }) {
    final width = MediaQuery.of(context).size.width;
    final multiplier = width < UIConstants.mobileBreakpoint
        ? 1.0
        : width < UIConstants.desktopBreakpoint
            ? 1.5
            : 2.0;

    return EdgeInsets.symmetric(
      horizontal: horizontal * multiplier,
      vertical: vertical * multiplier,
    );
  }

  // Private constructor
  AdaptivePadding._();
}

/// Animation Curves
class AppCurves {
  static const Curve defaultCurve = Curves.easeInOut;
  static const Curve emphasizedAccelerate = Curves.easeInCubic;
  static const Curve emphasizedDecelerate = Curves.easeOutCubic;
  static const Curve standard = Curves.easeInOut;
  static const Curve accelerate = Curves.easeIn;
  static const Curve decelerate = Curves.easeOut;

  // Private constructor
  AppCurves._();
}

/// Duration Constants
class AppDurations {
  static const Duration instant = Duration(milliseconds: 0);
  static const Duration fast = Duration(milliseconds: 150);
  static const Duration normal = Duration(milliseconds: 300);
  static const Duration slow = Duration(milliseconds: 500);
  static const Duration slower = Duration(milliseconds: 1000);

  // Specific animations
  static const Duration pageTransition = Duration(milliseconds: 300);
  static const Duration fadeIn = Duration(milliseconds: 200);
  static const Duration fadeOut = Duration(milliseconds: 150);
  static const Duration slideIn = Duration(milliseconds: 250);
  static const Duration slideOut = Duration(milliseconds: 200);
  static const Duration scaleIn = Duration(milliseconds: 200);
  static const Duration scaleOut = Duration(milliseconds: 150);

  // Private constructor
  AppDurations._();
}

/// Common UI Configurations
class UIConfig {
  // Snackbar Configuration
  static const Duration snackbarDuration = Duration(seconds: 3);
  static const Duration snackbarDurationLong = Duration(seconds: 5);
  static const Duration snackbarDurationShort = Duration(seconds: 2);

  // Dialog Configuration
  static const double dialogMaxWidth = 600.0;
  static const double dialogMinHeight = 200.0;

  // Sheet Configuration
  static const double bottomSheetMaxHeight = 0.9; // 90% of screen height
  static const double bottomSheetMinHeight = 0.3; // 30% of screen height

  // Scroll Configuration
  static const double scrollThreshold = 100.0;
  static const EdgeInsets scrollPadding = EdgeInsets.all(20.0);

  // Image Configuration
  static const double imageAspectRatioSquare = 1.0;
  static const double imageAspectRatioLandscape = 16 / 9;
  static const double imageAspectRatioPortrait = 3 / 4;

  // List Configuration
  static const double listItemMinHeight = 56.0;
  static const double listItemPadding = 16.0;

  // Private constructor
  UIConfig._();
}

/// Platform-specific UI adjustments
class PlatformUIConstants {
  // iOS specific
  static const double iOSNavigationBarHeight = 44.0;
  static const double iOSTabBarHeight = 49.0;

  // Android specific
  static const double androidAppBarHeight = 56.0;
  static const double androidBottomNavHeight = 56.0;

  // Web specific
  static const double webSidebarWidth = 280.0;
  static const double webTopBarHeight = 64.0;

  // Private constructor
  PlatformUIConstants._();
}
