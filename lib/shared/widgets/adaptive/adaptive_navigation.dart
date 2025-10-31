import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/platform_detector.dart';
import '../../../core/utils/responsive_utils.dart';
import '../../../core/themes/color_scheme.dart';

/// AdaptiveNavigation provides platform-aware navigation patterns:
/// - Mobile: Bottom navigation bar (iOS: CupertinoTabBar, Android/Web: BottomNavigationBar)
/// - Tablet: Navigation rail
/// - Desktop: Navigation drawer or rail based on screen size
class AdaptiveNavigation extends StatelessWidget {
  final List<NavigationItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;
  final NavigationType? forceType;
  final bool showLabels;
  final double? railWidth;
  final Widget? header;
  final Widget? footer;

  const AdaptiveNavigation({
    Key? key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
    this.forceType,
    this.showLabels = true,
    this.railWidth,
    this.header,
    this.footer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationType = forceType ?? _getNavigationType(context);

    switch (navigationType) {
      case NavigationType.bottomBar:
        return _buildBottomNavigation(context);
      case NavigationType.rail:
        return _buildNavigationRail(context);
      case NavigationType.drawer:
        return _buildNavigationDrawer(context);
      case NavigationType.tab:
        return _buildTabNavigation(context);
    }
  }

  NavigationType _getNavigationType(BuildContext context) {
    // Platform-first logic
    if (PlatformDetector.isMobile) {
      // On mobile, use bottom navigation unless screen is too wide
      if (ResponsiveUtils.isTabletScreen(context) &&
          ResponsiveUtils.isLandscape(context)) {
        return NavigationType.rail;
      }
      return PlatformDetector.isIOS
          ? NavigationType.tab
          : NavigationType.bottomBar;
    } else if (ResponsiveUtils.isTabletScreen(context)) {
      return NavigationType.rail;
    } else {
      // Desktop: use rail for smaller desktop screens, drawer for larger ones
      return ResponsiveUtils.isLargeDesktopScreen(context)
          ? NavigationType.drawer
          : NavigationType.rail;
    }
  }

  // iOS-style tab navigation
  Widget _buildTabNavigation(BuildContext context) {
    return CupertinoTabBar(
      items: items
          .map((item) => BottomNavigationBarItem(
                icon: _buildAdaptiveIcon(item.icon, item.activeIcon),
                label: showLabels ? item.label : null,
                tooltip: item.tooltip,
              ))
          .toList(),
      currentIndex: currentIndex,
      onTap: onTap,
      activeColor: AdaptiveColors.primary,
      inactiveColor: CupertinoColors.inactiveGray,
      backgroundColor: CupertinoColors.systemBackground,
    );
  }

  // Material bottom navigation
  Widget _buildBottomNavigation(BuildContext context) {
    return BottomNavigationBar(
      items: items
          .map((item) => BottomNavigationBarItem(
                icon: _buildAdaptiveIcon(item.icon, item.activeIcon),
                label: showLabels ? item.label : null,
                tooltip: item.tooltip,
              ))
          .toList(),
      currentIndex: currentIndex,
      onTap: onTap,
      type: items.length > 3
          ? BottomNavigationBarType.shifting
          : BottomNavigationBarType.fixed,
      selectedItemColor: AdaptiveColors.primary,
      unselectedItemColor: AdaptiveColors.neutral500,
      backgroundColor: AdaptiveColors.surface,
      elevation: 8,
      showUnselectedLabels: showLabels,
      selectedLabelStyle: TextStyle(
        fontSize: ResponsiveUtils.getAdaptiveFontSize(context, 12),
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: ResponsiveUtils.getAdaptiveFontSize(context, 12),
        fontWeight: FontWeight.normal,
      ),
    );
  }

  // Navigation rail for tablets and small desktops
  Widget _buildNavigationRail(BuildContext context) {
    return NavigationRail(
      destinations: items
          .map((item) => NavigationRailDestination(
                icon: _buildAdaptiveIcon(item.icon, item.activeIcon,
                    isRail: true),
                selectedIcon: _buildAdaptiveIcon(
                    item.activeIcon ?? item.icon, null,
                    isRail: true),
                label: Text(item.label),
              ))
          .toList(),
      selectedIndex: currentIndex,
      onDestinationSelected: onTap,
      labelType: showLabels
          ? NavigationRailLabelType.all
          : NavigationRailLabelType.none,
      leading: header,
      trailing: footer != null
          ? Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: footer!,
              ),
            )
          : null,
      groupAlignment: 0.0,
      selectedIconTheme: const IconThemeData(
        color: AdaptiveColors.primary,
        size: 28,
      ),
      unselectedIconTheme: const IconThemeData(
        color: AdaptiveColors.neutral500,
        size: 24,
      ),
      selectedLabelTextStyle: TextStyle(
        color: AdaptiveColors.primary,
        fontSize: ResponsiveUtils.getAdaptiveFontSize(context, 14),
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelTextStyle: TextStyle(
        color: AdaptiveColors.neutral500,
        fontSize: ResponsiveUtils.getAdaptiveFontSize(context, 14),
        fontWeight: FontWeight.normal,
      ),
      backgroundColor: AdaptiveColors.surface,
      elevation: 1,
      // width: railWidth ?? (showLabels ? 120 : 80), // Commented out as width is not available in current Flutter version
      minWidth: showLabels ? 80 : 56,
      minExtendedWidth: 120,
      useIndicator: true,
      indicatorColor: AdaptiveColors.primary.withOpacity(0.12),
    );
  }

