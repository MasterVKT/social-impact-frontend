import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../shared/widgets/adaptive/adaptive_button.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_field.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/widgets/responsive/responsive_layout.dart';
import '../../../../shared/constants/spacing.dart';
import '../../../projects/domain/entities/project.dart';
import '../providers/milestones_providers.dart';

/// Screen for submitting evidence for a milestone
class SubmitEvidenceScreen extends ConsumerStatefulWidget {
  final String projectId;
  final String milestoneId;
  final ProjectMilestone milestone;

  const SubmitEvidenceScreen({
    super.key,
    required this.projectId,
    required this.milestoneId,
    required this.milestone,
  });

  @override
  ConsumerState<SubmitEvidenceScreen> createState() =>
      _SubmitEvidenceScreenState();
}

class _SubmitEvidenceScreenState extends ConsumerState<SubmitEvidenceScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  final List<File> _files = [];
  final List<File> _images = [];

  bool _isSubmitting = false;

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Submit Evidence'),
      ),
      body: ResponsiveLayout(
        mobile: _buildFormLayout(context),
        tablet: _buildFormLayout(context),
        desktop: _buildFormLayout(context),
      ),
    );
  }

  Widget _buildFormLayout(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Milestone info
                _buildMilestoneInfo(context),
                const AdaptiveSpacing.vertical(size: SpacingSize.large),

                // Evidence form
                _buildEvidenceForm(context),
                const AdaptiveSpacing.vertical(size: SpacingSize.large),

                // Files section
                _buildFilesSection(context),
                const AdaptiveSpacing.vertical(size: SpacingSize.large),

                // Images section
                _buildImagesSection(context),
                const AdaptiveSpacing.vertical(size: SpacingSize.extraLarge),

                // Submit button
                AdaptiveButton(
                  onPressed: () => _submitEvidence(),
                  label: 'Submit Evidence',
                  buttonType: ButtonType.primary,
                  isFullWidth: true,
                  isLoading: _isSubmitting,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMilestoneInfo(BuildContext context) {
    return AdaptiveCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Milestone Information',
            style: AdaptiveTextStyles.titleLarge(context),
          ),
          const AdaptiveSpacing.vertical(size: SpacingSize.medium),
          Text(
            widget.milestone.title,
            style: AdaptiveTextStyles.titleMedium(context),
          ),
          const AdaptiveSpacing.vertical(size: SpacingSize.small),
          Text(
            widget.milestone.description,
            style: AdaptiveTextStyles.bodyMedium(context),
          ),
          const AdaptiveSpacing.vertical(size: SpacingSize.medium),
          Container(
            padding: const EdgeInsets.all(AppSpacing.sm),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceVariant,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.info_outline,
                  size: 20,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                const AdaptiveSpacing.horizontal(size: SpacingSize.small),
                Expanded(
                  child: Text(
                    'Please provide detailed evidence demonstrating completion of this milestone.',
                    style: AdaptiveTextStyles.bodySmall(context),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEvidenceForm(BuildContext context) {
    return AdaptiveCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Evidence Details',
            style: AdaptiveTextStyles.titleLarge(context),
          ),
          const AdaptiveSpacing.vertical(size: SpacingSize.large),

          // Title
          AdaptiveTextField(
            controller: _titleController,
            label: 'Evidence Title',
            hint: 'Brief title describing the evidence',
            maxLength: 100,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Evidence title is required';
              }
              if (value.length < 5) {
                return 'Title must be at least 5 characters';
              }
              return null;
            },
          ),
          const AdaptiveSpacing.vertical(size: SpacingSize.medium),

          // Description
          AdaptiveTextField(
            controller: _descriptionController,
            label: 'Description',
            hint: 'Detailed description of the evidence (minimum 20 characters)',
            maxLines: 6,
            maxLength: 2000,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Description is required';
              }
              if (value.length < 20) {
                return 'Description must be at least 20 characters';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFilesSection(BuildContext context) {
    return AdaptiveCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Supporting Documents',
                style: AdaptiveTextStyles.titleMedium(context),
              ),
              Text(
                '${_files.length}/5',
                style: AdaptiveTextStyles.bodyMedium(context),
              ),
            ],
          ),
          const AdaptiveSpacing.vertical(size: SpacingSize.small),
          Text(
            'Upload PDFs or documents (optional, max 5 files)',
            style: AdaptiveTextStyles.bodySmall(context),
          ),
          const AdaptiveSpacing.vertical(size: SpacingSize.medium),

          // Files list
          if (_files.isEmpty)
            _buildEmptyState(
              context,
              Icons.description,
              'No documents uploaded',
            )
          else
            ..._files.asMap().entries.map((entry) {
              final index = entry.key;
              final file = entry.value;
              return _buildFileCard(context, file, index);
            }).toList(),

          // Add file button
          if (_files.length < 5) ...[
            const AdaptiveSpacing.vertical(size: SpacingSize.medium),
            AdaptiveButton(
              onPressed: () => _pickFile(),
              label: 'Add Document',
              buttonType: ButtonType.secondary,
              prefixIcon: Icons.upload_file,
              isFullWidth: true,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildImagesSection(BuildContext context) {
    return AdaptiveCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Evidence Photos',
                style: AdaptiveTextStyles.titleMedium(context),
              ),
              Text(
                '${_images.length}/5',
                style: AdaptiveTextStyles.bodyMedium(context),
              ),
            ],
          ),
          const AdaptiveSpacing.vertical(size: SpacingSize.small),
          Text(
            'Upload photos showing milestone completion (optional, max 5 images)',
            style: AdaptiveTextStyles.bodySmall(context),
          ),
          const AdaptiveSpacing.vertical(size: SpacingSize.medium),

          // Images grid
          if (_images.isEmpty)
            _buildEmptyState(
              context,
              Icons.photo_library,
              'No photos uploaded',
            )
          else
            Wrap(
              spacing: AppSpacing.md,
              runSpacing: AppSpacing.md,
              children: _images.asMap().entries.map((entry) {
                final index = entry.key;
                final image = entry.value;
                return _buildImageCard(context, image, index);
              }).toList(),
            ),

          // Add image button
          if (_images.length < 5) ...[
            const AdaptiveSpacing.vertical(size: SpacingSize.medium),
            AdaptiveButton(
              onPressed: () => _pickImage(),
              label: 'Add Photo',
              buttonType: ButtonType.secondary,
              prefixIcon: Icons.add_photo_alternate,
              isFullWidth: true,
            ),
          ],

          // Requirement note
          if (_files.isEmpty && _images.isEmpty) ...[
            const AdaptiveSpacing.vertical(size: SpacingSize.medium),
            Container(
              padding: const EdgeInsets.all(AppSpacing.sm),
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.orange),
              ),
              child: Row(
                children: [
                  const Icon(Icons.warning, color: Colors.orange, size: 20),
                  const AdaptiveSpacing.horizontal(size: SpacingSize.small),
                  Expanded(
                    child: Text(
                      'At least one document or photo is required',
                      style: AdaptiveTextStyles.bodySmall(context),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context, IconData icon, String message) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.xl),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline,
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 48,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          const AdaptiveSpacing.vertical(size: SpacingSize.small),
          Text(
            message,
            style: AdaptiveTextStyles.bodyMedium(context),
          ),
        ],
      ),
    );
  }

  Widget _buildFileCard(BuildContext context, File file, int index) {
    final fileName = file.path.split('/').last;

    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(
            Icons.description,
            color: Theme.of(context).colorScheme.primary,
          ),
          const AdaptiveSpacing.horizontal(size: SpacingSize.medium),
          Expanded(
            child: Text(
              fileName,
              style: AdaptiveTextStyles.bodyMedium(context),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              setState(() {
                _files.removeAt(index);
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildImageCard(BuildContext context, File image, int index) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.file(
            image,
            width: 120,
            height: 120,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 4,
          right: 4,
          child: IconButton.filled(
            onPressed: () {
              setState(() {
                _images.removeAt(index);
              });
            },
            icon: const Icon(Icons.close, size: 16),
            style: IconButton.styleFrom(
              backgroundColor: Colors.black54,
              foregroundColor: Colors.white,
              minimumSize: const Size(24, 24),
              padding: EdgeInsets.zero,
            ),
          ),
        ),
      ],
    );
  }

  // ========== ACTIONS ==========

  Future<void> _pickFile() async {
    if (_files.length >= 5) return;

    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
      allowMultiple: false,
    );

    if (result != null && result.files.isNotEmpty) {
      final path = result.files.first.path;
      if (path != null) {
        setState(() {
          _files.add(File(path));
        });
      }
    }
  }

  Future<void> _pickImage() async {
    if (_images.length >= 5) return;

    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _images.add(File(image.path));
      });
    }
  }

  Future<void> _submitEvidence() async {
    if (!_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all required fields')),
      );
      return;
    }

    if (_files.isEmpty && _images.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please upload at least one document or photo'),
        ),
      );
      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    try {
      // TODO: Get current user ID from auth
      final submittedBy = 'current_user_id';

      final notifier = ref.read(evidenceSubmissionNotifierProvider.notifier);
      final result = await notifier.submitEvidence(
        milestoneId: widget.milestoneId,
        projectId: widget.projectId,
        submittedBy: submittedBy,
        title: _titleController.text,
        description: _descriptionController.text,
        files: _files.isNotEmpty ? _files : null,
        images: _images.isNotEmpty ? _images : null,
      );

      if (mounted) {
        if (result.isSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Evidence submitted successfully!'),
            ),
          );
          context.pop();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(result.error ?? 'Failed to submit evidence'),
            ),
          );
        }
      }
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }
}
