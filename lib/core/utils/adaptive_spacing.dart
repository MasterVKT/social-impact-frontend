import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'platform_detector.dart';
import 'responsive_utils.dart';

/// AdaptiveSpacing provides consistent spacing values across all platforms
/// with responsive scaling and platform-specific adjustments for optimal visual harmony.
class AdaptiveSpacing {
  // Base spacing values following 8dp grid system
  static const double _baseUnit = 8.0;
  
  // Platform-specific multipliers
  static double get _platformMultiplier {
    if (PlatformDetector.isIOS) {
      return 1.0; // iOS uses standard spacing
    } else if (PlatformDetector.isWeb) {
      return 1.2; // Web needs slightly more generous spacing
    } else {
      return 1.0; // Android uses standard spacing
    }
  }

  // Spacing scale (following Material Design spacing)
  static double get xs => _baseUnit * 0.5 * _platformMultiplier; // 4dp
  static double get sm => _baseUnit * 1.0 * _platformMultiplier; // 8dp
  static double get md => _baseUnit * 2.0 * _platformMultiplier; // 16dp
  static double get lg => _baseUnit * 3.0 * _platformMultiplier; // 24dp
  static double get xl => _baseUnit * 4.0 * _platformMultiplier; // 32dp
  static double get xxl => _baseUnit * 5.0 * _platformMultiplier; // 40dp
  static double get xxxl => _baseUnit * 6.0 * _platformMultiplier; // 48dp

  // Semantic spacing names
  static double get extraSmall => xs;
  static double get small => sm;
  static double get medium => md;
  static double get large => lg;
  static double get extraLarge => xl;
  static double get extraExtraLarge => xxl;
  static double get massive => xxxl;

  // Context-aware spacing
  static double responsive(BuildContext context, {
    double mobile = 16.0,
    double tablet = 24.0,
    double desktop = 32.0,
  }) {
    if (ResponsiveUtils.isMobileScreen(context)) {
      return mobile * _platformMultiplier;
    } else if (ResponsiveUtils.isTabletScreen(context)) {
      return tablet * _platformMultiplier;
    } else {
      return desktop * _platformMultiplier;
    }
  }

  // Component-specific spacing
  static double cardPadding(BuildContext context) {
    return responsive(context, mobile: md, tablet: lg, desktop: lg);
  }

  static double cardMargin(BuildContext context) {
    return responsive(context, mobile: sm, tablet: md, desktop: md);
  }

  static double buttonPadding(BuildContext context) {
    return responsive(context, mobile: md, tablet: md, desktop: lg);
  }

  static double inputPadding(BuildContext context) {
    return responsive(context, mobile: md, tablet: lg, desktop: lg);
  }

  static double sectionSpacing(BuildContext context) {
    return responsive(context, mobile: lg, tablet: xl, desktop: xxl);
  }

  static double listItemSpacing(BuildContext context) {
    return responsive(context, mobile: sm, tablet: md, desktop: md);
  }

  // Layout spacing
  static double pageHorizontal(BuildContext context) {
    return responsive(context, mobile: md, tablet: lg, desktop: xl);
  }

  static double pageVertical(BuildContext context) {
    return responsive(context, mobile: md, tablet: lg, desktop: lg);
  }

  static double contentMaxWidth(BuildContext context) {
    if (ResponsiveUtils.isMobileScreen(context)) {
      return double.infinity;
    } else if (ResponsiveUtils.isTabletScreen(context)) {
      return 768.0;
    } else {
      return 1200.0;
    }
  }

  // Navigation spacing
  static double navigationPadding(BuildContext context) {
    return responsive(context, mobile: sm, tablet: md, desktop: md);
  }

  static double navigationItemSpacing(BuildContext context) {
    return responsive(context, mobile: xs, tablet: sm, desktop: sm);
  }

  // Grid spacing
  static double gridSpacing(BuildContext context) {
    return responsive(context, mobile: sm, tablet: md, desktop: md);
  }

  static double gridRunSpacing(BuildContext context) {
    return responsive(context, mobile: sm, tablet: md, desktop: md);
  }

  // Form spacing
  static double formFieldSpacing(BuildContext context) {
    return responsive(context, mobile: md, tablet: lg, desktop: lg);
  }

  static double formSectionSpacing(BuildContext context) {
    return responsive(context, mobile: lg, tablet: xl, desktop: xl);
  }
}

