import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/constants/spacing.dart';
import '../../domain/entities/app_settings.dart';

/// Settings sync status widget showing synchronization information
class SettingsSyncStatusWidget extends ConsumerWidget {
  const SettingsSyncStatusWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final syncStatus = _getMockSyncStatus();

    return Container(
      padding: const EdgeInsets.all(Spacing.md),
      decoration: BoxDecoration(
        color: _getSyncStatusColor(syncStatus.currentState).withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: _getSyncStatusColor(syncStatus.currentState).withOpacity(0.3),
        ),
      ),
      child: Row(
        children: [
          _buildSyncIcon(context, syncStatus.currentState),
          const SizedBox(width: Spacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Settings Sync',
                      style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: Spacing.xs),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: _getSyncStatusColor(syncStatus.currentState),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        syncStatus.currentState.displayName.toUpperCase(),
                        style: AdaptiveTextStyles.bodySmall(context).copyWith(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  _getSyncStatusMessage(syncStatus),
                  style: AdaptiveTextStyles.bodySmall(context).copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),
          if (syncStatus.currentState == SyncState.syncing)
            SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: _getSyncStatusColor(syncStatus.currentState),
              ),
            )
          else
            IconButton(
              onPressed: () => _showSyncDetails(context, syncStatus),
              icon: Icon(
                Icons.info_outline,
                size: 18,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
              ),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
        ],
      ),
    );
  }

  /// Build sync icon
  Widget _buildSyncIcon(BuildContext context, SyncState state) {
    IconData icon;
    Color color = _getSyncStatusColor(state);

    switch (state) {
      case SyncState.idle:
        icon = Icons.cloud_done;
        break;
      case SyncState.syncing:
        icon = Icons.sync;
        break;
      case SyncState.conflict:
        icon = Icons.warning;
        break;
      case SyncState.error:
        icon = Icons.cloud_off;
        break;
      case SyncState.success:
        icon = Icons.check_circle;
        break;
    }

    return Icon(
      icon,
      color: color,
      size: 20,
    );
  }

  /// Get sync status color
  Color _getSyncStatusColor(SyncState state) {
    switch (state) {
      case SyncState.idle:
        return Colors.blue;
      case SyncState.syncing:
        return Colors.orange;
      case SyncState.conflict:
        return Colors.amber;
      case SyncState.error:
        return Colors.red;
      case SyncState.success:
        return Colors.green;
    }
  }

  /// Get sync status message
  String _getSyncStatusMessage(SettingsSyncStatus status) {
    switch (status.currentState) {
      case SyncState.idle:
        return status.lastSyncAt != null
            ? 'Last synced ${_formatLastSync(status.lastSyncAt!)}'
            : 'Ready to sync';
      case SyncState.syncing:
        return 'Syncing settings across devices...';
      case SyncState.conflict:
        return '${status.conflictingKeys.length} conflicts need resolution';
      case SyncState.error:
        return status.error ?? 'Sync failed';
      case SyncState.success:
        return 'Settings synced successfully';
    }
  }

  /// Format last sync time
  String _formatLastSync(DateTime lastSync) {
    final now = DateTime.now();
    final difference = now.difference(lastSync);

    if (difference.inMinutes < 1) {
      return 'just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else {
      return '${difference.inDays}d ago';
    }
  }

  /// Show sync details
  void _showSyncDetails(BuildContext context, SettingsSyncStatus status) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sync Details'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailRow('Status', status.currentState.displayName),
            const SizedBox(height: Spacing.sm),
            _buildDetailRow(
              'Last Sync',
              status.lastSyncAt != null
                  ? _formatDetailedTime(status.lastSyncAt!)
                  : 'Never',
            ),
            const SizedBox(height: Spacing.sm),
            _buildDetailRow('Sync Count', status.syncCount.toString()),
            const SizedBox(height: Spacing.sm),
            _buildDetailRow(
              'Devices',
              status.deviceLastSync.length.toString(),
            ),
            if (status.conflictingKeys.isNotEmpty) ...[
              const SizedBox(height: Spacing.md),
              const Text(
                'Conflicting Settings:',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: Spacing.sm),
              ...status.conflictingKeys.map((key) => Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text('• $key'),
                  )),
            ],
          ],
        ),
        actions: [
          if (status.currentState == SyncState.conflict)
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _resolveConflicts(context, status);
              },
              child: const Text('Resolve Conflicts'),
            ),
          if (status.currentState == SyncState.error)
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _retrySyncing(context);
              },
              child: const Text('Retry Sync'),
            ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _forceSyncNow(context);
            },
            child: const Text('Sync Now'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  /// Build detail row
  Widget _buildDetailRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 80,
          child: Text(
            '$label:',
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        Expanded(
          child: Text(value),
        ),
      ],
    );
  }

  /// Format detailed time
  String _formatDetailedTime(DateTime time) {
    return '${time.day}/${time.month}/${time.year} ${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }

  /// Resolve conflicts
  void _resolveConflicts(BuildContext context, SettingsSyncStatus status) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Resolve Sync Conflicts'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('How would you like to resolve the sync conflicts?'),
            const SizedBox(height: Spacing.lg),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Using local settings')),
                  );
                },
                child: const Text('Use Local Settings'),
              ),
            ),
            const SizedBox(height: Spacing.sm),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Using cloud settings')),
                  );
                },
                child: const Text('Use Cloud Settings'),
              ),
            ),
            const SizedBox(height: Spacing.sm),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Manual conflict resolution')),
                  );
                },
                child: const Text('Resolve Manually'),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  /// Retry syncing
  void _retrySyncing(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Retrying sync...')),
    );
  }

  /// Force sync now
  void _forceSyncNow(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Syncing settings now...')),
    );
  }

  /// Get mock sync status
  SettingsSyncStatus _getMockSyncStatus() {
    return SettingsSyncStatus(
      userId: 'user1',
      isEnabled: true,
      currentState: SyncState.idle,
      lastSyncAt: DateTime.now().subtract(const Duration(minutes: 15)),
      nextSyncAt: DateTime.now().add(const Duration(minutes: 45)),
      conflictingKeys: [],
      syncCount: 147,
      deviceLastSync: {
        'device1': DateTime.now().subtract(const Duration(minutes: 15)),
        'device2': DateTime.now().subtract(const Duration(hours: 2)),
        'device3': DateTime.now().subtract(const Duration(days: 1)),
      },
    );
  }
}
