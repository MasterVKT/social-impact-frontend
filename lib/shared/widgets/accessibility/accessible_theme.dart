import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Accessibility-enhanced theme provider
final accessibleThemeProvider =
    StateNotifierProvider<AccessibleThemeNotifier, AccessibleThemeState>((ref) {
  return AccessibleThemeNotifier();
});

/// Accessible theme state
class AccessibleThemeState {
  final bool highContrastMode;
  final bool largeTextMode;
  final bool reducedMotion;
  final double textScaleFactor;
  final AccessibilityPreset preset;

  const AccessibleThemeState({
    this.highContrastMode = false,
    this.largeTextMode = false,
    this.reducedMotion = false,
    this.textScaleFactor = 1.0,
    this.preset = AccessibilityPreset.none,
  });

  AccessibleThemeState copyWith({
    bool? highContrastMode,
    bool? largeTextMode,
    bool? reducedMotion,
    double? textScaleFactor,
    AccessibilityPreset? preset,
  }) {
    return AccessibleThemeState(
      highContrastMode: highContrastMode ?? this.highContrastMode,
      largeTextMode: largeTextMode ?? this.largeTextMode,
      reducedMotion: reducedMotion ?? this.reducedMotion,
      textScaleFactor: textScaleFactor ?? this.textScaleFactor,
      preset: preset ?? this.preset,
    );
  }
}

/// Accessibility preset options
enum AccessibilityPreset {
  none,
  lowVision,
  colorBlind,
  motorImpaired,
  cognitiveSupport,
}

/// Accessible theme notifier
class AccessibleThemeNotifier extends StateNotifier<AccessibleThemeState> {
  AccessibleThemeNotifier() : super(const AccessibleThemeState());

  /// Enable high contrast mode
  void toggleHighContrast() {
    state = state.copyWith(highContrastMode: !state.highContrastMode);
  }

  /// Enable large text mode
  void toggleLargeText() {
    state = state.copyWith(largeTextMode: !state.largeTextMode);
  }

  /// Enable reduced motion
  void toggleReducedMotion() {
    state = state.copyWith(reducedMotion: !state.reducedMotion);
  }

  /// Set text scale factor
  void setTextScaleFactor(double factor) {
    state = state.copyWith(textScaleFactor: factor.clamp(0.8, 3.0));
  }

  /// Apply accessibility preset
  void applyPreset(AccessibilityPreset preset) {
    switch (preset) {
      case AccessibilityPreset.none:
        state = const AccessibleThemeState();
        break;
      case AccessibilityPreset.lowVision:
        state = state.copyWith(
          highContrastMode: true,
          largeTextMode: true,
          textScaleFactor: 1.5,
          preset: preset,
        );
        break;
      case AccessibilityPreset.colorBlind:
        state = state.copyWith(
          highContrastMode: true,
          preset: preset,
        );
        break;
      case AccessibilityPreset.motorImpaired:
        state = state.copyWith(
          reducedMotion: true,
          preset: preset,
        );
        break;
      case AccessibilityPreset.cognitiveSupport:
        state = state.copyWith(
          reducedMotion: true,
          largeTextMode: true,
          textScaleFactor: 1.3,
          preset: preset,
        );
        break;
    }
  }

  /// Reset all accessibility settings
  void reset() {
    state = const AccessibleThemeState();
  }
}

/// Accessible theme data generator
class AccessibleTheme {
  /// Generate accessible theme data
  static ThemeData generateTheme(
    ThemeData baseTheme,
    AccessibleThemeState accessibilityState,
  ) {
    var theme = baseTheme;

    // Apply high contrast colors
    if (accessibilityState.highContrastMode) {
      theme = _applyHighContrastColors(theme);
    }

    // Apply large text modifications
    if (accessibilityState.largeTextMode) {
      theme = _applyLargeTextTheme(theme);
    }

    // Apply text scale factor
    if (accessibilityState.textScaleFactor != 1.0) {
      theme = _applyTextScaleFactor(theme, accessibilityState.textScaleFactor);
    }

    // Apply reduced motion settings
    if (accessibilityState.reducedMotion) {
      theme = _applyReducedMotionTheme(theme);
    }

    // Apply preset-specific modifications
    theme = _applyPresetModifications(theme, accessibilityState.preset);

    return theme;
  }

