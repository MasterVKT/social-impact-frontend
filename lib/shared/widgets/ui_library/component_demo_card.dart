import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../adaptive/adaptive_card.dart';
import '../adaptive/adaptive_spacing.dart';
import '../adaptive/adaptive_text_styles.dart';
import '../../constants/spacing.dart';
import 'component_showcase_screen.dart';

/// Component demo card displaying individual component information and preview
class ComponentDemoCard extends ConsumerWidget {
  final UIComponent component;
  final VoidCallback onTap;

  const ComponentDemoCard({
    super.key,
    required this.component,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AdaptiveCard(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(Spacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              AdaptiveSpacing.verticalMedium(),
              _buildDescription(context),
              const Spacer(),
              _buildPreview(context),
              AdaptiveSpacing.verticalMedium(),
              _buildFooter(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Build component header
  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(Spacing.xs),
          decoration: BoxDecoration(
            color: _getCategoryColor().withOpacity(0.1),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Icon(
            _getCategoryIcon(),
            color: _getCategoryColor(),
            size: 16,
          ),
        ),
        const SizedBox(width: Spacing.sm),
        Expanded(
          child: Text(
            component.name,
            style: AdaptiveTextStyles.titleSmall(context).copyWith(
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 6,
            vertical: 2,
          ),
          decoration: BoxDecoration(
            color: _getCategoryColor().withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            component.category.displayName,
            style: AdaptiveTextStyles.bodySmall(context).copyWith(
              color: _getCategoryColor(),
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  /// Build component description
  Widget _buildDescription(BuildContext context) {
    return Text(
      component.description,
      style: AdaptiveTextStyles.bodySmall(context).copyWith(
        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
        height: 1.3,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  /// Build component preview
  Widget _buildPreview(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      padding: const EdgeInsets.all(Spacing.sm),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: _buildPreviewWidget(context),
        ),
      ),
    );
  }

  /// Build preview widget
  Widget _buildPreviewWidget(BuildContext context) {
    // Return a simplified preview based on component type
    switch (component.name) {
      case 'AdaptiveCard':
        return Container(
          width: 120,
          height: 60,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: _getCategoryColor(),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 4),
              Container(
                width: 80,
                height: 3,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 2),
              Container(
                width: 60,
                height: 3,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          ),
        );

      case 'Primary Button':
      case 'Secondary Button':
      case 'Text Button':
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: component.name == 'Primary Button'
                ? _getCategoryColor()
                : component.name == 'Secondary Button'
                    ? Colors.transparent
                    : Colors.transparent,
            border: component.name == 'Secondary Button'
                ? Border.all(color: _getCategoryColor())
                : null,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            'Button',
            style: TextStyle(
              color: component.name == 'Primary Button'
                  ? Colors.white
                  : _getCategoryColor(),
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        );

      case 'Search Bar':
        return Container(
          width: 140,
          height: 32,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              const Icon(Icons.search, size: 14, color: Colors.grey),
              const SizedBox(width: 4),
              Expanded(
                child: Container(
                  height: 2,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(1),
                  ),
                ),
              ),
            ],
          ),
        );

      case 'Text Field':
        return Container(
          width: 120,
          height: 36,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 60,
              height: 2,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.4),
                borderRadius: BorderRadius.circular(1),
              ),
            ),
          ),
        );

      case 'Status Badge':
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'Active',
                style: TextStyle(color: Colors.green, fontSize: 10),
              ),
            ),
            const SizedBox(width: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'Pending',
                style: TextStyle(color: Colors.orange, fontSize: 10),
              ),
            ),
          ],
        );

      case 'Progress Indicator':
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 100,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(2),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 60,
                  height: 4,
                  decoration: BoxDecoration(
                    color: _getCategoryColor(),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                value: 0.6,
                color: _getCategoryColor(),
              ),
            ),
          ],
        );

      case 'Investment Card':
      case 'Project Card':
        return Container(
          width: 140,
          height: 70,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.withOpacity(0.2)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: _getCategoryColor().withOpacity(0.2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Icon(
                      component.name == 'Investment Card'
                          ? Icons.trending_up
                          : Icons.business_center,
                      size: 12,
                      color: _getCategoryColor(),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Container(
                      height: 3,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Container(
                width: 80,
                height: 2,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(1),
                ),
              ),
              const SizedBox(height: 4),
              Container(
                width: 60,
                height: 2,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(1),
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  Container(
                    width: 30,
                    height: 2,
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(1),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: 20,
                    height: 2,
                    decoration: BoxDecoration(
                      color: _getCategoryColor().withOpacity(0.6),
                      borderRadius: BorderRadius.circular(1),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );

      case 'Line Chart':
      case 'Bar Chart':
        return SizedBox(
          width: 100,
          height: 60,
          child: component.name == 'Line Chart'
              ? CustomPaint(
                  painter: LineChartPainter(_getCategoryColor()),
                  size: const Size(100, 60),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(width: 8, height: 40, color: _getCategoryColor()),
                    Container(width: 8, height: 25, color: _getCategoryColor()),
                    Container(width: 8, height: 35, color: _getCategoryColor()),
                    Container(width: 8, height: 50, color: _getCategoryColor()),
                  ],
                ),
        );

      default:
        return Container(
          width: 60,
          height: 40,
          decoration: BoxDecoration(
            color: _getCategoryColor().withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            _getCategoryIcon(),
            color: _getCategoryColor(),
            size: 20,
          ),
        );
    }
  }

  /// Build component footer
  Widget _buildFooter(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.visibility,
          size: 14,
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.4),
        ),
        const SizedBox(width: 4),
        Text(
          'View Demo',
          style: AdaptiveTextStyles.bodySmall(context).copyWith(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
            fontSize: 11,
          ),
        ),
        const Spacer(),
        Icon(
          Icons.arrow_forward,
          size: 16,
          color: Theme.of(context).colorScheme.primary,
        ),
      ],
    );
  }

  /// Get category color
  Color _getCategoryColor() {
    switch (component.category) {
      case ComponentCategory.all:
        return Colors.grey;
      case ComponentCategory.adaptive:
        return Colors.blue;
      case ComponentCategory.buttons:
        return Colors.green;
      case ComponentCategory.inputs:
        return Colors.orange;
      case ComponentCategory.navigation:
        return Colors.purple;
      case ComponentCategory.display:
        return Colors.cyan;
      case ComponentCategory.feedback:
        return Colors.red;
      case ComponentCategory.layout:
        return Colors.indigo;
      case ComponentCategory.charts:
        return Colors.amber;
      case ComponentCategory.business:
        return Colors.teal;
    }
  }

  /// Get category icon
  IconData _getCategoryIcon() {
    switch (component.category) {
      case ComponentCategory.all:
        return Icons.dashboard;
      case ComponentCategory.adaptive:
        return Icons.audiotrack;
      case ComponentCategory.buttons:
        return Icons.smart_button;
      case ComponentCategory.inputs:
        return Icons.input;
      case ComponentCategory.navigation:
        return Icons.navigation;
      case ComponentCategory.display:
        return Icons.display_settings;
      case ComponentCategory.feedback:
        return Icons.feedback;
      case ComponentCategory.layout:
        return Icons.view_quilt;
      case ComponentCategory.charts:
        return Icons.bar_chart;
      case ComponentCategory.business:
        return Icons.business_center;
    }
  }
}

/// Simple line chart painter for preview
class LineChartPainter extends CustomPainter {
  final Color color;

  LineChartPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path();
    final points = [
      Offset(10, size.height * 0.8),
      Offset(size.width * 0.3, size.height * 0.6),
      Offset(size.width * 0.6, size.height * 0.3),
      Offset(size.width - 10, size.height * 0.2),
    ];

    path.moveTo(points.first.dx, points.first.dy);
    for (int i = 1; i < points.length; i++) {
      path.lineTo(points[i].dx, points[i].dy);
    }

    canvas.drawPath(path, paint);

    // Draw points
    for (final point in points) {
      canvas.drawCircle(
          point,
          3,
          Paint()
            ..color = color
            ..style = PaintingStyle.fill);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
