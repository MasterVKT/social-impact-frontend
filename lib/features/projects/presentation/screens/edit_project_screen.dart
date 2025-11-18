import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../shared/widgets/adaptive/adaptive_button.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_field.dart';
import '../../../../shared/widgets/adaptive/adaptive_dropdown.dart';
import '../../../../shared/widgets/adaptive/adaptive_loading_indicator.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/widgets/responsive/responsive_layout.dart';
import '../../../../shared/constants/spacing.dart';
import '../../domain/entities/project.dart';
import '../providers/projects_providers.dart';
import '../widgets/milestone_form_widget.dart';

/// Edit project screen - only allows editing draft or pending projects
class EditProjectScreen extends ConsumerStatefulWidget {
  final String projectId;

  const EditProjectScreen({
    super.key,
    required this.projectId,
  });

  @override
  ConsumerState<EditProjectScreen> createState() => _EditProjectScreenState();
}

class _EditProjectScreenState extends ConsumerState<EditProjectScreen> {
  final _formKey = GlobalKey<FormState>();

  // Form fields
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _locationController = TextEditingController();
  final _fundingGoalController = TextEditingController();

  ProjectCategory? _selectedCategory;
  int _selectedDuration = 30;
  File? _coverImage;
  final List<File> _additionalImages = [];
  final List<ProjectMilestone> _milestones = [];

