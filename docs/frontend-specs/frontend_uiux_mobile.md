# Spécifications UI/UX - Mobile Hybride + Web Responsive
## Social Finance Impact Platform MVP

## 1. Système de design adaptatif multi-plateforme

### 1.1 Palette de couleurs universelle

```dart
// core/themes/adaptive_colors.dart
class AdaptiveColors {
  // Couleurs principales universelles
  static const Color primaryBlue = Color(0xFF2563EB);
  static const Color primaryBlueLight = Color(0xFF3B82F6);
  static const Color primaryBlueDark = Color(0xFF1D4ED8);
  
  static const Color secondaryGreen = Color(0xFF059669);
  static const Color secondaryGreenLight = Color(0xFF10B981);
  static const Color secondaryGreenDark = Color(0xFF047857);
  
  static const Color accentOrange = Color(0xFFF59E0B);
  static const Color accentOrangeLight = Color(0xFFFBBF24);
  static const Color accentOrangeDark = Color(0xFFD97706);
  
  // Couleurs adaptatives par plateforme
  static Color get primaryColor {
    if (PlatformDetector.isIOS) {
      return CupertinoColors.activeBlue;
    } else if (PlatformDetector.isAndroid) {
      return primaryBlue;
    } else {
      return primaryBlue; // Web
    }
  }
  
  static Color get backgroundColor {
    if (PlatformDetector.isIOS) {
      return CupertinoColors.systemBackground;
    } else {
      return const Color(0xFFF8FAFC);
    }
  }
  
  // Couleurs sémantiques adaptatives
  static Color get errorColor {
    if (PlatformDetector.isIOS) {
      return CupertinoColors.systemRed;
    } else {
      return const Color(0xFFDC2626);
    }
  }
  
  static Color get successColor {
    if (PlatformDetector.isIOS) {
      return CupertinoColors.systemGreen;
    } else {
      return secondaryGreen;
    }
  }
  
  static Color get warningColor {
    if (PlatformDetector.isIOS) {
      return CupertinoColors.systemOrange;
    } else {
      return accentOrange;
    }
  }
}
```

### 1.2 Typographie responsive et adaptative

```dart
// core/themes/adaptive_text_styles.dart
class AdaptiveTextStyles {
  // Tailles de base adaptatives
  static double _getBaseFontSize(BuildContext context) {
    if (ResponsiveUtils.isMobileScreen(context)) return 14.0;
    if (ResponsiveUtils.isTabletScreen(context)) return 16.0;
    return 18.0; // Desktop
  }
  
  // Styles adaptatifs par plateforme
  static TextStyle _getBaseTextStyle(BuildContext context) {
    final baseSize = _getBaseFontSize(context);
    
    if (PlatformDetector.isIOS) {
      return TextStyle(
        fontFamily: '.SF UI Display', // Système iOS
        fontSize: baseSize,
        color: CupertinoColors.label,
      );
    } else if (PlatformDetector.isAndroid) {
      return TextStyle(
        fontFamily: 'Roboto',
        fontSize: baseSize,
        color: AdaptiveColors.textPrimary,
      );
    } else {
      // Web - optimisé lisibilité
      return TextStyle(
        fontFamily: 'Inter, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto',
        fontSize: baseSize,
        color: AdaptiveColors.textPrimary,
        height: 1.5, // Meilleure lisibilité web
      );
    }
  }
  
  // Styles responsifs
  static TextStyle headingXLarge(BuildContext context) {
    final base = _getBaseTextStyle(context);
    final multiplier = ResponsiveUtils.isMobileScreen(context) ? 2.0 : 2.5;
    
    return base.copyWith(
      fontSize: base.fontSize! * multiplier,
      fontWeight: FontWeight.bold,
      height: 1.2,
    );
  }
  
  static TextStyle headingLarge(BuildContext context) {
    final base = _getBaseTextStyle(context);
    final multiplier = ResponsiveUtils.isMobileScreen(context) ? 1.5 : 1.8;
    
    return base.copyWith(
      fontSize: base.fontSize! * multiplier,
      fontWeight: FontWeight.w600,
      height: 1.3,
    );
  }
  
  static TextStyle headingMedium(BuildContext context) {
    final base = _getBaseTextStyle(context);
    final multiplier = ResponsiveUtils.isMobileScreen(context) ? 1.25 : 1.4;
    
    return base.copyWith(
      fontSize: base.fontSize! * multiplier,
      fontWeight: FontWeight.w600,
      height: 1.4,
    );
  }
  
  static TextStyle bodyLarge(BuildContext context) {
    final base = _getBaseTextStyle(context);
    
    return base.copyWith(
      fontSize: base.fontSize! * 1.1,
      height: 1.6,
    );
  }
  
  static TextStyle bodyMedium(BuildContext context) {
    return _getBaseTextStyle(context).copyWith(height: 1.5);
  }
  
  static TextStyle bodySmall(BuildContext context) {
    final base = _getBaseTextStyle(context);
    
    return base.copyWith(
      fontSize: base.fontSize! * 0.9,
      color: AdaptiveColors.textSecondary,
      height: 1.4,
    );
  }
  
  static TextStyle caption(BuildContext context) {
    final base = _getBaseTextStyle(context);
    
    return base.copyWith(
      fontSize: base.fontSize! * 0.8,
      color: AdaptiveColors.textSecondary,
      height: 1.3,
    );
  }
}
```

