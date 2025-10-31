import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../core/utils/platform_detector.dart';

/// Adaptive loading indicator that displays platform-specific spinners
/// - iOS: CupertinoActivityIndicator
/// - Android: CircularProgressIndicator (Material)
/// - Web: CircularProgressIndicator with custom styling
class AdaptiveLoadingIndicator extends StatelessWidget {
  final double? size;
  final Color? color;
  final double? strokeWidth;
  final String? semanticsLabel;

  const AdaptiveLoadingIndicator({
    Key? key,
    this.size,
    this.color,
    this.strokeWidth,
    this.semanticsLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (PlatformDetector.isIOS) {
      return _buildIOSIndicator(context);
    } else if (PlatformDetector.isAndroid) {
      return _buildAndroidIndicator(context);
    } else {
      return _buildWebIndicator(context);
    }
  }

  Widget _buildIOSIndicator(BuildContext context) {
    return SizedBox(
      width: size ?? 20.0,
      height: size ?? 20.0,
      child: CupertinoActivityIndicator(
        color: color ?? CupertinoColors.activeBlue,
        radius: (size ?? 20.0) / 2,
      ),
    );
  }

  Widget _buildAndroidIndicator(BuildContext context) {
    return SizedBox(
      width: size ?? 24.0,
      height: size ?? 24.0,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth ?? 3.0,
        valueColor: color != null
            ? AlwaysStoppedAnimation<Color>(color!)
            : null,
        semanticsLabel: semanticsLabel,
      ),
    );
  }

  Widget _buildWebIndicator(BuildContext context) {
    return SizedBox(
      width: size ?? 24.0,
      height: size ?? 24.0,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth ?? 2.5,
        valueColor: color != null
            ? AlwaysStoppedAnimation<Color>(color!)
            : AlwaysStoppedAnimation<Color>(
                Theme.of(context).colorScheme.primary,
              ),
        semanticsLabel: semanticsLabel,
      ),
    );
  }
}

/// Adaptive linear progress indicator
class AdaptiveLinearProgressIndicator extends StatelessWidget {
  final double? value;
  final Color? backgroundColor;
  final Color? valueColor;
  final double? minHeight;
  final String? semanticsLabel;

  const AdaptiveLinearProgressIndicator({
    Key? key,
    this.value,
    this.backgroundColor,
    this.valueColor,
    this.minHeight,
    this.semanticsLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (PlatformDetector.isIOS) {
      // iOS uses a thinner progress bar
      return SizedBox(
        height: minHeight ?? 2.0,
        child: LinearProgressIndicator(
          value: value,
          backgroundColor: backgroundColor ?? CupertinoColors.systemGrey5,
          valueColor: valueColor != null
              ? AlwaysStoppedAnimation<Color>(valueColor!)
              : const AlwaysStoppedAnimation<Color>(
                  CupertinoColors.activeBlue,
                ),
          semanticsLabel: semanticsLabel,
        ),
      );
    } else {
      // Android and Web use Material design
      return SizedBox(
        height: minHeight ?? 4.0,
        child: LinearProgressIndicator(
          value: value,
          backgroundColor: backgroundColor,
          valueColor: valueColor != null
              ? AlwaysStoppedAnimation<Color>(valueColor!)
              : null,
          semanticsLabel: semanticsLabel,
        ),
      );
    }
  }
}

/// Adaptive refresh indicator for pull-to-refresh
class AdaptiveRefreshIndicator extends StatelessWidget {
  final Widget child;
  final Future<void> Function() onRefresh;
  final Color? color;
  final Color? backgroundColor;
  final double displacement;
  final double edgeOffset;

