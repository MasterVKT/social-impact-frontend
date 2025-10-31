import 'package:flutter/material.dart';
import 'color_scheme.dart';

/// AdaptiveTextTheme provides responsive typography styles
/// that adapt to different platforms and screen sizes.
class AdaptiveTextTheme {
  // Font families
  static const String primaryFontFamily = 'Inter';
  static const String secondaryFontFamily = 'Roboto';
  
  // Base text styles following Material 3 type system
  static const TextStyle _baseTextStyle = TextStyle(
    fontFamily: primaryFontFamily,
    fontWeight: FontWeight.normal,
    height: 1.4,
    letterSpacing: 0,
  );
  
  // Light theme text styles
  static final TextTheme lightTextTheme = TextTheme(
    // Display styles
    displayLarge: _baseTextStyle.copyWith(
      fontSize: 40,
      fontWeight: FontWeight.w300,
      color: AdaptiveColors.onSurface,
      height: 1.2,
    ),
    displayMedium: _baseTextStyle.copyWith(
      fontSize: 32,
      fontWeight: FontWeight.w400,
      color: AdaptiveColors.onSurface,
      height: 1.3,
    ),
    displaySmall: _baseTextStyle.copyWith(
      fontSize: 28,
      fontWeight: FontWeight.w400,
      color: AdaptiveColors.onSurface,
      height: 1.3,
    ),
    
    // Headline styles
    headlineLarge: _baseTextStyle.copyWith(
      fontSize: 28,
      fontWeight: FontWeight.w500,
      color: AdaptiveColors.onSurface,
      height: 1.3,
    ),
    headlineMedium: _baseTextStyle.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: AdaptiveColors.onSurface,
      height: 1.3,
    ),
    headlineSmall: _baseTextStyle.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: AdaptiveColors.onSurface,
      height: 1.4,
    ),
    
    // Title styles
    titleLarge: _baseTextStyle.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: AdaptiveColors.onSurface,
      height: 1.4,
    ),
    titleMedium: _baseTextStyle.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AdaptiveColors.onSurface,
      height: 1.4,
    ),
    titleSmall: _baseTextStyle.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: AdaptiveColors.onSurface,
      height: 1.4,
    ),
    
    // Body styles
    bodyLarge: _baseTextStyle.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AdaptiveColors.onSurface,
      height: 1.5,
    ),
    bodyMedium: _baseTextStyle.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AdaptiveColors.onSurface,
      height: 1.4,
    ),
    bodySmall: _baseTextStyle.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AdaptiveColors.onSurfaceVariant,
      height: 1.4,
    ),
    
    // Label styles
    labelLarge: _baseTextStyle.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AdaptiveColors.onSurface,
      height: 1.4,
      letterSpacing: 0.5,
    ),
    labelMedium: _baseTextStyle.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AdaptiveColors.onSurface,
      height: 1.3,
      letterSpacing: 0.5,
    ),
    labelSmall: _baseTextStyle.copyWith(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: AdaptiveColors.onSurfaceVariant,
      height: 1.3,
      letterSpacing: 0.5,
    ),
  );
  
  // Dark theme text styles
  static final TextTheme darkTextTheme = lightTextTheme.copyWith(
    displayLarge: lightTextTheme.displayLarge?.copyWith(
      color: AdaptiveColors.onSurfaceDark,
    ),
    displayMedium: lightTextTheme.displayMedium?.copyWith(
      color: AdaptiveColors.onSurfaceDark,
    ),
    displaySmall: lightTextTheme.displaySmall?.copyWith(
      color: AdaptiveColors.onSurfaceDark,
    ),
    headlineLarge: lightTextTheme.headlineLarge?.copyWith(
      color: AdaptiveColors.onSurfaceDark,
    ),
    headlineMedium: lightTextTheme.headlineMedium?.copyWith(
      color: AdaptiveColors.onSurfaceDark,
    ),
    headlineSmall: lightTextTheme.headlineSmall?.copyWith(
      color: AdaptiveColors.onSurfaceDark,
    ),
    titleLarge: lightTextTheme.titleLarge?.copyWith(
      color: AdaptiveColors.onSurfaceDark,
    ),
    titleMedium: lightTextTheme.titleMedium?.copyWith(
      color: AdaptiveColors.onSurfaceDark,
    ),
    titleSmall: lightTextTheme.titleSmall?.copyWith(
      color: AdaptiveColors.onSurfaceDark,
    ),
    bodyLarge: lightTextTheme.bodyLarge?.copyWith(
      color: AdaptiveColors.onSurfaceDark,
    ),
    bodyMedium: lightTextTheme.bodyMedium?.copyWith(
      color: AdaptiveColors.onSurfaceDark,
    ),
    bodySmall: lightTextTheme.bodySmall?.copyWith(
      color: AdaptiveColors.onSurfaceVariantDark,
    ),
    labelLarge: lightTextTheme.labelLarge?.copyWith(
      color: AdaptiveColors.onSurfaceDark,
    ),
    labelMedium: lightTextTheme.labelMedium?.copyWith(
      color: AdaptiveColors.onSurfaceDark,
    ),
    labelSmall: lightTextTheme.labelSmall?.copyWith(
      color: AdaptiveColors.onSurfaceVariantDark,
    ),
  );
  
  // Custom text styles for specific use cases
  static TextStyle get buttonText => _baseTextStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
  );
  
  static TextStyle get linkText => _baseTextStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AdaptiveColors.primary,
    decoration: TextDecoration.underline,
  );
  
  static TextStyle get captionText => _baseTextStyle.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: AdaptiveColors.onSurfaceVariant,
    height: 1.3,
  );
  
  static TextStyle get overlineText => _baseTextStyle.copyWith(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: AdaptiveColors.onSurfaceVariant,
    letterSpacing: 1.0,
    height: 1.3,
  );
  
  // Financial text styles
  static TextStyle get currencyText => _baseTextStyle.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    fontFamily: 'Roboto Mono',
    color: AdaptiveColors.onSurface,
  );
  
  static TextStyle get percentageText => _baseTextStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: 'Roboto Mono',
  );
  
  // Status text styles
  static TextStyle get successText => _baseTextStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AdaptiveColors.success,
  );
  
  static TextStyle get warningText => _baseTextStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AdaptiveColors.warning,
  );
  
  static TextStyle get errorText => _baseTextStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AdaptiveColors.error,
  );
  
  // Helper methods for responsive text
  static TextStyle getResponsiveTextStyle(
    BuildContext context,
    TextStyle baseStyle, {
    double? mobileScale = 1.0,
    double? tabletScale = 1.1,
    double? desktopScale = 1.2,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    double scale = 1.0;
    
    if (screenWidth < 600) {
      scale = mobileScale ?? 1.0;
    } else if (screenWidth < 1024) {
      scale = tabletScale ?? 1.1;
    } else {
      scale = desktopScale ?? 1.2;
    }
    
    return baseStyle.copyWith(
      fontSize: (baseStyle.fontSize ?? 14) * scale,
    );
  }
  
  // Platform-specific adjustments
  static TextTheme getPlatformAdjustedTextTheme(TextTheme baseTheme, {required bool isIOS}) {
    if (!isIOS) return baseTheme;
    
    // iOS specific adjustments - slightly different font weights
    return baseTheme.copyWith(
      headlineLarge: baseTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w600),
      headlineMedium: baseTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w600),
      headlineSmall: baseTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w600),
      titleLarge: baseTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
      titleMedium: baseTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
      titleSmall: baseTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
    );
  }
}