  /// Apply high contrast colors
  static ThemeData _applyHighContrastColors(ThemeData theme) {
    final colorScheme = theme.colorScheme;

    return theme.copyWith(
      colorScheme: colorScheme.copyWith(
        // Increase contrast for primary colors
        primary: colorScheme.brightness == Brightness.light
            ? Colors.black
            : Colors.white,
        onPrimary: colorScheme.brightness == Brightness.light
            ? Colors.white
            : Colors.black,

        // Increase contrast for surface colors
        surface: colorScheme.brightness == Brightness.light
            ? Colors.white
            : Colors.black,
        onSurface: colorScheme.brightness == Brightness.light
            ? Colors.black
            : Colors.white,

        // High contrast error colors
        error: colorScheme.brightness == Brightness.light
            ? Colors.red.shade800
            : Colors.red.shade200,
        onError: Colors.white,

        // High contrast outline
        outline: colorScheme.brightness == Brightness.light
            ? Colors.black.withOpacity(0.54)
            : Colors.white.withOpacity(0.54),
      ),

      // High contrast divider
      dividerColor: colorScheme.brightness == Brightness.light
          ? Colors.black.withOpacity(0.26)
          : Colors.white.withOpacity(0.26),

      // High contrast disabled colors
      disabledColor: colorScheme.brightness == Brightness.light
          ? Colors.black.withOpacity(0.38)
          : Colors.white.withOpacity(0.38),
    );
  }

  /// Apply large text theme
  static ThemeData _applyLargeTextTheme(ThemeData theme) {
    final textTheme = theme.textTheme;

    return theme.copyWith(
      textTheme: textTheme.copyWith(
        displayLarge: textTheme.displayLarge?.copyWith(fontSize: 64),
        displayMedium: textTheme.displayMedium?.copyWith(fontSize: 52),
        displaySmall: textTheme.displaySmall?.copyWith(fontSize: 40),
        headlineLarge: textTheme.headlineLarge?.copyWith(fontSize: 36),
        headlineMedium: textTheme.headlineMedium?.copyWith(fontSize: 32),
        headlineSmall: textTheme.headlineSmall?.copyWith(fontSize: 28),
        titleLarge: textTheme.titleLarge?.copyWith(fontSize: 24),
        titleMedium: textTheme.titleMedium?.copyWith(fontSize: 20),
        titleSmall: textTheme.titleSmall?.copyWith(fontSize: 18),
        bodyLarge: textTheme.bodyLarge?.copyWith(fontSize: 20),
        bodyMedium: textTheme.bodyMedium?.copyWith(fontSize: 18),
        bodySmall: textTheme.bodySmall?.copyWith(fontSize: 16),
        labelLarge: textTheme.labelLarge?.copyWith(fontSize: 18),
        labelMedium: textTheme.labelMedium?.copyWith(fontSize: 16),
        labelSmall: textTheme.labelSmall?.copyWith(fontSize: 14),
      ),

      // Larger button text
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(fontSize: 18),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          textStyle: const TextStyle(fontSize: 18),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: const TextStyle(fontSize: 18),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        ),
      ),
    );
  }

  /// Apply text scale factor
  static ThemeData _applyTextScaleFactor(ThemeData theme, double scaleFactor) {
    final textTheme = theme.textTheme;

    return theme.copyWith(
      textTheme: textTheme.copyWith(
        displayLarge: textTheme.displayLarge?.copyWith(
          fontSize: (textTheme.displayLarge?.fontSize ?? 57) * scaleFactor,
        ),
        displayMedium: textTheme.displayMedium?.copyWith(
          fontSize: (textTheme.displayMedium?.fontSize ?? 45) * scaleFactor,
        ),
        displaySmall: textTheme.displaySmall?.copyWith(
          fontSize: (textTheme.displaySmall?.fontSize ?? 36) * scaleFactor,
        ),
        headlineLarge: textTheme.headlineLarge?.copyWith(
          fontSize: (textTheme.headlineLarge?.fontSize ?? 32) * scaleFactor,
        ),
        headlineMedium: textTheme.headlineMedium?.copyWith(
          fontSize: (textTheme.headlineMedium?.fontSize ?? 28) * scaleFactor,
        ),
        headlineSmall: textTheme.headlineSmall?.copyWith(
          fontSize: (textTheme.headlineSmall?.fontSize ?? 24) * scaleFactor,
        ),
        titleLarge: textTheme.titleLarge?.copyWith(
          fontSize: (textTheme.titleLarge?.fontSize ?? 22) * scaleFactor,
        ),
        titleMedium: textTheme.titleMedium?.copyWith(
          fontSize: (textTheme.titleMedium?.fontSize ?? 16) * scaleFactor,
        ),
        titleSmall: textTheme.titleSmall?.copyWith(
          fontSize: (textTheme.titleSmall?.fontSize ?? 14) * scaleFactor,
        ),
        bodyLarge: textTheme.bodyLarge?.copyWith(
          fontSize: (textTheme.bodyLarge?.fontSize ?? 16) * scaleFactor,
        ),
        bodyMedium: textTheme.bodyMedium?.copyWith(
          fontSize: (textTheme.bodyMedium?.fontSize ?? 14) * scaleFactor,
        ),
        bodySmall: textTheme.bodySmall?.copyWith(
          fontSize: (textTheme.bodySmall?.fontSize ?? 12) * scaleFactor,
        ),
        labelLarge: textTheme.labelLarge?.copyWith(
          fontSize: (textTheme.labelLarge?.fontSize ?? 14) * scaleFactor,
        ),
        labelMedium: textTheme.labelMedium?.copyWith(
          fontSize: (textTheme.labelMedium?.fontSize ?? 12) * scaleFactor,
        ),
        labelSmall: textTheme.labelSmall?.copyWith(
          fontSize: (textTheme.labelSmall?.fontSize ?? 11) * scaleFactor,
        ),
      ),
    );
  }

  /// Apply reduced motion theme
  static ThemeData _applyReducedMotionTheme(ThemeData theme) {
    return theme.copyWith(
      // Disable page transitions
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: _NoAnimationPageTransitionsBuilder(),
          TargetPlatform.iOS: _NoAnimationPageTransitionsBuilder(),
          TargetPlatform.macOS: _NoAnimationPageTransitionsBuilder(),
          TargetPlatform.windows: _NoAnimationPageTransitionsBuilder(),
          TargetPlatform.linux: _NoAnimationPageTransitionsBuilder(),
        },
      ),

      // Reduced animation durations
      extensions: [
        const AccessibilityThemeExtension(
          animationDuration: Duration.zero,
          transitionDuration: Duration.zero,
        ),
      ],
    );
  }

  /// Apply preset-specific modifications
  static ThemeData _applyPresetModifications(
      ThemeData theme, AccessibilityPreset preset) {
    switch (preset) {
      case AccessibilityPreset.colorBlind:
        // Use patterns and shapes in addition to colors
        return theme.copyWith(
          iconTheme: theme.iconTheme.copyWith(size: 28),
          primaryIconTheme: theme.primaryIconTheme.copyWith(size: 28),
        );

      case AccessibilityPreset.motorImpaired:
        // Larger touch targets
        return theme.copyWith(
          materialTapTargetSize: MaterialTapTargetSize.padded,
          iconTheme: theme.iconTheme.copyWith(size: 32),
          primaryIconTheme: theme.primaryIconTheme.copyWith(size: 32),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(88, 56),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            ),
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(88, 56),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            ),
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              minimumSize: const Size(88, 56),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            ),
          ),
        );

      default:
        return theme;
    }
  }
}

