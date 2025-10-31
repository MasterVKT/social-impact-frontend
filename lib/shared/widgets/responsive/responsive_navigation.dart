import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../utils/responsive_breakpoints.dart';
import '../accessibility/accessibility_wrapper.dart';

/// Responsive navigation wrapper that adapts navigation style based on screen size
class ResponsiveNavigation extends ConsumerStatefulWidget {
  final List<NavigationDestination> destinations;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final Widget body;
  final Widget? floatingActionButton;
  final String? title;
  final List<Widget>? actions;
  final PreferredSizeWidget? appBar;

  const ResponsiveNavigation({
    super.key,
    required this.destinations,
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.body,
    this.floatingActionButton,
    this.title,
    this.actions,
    this.appBar,
  });

  @override
  ConsumerState<ResponsiveNavigation> createState() =>
      _ResponsiveNavigationState();
}

class _ResponsiveNavigationState extends ConsumerState<ResponsiveNavigation> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    if (ResponsiveBreakpoints.isDesktop(context)) {
      return _buildDesktopLayout();
    } else if (ResponsiveBreakpoints.isTablet(context)) {
      return _buildTabletLayout();
    } else {
      return _buildMobileLayout();
    }
  }

  /// Build desktop layout with navigation rail
  Widget _buildDesktopLayout() {
    return Scaffold(
      key: _scaffoldKey,
      appBar: widget.appBar ?? _buildAppBar(),
      body: Row(
        children: [
          AccessibilityWrapper(
            semanticsLabel: 'Main navigation',
            role: SemanticsRole.list,
            child: NavigationRail(
              selectedIndex: widget.selectedIndex,
              onDestinationSelected: widget.onDestinationSelected,
              labelType: NavigationRailLabelType.all,
              destinations: widget.destinations
                  .map((dest) => NavigationRailDestination(
                        icon: dest.icon,
                        selectedIcon: dest.selectedIcon,
                        label: Text(dest.label),
                      ))
                  .toList(),
              minWidth: ResponsiveBreakpoints.getNavigationRailWidth(context),
              backgroundColor:
                  Theme.of(context).colorScheme.surfaceContainerHighest.withOpacity(0.3),
            ),
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: ResponsiveContainer(
              child: widget.body,
            ),
          ),
        ],
      ),
      floatingActionButton: widget.floatingActionButton,
    );
  }

  /// Build tablet layout with drawer
  Widget _buildTabletLayout() {
    return Scaffold(
      key: _scaffoldKey,
      appBar: widget.appBar ?? _buildAppBar(),
      drawer: AccessibilityWrapper(
        semanticsLabel: 'Navigation drawer',
        child: _buildDrawer(),
      ),
      body: ResponsiveContainer(
        child: widget.body,
      ),
      floatingActionButton: widget.floatingActionButton,
    );
  }

  /// Build mobile layout with bottom navigation
  Widget _buildMobileLayout() {
    return Scaffold(
      key: _scaffoldKey,
      appBar: widget.appBar ?? _buildAppBar(),
      body: ResponsiveContainer(
        child: widget.body,
      ),
      bottomNavigationBar: AccessibilityWrapper(
        semanticsLabel: 'Bottom navigation',
        role: SemanticsRole.list,
        child: NavigationBar(
          selectedIndex: widget.selectedIndex,
          onDestinationSelected: widget.onDestinationSelected,
          destinations: widget.destinations as List<Widget>,
          height: ResponsiveBreakpoints.getButtonHeight(context) + 16,
        ),
      ),
      floatingActionButton: widget.floatingActionButton,
    );
  }

  /// Build app bar
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: widget.title != null ? Text(widget.title!) : null,
      actions: widget.actions,
      backgroundColor: Theme.of(context).colorScheme.surface.withOpacity(0.95),
      elevation: 0,
      scrolledUnderElevation: 1,
      centerTitle: ResponsiveBreakpoints.isMobile(context),
    );
  }

  /// Build navigation drawer
  Widget _buildDrawer() {
    return Drawer(
      width: ResponsiveBreakpoints.getSidebarWidth(context),
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.eco,
                  size: 48,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
                const SizedBox(height: 8),
                Text(
                  'Social Impact',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  'Investment Platform',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onPrimaryContainer
                            .withOpacity(0.8),
                      ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.destinations.length,
              itemBuilder: (context, index) {
                final destination = widget.destinations[index];
                final isSelected = index == widget.selectedIndex;

                return AccessibilityWrapper(
                  semanticsLabel: '${destination.label} navigation item',
                  role: SemanticsRole.button,
                  child: ListTile(
                    leading: isSelected
                        ? destination.selectedIcon
                        : destination.icon,
                    title: Text(destination.label),
                    selected: isSelected,
                    onTap: () {
                      widget.onDestinationSelected(index);
                      Navigator.pop(context);
                    },
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 4,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/// Responsive container for body content
class ResponsiveContainer extends ConsumerWidget {
  final Widget child;
  final EdgeInsets? padding;
  final bool applyMaxWidth;

  const ResponsiveContainer({
    super.key,
    required this.child,
    this.padding,
    this.applyMaxWidth = true,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget container = child;

    if (applyMaxWidth) {
      container = Center(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: ResponsiveBreakpoints.getMaxWidth(context),
          ),
          child: container,
        ),
      );
    }

    if (padding != null) {
      container = Padding(
        padding: padding!,
        child: container,
      );
    }

    return container;
  }
}

/// Responsive navigation destination
class NavigationDestination {
  final Widget icon;
  final Widget? selectedIcon;
  final String label;
  final String? tooltip;

  const NavigationDestination({
    required this.icon,
    this.selectedIcon,
    required this.label,
    this.tooltip,
  });
}

/// Responsive tab navigation
class ResponsiveTabNavigation extends ConsumerStatefulWidget {
  final List<Tab> tabs;
  final List<Widget> children;
  final int initialIndex;
  final ValueChanged<int>? onTap;
  final String? semanticsLabel;

  const ResponsiveTabNavigation({
    super.key,
    required this.tabs,
    required this.children,
    this.initialIndex = 0,
    this.onTap,
    this.semanticsLabel,
  });

  @override
  ConsumerState<ResponsiveTabNavigation> createState() =>
      _ResponsiveTabNavigationState();
}

class _ResponsiveTabNavigationState
    extends ConsumerState<ResponsiveTabNavigation>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: widget.tabs.length,
      vsync: this,
      initialIndex: widget.initialIndex,
    );

    if (widget.onTap != null) {
      _tabController.addListener(() {
        if (!_tabController.indexIsChanging) {
          widget.onTap!(_tabController.index);
        }
      });
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (ResponsiveBreakpoints.isMobile(context)) {
      return _buildMobileTabView();
    } else {
      return _buildDesktopTabView();
    }
  }

  /// Build mobile tab view
  Widget _buildMobileTabView() {
    return Column(
      children: [
        AccessibilityWrapper(
          semanticsLabel: widget.semanticsLabel ?? 'Tab navigation',
          role: SemanticsRole.list,
          child: TabBar(
            controller: _tabController,
            tabs: widget.tabs,
            isScrollable: widget.tabs.length > 3,
            tabAlignment:
                widget.tabs.length > 3 ? TabAlignment.start : TabAlignment.fill,
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: widget.children,
          ),
        ),
      ],
    );
  }

  /// Build desktop tab view
  Widget _buildDesktopTabView() {
    return Column(
      children: [
        Container(
          padding: ResponsiveBreakpoints.getPadding(context),
          child: AccessibilityWrapper(
            semanticsLabel: widget.semanticsLabel ?? 'Tab navigation',
            role: SemanticsRole.list,
            child: TabBar(
              controller: _tabController,
              tabs: widget.tabs,
              isScrollable: false,
              tabAlignment: TabAlignment.center,
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: widget.children
                .map((child) => ResponsiveContainer(child: child))
                .toList(),
          ),
        ),
      ],
    );
  }
}

/// Responsive breadcrumb navigation
class ResponsiveBreadcrumb extends ConsumerWidget {
  final List<BreadcrumbItem> items;
  final String? semanticsLabel;

  const ResponsiveBreadcrumb({
    super.key,
    required this.items,
    this.semanticsLabel,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (ResponsiveBreakpoints.isMobile(context) && items.length > 3) {
      return _buildCollapsedBreadcrumb(context);
    } else {
      return _buildFullBreadcrumb(context);
    }
  }

  /// Build full breadcrumb
  Widget _buildFullBreadcrumb(BuildContext context) {
    return AccessibilityWrapper(
      semanticsLabel: semanticsLabel ?? 'Breadcrumb navigation',
      role: SemanticsRole.list,
      child: Wrap(
        children: items.asMap().entries.expand((entry) {
          final index = entry.key;
          final item = entry.value;
          final isLast = index == items.length - 1;

          return [
            _buildBreadcrumbItem(context, item, isLast),
            if (!isLast) _buildSeparator(context),
          ];
        }).toList(),
      ),
    );
  }

  /// Build collapsed breadcrumb for mobile
  Widget _buildCollapsedBreadcrumb(BuildContext context) {
    final firstItem = items.first;
    final lastItem = items.last;

    return AccessibilityWrapper(
      semanticsLabel: semanticsLabel ?? 'Breadcrumb navigation',
      role: SemanticsRole.list,
      child: Row(
        children: [
          _buildBreadcrumbItem(context, firstItem, false),
          _buildSeparator(context),
          Icon(
            Icons.more_horiz,
            size: 16,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
          ),
          _buildSeparator(context),
          _buildBreadcrumbItem(context, lastItem, true),
        ],
      ),
    );
  }

  /// Build breadcrumb item
  Widget _buildBreadcrumbItem(
      BuildContext context, BreadcrumbItem item, bool isLast) {
    final textStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: isLast
              ? Theme.of(context).colorScheme.onSurface
              : Theme.of(context).colorScheme.primary,
          fontWeight: isLast ? FontWeight.w600 : FontWeight.normal,
        );

    if (isLast || item.onTap == null) {
      return Text(item.label, style: textStyle);
    }

    return AccessibilityWrapper(
      semanticsLabel: '${item.label} breadcrumb link',
      role: SemanticsRole.button,
      child: InkWell(
        onTap: item.onTap,
        borderRadius: BorderRadius.circular(4),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          child: Text(item.label, style: textStyle),
        ),
      ),
    );
  }

  /// Build separator
  Widget _buildSeparator(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Icon(
        Icons.chevron_right,
        size: 16,
        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
      ),
    );
  }
}

/// Breadcrumb item
class BreadcrumbItem {
  final String label;
  final VoidCallback? onTap;

  const BreadcrumbItem({
    required this.label,
    this.onTap,
  });
}
