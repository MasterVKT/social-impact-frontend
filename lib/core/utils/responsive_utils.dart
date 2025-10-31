import 'package:flutter/material.dart';
import 'platform_detector.dart';

/// ResponsiveUtils provides utilities for responsive design and breakpoint management
/// across mobile, tablet, and desktop screen sizes on all platforms.
class ResponsiveUtils {
  // Breakpoints universels
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 1024;
  static const double desktopBreakpoint = 1440;
  static const double largeDesktopBreakpoint = 1920;

  // Détection taille d'écran
  static bool isMobileScreen(BuildContext context) =>
      MediaQuery.of(context).size.width < mobileBreakpoint;

  static bool isTabletScreen(BuildContext context) =>
      MediaQuery.of(context).size.width >= mobileBreakpoint &&
      MediaQuery.of(context).size.width < desktopBreakpoint;

  static bool isDesktopScreen(BuildContext context) =>
      MediaQuery.of(context).size.width >= desktopBreakpoint;

  static bool isLargeDesktopScreen(BuildContext context) =>
      MediaQuery.of(context).size.width >= largeDesktopBreakpoint;

  // Détection combinée plateforme + taille
  static bool isHandheldDevice(BuildContext context) =>
      PlatformDetector.isMobile && isMobileScreen(context);

  static bool isTabletDevice(BuildContext context) =>
      PlatformDetector.isMobile && isTabletScreen(context);

  static bool isDesktopDevice(BuildContext context) =>
      PlatformDetector.isWeb && isDesktopScreen(context);

  // Valeurs adaptatives pour l'espacement
  static double getAdaptivePadding(BuildContext context) {
    if (isHandheldDevice(context)) return 16.0;
    if (isTabletDevice(context)) return 24.0;
    if (isDesktopDevice(context)) return 32.0;
    return 16.0; // Default fallback
  }

  static double getAdaptiveMargin(BuildContext context) {
    if (isHandheldDevice(context)) return 8.0;
    if (isTabletDevice(context)) return 16.0;
    if (isDesktopDevice(context)) return 24.0;
    return 8.0; // Default fallback
  }

  // Colonnes adaptatives pour les grilles
  static int getAdaptiveColumns(BuildContext context) {
    if (isMobileScreen(context)) return 1;
    if (isTabletScreen(context)) return 2;
    if (isDesktopScreen(context)) return 3;
    if (isLargeDesktopScreen(context)) return 4;
    return 1; // Default fallback
  }

  // Largeur adaptative pour les cartes
  static double getAdaptiveCardWidth(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (isMobileScreen(context)) {
      return screenWidth - (getAdaptivePadding(context) * 2);
    } else if (isTabletScreen(context)) {
      return (screenWidth - (getAdaptivePadding(context) * 3)) / 2;
    } else {
      return (screenWidth - (getAdaptivePadding(context) * 4)) / 3;
    }
  }

  // Taille de police adaptative
  static double getAdaptiveFontSize(BuildContext context, double baseFontSize) {
    if (isMobileScreen(context)) {
      return baseFontSize;
    } else if (isTabletScreen(context)) {
      return baseFontSize * 1.1;
    } else {
      return baseFontSize * 1.2;
    }
  }

  // Hauteur adaptative pour les boutons
  static double getAdaptiveButtonHeight(BuildContext context) {
    if (isHandheldDevice(context)) return 48.0;
    if (isTabletDevice(context)) return 52.0;
    if (isDesktopDevice(context)) return 56.0;
    return 48.0; // Default fallback
  }

  // Largeur maximale pour le contenu (évite les lignes trop longues)
  static double getMaxContentWidth(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (isMobileScreen(context)) {
      return screenWidth;
    } else if (isTabletScreen(context)) {
      return 768.0;
    } else {
      return 1200.0; // Max width for desktop
    }
  }

  // Détermine si l'orientation est paysage
  static bool isLandscape(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape;
  }

  // Détermine si l'orientation est portrait
  static bool isPortrait(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }

  // Obtient la densité de pixels
  static double getPixelRatio(BuildContext context) {
    return MediaQuery.of(context).devicePixelRatio;
  }

  // Obtient la taille d'écran actuelle comme énumération
  static ScreenSize getBreakpoint(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width < mobileBreakpoint) {
      return ScreenSize.mobile;
    } else if (width < desktopBreakpoint) {
      return ScreenSize.tablet;
    } else if (width < largeDesktopBreakpoint) {
      return ScreenSize.desktop;
    } else {
      return ScreenSize.largeDesktop;
    }
  }

  // Vérifie si l'écran a une haute densité
  static bool isHighDensityScreen(BuildContext context) {
    return getPixelRatio(context) > 2.0;
  }
}

/// Enumération des tailles d'écran
enum ScreenSize {
  mobile,
  tablet,
  desktop,
  largeDesktop,
}

/// Extension pour faciliter l'utilisation des breakpoints
extension ResponsiveExtension on BuildContext {
  bool get isMobileScreen => ResponsiveUtils.isMobileScreen(this);
  bool get isTabletScreen => ResponsiveUtils.isTabletScreen(this);
  bool get isDesktopScreen => ResponsiveUtils.isDesktopScreen(this);
  bool get isLargeDesktopScreen => ResponsiveUtils.isLargeDesktopScreen(this);

  bool get isHandheldDevice => ResponsiveUtils.isHandheldDevice(this);
  bool get isTabletDevice => ResponsiveUtils.isTabletDevice(this);
  bool get isDesktopDevice => ResponsiveUtils.isDesktopDevice(this);

  double get adaptivePadding => ResponsiveUtils.getAdaptivePadding(this);
  double get adaptiveMargin => ResponsiveUtils.getAdaptiveMargin(this);
  int get adaptiveColumns => ResponsiveUtils.getAdaptiveColumns(this);
  double get adaptiveButtonHeight =>
      ResponsiveUtils.getAdaptiveButtonHeight(this);
  double get maxContentWidth => ResponsiveUtils.getMaxContentWidth(this);
}