  const AdaptiveRefreshIndicator({
    Key? key,
    required this.child,
    required this.onRefresh,
    this.color,
    this.backgroundColor,
    this.displacement = 40.0,
    this.edgeOffset = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (PlatformDetector.isIOS) {
      return CustomScrollView(
        slivers: [
          CupertinoSliverRefreshControl(
            onRefresh: onRefresh,
          ),
          SliverToBoxAdapter(child: child),
        ],
      );
    } else {
      // Android and Web use Material RefreshIndicator
      return RefreshIndicator(
        onRefresh: onRefresh,
        color: color,
        backgroundColor: backgroundColor,
        displacement: displacement,
        edgeOffset: edgeOffset,
        child: child,
      );
    }
  }
}

/// Loading overlay that can be shown on top of content
class AdaptiveLoadingOverlay extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  final String? loadingText;
  final Color? overlayColor;
  final double? indicatorSize;

  const AdaptiveLoadingOverlay({
    Key? key,
    required this.isLoading,
    required this.child,
    this.loadingText,
    this.overlayColor,
    this.indicatorSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading)
          Positioned.fill(
            child: Container(
              color: overlayColor ??
                  Colors.black.withOpacity(
                    PlatformDetector.isIOS ? 0.3 : 0.5,
                  ),
              child: Center(
                child: _buildLoadingContent(context),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildLoadingContent(BuildContext context) {
    if (loadingText != null) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AdaptiveLoadingIndicator(
            size: indicatorSize ?? 40.0,
            color: Colors.white,
          ),
          const SizedBox(height: 16),
          Text(
            loadingText!,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      );
    }

    return AdaptiveLoadingIndicator(
      size: indicatorSize ?? 40.0,
      color: Colors.white,
    );
  }
}

/// Loading button that shows loading state
class AdaptiveLoadingButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback? onPressed;
  final String text;
  final String? loadingText;
  final Color? color;
  final Color? textColor;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;

  const AdaptiveLoadingButton({
    Key? key,
    required this.isLoading,
    required this.onPressed,
    required this.text,
    this.loadingText,
    this.color,
    this.textColor,
    this.width,
    this.height,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (PlatformDetector.isIOS) {
      return SizedBox(
        width: width ?? double.infinity,
        height: height ?? 44.0,
        child: CupertinoButton(
          color: color ?? CupertinoColors.activeBlue,
          onPressed: isLoading ? null : onPressed,
          borderRadius: borderRadius ?? BorderRadius.circular(8.0),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: isLoading
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CupertinoActivityIndicator(color: Colors.white),
                    if (loadingText != null) ...[
                      const SizedBox(width: 12),
                      Text(
                        loadingText!,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ],
                )
              : Text(
                  text,
                  style: TextStyle(color: textColor ?? Colors.white),
                ),
        ),
      );
    } else {
      return SizedBox(
        width: width ?? double.infinity,
        height: height ?? 48.0,
        child: ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            foregroundColor: textColor,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(12.0),
            ),
          ),
          child: isLoading
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          textColor ?? Colors.white,
                        ),
                      ),
                    ),
                    if (loadingText != null) ...[
                      const SizedBox(width: 12),
                      Text(loadingText!),
                    ],
                  ],
                )
              : Text(text),
        ),
      );
    }
  }
}

/// Skeleton loader for content placeholder
class AdaptiveSkeletonLoader extends StatefulWidget {
  final double width;
  final double height;
  final BorderRadius? borderRadius;

  const AdaptiveSkeletonLoader({
    Key? key,
    required this.width,
    required this.height,
    this.borderRadius,
  }) : super(key: key);

  @override
  State<AdaptiveSkeletonLoader> createState() => _AdaptiveSkeletonLoaderState();
}

class _AdaptiveSkeletonLoaderState extends State<AdaptiveSkeletonLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
    _animation = Tween<double>(begin: -1.0, end: 2.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final baseColor = isDark ? Colors.grey[800]! : Colors.grey[300]!;
    final highlightColor = isDark ? Colors.grey[700]! : Colors.grey[100]!;

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: widget.borderRadius ?? BorderRadius.circular(4),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                baseColor,
                highlightColor,
                baseColor,
              ],
              stops: [
                _animation.value - 0.3,
                _animation.value,
                _animation.value + 0.3,
              ],
            ),
          ),
        );
      },
    );
  }
}
