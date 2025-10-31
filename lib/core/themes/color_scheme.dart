import 'package:flutter/material.dart';

/// AdaptiveColors provides a consistent color palette for the Social Finance Impact Platform
/// across all platforms (Android, iOS, Web) with support for light and dark themes.
class AdaptiveColors {
  // Primary Colors - Social Finance Blue
  static const Color primary = Color(0xFF2563EB);
  static const Color primaryVariant = Color(0xFF1D4ED8);
  static const Color primaryLight = Color(0xFF3B82F6);
  static const Color primaryDark = Color(0xFF1E40AF);

  // Secondary Colors - Impact Green
  static const Color secondary = Color(0xFF10B981);
  static const Color secondaryVariant = Color(0xFF059669);
  static const Color secondaryLight = Color(0xFF34D399);
  static const Color secondaryDark = Color(0xFF047857);

  // Accent Colors - Success, Warning, Error
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);

  // Neutral Colors
  static const Color neutral50 = Color(0xFFF9FAFB);
  static const Color neutral100 = Color(0xFFF3F4F6);
  static const Color neutral200 = Color(0xFFE5E7EB);
  static const Color neutral300 = Color(0xFFD1D5DB);
  static const Color neutral400 = Color(0xFF9CA3AF);
  static const Color neutral500 = Color(0xFF6B7280);
  static const Color neutral600 = Color(0xFF4B5563);
  static const Color neutral700 = Color(0xFF374151);
  static const Color neutral800 = Color(0xFF1F2937);
  static const Color neutral900 = Color(0xFF111827);

  // Surface Colors
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceVariant = Color(0xFFF9FAFB);
  static const Color surfaceDark = Color(0xFF1F2937);
  static const Color surfaceVariantDark = Color(0xFF374151);

  // Text Colors
  static const Color onSurface = Color(0xFF111827);
  static const Color onSurfaceVariant = Color(0xFF6B7280);
  static const Color onSurfaceDark = Color(0xFFF9FAFB);
  static const Color onSurfaceVariantDark = Color(0xFF9CA3AF);

  // Material 3 Light Color Scheme
  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: primary,
    onPrimary: Colors.white,
    primaryContainer: primaryVariant,
    onPrimaryContainer: Colors.white,
    secondary: secondary,
    onSecondary: Colors.white,
    secondaryContainer: secondaryVariant,
    onSecondaryContainer: Colors.white,
    tertiary: info,
    onTertiary: Colors.white,
    tertiaryContainer: info,
    onTertiaryContainer: Colors.white,
    error: error,
    onError: Colors.white,
    errorContainer: error,
    onErrorContainer: Colors.white,
    surface: surface,
    onSurface: onSurface,
    onSurfaceVariant: onSurfaceVariant,
    outline: neutral300,
    outlineVariant: neutral200,
    shadow: neutral900,
    scrim: neutral900,
    inverseSurface: neutral800,
    onInverseSurface: neutral50,
    inversePrimary: primaryLight,
    surfaceDim: neutral100,
    surfaceBright: surface,
    surfaceContainerLowest: neutral50,
    surfaceContainer: neutral100,
    surfaceContainerLow: neutral100,
    surfaceContainerHigh: neutral100,
    surfaceContainerHighest: neutral100,
  );

  // Material 3 Dark Color Scheme
  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: primaryLight,
    onPrimary: neutral900,
    primaryContainer: primaryVariant,
    onPrimaryContainer: Colors.white,
    secondary: secondaryLight,
    onSecondary: neutral900,
    secondaryContainer: secondaryVariant,
    onSecondaryContainer: Colors.white,
    tertiary: info,
    onTertiary: Colors.white,
    tertiaryContainer: info,
    onTertiaryContainer: Colors.white,
    error: error,
    onError: Colors.white,
    errorContainer: error,
    onErrorContainer: Colors.white,
    surface: surfaceDark,
    onSurface: onSurfaceDark,
    onSurfaceVariant: onSurfaceVariantDark,
    outline: neutral600,
    outlineVariant: neutral700,
    shadow: Colors.black,
    scrim: Colors.black,
    inverseSurface: neutral50,
    onInverseSurface: neutral900,
    inversePrimary: primary,
    surfaceDim: neutral800,
    surfaceBright: neutral700,
    surfaceContainerLowest: neutral900,
    surfaceContainer: neutral800,
    surfaceContainerLow: neutral800,
    surfaceContainerHigh: neutral700,
    surfaceContainerHighest: neutral700,
  );

  // Financial Impact Colors
  static const Color impactPositive = Color(0xFF10B981);
  static const Color impactNeutral = Color(0xFF6B7280);
  static const Color impactNegative = Color(0xFFEF4444);

  // Status Colors for Projects
  static const Color statusActive = Color(0xFF10B981);
  static const Color statusPending = Color(0xFFF59E0B);
  static const Color statusCompleted = Color(0xFF3B82F6);
  static const Color statusCancelled = Color(0xFFEF4444);

  // Gradient Colors
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, primaryLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [secondary, secondaryLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Platform-specific color adjustments
  static Color getPlatformAdjustedColor(Color baseColor, {bool isIOS = false}) {
    if (isIOS) {
      // iOS typically uses slightly different color interpretations
      return Color.alphaBlend(Colors.black.withOpacity(0.05), baseColor);
    }
    return baseColor;
  }

  // High contrast colors for accessibility
  static const ColorScheme highContrastLightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF003580),
    onPrimary: Colors.white,
    primaryContainer: Color(0xFF00295F),
    onPrimaryContainer: Colors.white,
    secondary: Color(0xFF006B54),
    onSecondary: Colors.white,
    secondaryContainer: Color(0xFF00553E),
    onSecondaryContainer: Colors.white,
    tertiary: Color(0xFF00629D),
    onTertiary: Colors.white,
    tertiaryContainer: Color(0xFF00629D),
    onTertiaryContainer: Colors.white,
    error: Color(0xFFBA1A1A),
    onError: Colors.white,
    errorContainer: Color(0xFF8C0000),
    onErrorContainer: Colors.white,
    surface: Colors.white,
    onSurface: Colors.black,
    onSurfaceVariant: Color(0xFF2E2E2E),
    outline: Color(0xFF5F5F5F),
    outlineVariant: Color(0xFFAAAAAA),
    shadow: Colors.black,
    scrim: Colors.black,
    inverseSurface: Colors.black,
    onInverseSurface: Colors.white,
    inversePrimary: Color(0xFF9ECAFF),
    surfaceDim: Color(0xFFE8E8E8),
    surfaceBright: Colors.white,
    surfaceContainerLowest: Colors.white,
    surfaceContainer: Color(0xFFF5F5F5),
    surfaceContainerLow: Color(0xFFEEEEEE),
    surfaceContainerHigh: Color(0xFFE5E5E5),
    surfaceContainerHighest: Color(0xFFE0E0E0),
  );

  static const ColorScheme highContrastDarkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF9ECAFF),
    onPrimary: Color(0xFF001C3B),
    primaryContainer: Color(0xFFADD8FF),
    onPrimaryContainer: Color(0xFF001C3B),
    secondary: Color(0xFF7BFFC7),
    onSecondary: Color(0xFF003827),
    secondaryContainer: Color(0xFF8FFFCF),
    onSecondaryContainer: Color(0xFF003827),
    tertiary: Color(0xFFAAD6FF),
    onTertiary: Color(0xFF002642),
    tertiaryContainer: Color(0xFFAAD6FF),
    onTertiaryContainer: Color(0xFF002642),
    error: Color(0xFFFFB3AB),
    onError: Color(0xFF5F0E0E),
    errorContainer: Color(0xFFFFC3BD),
    onErrorContainer: Color(0xFF5F0E0E),
    surface: Colors.black,
    onSurface: Colors.white,
    onSurfaceVariant: Color(0xFFE0E0E0),
    outline: Color(0xFFB0B0B0),
    outlineVariant: Color(0xFF606060),
    shadow: Colors.black,
    scrim: Colors.black,
    inverseSurface: Colors.white,
    onInverseSurface: Colors.black,
    inversePrimary: Color(0xFF003580),
    surfaceDim: Color(0xFF121212),
    surfaceBright: Color(0xFF272727),
    surfaceContainerLowest: Colors.black,
    surfaceContainer: Color(0xFF1C1C1C),
    surfaceContainerLow: Color(0xFF2A2A2A),
    surfaceContainerHigh: Color(0xFF2D2D2D),
    surfaceContainerHighest: Color(0xFF2F2F2F),
  );
}
