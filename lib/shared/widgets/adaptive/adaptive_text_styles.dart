import 'package:flutter/material.dart';
import '../../../core/utils/responsive_utils.dart';

/// Adaptive text styles that adjust based on platform and screen size
class AdaptiveTextStyles {
  /// Display large text style
  static TextStyle displayLarge(BuildContext context) {
    return Theme.of(context).textTheme.displayLarge?.copyWith(
      fontSize: _getAdaptiveFontSize(context, 57.0),
    ) ?? _fallbackDisplayLarge(context);
  }
  
  /// Display medium text style
  static TextStyle displayMedium(BuildContext context) {
    return Theme.of(context).textTheme.displayMedium?.copyWith(
      fontSize: _getAdaptiveFontSize(context, 45.0),
    ) ?? _fallbackDisplayMedium(context);
  }
  
  /// Display small text style
  static TextStyle displaySmall(BuildContext context) {
    return Theme.of(context).textTheme.displaySmall?.copyWith(
      fontSize: _getAdaptiveFontSize(context, 36.0),
    ) ?? _fallbackDisplaySmall(context);
  }
  
  /// Headline large text style
  static TextStyle headlineLarge(BuildContext context) {
    return Theme.of(context).textTheme.headlineLarge?.copyWith(
      fontSize: _getAdaptiveFontSize(context, 32.0),
    ) ?? _fallbackHeadlineLarge(context);
  }
  
  /// Headline medium text style
  static TextStyle headlineMedium(BuildContext context) {
    return Theme.of(context).textTheme.headlineMedium?.copyWith(
      fontSize: _getAdaptiveFontSize(context, 28.0),
    ) ?? _fallbackHeadlineMedium(context);
  }
  
  /// Headline small text style
  static TextStyle headlineSmall(BuildContext context) {
    return Theme.of(context).textTheme.headlineSmall?.copyWith(
      fontSize: _getAdaptiveFontSize(context, 24.0),
    ) ?? _fallbackHeadlineSmall(context);
  }
  
  /// Title large text style
  static TextStyle titleLarge(BuildContext context) {
    return Theme.of(context).textTheme.titleLarge?.copyWith(
      fontSize: _getAdaptiveFontSize(context, 22.0),
    ) ?? _fallbackTitleLarge(context);
  }
  
  /// Title medium text style
  static TextStyle titleMedium(BuildContext context) {
    return Theme.of(context).textTheme.titleMedium?.copyWith(
      fontSize: _getAdaptiveFontSize(context, 16.0),
      fontWeight: FontWeight.w500,
    ) ?? _fallbackTitleMedium(context);
  }
  
  /// Title small text style
  static TextStyle titleSmall(BuildContext context) {
    return Theme.of(context).textTheme.titleSmall?.copyWith(
      fontSize: _getAdaptiveFontSize(context, 14.0),
      fontWeight: FontWeight.w500,
    ) ?? _fallbackTitleSmall(context);
  }
  
  /// Body large text style
  static TextStyle bodyLarge(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge?.copyWith(
      fontSize: _getAdaptiveFontSize(context, 16.0),
    ) ?? _fallbackBodyLarge(context);
  }
  
  /// Body medium text style
  static TextStyle bodyMedium(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium?.copyWith(
      fontSize: _getAdaptiveFontSize(context, 14.0),
    ) ?? _fallbackBodyMedium(context);
  }
  
  /// Body small text style
  static TextStyle bodySmall(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall?.copyWith(
      fontSize: _getAdaptiveFontSize(context, 12.0),
    ) ?? _fallbackBodySmall(context);
  }
  
  /// Label large text style
  static TextStyle labelLarge(BuildContext context) {
    return Theme.of(context).textTheme.labelLarge?.copyWith(
      fontSize: _getAdaptiveFontSize(context, 14.0),
      fontWeight: FontWeight.w500,
    ) ?? _fallbackLabelLarge(context);
  }
  
  /// Label medium text style
  static TextStyle labelMedium(BuildContext context) {
    return Theme.of(context).textTheme.labelMedium?.copyWith(
      fontSize: _getAdaptiveFontSize(context, 12.0),
      fontWeight: FontWeight.w500,
    ) ?? _fallbackLabelMedium(context);
  }
  
  /// Label small text style
  static TextStyle labelSmall(BuildContext context) {
    return Theme.of(context).textTheme.labelSmall?.copyWith(
      fontSize: _getAdaptiveFontSize(context, 11.0),
      fontWeight: FontWeight.w500,
    ) ?? _fallbackLabelSmall(context);
  }
  
