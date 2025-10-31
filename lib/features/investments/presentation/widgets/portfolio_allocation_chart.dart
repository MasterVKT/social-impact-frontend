import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/constants/spacing.dart';
import '../../../../core/utils/platform_detector.dart';

/// Portfolio allocation chart showing investment distribution
class PortfolioAllocationChart extends ConsumerWidget {
  const PortfolioAllocationChart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            AdaptiveSpacing.verticalLarge(),
            _buildChart(context),
            AdaptiveSpacing.verticalLarge(),
            _buildLegend(context),
          ],
        ),
      ),
    );
  }
  
  /// Build card header
  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.pie_chart,
          color: Theme.of(context).colorScheme.primary,
          size: 24,
        ),
        const SizedBox(width: Spacing.sm),
        Text(
          'Portfolio Allocation',
          style: AdaptiveTextStyles.titleMedium(context),
        ),
        const Spacer(),
        PopupMenuButton<String>(
          onSelected: _handleChartAction,
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'by_category',
              child: Text('By Category'),
            ),
            const PopupMenuItem(
              value: 'by_status',
              child: Text('By Status'),
            ),
            const PopupMenuItem(
              value: 'by_risk',
              child: Text('By Risk Level'),
            ),
          ],
          child: const Icon(Icons.more_vert),
        ),
      ],
    );
  }
  
  /// Build the pie chart (simplified representation)
  Widget _buildChart(BuildContext context) {
    return SizedBox(
      height: PlatformDetector.isMobile ? 200 : 250,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Pie chart representation using containers
          SizedBox(
            width: 200,
            height: 200,
            child: CustomPaint(
              painter: PieChartPainter(
                allocations: _getMockAllocations(),
                colors: _getChartColors(context),
              ),
            ),
          ),
          
          // Center text
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Total',
                style: AdaptiveTextStyles.bodySmall(context).copyWith(
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                ),
              ),
              Text(
                '€156.7K',
                style: AdaptiveTextStyles.titleLarge(context).copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  
  /// Build chart legend
  Widget _buildLegend(BuildContext context) {
    final allocations = _getMockAllocations();
    final colors = _getChartColors(context);
    
    return Column(
      children: allocations.asMap().entries.map((entry) {
        final index = entry.key;
        final allocation = entry.value;
        final color = colors[index % colors.length];
        
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            children: [
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              const SizedBox(width: Spacing.sm),
              Expanded(
                child: Text(
                  allocation['category']!,
                  style: AdaptiveTextStyles.bodyMedium(context),
                ),
              ),
              Text(
                allocation['percentage']!,
                style: AdaptiveTextStyles.bodyMedium(context).copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: Spacing.sm),
              Text(
                allocation['amount']!,
                style: AdaptiveTextStyles.bodySmall(context).copyWith(
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
  
  /// Get mock allocation data
  List<Map<String, String>> _getMockAllocations() {
    return [
      {'category': 'Healthcare', 'percentage': '35%', 'amount': '€54.9K'},
      {'category': 'Education', 'percentage': '28%', 'amount': '€43.9K'},
      {'category': 'Environment', 'percentage': '20%', 'amount': '€31.4K'},
      {'category': 'Clean Energy', 'percentage': '12%', 'amount': '€18.8K'},
      {'category': 'Microfinance', 'percentage': '5%', 'amount': '€7.8K'},
    ];
  }
  
  /// Get chart colors
  List<Color> _getChartColors(BuildContext context) {
    return [
      Theme.of(context).colorScheme.primary,
      Theme.of(context).colorScheme.secondary,
      Theme.of(context).colorScheme.tertiary,
      Colors.green,
      Colors.orange,
      Colors.purple,
    ];
  }
  
  /// Handle chart action
  void _handleChartAction(String action) {
    // Implement chart view switching
  }
}

/// Custom painter for pie chart
class PieChartPainter extends CustomPainter {
  final List<Map<String, String>> allocations;
  final List<Color> colors;
  
  PieChartPainter({
    required this.allocations,
    required this.colors,
  });
  
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.4;
    
    double startAngle = -90 * (3.14159 / 180); // Start from top
    
    for (int i = 0; i < allocations.length; i++) {
      final allocation = allocations[i];
      final percentage = double.parse(allocation['percentage']!.replaceAll('%', ''));
      final sweepAngle = (percentage / 100) * 2 * 3.14159;
      
      final paint = Paint()
        ..color = colors[i % colors.length]
        ..style = PaintingStyle.fill;
      
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        true,
        paint,
      );
      
      // Add stroke
      final strokePaint = Paint()
        ..color = Colors.white
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2;
      
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        true,
        strokePaint,
      );
      
      startAngle += sweepAngle;
    }
    
    // Draw center circle (donut style)
    final centerPaint = Paint()
      ..color = colors.first.withOpacity(0.1)
      ..style = PaintingStyle.fill;
    
    canvas.drawCircle(center, radius * 0.5, centerPaint);
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}