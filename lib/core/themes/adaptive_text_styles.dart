import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/platform_detector.dart';
import '../utils/responsive_utils.dart';
import 'color_scheme.dart';
import 'text_theme.dart';

/// AdaptiveTextStyles provides responsive typography that adapts to different
/// platforms and screen sizes with appropriate font scaling and platform-specific styling.
class AdaptiveTextStyles {
  // Base responsive scaling factors
  static double _getResponsiveScale(BuildContext context) {
    if (ResponsiveUtils.isMobileScreen(context)) {
      return 1.0;
    } else if (ResponsiveUtils.isTabletScreen(context)) {
      return 1.1;
    } else {
      return 1.2;
    }
  }

  // Platform-specific font adjustments
  static double _getPlatformFontAdjustment() {
    if (PlatformDetector.isIOS) {
      return 0.98; // iOS fonts are slightly smaller
    } else if (PlatformDetector.isWeb) {
      return 1.02; // Web fonts need to be slightly larger
    } else {
      return 1.0; // Android baseline
    }
  }

  // Calculate final font size with all adjustments
  static double _calculateFontSize(BuildContext context, double baseSize) {
    return baseSize * _getResponsiveScale(context) * _getPlatformFontAdjustment();
  }

  // Display styles (largest text)
  static TextStyle displayLarge(BuildContext context, {Color? color}) {
    return TextStyle(
      fontSize: _calculateFontSize(context, 40),
      fontWeight: PlatformDetector.isIOS ? FontWeight.w600 : FontWeight.w300,
      color: color ?? _getTextColor(context),
      height: 1.2,
      letterSpacing: PlatformDetector.isIOS ? -0.5 : 0,
      fontFamily: _getFontFamily(),
    );
  }

  static TextStyle displayMedium(BuildContext context, {Color? color}) {
    return TextStyle(
      fontSize: _calculateFontSize(context, 32),
      fontWeight: PlatformDetector.isIOS ? FontWeight.w600 : FontWeight.w400,
      color: color ?? _getTextColor(context),
      height: 1.3,
      letterSpacing: PlatformDetector.isIOS ? -0.3 : 0,
      fontFamily: _getFontFamily(),
    );
  }

  static TextStyle displaySmall(BuildContext context, {Color? color}) {
    return TextStyle(
      fontSize: _calculateFontSize(context, 28),
      fontWeight: FontWeight.w400,
      color: color ?? _getTextColor(context),
      height: 1.3,
      fontFamily: _getFontFamily(),
    );
  }

  // Headline styles
  static TextStyle headlineLarge(BuildContext context, {Color? color}) {
    return TextStyle(
      fontSize: _calculateFontSize(context, 28),
      fontWeight: PlatformDetector.isIOS ? FontWeight.w700 : FontWeight.w500,
      color: color ?? _getTextColor(context),
      height: 1.3,
      fontFamily: _getFontFamily(),
    );
  }

  static TextStyle headlineMedium(BuildContext context, {Color? color}) {
    return TextStyle(
      fontSize: _calculateFontSize(context, 24),
      fontWeight: PlatformDetector.isIOS ? FontWeight.w700 : FontWeight.w500,
      color: color ?? _getTextColor(context),
      height: 1.3,
      fontFamily: _getFontFamily(),
    );
  }

  static TextStyle headlineSmall(BuildContext context, {Color? color}) {
    return TextStyle(
      fontSize: _calculateFontSize(context, 20),
      fontWeight: PlatformDetector.isIOS ? FontWeight.w600 : FontWeight.w500,
      color: color ?? _getTextColor(context),
      height: 1.4,
      fontFamily: _getFontFamily(),
    );
  }

  // Title styles
  static TextStyle titleLarge(BuildContext context, {Color? color}) {
    return TextStyle(
      fontSize: _calculateFontSize(context, 18),
      fontWeight: PlatformDetector.isIOS ? FontWeight.w700 : FontWeight.w600,
      color: color ?? _getTextColor(context),
      height: 1.4,
      fontFamily: _getFontFamily(),
    );
  }

