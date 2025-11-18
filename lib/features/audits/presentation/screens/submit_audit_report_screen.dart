import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/widgets/responsive/responsive_layout.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/constants/spacing.dart';
import '../../../auth/presentation/providers/auth_provider_aliases.dart';
import '../../domain/entities/audit.dart';
import '../providers/audits_providers.dart';

/// Submit Audit Report Screen - Final step to submit audit findings
class SubmitAuditReportScreen extends ConsumerStatefulWidget {
  final String auditId;

  const SubmitAuditReportScreen({
    super.key,
    required this.auditId,
  });

  @override
  ConsumerState<SubmitAuditReportScreen> createState() =>
      _SubmitAuditReportScreenState();
}

class _SubmitAuditReportScreenState
    extends ConsumerState<SubmitAuditReportScreen> {
  final _formKey = GlobalKey<FormState>();
  final _summaryController = TextEditingController();
  final _recommendationsController = TextEditingController();
  final _rejectionReasonController = TextEditingController();

  final List<TextEditingController> _strengthControllers = [
    TextEditingController()
  ];
  final List<TextEditingController> _weaknessControllers = [
    TextEditingController()
  ];

  AuditDecision _decision = AuditDecision.approved;
  bool _isSubmitting = false;

  @override
  void dispose() {
    _summaryController.dispose();
    _recommendationsController.dispose();
    _rejectionReasonController.dispose();
    for (var controller in _strengthControllers) {
      controller.dispose();
    }
    for (var controller in _weaknessControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: _buildMobileLayout(context),
      tablet: _buildTabletLayout(context),
      desktop: _buildDesktopLayout(context),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Submit Audit Report'),
      ),
      body: _buildContent(context),
    );
  }

  Widget _buildTabletLayout(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Submit Audit Report'),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: _buildContent(context),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Submit Audit Report'),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Padding(
            padding: const EdgeInsets.all(Spacing.xl),
            child: _buildContent(context),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    final auditAsync = ref.watch(auditProvider(widget.auditId));

    return auditAsync.when(
      data: (audit) {
        if (audit == null) {
          return const Center(child: Text('Audit not found'));
        }

        // Check if all criteria are scored
        final allScored =
            audit.criteria.every((criterion) => criterion.score != null);

        if (!allScored) {
          return _buildIncompleteScoringWarning(context, audit);
        }

        return _buildForm(context, audit);
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('Error: $error')),
    );
  }

  Widget _buildIncompleteScoringWarning(BuildContext context, Audit audit) {
    final unscoredCount =
        audit.criteria.where((c) => c.score == null).length;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.xl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.warning,
              size: 80,
              color: Colors.orange,
            ),
            const SizedBox(height: Spacing.lg),
            Text(
              'Incomplete Scoring',
              style: AdaptiveTextStyles.headlineMedium(context),
            ),
            const SizedBox(height: Spacing.md),
            Text(
              'You must score all criteria before submitting the audit report.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey.shade600),
            ),
            const SizedBox(height: Spacing.sm),
            Text(
              '$unscoredCount criteria remaining',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: Spacing.xl),
            FilledButton.icon(
              onPressed: () => context.pop(),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Return to Audit'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildForm(BuildContext context, Audit audit) {
    final overallScore = audit.overallScore ?? _calculateOverallScore(audit);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(Spacing.md),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Overall score display
            AdaptiveCard(
              child: Padding(
                padding: const EdgeInsets.all(Spacing.lg),
                child: Column(
                  children: [
                    Text(
                      'Overall Audit Score',
                      style: AdaptiveTextStyles.titleMedium(context),
                    ),
                    const SizedBox(height: Spacing.md),
                    Text(
                      overallScore.toStringAsFixed(1),
                      style: TextStyle(
                        fontSize: 64,
                        fontWeight: FontWeight.bold,
                        color: _getScoreColor(overallScore),
                      ),
                    ),
                    Text(
                      'out of 10',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(height: Spacing.sm),
                    Text(
                      'Grade: ${_getScoreGrade(overallScore)}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: Spacing.lg),

            // Decision
            AdaptiveCard(
              child: Padding(
                padding: const EdgeInsets.all(Spacing.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Audit Decision *',
                      style: AdaptiveTextStyles.titleMedium(context),
                    ),
                    const SizedBox(height: Spacing.md),
                    ...AuditDecision.values.map((decision) {
                      return RadioListTile<AuditDecision>(
                        title: Text(_getDecisionName(decision)),
                        subtitle: Text(_getDecisionDescription(decision)),
                        value: decision,
                        groupValue: _decision,
                        onChanged: (value) {
                          setState(() => _decision = value!);
                        },
                      );
                    }),
                  ],
                ),
              ),
            ),

            if (_decision == AuditDecision.rejected) ...[
              const SizedBox(height: Spacing.md),
              AdaptiveCard(
                child: Padding(
                  padding: const EdgeInsets.all(Spacing.md),
                  child: TextFormField(
                    controller: _rejectionReasonController,
                    decoration: const InputDecoration(
                      labelText: 'Rejection Reason *',
                      hintText: 'Explain why this audit was rejected...',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 3,
                    validator: (value) {
                      if (_decision == AuditDecision.rejected &&
                          (value == null || value.trim().isEmpty)) {
                        return 'Rejection reason is required';
                      }
                      return null;
                    },
                  ),
                ),
              ),
            ],

            const SizedBox(height: Spacing.lg),

            // Summary
            AdaptiveCard(
              child: Padding(
                padding: const EdgeInsets.all(Spacing.md),
                child: TextFormField(
                  controller: _summaryController,
                  decoration: const InputDecoration(
                    labelText: 'Executive Summary *',
                    hintText: 'Provide a comprehensive summary of your audit findings...',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 5,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Summary is required';
                    }
                    if (value.length < 50) {
                      return 'Summary must be at least 50 characters';
                    }
                    return null;
                  },
                ),
              ),
            ),

            const SizedBox(height: Spacing.md),

            // Recommendations
            AdaptiveCard(
              child: Padding(
                padding: const EdgeInsets.all(Spacing.md),
                child: TextFormField(
                  controller: _recommendationsController,
                  decoration: const InputDecoration(
                    labelText: 'Recommendations *',
                    hintText: 'Provide recommendations for improvement...',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 5,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Recommendations are required';
                    }
                    if (value.length < 30) {
                      return 'Recommendations must be at least 30 characters';
                    }
                    return null;
                  },
                ),
              ),
            ),

            const SizedBox(height: Spacing.lg),

            // Strengths
            AdaptiveCard(
              child: Padding(
                padding: const EdgeInsets.all(Spacing.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Key Strengths',
                      style: AdaptiveTextStyles.titleMedium(context),
                    ),
                    const SizedBox(height: Spacing.sm),
                    ..._strengthControllers.asMap().entries.map((entry) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: Spacing.sm),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: entry.value,
                                decoration: InputDecoration(
                                  labelText: 'Strength ${entry.key + 1}',
                                  border: const OutlineInputBorder(),
                                ),
                                validator: entry.key == 0
                                    ? (value) {
                                        if (value == null || value.trim().isEmpty) {
                                          return 'At least one strength is required';
                                        }
                                        return null;
                                      }
                                    : null,
                              ),
                            ),
                            if (_strengthControllers.length > 1)
                              IconButton(
                                icon: const Icon(Icons.remove_circle),
                                onPressed: () {
                                  setState(() {
                                    _strengthControllers[entry.key].dispose();
                                    _strengthControllers.removeAt(entry.key);
                                  });
                                },
                              ),
                          ],
                        ),
                      );
                    }),
                    TextButton.icon(
                      onPressed: () {
                        setState(() {
                          _strengthControllers.add(TextEditingController());
                        });
                      },
                      icon: const Icon(Icons.add),
                      label: const Text('Add Strength'),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: Spacing.md),

            // Weaknesses
            AdaptiveCard(
              child: Padding(
                padding: const EdgeInsets.all(Spacing.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Areas for Improvement',
                      style: AdaptiveTextStyles.titleMedium(context),
                    ),
                    const SizedBox(height: Spacing.sm),
                    ..._weaknessControllers.asMap().entries.map((entry) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: Spacing.sm),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: entry.value,
                                decoration: InputDecoration(
                                  labelText: 'Improvement Area ${entry.key + 1}',
                                  border: const OutlineInputBorder(),
                                ),
                                validator: entry.key == 0
                                    ? (value) {
                                        if (value == null || value.trim().isEmpty) {
                                          return 'At least one improvement area is required';
                                        }
                                        return null;
                                      }
                                    : null,
                              ),
                            ),
                            if (_weaknessControllers.length > 1)
                              IconButton(
                                icon: const Icon(Icons.remove_circle),
                                onPressed: () {
                                  setState(() {
                                    _weaknessControllers[entry.key].dispose();
                                    _weaknessControllers.removeAt(entry.key);
                                  });
                                },
                              ),
                          ],
                        ),
                      );
                    }),
                    TextButton.icon(
                      onPressed: () {
                        setState(() {
                          _weaknessControllers.add(TextEditingController());
                        });
                      },
                      icon: const Icon(Icons.add),
                      label: const Text('Add Improvement Area'),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: Spacing.xl),

            // Submit button
            FilledButton.icon(
              onPressed: _isSubmitting ? null : () => _submitReport(audit),
              icon: _isSubmitting
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.send),
              label: Text(_isSubmitting ? 'Submitting...' : 'Submit Audit Report'),
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.all(Spacing.md),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double _calculateOverallScore(Audit audit) {
    if (audit.criteria.isEmpty) return 0.0;

    double totalWeightedScore = 0.0;
    int totalWeight = 0;

    for (final criterion in audit.criteria) {
      if (criterion.score != null) {
        totalWeightedScore += (criterion.score! / 10) * criterion.weight;
        totalWeight += criterion.weight;
      }
    }

    if (totalWeight == 0) return 0.0;
    return (totalWeightedScore / totalWeight) * 10;
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

  String _getDecisionName(AuditDecision decision) {
    switch (decision) {
      case AuditDecision.approved:
        return 'Approved';
      case AuditDecision.approvedWithConditions:
        return 'Approved with Conditions';
      case AuditDecision.rejected:
        return 'Rejected';
    }
  }

  String _getDecisionDescription(AuditDecision decision) {
    switch (decision) {
      case AuditDecision.approved:
        return 'The project/milestone meets all requirements';
      case AuditDecision.approvedWithConditions:
        return 'Approved with specific conditions that must be met';
      case AuditDecision.rejected:
        return 'The project/milestone does not meet requirements';
    }
  }

  Future<void> _submitReport(Audit audit) async {
    if (!_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all required fields')),
      );
      return;
    }

    setState(() => _isSubmitting = true);

    final authState = ref.read(authStateProvider);
    final auditorId = authState.maybeWhen(
      authenticated: (user) => user.id,
      orElse: () => '',
    );

    final strengths = _strengthControllers
        .map((c) => c.text.trim())
        .where((s) => s.isNotEmpty)
        .toList();

    final weaknesses = _weaknessControllers
        .map((c) => c.text.trim())
        .where((w) => w.isNotEmpty)
        .toList();

    final notifier = ref.read(auditReportSubmissionNotifierProvider.notifier);

    final report = await notifier.submitReport(
      auditId: widget.auditId,
      projectId: audit.projectId,
      milestoneId: audit.milestoneId,
      auditorId: auditorId,
      criteria: audit.criteria,
      summary: _summaryController.text.trim(),
      recommendations: _recommendationsController.text.trim(),
      strengths: strengths,
      weaknesses: weaknesses,
      decision: _decision,
      rejectionReason: _decision == AuditDecision.rejected
          ? _rejectionReasonController.text.trim()
          : null,
    );

    setState(() => _isSubmitting = false);

    if (!mounted) return;

    if (report != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Audit report submitted successfully')),
      );
      context.go('/audits');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to submit audit report')),
      );
    }
  }
}
