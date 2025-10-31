import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/platform_detector.dart';
import '../utils/responsive_utils.dart';
import 'color_scheme.dart';
import 'text_theme.dart';

/// AdaptiveTheme provides platform-aware Material Design 3 themes
/// that adapt to different platforms and screen sizes.
class AdaptiveTheme {
  static ThemeData get lightTheme {
    if (PlatformDetector.isIOS) {
      return _iOSLightTheme;
    } else if (PlatformDetector.isWeb) {
      return _webLightTheme;
    } else {
      return _androidLightTheme;
    }
  }

  static ThemeData get darkTheme {
    if (PlatformDetector.isIOS) {
      return _iOSDarkTheme;
    } else if (PlatformDetector.isWeb) {
      return _webDarkTheme;
    } else {
      return _androidDarkTheme;
    }
  }

  // Base Material 3 theme
  static ThemeData get _baseLightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: AdaptiveColors.lightColorScheme,
      textTheme: AdaptiveTextTheme.lightTextTheme,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 1,
        centerTitle: true,
        backgroundColor: AdaptiveColors.surface,
        foregroundColor: AdaptiveColors.onSurface,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      cardTheme: const CardTheme(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AdaptiveColors.neutral50,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AdaptiveColors.neutral300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AdaptiveColors.primary, width: 2),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 8,
        backgroundColor: AdaptiveColors.surface,
        selectedItemColor: AdaptiveColors.primary,
        unselectedItemColor: AdaptiveColors.neutral500,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  static ThemeData get _baseDarkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: AdaptiveColors.darkColorScheme,
      textTheme: AdaptiveTextTheme.darkTextTheme,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 1,
        centerTitle: true,
        backgroundColor: AdaptiveColors.surfaceDark,
        foregroundColor: AdaptiveColors.onSurfaceDark,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      cardTheme: const CardTheme(
        elevation: 4,
        color: AdaptiveColors.surfaceVariantDark,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AdaptiveColors.neutral800,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AdaptiveColors.neutral600),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
              const BorderSide(color: AdaptiveColors.primaryLight, width: 2),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 8,
        backgroundColor: AdaptiveColors.surfaceDark,
        selectedItemColor: AdaptiveColors.primaryLight,
        unselectedItemColor: AdaptiveColors.neutral400,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  // Android-specific theme
  static ThemeData get _androidLightTheme {
    return _baseLightTheme.copyWith(
      platform: TargetPlatform.android,
      splashFactory: InkRipple.splashFactory,
    );
  }

  static ThemeData get _androidDarkTheme {
    return _baseDarkTheme.copyWith(
      platform: TargetPlatform.android,
      splashFactory: InkRipple.splashFactory,
    );
  }

  // iOS-specific theme
  static ThemeData get _iOSLightTheme {
    return _baseLightTheme.copyWith(
      platform: TargetPlatform.iOS,
      splashFactory: NoSplash.splashFactory,
      cupertinoOverrideTheme: const CupertinoThemeData(
        primaryColor: AdaptiveColors.primary,
        barBackgroundColor: AdaptiveColors.surface,
        scaffoldBackgroundColor: AdaptiveColors.neutral50,
      ),
    );
  }

  static ThemeData get _iOSDarkTheme {
    return _baseDarkTheme.copyWith(
      platform: TargetPlatform.iOS,
      splashFactory: NoSplash.splashFactory,
      cupertinoOverrideTheme: const CupertinoThemeData(
        primaryColor: AdaptiveColors.primaryLight,
        barBackgroundColor: AdaptiveColors.surfaceDark,
        scaffoldBackgroundColor: AdaptiveColors.neutral800,
      ),
    );
  }

