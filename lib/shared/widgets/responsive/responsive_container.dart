import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../utils/responsive_breakpoints.dart';
import '../accessibility/accessibility_wrapper.dart';

/// Responsive container that adapts to screen size and accessibility needs
class ResponsiveContainer extends ConsumerWidget {
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? maxWidth;
  final bool centerContent;
  final Color? backgroundColor;
  final String? semanticsLabel;
  final bool applyAccessibilityWrapper;
  
  const ResponsiveContainer({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.maxWidth,
    this.centerContent = true,
    this.backgroundColor,
    this.semanticsLabel,
    this.applyAccessibilityWrapper = true,
  });
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final effectivePadding = padding ?? ResponsiveBreakpoints.getPadding(context);
    final effectiveMargin = margin ?? ResponsiveBreakpoints.getMargin(context);
    final effectiveMaxWidth = maxWidth ?? ResponsiveBreakpoints.getMaxWidth(context);
    
    Widget container = Container(
      margin: effectiveMargin,
      constraints: BoxConstraints(maxWidth: effectiveMaxWidth),
      decoration: backgroundColor != null
          ? BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(
                ResponsiveBreakpoints.getBorderRadius(context),
              ),
            )
          : null,
      child: Padding(
        padding: effectivePadding,
        child: child,
      ),
    );
    
    if (centerContent) {
      container = Center(child: container);
    }
    
    if (applyAccessibilityWrapper && semanticsLabel != null) {
      container = AccessibilityWrapper(
        semanticsLabel: semanticsLabel,
        child: container,
      );
    }
    
    return container;
  }
}

/// Responsive card container with elevation and accessibility features
class ResponsiveCard extends ConsumerWidget {
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? maxWidth;
  final double? elevation;
  final Color? backgroundColor;
  final Color? shadowColor;
  final String? semanticsLabel;
  final VoidCallback? onTap;
  final bool clipBehavior;
  
  const ResponsiveCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.maxWidth,
    this.elevation,
    this.backgroundColor,
    this.shadowColor,
    this.semanticsLabel,
    this.onTap,
    this.clipBehavior = true,
  });
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final effectivePadding = padding ?? ResponsiveBreakpoints.getPadding(context);
    final effectiveMargin = margin ?? ResponsiveBreakpoints.getMargin(context);
    final effectiveMaxWidth = maxWidth ?? ResponsiveBreakpoints.getMaxWidth(context);
    final effectiveElevation = elevation ?? ResponsiveBreakpoints.getCardElevation(context);
    
    Widget card = Container(
      margin: effectiveMargin,
      constraints: BoxConstraints(maxWidth: effectiveMaxWidth),
      child: Card(
        elevation: effectiveElevation,
        color: backgroundColor,
        shadowColor: shadowColor,
        clipBehavior: clipBehavior ? Clip.antiAlias : Clip.none,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            ResponsiveBreakpoints.getBorderRadius(context, base: 12),
          ),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(
            ResponsiveBreakpoints.getBorderRadius(context, base: 12),
          ),
          child: Padding(
            padding: effectivePadding,
            child: child,
          ),
        ),
      ),
    );
    
    if (semanticsLabel != null) {
      card = AccessibilityWrapper(
        semanticsLabel: semanticsLabel,
        onTap: onTap,
        role: onTap != null ? SemanticsRole.button : null,
        child: card,
      );
    }
    
    return card;
  }
}

/// Responsive grid container
class ResponsiveGrid extends ConsumerWidget {
  final List<Widget> children;
  final int? columns;
  final double? crossAxisSpacing;
  final double? mainAxisSpacing;
  final double? childAspectRatio;
  final EdgeInsets? padding;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final String? semanticsLabel;
  
  const ResponsiveGrid({
    super.key,
    required this.children,
    this.columns,
    this.crossAxisSpacing,
    this.mainAxisSpacing,
    this.childAspectRatio,
    this.padding,
    this.shrinkWrap = false,
    this.physics,
    this.semanticsLabel,
  });
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final effectiveColumns = columns ?? ResponsiveBreakpoints.getCardColumns(context);
    final effectiveCrossAxisSpacing = crossAxisSpacing ?? ResponsiveSpacing.md.get(context);
    final effectiveMainAxisSpacing = mainAxisSpacing ?? ResponsiveSpacing.md.get(context);
    final effectiveChildAspectRatio = childAspectRatio ?? ResponsiveBreakpoints.getGridAspectRatio(context);
    final effectivePadding = padding ?? ResponsiveBreakpoints.getPadding(context);
    