  /// Get adaptive font size based on screen size
  static double _getAdaptiveFontSize(BuildContext context, double baseSize) {
    if (ResponsiveUtils.isMobileScreen(context)) {
      return baseSize;
    } else if (ResponsiveUtils.isTabletScreen(context)) {
      return baseSize * 1.1;
    } else if (ResponsiveUtils.isLargeDesktopScreen(context)) {
      return baseSize * 1.3;
    } else {
      return baseSize * 1.2;
    }
  }
  
  // Fallback styles
  static TextStyle _fallbackDisplayLarge(BuildContext context) {
    return TextStyle(
      fontSize: _getAdaptiveFontSize(context, 57.0),
      fontWeight: FontWeight.w400,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }
  
  static TextStyle _fallbackDisplayMedium(BuildContext context) {
    return TextStyle(
      fontSize: _getAdaptiveFontSize(context, 45.0),
      fontWeight: FontWeight.w400,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }
  
  static TextStyle _fallbackDisplaySmall(BuildContext context) {
    return TextStyle(
      fontSize: _getAdaptiveFontSize(context, 36.0),
      fontWeight: FontWeight.w400,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }
  
  static TextStyle _fallbackHeadlineLarge(BuildContext context) {
    return TextStyle(
      fontSize: _getAdaptiveFontSize(context, 32.0),
      fontWeight: FontWeight.w400,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }
  
  static TextStyle _fallbackHeadlineMedium(BuildContext context) {
    return TextStyle(
      fontSize: _getAdaptiveFontSize(context, 28.0),
      fontWeight: FontWeight.w400,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }
  
  static TextStyle _fallbackHeadlineSmall(BuildContext context) {
    return TextStyle(
      fontSize: _getAdaptiveFontSize(context, 24.0),
      fontWeight: FontWeight.w400,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }
  
  static TextStyle _fallbackTitleLarge(BuildContext context) {
    return TextStyle(
      fontSize: _getAdaptiveFontSize(context, 22.0),
      fontWeight: FontWeight.w400,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }
  
  static TextStyle _fallbackTitleMedium(BuildContext context) {
    return TextStyle(
      fontSize: _getAdaptiveFontSize(context, 16.0),
      fontWeight: FontWeight.w500,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }
  
  static TextStyle _fallbackTitleSmall(BuildContext context) {
    return TextStyle(
      fontSize: _getAdaptiveFontSize(context, 14.0),
      fontWeight: FontWeight.w500,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }
  
  static TextStyle _fallbackBodyLarge(BuildContext context) {
    return TextStyle(
      fontSize: _getAdaptiveFontSize(context, 16.0),
      fontWeight: FontWeight.w400,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }
  
  static TextStyle _fallbackBodyMedium(BuildContext context) {
    return TextStyle(
      fontSize: _getAdaptiveFontSize(context, 14.0),
      fontWeight: FontWeight.w400,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }
  
  static TextStyle _fallbackBodySmall(BuildContext context) {
    return TextStyle(
      fontSize: _getAdaptiveFontSize(context, 12.0),
      fontWeight: FontWeight.w400,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }
  
  static TextStyle _fallbackLabelLarge(BuildContext context) {
    return TextStyle(
      fontSize: _getAdaptiveFontSize(context, 14.0),
      fontWeight: FontWeight.w500,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }
  
  static TextStyle _fallbackLabelMedium(BuildContext context) {
    return TextStyle(
      fontSize: _getAdaptiveFontSize(context, 12.0),
      fontWeight: FontWeight.w500,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }
  
  static TextStyle _fallbackLabelSmall(BuildContext context) {
    return TextStyle(
      fontSize: _getAdaptiveFontSize(context, 11.0),
      fontWeight: FontWeight.w500,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }
}

/// Extension for convenient text styling
extension AdaptiveTextStyleExtension on Text {
  /// Apply adaptive display large style
  Text displayLarge(BuildContext context) {
    return Text(
      data ?? '',
      style: style?.merge(AdaptiveTextStyles.displayLarge(context)) ?? 
             AdaptiveTextStyles.displayLarge(context),
    );
  }
  
  /// Apply adaptive title medium style
  Text titleMedium(BuildContext context) {
    return Text(
      data ?? '',
      style: style?.merge(AdaptiveTextStyles.titleMedium(context)) ?? 
             AdaptiveTextStyles.titleMedium(context),
    );
  }
  
  /// Apply adaptive body medium style
  Text bodyMedium(BuildContext context) {
    return Text(
      data ?? '',
      style: style?.merge(AdaptiveTextStyles.bodyMedium(context)) ?? 
             AdaptiveTextStyles.bodyMedium(context),
    );
  }
}