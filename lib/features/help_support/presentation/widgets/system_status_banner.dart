import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/constants/spacing.dart';
import '../../domain/entities/help_support.dart';

/// System status banner showing current system health and incidents
class SystemStatusBanner extends ConsumerWidget {
  const SystemStatusBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final systemStatus = _getMockSystemStatus();

    // Don't show banner if all systems are operational
    if (systemStatus.status == ServiceStatus.operational &&
        systemStatus.recentIncidents.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(Spacing.md),
      decoration: BoxDecoration(
        color: _getStatusColor(systemStatus.status),
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
          ),
        ),
      ),
      child: Row(
        children: [
          Icon(
            _getStatusIcon(systemStatus.status),
            color: Colors.white,
            size: 20,
          ),
          const SizedBox(width: Spacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _getStatusTitle(systemStatus.status),
                  style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (systemStatus.statusMessage != null)
                  Text(
                    systemStatus.statusMessage!,
                    style: AdaptiveTextStyles.bodySmall(context).copyWith(
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
              ],
            ),
          ),
          TextButton(
            onPressed: () => _showStatusDetails(context, systemStatus),
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: Spacing.sm,
                vertical: Spacing.xs,
              ),
            ),
            child: const Text('Details'),
          ),
        ],
      ),
    );
  }

  /// Get status color
  Color _getStatusColor(ServiceStatus status) {
    switch (status) {
      case ServiceStatus.operational:
        return Colors.green;
      case ServiceStatus.degradedPerformance:
        return Colors.yellow[700]!;
      case ServiceStatus.partialOutage:
        return Colors.orange;
      case ServiceStatus.majorOutage:
        return Colors.red;
      case ServiceStatus.maintenance:
        return Colors.blue;
    }
  }

  /// Get status icon
  IconData _getStatusIcon(ServiceStatus status) {
    switch (status) {
      case ServiceStatus.operational:
        return Icons.check_circle;
      case ServiceStatus.degradedPerformance:
        return Icons.warning;
      case ServiceStatus.partialOutage:
        return Icons.error_outline;
      case ServiceStatus.majorOutage:
        return Icons.error;
      case ServiceStatus.maintenance:
        return Icons.build;
    }
  }

  /// Get status title
  String _getStatusTitle(ServiceStatus status) {
    switch (status) {
      case ServiceStatus.operational:
        return 'All Systems Operational';
      case ServiceStatus.degradedPerformance:
        return 'Degraded Performance';
      case ServiceStatus.partialOutage:
        return 'Partial Service Outage';
      case ServiceStatus.majorOutage:
        return 'Major Service Outage';
      case ServiceStatus.maintenance:
        return 'Scheduled Maintenance';
    }
  }

  /// Show status details
  void _showStatusDetails(BuildContext context, SystemStatus systemStatus) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.6,
        maxChildSize: 0.9,
        minChildSize: 0.3,
        expand: false,
        builder: (context, scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            child: Padding(
              padding: const EdgeInsets.all(Spacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Handle bar
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .outline
                            .withOpacity(0.3),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),

                  const SizedBox(height: Spacing.lg),

                  // Header
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: _getStatusColor(systemStatus.status)
                              .withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          _getStatusIcon(systemStatus.status),
                          color: _getStatusColor(systemStatus.status),
                        ),
                      ),
                      const SizedBox(width: Spacing.sm),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'System Status',
                              style: AdaptiveTextStyles.titleLarge(context),
                            ),
                            Text(
                              _getStatusTitle(systemStatus.status),
                              style: AdaptiveTextStyles.bodyMedium(context)
                                  .copyWith(
                                color: _getStatusColor(systemStatus.status),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: Spacing.lg),

                  // Status message
                  if (systemStatus.statusMessage != null)
                    Container(
                      padding: const EdgeInsets.all(Spacing.md),
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .surfaceContainerHighest
                            .withOpacity(0.5),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        systemStatus.statusMessage!,
                        style: AdaptiveTextStyles.bodyMedium(context),
                      ),
                    ),

                  const SizedBox(height: Spacing.lg),

                  // Last updated
                  Row(
                    children: [
                      Icon(
                        Icons.update,
                        size: 16,
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.6),
                      ),
                      const SizedBox(width: Spacing.sm),
                      Text(
                        'Last updated: ${_formatDateTime(systemStatus.lastUpdated)}',
                        style: AdaptiveTextStyles.bodySmall(context).copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: Spacing.lg),

                  // Recent incidents
                  if (systemStatus.recentIncidents.isNotEmpty) ...[
                    Text(
                      'Recent Incidents',
                      style: AdaptiveTextStyles.titleMedium(context),
                    ),
                    const SizedBox(height: Spacing.md),
                    ...systemStatus.recentIncidents.map((incident) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: Spacing.sm),
                        padding: const EdgeInsets.all(Spacing.md),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context)
                                .colorScheme
                                .outline
                                .withOpacity(0.2),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 8,
                                  height: 8,
                                  decoration: BoxDecoration(
                                    color: _getIncidentColor(incident.severity),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: Spacing.sm),
                                Expanded(
                                  child: Text(
                                    incident.title,
                                    style:
                                        AdaptiveTextStyles.bodyMedium(context)
                                            .copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color:
                                        _getIncidentStatusColor(incident.status)
                                            .withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    incident.status.displayName,
                                    style: AdaptiveTextStyles.bodySmall(context)
                                        .copyWith(
                                      color: _getIncidentStatusColor(
                                          incident.status),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: Spacing.sm),
                            Text(
                              incident.description,
                              style: AdaptiveTextStyles.bodySmall(context)
                                  .copyWith(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurface
                                    .withOpacity(0.7),
                              ),
                            ),
                            const SizedBox(height: Spacing.sm),
                            Text(
                              'Started: ${_formatDateTime(incident.startedAt)}',
                              style: AdaptiveTextStyles.bodySmall(context)
                                  .copyWith(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurface
                                    .withOpacity(0.5),
                              ),
                            ),
                            if (incident.resolvedAt != null)
                              Text(
                                'Resolved: ${_formatDateTime(incident.resolvedAt!)}',
                                style: AdaptiveTextStyles.bodySmall(context)
                                    .copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurface
                                      .withOpacity(0.5),
                                ),
                              ),
                          ],
                        ),
                      );
                    }),
                  ],

                  const SizedBox(height: Spacing.lg),

                  // Subscribe to updates button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () => _subscribeToUpdates(context),
                      icon: const Icon(Icons.notifications),
                      label: const Text('Subscribe to Status Updates'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  /// Get incident color
  Color _getIncidentColor(IncidentSeverity severity) {
    switch (severity) {
      case IncidentSeverity.minor:
        return Colors.yellow;
      case IncidentSeverity.major:
        return Colors.orange;
      case IncidentSeverity.critical:
        return Colors.red;
    }
  }

  /// Get incident status color
  Color _getIncidentStatusColor(IncidentStatus status) {
    switch (status) {
      case IncidentStatus.investigating:
        return Colors.orange;
      case IncidentStatus.identified:
        return Colors.blue;
      case IncidentStatus.monitoring:
        return Colors.amber;
      case IncidentStatus.resolved:
        return Colors.green;
    }
  }

  /// Format date time
  String _formatDateTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else {
      return '${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}';
    }
  }

  /// Subscribe to status updates
  void _subscribeToUpdates(BuildContext context) {
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content:
            Text('You will receive notifications about system status updates'),
      ),
    );
  }

  /// Get mock system status
  SystemStatus _getMockSystemStatus() {
    // Return operational status (banner won't show)
    return SystemStatus(
      id: 'platform',
      serviceName: 'Social Impact Platform',
      status: ServiceStatus.operational,
      lastUpdated: DateTime.parse('2024-03-15T16:30:00Z'),
      statusMessage: 'All services are running normally',
      recentIncidents: [],
    );

    // Uncomment below to show banner with issues
    /*
    return SystemStatus(
      id: 'platform',
      serviceName: 'Social Impact Platform',
      status: ServiceStatus.degradedPerformance,
      lastUpdated: DateTime.now().toIso8601String(),
      statusMessage: 'We are experiencing slower than normal response times',
      recentIncidents: [
        StatusIncident(
          id: 'incident1',
          title: 'Slow API Response Times',
          description: 'Some users may experience slower loading times',
          status: IncidentStatus.monitoring,
          severity: IncidentSeverity.minor,
          startedAt: DateTime.now().subtract(Duration(hours: 2)).toIso8601String(),
          affectedServices: ['API', 'Web App'],
        ),
      ],
    );
    */
  }
}
