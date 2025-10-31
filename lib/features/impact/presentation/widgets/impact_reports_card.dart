import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/constants/spacing.dart';

/// Impact reports card showing generated reports and templates
class ImpactReportsCard extends ConsumerWidget {
  final String timeframe;
  final bool showDetailed;

  const ImpactReportsCard({
    super.key,
    required this.timeframe,
    this.showDetailed = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            AdaptiveSpacing.verticalLarge(),
            _buildRecentReports(context),
            AdaptiveSpacing.verticalLarge(),
            _buildQuickActions(context),
            if (showDetailed) ...[
              AdaptiveSpacing.verticalLarge(),
              _buildReportTemplates(context),
            ],
          ],
        ),
      ),
    );
  }

  /// Build card header
  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.description,
          color: Theme.of(context).colorScheme.primary,
          size: 24,
        ),
        const SizedBox(width: Spacing.sm),
        Text(
          'Impact Reports',
          style: AdaptiveTextStyles.titleMedium(context),
        ),
        const Spacer(),
        TextButton.icon(
          onPressed: () => _generateNewReport(),
          icon: const Icon(Icons.add, size: 18),
          label: const Text('New Report'),
        ),
      ],
    );
  }

  /// Build recent reports list
  Widget _buildRecentReports(BuildContext context) {
    final recentReports = [
      {
        'title': 'Q3 2024 Impact Assessment',
        'type': 'Quarterly Report',
        'status': 'Published',
        'date': '2 weeks ago',
        'downloads': 45,
        'color': Colors.green,
        'icon': Icons.check_circle,
      },
      {
        'title': 'Clean Water Project - Milestone Report',
        'type': 'Milestone Report',
        'status': 'Under Review',
        'date': '5 days ago',
        'downloads': 0,
        'color': Colors.orange,
        'icon': Icons.pending,
      },
      {
        'title': 'Annual Impact Summary 2024',
        'type': 'Annual Report',
        'status': 'Draft',
        'date': '1 week ago',
        'downloads': 0,
        'color': Colors.blue,
        'icon': Icons.edit,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recent Reports',
              style: AdaptiveTextStyles.titleMedium(context),
            ),
            if (!showDetailed)
              TextButton(
                onPressed: () => _navigateToAllReports(),
                child: const Text('View All'),
              ),
          ],
        ),
        AdaptiveSpacing.verticalMedium(),
        ...recentReports.take(showDetailed ? recentReports.length : 3).map(
              (report) => _buildReportItem(context, report),
            ),
      ],
    );
  }

  /// Build individual report item
  Widget _buildReportItem(BuildContext context, Map<String, dynamic> report) {
    return Container(
      margin: const EdgeInsets.only(bottom: Spacing.sm),
      padding: const EdgeInsets.all(Spacing.md),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: Row(
        children: [
          // Report icon
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: (report['color'] as Color).withOpacity(0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(
              report['icon'] as IconData,
              color: report['color'] as Color,
              size: 20,
            ),
          ),

          const SizedBox(width: Spacing.md),

          // Report details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  report['title'] as String,
                  style: AdaptiveTextStyles.titleSmall(context),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    _buildStatusChip(context, report['status'] as String),
                    const SizedBox(width: Spacing.sm),
                    Text(
                      report['type'] as String,
                      style: AdaptiveTextStyles.bodySmall(context).copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Text(
                      report['date'] as String,
                      style: AdaptiveTextStyles.bodySmall(context).copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.5),
                      ),
                    ),
                    if (report['downloads'] > 0) ...[
                      const SizedBox(width: Spacing.sm),
                      Icon(
                        Icons.download,
                        size: 12,
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.5),
                      ),
                      const SizedBox(width: 2),
                      Text(
                        '${report['downloads']} downloads',
                        style: AdaptiveTextStyles.bodySmall(context).copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.5),
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),

          // Action button
          PopupMenuButton<String>(
            onSelected: (value) => _handleReportAction(value, report),
            itemBuilder: (context) => [
              if (report['status'] == 'Published')
                const PopupMenuItem(
                  value: 'download',
                  child: ListTile(
                    leading: Icon(Icons.download),
                    title: Text('Download'),
                  ),
                ),
              if (report['status'] != 'Published')
                const PopupMenuItem(
                  value: 'edit',
                  child: ListTile(
                    leading: Icon(Icons.edit),
                    title: Text('Edit'),
                  ),
                ),
              const PopupMenuItem(
                value: 'share',
                child: ListTile(
                  leading: Icon(Icons.share),
                  title: Text('Share'),
                ),
              ),
              const PopupMenuItem(
                value: 'duplicate',
                child: ListTile(
                  leading: Icon(Icons.copy),
                  title: Text('Duplicate'),
                ),
              ),
              if (report['status'] == 'Draft')
                const PopupMenuItem(
                  value: 'delete',
                  child: ListTile(
                    leading: Icon(Icons.delete, color: Colors.red),
                    title: Text('Delete', style: TextStyle(color: Colors.red)),
                  ),
                ),
            ],
            child: const Icon(Icons.more_vert, size: 20),
          ),
        ],
      ),
    );
  }

  /// Build status chip
  Widget _buildStatusChip(BuildContext context, String status) {
    Color color;
    switch (status.toLowerCase()) {
      case 'published':
        color = Colors.green;
        break;
      case 'under review':
        color = Colors.orange;
        break;
      case 'draft':
        color = Colors.blue;
        break;
      default:
        color = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        status.toUpperCase(),
        style: AdaptiveTextStyles.bodySmall(context).copyWith(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: 9,
        ),
      ),
    );
  }

  /// Build quick actions
  Widget _buildQuickActions(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Spacing.md),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Quick Actions',
            style: AdaptiveTextStyles.titleMedium(context),
          ),
          AdaptiveSpacing.verticalMedium(),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => _generateQuarterlyReport(),
                  icon: const Icon(Icons.calendar_today, size: 18),
                  label: const Text('Quarterly Report'),
                ),
              ),
              const SizedBox(width: Spacing.sm),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => _generateInvestorUpdate(),
                  icon: const Icon(Icons.trending_up, size: 18),
                  label: const Text('Investor Update'),
                ),
              ),
            ],
          ),
          AdaptiveSpacing.verticalSmall(),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => _generateComplianceReport(),
                  icon: const Icon(Icons.verified_user, size: 18),
                  label: const Text('Compliance Report'),
                ),
              ),
              const SizedBox(width: Spacing.sm),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => _customizeReport(),
                  icon: const Icon(Icons.tune, size: 18),
                  label: const Text('Custom Report'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Build report templates (only shown in detailed view)
  Widget _buildReportTemplates(BuildContext context) {
    final templates = [
      {
        'name': 'SDG Impact Assessment',
        'description': 'Comprehensive UN SDG alignment report',
        'category': 'Compliance',
        'uses': 15,
      },
      {
        'name': 'Investor Quarterly Update',
        'description': 'Financial and impact metrics for investors',
        'category': 'Financial',
        'uses': 23,
      },
      {
        'name': 'Stakeholder Summary',
        'description': 'High-level impact summary for stakeholders',
        'category': 'Communication',
        'uses': 8,
      },
      {
        'name': 'Regulatory Compliance',
        'description': 'Regulatory reporting and compliance metrics',
        'category': 'Compliance',
        'uses': 12,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Report Templates',
          style: AdaptiveTextStyles.titleMedium(context),
        ),
        AdaptiveSpacing.verticalMedium(),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            mainAxisSpacing: Spacing.sm,
            crossAxisSpacing: Spacing.sm,
          ),
          itemCount: templates.length,
          itemBuilder: (context, index) {
            final template = templates[index];
            return _buildTemplateCard(context, template);
          },
        ),
      ],
    );
  }

  /// Build template card
  Widget _buildTemplateCard(
      BuildContext context, Map<String, dynamic> template) {
    return Container(
      padding: const EdgeInsets.all(Spacing.sm),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            template['name'] as String,
            style: AdaptiveTextStyles.titleSmall(context),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          AdaptiveSpacing.verticalSmall(),
          Text(
            template['description'] as String,
            style: AdaptiveTextStyles.bodySmall(context),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  template['category'] as String,
                  style: AdaptiveTextStyles.bodySmall(context).copyWith(
                    fontSize: 10,
                  ),
                ),
              ),
              Text(
                '${template['uses']} uses',
                style: AdaptiveTextStyles.bodySmall(context).copyWith(
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Handle report actions
  void _handleReportAction(String action, Map<String, dynamic> report) {
    switch (action) {
      case 'download':
        _downloadReport(report);
        break;
      case 'edit':
        _editReport(report);
        break;
      case 'share':
        _shareReport(report);
        break;
      case 'duplicate':
        _duplicateReport(report);
        break;
      case 'delete':
        _deleteReport(report);
        break;
    }
  }

  /// Generate new report
  void _generateNewReport() {
    // Navigate to report generation
  }

  /// Navigate to all reports
  void _navigateToAllReports() {
    // Navigate to reports list
  }

  /// Generate quarterly report
  void _generateQuarterlyReport() {
    // Generate quarterly report
  }

  /// Generate investor update
  void _generateInvestorUpdate() {
    // Generate investor update
  }

  /// Generate compliance report
  void _generateComplianceReport() {
    // Generate compliance report
  }

  /// Customize report
  void _customizeReport() {
    // Open report customization
  }

  /// Download report
  void _downloadReport(Map<String, dynamic> report) {
    // Download report implementation
  }

  /// Edit report
  void _editReport(Map<String, dynamic> report) {
    // Edit report implementation
  }

  /// Share report
  void _shareReport(Map<String, dynamic> report) {
    // Share report implementation
  }

  /// Duplicate report
  void _duplicateReport(Map<String, dynamic> report) {
    // Duplicate report implementation
  }

  /// Delete report
  void _deleteReport(Map<String, dynamic> report) {
    // Delete report implementation
  }
}
