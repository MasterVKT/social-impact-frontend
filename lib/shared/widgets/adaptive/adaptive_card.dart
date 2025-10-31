import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/platform_detector.dart';
import '../../../core/utils/responsive_utils.dart';
import '../../../core/themes/color_scheme.dart';

/// AdaptiveCard provides platform-aware card styling with Material Design for Android/Web
/// and iOS-appropriate styling with responsive sizing and proper elevation handling.
class AdaptiveCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderWidth;
  final BorderRadius? borderRadius;
  final List<BoxShadow>? boxShadow;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final bool enabled;
  final CardSize size;
  final CardElevation elevation;
  final bool useAdaptiveSpacing;
  final Widget? header;
  final Widget? footer;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;

  const AdaptiveCard({
    Key? key,
    required this.child,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
    this.boxShadow,
    this.onTap,
    this.onLongPress,
    this.enabled = true,
    this.size = CardSize.medium,
    this.elevation = CardElevation.low,
    this.useAdaptiveSpacing = true,
    this.header,
    this.footer,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.min,
  }) : super(key: key);

  /// Named constructor for project cards
  const AdaptiveCard.project({
    Key? key,
    required this.child,
    this.width,
    this.height,
    this.onTap,
    this.enabled = true,
    this.header,
    this.footer,
  })  : padding = null,
        margin = null,
        backgroundColor = null,
        borderColor = null,
        borderWidth = null,
        borderRadius = null,
        boxShadow = null,
        onLongPress = null,
        size = CardSize.large,
        elevation = CardElevation.medium,
        useAdaptiveSpacing = true,
        crossAxisAlignment = CrossAxisAlignment.stretch,
        mainAxisAlignment = MainAxisAlignment.start,
        mainAxisSize = MainAxisSize.min,
        super(key: key);

  /// Named constructor for dashboard widgets
  const AdaptiveCard.dashboard({
    Key? key,
    required this.child,
    this.width,
    this.height,
    this.onTap,
    this.enabled = true,
  })  : padding = null,
        margin = null,
        backgroundColor = null,
        borderColor = null,
        borderWidth = null,
        borderRadius = null,
        boxShadow = null,
        onLongPress = null,
        size = CardSize.medium,
        elevation = CardElevation.low,
        useAdaptiveSpacing = true,
        header = null,
        footer = null,
        crossAxisAlignment = CrossAxisAlignment.center,
        mainAxisAlignment = MainAxisAlignment.center,
        mainAxisSize = MainAxisSize.min,
        super(key: key);

  /// Named constructor for list items
  const AdaptiveCard.listItem({
    Key? key,
    required this.child,
    this.onTap,
    this.onLongPress,
    this.enabled = true,
  })  : padding = null,
        margin = null,
        width = null,
        height = null,
        backgroundColor = null,
        borderColor = null,
        borderWidth = null,
        borderRadius = null,
        boxShadow = null,
        size = CardSize.small,
        elevation = CardElevation.minimal,
        useAdaptiveSpacing = true,
        header = null,
        footer = null,
        crossAxisAlignment = CrossAxisAlignment.start,
        mainAxisAlignment = MainAxisAlignment.start,
        mainAxisSize = MainAxisSize.min,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (PlatformDetector.isIOS) {
      return _buildIOSCard(context);
    } else {
      return _buildMaterialCard(context);
    }
  }

  Widget _buildIOSCard(BuildContext context) {
    final card = Container(
      width: width,
      height: height,
      margin: _getMargin(context),
      padding: _getPadding(context),
      decoration: BoxDecoration(
        color: _getBackgroundColor(context),
        borderRadius: _getBorderRadius(context),
        border: _getBorder(context),
        boxShadow: _getIOSShadow(context),
      ),
      child: _buildCardContent(context),
    );

    return _wrapWithInteraction(context, card);
  }

  Widget _buildMaterialCard(BuildContext context) {
    final card = Card(
      elevation: _getMaterialElevation(),
      color: _getBackgroundColor(context),
      shape: RoundedRectangleBorder(
        borderRadius: _getBorderRadius(context),
        side: _getBorderSide(context),
      ),
      margin: _getMargin(context),
      child: Container(
        width: width,
        height: height,
        padding: _getPadding(context),
        child: _buildCardContent(context),
      ),
    );

    return _wrapWithInteraction(context, card);
  }

  Widget _buildCardContent(BuildContext context) {
    if (header == null && footer == null) {
      return child;
    }

    return Column(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      children: [
        if (header != null) ...[
          header!,
          SizedBox(height: _getContentSpacing(context)),
        ],
        if (mainAxisSize == MainAxisSize.min) child else Expanded(child: child),
        if (footer != null) ...[
          SizedBox(height: _getContentSpacing(context)),
          footer!,
        ],
      ],
    );
  }

  Widget _wrapWithInteraction(BuildContext context, Widget card) {
    if (onTap == null && onLongPress == null) {
      return card;
    }

    if (PlatformDetector.isIOS) {
      return CupertinoButton(
        onPressed: enabled ? onTap : null,
        padding: EdgeInsets.zero,
        child: card,
      );
    } else {
      return InkWell(
        onTap: enabled ? onTap : null,
        onLongPress: enabled ? onLongPress : null,
        borderRadius: _getBorderRadius(context),
        splashColor: AdaptiveColors.primary.withOpacity(0.1),
        highlightColor: AdaptiveColors.primary.withOpacity(0.05),
        child: card,
      );
    }
  }

  // Styling helper methods
  EdgeInsets _getPadding(BuildContext context) {
    if (padding != null) return padding!;
    if (!useAdaptiveSpacing) return EdgeInsets.zero;

    final basePadding = ResponsiveUtils.getAdaptivePadding(context);

    switch (size) {
      case CardSize.small:
        return EdgeInsets.all(basePadding * 0.75);
      case CardSize.medium:
        return EdgeInsets.all(basePadding);
      case CardSize.large:
        return EdgeInsets.all(basePadding * 1.5);
    }
  }

  EdgeInsets _getMargin(BuildContext context) {
    if (margin != null) return margin!;
    if (!useAdaptiveSpacing) return EdgeInsets.zero;

    final baseMargin = ResponsiveUtils.getAdaptiveMargin(context);

    switch (size) {
      case CardSize.small:
        return EdgeInsets.all(baseMargin * 0.5);
      case CardSize.medium:
        return EdgeInsets.all(baseMargin);
      case CardSize.large:
        return EdgeInsets.all(baseMargin * 1.5);
    }
  }

  double _getContentSpacing(BuildContext context) {
    final baseSpacing = ResponsiveUtils.getAdaptivePadding(context);

    switch (size) {
      case CardSize.small:
        return baseSpacing * 0.5;
      case CardSize.medium:
        return baseSpacing * 0.75;
      case CardSize.large:
        return baseSpacing;
    }
  }

  Color _getBackgroundColor(BuildContext context) {
    if (backgroundColor != null) return backgroundColor!;

    if (PlatformDetector.isIOS) {
      return CupertinoColors.systemBackground.resolveFrom(context);
    } else {
      return AdaptiveColors.surface;
    }
  }

  BorderRadius _getBorderRadius(BuildContext context) {
    if (borderRadius != null) return borderRadius!;

    double radius;
    if (PlatformDetector.isIOS) {
      radius = 12.0; // iOS-style rounded corners
    } else {
      radius = 16.0; // Material Design 3 rounded corners
    }

    return BorderRadius.circular(radius);
  }

  Border? _getBorder(BuildContext context) {
    if (borderColor == null) return null;

    return Border.all(
      color: borderColor!,
      width: borderWidth ?? 1.0,
    );
  }

  BorderSide _getBorderSide(BuildContext context) {
    if (borderColor == null) return BorderSide.none;

    return BorderSide(
      color: borderColor!,
      width: borderWidth ?? 1.0,
    );
  }

  List<BoxShadow> _getIOSShadow(BuildContext context) {
    if (boxShadow != null) return boxShadow!;

    switch (elevation) {
      case CardElevation.none:
        return [];
      case CardElevation.minimal:
        return [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ];
      case CardElevation.low:
        return [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ];
      case CardElevation.medium:
        return [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ];
      case CardElevation.high:
        return [
          BoxShadow(
            color: Colors.black.withOpacity(0.16),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ];
    }
  }

  double _getMaterialElevation() {
    switch (elevation) {
      case CardElevation.none:
        return 0;
      case CardElevation.minimal:
        return 1;
      case CardElevation.low:
        return 2;
      case CardElevation.medium:
        return 4;
      case CardElevation.high:
        return 8;
    }
  }
}