  static TextStyle titleMedium(BuildContext context, {Color? color}) {
    return TextStyle(
      fontSize: _calculateFontSize(context, 16),
      fontWeight: PlatformDetector.isIOS ? FontWeight.w600 : FontWeight.w600,
      color: color ?? _getTextColor(context),
      height: 1.4,
      letterSpacing: 0.15,
      fontFamily: _getFontFamily(),
    );
  }

  static TextStyle titleSmall(BuildContext context, {Color? color}) {
    return TextStyle(
      fontSize: _calculateFontSize(context, 14),
      fontWeight: PlatformDetector.isIOS ? FontWeight.w600 : FontWeight.w600,
      color: color ?? _getTextColor(context),
      height: 1.4,
      letterSpacing: 0.1,
      fontFamily: _getFontFamily(),
    );
  }

  // Body styles
  static TextStyle bodyLarge(BuildContext context, {Color? color}) {
    return TextStyle(
      fontSize: _calculateFontSize(context, 16),
      fontWeight: FontWeight.w400,
      color: color ?? _getTextColor(context),
      height: 1.5,
      letterSpacing: 0.5,
      fontFamily: _getFontFamily(),
    );
  }

  static TextStyle bodyMedium(BuildContext context, {Color? color}) {
    return TextStyle(
      fontSize: _calculateFontSize(context, 14),
      fontWeight: FontWeight.w400,
      color: color ?? _getTextColor(context),
      height: 1.4,
      letterSpacing: 0.25,
      fontFamily: _getFontFamily(),
    );
  }

  static TextStyle bodySmall(BuildContext context, {Color? color}) {
    return TextStyle(
      fontSize: _calculateFontSize(context, 12),
      fontWeight: FontWeight.w400,
      color: color ?? _getSecondaryTextColor(context),
      height: 1.4,
      letterSpacing: 0.4,
      fontFamily: _getFontFamily(),
    );
  }

  // Label styles (for buttons, tabs, etc.)
  static TextStyle labelLarge(BuildContext context, {Color? color}) {
    return TextStyle(
      fontSize: _calculateFontSize(context, 14),
      fontWeight: FontWeight.w500,
      color: color ?? _getTextColor(context),
      height: 1.4,
      letterSpacing: 0.5,
      fontFamily: _getFontFamily(),
    );
  }

  static TextStyle labelMedium(BuildContext context, {Color? color}) {
    return TextStyle(
      fontSize: _calculateFontSize(context, 12),
      fontWeight: FontWeight.w500,
      color: color ?? _getTextColor(context),
      height: 1.3,
      letterSpacing: 0.5,
      fontFamily: _getFontFamily(),
    );
  }

  static TextStyle labelSmall(BuildContext context, {Color? color}) {
    return TextStyle(
      fontSize: _calculateFontSize(context, 10),
      fontWeight: FontWeight.w500,
      color: color ?? _getSecondaryTextColor(context),
      height: 1.3,
      letterSpacing: 0.5,
      fontFamily: _getFontFamily(),
    );
  }

  // Specialized styles for specific use cases

  // Button text
  static TextStyle button(BuildContext context, {Color? color, bool isPrimary = true}) {
    return TextStyle(
      fontSize: _calculateFontSize(context, 14),
      fontWeight: PlatformDetector.isIOS ? FontWeight.w600 : FontWeight.w500,
      color: color ?? (isPrimary ? Colors.white : AdaptiveColors.primary),
      height: 1.4,
      letterSpacing: 0.5,
      fontFamily: _getFontFamily(),
    );
  }

  // Link text
  static TextStyle link(BuildContext context, {Color? color}) {
    return TextStyle(
      fontSize: _calculateFontSize(context, 14),
      fontWeight: FontWeight.w500,
      color: color ?? AdaptiveColors.primary,
      height: 1.4,
      decoration: TextDecoration.underline,
      decorationColor: color ?? AdaptiveColors.primary,
      fontFamily: _getFontFamily(),
    );
  }

  // Caption text
  static TextStyle caption(BuildContext context, {Color? color}) {
    return TextStyle(
      fontSize: _calculateFontSize(context, 11),
      fontWeight: FontWeight.w400,
      color: color ?? _getSecondaryTextColor(context),
      height: 1.3,
      letterSpacing: 0.4,
      fontFamily: _getFontFamily(),
    );
  }