/// AdaptiveInsets provides platform-aware EdgeInsets with responsive sizing
class AdaptiveInsets {
  // Symmetric insets
  static EdgeInsets all(double value) => EdgeInsets.all(value * AdaptiveSpacing._platformMultiplier);
  static EdgeInsets symmetric({double vertical = 0.0, double horizontal = 0.0}) => 
      EdgeInsets.symmetric(
        vertical: vertical * AdaptiveSpacing._platformMultiplier,
        horizontal: horizontal * AdaptiveSpacing._platformMultiplier,
      );

  // Directional insets
  static EdgeInsets only({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) => EdgeInsets.only(
    left: left * AdaptiveSpacing._platformMultiplier,
    top: top * AdaptiveSpacing._platformMultiplier,
    right: right * AdaptiveSpacing._platformMultiplier,
    bottom: bottom * AdaptiveSpacing._platformMultiplier,
  );

  // Predefined common insets
  static EdgeInsets get none => EdgeInsets.zero;
  static EdgeInsets get xs => all(AdaptiveSpacing.xs);
  static EdgeInsets get sm => all(AdaptiveSpacing.sm);
  static EdgeInsets get md => all(AdaptiveSpacing.md);
  static EdgeInsets get lg => all(AdaptiveSpacing.lg);
  static EdgeInsets get xl => all(AdaptiveSpacing.xl);
  static EdgeInsets get xxl => all(AdaptiveSpacing.xxl);

  // Responsive insets
  static EdgeInsets responsive(BuildContext context, {
    double mobile = 16.0,
    double tablet = 24.0,
    double desktop = 32.0,
  }) {
    final spacing = AdaptiveSpacing.responsive(
      context,
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
    );
    return EdgeInsets.all(spacing);
  }

  // Component-specific insets
  static EdgeInsets card(BuildContext context) => responsive(
    context,
    mobile: AdaptiveSpacing.md,
    tablet: AdaptiveSpacing.lg,
    desktop: AdaptiveSpacing.lg,
  );

  static EdgeInsets button(BuildContext context) => EdgeInsets.symmetric(
    horizontal: AdaptiveSpacing.buttonPadding(context),
    vertical: AdaptiveSpacing.buttonPadding(context) * 0.75,
  );

  static EdgeInsets input(BuildContext context) => EdgeInsets.symmetric(
    horizontal: AdaptiveSpacing.inputPadding(context),
    vertical: AdaptiveSpacing.inputPadding(context) * 0.75,
  );

  static EdgeInsets page(BuildContext context) => EdgeInsets.symmetric(
    horizontal: AdaptiveSpacing.pageHorizontal(context),
    vertical: AdaptiveSpacing.pageVertical(context),
  );

  static EdgeInsets section(BuildContext context) => EdgeInsets.only(
    bottom: AdaptiveSpacing.sectionSpacing(context),
  );

  // Safe area insets with adaptive adjustments
  static EdgeInsets safeArea(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final platformMultiplier = AdaptiveSpacing._platformMultiplier;
    
    return EdgeInsets.only(
      top: mediaQuery.padding.top * platformMultiplier,
      bottom: mediaQuery.padding.bottom * platformMultiplier,
      left: mediaQuery.padding.left * platformMultiplier,
      right: mediaQuery.padding.right * platformMultiplier,
    );
  }
}

/// AdaptiveSizedBox provides responsive spacing widgets
class AdaptiveSizedBox {
  // Horizontal spacing
  static Widget get horizontalXS => SizedBox(width: AdaptiveSpacing.xs);
  static Widget get horizontalSM => SizedBox(width: AdaptiveSpacing.sm);
  static Widget get horizontalMD => SizedBox(width: AdaptiveSpacing.md);
  static Widget get horizontalLG => SizedBox(width: AdaptiveSpacing.lg);
  static Widget get horizontalXL => SizedBox(width: AdaptiveSpacing.xl);
  static Widget get horizontalXXL => SizedBox(width: AdaptiveSpacing.xxl);

  // Vertical spacing
  static Widget get verticalXS => SizedBox(height: AdaptiveSpacing.xs);
  static Widget get verticalSM => SizedBox(height: AdaptiveSpacing.sm);
  static Widget get verticalMD => SizedBox(height: AdaptiveSpacing.md);
  static Widget get verticalLG => SizedBox(height: AdaptiveSpacing.lg);
  static Widget get verticalXL => SizedBox(height: AdaptiveSpacing.xl);
  static Widget get verticalXXL => SizedBox(height: AdaptiveSpacing.xxl);

