import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/constants/spacing.dart';

/// Project management card showing organization's projects
class ProjectManagementCard extends ConsumerStatefulWidget {
  final bool showAll;
  final int? maxItems;

  const ProjectManagementCard({
    super.key,
    this.showAll = false,
    this.maxItems,
  });

  @override
  ConsumerState<ProjectManagementCard> createState() =>
      _ProjectManagementCardState();
}

class _ProjectManagementCardState extends ConsumerState<ProjectManagementCard> {
  String _selectedFilter = 'all';

  @override
  Widget build(BuildContext context) {
    return AdaptiveCard(
      child: Column(
        children: [
          _buildHeader(context),
          if (widget.showAll) _buildFilters(context),
          _buildProjectList(context),
        ],
      ),
    );
  }

  /// Build card header
  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Spacing.lg),
      child: Row(
        children: [
          Icon(
            Icons.folder_outlined,
            color: Theme.of(context).colorScheme.primary,
            size: 24,
          ),
          const SizedBox(width: Spacing.sm),
          Text(
            widget.showAll ? 'All Projects' : 'Recent Projects',
            style: AdaptiveTextStyles.titleMedium(context),
          ),
          const Spacer(),
          if (!widget.showAll)
            TextButton(
              onPressed: () => _navigateToAllProjects(),
              child: const Text('View All'),
            ),
          if (widget.showAll)
            PopupMenuButton<String>(
              onSelected: _handleAction,
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'export',
                  child: ListTile(
                    leading: Icon(Icons.download),
                    title: Text('Export List'),
                  ),
                ),
                const PopupMenuItem(
                  value: 'archive',
                  child: ListTile(
                    leading: Icon(Icons.archive),
                    title: Text('Archived Projects'),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  /// Build filter chips (only shown when showAll is true)
  Widget _buildFilters(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: Spacing.lg),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildFilterChip('all', 'All', Icons.list),
            _buildFilterChip('active', 'Active', Icons.play_circle),
            _buildFilterChip('funding', 'Funding', Icons.attach_money),
            _buildFilterChip('implementation', 'In Progress', Icons.build),
            _buildFilterChip('completed', 'Completed', Icons.check_circle),
          ],
        ),
      ),
    );
  }

  /// Build filter chip
  Widget _buildFilterChip(String value, String label, IconData icon) {
    final isSelected = _selectedFilter == value;
    return Padding(
      padding: const EdgeInsets.only(right: Spacing.sm),
      child: FilterChip(
        selected: isSelected,
        onSelected: (selected) {
          setState(() {
            _selectedFilter = value;
          });
        },
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16),
            const SizedBox(width: 4),
            Text(label),
          ],
        ),
      ),
    );
  }

  /// Build project list
  Widget _buildProjectList(BuildContext context) {
    final projects = _getMockProjects();
    final filteredProjects = _filterProjects(projects);
    final displayProjects = widget.showAll
        ? filteredProjects
        : filteredProjects.take(widget.maxItems ?? 3).toList();

    if (displayProjects.isEmpty) {
      return _buildEmptyState(context);
    }

    return Column(
      children: displayProjects
          .map((project) => _buildProjectItem(context, project))
          .toList(),
    );
  }

  /// Build individual project item
  Widget _buildProjectItem(BuildContext context, Map<String, dynamic> project) {
    final fundingPercentage = (project['currentFunding'] as double) /
        (project['fundingGoal'] as double);

    return InkWell(
      onTap: () => _navigateToProjectDetails(project['id']),
      child: Container(
        padding: const EdgeInsets.all(Spacing.lg),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
            ),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                // Project icon
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color:
                        _getCategoryColor(project['category']).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    _getCategoryIcon(project['category']),
                    color: _getCategoryColor(project['category']),
                    size: 24,
                  ),
                ),

                const SizedBox(width: Spacing.md),

                // Project details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        project['name'],
                        style: AdaptiveTextStyles.titleSmall(context),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          _buildStatusChip(project['status']),
                          const SizedBox(width: Spacing.sm),
                          Text(
                            project['location'],
                            style:
                                AdaptiveTextStyles.bodySmall(context).copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurface
                                  .withOpacity(0.6),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Funding info
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '€${(project['currentFunding'] / 1000).toStringAsFixed(0)}K / €${(project['fundingGoal'] / 1000).toStringAsFixed(0)}K',
                      style: AdaptiveTextStyles.titleSmall(context).copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${(fundingPercentage * 100).toInt()}% funded',
                      style: AdaptiveTextStyles.bodySmall(context).copyWith(
                        color: _getFundingColor(fundingPercentage),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            AdaptiveSpacing.verticalMedium(),

            // Progress bar
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Progress',
                      style: AdaptiveTextStyles.bodySmall(context).copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.6),
                      ),
                    ),
                    Text(
                      '${project['progress']}% complete',
                      style: AdaptiveTextStyles.bodySmall(context).copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: Spacing.xs),
                LinearProgressIndicator(
                  value: (project['progress'] as int) / 100,
                  backgroundColor:
                      Theme.of(context).colorScheme.outline.withOpacity(0.2),
                  valueColor: AlwaysStoppedAnimation<Color>(
                    _getCategoryColor(project['category']),
                  ),
                ),
              ],
            ),

            AdaptiveSpacing.verticalMedium(),

            // Action buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => _navigateToProjectDetails(project['id']),
                    icon: const Icon(Icons.visibility, size: 16),
                    label: const Text('View'),
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(0, 32),
                    ),
                  ),
                ),
                const SizedBox(width: Spacing.sm),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => _navigateToEditProject(project['id']),
                    icon: const Icon(Icons.edit, size: 16),
                    label: const Text('Edit'),
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(0, 32),
                    ),
                  ),
                ),
                const SizedBox(width: Spacing.sm),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => _showProjectMenu(context, project),
                    icon: const Icon(Icons.more_horiz, size: 16),
                    label: const Text('More'),
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(0, 32),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Build status chip
  Widget _buildStatusChip(String status) {
    Color color;
    switch (status) {
      case 'fundingActive':
        color = Colors.blue;
        break;
      case 'implementation':
        color = Colors.orange;
        break;
      case 'completed':
        color = Colors.green;
        break;
      case 'suspended':
        color = Colors.red;
        break;
      default:
        color = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.xs, vertical: 2),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        _getStatusDisplayName(status),
        style: AdaptiveTextStyles.bodySmall(context).copyWith(
          color: color,
          fontWeight: FontWeight.w500,
          fontSize: 10,
        ),
      ),
    );
  }

  /// Build empty state
  Widget _buildEmptyState(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Spacing.xl),
      child: Column(
        children: [
          Icon(
            Icons.folder_outlined,
            size: 64,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
          ),
          AdaptiveSpacing.verticalMedium(),
          Text(
            'No projects found',
            style: AdaptiveTextStyles.titleMedium(context),
          ),
          const SizedBox(height: Spacing.sm),
          Text(
            'Create your first project to start making an impact',
            style: AdaptiveTextStyles.bodyMedium(context).copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
            ),
            textAlign: TextAlign.center,
          ),
          AdaptiveSpacing.verticalLarge(),
          ElevatedButton.icon(
            onPressed: () => _navigateToCreateProject(),
            icon: const Icon(Icons.add),
            label: const Text('Create Project'),
          ),
        ],
      ),
    );
  }

  /// Get mock project data
  List<Map<String, dynamic>> _getMockProjects() {
    // Note: À l'avenir, nous devrions utiliser project.Project au lieu de Map<String, dynamic>
    return [
      {
        'id': 'proj1',
        'name': 'Clean Water Access Initiative',
        'status': 'fundingActive',
        'category': 'water',
        'location': 'Rural Kenya',
        'fundingGoal': 50000.0,
        'currentFunding': 37500.0,
        'progress': 75,
      },
      {
        'id': 'proj2',
        'name': 'Solar Power for Schools',
        'status': 'implementation',
        'category': 'energy',
        'location': 'Ghana',
        'fundingGoal': 75000.0,
        'currentFunding': 75000.0,
        'progress': 45,
      },
      {
        'id': 'proj3',
        'name': 'Reforestation Project',
        'status': 'completed',
        'category': 'environment',
        'location': 'Brazil',
        'fundingGoal': 30000.0,
        'currentFunding': 30000.0,
        'progress': 100,
      },
      {
        'id': 'proj4',
        'name': 'Women\'s Health Clinic',
        'status': 'fundingActive',
        'category': 'health',
        'location': 'India',
        'fundingGoal': 60000.0,
        'currentFunding': 25000.0,
        'progress': 20,
      },
    ];
  }

  /// Filter projects based on selected filter
  List<Map<String, dynamic>> _filterProjects(
      List<Map<String, dynamic>> projects) {
    if (_selectedFilter == 'all') return projects;
    return projects
        .where((project) => project['status'] == _selectedFilter)
        .toList();
  }

  /// Get category color
  Color _getCategoryColor(String category) {
    switch (category) {
      case 'water':
        return Colors.blue;
      case 'energy':
        return Colors.orange;
      case 'environment':
        return Colors.green;
      case 'health':
        return Colors.red;
      case 'education':
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }

  /// Get category icon
  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'water':
        return Icons.water_drop;
      case 'energy':
        return Icons.wb_sunny;
      case 'environment':
        return Icons.eco;
      case 'health':
        return Icons.local_hospital;
      case 'education':
        return Icons.school;
      default:
        return Icons.business;
    }
  }

  /// Get funding progress color
  Color _getFundingColor(double percentage) {
    if (percentage >= 1.0) return Colors.green;
    if (percentage >= 0.75) return Colors.orange;
    if (percentage >= 0.5) return Colors.blue;
    return Colors.red;
  }

  /// Get status display name
  String _getStatusDisplayName(String status) {
    switch (status) {
      case 'fundingActive':
        return 'FUNDING';
      case 'implementation':
        return 'IN PROGRESS';
      case 'completed':
        return 'COMPLETED';
      case 'suspended':
        return 'SUSPENDED';
      default:
        return status.toUpperCase();
    }
  }

  /// Handle header actions
  void _handleAction(String action) {
    switch (action) {
      case 'export':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Export feature coming soon')),
        );
        break;
      case 'archive':
        _navigateToArchivedProjects();
        break;
    }
  }

  /// Show project context menu
  void _showProjectMenu(BuildContext context, Map<String, dynamic> project) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.share),
            title: const Text('Share Project'),
            onTap: () {
              Navigator.pop(context);
              _shareProject(project['id']);
            },
          ),
          ListTile(
            leading: const Icon(Icons.copy),
            title: const Text('Duplicate Project'),
            onTap: () {
              Navigator.pop(context);
              _duplicateProject(project['id']);
            },
          ),
          ListTile(
            leading: const Icon(Icons.archive),
            title: const Text('Archive Project'),
            onTap: () {
              Navigator.pop(context);
              _archiveProject(project['id']);
            },
          ),
          ListTile(
            leading: const Icon(Icons.delete, color: Colors.red),
            title: const Text('Delete Project',
                style: TextStyle(color: Colors.red)),
            onTap: () {
              Navigator.pop(context);
              _showDeleteConfirmation(context, project);
            },
          ),
        ],
      ),
    );
  }

  /// Show delete confirmation dialog
  void _showDeleteConfirmation(
      BuildContext context, Map<String, dynamic> project) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Project'),
        content: Text(
            'Are you sure you want to delete "${project['name']}"? This action cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _deleteProject(project['id']);
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  /// Navigate to all projects
  void _navigateToAllProjects() {
    context.go('/organization/projects');
  }

  /// Navigate to project details
  void _navigateToProjectDetails(String projectId) {
    context.go('/projects/$projectId');
  }

  /// Navigate to edit project
  void _navigateToEditProject(String projectId) {
    context.go('/projects/$projectId/edit');
  }

  /// Navigate to create project
  void _navigateToCreateProject() {
    context.go('/projects/create');
  }

  /// Navigate to archived projects
  void _navigateToArchivedProjects() {
    context.go('/organization/projects/archived');
  }

  /// Share project
  void _shareProject(String projectId) {
    // Implement project sharing
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Project sharing feature coming soon')),
    );
  }

  /// Duplicate project
  void _duplicateProject(String projectId) {
    // Implement project duplication
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Project duplicated successfully')),
    );
  }

  /// Archive project
  void _archiveProject(String projectId) {
    // Implement project archiving
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Project archived successfully')),
    );
  }

  /// Delete project
  void _deleteProject(String projectId) {
    // Implement project deletion
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Project deleted successfully')),
    );
  }
}