### 1.3 Espacements adaptatifs

```dart
// core/themes/adaptive_spacing.dart
class AdaptiveSpacing {
  // Espacements de base adaptatifs
  static double _getBaseSpacing(BuildContext context) {
    if (ResponsiveUtils.isMobileScreen(context)) return 8.0;
    if (ResponsiveUtils.isTabletScreen(context)) return 12.0;
    return 16.0; // Desktop
  }
  
  // Espacements adaptatifs
  static double xs(BuildContext context) => _getBaseSpacing(context) * 0.5;
  static double sm(BuildContext context) => _getBaseSpacing(context) * 0.75;
  static double md(BuildContext context) => _getBaseSpacing(context);
  static double lg(BuildContext context) => _getBaseSpacing(context) * 1.5;
  static double xl(BuildContext context) => _getBaseSpacing(context) * 2.0;
  static double xxl(BuildContext context) => _getBaseSpacing(context) * 3.0;
  
  // Paddings adaptatifs
  static EdgeInsets paddingXS(BuildContext context) =>
      EdgeInsets.all(xs(context));
  static EdgeInsets paddingSM(BuildContext context) =>
      EdgeInsets.all(sm(context));
  static EdgeInsets paddingMD(BuildContext context) =>
      EdgeInsets.all(md(context));
  static EdgeInsets paddingLG(BuildContext context) =>
      EdgeInsets.all(lg(context));
  static EdgeInsets paddingXL(BuildContext context) =>
      EdgeInsets.all(xl(context));
  
  // Paddings spécifiques mobile/desktop
  static EdgeInsets get screenPadding {
    if (PlatformDetector.isMobile) {
      return const EdgeInsets.symmetric(horizontal: 16, vertical: 12);
    } else {
      return const EdgeInsets.symmetric(horizontal: 32, vertical: 24);
    }
  }
  
  // Spacing pour touches mobiles (minimum 44px)
  static double get minimumTouchTarget => 44.0;
  
  // Spacing pour interactions web (hover zones)
  static double get webInteractionZone => 32.0;
}
```

## 2. Composants adaptatifs universels

### 2.1 Boutons adaptatifs par plateforme