  // Web-specific theme
  static ThemeData get _webLightTheme {
    return _baseLightTheme.copyWith(
      splashFactory: InkSparkle.splashFactory,
      scrollbarTheme: ScrollbarThemeData(
        thumbColor: WidgetStateProperty.all(AdaptiveColors.neutral300),
        trackColor: WidgetStateProperty.all(AdaptiveColors.neutral100),
        thickness: WidgetStateProperty.all(8),
        radius: const Radius.circular(4),
      ),
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: AdaptiveColors.neutral800,
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: const TextStyle(color: Colors.white),
        waitDuration: const Duration(milliseconds: 500),
      ),
    );
  }

  static ThemeData get _webDarkTheme {
    return _baseDarkTheme.copyWith(
      splashFactory: InkSparkle.splashFactory,
      scrollbarTheme: ScrollbarThemeData(
        thumbColor: WidgetStateProperty.all(AdaptiveColors.neutral600),
        trackColor: WidgetStateProperty.all(AdaptiveColors.neutral800),
        thickness: WidgetStateProperty.all(8),
        radius: const Radius.circular(4),
      ),
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: AdaptiveColors.neutral200,
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: const TextStyle(color: AdaptiveColors.neutral900),
        waitDuration: const Duration(milliseconds: 500),
      ),
    );
  }

  // Responsive theme data based on screen size
  static ThemeData getResponsiveTheme(BuildContext context,
      {bool isDark = false}) {
    final theme = isDark ? darkTheme : lightTheme;

    if (ResponsiveUtils.isMobileScreen(context)) {
      return theme.copyWith(
        textTheme: _getMobileTextTheme(theme.textTheme),
        cardTheme: theme.cardTheme.copyWith(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        ),
      );
    } else if (ResponsiveUtils.isTabletScreen(context)) {
      return theme.copyWith(
        textTheme: _getTabletTextTheme(theme.textTheme),
        cardTheme: theme.cardTheme.copyWith(
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        ),
      );
    } else {
      return theme.copyWith(
        textTheme: _getDesktopTextTheme(theme.textTheme),
        cardTheme: theme.cardTheme.copyWith(
          margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        ),
      );
    }
  }

  static TextTheme _getMobileTextTheme(TextTheme baseTheme) {
    return baseTheme.copyWith(
      displayLarge: baseTheme.displayLarge?.copyWith(fontSize: 32),
      displayMedium: baseTheme.displayMedium?.copyWith(fontSize: 28),
      displaySmall: baseTheme.displaySmall?.copyWith(fontSize: 24),
      headlineLarge: baseTheme.headlineLarge?.copyWith(fontSize: 24),
      headlineMedium: baseTheme.headlineMedium?.copyWith(fontSize: 20),
      headlineSmall: baseTheme.headlineSmall?.copyWith(fontSize: 18),
    );
  }

  static TextTheme _getTabletTextTheme(TextTheme baseTheme) {
    return baseTheme.copyWith(
      displayLarge: baseTheme.displayLarge?.copyWith(fontSize: 36),
      displayMedium: baseTheme.displayMedium?.copyWith(fontSize: 32),
      displaySmall: baseTheme.displaySmall?.copyWith(fontSize: 28),
      headlineLarge: baseTheme.headlineLarge?.copyWith(fontSize: 28),
      headlineMedium: baseTheme.headlineMedium?.copyWith(fontSize: 24),
      headlineSmall: baseTheme.headlineSmall?.copyWith(fontSize: 20),
    );
  }

  static TextTheme _getDesktopTextTheme(TextTheme baseTheme) {
    return baseTheme.copyWith(
      displayLarge: baseTheme.displayLarge?.copyWith(fontSize: 40),
      displayMedium: baseTheme.displayMedium?.copyWith(fontSize: 36),
      displaySmall: baseTheme.displaySmall?.copyWith(fontSize: 32),
      headlineLarge: baseTheme.headlineLarge?.copyWith(fontSize: 32),
      headlineMedium: baseTheme.headlineMedium?.copyWith(fontSize: 28),
      headlineSmall: baseTheme.headlineSmall?.copyWith(fontSize: 24),
    );
  }

  // High contrast themes for accessibility
  static ThemeData get highContrastLightTheme {
    return _baseLightTheme.copyWith(
      colorScheme: AdaptiveColors.highContrastLightColorScheme,
    );
  }

  static ThemeData get highContrastDarkTheme {
    return _baseDarkTheme.copyWith(
      colorScheme: AdaptiveColors.highContrastDarkColorScheme,
    );
  }
}
