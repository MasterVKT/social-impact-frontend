import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/adaptive/adaptive_loading_indicator.dart';
import '../../../../shared/widgets/adaptive/adaptive_button.dart';
import '../../../../shared/widgets/responsive_layout.dart';
import '../providers/providers.dart';

/// Simple dashboard page to demonstrate successful authentication
/// Shows user info and provides sign out functionality
class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    final userPermissions = ref.watch(userPermissionsProvider);
    final sessionState = ref.watch(sessionControllerProvider);

    if (user == null) {
      return const Scaffold(
        body: Center(
          child: AdaptiveLoadingIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            onPressed: sessionState.isLoading
                ? null
                : () => _handleSignOut(ref),
            icon: sessionState.isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: AdaptiveLoadingIndicator(size: 20, strokeWidth: 2),
                  )
                : const Icon(Icons.logout),
            tooltip: 'Sign Out',
          ),
        ],
      ),
      body: ResponsiveLayout(
        mobile: _buildMobileLayout(context, user, userPermissions),
        tablet: _buildTabletLayout(context, user, userPermissions),
        desktop: _buildDesktopLayout(context, user, userPermissions),
      ),
    );
  }

  Widget _buildMobileLayout(
    BuildContext context,
    user,
    UserPermissions permissions,
  ) {
    return AdaptiveRefreshIndicator(
      onRefresh: () async {
        // Refresh dashboard data
        await Future.delayed(const Duration(seconds: 1));
      },
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        physics: const AlwaysScrollableScrollPhysics(),
        child: _buildDashboardContent(context, user, permissions),
      ),
    );
  }

  Widget _buildTabletLayout(
    BuildContext context, 
    user, 
    UserPermissions permissions,
  ) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: SizedBox(
          width: 600,
          child: _buildDashboardContent(context, user, permissions),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(
    BuildContext context, 
    user, 
    UserPermissions permissions,
  ) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: SizedBox(
          width: 800,
          child: _buildDashboardContent(context, user, permissions),
        ),
      ),
    );
  }

  Widget _buildDashboardContent(
    BuildContext context, 
    user, 
    UserPermissions permissions,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Welcome Header
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).primaryColor.withOpacity(0.8),
              ],
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: user.photoURL != null 
                    ? NetworkImage(user.photoURL!)
                    : null,
                child: user.photoURL == null
                    ? Text(
                        user.displayName?.substring(0, 1).toUpperCase() ?? 
                        user.email.substring(0, 1).toUpperCase(),
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )
                    : null,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome back!',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                    Text(
                      user.displayName ?? user.email,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      user.role.name.toUpperCase(),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white.withOpacity(0.8),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        
        // User Information
        _buildInfoSection(context, 'Account Information', [
          _InfoItem('Email', user.email),
          _InfoItem('Role', user.role.displayName),
          _InfoItem('Status', user.status.displayName),
          _InfoItem('KYC Status', user.kycStatus.displayName),
          _InfoItem('Email Verified', user.isEmailVerified ? 'Yes' : 'No'),
        ]),
        const SizedBox(height: 24),
        
        // Permissions
        _buildInfoSection(context, 'Permissions', [
          _PermissionItem('View Dashboard', permissions.canViewDashboard),
          _PermissionItem('Make Investments', permissions.canInvest),
          _PermissionItem('Create Projects', permissions.canCreateProjects),
          _PermissionItem('Manage Users', permissions.canManageUsers),
          _PermissionItem('Access Admin Panel', permissions.canAccessAdminPanel),
        ]),
        const SizedBox(height: 24),
        
        // Quick Actions
        _buildQuickActions(context),
      ],
    );
  }

  Widget _buildInfoSection(BuildContext context, String title, List<Widget> items) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ...items,
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Quick Actions',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                AdaptiveButton(
                  text: 'Edit Profile',
                  onPressed: () {
                    // Navigate to profile
                  },
                  icon: const Icon(Icons.person),
                ),
                AdaptiveButton(
                  text: 'Settings',
                  onPressed: () {
                    // Navigate to settings
                  },
                  icon: const Icon(Icons.settings),
                ),
                AdaptiveButton(
                  text: 'Security',
                  onPressed: () {
                    // Navigate to security
                  },
                  icon: const Icon(Icons.security),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _handleSignOut(WidgetRef ref) async {
    await ref.read(sessionControllerProvider.notifier).signOut();
  }
}

class _InfoItem extends StatelessWidget {
  final String label;
  final String value;

  const _InfoItem(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}

class _PermissionItem extends StatelessWidget {
  final String label;
  final bool hasPermission;

  const _PermissionItem(this.label, this.hasPermission);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(
            hasPermission ? Icons.check_circle : Icons.cancel,
            size: 20,
            color: hasPermission 
                ? Colors.green 
                : Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: hasPermission 
                    ? null 
                    : Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}