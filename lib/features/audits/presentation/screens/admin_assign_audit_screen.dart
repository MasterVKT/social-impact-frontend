import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/widgets/responsive/responsive_layout.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/constants/spacing.dart';
import '../../../auth/presentation/providers/auth_provider_aliases.dart';
import '../../../projects/presentation/providers/projects_providers.dart';
import '../../domain/entities/audit.dart';
import '../providers/audits_providers.dart';

/// Admin screen for assigning audits to auditors
class AdminAssignAuditScreen extends ConsumerStatefulWidget {
  final String? projectId;
  final String? milestoneId;

  const AdminAssignAuditScreen({
    super.key,
    this.projectId,
    this.milestoneId,
  });

  @override
  ConsumerState<AdminAssignAuditScreen> createState() =>
      _AdminAssignAuditScreenState();
}

class _AdminAssignAuditScreenState
    extends ConsumerState<AdminAssignAuditScreen> {
  final _formKey = GlobalKey<FormState>();

  String? _selectedProjectId;
  String? _selectedMilestoneId;
  AuditType _selectedAuditType = AuditType.projectInitial;
  String? _selectedAuditorId;
  DateTime? _selectedDueDate;

  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    _selectedProjectId = widget.projectId;
    _selectedMilestoneId = widget.milestoneId;
    _selectedDueDate = DateTime.now().add(const Duration(days: 14));
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
        title: const Text('Assign Audit'),
      ),
      body: _buildContent(context),
    );
  }

  Widget _buildTabletLayout(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assign Audit'),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: _buildContent(context),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assign Audit'),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Padding(
            padding: const EdgeInsets.all(Spacing.xl),
            child: _buildContent(context),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(Spacing.md),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Info card
            AdaptiveCard(
              child: Padding(
                padding: const EdgeInsets.all(Spacing.md),
                child: Row(
                  children: [
                    const Icon(Icons.info_outline, color: Colors.blue),
                    const SizedBox(width: Spacing.md),
                    Expanded(
                      child: Text(
                        'Assign an audit to an auditor for review and assessment',
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: Spacing.lg),

            // Project selection
            if (widget.projectId == null)
              AdaptiveCard(
                child: Padding(
                  padding: const EdgeInsets.all(Spacing.md),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Select Project *',
                        style: AdaptiveTextStyles.titleMedium(context),
                      ),
                      const SizedBox(height: Spacing.md),
                      _buildProjectSelector(),
                    ],
                  ),
                ),
              ),

            if (widget.projectId != null)
              AdaptiveCard(
                child: Padding(
                  padding: const EdgeInsets.all(Spacing.md),
                  child: _buildProjectInfo(),
                ),
              ),

            const SizedBox(height: Spacing.md),

            // Audit type selection
            AdaptiveCard(
              child: Padding(
                padding: const EdgeInsets.all(Spacing.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Audit Type *',
                      style: AdaptiveTextStyles.titleMedium(context),
                    ),
                    const SizedBox(height: Spacing.md),
                    ...AuditType.values.map((type) {
                      return RadioListTile<AuditType>(
                        title: Text(_getAuditTypeName(type)),
                        subtitle: Text(_getAuditTypeDescription(type)),
                        value: type,
                        groupValue: _selectedAuditType,
                        onChanged: (value) {
                          setState(() => _selectedAuditType = value!);
                        },
                      );
                    }),
                  ],
                ),
              ),
            ),

            const SizedBox(height: Spacing.md),

            // Auditor selection
            AdaptiveCard(
              child: Padding(
                padding: const EdgeInsets.all(Spacing.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Assign to Auditor *',
                      style: AdaptiveTextStyles.titleMedium(context),
                    ),
                    const SizedBox(height: Spacing.md),
                    _buildAuditorSelector(),
                  ],
                ),
              ),
            ),

            const SizedBox(height: Spacing.md),

            // Due date selection
            AdaptiveCard(
              child: Padding(
                padding: const EdgeInsets.all(Spacing.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Due Date *',
                      style: AdaptiveTextStyles.titleMedium(context),
                    ),
                    const SizedBox(height: Spacing.md),
                    ListTile(
                      leading: const Icon(Icons.calendar_today),
                      title: Text(
                        _selectedDueDate != null
                            ? '${_selectedDueDate!.day}/${_selectedDueDate!.month}/${_selectedDueDate!.year}'
                            : 'Select due date',
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: _selectDueDate,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: Spacing.xl),

            // Submit button
            FilledButton.icon(
              onPressed: _isSubmitting ? null : _assignAudit,
              icon: _isSubmitting
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.assignment_turned_in),
              label: Text(_isSubmitting ? 'Assigning...' : 'Assign Audit'),
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.all(Spacing.md),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectSelector() {
    // TODO: Implement project dropdown with active projects
    // For now, use a text field
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Project ID',
        hintText: 'Enter project ID',
        border: OutlineInputBorder(),
      ),
      onChanged: (value) => setState(() => _selectedProjectId = value),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Project ID is required';
        }
        return null;
      },
    );
  }

  Widget _buildProjectInfo() {
    if (_selectedProjectId == null) return const SizedBox.shrink();

    final projectAsync = ref.watch(projectProvider(_selectedProjectId!));

    return projectAsync.when(
      data: (project) {
        if (project == null) {
          return const Text('Project not found');
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Project',
              style: AdaptiveTextStyles.titleMedium(context),
            ),
            const SizedBox(height: Spacing.md),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.folder_open),
              title: Text(project.title),
              subtitle: Text('Category: ${project.category.name}'),
            ),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Text('Error loading project: $error'),
    );
  }

  Widget _buildAuditorSelector() {
    // TODO: Implement auditor dropdown with active auditors
    // For now, use a text field
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Auditor ID',
        hintText: 'Enter auditor user ID',
        border: OutlineInputBorder(),
      ),
      onChanged: (value) => setState(() => _selectedAuditorId = value),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Auditor ID is required';
        }
        return null;
      },
    );
  }

  Future<void> _selectDueDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDueDate ?? DateTime.now().add(const Duration(days: 14)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (picked != null) {
      setState(() => _selectedDueDate = picked);
    }
  }

  Future<void> _assignAudit() async {
    if (!_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all required fields')),
      );
      return;
    }

    if (_selectedProjectId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a project')),
      );
      return;
    }

    if (_selectedAuditorId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select an auditor')),
      );
      return;
    }

    if (_selectedDueDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a due date')),
      );
      return;
    }

    setState(() => _isSubmitting = true);

    final authState = ref.read(authStateProvider);
    final adminId = authState.maybeWhen(
      authenticated: (user) => user.id,
      orElse: () => '',
    );

    final notifier = ref.read(auditCreationNotifierProvider.notifier);

    final audit = await notifier.createAudit(
      projectId: _selectedProjectId!,
      milestoneId: _selectedMilestoneId,
      type: _selectedAuditType,
      assignedTo: _selectedAuditorId!,
      assignedBy: adminId,
      dueDate: _selectedDueDate!,
    );

    setState(() => _isSubmitting = false);

    if (!mounted) return;

    if (audit != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Audit assigned successfully')),
      );
      context.pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to assign audit')),
      );
    }
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

  String _getAuditTypeDescription(AuditType type) {
    switch (type) {
      case AuditType.projectInitial:
        return 'Assess project feasibility and planning before funding';
      case AuditType.projectInterim:
        return 'Review progress and impact during project execution';
      case AuditType.projectFinal:
        return 'Evaluate final outcomes and impact achieved';
      case AuditType.milestoneCompletion:
        return 'Verify milestone completion and quality';
    }
  }
}