  // Overline text
  static TextStyle overline(BuildContext context, {Color? color}) {
    return TextStyle(
      fontSize: _calculateFontSize(context, 10),
      fontWeight: FontWeight.w500,
      color: color ?? _getSecondaryTextColor(context),
      height: 1.3,
      letterSpacing: 1.0,
      fontFamily: _getFontFamily(),
    );
  }

  // Financial/currency text
  static TextStyle currency(BuildContext context, {Color? color, bool isLarge = false}) {
    return TextStyle(
      fontSize: _calculateFontSize(context, isLarge ? 24 : 18),
      fontWeight: FontWeight.w600,
      color: color ?? _getTextColor(context),
      height: 1.2,
      fontFamily: 'Roboto Mono', // Monospace for better number alignment
    );
  }

  // Percentage text
  static TextStyle percentage(BuildContext context, {Color? color, bool isPositive = true}) {
    return TextStyle(
      fontSize: _calculateFontSize(context, 14),
      fontWeight: FontWeight.w500,
      color: color ?? (isPositive ? AdaptiveColors.success : AdaptiveColors.error),
      height: 1.4,
      fontFamily: 'Roboto Mono',
    );
  }

  // Form input text
  static TextStyle input(BuildContext context, {Color? color, bool isEnabled = true}) {
    return TextStyle(
      fontSize: _calculateFontSize(context, 16),
      fontWeight: FontWeight.w400,
      color: isEnabled 
          ? (color ?? _getTextColor(context))
          : _getDisabledTextColor(context),
      height: 1.4,
      fontFamily: _getFontFamily(),
    );
  }

  // Error text
  static TextStyle error(BuildContext context) {
    return TextStyle(
      fontSize: _calculateFontSize(context, 12),
      fontWeight: FontWeight.w500,
      color: AdaptiveColors.error,
      height: 1.3,
      fontFamily: _getFontFamily(),
    );
  }

  // Success text
  static TextStyle success(BuildContext context) {
    return TextStyle(
      fontSize: _calculateFontSize(context, 12),
      fontWeight: FontWeight.w500,
      color: AdaptiveColors.success,
      height: 1.3,
      fontFamily: _getFontFamily(),
    );
  }

  // Helper methods
  static String _getFontFamily() {
    if (PlatformDetector.isIOS) {
      return '-apple-system'; // Use system font on iOS
    } else {
      return AdaptiveTextTheme.primaryFontFamily;
    }
  }

  static Color _getTextColor(BuildContext context) {
    if (PlatformDetector.isIOS) {
      return CupertinoColors.label.resolveFrom(context);
    } else {
      final brightness = Theme.of(context).brightness;
      return brightness == Brightness.light
          ? AdaptiveColors.onSurface
          : AdaptiveColors.onSurfaceDark;
    }
  }

  static Color _getSecondaryTextColor(BuildContext context) {
    if (PlatformDetector.isIOS) {
      return CupertinoColors.secondaryLabel.resolveFrom(context);
    } else {
      final brightness = Theme.of(context).brightness;
      return brightness == Brightness.light
          ? AdaptiveColors.onSurfaceVariant
          : AdaptiveColors.onSurfaceVariantDark;
    }
  }

  static Color _getDisabledTextColor(BuildContext context) {
    if (PlatformDetector.isIOS) {
      return CupertinoColors.inactiveGray.resolveFrom(context);
    } else {
      return AdaptiveColors.neutral400;
    }
  }

  // Accessibility helpers
  static TextStyle withAccessibility(
    BuildContext context,
    TextStyle baseStyle, {
    bool largeText = false,
    bool highContrast = false,
  }) {
    final mediaQuery = MediaQuery.of(context);
    final textScale = mediaQuery.textScaler.scale(1.0);
    
    TextStyle style = baseStyle;
    
    // Apply text scaling for accessibility
    if (textScale > 1.0) {
      style = style.copyWith(
        fontSize: (style.fontSize ?? 14) * textScale.clamp(1.0, 2.0),
      );
    }
    
    // Apply high contrast if needed
    if (highContrast || mediaQuery.accessibleNavigation) {
      style = style.copyWith(
        fontWeight: FontWeight.values[
          (style.fontWeight?.index ?? 3).clamp(4, 8) // Make text bolder
        ],
      );
    }
    
    return style;
  }