    Widget grid = GridView.count(
      crossAxisCount: effectiveColumns,
      crossAxisSpacing: effectiveCrossAxisSpacing,
      mainAxisSpacing: effectiveMainAxisSpacing,
      childAspectRatio: effectiveChildAspectRatio,
      padding: effectivePadding,
      shrinkWrap: shrinkWrap,
      physics: physics,
      children: children,
    );
    
    if (semanticsLabel != null) {
      grid = AccessibilityWrapper(
        semanticsLabel: semanticsLabel,
        role: SemanticsRole.list,
        child: grid,
      );
    }
    
    return grid;
  }
}

/// Responsive form container
class ResponsiveForm extends ConsumerWidget {
  final Widget child;
  final EdgeInsets? padding;
  final double? maxWidth;
  final String? semanticsLabel;
  final bool centerContent;
  
  const ResponsiveForm({
    super.key,
    required this.child,
    this.padding,
    this.maxWidth,
    this.semanticsLabel,
    this.centerContent = true,
  });
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final effectivePadding = padding ?? ResponsiveBreakpoints.getPadding(context);
    final effectiveMaxWidth = maxWidth ?? ResponsiveBreakpoints.maxFormWidth;
    
    Widget form = Container(
      constraints: BoxConstraints(maxWidth: effectiveMaxWidth),
      padding: effectivePadding,
      child: child,
    );
    
    if (centerContent) {
      form = Center(child: form);
    }
    
    if (semanticsLabel != null) {
      form = AccessibilityWrapper(
        semanticsLabel: semanticsLabel,
        child: form,
      );
    }
    
    return form;
  }
}

/// Responsive dialog container
class ResponsiveDialog extends ConsumerWidget {
  final Widget child;
  final String? title;
  final List<Widget>? actions;
  final EdgeInsets? padding;
  final bool scrollable;
  final String? semanticsLabel;
  
  const ResponsiveDialog({
    super.key,
    required this.child,
    this.title,
    this.actions,
    this.padding,
    this.scrollable = true,
    this.semanticsLabel,
  });
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dialogWidth = ResponsiveBreakpoints.getDialogWidth(context);
    final effectivePadding = padding ?? ResponsiveBreakpoints.getPadding(context);
    
    Widget dialog = Dialog(
      child: Container(
        width: dialogWidth,
        padding: effectivePadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null) ...[
              Text(
                title!,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: ResponsiveSpacing.md.get(context)),
            ],
            
            Flexible(
              child: scrollable
                  ? SingleChildScrollView(child: child)
                  : child,
            ),
            
            if (actions != null) ...[
              SizedBox(height: ResponsiveSpacing.lg.get(context)),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: actions!
                    .expand((action) => [action, SizedBox(width: ResponsiveSpacing.sm.get(context))])
                    .take(actions!.length * 2 - 1)
                    .toList(),
              ),
            ],
          ],
        ),
      ),
    );
    
    if (semanticsLabel != null) {
      dialog = AccessibilityWrapper(
        semanticsLabel: semanticsLabel,
        child: dialog,
      );
    }
    
    return dialog;
  }
}

/// Responsive bottom sheet container
class ResponsiveBottomSheet extends ConsumerWidget {
  final Widget child;
  final String? title;
  final bool isDismissible;
  final bool enableDrag;
  final double? height;
  final EdgeInsets? padding;
  final String? semanticsLabel;
  
  const ResponsiveBottomSheet({
    super.key,
    required this.child,
    this.title,
    this.isDismissible = true,
    this.enableDrag = true,
    this.height,
    this.padding,
    this.semanticsLabel,
  });
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final effectiveHeight = height ?? ResponsiveBreakpoints.getBottomSheetHeight(context);
    final effectivePadding = padding ?? ResponsiveBreakpoints.getPadding(context);
    
    Widget bottomSheet = Container(
      height: effectiveHeight,
      padding: effectivePadding,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(ResponsiveBreakpoints.getBorderRadius(context, base: 16)),
          topRight: Radius.circular(ResponsiveBreakpoints.getBorderRadius(context, base: 16)),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (enableDrag) ...[
            Center(
              child: Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ],
          
          if (title != null) ...[
            Text(
              title!,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: ResponsiveSpacing.md.get(context)),
          ],
          
          Expanded(child: child),
        ],
      ),
    );
    
    if (semanticsLabel != null) {
      bottomSheet = AccessibilityWrapper(
        semanticsLabel: semanticsLabel,
        child: bottomSheet,
      );
    }
    
    return bottomSheet;
  }
}