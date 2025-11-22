import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/constants/spacing.dart';
import '../../domain/entities/audit.dart';
import '../providers/audits_providers.dart';

/// Card for scoring a single audit criterion
class AuditCriterionCard extends ConsumerStatefulWidget {
  final String auditId;
  final AuditCriterion criterion;
  final bool isEditable;

  const AuditCriterionCard({
    super.key,
    required this.auditId,
    required this.criterion,
    this.isEditable = true,
  });

  @override
  ConsumerState<AuditCriterionCard> createState() => _AuditCriterionCardState();
}

class _AuditCriterionCardState extends ConsumerState<AuditCriterionCard> {
  late double _score;
  final TextEditingController _notesController = TextEditingController();
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _score = widget.criterion.score ?? 0.0;
    _notesController.text = widget.criterion.notes ?? '';
  }

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hasScore = widget.criterion.score != null;

    return AdaptiveCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          InkWell(
            onTap: () => setState(() => _isExpanded = !_isExpanded),
            child: Padding(
              padding: const EdgeInsets.all(Spacing.md),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                widget.criterion.name,
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              '${widget.criterion.weight}%',
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: Spacing.xs),
                        Text(
                          widget.criterion.description,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: Spacing.sm),
                  if (hasScore)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Spacing.sm,
                        vertical: Spacing.xs,
                      ),
                      decoration: BoxDecoration(
                        color: _getScoreColor(widget.criterion.score!).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: _getScoreColor(widget.criterion.score!).withOpacity(0.3),
                        ),
                      ),
                      child: Text(
                        '${widget.criterion.score!.toStringAsFixed(1)}/10',
                        style: TextStyle(
                          color: _getScoreColor(widget.criterion.score!),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  const SizedBox(width: Spacing.xs),
                  Icon(
                    _isExpanded ? Icons.expand_less : Icons.expand_more,
                    color: Colors.grey.shade600,
                  ),
                ],
              ),
            ),
          ),

          // Expanded content
          if (_isExpanded) ...[
            const Divider(height: 1),
            Padding(
              padding: const EdgeInsets.all(Spacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.isEditable) ...[
                    // Score slider
                    Text(
                      'Score: ${_score.toStringAsFixed(1)}/10',
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: Spacing.sm),
                    Row(
                      children: [
                        Expanded(
                          child: Slider(
                            value: _score,
                            min: 0,
                            max: 10,
                            divisions: 20,
                            label: _score.toStringAsFixed(1),
                            onChanged: (value) {
                              setState(() => _score = value);
                            },
                          ),
                        ),
                        const SizedBox(width: Spacing.sm),
                        SizedBox(
                          width: 60,
                          child: Text(
                            _getScoreLabel(_score),
                            style: TextStyle(
                              color: _getScoreColor(_score),
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: Spacing.md),

                    // Notes
                    Text(
                      'Notes (Optional)',
                      style: theme.textTheme.titleSmall,
                    ),
                    const SizedBox(height: Spacing.sm),
                    TextField(
                      controller: _notesController,
                      decoration: const InputDecoration(
                        hintText: 'Add notes about this criterion...',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 3,
                    ),

                    const SizedBox(height: Spacing.md),

                    // Save button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              _score = widget.criterion.score ?? 0.0;
                              _notesController.text = widget.criterion.notes ?? '';
                              _isExpanded = false;
                            });
                          },
                          child: const Text('Cancel'),
                        ),
                        const SizedBox(width: Spacing.sm),
                        FilledButton(
                          onPressed: _saveScore,
                          child: const Text('Save Score'),
                        ),
                      ],
                    ),
                  ] else ...[
                    // Read-only view
                    Row(
                      children: [
                        Text(
                          'Score: ',
                          style: theme.textTheme.titleSmall,
                        ),
                        Text(
                          '${widget.criterion.score?.toStringAsFixed(1) ?? 'Not scored'}/10',
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: widget.criterion.score != null
                                ? _getScoreColor(widget.criterion.score!)
                                : null,
                          ),
                        ),
                      ],
                    ),
                    if (widget.criterion.notes != null &&
                        widget.criterion.notes!.isNotEmpty) ...[
                      const SizedBox(height: Spacing.md),
                      Text(
                        'Notes:',
                        style: theme.textTheme.titleSmall,
                      ),
                      const SizedBox(height: Spacing.xs),
                      Text(
                        widget.criterion.notes!,
                        style: theme.textTheme.bodyMedium,
                      ),
                    ],
                  ],
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Color _getScoreColor(double score) {
    if (score >= 8.0) return Colors.green;
    if (score >= 6.0) return Colors.blue;
    if (score >= 4.0) return Colors.orange;
    return Colors.red;
  }

  String _getScoreLabel(double score) {
    if (score >= 9.0) return 'Excellent';
    if (score >= 7.0) return 'Good';
    if (score >= 5.0) return 'Fair';
    if (score >= 3.0) return 'Poor';
    return 'Failing';
  }

  Future<void> _saveScore() async {
    final notifier = ref.read(auditScoringNotifierProvider.notifier);

    await notifier.updateCriterionScore(
      auditId: widget.auditId,
      criterionId: widget.criterion.id,
      score: _score,
      notes: _notesController.text.isEmpty ? null : _notesController.text,
    );

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Score saved successfully')),
    );

    setState(() => _isExpanded = false);
  }
}