```dart
// shared/widgets/adaptive/adaptive_primary_button.dart
class AdaptivePrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isFullWidth;
  final IconData? icon;

  const AdaptivePrimaryButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.isFullWidth = true,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (PlatformDetector.isIOS) {
      return _buildIOSButton(context);
    } else if (PlatformDetector.isAndroid) {
      return _buildAndroidButton(context);
    } else {
      return _buildWebButton(context);
    }
  }
  
  Widget _buildIOSButton(BuildContext context) {
    return CupertinoButton(
      onPressed: isLoading ? null : onPressed,
      color: AdaptiveColors.primaryColor,
      borderRadius: BorderRadius.circular(12),
      padding: EdgeInsets.symmetric(
        horizontal: AdaptiveSpacing.lg(context),
        vertical: AdaptiveSpacing.md(context),
      ),
      child: isLoading 
          ? const CupertinoActivityIndicator(color: Colors.white)
          : Row(
              mainAxisSize: isFullWidth ? MainAxisSize.max : MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) ...[
                  Icon(icon, color: Colors.white),
                  SizedBox(width: AdaptiveSpacing.sm(context)),
                ],
                Text(
                  text,
                  style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
    );
  }
  
  Widget _buildAndroidButton(BuildContext context) {
    return SizedBox(
      width: isFullWidth ? double.infinity : null,
      height: AdaptiveSpacing.minimumTouchTarget,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AdaptiveColors.primaryColor,
          foregroundColor: Colors.white,
          elevation: 2,
          shadowColor: AdaptiveColors.primaryColor.withOpacity(0.3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: isLoading 
            ? SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Row(
                mainAxisSize: isFullWidth ? MainAxisSize.max : MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) ...[
                    Icon(icon, size: 20),
                    SizedBox(width: AdaptiveSpacing.sm(context)),
                  ],
                  Text(
                    text,
                    style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
  
  Widget _buildWebButton(BuildContext context) {
    return MouseRegion(
      cursor: onPressed != null ? SystemMouseCursors.click : SystemMouseCursors.forbidden,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: isFullWidth ? double.infinity : null,
        height: 48,
        child: ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AdaptiveColors.primaryColor,
            foregroundColor: Colors.white,
            elevation: 0,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ).copyWith(
            // Effets hover pour web
            overlayColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.hovered)) {
                return Colors.white.withOpacity(0.1);
              }
              if (states.contains(MaterialState.pressed)) {
                return Colors.white.withOpacity(0.2);
              }
              return null;
            }),
          ),
          child: isLoading 
              ? SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              : Row(
                  mainAxisSize: isFullWidth ? MainAxisSize.max : MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (icon != null) ...[
                      Icon(icon, size: 20),
                      SizedBox(width: AdaptiveSpacing.sm(context)),
                    ],
                    Text(
                      text,
                      style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
```

### 2.2 Champs de texte adaptatifs

```dart
// shared/widgets/adaptive/adaptive_text_field.dart
class AdaptiveTextField extends StatelessWidget {
  final String label;
  final String? placeholder;
  final String? initialValue;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool enabled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLines;

  const AdaptiveTextField({
    Key? key,
    required this.label,
    this.placeholder,
    this.initialValue,
    this.onChanged,
    this.validator,
    this.keyboardType,
    this.obscureText = false,
    this.enabled = true,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (PlatformDetector.isIOS) {
      return _buildIOSTextField(context);
    } else {
      return _buildMaterialTextField(context);
    }
  }
  
  Widget _buildIOSTextField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AdaptiveTextStyles.bodyMedium(context).copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: AdaptiveSpacing.xs(context)),
        CupertinoTextField(
          placeholder: placeholder ?? label,
          onChanged: onChanged,
          keyboardType: keyboardType,
          obscureText: obscureText,
          enabled: enabled,
          maxLines: maxLines,
          prefix: prefixIcon != null 
              ? Padding(
                  padding: EdgeInsets.only(left: AdaptiveSpacing.sm(context)),
                  child: prefixIcon,
                )
              : null,
          suffix: suffixIcon != null 
              ? Padding(
                  padding: EdgeInsets.only(right: AdaptiveSpacing.sm(context)),
                  child: suffixIcon,
                )
              : null,
          padding: EdgeInsets.all(AdaptiveSpacing.md(context)),
          decoration: BoxDecoration(
            border: Border.all(color: CupertinoColors.systemGrey4),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ],
    );
  }
  
  Widget _buildMaterialTextField(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onChanged: onChanged,
      validator: validator,
      keyboardType: keyboardType,
      obscureText: obscureText,
      enabled: enabled,
      maxLines: maxLines,
      style: AdaptiveTextStyles.bodyMedium(context),
      decoration: InputDecoration(
        labelText: label,
        hintText: placeholder,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: enabled 
            ? AdaptiveColors.backgroundSecondary
            : AdaptiveColors.backgroundDisabled,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AdaptiveColors.borderPrimary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AdaptiveColors.borderPrimary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AdaptiveColors.primaryColor,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AdaptiveColors.errorColor),
        ),
        contentPadding: EdgeInsets.all(AdaptiveSpacing.md(context)),
      ),
    );
  }
}
```

### 2.3 Cards adaptatives