  // Theme-aware text styles that automatically adapt to light/dark mode
  static TextStyle adaptive(
    BuildContext context, {
    required double fontSize,
    FontWeight? fontWeight,
    Color? lightColor,
    Color? darkColor,
    double? height,
    double? letterSpacing,
  }) {
    final brightness = Theme.of(context).brightness;
    final color = brightness == Brightness.light
        ? lightColor ?? _getTextColor(context)
        : darkColor ?? _getTextColor(context);

    return TextStyle(
      fontSize: _calculateFontSize(context, fontSize),
      fontWeight: fontWeight ?? FontWeight.w400,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: _getFontFamily(),
    );
  }
}

/// Extension for easy text styling
extension AdaptiveTextStyleExtension on Text {
  Text adaptiveStyle(BuildContext context, TextStyle style) {
    return Text(
      data ?? '',
      style: AdaptiveTextStyles.withAccessibility(context, style),
      textAlign: textAlign,
      textDirection: textDirection,
      overflow: overflow,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
    );
  }

  // Quick style applications
  Text displayLarge(BuildContext context, {Color? color}) =>
      adaptiveStyle(context, AdaptiveTextStyles.displayLarge(context, color: color));

  Text headlineMedium(BuildContext context, {Color? color}) =>
      adaptiveStyle(context, AdaptiveTextStyles.headlineMedium(context, color: color));

  Text titleLarge(BuildContext context, {Color? color}) =>
      adaptiveStyle(context, AdaptiveTextStyles.titleLarge(context, color: color));

  Text bodyMedium(BuildContext context, {Color? color}) =>
      adaptiveStyle(context, AdaptiveTextStyles.bodyMedium(context, color: color));

  Text labelMedium(BuildContext context, {Color? color}) =>
      adaptiveStyle(context, AdaptiveTextStyles.labelMedium(context, color: color));
}

/// Widget for displaying responsive text with automatic styling
class AdaptiveText extends StatelessWidget {
  final String text;
  final AdaptiveTextType type;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final bool? softWrap;

  const AdaptiveText(
    this.text, {
    Key? key,
    this.type = AdaptiveTextType.body,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.softWrap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle style;
    
    switch (type) {
      case AdaptiveTextType.displayLarge:
        style = AdaptiveTextStyles.displayLarge(context, color: color);
        break;
      case AdaptiveTextType.displayMedium:
        style = AdaptiveTextStyles.displayMedium(context, color: color);
        break;
      case AdaptiveTextType.headlineLarge:
        style = AdaptiveTextStyles.headlineLarge(context, color: color);
        break;
      case AdaptiveTextType.headlineMedium:
        style = AdaptiveTextStyles.headlineMedium(context, color: color);
        break;
      case AdaptiveTextType.titleLarge:
        style = AdaptiveTextStyles.titleLarge(context, color: color);
        break;
      case AdaptiveTextType.titleMedium:
        style = AdaptiveTextStyles.titleMedium(context, color: color);
        break;
      case AdaptiveTextType.body:
        style = AdaptiveTextStyles.bodyMedium(context, color: color);
        break;
      case AdaptiveTextType.bodySmall:
        style = AdaptiveTextStyles.bodySmall(context, color: color);
        break;
      case AdaptiveTextType.label:
        style = AdaptiveTextStyles.labelMedium(context, color: color);
        break;
      case AdaptiveTextType.caption:
        style = AdaptiveTextStyles.caption(context, color: color);
        break;
    }

    return Text(
      text,
      style: AdaptiveTextStyles.withAccessibility(context, style),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
    );
  }
}

enum AdaptiveTextType {
  displayLarge,
  displayMedium,
  headlineLarge,
  headlineMedium,
  titleLarge,
  titleMedium,
  body,
  bodySmall,
  label,
  caption,
}