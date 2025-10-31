import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/constants/spacing.dart';
import '../../../auth/domain/entities/kyc.dart';

/// Widget for uploading and validating KYC documents
class DocumentUploadWidget extends StatefulWidget {
  final DocumentType documentType;
  final String title;
  final String description;
  final bool isRequired;
  final Function(String fileName, Uint8List fileBytes) onDocumentUploaded;
  final VoidCallback? onDocumentRemoved;
  final String? existingDocumentUrl;
  final bool isUploading;

  const DocumentUploadWidget({
    super.key,
    required this.documentType,
    required this.title,
    required this.description,
    this.isRequired = false,
    required this.onDocumentUploaded,
    this.onDocumentRemoved,
    this.existingDocumentUrl,
    this.isUploading = false,
  });

  @override
  State<DocumentUploadWidget> createState() => _DocumentUploadWidgetState();
}

class _DocumentUploadWidgetState extends State<DocumentUploadWidget> {
  bool _isHovering = false;
  String? _validationError;

  @override
  Widget build(BuildContext context) {
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            AdaptiveSpacing.verticalMedium(),
            if (widget.existingDocumentUrl != null)
              _buildExistingDocument()
            else
              _buildUploadArea(),
            if (_validationError != null) ...[
              AdaptiveSpacing.verticalSmall(),
              _buildValidationError(),
            ],
            AdaptiveSpacing.verticalMedium(),
            _buildRequirements(),
          ],
        ),
      ),
    );
  }

  /// Build widget header
  Widget _buildHeader() {
    return Row(
      children: [
        Icon(
          _getDocumentIcon(),
          color: Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(width: Spacing.sm),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    widget.title,
                    style: AdaptiveTextStyles.titleMedium(context),
                  ),
                  if (widget.isRequired) ...[
                    const SizedBox(width: Spacing.xs),
                    Text(
                      '*',
                      style: AdaptiveTextStyles.titleMedium(context).copyWith(
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                  ],
                ],
              ),
              Text(
                widget.description,
                style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Build upload area
  Widget _buildUploadArea() {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: GestureDetector(
        onTap: widget.isUploading ? null : _selectDocument,
        child: Container(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
            border: Border.all(
              color: _isHovering
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.outline,
              width: _isHovering ? 2 : 1,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(12),
            color: _isHovering
                ? Theme.of(context)
                    .colorScheme
                    .primaryContainer
                    .withOpacity(0.1)
                : Theme.of(context).colorScheme.surface,
          ),
          child: widget.isUploading
              ? _buildUploadingState()
              : _buildUploadPrompt(),
        ),
      ),
    );
  }

  /// Build upload prompt
  Widget _buildUploadPrompt() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.cloud_upload_outlined,
          size: 40,
          color: _isHovering
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
        ),
        AdaptiveSpacing.verticalSmall(),
        Text(
          'Upload Document',
          style: AdaptiveTextStyles.titleSmall(context).copyWith(
            color: _isHovering
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.onSurface,
          ),
        ),
        Text(
          'Click to browse or drag and drop',
          style: AdaptiveTextStyles.bodySmall(context).copyWith(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
          ),
        ),
        AdaptiveSpacing.verticalSmall(),
        Text(
          'Supported formats: JPG, PNG, PDF (max 10MB)',
          style: AdaptiveTextStyles.bodySmall(context).copyWith(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
          ),
        ),
      ],
    );
  }

  /// Build uploading state
  Widget _buildUploadingState() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircularProgressIndicator(),
        AdaptiveSpacing.verticalMedium(),
        Text(
          'Uploading document...',
          style: AdaptiveTextStyles.bodyMedium(context),
        ),
      ],
    );
  }

  /// Build existing document display
  Widget _buildExistingDocument() {
    return Container(
      padding: const EdgeInsets.all(Spacing.md),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiaryContainer,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.tertiary,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.description,
            color: Theme.of(context).colorScheme.onTertiaryContainer,
          ),
          const SizedBox(width: Spacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Document Uploaded',
                  style: AdaptiveTextStyles.titleSmall(context).copyWith(
                    color: Theme.of(context).colorScheme.onTertiaryContainer,
                  ),
                ),
                Text(
                  _getFileName(widget.existingDocumentUrl!),
                  style: AdaptiveTextStyles.bodySmall(context).copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onTertiaryContainer
                        .withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.visibility_outlined),
                onPressed: _previewDocument,
                color: Theme.of(context).colorScheme.onTertiaryContainer,
                tooltip: 'Preview document',
              ),
              IconButton(
                icon: const Icon(Icons.delete_outlined),
                onPressed: widget.onDocumentRemoved,
                color: Theme.of(context).colorScheme.error,
                tooltip: 'Remove document',
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Build validation error
  Widget _buildValidationError() {
    return Container(
      padding: const EdgeInsets.all(Spacing.sm),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.errorContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(
            Icons.error_outline,
            size: 16,
            color: Theme.of(context).colorScheme.onErrorContainer,
          ),
          const SizedBox(width: Spacing.xs),
          Expanded(
            child: Text(
              _validationError!,
              style: AdaptiveTextStyles.bodySmall(context).copyWith(
                color: Theme.of(context).colorScheme.onErrorContainer,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Build document requirements
  Widget _buildRequirements() {
    final requirements = _getDocumentRequirements();

    return Container(
      padding: const EdgeInsets.all(Spacing.sm),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Requirements',
            style: AdaptiveTextStyles.labelMedium(context).copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: Spacing.xs),
          ...requirements.map((req) => Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '• ',
                      style: AdaptiveTextStyles.bodySmall(context).copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.6),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        req,
                        style: AdaptiveTextStyles.bodySmall(context).copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.8),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  /// Select document for upload
  Future<void> _selectDocument() async {
    try {
      // In a real app, you would use file_picker package
      // For now, we'll simulate document selection
      if (kIsWeb) {
        await _selectDocumentWeb();
      } else {
        await _selectDocumentMobile();
      }
    } catch (e) {
      setState(() {
        _validationError = 'Failed to select document: $e';
      });
    }
  }

  /// Select document on web platform
  Future<void> _selectDocumentWeb() async {
    // Simulate web file selection
    await Future.delayed(const Duration(seconds: 1));

    // Mock document data
    const fileName = 'passport_front.jpg';
    final mockBytes = Uint8List.fromList([1, 2, 3, 4, 5]); // Mock file bytes

    if (_validateDocument(fileName, mockBytes)) {
      widget.onDocumentUploaded(fileName, mockBytes);
      setState(() {
        _validationError = null;
      });
    }
  }

  /// Select document on mobile platform
  Future<void> _selectDocumentMobile() async {
    // Simulate mobile file selection
    await Future.delayed(const Duration(seconds: 1));

    // Mock document data
    const fileName = 'id_card_front.jpg';
    final mockBytes = Uint8List.fromList([1, 2, 3, 4, 5]); // Mock file bytes

    if (_validateDocument(fileName, mockBytes)) {
      widget.onDocumentUploaded(fileName, mockBytes);
      setState(() {
        _validationError = null;
      });
    }
  }

  /// Validate selected document
  bool _validateDocument(String fileName, Uint8List fileBytes) {
    // Check file size (10MB limit)
    const maxFileSize = 10 * 1024 * 1024;
    if (fileBytes.length > maxFileSize) {
      setState(() {
        _validationError = 'File size exceeds 10MB limit';
      });
      return false;
    }

    // Check file extension
    final extension = fileName.split('.').last.toLowerCase();
    const allowedExtensions = ['jpg', 'jpeg', 'png', 'pdf'];
    if (!allowedExtensions.contains(extension)) {
      setState(() {
        _validationError = 'Only JPG, PNG, and PDF files are allowed';
      });
      return false;
    }

    // Additional document-specific validation
    if (!_validateDocumentType(fileName)) {
      return false;
    }

    return true;
  }

  /// Validate document type-specific requirements
  bool _validateDocumentType(String fileName) {
    switch (widget.documentType) {
      case DocumentType.identityFront:
      case DocumentType.identityBack:
        // Identity documents should be images
        final extension = fileName.split('.').last.toLowerCase();
        if (!['jpg', 'jpeg', 'png'].contains(extension)) {
          setState(() {
            _validationError =
                'Identity documents must be in JPG or PNG format';
          });
          return false;
        }
        break;

      case DocumentType.proofOfAddress:
      case DocumentType.bankStatement:
      case DocumentType.taxDocument:
        // These can be images or PDFs
        break;

      default:
        break;
    }

    return true;
  }

  /// Preview document
  void _previewDocument() {
    if (widget.existingDocumentUrl != null) {
      // In a real app, this would open the document in a viewer
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Document Preview'),
          content: const Text('Document preview would be shown here'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        ),
      );
    }
  }

  /// Get document icon based on type
  IconData _getDocumentIcon() {
    switch (widget.documentType) {
      case DocumentType.identityFront:
      case DocumentType.identityBack:
      case DocumentType.nationalId:
        return Icons.badge_outlined;
      case DocumentType.selfie:
        return Icons.face_outlined;
      case DocumentType.proofOfAddress:
        return Icons.home_outlined;
      case DocumentType.bankStatement:
        return Icons.account_balance_outlined;
      case DocumentType.businessRegistration:
        return Icons.business_outlined;
      case DocumentType.taxDocument:
        return Icons.receipt_long_outlined;
      case DocumentType.authorizationLetter:
        return Icons.description_outlined;
      case DocumentType.passport:
        return Icons.chrome_reader_mode_outlined;
      case DocumentType.driverLicense:
        return Icons.drive_eta_outlined;
      case DocumentType.utilityBill:
        return Icons.receipt_outlined;
    }
  }

  /// Get document requirements based on type
  List<String> _getDocumentRequirements() {
    final commonRequirements = [
      'Clear, high-quality image',
      'All text must be readable',
      'No glare or shadows',
      'Full document visible',
    ];

    switch (widget.documentType) {
      case DocumentType.identityFront:
        return [
          ...commonRequirements,
          'Photo must be visible',
          'All personal details readable',
          'Document must not be expired',
        ];

      case DocumentType.identityBack:
        return [
          ...commonRequirements,
          'Signature visible (if applicable)',
          'Address readable (if present)',
          'Security features visible',
        ];

      case DocumentType.selfie:
        return [
          'Hold ID next to your face',
          'Face clearly visible',
          'Good lighting',
          'Both face and ID in frame',
          'No sunglasses or hat',
        ];

      case DocumentType.proofOfAddress:
        return [
          ...commonRequirements,
          'Document dated within last 3 months',
          'Your name must match registration',
          'Full address visible',
        ];

      case DocumentType.bankStatement:
        return [
          ...commonRequirements,
          'Statement within last 3 months',
          'Bank name and logo visible',
          'Account holder name matches',
        ];

      default:
        return commonRequirements;
    }
  }

  /// Extract filename from URL
  String _getFileName(String url) {
    // This is a simplified implementation
    // In a real app, you'd extract the actual filename
    return 'uploaded_document.jpg';
  }
}
