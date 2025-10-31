import 'package:flutter/material.dart';
import '../../../../../shared/widgets/responsive/responsive_layout.dart';
import '../../../../../shared/widgets/adaptive/adaptive_button.dart';
import '../../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../../shared/widgets/adaptive/adaptive_text_field.dart';
import '../../../../../shared/constants/spacing.dart';
import '../../../domain/entities/kyc.dart';

/// Step-by-step KYC verification screen
class KYCStepScreen extends StatefulWidget {
  final KYCVerificationStep currentStep;
  final int stepNumber;
  final int totalSteps;
  final Function(Map<String, dynamic>) onStepCompleted;
  final VoidCallback? onPrevious;
  final VoidCallback? onSkip;

  const KYCStepScreen({
    super.key,
    required this.currentStep,
    required this.stepNumber,
    required this.totalSteps,
    required this.onStepCompleted,
    this.onPrevious,
    this.onSkip,
  });

  @override
  State<KYCStepScreen> createState() => _KYCStepScreenState();
}

class _KYCStepScreenState extends State<KYCStepScreen> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _stepData = {};
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: _buildMobileLayout(),
      tablet: _buildTabletLayout(),
      desktop: _buildDesktopLayout(),
    );
  }

  Widget _buildMobileLayout() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Step ${widget.stepNumber} of ${widget.totalSteps}'),
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        leading: widget.onPrevious != null
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: widget.onPrevious,
              )
            : null,
      ),
      body: Column(
        children: [
          _buildProgressIndicator(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(Spacing.md),
              child: _buildStepContent(),
            ),
          ),
          _buildActionButtons(),
        ],
      ),
    );
  }

  Widget _buildTabletLayout() {
    return Scaffold(
      appBar: AppBar(
        title: Text('KYC Verification - Step ${widget.stepNumber}'),
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        leading: widget.onPrevious != null
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: widget.onPrevious,
              )
            : null,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            children: [
              _buildProgressIndicator(),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(Spacing.lg),
                  child: _buildStepContent(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(Spacing.lg),
                child: _buildActionButtons(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(Spacing.xl),
                child: Row(
                  children: [
                    if (widget.onPrevious != null)
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: widget.onPrevious,
                      ),
                    Expanded(
                      child: Text(
                        'KYC Verification - Step ${widget.stepNumber} of ${widget.totalSteps}',
                        style: AdaptiveTextStyles.headlineLarge(context),
                      ),
                    ),
                  ],
                ),
              ),
              _buildProgressIndicator(),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(Spacing.xl),
                  child: _buildStepContent(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(Spacing.xl),
                child: _buildActionButtons(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Build progress indicator
  Widget _buildProgressIndicator() {
    final progress = widget.stepNumber / widget.totalSteps;

    return Container(
      padding: const EdgeInsets.all(Spacing.md),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Step ${widget.stepNumber} of ${widget.totalSteps}',
                style: AdaptiveTextStyles.bodyMedium(context),
              ),
              Text(
                '${(progress * 100).toInt()}%',
                style: AdaptiveTextStyles.bodyMedium(context),
              ),
            ],
          ),
          AdaptiveSpacing.verticalSmall(),
          LinearProgressIndicator(
            value: progress,
            backgroundColor:
                Theme.of(context).colorScheme.outline.withOpacity(0.2),
          ),
        ],
      ),
    );
  }

  /// Build step-specific content
  Widget _buildStepContent() {
    switch (widget.currentStep.type) {
      case KYCStepType.personalInformation:
        return _buildPersonalInfoStep();
      case KYCStepType.documentUpload:
        return _buildPersonalInfoStep();
      case KYCStepType.identityVerification:
        return _buildIdentityVerificationStep();
      case KYCStepType.addressVerification:
        return _buildAddressVerificationStep();
      case KYCStepType.documentVerification:
        return _buildIdentityVerificationStep();
      case KYCStepType.biometricVerification:
        return _buildIdentityVerificationStep();
      case KYCStepType.financialVerification:
        return _buildFinancialVerificationStep();
      case KYCStepType.businessVerification:
        return _buildBusinessVerificationStep();
      case KYCStepType.riskAssessment:
        return _buildRiskAssessmentStep();
      case KYCStepType.manualReview:
        return _buildManualReviewStep();
    }
  }

  /// Build personal information step
  Widget _buildPersonalInfoStep() {
    return Form(
      key: _formKey,
      child: AdaptiveCard(
        child: Padding(
          padding: const EdgeInsets.all(Spacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.person_outline,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: Spacing.sm),
                  Text(
                    'Personal Information',
                    style: AdaptiveTextStyles.headlineMedium(context),
                  ),
                ],
              ),
              AdaptiveSpacing.verticalSmall(),
              Text(
                'Please provide your personal details exactly as they appear on your official documents.',
                style: AdaptiveTextStyles.bodyLarge(context).copyWith(
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
                ),
              ),
              AdaptiveSpacing.verticalLarge(),
              Row(
                children: [
                  Expanded(
                    child: AdaptiveTextField(
                      label: 'First Name',
                      placeholder: 'Enter your first name',
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'First name is required';
                        }
                        return null;
                      },
                      onChanged: (value) => _stepData['firstName'] = value,
                    ),
                  ),
                  const SizedBox(width: Spacing.md),
                  Expanded(
                    child: AdaptiveTextField(
                      label: 'Last Name',
                      placeholder: 'Enter your last name',
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Last name is required';
                        }
                        return null;
                      },
                      onChanged: (value) => _stepData['lastName'] = value,
                    ),
                  ),
                ],
              ),
              AdaptiveSpacing.verticalMedium(),
              AdaptiveTextField(
                label: 'Middle Name (Optional)',
                placeholder: 'Enter your middle name',
                onChanged: (value) => _stepData['middleName'] = value,
              ),
              AdaptiveSpacing.verticalMedium(),
              AdaptiveTextField(
                label: 'Date of Birth',
                placeholder: 'DD/MM/YYYY',
                keyboardType: TextInputType.datetime,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Date of birth is required';
                  }
                  // Add date validation logic
                  return null;
                },
                onChanged: (value) => _stepData['dateOfBirth'] = value,
              ),
              AdaptiveSpacing.verticalMedium(),
              Row(
                children: [
                  Expanded(
                    child: _buildDropdownField(
                      label: 'Gender',
                      items: ['Male', 'Female', 'Other', 'Prefer not to say'],
                      onChanged: (value) => _stepData['gender'] = value,
                    ),
                  ),
                  const SizedBox(width: Spacing.md),
                  Expanded(
                    child: _buildDropdownField(
                      label: 'Marital Status',
                      items: [
                        'Single',
                        'Married',
                        'Divorced',
                        'Widowed',
                        'Separated'
                      ],
                      onChanged: (value) => _stepData['maritalStatus'] = value,
                    ),
                  ),
                ],
              ),
              AdaptiveSpacing.verticalMedium(),
              Row(
                children: [
                  Expanded(
                    child: AdaptiveTextField(
                      label: 'Nationality',
                      placeholder: 'Your nationality',
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Nationality is required';
                        }
                        return null;
                      },
                      onChanged: (value) => _stepData['nationality'] = value,
                    ),
                  ),
                  const SizedBox(width: Spacing.md),
                  Expanded(
                    child: AdaptiveTextField(
                      label: 'Country of Residence',
                      placeholder: 'Country where you live',
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Country of residence is required';
                        }
                        return null;
                      },
                      onChanged: (value) =>
                          _stepData['countryOfResidence'] = value,
                    ),
                  ),
                ],
              ),
              AdaptiveSpacing.verticalMedium(),
              AdaptiveTextField(
                label: 'Phone Number',
                placeholder: '+1 (555) 123-4567',
                keyboardType: TextInputType.phone,
                onChanged: (value) => _stepData['phoneNumber'] = value,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Build identity verification step
  Widget _buildIdentityVerificationStep() {
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.badge_outlined,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: Spacing.sm),
                Text(
                  'Identity Verification',
                  style: AdaptiveTextStyles.headlineMedium(context),
                ),
              ],
            ),
            AdaptiveSpacing.verticalSmall(),
            Text(
              'Upload a clear photo of your government-issued ID document.',
              style: AdaptiveTextStyles.bodyLarge(context).copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
              ),
            ),
            AdaptiveSpacing.verticalLarge(),
            _buildDocumentTypeSelector(),
            AdaptiveSpacing.verticalLarge(),
            _buildDocumentUploadArea('front', 'Front of ID'),
            AdaptiveSpacing.verticalMedium(),
            _buildDocumentUploadArea('back', 'Back of ID'),
            AdaptiveSpacing.verticalMedium(),
            _buildDocumentUploadArea('selfie', 'Selfie with ID'),
            AdaptiveSpacing.verticalLarge(),
            _buildDocumentRequirements(),
          ],
        ),
      ),
    );
  }

  /// Build address verification step
  Widget _buildAddressVerificationStep() {
    return Form(
      key: _formKey,
      child: AdaptiveCard(
        child: Padding(
          padding: const EdgeInsets.all(Spacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.home_outlined,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: Spacing.sm),
                  Text(
                    'Address Verification',
                    style: AdaptiveTextStyles.headlineMedium(context),
                  ),
                ],
              ),
              AdaptiveSpacing.verticalSmall(),
              Text(
                'Provide your current residential address and upload a proof of address document.',
                style: AdaptiveTextStyles.bodyLarge(context).copyWith(
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
                ),
              ),
              AdaptiveSpacing.verticalLarge(),
              AdaptiveTextField(
                label: 'Street Address',
                placeholder: 'Enter your street address',
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Street address is required';
                  }
                  return null;
                },
                onChanged: (value) => _stepData['street1'] = value,
              ),
              AdaptiveSpacing.verticalMedium(),
              AdaptiveTextField(
                label: 'Apartment/Unit (Optional)',
                placeholder: 'Apt, suite, unit, etc.',
                onChanged: (value) => _stepData['street2'] = value,
              ),
              AdaptiveSpacing.verticalMedium(),
              Row(
                children: [
                  Expanded(
                    child: AdaptiveTextField(
                      label: 'City',
                      placeholder: 'Enter your city',
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'City is required';
                        }
                        return null;
                      },
                      onChanged: (value) => _stepData['city'] = value,
                    ),
                  ),
                  const SizedBox(width: Spacing.md),
                  Expanded(
                    child: AdaptiveTextField(
                      label: 'State/Province',
                      placeholder: 'Enter your state',
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'State/Province is required';
                        }
                        return null;
                      },
                      onChanged: (value) => _stepData['state'] = value,
                    ),
                  ),
                ],
              ),
              AdaptiveSpacing.verticalMedium(),
              Row(
                children: [
                  Expanded(
                    child: AdaptiveTextField(
                      label: 'Postal Code',
                      placeholder: 'Enter postal code',
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Postal code is required';
                        }
                        return null;
                      },
                      onChanged: (value) => _stepData['postalCode'] = value,
                    ),
                  ),
                  const SizedBox(width: Spacing.md),
                  Expanded(
                    child: AdaptiveTextField(
                      label: 'Country',
                      placeholder: 'Enter your country',
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Country is required';
                        }
                        return null;
                      },
                      onChanged: (value) => _stepData['country'] = value,
                    ),
                  ),
                ],
              ),
              AdaptiveSpacing.verticalLarge(),
              Text(
                'Proof of Address',
                style: AdaptiveTextStyles.titleMedium(context),
              ),
              AdaptiveSpacing.verticalSmall(),
              Text(
                'Upload a document that shows your current address (utility bill, bank statement, etc.)',
                style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
                ),
              ),
              AdaptiveSpacing.verticalMedium(),
              _buildProofOfAddressSelector(),
              AdaptiveSpacing.verticalMedium(),
              _buildDocumentUploadArea(
                  'proof_of_address', 'Upload Proof of Address'),
            ],
          ),
        ),
      ),
    );
  }

  /// Build financial verification step
  Widget _buildFinancialVerificationStep() {
    return Form(
      key: _formKey,
      child: AdaptiveCard(
        child: Padding(
          padding: const EdgeInsets.all(Spacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.account_balance_outlined,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: Spacing.sm),
                  Text(
                    'Financial Information',
                    style: AdaptiveTextStyles.headlineMedium(context),
                  ),
                ],
              ),
              AdaptiveSpacing.verticalSmall(),
              Text(
                'Provide information about your financial situation and investment experience.',
                style: AdaptiveTextStyles.bodyLarge(context).copyWith(
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
                ),
              ),
              AdaptiveSpacing.verticalLarge(),
              Row(
                children: [
                  Expanded(
                    child: _buildDropdownField(
                      label: 'Annual Income',
                      items: [
                        'Under \$25,000',
                        '\$25,000 - \$50,000',
                        '\$50,000 - \$100,000',
                        '\$100,000 - \$250,000',
                        '\$250,000 - \$500,000',
                        'Over \$500,000'
                      ],
                      onChanged: (value) => _stepData['annualIncome'] = value,
                    ),
                  ),
                  const SizedBox(width: Spacing.md),
                  Expanded(
                    child: _buildDropdownField(
                      label: 'Source of Wealth',
                      items: [
                        'Employment',
                        'Business Ownership',
                        'Investments',
                        'Inheritance',
                        'Real Estate',
                        'Other'
                      ],
                      onChanged: (value) => _stepData['sourceOfWealth'] = value,
                    ),
                  ),
                ],
              ),
              AdaptiveSpacing.verticalMedium(),
              Row(
                children: [
                  Expanded(
                    child: _buildDropdownField(
                      label: 'Investment Experience',
                      items: [
                        'None',
                        'Beginner (< 1 year)',
                        'Intermediate (1-5 years)',
                        'Advanced (5-10 years)',
                        'Professional (10+ years)'
                      ],
                      onChanged: (value) =>
                          _stepData['investmentExperience'] = value,
                    ),
                  ),
                  const SizedBox(width: Spacing.md),
                  Expanded(
                    child: _buildDropdownField(
                      label: 'Risk Tolerance',
                      items: ['Conservative', 'Moderate', 'Aggressive'],
                      onChanged: (value) => _stepData['riskTolerance'] = value,
                    ),
                  ),
                ],
              ),
              AdaptiveSpacing.verticalMedium(),
              AdaptiveTextField(
                label: 'Employer/Occupation',
                placeholder: 'Enter your occupation or employer',
                onChanged: (value) => _stepData['occupation'] = value,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Build business verification step
  Widget _buildBusinessVerificationStep() {
    return Form(
      key: _formKey,
      child: AdaptiveCard(
        child: Padding(
          padding: const EdgeInsets.all(Spacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.business_outlined,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: Spacing.sm),
                  Text(
                    'Business Information',
                    style: AdaptiveTextStyles.headlineMedium(context),
                  ),
                ],
              ),
              AdaptiveSpacing.verticalSmall(),
              Text(
                'Provide information about your business or organization.',
                style: AdaptiveTextStyles.bodyLarge(context).copyWith(
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
                ),
              ),
              AdaptiveSpacing.verticalLarge(),
              AdaptiveTextField(
                label: 'Legal Business Name',
                placeholder: 'Enter the legal name of your business',
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Business name is required';
                  }
                  return null;
                },
                onChanged: (value) => _stepData['legalName'] = value,
              ),
              AdaptiveSpacing.verticalMedium(),
              Row(
                children: [
                  Expanded(
                    child: AdaptiveTextField(
                      label: 'Registration Number',
                      placeholder: 'Business registration number',
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Registration number is required';
                        }
                        return null;
                      },
                      onChanged: (value) =>
                          _stepData['registrationNumber'] = value,
                    ),
                  ),
                  const SizedBox(width: Spacing.md),
                  Expanded(
                    child: AdaptiveTextField(
                      label: 'Tax ID',
                      placeholder: 'Tax identification number',
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Tax ID is required';
                        }
                        return null;
                      },
                      onChanged: (value) => _stepData['taxId'] = value,
                    ),
                  ),
                ],
              ),
              AdaptiveSpacing.verticalMedium(),
              Row(
                children: [
                  Expanded(
                    child: _buildDropdownField(
                      label: 'Business Type',
                      items: [
                        'Corporation',
                        'LLC',
                        'Partnership',
                        'Sole Proprietorship',
                        'Nonprofit',
                        'Government'
                      ],
                      onChanged: (value) => _stepData['businessType'] = value,
                    ),
                  ),
                  const SizedBox(width: Spacing.md),
                  Expanded(
                    child: AdaptiveTextField(
                      label: 'Incorporation Date',
                      placeholder: 'DD/MM/YYYY',
                      keyboardType: TextInputType.datetime,
                      onChanged: (value) =>
                          _stepData['incorporationDate'] = value,
                    ),
                  ),
                ],
              ),
              AdaptiveSpacing.verticalMedium(),
              AdaptiveTextField(
                label: 'Business Website',
                placeholder: 'https://www.example.com',
                onChanged: (value) => _stepData['website'] = value,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Build risk assessment step
  Widget _buildRiskAssessmentStep() {
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          children: [
            Icon(
              Icons.analytics_outlined,
              size: 64,
              color: Theme.of(context).colorScheme.primary,
            ),
            AdaptiveSpacing.verticalMedium(),
            Text(
              'Risk Assessment',
              style: AdaptiveTextStyles.headlineMedium(context),
            ),
            AdaptiveSpacing.verticalSmall(),
            Text(
              'We\'re performing an automated risk assessment based on the information you\'ve provided.',
              style: AdaptiveTextStyles.bodyLarge(context).copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
              ),
              textAlign: TextAlign.center,
            ),
            AdaptiveSpacing.verticalLarge(),
            if (_isLoading) ...[
              const CircularProgressIndicator(),
              AdaptiveSpacing.verticalMedium(),
              Text(
                'Analyzing your information...',
                style: AdaptiveTextStyles.bodyMedium(context),
              ),
            ] else ...[
              Icon(
                Icons.check_circle_outlined,
                size: 48,
                color: Theme.of(context).colorScheme.tertiary,
              ),
              AdaptiveSpacing.verticalMedium(),
              Text(
                'Assessment Complete',
                style: AdaptiveTextStyles.titleLarge(context),
              ),
            ],
          ],
        ),
      ),
    );
  }

  /// Build manual review step
  Widget _buildManualReviewStep() {
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          children: [
            Icon(
              Icons.person_search_outlined,
              size: 64,
              color: Theme.of(context).colorScheme.secondary,
            ),
            AdaptiveSpacing.verticalMedium(),
            Text(
              'Manual Review',
              style: AdaptiveTextStyles.headlineMedium(context),
            ),
            AdaptiveSpacing.verticalSmall(),
            Text(
              'Your application is now being reviewed by our compliance team. You\'ll receive an email notification once the review is complete.',
              style: AdaptiveTextStyles.bodyLarge(context).copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
              ),
              textAlign: TextAlign.center,
            ),
            AdaptiveSpacing.verticalLarge(),
            Container(
              padding: const EdgeInsets.all(Spacing.md),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Text(
                    'Review Timeline',
                    style: AdaptiveTextStyles.titleSmall(context),
                  ),
                  AdaptiveSpacing.verticalSmall(),
                  Text(
                    '• Basic KYC: 1-2 business days\n'
                    '• Enhanced KYC: 2-3 business days\n'
                    '• Institutional KYC: 3-5 business days',
                    style: AdaptiveTextStyles.bodySmall(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Build dropdown field
  Widget _buildDropdownField({
    required String label,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      items: items.map((item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }

  /// Build document type selector
  Widget _buildDocumentTypeSelector() {
    return _buildDropdownField(
      label: 'Document Type',
      items: [
        'Passport',
        'National ID',
        'Driver\'s License',
        'Residence Permit'
      ],
      onChanged: (value) => _stepData['documentType'] = value,
    );
  }

  /// Build proof of address selector
  Widget _buildProofOfAddressSelector() {
    return _buildDropdownField(
      label: 'Document Type',
      items: [
        'Utility Bill',
        'Bank Statement',
        'Rental Agreement',
        'Tax Document',
        'Insurance Document'
      ],
      onChanged: (value) => _stepData['proofType'] = value,
    );
  }

  /// Build document upload area
  Widget _buildDocumentUploadArea(String key, String title) {
    return Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.outline,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () => _uploadDocument(key),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.cloud_upload_outlined,
              size: 32,
              color: Theme.of(context).colorScheme.primary,
            ),
            AdaptiveSpacing.verticalSmall(),
            Text(
              title,
              style: AdaptiveTextStyles.titleSmall(context),
            ),
            Text(
              'Tap to upload',
              style: AdaptiveTextStyles.bodySmall(context).copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Build document requirements
  Widget _buildDocumentRequirements() {
    return Container(
      padding: const EdgeInsets.all(Spacing.md),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Document Requirements',
            style: AdaptiveTextStyles.titleSmall(context),
          ),
          AdaptiveSpacing.verticalSmall(),
          ...[
            'Clear, high-quality images',
            'All text must be readable',
            'No glare or shadows',
            'Full document visible in frame',
            'Maximum file size: 10MB',
          ].map((req) => Padding(
                padding: const EdgeInsets.only(bottom: Spacing.xs),
                child: Row(
                  children: [
                    Icon(
                      Icons.check,
                      size: 16,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(width: Spacing.xs),
                    Expanded(
                      child: Text(
                        req,
                        style: AdaptiveTextStyles.bodySmall(context),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  /// Build action buttons
  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.all(Spacing.md),
      child: Row(
        children: [
          if (widget.onSkip != null)
            Expanded(
              child: AdaptiveButton(
                text: 'Skip',
                onPressed: widget.onSkip,
                type: ButtonType.secondary,
              ),
            ),
          if (widget.onSkip != null) const SizedBox(width: Spacing.md),
          Expanded(
            flex: 2,
            child: AdaptiveButton(
              text: _isLoading ? 'Processing...' : 'Continue',
              onPressed: _isLoading ? null : _handleContinue,
              type: ButtonType.primary,
            ),
          ),
        ],
      ),
    );
  }

  /// Handle continue button press
  void _handleContinue() {
    if (widget.currentStep.type == KYCStepType.riskAssessment) {
      _performRiskAssessment();
      return;
    }

    if (_formKey.currentState?.validate() ?? true) {
      widget.onStepCompleted(_stepData);
    }
  }

  /// Upload document
  void _uploadDocument(String key) {
    // This would implement file picker and upload logic
    // For now, just simulate upload
    setState(() {
      _stepData[key] = 'uploaded_document_url';
    });
  }

  /// Perform risk assessment
  void _performRiskAssessment() {
    setState(() {
      _isLoading = true;
    });

    // Simulate risk assessment
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
      });
      widget.onStepCompleted({'riskAssessment': 'completed'});
    });
  }
}
