import 'package:flutter/material.dart';

/// Spacing constants for consistent design system
/// Using 8dp grid system following Material Design guidelines
class Spacing {
  /// Extra extra small spacing (2dp)
  static const double xxs = 2.0;

  /// Extra small spacing (4dp)
  static const double xs = 4.0;

  /// Small spacing (8dp)
  static const double sm = 8.0;

  /// Medium spacing (16dp)
  static const double md = 16.0;

  /// Large spacing (24dp)
  static const double lg = 24.0;

  /// Extra large spacing (32dp)
  static const double xl = 32.0;

  /// Extra extra large spacing (48dp)
  static const double xxl = 48.0;
}

/// Edge insets using spacing constants
class SpacingInsets {
  /// All sides extra small
  static const EdgeInsets xs = EdgeInsets.all(Spacing.xs);

  /// All sides small
  static const EdgeInsets sm = EdgeInsets.all(Spacing.sm);

  /// All sides medium
  static const EdgeInsets md = EdgeInsets.all(Spacing.md);

  /// All sides large
  static const EdgeInsets lg = EdgeInsets.all(Spacing.lg);

  /// All sides extra large
  static const EdgeInsets xl = EdgeInsets.all(Spacing.xl);

  /// All sides extra extra large
  static const EdgeInsets xxl = EdgeInsets.all(Spacing.xxl);

  /// Horizontal only
  static const EdgeInsets horizontalSm =
      EdgeInsets.symmetric(horizontal: Spacing.sm);
  static const EdgeInsets horizontalMd =
      EdgeInsets.symmetric(horizontal: Spacing.md);
  static const EdgeInsets horizontalLg =
      EdgeInsets.symmetric(horizontal: Spacing.lg);

  /// Vertical only
  static const EdgeInsets verticalSm =
      EdgeInsets.symmetric(vertical: Spacing.sm);
  static const EdgeInsets verticalMd =
      EdgeInsets.symmetric(vertical: Spacing.md);
  static const EdgeInsets verticalLg =
      EdgeInsets.symmetric(vertical: Spacing.lg);
}