/// No animation page transitions builder
class _NoAnimationPageTransitionsBuilder extends PageTransitionsBuilder {
  const _NoAnimationPageTransitionsBuilder();

  @override
  Widget buildTransitions<T extends Object?>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return child;
  }
}

/// Accessibility theme extension
@immutable
class AccessibilityThemeExtension
    extends ThemeExtension<AccessibilityThemeExtension> {
  final Duration animationDuration;
  final Duration transitionDuration;

  const AccessibilityThemeExtension({
    this.animationDuration = const Duration(milliseconds: 200),
    this.transitionDuration = const Duration(milliseconds: 300),
  });

  @override
  AccessibilityThemeExtension copyWith({
    Duration? animationDuration,
    Duration? transitionDuration,
  }) {
    return AccessibilityThemeExtension(
      animationDuration: animationDuration ?? this.animationDuration,
      transitionDuration: transitionDuration ?? this.transitionDuration,
    );
  }

  @override
  AccessibilityThemeExtension lerp(
    ThemeExtension<AccessibilityThemeExtension>? other,
    double t,
  ) {
    if (other is! AccessibilityThemeExtension) {
      return this;
    }

    return AccessibilityThemeExtension(
      animationDuration: Duration(
        milliseconds: (animationDuration.inMilliseconds * (1 - t) +
                other.animationDuration.inMilliseconds * t)
            .round(),
      ),
      transitionDuration: Duration(
        milliseconds: (transitionDuration.inMilliseconds * (1 - t) +
                other.transitionDuration.inMilliseconds * t)
            .round(),
      ),
    );
  }
}

/// Accessible theme consumer widget
class AccessibleThemeConsumer extends ConsumerWidget {
  final Widget Function(BuildContext context, ThemeData theme) builder;

  const AccessibleThemeConsumer({
    super.key,
    required this.builder,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accessibilityState = ref.watch(accessibleThemeProvider);
    final baseTheme = Theme.of(context);

    final accessibleTheme = AccessibleTheme.generateTheme(
      baseTheme,
      accessibilityState,
    );

    return Theme(
      data: accessibleTheme,
      child: builder(context, accessibleTheme),
    );
  }
}
