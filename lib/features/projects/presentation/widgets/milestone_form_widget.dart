import 'package:flutter/material.dart';
import '../../../../shared/widgets/adaptive/adaptive_button.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_field.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/constants/spacing.dart';
import '../../domain/entities/project.dart';

/// Dialog for creating or editing a project milestone
class MilestoneFormDialog extends StatefulWidget {
  final ProjectMilestone? milestone;

  const MilestoneFormDialog({
    super.key,
    this.milestone,
  });

  @override
  State<MilestoneFormDialog> createState() => _MilestoneFormDialogState();
}

class _MilestoneFormDialogState extends State<MilestoneFormDialog> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _fundingController = TextEditingController();

  DateTime? _targetDate;

  @override
  void initState() {
    super.initState();
    if (widget.milestone != null) {
      _titleController.text = widget.milestone!.title;
      _descriptionController.text = widget.milestone!.description;
      _targetDate = widget.milestone!.targetDate;
      if (widget.milestone!.fundingRequired != null) {
        _fundingController.text =
            widget.milestone!.fundingRequired!.toStringAsFixed(0);
      }
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _fundingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 500),
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title
                Text(
                  widget.milestone == null
                      ? 'Add Milestone'
                      : 'Edit Milestone',
                  style: AdaptiveTextStyles.titleLarge(context),
                ),
                const AdaptiveSpacing.vertical(size: SpacingSize.large),

                // Milestone title
                AdaptiveTextField(
                  controller: _titleController,
                  label: 'Milestone Title',
                  hint: 'e.g., Complete initial setup',
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Title is required';
                    }
                    return null;
                  },
                ),
                const AdaptiveSpacing.vertical(size: SpacingSize.medium),

                // Description
                AdaptiveTextField(
                  controller: _descriptionController,
                  label: 'Description',
                  hint: 'Describe what needs to be accomplished',
                  maxLines: 4,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Description is required';
                    }
                    return null;
                  },
                ),
                const AdaptiveSpacing.vertical(size: SpacingSize.medium),

                // Target date
                _buildDatePicker(context),
                const AdaptiveSpacing.vertical(size: SpacingSize.medium),

                // Funding required (optional)
                AdaptiveTextField(
                  controller: _fundingController,
                  label: 'Funding Required (Optional)',
                  hint: 'Amount needed for this milestone',
                  keyboardType: TextInputType.number,
                  prefixIcon: Icons.euro,
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      final amount = double.tryParse(value);
                      if (amount == null) {
                        return 'Please enter a valid number';
                      }
                      if (amount < 0) {
                        return 'Amount must be positive';
                      }
                    }
                    return null;
                  },
                ),
                const AdaptiveSpacing.vertical(size: SpacingSize.extraLarge),

                // Actions
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AdaptiveButton(
                      onPressed: () => Navigator.pop(context),
                      label: 'Cancel',
                      buttonType: ButtonType.text,
                    ),
                    const AdaptiveSpacing.horizontal(size: SpacingSize.medium),
                    AdaptiveButton(
                      onPressed: () => _saveMilestone(),
                      label: widget.milestone == null ? 'Add' : 'Save',
                      buttonType: ButtonType.primary,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDatePicker(BuildContext context) {
    return InkWell(
      onTap: () => _selectDate(context),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: 'Target Date',
          border: const OutlineInputBorder(),
          suffixIcon: const Icon(Icons.calendar_today),
          errorText: _targetDate == null ? 'Target date is required' : null,
        ),
        child: Text(
          _targetDate != null
              ? '${_targetDate!.day}/${_targetDate!.month}/${_targetDate!.year}'
              : 'Select target date',
          style: _targetDate != null
              ? null
              : TextStyle(
                  color: Theme.of(context).hintColor,
                ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _targetDate ?? DateTime.now().add(const Duration(days: 30)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (picked != null) {
      setState(() {
        _targetDate = picked;
      });
    }
  }

  void _saveMilestone() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (_targetDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a target date')),
      );
      return;
    }

    final milestone = ProjectMilestone(
      id: widget.milestone?.id ?? '',
      projectId: widget.milestone?.projectId ?? '',
      title: _titleController.text,
      description: _descriptionController.text,
      targetDate: _targetDate!,
      status: widget.milestone?.status ?? MilestoneStatus.pending,
      fundingRequired: _fundingController.text.isNotEmpty
          ? double.parse(_fundingController.text)
          : null,
    );

    Navigator.pop(context, milestone);
  }
}