```dart
// shared/widgets/adaptive/adaptive_card.dart
class AdaptiveCard extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsets? padding;
  final bool showShadow;
  final Color? backgroundColor;

  const AdaptiveCard({
    Key? key,
    required this.child,
    this.onTap,
    this.padding,
    this.showShadow = true,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final effectivePadding = padding ?? AdaptiveSpacing.paddingMD(context);
    
    if (PlatformDetector.isIOS) {
      return _buildIOSCard(context, effectivePadding);
    } else {
      return _buildMaterialCard(context, effectivePadding);
    }
  }
  
  Widget _buildIOSCard(BuildContext context, EdgeInsets padding) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor ?? CupertinoColors.systemBackground,
          borderRadius: BorderRadius.circular(12),
          boxShadow: showShadow
              ? [
                  BoxShadow(
                    color: CupertinoColors.systemGrey.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: child,
      ),
    );
  }
  
  Widget _buildMaterialCard(BuildContext context, EdgeInsets padding) {
    return Card(
      elevation: showShadow ? 2 : 0,
      color: backgroundColor ?? AdaptiveColors.backgroundPrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}
```

## 3. Layouts responsive multi-plateforme

### 3.1 Layout principal adaptatif

```dart
// shared/widgets/layouts/adaptive_main_layout.dart
class AdaptiveMainLayout extends StatelessWidget {
  final Widget child;
  final List<NavigationDestination> destinations;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  const AdaptiveMainLayout({
    Key? key,
    required this.child,
    required this.destinations,
    required this.selectedIndex,
    required this.onDestinationSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: _buildMobileLayout(context),
      tablet: _buildTabletLayout(context),
      desktop: _buildDesktopLayout(context),
    );
  }
  
  Widget _buildMobileLayout(BuildContext context) {
    if (PlatformDetector.isIOS) {
      return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          currentIndex: selectedIndex,
          onTap: onDestinationSelected,
          items: destinations.map((dest) => BottomNavigationBarItem(
            icon: Icon(dest.icon),
            label: dest.label,
          )).toList(),
        ),
        tabBuilder: (context, index) => CupertinoTabView(
          builder: (context) => child,
        ),
      );
    } else {
      return Scaffold(
        body: child,
        bottomNavigationBar: NavigationBar(
          selectedIndex: selectedIndex,
          onDestinationSelected: onDestinationSelected,
          destinations: destinations.map((dest) => NavigationDestination(
            icon: Icon(dest.icon),
            label: dest.label,
          )).toList(),
        ),
      );
    }
  }
  
  Widget _buildTabletLayout(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: selectedIndex,
            onDestinationSelected: onDestinationSelected,
            extended: true,
            destinations: destinations.map((dest) => NavigationRailDestination(
              icon: Icon(dest.icon),
              label: Text(dest.label),
            )).toList(),
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(child: child),
        ],
      ),
    );
  }
  
  Widget _buildDesktopLayout(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: 280,
            child: NavigationDrawer(
              selectedIndex: selectedIndex,
              onDestinationSelected: onDestinationSelected,
              children: [
                DrawerHeader(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Social Impact',
                        style: AdaptiveTextStyles.headingMedium(context),
                      ),
                      Text(
                        'Platform MVP',
                        style: AdaptiveTextStyles.bodySmall(context),
                      ),
                    ],
                  ),
                ),
                ...destinations.map((dest) => NavigationDrawerDestination(
                  icon: Icon(dest.icon),
                  label: Text(dest.label),
                )),
              ],
            ),
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(child: child),
        ],
      ),
    );
  }
}
```

### 3.2 Grille responsive adaptative

