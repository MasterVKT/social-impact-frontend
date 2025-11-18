import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../../shared/widgets/responsive/responsive_layout.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/constants/spacing.dart';
import '../../../auth/presentation/providers/auth_provider_aliases.dart';
import '../../../projects/presentation/providers/projects_providers.dart';
import '../../../milestones/domain/entities/milestone_evidence.dart';
import '../../../milestones/presentation/providers/milestones_providers.dart';
import '../../domain/entities/audit.dart';
import '../providers/audits_providers.dart';
import '../widgets/audit_criterion_card.dart';

/// Audit Detail Screen - Shows full audit details with scoring capability
class AuditDetailScreen extends ConsumerStatefulWidget {
  final String auditId;

  const AuditDetailScreen({
    super.key,
    required this.auditId,
  });

  @override
  ConsumerState<AuditDetailScreen> createState() => _AuditDetailScreenState();
}

class _AuditDetailScreenState extends ConsumerState<AuditDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: _buildMobileLayout(context),
      tablet: _buildTabletLayout(context),
      desktop: _buildDesktopLayout(context),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    final auditAsync = ref.watch(auditProvider(widget.auditId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Audit Details'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) => _handleMenuAction(context, value),
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'submit',
                child: ListTile(
                  leading: Icon(Icons.send),
                  title: Text('Submit Report'),
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ],
          ),
        ],
      ),
      body: auditAsync.when(
        data: (audit) {
          if (audit == null) {
            return const Center(child: Text('Audit not found'));
          }
          return _buildContent(context, audit);
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }

  Widget _buildTabletLayout(BuildContext context) {
    return _buildMobileLayout(context);
  }

  Widget _buildDesktopLayout(BuildContext context) {
    final auditAsync = ref.watch(auditProvider(widget.auditId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Audit Details'),
        actions: [
          TextButton.icon(
            icon: const Icon(Icons.send),
            label: const Text('Submit Report'),
            onPressed: () => _handleMenuAction(context, 'submit'),
          ),
          const SizedBox(width: Spacing.md),
        ],
      ),
      body: auditAsync.when(
        data: (audit) {
          if (audit == null) {
            return const Center(child: Text('Audit not found'));
          }
          return Padding(
            padding: const EdgeInsets.all(Spacing.xl),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Main content
                Expanded(
                  flex: 2,
                  child: _buildContent(context, audit),
                ),
                const SizedBox(width: Spacing.xl),
                // Sidebar
                SizedBox(
                  width: 350,
                  child: _buildSidebar(context, audit),
                ),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }

  Widget _buildContent(BuildContext context, Audit audit) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(Spacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Audit header
          _buildAuditHeader(context, audit),
          const SizedBox(height: Spacing.lg),

          // Project/Milestone details
          _buildProjectDetails(context, audit),
          const SizedBox(height: Spacing.lg),

          // Action button (Start/Resume)
          if (audit.status == AuditStatus.assigned)
            _buildStartAuditButton(context, audit),

          if (audit.status != AuditStatus.completed) ...[
            const SizedBox(height: Spacing.lg),

            // Criteria scoring section
            _buildCriteriaSection(context, audit),
          ],

          if (audit.status == AuditStatus.completed) ...[
            const SizedBox(height: Spacing.lg),
            _buildAuditReport(context, audit),
          ],
        ],
      ),
    );
  }

  Widget _buildAuditHeader(BuildContext context, Audit audit) {
    final theme = Theme.of(context);

    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    _getAuditTypeName(audit.type),
                    style: AdaptiveTextStyles.headlineMedium(context),
                  ),
                ),
                _buildStatusChip(audit.status),
              ],
            ),
            const SizedBox(height: Spacing.md),
            Row(
              children: [
                Icon(Icons.assignment, size: 16, color: Colors.grey.shade600),
                const SizedBox(width: Spacing.xs),
                Text(
                  'Audit ID: ${audit.id}',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: Spacing.sm),
            Row(
              children: [
                Icon(Icons.calendar_today, size: 16, color: Colors.grey.shade600),
                const SizedBox(width: Spacing.xs),
                Text(
                  'Due: ${audit.dueDate != null ? DateFormat('MMM dd, yyyy').format(audit.dueDate!) : 'Not set'}',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: _isOverdue(audit) ? Colors.red : Colors.grey.shade600,
                    fontWeight: _isOverdue(audit) ? FontWeight.bold : null,
                  ),
                ),
                if (_isOverdue(audit)) ...[
                  const SizedBox(width: Spacing.xs),
                  const Icon(Icons.warning, size: 16, color: Colors.red),
                ],
              ],
            ),
            if (audit.assignedAt != null) ...[
              const SizedBox(height: Spacing.sm),
              Row(
                children: [
                  Icon(Icons.access_time, size: 16, color: Colors.grey.shade600),
                  const SizedBox(width: Spacing.xs),
                  Text(
                    'Assigned: ${DateFormat('MMM dd, yyyy').format(audit.assignedAt!)}',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildProjectDetails(BuildContext context, Audit audit) {
    final projectAsync = ref.watch(projectProvider(audit.projectId));

    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              audit.milestoneId != null ? 'Milestone Details' : 'Project Details',
              style: AdaptiveTextStyles.headlineSmall(context),
            ),
            const SizedBox(height: Spacing.md),
            projectAsync.when(
              data: (project) {
                if (project == null) {
                  return const Text('Project not found');
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(Icons.folder_open),
                      title: Text(project.title),
                      subtitle: Text(project.description),
                    ),
                    if (audit.milestoneId != null)
                      _buildMilestoneDetails(context, audit.milestoneId!),
                  ],
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Text('Error: $error'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMilestoneDetails(BuildContext context, String milestoneId) {
    // TODO: Fetch milestone details
    // For now, just show the milestone ID
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const Icon(Icons.flag),
      title: Text('Milestone: $milestoneId'),
      subtitle: const Text('Review milestone evidence and completion'),
    );
  }

  Widget _buildStartAuditButton(BuildContext context, Audit audit) {
    return FilledButton.icon(
      onPressed: () => _startAudit(context, audit.id),
      icon: const Icon(Icons.play_arrow),
      label: const Text('Start Audit'),
    );
  }

  Widget _buildCriteriaSection(BuildContext context, Audit audit) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Audit Criteria',
          style: AdaptiveTextStyles.headlineSmall(context),
        ),
        const SizedBox(height: Spacing.sm),
        Text(
          'Score each criterion from 0 to 10',
          style: TextStyle(color: Colors.grey.shade600),
        ),
        const SizedBox(height: Spacing.md),
        ...audit.criteria.map((criterion) {
          return Padding(
            padding: const EdgeInsets.only(bottom: Spacing.md),
            child: AuditCriterionCard(
              auditId: audit.id,
              criterion: criterion,
              isEditable: audit.status != AuditStatus.completed,
            ),
          );
        }),
      ],
    );
  }

  Widget _buildAuditReport(BuildContext context, Audit audit) {
    final reportAsync = ref.watch(auditReportProvider(audit.id));

    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Audit Report',
              style: AdaptiveTextStyles.headlineSmall(context),
            ),
            const SizedBox(height: Spacing.md),
            reportAsync.when(
              data: (report) {
                if (report == null) {
                  return const Text('Report not available');
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildReportRow('Overall Score', '${report.overallScore.toStringAsFixed(1)}/10'),
                    const Divider(),
                    _buildReportRow('Decision', _getDecisionName(report.decision)),
                    const Divider(),
                    const SizedBox(height: Spacing.md),
                    Text(
                      'Summary',
                      style: AdaptiveTextStyles.titleMedium(context),
                    ),
                    const SizedBox(height: Spacing.sm),
                    Text(report.summary),
                    const SizedBox(height: Spacing.md),
                    Text(
                      'Recommendations',
                      style: AdaptiveTextStyles.titleMedium(context),
                    ),
                    const SizedBox(height: Spacing.sm),
                    Text(report.recommendations),
                  ],
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Text('Error loading report: $error'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReportRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Spacing.sm),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
          Text(value),
        ],
      ),
    );
  }

  Widget _buildSidebar(BuildContext context, Audit audit) {
    final progress = _calculateProgress(audit);

    return Column(
      children: [
        AdaptiveCard(
          child: Padding(
            padding: const EdgeInsets.all(Spacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Progress',
                  style: AdaptiveTextStyles.titleMedium(context),
                ),
                const SizedBox(height: Spacing.md),
                LinearProgressIndicator(
                  value: progress / 100,
                  backgroundColor: Colors.grey.shade200,
                  minHeight: 8,
                ),
                const SizedBox(height: Spacing.sm),
                Text(
                  '${progress.toStringAsFixed(0)}% Complete',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: Spacing.md),
                Text(
                  '${audit.criteria.where((c) => c.score != null).length} of ${audit.criteria.length} criteria scored',
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
        ),
        if (audit.overallScore != null) ...[
          const SizedBox(height: Spacing.md),
          AdaptiveCard(
            child: Padding(
              padding: const EdgeInsets.all(Spacing.md),
              child: Column(
                children: [
                  Text(
                    'Overall Score',
                    style: AdaptiveTextStyles.titleMedium(context),
                  ),
                  const SizedBox(height: Spacing.md),
                  Text(
                    audit.overallScore!.toStringAsFixed(1),
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: _getScoreColor(audit.overallScore!),
                    ),
                  ),
                  Text(
                    'out of 10',
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                  const SizedBox(height: Spacing.sm),
                  Text(
                    'Grade: ${_getScoreGrade(audit.overallScore!)}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildStatusChip(AuditStatus status) {
    final color = _getStatusColor(status);
    final label = _getStatusLabel(status);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Spacing.sm,
        vertical: Spacing.xs,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  String _getAuditTypeName(AuditType type) {
    switch (type) {
      case AuditType.projectInitial:
        return 'Project Initial Audit';
      case AuditType.projectInterim:
        return 'Project Interim Audit';
      case AuditType.projectFinal:
        return 'Project Final Audit';
      case AuditType.milestoneCompletion:
        return 'Milestone Completion Audit';
    }
  }

  Color _getStatusColor(AuditStatus status) {
    switch (status) {
      case AuditStatus.assigned:
        return Colors.orange;
      case AuditStatus.inProgress:
        return Colors.blue;
      case AuditStatus.completed:
        return Colors.green;
    }
  }

  String _getStatusLabel(AuditStatus status) {
    switch (status) {
      case AuditStatus.assigned:
        return 'PENDING';
      case AuditStatus.inProgress:
        return 'IN PROGRESS';
      case AuditStatus.completed:
        return 'COMPLETED';
    }
  }

  String _getDecisionName(AuditDecision decision) {
    switch (decision) {
      case AuditDecision.approved:
        return 'APPROVED';
      case AuditDecision.approvedWithConditions:
        return 'APPROVED WITH CONDITIONS';
      case AuditDecision.rejected:
        return 'REJECTED';
    }
  }

  bool _isOverdue(Audit audit) {
    if (audit.dueDate == null) return false;
    return audit.dueDate!.isBefore(DateTime.now()) &&
        audit.status != AuditStatus.completed;
  }

  double _calculateProgress(Audit audit) {
    if (audit.criteria.isEmpty) return 0;
    final scoredCriteria = audit.criteria.where((c) => c.score != null).length;
    return (scoredCriteria / audit.criteria.length) * 100;
  }

  Color _getScoreColor(double score) {
    if (score >= 8.0) return Colors.green;
    if (score >= 6.0) return Colors.blue;
    if (score >= 4.0) return Colors.orange;
    return Colors.red;
  }

  String _getScoreGrade(double score) {
    if (score >= 9.5) return 'A+';
    if (score >= 9.0) return 'A';
    if (score >= 8.0) return 'B';
    if (score >= 6.0) return 'C';
    if (score >= 4.0) return 'D';
    return 'F';
  }

  void _handleMenuAction(BuildContext context, String action) {
    if (action == 'submit') {
      _navigateToSubmitReport(context);
    }
  }

  Future<void> _startAudit(BuildContext context, String auditId) async {
    final notifier = ref.read(auditScoringNotifierProvider.notifier);
    await notifier.startAudit(auditId);

    if (!context.mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Audit started successfully')),
    );
  }

  void _navigateToSubmitReport(BuildContext context) {
    context.push('/audits/${widget.auditId}/submit-report');
  }
}
