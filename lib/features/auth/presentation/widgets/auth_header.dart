import 'package:flutter/material.dart';
import '../../../../core/utils/responsive_utils.dart';

/// Adaptive authentication header widget
/// Displays title and subtitle with responsive sizing
class AuthHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget? logo;

  const AuthHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.logo,
  });

  @override
  Widget build(BuildContext context) {
    final breakpoint = ResponsiveUtils.getBreakpoint(context);
    final isLarge = breakpoint == ScreenSize.desktop;

    return Column(
      children: [
        if (logo != null) ...[
          logo!,
          SizedBox(height: isLarge ? 24 : 16),
        ],
        Text(
          title,
          textAlign: TextAlign.center,
          style: isLarge
              ? Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                )
              : Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
        ),
        SizedBox(height: isLarge ? 12 : 8),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
          ),
        ),
      ],
    );
  }
}