  bool _isSubmitting = false;
  bool _isInitialized = false;

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _locationController.dispose();
    _fundingGoalController.dispose();
    super.dispose();
  }

  void _initializeFromProject(Project project) {
    if (_isInitialized) return;

    _nameController.text = project.name;
    _descriptionController.text = project.description;
    _locationController.text = project.location;
    _fundingGoalController.text = project.fundingGoal.toStringAsFixed(0);
    _selectedCategory = project.category;
    _selectedDuration = project.duration;
    _milestones.addAll(project.milestones);

    _isInitialized = true;
  }

  @override
  Widget build(BuildContext context) {
    final projectAsync = ref.watch(projectProvider(widget.projectId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Project'),
      ),
      body: projectAsync.when(
        data: (project) {
          if (project == null) {
            return _buildProjectNotFound(context);
          }

          // Check if project can be edited
          if (project.status != ProjectStatus.draft &&
              project.status != ProjectStatus.submitted) {
            return _buildCannotEdit(context, project.status);
          }

          _initializeFromProject(project);

          return ResponsiveLayout(
            mobile: _buildFormLayout(context, project),
            tablet: _buildFormLayout(context, project),
            desktop: _buildFormLayout(context, project),
          );
        },
        loading: () => const Center(
          child: AdaptiveLoadingIndicator(),
        ),
        error: (error, stack) => _buildErrorState(context, error),
      ),
    );
  }

  Widget _buildFormLayout(BuildContext context, Project project) {
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
                // Warning message if submitted
                if (project.status == ProjectStatus.submitted)
                  _buildSubmittedWarning(context),

                const AdaptiveSpacing.vertical(size: SpacingSize.large),

                _buildBasicInfoForm(context),
                const AdaptiveSpacing.vertical(size: SpacingSize.large),
                _buildDetailsForm(context),
                const AdaptiveSpacing.vertical(size: SpacingSize.large),
                _buildMilestonesForm(context),
                const AdaptiveSpacing.vertical(size: SpacingSize.large),
                _buildImagesForm(context, project),
                const AdaptiveSpacing.vertical(size: SpacingSize.extraLarge),
                _buildSubmitButtons(context, project),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSubmittedWarning(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: Colors.orange.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.orange),
      ),
      child: Row(
        children: [
          const Icon(Icons.warning, color: Colors.orange),
          const AdaptiveSpacing.horizontal(size: SpacingSize.small),
          Expanded(
            child: Text(
              'This project has been submitted for review. Some fields may be restricted.',
              style: AdaptiveTextStyles.bodySmall(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBasicInfoForm(BuildContext context) {
    return AdaptiveCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Basic Information',
            style: AdaptiveTextStyles.titleLarge(context),
          ),
          const AdaptiveSpacing.vertical(size: SpacingSize.large),

          AdaptiveTextField(
            controller: _nameController,
            label: 'Project Name',
            hint: 'Enter a clear, descriptive name',
            maxLength: 100,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Project name is required';
              }
              if (value.length < 3) {
                return 'Name must be at least 3 characters';
              }
              return null;
            },
          ),
          const AdaptiveSpacing.vertical(size: SpacingSize.medium),

          AdaptiveDropdown<ProjectCategory>(
            value: _selectedCategory,
            label: 'Category',
            hint: 'Select project category',
            items: ProjectCategory.values.map((category) {
              return DropdownMenuItem(
                value: category,
                child: Text(category.displayName),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedCategory = value;
              });
            },
            validator: (value) {
              if (value == null) {
                return 'Please select a category';
              }
              return null;
            },
          ),
          const AdaptiveSpacing.vertical(size: SpacingSize.medium),

          AdaptiveTextField(
            controller: _locationController,
            label: 'Location',
            hint: 'City, Country',
            prefixIcon: Icons.location_on,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Location is required';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDetailsForm(BuildContext context) {
    return AdaptiveCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Project Details',
            style: AdaptiveTextStyles.titleLarge(context),
          ),
          const AdaptiveSpacing.vertical(size: SpacingSize.large),

          AdaptiveTextField(
            controller: _descriptionController,
            label: 'Description',
            hint: 'Describe your project in detail (minimum 50 characters)',
            maxLines: 8,
            maxLength: 5000,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Description is required';
              }
              if (value.length < 50) {
                return 'Description must be at least 50 characters';
              }
              return null;
            },
          ),
          const AdaptiveSpacing.vertical(size: SpacingSize.medium),

          AdaptiveTextField(
            controller: _fundingGoalController,
            label: 'Funding Goal (€)',
            hint: 'Enter amount between €1,000 and €1,000,000',
            keyboardType: TextInputType.number,
            prefixIcon: Icons.euro,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Funding goal is required';
              }
              final amount = double.tryParse(value);
              if (amount == null) {
                return 'Please enter a valid number';
              }
              if (amount < 1000) {
                return 'Minimum funding goal is €1,000';
              }
              if (amount > 1000000) {
                return 'Maximum funding goal is €1,000,000';
              }
              return null;
            },
          ),
          const AdaptiveSpacing.vertical(size: SpacingSize.medium),

          Text(
            'Campaign Duration',
            style: AdaptiveTextStyles.labelLarge(context),
          ),
          const AdaptiveSpacing.vertical(size: SpacingSize.small),
          SegmentedButton<int>(
            selected: {_selectedDuration},
            onSelectionChanged: (Set<int> selected) {
              setState(() {
                _selectedDuration = selected.first;
              });
            },
            segments: const [
              ButtonSegment(value: 30, label: Text('30 days')),
              ButtonSegment(value: 60, label: Text('60 days')),
              ButtonSegment(value: 90, label: Text('90 days')),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMilestonesForm(BuildContext context) {
    return AdaptiveCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Project Milestones',
                style: AdaptiveTextStyles.titleLarge(context),
              ),
              Text(
                '${_milestones.length}/3',
                style: AdaptiveTextStyles.bodyMedium(context),
              ),
            ],
          ),
          const AdaptiveSpacing.vertical(size: SpacingSize.small),
          Text(
            'Add 1-3 milestones to track project progress',
            style: AdaptiveTextStyles.bodySmall(context),
          ),
          const AdaptiveSpacing.vertical(size: SpacingSize.large),

          if (_milestones.isEmpty)
            _buildEmptyMilestones(context)
          else
            ..._milestones.asMap().entries.map((entry) {
              final index = entry.key;
              final milestone = entry.value;
              return Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.md),
                child: _buildMilestoneCard(context, milestone, index),
              );
            }).toList(),

          if (_milestones.length < 3) ...[
            const AdaptiveSpacing.vertical(size: SpacingSize.medium),
            AdaptiveButton(
              onPressed: () => _addMilestone(context),
              label: 'Add Milestone',
              buttonType: ButtonType.secondary,
              prefixIcon: Icons.add,
              isFullWidth: true,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildEmptyMilestones(BuildContext context) {
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
            Icons.timeline,
            size: 48,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          const AdaptiveSpacing.vertical(size: SpacingSize.small),
          Text(
            'No milestones added yet',
            style: AdaptiveTextStyles.bodyMedium(context),
          ),
        ],
      ),
    );
  }

  Widget _buildMilestoneCard(
    BuildContext context,
    ProjectMilestone milestone,
    int index,
  ) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Colors.white,
            child: Text('${index + 1}'),
          ),
          const AdaptiveSpacing.horizontal(size: SpacingSize.medium),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  milestone.title,
                  style: AdaptiveTextStyles.titleSmall(context),
                ),
                const AdaptiveSpacing.vertical(size: SpacingSize.extraSmall),
                Text(
                  milestone.description,
                  style: AdaptiveTextStyles.bodySmall(context),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => _editMilestone(context, index),
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => _removeMilestone(index),
          ),
        ],
      ),
    );
  }

  Widget _buildImagesForm(BuildContext context, Project project) {
    return AdaptiveCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Project Images',
            style: AdaptiveTextStyles.titleLarge(context),
          ),
          const AdaptiveSpacing.vertical(size: SpacingSize.large),

          Text(
            'Cover Image',
            style: AdaptiveTextStyles.titleMedium(context),
          ),
          const AdaptiveSpacing.vertical(size: SpacingSize.small),
          _buildCoverImagePicker(context, project),
          const AdaptiveSpacing.vertical(size: SpacingSize.large),

          Text(
            'Additional Images (Optional)',
            style: AdaptiveTextStyles.titleMedium(context),
          ),
          const AdaptiveSpacing.vertical(size: SpacingSize.small),
          Text(
            'Add up to 3 additional images',
            style: AdaptiveTextStyles.bodySmall(context),
          ),
          const AdaptiveSpacing.vertical(size: SpacingSize.medium),
          _buildAdditionalImagesPicker(context, project),
        ],
      ),
    );
  }

  Widget _buildCoverImagePicker(BuildContext context, Project project) {
    final hasNewImage = _coverImage != null;
    final hasExistingImage = project.coverImageUrl.isNotEmpty;

    return GestureDetector(
      onTap: () => _pickCoverImage(),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceVariant,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Theme.of(context).colorScheme.outline,
            width: 2,
          ),
        ),
        child: hasNewImage || hasExistingImage
            ? Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: hasNewImage
                        ? Image.file(
                            _coverImage!,
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.cover,
                          )
                        : Image.network(
                            project.coverImageUrl,
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: IconButton.filled(
                      onPressed: () => setState(() => _coverImage = null),
                      icon: const Icon(Icons.edit),
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.black54,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_photo_alternate,
                    size: 48,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  const AdaptiveSpacing.vertical(size: SpacingSize.small),
                  Text(
                    'Tap to upload cover image',
                    style: AdaptiveTextStyles.bodyMedium(context),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildAdditionalImagesPicker(BuildContext context, Project project) {
    return Wrap(
      spacing: AppSpacing.md,
      runSpacing: AppSpacing.md,
      children: [
        // Show existing images from project
        ...project.additionalImages.map((imageUrl) {
          return Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  imageUrl,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 4,
                right: 4,
                child: IconButton.filled(
                  onPressed: () {
                    // TODO: Handle removing existing image
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
        }).toList(),

        // Show new images
        ..._additionalImages.map((image) {
          return Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.file(
                  image,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 4,
                right: 4,
                child: IconButton.filled(
                  onPressed: () {
                    setState(() {
                      _additionalImages.remove(image);
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
        }).toList(),

        // Add button
        if (project.additionalImages.length + _additionalImages.length < 3)
          GestureDetector(
            onTap: () => _pickAdditionalImage(),
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceVariant,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Theme.of(context).colorScheme.outline,
                  width: 2,
                ),
              ),
              child: Icon(
                Icons.add,
                size: 32,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildSubmitButtons(BuildContext context, Project project) {
    return Row(
      children: [
        Expanded(
          child: AdaptiveButton(
            onPressed: () => _updateProject(project),
            label: 'Save Changes',
            buttonType: ButtonType.primary,
            isFullWidth: true,
            isLoading: _isSubmitting,
          ),
        ),
      ],
    );
  }

  // ========== ERROR STATES ==========

  Widget _buildProjectNotFound(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.search_off, size: 64),
          const AdaptiveSpacing.vertical(size: SpacingSize.medium),
          Text(
            'Project Not Found',
            style: AdaptiveTextStyles.titleLarge(context),
          ),
          const AdaptiveSpacing.vertical(size: SpacingSize.large),
          AdaptiveButton(
            onPressed: () => context.go('/'),
            label: 'Go to Home',
          ),
        ],
      ),
    );
  }

  Widget _buildCannotEdit(BuildContext context, ProjectStatus status) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.lock,
              size: 64,
              color: Theme.of(context).colorScheme.outline,
            ),
            const AdaptiveSpacing.vertical(size: SpacingSize.medium),
            Text(
              'Cannot Edit Project',
              style: AdaptiveTextStyles.titleLarge(context),
            ),
            const AdaptiveSpacing.vertical(size: SpacingSize.small),
            Text(
              'This project cannot be edited because it is ${status.displayName}. Only draft or submitted projects can be edited.',
              style: AdaptiveTextStyles.bodyMedium(context),
              textAlign: TextAlign.center,
            ),
            const AdaptiveSpacing.vertical(size: SpacingSize.large),
            AdaptiveButton(
              onPressed: () => context.go('/projects/${widget.projectId}'),
              label: 'View Project',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, Object error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64,
            color: Theme.of(context).colorScheme.error,
          ),
          const AdaptiveSpacing.vertical(size: SpacingSize.medium),
          Text(
            'Error Loading Project',
            style: AdaptiveTextStyles.titleLarge(context),
          ),
          const AdaptiveSpacing.vertical(size: SpacingSize.small),
          Text(
            error.toString(),
            style: AdaptiveTextStyles.bodyMedium(context),
            textAlign: TextAlign.center,
          ),
          const AdaptiveSpacing.vertical(size: SpacingSize.large),
          AdaptiveButton(
            onPressed: () {
              ref.invalidate(projectProvider(widget.projectId));
            },
            label: 'Retry',
          ),
        ],
      ),
    );
  }

  // ========== ACTIONS ==========

  Future<void> _pickCoverImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _coverImage = File(image.path);
      });
    }
  }

  Future<void> _pickAdditionalImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _additionalImages.add(File(image.path));
      });
    }
  }

  Future<void> _addMilestone(BuildContext context) async {
    final milestone = await showDialog<ProjectMilestone>(
      context: context,
      builder: (context) => const MilestoneFormDialog(),
    );

    if (milestone != null) {
      setState(() {
        _milestones.add(milestone);
      });
    }
  }

  Future<void> _editMilestone(BuildContext context, int index) async {
    final milestone = await showDialog<ProjectMilestone>(
      context: context,
      builder: (context) => MilestoneFormDialog(
        milestone: _milestones[index],
      ),
    );

    if (milestone != null) {
      setState(() {
        _milestones[index] = milestone;
      });
    }
  }

  void _removeMilestone(int index) {
    setState(() {
      _milestones.removeAt(index);
    });
  }

  Future<void> _updateProject(Project project) async {
    if (!_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all required fields')),
      );
      return;
    }

    if (_milestones.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('At least 1 milestone is required')),
      );
      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    try {
      final updatedProject = project.copyWith(
        name: _nameController.text,
        description: _descriptionController.text,
        category: _selectedCategory!,
        fundingGoal: double.parse(_fundingGoalController.text),
        duration: _selectedDuration,
        location: _locationController.text,
        milestones: _milestones,
        updatedAt: DateTime.now(),
      );

      final notifier = ref.read(projectUpdateNotifierProvider.notifier);
      final result = await notifier.updateProject(
        project: updatedProject,
        coverImage: _coverImage,
        additionalImages: _additionalImages.isNotEmpty ? _additionalImages : null,
      );

      if (mounted) {
        if (result.isSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Project updated successfully!')),
          );
          context.go('/projects/${project.id}');
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(result.error ?? 'Failed to update project')),
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