  // Navigation drawer for large desktops
  Widget _buildNavigationDrawer(BuildContext context) {
    return Drawer(
      width: 280,
      backgroundColor: AdaptiveColors.surface,
      elevation: 1,
      child: Column(
        children: [
          if (header != null) ...[
            header!,
            const Divider(),
          ],
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                final isSelected = currentIndex == index;

                return ListTile(
                  leading: _buildAdaptiveIcon(
                    isSelected ? (item.activeIcon ?? item.icon) : item.icon,
                    null,
                  ),
                  title: Text(item.label),
                  subtitle: item.subtitle != null ? Text(item.subtitle!) : null,
                  selected: isSelected,
                  onTap: () => onTap(index),
                  selectedTileColor: AdaptiveColors.primary.withOpacity(0.12),
                  selectedColor: AdaptiveColors.primary,
                  iconColor: isSelected
                      ? AdaptiveColors.primary
                      : AdaptiveColors.neutral500,
                  textColor: isSelected
                      ? AdaptiveColors.primary
                      : AdaptiveColors.onSurface,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 4,
                  ),
                  visualDensity: VisualDensity.comfortable,
                );
              },
            ),
          ),
          if (footer != null) ...[
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: footer!,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildAdaptiveIcon(IconData icon, IconData? activeIcon,
      {bool isRail = false}) {
    final isActive = activeIcon != null;
    final iconToShow = isActive ? activeIcon : icon;

    return Icon(
      iconToShow,
      size: isRail ? (isActive ? 28 : 24) : 24,
    );
  }
}

/// Navigation item data model
class NavigationItem {
  final IconData icon;
  final IconData? activeIcon;
  final String label;
  final String? tooltip;
  final String? subtitle;
  final VoidCallback? onLongPress;
  final bool enabled;

  const NavigationItem({
    required this.icon,
    required this.label,
    this.activeIcon,
    this.tooltip,
    this.subtitle,
    this.onLongPress,
    this.enabled = true,
  });

  // Helper constructor for common icons
  static NavigationItem dashboard({
    String label = 'Dashboard',
    String? tooltip,
  }) =>
      NavigationItem(
        icon: Icons.dashboard_outlined,
        activeIcon: Icons.dashboard,
        label: label,
        tooltip: tooltip,
      );

  static NavigationItem projects({
    String label = 'Projects',
    String? tooltip,
  }) =>
      NavigationItem(
        icon: Icons.work_outline,
        activeIcon: Icons.work,
        label: label,
        tooltip: tooltip,
      );

  static NavigationItem contributions({
    String label = 'Contributions',
    String? tooltip,
  }) =>
      NavigationItem(
        icon: Icons.attach_money_outlined,
        activeIcon: Icons.attach_money,
        label: label,
        tooltip: tooltip,
      );

