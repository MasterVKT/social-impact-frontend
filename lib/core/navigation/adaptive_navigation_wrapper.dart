import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../shared/widgets/responsive/responsive_layout.dart';
import '../../shared/constants/spacing.dart';
import '../../features/auth/presentation/providers/auth_providers.dart';
import '../../features/auth/domain/entities/user.dart';

/// Adaptive navigation wrapper that provides appropriate navigation patterns
/// for different screen sizes and user roles
class AdaptiveNavigationWrapper extends ConsumerStatefulWidget {
  final Widget child;
  final String currentRoute;
  
  const AdaptiveNavigationWrapper({
    super.key,
    required this.child,
    required this.currentRoute,
  });

  @override
  ConsumerState<AdaptiveNavigationWrapper> createState() => _AdaptiveNavigationWrapperState();
}

class _AdaptiveNavigationWrapperState extends ConsumerState<AdaptiveNavigationWrapper> {
  int _selectedIndex = 0;
  
  @override
  void initState() {
    super.initState();
    _selectedIndex = _getIndexFromRoute(widget.currentRoute);
  }
  
  @override
  void didUpdateWidget(AdaptiveNavigationWrapper oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentRoute != widget.currentRoute) {
      _selectedIndex = _getIndexFromRoute(widget.currentRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(currentUserProvider);
    
    if (user == null) return widget.child;
    
    final navItems = _getNavigationItems(user);
    
    return ResponsiveLayout(
      mobile: _buildMobileNavigation(context, user, navItems),
      tablet: _buildTabletNavigation(context, user, navItems),
      desktop: _buildDesktopNavigation(context, user, navItems),
    );
  }
  
  /// Build mobile navigation (bottom navigation)
  Widget _buildMobileNavigation(
    BuildContext context,
    User user,
    List<NavigationItem> navItems,
  ) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _handleNavigation,
        items: navItems
            .map((item) => BottomNavigationBarItem(
                  icon: Icon(item.icon),
                  activeIcon: Icon(item.activeIcon ?? item.icon),
                  label: item.label,
                ))
            .toList(),
      ),
      floatingActionButton: _buildFloatingActionButton(context, user),
    );
  }
  
  /// Build tablet navigation (navigation rail)
  Widget _buildTabletNavigation(
    BuildContext context,
    User user,
    List<NavigationItem> navItems,
  ) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: _handleNavigation,
            extended: false,
            destinations: navItems
                .map((item) => NavigationRailDestination(
                      icon: Icon(item.icon),
                      selectedIcon: Icon(item.activeIcon ?? item.icon),
                      label: Text(item.label),
                    ))
                .toList(),
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(child: widget.child),
        ],
      ),
      floatingActionButton: _buildFloatingActionButton(context, user),
    );
  }
  
  /// Build desktop navigation (drawer navigation)
  Widget _buildDesktopNavigation(
    BuildContext context,
    User user,
    List<NavigationItem> navItems,
  ) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: 280,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              border: Border(
                right: BorderSide(
                  color: Theme.of(context).dividerColor,
                  width: 1,
                ),
              ),
            ),
            child: Column(
              children: [
                _buildDesktopHeader(context, user),
                Expanded(
                  child: _buildDesktopNavigationList(context, navItems),
                ),
                _buildDesktopFooter(context, user),
              ],
            ),
          ),
          Expanded(child: widget.child),
        ],
      ),
    );
  }
  
  /// Build desktop navigation header
  Widget _buildDesktopHeader(BuildContext context, User user) {
    return Container(
      padding: const EdgeInsets.all(Spacing.lg),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: user.photoURL != null
                ? ClipOval(
                    child: Image.network(
                      user.photoURL!,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Text(
                        user.initials,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                : Text(
                    user.initials,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
          const SizedBox(width: Spacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.fullName,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  user.role.displayName,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  /// Build desktop navigation list
  Widget _buildDesktopNavigationList(BuildContext context, List<NavigationItem> navItems) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: Spacing.sm),
      itemCount: navItems.length,
      itemBuilder: (context, index) {
        final item = navItems[index];
        final isSelected = index == _selectedIndex;
        
        return Container(
          margin: const EdgeInsets.symmetric(
            horizontal: Spacing.sm,
            vertical: 2,
          ),
          child: ListTile(
            leading: Icon(
              isSelected ? (item.activeIcon ?? item.icon) : item.icon,
              color: isSelected
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
            ),
            title: Text(
              item.label,
              style: TextStyle(
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.onSurface,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
            selected: isSelected,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            onTap: () => _handleNavigation(index),
          ),
        );
      },
    );
  }
  
  /// Build desktop navigation footer
  Widget _buildDesktopFooter(BuildContext context, User user) {
    return Container(
      padding: const EdgeInsets.all(Spacing.md),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Theme.of(context).dividerColor,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () => _navigateToSettings(context),
              icon: const Icon(Icons.settings, size: 16),
              label: const Text('Settings'),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: Spacing.sm),
              ),
            ),
          ),
          const SizedBox(width: Spacing.sm),
          IconButton(
            onPressed: () => _showLogoutDialog(context),
            icon: const Icon(Icons.logout),
            tooltip: 'Sign Out',
          ),
        ],
      ),
    );
  }
  
  /// Build floating action button based on user role and current screen
  Widget? _buildFloatingActionButton(BuildContext context, User user) {
    switch (_selectedIndex) {
      case 0: // Dashboard
        return null;
      case 1: // Investments/Projects
        if (user.role == UserRole.investor) {
          return FloatingActionButton(
            onPressed: () => _navigateToBrowseProjects(context),
            tooltip: 'Browse Projects',
            child: const Icon(Icons.search),
          );
        } else if (user.role == UserRole.organization) {
          return FloatingActionButton(
            onPressed: () => _navigateToCreateProject(context),
            tooltip: 'Create Project',
            child: const Icon(Icons.add),
          );
        }
        break;
      default:
        return null;
    }
    return null;
  }
  
  /// Get navigation items based on user role
  List<NavigationItem> _getNavigationItems(User user) {
    final baseItems = [
      const NavigationItem(
        label: 'Dashboard',
        icon: Icons.dashboard_outlined,
        activeIcon: Icons.dashboard,
        route: '/dashboard',
      ),
    ];
    
    switch (user.role) {
      case UserRole.investor:
        baseItems.addAll([
          const NavigationItem(
            label: 'Investments',
            icon: Icons.trending_up_outlined,
            activeIcon: Icons.trending_up,
            route: '/investments',
          ),
          const NavigationItem(
            label: 'Portfolio',
            icon: Icons.account_balance_wallet_outlined,
            activeIcon: Icons.account_balance_wallet,
            route: '/portfolio',
          ),
          const NavigationItem(
            label: 'Browse',
            icon: Icons.search_outlined,
            activeIcon: Icons.search,
            route: '/browse',
          ),
        ]);
        break;
        
      case UserRole.organization:
        baseItems.addAll([
          const NavigationItem(
            label: 'Projects',
            icon: Icons.business_center_outlined,
            activeIcon: Icons.business_center,
            route: '/projects',
          ),
          const NavigationItem(
            label: 'Impact',
            icon: Icons.public_outlined,
            activeIcon: Icons.public,
            route: '/impact',
          ),
          const NavigationItem(
            label: 'Analytics',
            icon: Icons.analytics_outlined,
            activeIcon: Icons.analytics,
            route: '/analytics',
          ),
        ]);
        break;
        
      case UserRole.auditor:
        baseItems.addAll([
          const NavigationItem(
            label: 'Audits',
            icon: Icons.fact_check_outlined,
            activeIcon: Icons.fact_check,
            route: '/audits',
          ),
          const NavigationItem(
            label: 'Reports',
            icon: Icons.assignment_outlined,
            activeIcon: Icons.assignment,
            route: '/reports',
          ),
        ]);
        break;
        
      case UserRole.admin:
        baseItems.addAll([
          const NavigationItem(
            label: 'Users',
            icon: Icons.people_outlined,
            activeIcon: Icons.people,
            route: '/admin/users',
          ),
          const NavigationItem(
            label: 'Projects',
            icon: Icons.folder_outlined,
            activeIcon: Icons.folder,
            route: '/admin/projects',
          ),
          const NavigationItem(
            label: 'Analytics',
            icon: Icons.bar_chart_outlined,
            activeIcon: Icons.bar_chart,
            route: '/admin/analytics',
          ),
        ]);
        break;
    }
    
    // Common items for all users
    baseItems.add(
      const NavigationItem(
        label: 'Profile',
        icon: Icons.person_outlined,
        activeIcon: Icons.person,
        route: '/profile',
      ),
    );
    
    return baseItems;
  }
  
  /// Handle navigation item selection
  void _handleNavigation(int index) {
    if (_selectedIndex == index) return;
    
    setState(() {
      _selectedIndex = index;
    });
    
    final user = ref.read(currentUserProvider);
    if (user != null) {
      final navItems = _getNavigationItems(user);
      if (index < navItems.length) {
        context.go(navItems[index].route);
      }
    }
  }
  
  /// Get navigation index from route
  int _getIndexFromRoute(String route) {
    final user = ref.read(currentUserProvider);
    if (user == null) return 0;
    
    final navItems = _getNavigationItems(user);
    final index = navItems.indexWhere((item) => item.route == route);
    return index >= 0 ? index : 0;
  }
  
  /// Show logout confirmation dialog
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sign Out'),
        content: const Text('Are you sure you want to sign out?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _handleLogout();
            },
            child: const Text('Sign Out'),
          ),
        ],
      ),
    );
  }
  
  /// Handle user logout
  void _handleLogout() async {
    final sessionUseCase = ref.read(sessionManagementUseCaseProvider);
    await sessionUseCase.signOut();
    if (context.mounted) {
      context.go('/login');
    }
  }
  
  // Navigation methods
  void _navigateToSettings(BuildContext context) {
    context.go('/settings');
  }
  
  void _navigateToBrowseProjects(BuildContext context) {
    context.go('/browse');
  }
  
  void _navigateToCreateProject(BuildContext context) {
    context.go('/projects/create');
  }
}

/// Navigation item data class
class NavigationItem {
  final String label;
  final IconData icon;
  final IconData? activeIcon;
  final String route;
  
  const NavigationItem({
    required this.label,
    required this.icon,
    this.activeIcon,
    required this.route,
  });
}