```dart
// shared/widgets/layouts/adaptive_grid.dart
class AdaptiveGrid extends StatelessWidget {
  final List<Widget> children;
  final double spacing;
  final double runSpacing;
  final int? mobileColumns;
  final int? tabletColumns;
  final int? desktopColumns;
  final bool adaptToContent;

  const AdaptiveGrid({
    Key? key,
    required this.children,
    this.spacing = 16.0,
    this.runSpacing = 16.0,
    this.mobileColumns,
    this.tabletColumns,
    this.desktopColumns,
    this.adaptToContent = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final columns = _getColumnsForWidth(context, constraints.maxWidth);
        
        if (adaptToContent) {
          return _buildStaggeredGrid(context, columns);
        } else {
          return _buildRegularGrid(context, columns);
        }
      },
    );
  }
  
  int _getColumnsForWidth(BuildContext context, double width) {
    if (PlatformDetector.isMobile) {
      // Mobile natif - basé sur orientation
      return MediaQuery.of(context).orientation == Orientation.portrait
          ? (mobileColumns ?? 1)
          : (tabletColumns ?? 2);
    } else {
      // Web responsive
      if (width < ResponsiveUtils.mobileBreakpoint) {
        return mobileColumns ?? 1;
      } else if (width < ResponsiveUtils.desktopBreakpoint) {
        return tabletColumns ?? 2;
      } else {
        return desktopColumns ?? 3;
      }
    }
  }
  
  Widget _buildRegularGrid(BuildContext context, int columns) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        crossAxisSpacing: spacing,
        mainAxisSpacing: runSpacing,
        childAspectRatio: _getChildAspectRatio(context),
      ),
      itemCount: children.length,
      itemBuilder: (context, index) => children[index],
    );
  }
  
  Widget _buildStaggeredGrid(BuildContext context, int columns) {
    // Implémentation staggered grid pour contenu adaptatif
    return Wrap(
      spacing: spacing,
      runSpacing: runSpacing,
      children: children.map((child) {
        final itemWidth = (MediaQuery.of(context).size.width - 
                          (spacing * (columns - 1))) / columns;
        return SizedBox(
          width: itemWidth,
          child: child,
        );
      }).toList(),
    );
  }
  
  double _getChildAspectRatio(BuildContext context) {
    if (ResponsiveUtils.isMobileScreen(context)) return 0.8;
    if (ResponsiveUtils.isTabletScreen(context)) return 1.0;
    return 1.2; // Desktop
  }
}
```

## 4. Navigation adaptative multi-plateforme

### 4.1 AppBar adaptatif

```dart
// shared/widgets/navigation/adaptive_app_bar.dart
class AdaptiveAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final bool showBackButton;
  final VoidCallback? onBackPressed;

  const AdaptiveAppBar({
    Key? key,
    required this.title,
    this.actions,
    this.leading,
    this.showBackButton = true,
    this.onBackPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (PlatformDetector.isIOS) {
      return _buildIOSAppBar(context);
    } else {
      return _buildMaterialAppBar(context);
    }
  }
  
  Widget _buildIOSAppBar(BuildContext context) {
    return CupertinoNavigationBar(
      middle: Text(
        title,
        style: AdaptiveTextStyles.headingMedium(context),
      ),
      leading: leading ?? (showBackButton && Navigator.canPop(context)
          ? CupertinoNavigationBarBackButton(
              onPressed: onBackPressed ?? () => Navigator.pop(context),
            )
          : null),
      trailing: actions != null
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: actions!,
            )
          : null,
      backgroundColor: AdaptiveColors.backgroundPrimary,
    );
  }
  
  Widget _buildMaterialAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: AdaptiveTextStyles.headingMedium(context),
      ),
      leading: leading ?? (showBackButton && Navigator.canPop(context)
          ? IconButton(
              icon: PlatformDetector.isWeb
                  ? const Icon(Icons.arrow_back)
                  : const Icon(Icons.arrow_back),
              onPressed: onBackPressed ?? () => Navigator.pop(context),
            )
          : null),
      actions: actions,
      backgroundColor: AdaptiveColors.backgroundPrimary,
      elevation: 0,
      scrolledUnderElevation: 1,
      centerTitle: PlatformDetector.isIOS,
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
```

### 4.2 Navigation bottom adaptative

```dart
// shared/widgets/navigation/adaptive_bottom_navigation.dart
class AdaptiveBottomNavigation extends StatelessWidget {
  final List<NavigationDestination> destinations;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  const AdaptiveBottomNavigation({
    Key? key,
    required this.destinations,
    required this.selectedIndex,
    required this.onDestinationSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Masquer sur desktop
    if (ResponsiveUtils.isDesktopScreen(context)) {
      return const SizedBox.shrink();
    }
    
    if (PlatformDetector.isIOS) {
      return _buildIOSBottomNav(context);
    } else {
      return _buildMaterialBottomNav(context);
    }
  }
  
  Widget _buildIOSBottomNav(BuildContext context) {
    return CupertinoTabBar(
      currentIndex: selectedIndex,
      onTap: onDestinationSelected,
      items: destinations.map((dest) => BottomNavigationBarItem(
        icon: Icon(dest.icon),
        label: dest.label,
      )).toList(),
      backgroundColor: AdaptiveColors.backgroundPrimary,
      activeColor: AdaptiveColors.primaryColor,
      inactiveColor: AdaptiveColors.textSecondary,
    );
  }
  
  Widget _buildMaterialBottomNav(BuildContext context) {
    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
      destinations: destinations.map((dest) => NavigationDestination(
        icon: Icon(dest.icon),
        label: dest.label,
      )).toList(),
      backgroundColor: AdaptiveColors.backgroundPrimary,
      indicatorColor: AdaptiveColors.primaryColor.withOpacity(0.1),
    );
  }
}
```