  static NavigationItem audits({
    String label = 'Audits',
    String? tooltip,
  }) =>
      NavigationItem(
        icon: Icons.assessment_outlined,
        activeIcon: Icons.assessment,
        label: label,
        tooltip: tooltip,
      );

  static NavigationItem profile({
    String label = 'Profile',
    String? tooltip,
  }) =>
      NavigationItem(
        icon: Icons.person_outline,
        activeIcon: Icons.person,
        label: label,
        tooltip: tooltip,
      );
}

/// Types of navigation patterns
enum NavigationType {
  bottomBar, // Material bottom navigation
  rail, // Navigation rail for tablets
  drawer, // Navigation drawer for desktop
  tab, // Cupertino tab bar for iOS
}

/// Adaptive scaffold that integrates with AdaptiveNavigation
class AdaptiveScaffold extends StatelessWidget {
  final Widget body;
  final List<NavigationItem> navigationItems;
  final int currentNavigationIndex;
  final ValueChanged<int> onNavigationChanged;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? drawer;
  final Widget? endDrawer;
  final Widget? bottomSheet;
  final Color? backgroundColor;
  final bool resizeToAvoidBottomInset;
  final bool extendBody;
  final bool extendBodyBehindAppBar;

  const AdaptiveScaffold({
    Key? key,
    required this.body,
    required this.navigationItems,
    required this.currentNavigationIndex,
    required this.onNavigationChanged,
    this.appBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.drawer,
    this.endDrawer,
    this.bottomSheet,
    this.backgroundColor,
    this.resizeToAvoidBottomInset = true,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationType = _getNavigationType(context);

    // For drawer navigation, include it in the scaffold
    if (navigationType == NavigationType.drawer) {
      return Scaffold(
        appBar: appBar,
        drawer: AdaptiveNavigation(
          items: navigationItems,
          currentIndex: currentNavigationIndex,
          onTap: onNavigationChanged,
          forceType: NavigationType.drawer,
        ),
        endDrawer: endDrawer,
        body: body,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
        bottomSheet: bottomSheet,
        backgroundColor: backgroundColor,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        extendBody: extendBody,
        extendBodyBehindAppBar: extendBodyBehindAppBar,
      );
    }

    // For rail navigation, create a row layout
    if (navigationType == NavigationType.rail) {
      return Scaffold(
        appBar: appBar,
        endDrawer: endDrawer,
        body: Row(
          children: [
            AdaptiveNavigation(
              items: navigationItems,
              currentIndex: currentNavigationIndex,
              onTap: onNavigationChanged,
              forceType: NavigationType.rail,
            ),
            const VerticalDivider(thickness: 1, width: 1),
            Expanded(child: body),
          ],
        ),
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
        bottomSheet: bottomSheet,
        backgroundColor: backgroundColor,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        extendBody: extendBody,
        extendBodyBehindAppBar: extendBodyBehindAppBar,
      );
    }

    // For bottom navigation (Material and Cupertino)
    return Scaffold(
      appBar: appBar,
      drawer: drawer,
      endDrawer: endDrawer,
      body: body,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      bottomNavigationBar: AdaptiveNavigation(
        items: navigationItems,
        currentIndex: currentNavigationIndex,
        onTap: onNavigationChanged,
        forceType: navigationType,
      ),
      bottomSheet: bottomSheet,
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      extendBody: extendBody,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
    );
  }

  NavigationType _getNavigationType(BuildContext context) {
    if (PlatformDetector.isMobile) {
      if (ResponsiveUtils.isTabletScreen(context) &&
          ResponsiveUtils.isLandscape(context)) {
        return NavigationType.rail;
      }
      return PlatformDetector.isIOS
          ? NavigationType.tab
          : NavigationType.bottomBar;
    } else if (ResponsiveUtils.isTabletScreen(context)) {
      return NavigationType.rail;
    } else {
      return ResponsiveUtils.isLargeDesktopScreen(context)
          ? NavigationType.drawer
          : NavigationType.rail;
    }
  }
}
