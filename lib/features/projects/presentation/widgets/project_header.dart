import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/constants/spacing.dart';
import '../../domain/entities/project.dart';

/// Project header with cover image and title
class ProjectHeader extends StatelessWidget {
  final Project project;

  const ProjectHeader({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Cover image
        _buildCoverImage(context),

        // Title and status
        Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Status badge
              _buildStatusBadge(context),
              const AdaptiveSpacing.vertical(size: SpacingSize.small),

              // Project title
              Text(
                project.name,
                style: AdaptiveTextStyles.headlineMedium(context),
              ),
              const AdaptiveSpacing.vertical(size: SpacingSize.small),

              // Project metadata (category, location)
              Wrap(
                spacing: AppSpacing.md,
                children: [
                  _buildMetaChip(
                    context,
                    Icons.category,
                    project.category.displayName,
                  ),
                  _buildMetaChip(
                    context,
                    Icons.location_on,
                    project.location,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCoverImage(BuildContext context) {
    if (project.coverImageUrl.isEmpty) {
      return _buildPlaceholderImage(context);
    }

    return AspectRatio(
      aspectRatio: 16 / 9,
      child: CachedNetworkImage(
        imageUrl: project.coverImageUrl,
        fit: BoxFit.cover,
        placeholder: (context, url) => Container(
          color: Theme.of(context).colorScheme.surfaceVariant,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
        errorWidget: (context, url, error) => _buildPlaceholderImage(context),
      ),
    );
  }

  Widget _buildPlaceholderImage(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        color: Theme.of(context).colorScheme.surfaceVariant,
        child: Icon(
          Icons.image,
          size: 64,
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }

  Widget _buildStatusBadge(BuildContext context) {
    Color backgroundColor;
    Color textColor;

    switch (project.status) {
      case ProjectStatus.draft:
        backgroundColor = Colors.grey;
        textColor = Colors.white;
        break;
      case ProjectStatus.submitted:
      case ProjectStatus.underReview:
        backgroundColor = Colors.orange;
        textColor = Colors.white;
        break;
      case ProjectStatus.approved:
      case ProjectStatus.fundingActive:
        backgroundColor = Colors.green;
        textColor = Colors.white;
        break;
      case ProjectStatus.fundingComplete:
      case ProjectStatus.implementation:
        backgroundColor = Colors.blue;
        textColor = Colors.white;
        break;
      case ProjectStatus.completed:
        backgroundColor = Colors.purple;
        textColor = Colors.white;
        break;
      case ProjectStatus.suspended:
      case ProjectStatus.cancelled:
        backgroundColor = Colors.red;
        textColor = Colors.white;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        project.status.displayName,
        style: TextStyle(
          color: textColor,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildMetaChip(BuildContext context, IconData icon, String label) {
    return Chip(
      avatar: Icon(icon, size: 16),
      label: Text(label),
      visualDensity: VisualDensity.compact,
    );
  }
}
