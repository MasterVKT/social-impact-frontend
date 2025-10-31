import 'package:flutter/widgets.dart';
import '../../constants/spacing.dart';
import '../../../core/utils/platform_detector.dart';

/// Adaptive spacing widgets that adjust based on platform and screen size
class AdaptiveSpacing {
  /// Extra small vertical spacing (4dp)
  static Widget verticalXSmall() => const SizedBox(height: Spacing.xs);
  
  /// Small vertical spacing (8dp)
  static Widget verticalSmall() => const SizedBox(height: Spacing.sm);
  
  /// Medium vertical spacing (16dp)
  static Widget verticalMedium() => const SizedBox(height: Spacing.md);
  
  /// Large vertical spacing (24dp)
  static Widget verticalLarge() => const SizedBox(height: Spacing.lg);
  
  /// Extra large vertical spacing (32dp)
  static Widget verticalExtraLarge() => const SizedBox(height: Spacing.xl);
  
  /// Extra extra large vertical spacing (48dp)
  static Widget verticalXXLarge() => const SizedBox(height: Spacing.xxl);
  
  /// Extra small horizontal spacing (4dp)
  static Widget horizontalXSmall() => const SizedBox(width: Spacing.xs);
  
  /// Small horizontal spacing (8dp)
  static Widget horizontalSmall() => const SizedBox(width: Spacing.sm);
  
  /// Medium horizontal spacing (16dp)
  static Widget horizontalMedium() => const SizedBox(width: Spacing.md);
  
  /// Large horizontal spacing (24dp)
  static Widget horizontalLarge() => const SizedBox(width: Spacing.lg);
  
  /// Extra large horizontal spacing (32dp)
  static Widget horizontalExtraLarge() => const SizedBox(width: Spacing.xl);
  
  /// Extra extra large horizontal spacing (48dp)
  static Widget horizontalXXLarge() => const SizedBox(width: Spacing.xxl);
  
  /// Adaptive vertical spacing based on platform
  /// Mobile: small, Tablet: medium, Desktop: large
  static Widget adaptiveVertical() {
    if (PlatformDetector.isMobile) {
      return verticalSmall();
    } else if (PlatformDetector.isWeb) {
      return verticalLarge();
    } else {
      return verticalMedium();
    }
  }
  
  /// Adaptive horizontal spacing based on platform
  /// Mobile: small, Tablet: medium, Desktop: large
  static Widget adaptiveHorizontal() {
    if (PlatformDetector.isMobile) {
      return horizontalSmall();
    } else if (PlatformDetector.isWeb) {
      return horizontalLarge();
    } else {
      return horizontalMedium();
    }
  }
}

/// Extension for easier spacing access
extension SpacingExtension on Widget {
  /// Add vertical spacing after this widget
  Widget withVerticalSpacing(double height) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        this,
        SizedBox(height: height),
      ],
    );
  }
  
  /// Add horizontal spacing after this widget
  Widget withHorizontalSpacing(double width) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        this,
        SizedBox(width: width),
      ],
    );
  }
}