  // Custom spacing
  static Widget horizontal(double width) => SizedBox(width: width * AdaptiveSpacing._platformMultiplier);
  static Widget vertical(double height) => SizedBox(height: height * AdaptiveSpacing._platformMultiplier);

  // Responsive spacing
  static Widget responsiveHorizontal(BuildContext context, {
    double mobile = 16.0,
    double tablet = 24.0,
    double desktop = 32.0,
  }) {
    final spacing = AdaptiveSpacing.responsive(
      context,
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
    );
    return SizedBox(width: spacing);
  }

  static Widget responsiveVertical(BuildContext context, {
    double mobile = 16.0,
    double tablet = 24.0,
    double desktop = 32.0,
  }) {
    final spacing = AdaptiveSpacing.responsive(
      context,
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
    );
    return SizedBox(height: spacing);
  }

  // Context-specific spacing
  static Widget formFieldSpacing(BuildContext context) => 
      SizedBox(height: AdaptiveSpacing.formFieldSpacing(context));

  static Widget sectionSpacing(BuildContext context) => 
      SizedBox(height: AdaptiveSpacing.sectionSpacing(context));

  static Widget listItemSpacing(BuildContext context) => 
      SizedBox(height: AdaptiveSpacing.listItemSpacing(context));
}

/// AdaptiveDivider provides platform-appropriate dividers with proper spacing
class AdaptiveDivider extends StatelessWidget {
  final double? height;
  final double? thickness;
  final double? indent;
  final double? endIndent;
  final Color? color;

  const AdaptiveDivider({
    Key? key,
    this.height,
    this.thickness,
    this.indent,
    this.endIndent,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (PlatformDetector.isIOS) {
      return Container(
        height: height ?? 1.0,
        margin: EdgeInsets.only(
          left: indent ?? 0,
          right: endIndent ?? 0,
        ),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: color ?? CupertinoColors.separator.resolveFrom(context),
              width: thickness ?? 0.5,
            ),
          ),
        ),
      );
    } else {
      return Divider(
        height: height,
        thickness: thickness,
        indent: indent,
        endIndent: endIndent,
        color: color,
      );
    }
  }
}

/// Extensions for convenient spacing usage
extension AdaptiveSpacingExtension on num {
  // Convert to adaptive spacing
  double get adaptiveSpacing => this * AdaptiveSpacing._platformMultiplier;
  
  // Create sized boxes
  Widget get verticalSpace => SizedBox(height: adaptiveSpacing);
  Widget get horizontalSpace => SizedBox(width: adaptiveSpacing);
  
  // Create insets
  EdgeInsets get allInsets => EdgeInsets.all(adaptiveSpacing);
  EdgeInsets get horizontalInsets => EdgeInsets.symmetric(horizontal: adaptiveSpacing);
  EdgeInsets get verticalInsets => EdgeInsets.symmetric(vertical: adaptiveSpacing);
  EdgeInsets get topInset => EdgeInsets.only(top: adaptiveSpacing);
  EdgeInsets get bottomInset => EdgeInsets.only(bottom: adaptiveSpacing);
  EdgeInsets get leftInset => EdgeInsets.only(left: adaptiveSpacing);
  EdgeInsets get rightInset => EdgeInsets.only(right: adaptiveSpacing);
}

/// Widget extension for adding spacing
extension WidgetSpacingExtension on Widget {
  // Add padding
  Widget paddingAll(double value) => Padding(
    padding: AdaptiveInsets.all(value),
    child: this,
  );

  Widget paddingSymmetric({double vertical = 0.0, double horizontal = 0.0}) => Padding(
    padding: AdaptiveInsets.symmetric(vertical: vertical, horizontal: horizontal),
    child: this,
  );

  Widget paddingOnly({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) => Padding(
    padding: AdaptiveInsets.only(left: left, top: top, right: right, bottom: bottom),
    child: this,
  );

  // Responsive padding
  Widget paddingResponsive(BuildContext context, {
    double mobile = 16.0,
    double tablet = 24.0,
    double desktop = 32.0,
  }) => Padding(
    padding: AdaptiveInsets.responsive(context, mobile: mobile, tablet: tablet, desktop: desktop),
    child: this,
  );

  // Context-specific padding
  Widget paddingCard(BuildContext context) => Padding(
    padding: AdaptiveInsets.card(context),
    child: this,
  );

  Widget paddingPage(BuildContext context) => Padding(
    padding: AdaptiveInsets.page(context),
    child: this,
  );
}