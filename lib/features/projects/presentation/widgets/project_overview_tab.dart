import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/constants/spacing.dart';
import '../../domain/entities/project.dart';

/// Overview tab showing project description and details
class ProjectOverviewTab extends StatelessWidget {
  final Project project;

  const ProjectOverviewTab({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Description
          AdaptiveCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'About This Project',
                  style: AdaptiveTextStyles.titleLarge(context),
                ),
                const AdaptiveSpacing.vertical(size: SpacingSize.medium),
                Text(
                  project.description,
                  style: AdaptiveTextStyles.bodyLarge(context),
                ),
              ],
            ),
          ),
          const AdaptiveSpacing.vertical(size: SpacingSize.large),

          // Additional images (if any)
          if (project.additionalImages.isNotEmpty) ...[
            AdaptiveCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Project Gallery',
                    style: AdaptiveTextStyles.titleMedium(context),
                  ),
                  const AdaptiveSpacing.vertical(size: SpacingSize.medium),
                  _buildImageGallery(context),
                ],
              ),
            ),
            const AdaptiveSpacing.vertical(size: SpacingSize.large),
          ],

          // Project details
          AdaptiveCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Project Details',
                  style: AdaptiveTextStyles.titleMedium(context),
                ),
                const AdaptiveSpacing.vertical(size: SpacingSize.medium),
                _buildDetailRow(
                  context,
                  'Duration',
                  '${project.duration} days',
                ),
                const Divider(),
                _buildDetailRow(
                  context,
                  'Funding Goal',
                  '€${project.fundingGoal.toStringAsFixed(2)}',
                ),
                const Divider(),
                _buildDetailRow(
                  context,
                  'Category',
                  project.category.displayName,
                ),
                const Divider(),
                _buildDetailRow(
                  context,
                  'Location',
                  project.location,
                ),
                const Divider(),
                _buildDetailRow(
                  context,
                  'Created',
                  project.createdAt != null
                      ? _formatDate(project.createdAt!)
                      : 'N/A',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageGallery(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: project.additionalImages.length,
        itemBuilder: (context, index) {
          final imageUrl = project.additionalImages[index];
          return Padding(
            padding: const EdgeInsets.only(right: AppSpacing.md),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                width: 300,
                height: 200,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  width: 300,
                  height: 200,
                  color: Theme.of(context).colorScheme.surfaceVariant,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                  width: 300,
                  height: 200,
                  color: Theme.of(context).colorScheme.surfaceVariant,
                  child: const Icon(Icons.error),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDetailRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AdaptiveTextStyles.bodyMedium(context),
          ),
          Text(
            value,
            style: AdaptiveTextStyles.bodyMedium(context).copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