## 5. Composants spécialisés multi-plateforme

### 5.1 Project Card responsive

```dart
// shared/widgets/cards/adaptive_project_card.dart
class AdaptiveProjectCard extends StatelessWidget {
  final Project project;
  final VoidCallback? onTap;

  const AdaptiveProjectCard({
    Key? key,
    required this.project,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: _buildMobileCard(context),
      tablet: _buildTabletCard(context),
      desktop: _buildDesktopCard(context),
    );
  }
  
  Widget _buildMobileCard(BuildContext context) {
    return AdaptiveCard(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image avec aspect ratio mobile
          AspectRatio(
            aspectRatio: 16 / 9,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: project.coverImageUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  color: AdaptiveColors.backgroundSecondary,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: AdaptiveSpacing.md(context)),
          
          // Contenu mobile compact
          Text(
            project.title,
            style: AdaptiveTextStyles.headingMedium(context),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: AdaptiveSpacing.xs(context)),
          
          Text(
            project.shortDescription,
            style: AdaptiveTextStyles.bodySmall(context),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: AdaptiveSpacing.md(context)),
          
          // Progress bar mobile
          _buildMobileProgressSection(context),
        ],
      ),
    );
  }
  
  Widget _buildTabletCard(BuildContext context) {
    return AdaptiveCard(
      onTap: onTap,
      child: Row(
        children: [
          // Image tablette
          SizedBox(
            width: 120,
            height: 90,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: project.coverImageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: AdaptiveSpacing.md(context)),
          
          // Contenu tablette
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project.title,
                  style: AdaptiveTextStyles.headingMedium(context),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: AdaptiveSpacing.xs(context)),
                
                Text(
                  project.shortDescription,
                  style: AdaptiveTextStyles.bodyMedium(context),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: AdaptiveSpacing.sm(context)),
                
                _buildTabletProgressSection(context),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildDesktopCard(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        child: AdaptiveCard(
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image desktop avec hover effect
              AspectRatio(
                aspectRatio: 16 / 10,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Stack(
                    children: [
                      CachedNetworkImage(
                        imageUrl: project.coverImageUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                      // Overlay hover
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.3),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: AdaptiveSpacing.lg(context)),
              
              // Contenu desktop détaillé
              Text(
                project.title,
                style: AdaptiveTextStyles.headingMedium(context),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: AdaptiveSpacing.sm(context)),
              
              Text(
                project.shortDescription,
                style: AdaptiveTextStyles.bodyMedium(context),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: AdaptiveSpacing.lg(context)),
              
              _buildDesktopProgressSection(context),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildMobileProgressSection(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${project.raisedAmount.toStringAsFixed(0)}€',
              style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '${((project.raisedAmount / project.targetAmount) * 100).toStringAsFixed(0)}%',
              style: AdaptiveTextStyles.bodySmall(context),
            ),
          ],
        ),
        SizedBox(height: AdaptiveSpacing.xs(context)),
        LinearProgressIndicator(
          value: project.raisedAmount / project.targetAmount,
          backgroundColor: AdaptiveColors.backgroundSecondary,
          valueColor: AlwaysStoppedAnimation<Color>(AdaptiveColors.primaryColor),
        ),
      ],
    );
  }
  
  // Méthodes similaires pour _buildTabletProgressSection et _buildDesktopProgressSection
  // avec layouts adaptés aux différentes tailles d'écran
}
```

Cette architecture UI/UX complète assure une expérience utilisateur cohérente et native sur toutes les plateformes (mobile Android/iOS et web) tout en respectant les conventions spécifiques à chaque environnement.