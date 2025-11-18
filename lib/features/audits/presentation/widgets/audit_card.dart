import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/constants/spacing.dart';
import '../../domain/entities/audit.dart';

/// Audit card widget for displaying audit summary
class AuditCard extends StatelessWidget {
  final Audit audit;
  final bool isOverdue;
  final VoidCallback onTap;

  const AuditCard({
    super.key,
    required this.audit,
    this.isOverdue = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AdaptiveCard(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(Spacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with type and status
            Row(
              children: [
                Expanded(
                  child: Text(
                    _getAuditTypeName(audit.type),
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                _buildStatusChip(context),
              ],
            ),
            const SizedBox(height: Spacing.sm),

            // Project ID
            Text(
              'Project: ${audit.projectId}',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.grey.shade600,
              ),
            ),

            if (audit.milestoneId != null) ...[
              const SizedBox(height: Spacing.xs),
              Text(
                'Milestone: ${audit.milestoneId}',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: Colors.grey.shade600,
                ),
              ),
            ],

            const SizedBox(height: Spacing.md),

            // Progress and deadline
            Row(
              children: [
                // Progress indicator
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.check_circle_outline,
                            size: 16,
                            color: Colors.grey.shade600,
                          ),
                          const SizedBox(width: Spacing.xs),
                          Text(
                            'Progress: ${_calculateProgress()}%',
                            style: theme.textTheme.bodySmall,
                          ),
                        ],
                      ),
                      const SizedBox(height: Spacing.xs),
                      LinearProgressIndicator(
                        value: _calculateProgress() / 100,
                        backgroundColor: Colors.grey.shade200,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          _getProgressColor(),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: Spacing.md),

                // Due date
                if (audit.dueDate != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Icon(
                            isOverdue ? Icons.warning : Icons.calendar_today,
                            size: 16,
                            color: isOverdue ? Colors.red : Colors.grey.shade600,
                          ),
                          const SizedBox(width: Spacing.xs),
                          Text(
                            isOverdue ? 'Overdue' : 'Due',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: isOverdue ? Colors.red : null,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        DateFormat('MMM dd, yyyy').format(audit.dueDate!),
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: isOverdue ? Colors.red : null,
                        ),
                      ),
                    ],
                  ),
              ],
            ),

            // Overall score (if completed)
            if (audit.overallScore != null) ...[
              const SizedBox(height: Spacing.md),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 20,
                    color: _getScoreColor(audit.overallScore!),
                  ),
                  const SizedBox(width: Spacing.xs),
                  Text(
                    'Score: ${audit.overallScore!.toStringAsFixed(1)}/10',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: _getScoreColor(audit.overallScore!),
                    ),
                  ),
                  const SizedBox(width: Spacing.sm),
                  Text(
                    '(${_getScoreGrade(audit.overallScore!)})',
                    style: theme.textTheme.bodyMedium?.copyWith(
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

  Widget _buildStatusChip(BuildContext context) {
    final color = _getStatusColor();
    final label = _getStatusLabel();

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

  Color _getStatusColor() {
    switch (audit.status) {
      case AuditStatus.assigned:
        return Colors.orange;
      case AuditStatus.inProgress:
        return Colors.blue;
      case AuditStatus.completed:
        return Colors.green;
    }
  }

  String _getStatusLabel() {
    switch (audit.status) {
      case AuditStatus.assigned:
        return 'PENDING';
      case AuditStatus.inProgress:
        return 'IN PROGRESS';
      case AuditStatus.completed:
        return 'COMPLETED';
    }
  }

  int _calculateProgress() {
    if (audit.criteria.isEmpty) return 0;

    final scoredCriteria = audit.criteria.where((c) => c.score != null).length;
    return ((scoredCriteria / audit.criteria.length) * 100).round();
  }

  Color _getProgressColor() {
    final progress = _calculateProgress();
    if (progress < 30) return Colors.red;
    if (progress < 70) return Colors.orange;
    return Colors.green;
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
}
