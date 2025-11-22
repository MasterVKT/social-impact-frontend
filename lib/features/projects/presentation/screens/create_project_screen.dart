import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../shared/widgets/adaptive/adaptive_button.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_field.dart';
import '../../../../shared/widgets/adaptive/adaptive_dropdown.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/widgets/responsive/responsive_layout.dart';
import '../../../../shared/constants/spacing.dart';
import '../../../../core/utils/platform_detector.dart';
import '../../domain/entities/project.dart';
import '../providers/projects_providers.dart';
import '../widgets/milestone_form_widget.dart';

/// Create project screen with wizard-style form
class CreateProjectScreen extends ConsumerStatefulWidget {
  const CreateProjectScreen({super.key});

  @override
  ConsumerState<CreateProjectScreen> createState() =>
      _CreateProjectScreenState();
}

class _CreateProjectScreenState extends ConsumerState<CreateProjectScreen> {
  final _formKey = GlobalKey<FormState>();
  final _pageController = PageController();
  int _currentStep = 0;
  static const int _totalSteps = 4;

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

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _locationController.dispose();
    _fundingGoalController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Project'),
        actions: [
          if (_currentStep > 0)
            TextButton(
              onPressed: () => _saveDraft(),
              child: const Text('Save Draft'),
            ),
        ],
      ),
      body: ResponsiveLayout(
        mobile: _buildMobileWizard(context),
        tablet: _buildFormLayout(context),
        desktop: _buildFormLayout(context),
      ),
    );
  }

  // ========== MOBILE WIZARD ==========

  Widget _buildMobileWizard(BuildContext context) {
    return Column(
      children: [
        // Progress indicator
        _buildProgressIndicator(context),

        // Form content
        Expanded(
          child: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _buildBasicInfoStep(context),
              _buildDetailsStep(context),
              _buildMilestonesStep(context),
              _buildImagesStep(context),
            ],
          ),
        ),

        // Navigation buttons
        _buildNavigationButtons(context),
      ],
    );
  }

  Widget _buildProgressIndicator(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(_totalSteps, (index) {
              final isCompleted = index < _currentStep;
              final isCurrent = index == _currentStep;

              return Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: isCompleted || isCurrent
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.surfaceVariant,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: isCompleted
                          ? const Icon(Icons.check, color: Colors.white, size: 16)
                          : Text(
                              '${index + 1}',
                              style: TextStyle(
                                color: isCurrent
                                    ? Colors.white
                                    : Theme.of(context).colorScheme.onSurfaceVariant,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),
                  if (index < _totalSteps - 1)
                    Container(
                      width: 40,
                      height: 2,
                      color: index < _currentStep
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.surfaceVariant,
                    ),
                ],
              );
            }),
          ),
          const AdaptiveSpacing.vertical(size: SpacingSize.small),
          Text(
            _getStepTitle(_currentStep),
            style: AdaptiveTextStyles.titleSmall(context),
          ),
        ],
      ),
    );
  }

  String _getStepTitle(int step) {
    switch (step) {
      case 0:
        return 'Basic Information';
      case 1:
        return 'Project Details';
      case 2:
        return 'Milestones';
      case 3:
        return 'Images';
      default:
        return '';
    }
  }

  // ========== FORM LAYOUT (TABLET/DESKTOP) ==========

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
                _buildBasicInfoForm(context),
                const AdaptiveSpacing.vertical(size: SpacingSize.large),
                _buildDetailsForm(context),
                const AdaptiveSpacing.vertical(size: SpacingSize.large),
                _buildMilestonesForm(context),
                const AdaptiveSpacing.vertical(size: SpacingSize.large),
                _buildImagesForm(context),
                const AdaptiveSpacing.vertical(size: SpacingSize.extraLarge),
                _buildSubmitButtons(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ========== STEP 1: BASIC INFO ==========

  Widget _buildBasicInfoStep(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: _buildBasicInfoForm(context),
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

          // Project name
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

          // Category
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

          // Location
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

  // ========== STEP 2: DETAILS ==========

  Widget _buildDetailsStep(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: _buildDetailsForm(context),
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

          // Description
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

          // Funding goal
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

          // Duration
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

  // ========== STEP 3: MILESTONES ==========

  Widget _buildMilestonesStep(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: _buildMilestonesForm(context),
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

          // Milestones list
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

          // Add milestone button
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
          style: BorderStyle.solid,
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

  // ========== STEP 4: IMAGES ==========

  Widget _buildImagesStep(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: _buildImagesForm(context),
    );
  }

  Widget _buildImagesForm(BuildContext context) {
    return AdaptiveCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Project Images',
            style: AdaptiveTextStyles.titleLarge(context),
          ),
          const AdaptiveSpacing.vertical(size: SpacingSize.large),

          // Cover image
          Text(
            'Cover Image',
            style: AdaptiveTextStyles.titleMedium(context),
          ),
          const AdaptiveSpacing.vertical(size: SpacingSize.small),
          _buildCoverImagePicker(context),
          const AdaptiveSpacing.vertical(size: SpacingSize.large),

          // Additional images
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
          _buildAdditionalImagesPicker(context),
        ],
      ),
    );
  }

  Widget _buildCoverImagePicker(BuildContext context) {
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
            style: BorderStyle.solid,
          ),
        ),
        child: _coverImage == null
            ? Column(
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
              )
            : Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.file(
                      _coverImage!,
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
                      icon: const Icon(Icons.close),
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.black54,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildAdditionalImagesPicker(BuildContext context) {
    return Wrap(
      spacing: AppSpacing.md,
      runSpacing: AppSpacing.md,
      children: [
        ..._additionalImages.asMap().entries.map((entry) {
          final index = entry.key;
          final image = entry.value;

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
                      _additionalImages.removeAt(index);
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

        if (_additionalImages.length < 3)
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
                  style: BorderStyle.solid,
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

  // ========== NAVIGATION ==========

  Widget _buildNavigationButtons(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          if (_currentStep > 0)
            Expanded(
              child: AdaptiveButton(
                onPressed: () => _previousStep(),
                label: 'Back',
                buttonType: ButtonType.secondary,
                isFullWidth: true,
              ),
            ),
          if (_currentStep > 0) const AdaptiveSpacing.horizontal(size: SpacingSize.medium),
          Expanded(
            child: AdaptiveButton(
              onPressed: _currentStep < _totalSteps - 1
                  ? () => _nextStep()
                  : () => _submitProject(),
              label: _currentStep < _totalSteps - 1 ? 'Next' : 'Create Project',
              buttonType: ButtonType.primary,
              isFullWidth: true,
              isLoading: _isSubmitting,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubmitButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AdaptiveButton(
            onPressed: () => _saveDraft(),
            label: 'Save as Draft',
            buttonType: ButtonType.secondary,
            isFullWidth: true,
          ),
        ),
        const AdaptiveSpacing.horizontal(size: SpacingSize.medium),
        Expanded(
          child: AdaptiveButton(
            onPressed: () => _submitProject(),
            label: 'Create Project',
            buttonType: ButtonType.primary,
            isFullWidth: true,
            isLoading: _isSubmitting,
          ),
        ),
      ],
    );
  }

  void _previousStep() {
    if (_currentStep > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {
        _currentStep--;
      });
    }
  }

  void _nextStep() {
    if (_validateCurrentStep()) {
      if (_currentStep < _totalSteps - 1) {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
        setState(() {
          _currentStep++;
        });
      }
    }
  }

  bool _validateCurrentStep() {
    switch (_currentStep) {
      case 0:
        return _nameController.text.isNotEmpty &&
            _selectedCategory != null &&
            _locationController.text.isNotEmpty;
      case 1:
        return _descriptionController.text.length >= 50 &&
            _fundingGoalController.text.isNotEmpty;
      case 2:
        return _milestones.isNotEmpty && _milestones.length <= 3;
      case 3:
        return true; // Images are optional
      default:
        return false;
    }
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
    if (_additionalImages.length >= 3) return;

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

  Future<void> _saveDraft() async {
    if (!_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all required fields')),
      );
      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    try {
      // TODO: Get current user ID from auth
      final creatorId = 'current_user_id';

      final notifier = ref.read(projectCreationNotifierProvider.notifier);
      final result = await notifier.createProject(
        name: _nameController.text,
        description: _descriptionController.text,
        category: _selectedCategory!,
        fundingGoal: double.parse(_fundingGoalController.text),
        currency: 'EUR',
        duration: _selectedDuration,
        location: _locationController.text,
        creatorId: creatorId,
        milestones: _milestones,
        coverImage: _coverImage,
        additionalImages: _additionalImages,
      );

      if (mounted) {
        if (result.isSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Project draft saved successfully!')),
          );
          context.go('/projects/${result.data!.id}');
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(result.error ?? 'Failed to save draft')),
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

  Future<void> _submitProject() async {
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
      // TODO: Get current user ID from auth
      final creatorId = 'current_user_id';

      final notifier = ref.read(projectCreationNotifierProvider.notifier);
      final result = await notifier.createProject(
        name: _nameController.text,
        description: _descriptionController.text,
        category: _selectedCategory!,
        fundingGoal: double.parse(_fundingGoalController.text),
        currency: 'EUR',
        duration: _selectedDuration,
        location: _locationController.text,
        creatorId: creatorId,
        milestones: _milestones,
        coverImage: _coverImage,
        additionalImages: _additionalImages,
      );

      if (mounted) {
        if (result.isSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Project created successfully!')),
          );
          context.go('/projects/${result.data!.id}');
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(result.error ?? 'Failed to create project')),
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