/// Sizes for adaptive cards
enum CardSize {
  small, // Compact card for list items
  medium, // Standard card size
  large, // Large card for featured content
}

/// Elevation levels for cards
enum CardElevation {
  none, // No elevation/shadow
  minimal, // Very subtle shadow
  low, // Light shadow
  medium, // Standard shadow
  high, // Strong shadow for floating elements
}

/// Specialized card for displaying statistics/metrics
class AdaptiveStatCard extends StatelessWidget {
  final String title;
  final String value;
  final String? subtitle;
  final IconData? icon;
  final Color? iconColor;
  final Color? valueColor;
  final String? trend;
  final bool isPositiveTrend;
  final VoidCallback? onTap;

  const AdaptiveStatCard({
    Key? key,
    required this.title,
    required this.value,
    this.subtitle,
    this.icon,
    this.iconColor,
    this.valueColor,
    this.trend,
    this.isPositiveTrend = true,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveCard.dashboard(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AdaptiveColors.onSurfaceVariant,
                        fontWeight: FontWeight.w500,
                      ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (icon != null)
                Icon(
                  icon!,
                  size: 20,
                  color: iconColor ?? AdaptiveColors.primary,
                ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: valueColor ?? AdaptiveColors.onSurface,
                  fontWeight: FontWeight.bold,
                ),
          ),
          if (subtitle != null || trend != null) ...[
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (subtitle != null)
                  Expanded(
                    child: Text(
                      subtitle!,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AdaptiveColors.onSurfaceVariant,
                          ),
                    ),
                  ),
                if (trend != null)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        isPositiveTrend
                            ? Icons.trending_up
                            : Icons.trending_down,
                        size: 16,
                        color: isPositiveTrend
                            ? AdaptiveColors.success
                            : AdaptiveColors.error,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        trend!,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: isPositiveTrend
                                  ? AdaptiveColors.success
                                  : AdaptiveColors.error,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ],
                  ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

/// Card specifically designed for project display
class AdaptiveProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final String? category;
  final String? fundingGoal;
  final String? fundingProgress;
  final double? progressPercentage;
  final String? imageUrl;
  final List<String>? tags;
  final VoidCallback? onTap;
  final VoidCallback? onFavorite;
  final bool isFavorite;

  const AdaptiveProjectCard({
    Key? key,
    required this.title,
    required this.description,
    this.category,
    this.fundingGoal,
    this.fundingProgress,
    this.progressPercentage,
    this.imageUrl,
    this.tags,
    this.onTap,
    this.onFavorite,
    this.isFavorite = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveCard.project(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Project image placeholder
          if (imageUrl != null)
            Container(
              height: 120,
              decoration: BoxDecoration(
                color: AdaptiveColors.neutral200,
                borderRadius: BorderRadius.circular(8),
                image: imageUrl != null
                    ? DecorationImage(
                        image: NetworkImage(imageUrl!),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: Stack(
                children: [
                  if (onFavorite != null)
                    Positioned(
                      top: 8,
                      right: 8,
                      child: GestureDetector(
                        onTap: onFavorite,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.9),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            size: 20,
                            color: isFavorite
                                ? AdaptiveColors.error
                                : AdaptiveColors.neutral600,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),

          const SizedBox(height: 12),

          // Category badge
          if (category != null)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AdaptiveColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                category!,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AdaptiveColors.primary,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),

          const SizedBox(height: 8),

          // Title
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),

          const SizedBox(height: 8),

          // Description
          Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AdaptiveColors.onSurfaceVariant,
                ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),

          if (fundingGoal != null || progressPercentage != null) ...[
            const SizedBox(height: 12),

            // Funding progress
            if (progressPercentage != null)
              LinearProgressIndicator(
                value: progressPercentage! / 100,
                backgroundColor: AdaptiveColors.neutral200,
                valueColor:
                    const AlwaysStoppedAnimation<Color>(AdaptiveColors.primary),
              ),

            const SizedBox(height: 8),

            // Funding amounts
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (fundingProgress != null)
                  Text(
                    'Raised: $fundingProgress',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                if (fundingGoal != null)
                  Text(
                    'Goal: $fundingGoal',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AdaptiveColors.onSurfaceVariant,
                        ),
                  ),
              ],
            ),
          ],

          // Tags
          if (tags != null && tags!.isNotEmpty) ...[
            const SizedBox(height: 12),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: tags!
                  .take(3)
                  .map((tag) => Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: AdaptiveColors.neutral100,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          tag,
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: AdaptiveColors.onSurfaceVariant,
                                  ),
                        ),
                      ))
                  .toList(),
            ),
          ],
        ],
      ),
    );
  }
}
