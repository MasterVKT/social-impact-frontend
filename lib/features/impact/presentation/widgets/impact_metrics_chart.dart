import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/constants/spacing.dart';

/// Impact metrics chart showing progress and trends over time
class ImpactMetricsChart extends ConsumerStatefulWidget {
  final String timeframe;
  final bool showDetailed;
  
  const ImpactMetricsChart({
    super.key,
    required this.timeframe,
    this.showDetailed = false,
  });

  @override
  ConsumerState<ImpactMetricsChart> createState() => _ImpactMetricsChartState();
}

class _ImpactMetricsChartState extends ConsumerState<ImpactMetricsChart> {
  String _selectedMetric = 'lives_impacted';
  String _chartType = 'line';
  
  @override
  Widget build(BuildContext context) {
    return AdaptiveCard(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            if (widget.showDetailed) _buildControls(context),
            AdaptiveSpacing.verticalLarge(),
            _buildChart(context),
            AdaptiveSpacing.verticalLarge(),
            _buildMetricsSummary(context),
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
          Icons.analytics,
          color: Theme.of(context).colorScheme.primary,
          size: 24,
        ),
        const SizedBox(width: Spacing.sm),
        Text(
          'Impact Metrics',
          style: AdaptiveTextStyles.titleMedium(context),
        ),
        const Spacer(),
        if (!widget.showDetailed)
          PopupMenuButton<String>(
            initialValue: _selectedMetric,
            onSelected: (value) {
              setState(() {
                _selectedMetric = value;
              });
            },
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'lives_impacted', child: Text('Lives Impacted')),
              const PopupMenuItem(value: 'co2_reduced', child: Text('CO₂ Reduced')),
              const PopupMenuItem(value: 'jobs_created', child: Text('Jobs Created')),
              const PopupMenuItem(value: 'communities', child: Text('Communities Served')),
            ],
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: Spacing.sm, vertical: Spacing.xs),
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).colorScheme.outline),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _getMetricLabel(_selectedMetric),
                    style: AdaptiveTextStyles.bodySmall(context),
                  ),
                  const SizedBox(width: 4),
                  const Icon(Icons.arrow_drop_down, size: 16),
                ],
              ),
            ),
          ),
      ],
    );
  }
  
  /// Build detailed controls (only shown in detailed view)
  Widget _buildControls(BuildContext context) {
    return Column(
      children: [
        AdaptiveSpacing.verticalMedium(),
        Row(
          children: [
            // Metric selector
            Expanded(
              child: SegmentedButton<String>(
                segments: const [
                  ButtonSegment(value: 'lives_impacted', label: Text('Lives')),
                  ButtonSegment(value: 'co2_reduced', label: Text('CO₂')),
                  ButtonSegment(value: 'jobs_created', label: Text('Jobs')),
                  ButtonSegment(value: 'communities', label: Text('Communities')),
                ],
                selected: {_selectedMetric},
                onSelectionChanged: (selection) {
                  setState(() {
                    _selectedMetric = selection.first;
                  });
                },
              ),
            ),
          ],
        ),
        AdaptiveSpacing.verticalMedium(),
        Row(
          children: [
            // Chart type selector
            Expanded(
              child: SegmentedButton<String>(
                segments: const [
                  ButtonSegment(value: 'line', label: Text('Line')),
                  ButtonSegment(value: 'bar', label: Text('Bar')),
                  ButtonSegment(value: 'area', label: Text('Area')),
                ],
                selected: {_chartType},
                onSelectionChanged: (selection) {
                  setState(() {
                    _chartType = selection.first;
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
  
  /// Build impact chart
  Widget _buildChart(BuildContext context) {
    return SizedBox(
      height: widget.showDetailed ? 300 : 200,
      child: CustomPaint(
        painter: ImpactChartPainter(
          data: _getChartData(),
          chartType: _chartType,
          color: Theme.of(context).colorScheme.primary,
          backgroundColor: Theme.of(context).colorScheme.surface,
        ),
        child: Container(),
      ),
    );
  }
  
  /// Build metrics summary
  Widget _buildMetricsSummary(BuildContext context) {
    final currentMetric = _getCurrentMetricData();
    
    return Container(
      padding: const EdgeInsets.all(Spacing.md),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildSummaryItem(
                context,
                'Current',
                currentMetric['current']!,
                Icons.trending_flat,
                Theme.of(context).colorScheme.primary,
              ),
              _buildSummaryItem(
                context,
                'Change',
                currentMetric['change']!,
                Icons.trending_up,
                Colors.green,
              ),
              _buildSummaryItem(
                context,
                'Target',
                currentMetric['target']!,
                Icons.flag,
                Colors.orange,
              ),
            ],
          ),
          
          if (widget.showDetailed) ...[
            AdaptiveSpacing.verticalMedium(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildSummaryItem(
                  context,
                  'Average',
                  currentMetric['average']!,
                  Icons.straighten,
                  Colors.blue,
                ),
                _buildSummaryItem(
                  context,
                  'Peak',
                  currentMetric['peak']!,
                  Icons.vertical_align_top,
                  Colors.purple,
                ),
                _buildSummaryItem(
                  context,
                  'Progress',
                  currentMetric['progress']!,
                  Icons.check_circle,
                  Colors.teal,
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
  
  /// Build summary item
  Widget _buildSummaryItem(
    BuildContext context,
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    return Column(
      children: [
        Icon(icon, color: color, size: 20),
        AdaptiveSpacing.verticalSmall(),
        Text(
          value,
          style: AdaptiveTextStyles.titleSmall(context).copyWith(
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          label,
          style: AdaptiveTextStyles.bodySmall(context),
        ),
      ],
    );
  }
  
  /// Get chart data based on selected metric and timeframe
  List<ChartDataPoint> _getChartData() {
    // Mock data - in real app would come from provider
    switch (_selectedMetric) {
      case 'lives_impacted':
        return _generateMockData(widget.timeframe, 8000, 12547);
      case 'co2_reduced':
        return _generateMockData(widget.timeframe, 1500, 2340);
      case 'jobs_created':
        return _generateMockData(widget.timeframe, 800, 1250);
      case 'communities':
        return _generateMockData(widget.timeframe, 30, 45);
      default:
        return _generateMockData(widget.timeframe, 8000, 12547);
    }
  }
  
  /// Generate mock data points
  List<ChartDataPoint> _generateMockData(String timeframe, int startValue, int endValue) {
    final dataPoints = <ChartDataPoint>[];
    int days;
    
    switch (timeframe) {
      case '1M':
        days = 30;
        break;
      case '3M':
        days = 90;
        break;
      case '6M':
        days = 180;
        break;
      case '12M':
        days = 365;
        break;
      case 'ALL':
        days = 730;
        break;
      default:
        days = 365;
    }
    
    final step = (endValue - startValue) / days;
    
    for (int i = 0; i <= days; i += (days / 12).round()) {
      final date = DateTime.now().subtract(Duration(days: days - i));
      final value = startValue + (step * i);
      final variation = value * 0.1 * (i % 3 == 0 ? 1 : -1) * 0.5;
      
      dataPoints.add(ChartDataPoint(
        date: date,
        value: (value + variation).clamp(startValue * 0.8, endValue * 1.2),
        label: _formatValue(_selectedMetric, value + variation),
      ));
    }
    
    return dataPoints;
  }
  
  /// Get current metric data for summary
  Map<String, String> _getCurrentMetricData() {
    switch (_selectedMetric) {
      case 'lives_impacted':
        return {
          'current': '12,547',
          'change': '+15.3%',
          'target': '15,000',
          'average': '10,234',
          'peak': '13,120',
          'progress': '83.6%',
        };
      case 'co2_reduced':
        return {
          'current': '2,340t',
          'change': '+23.1%',
          'target': '3,000t',
          'average': '1,890t',
          'peak': '2,456t',
          'progress': '78.0%',
        };
      case 'jobs_created':
        return {
          'current': '1,250',
          'change': '+8.7%',
          'target': '1,500',
          'average': '1,045',
          'peak': '1,320',
          'progress': '83.3%',
        };
      case 'communities':
        return {
          'current': '45',
          'change': '+12.5%',
          'target': '50',
          'average': '38',
          'peak': '47',
          'progress': '90.0%',
        };
      default:
        return {
          'current': '12,547',
          'change': '+15.3%',
          'target': '15,000',
          'average': '10,234',
          'peak': '13,120',
          'progress': '83.6%',
        };
    }
  }
  
  /// Get metric label for display
  String _getMetricLabel(String metric) {
    switch (metric) {
      case 'lives_impacted':
        return 'Lives Impacted';
      case 'co2_reduced':
        return 'CO₂ Reduced';
      case 'jobs_created':
        return 'Jobs Created';
      case 'communities':
        return 'Communities';
      default:
        return 'Metric';
    }
  }
  
  /// Format value for display
  String _formatValue(String metric, double value) {
    switch (metric) {
      case 'co2_reduced':
        return '${value.toStringAsFixed(0)}t';
      case 'lives_impacted':
      case 'jobs_created':
      case 'communities':
        return value.toStringAsFixed(0);
      default:
        return value.toStringAsFixed(0);
    }
  }
}

/// Chart data point
class ChartDataPoint {
  final DateTime date;
  final double value;
  final String label;
  
  ChartDataPoint({
    required this.date,
    required this.value,
    required this.label,
  });
}

/// Custom painter for impact chart
class ImpactChartPainter extends CustomPainter {
  final List<ChartDataPoint> data;
  final String chartType;
  final Color color;
  final Color backgroundColor;
  
  ImpactChartPainter({
    required this.data,
    required this.chartType,
    required this.color,
    required this.backgroundColor,
  });
  
  @override
  void paint(Canvas canvas, Size size) {
    if (data.isEmpty) return;
    
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    
    final fillPaint = Paint()
      ..color = color.withOpacity(0.2)
      ..style = PaintingStyle.fill;
    
    // Find min and max values
    final minValue = data.map((d) => d.value).reduce((a, b) => a < b ? a : b);
    final maxValue = data.map((d) => d.value).reduce((a, b) => a > b ? a : b);
    final valueRange = maxValue - minValue;
    
    if (valueRange == 0) return;
    
    switch (chartType) {
      case 'line':
        _drawLineChart(canvas, size, paint, fillPaint, minValue, valueRange);
        break;
      case 'bar':
        _drawBarChart(canvas, size, paint, minValue, valueRange);
        break;
      case 'area':
        _drawAreaChart(canvas, size, paint, fillPaint, minValue, valueRange);
        break;
    }
  }
  
  void _drawLineChart(Canvas canvas, Size size, Paint paint, Paint fillPaint, double minValue, double valueRange) {
    final path = Path();
    final fillPath = Path();
    
    for (int i = 0; i < data.length; i++) {
      final x = (i / (data.length - 1)) * size.width;
      final y = size.height - ((data[i].value - minValue) / valueRange) * size.height;
      
      if (i == 0) {
        path.moveTo(x, y);
        fillPath.moveTo(x, size.height);
        fillPath.lineTo(x, y);
      } else {
        path.lineTo(x, y);
        fillPath.lineTo(x, y);
      }
    }
    
    fillPath.lineTo(size.width, size.height);
    fillPath.close();
    
    canvas.drawPath(fillPath, fillPaint);
    canvas.drawPath(path, paint);
    
    // Draw data points
    final pointPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    
    for (int i = 0; i < data.length; i++) {
      final x = (i / (data.length - 1)) * size.width;
      final y = size.height - ((data[i].value - minValue) / valueRange) * size.height;
      canvas.drawCircle(Offset(x, y), 3, pointPaint);
    }
  }
  
  void _drawBarChart(Canvas canvas, Size size, Paint paint, double minValue, double valueRange) {
    paint.style = PaintingStyle.fill;
    
    final barWidth = size.width / data.length * 0.8;
    
    for (int i = 0; i < data.length; i++) {
      final x = (i / data.length) * size.width + (size.width / data.length - barWidth) / 2;
      final barHeight = ((data[i].value - minValue) / valueRange) * size.height;
      final y = size.height - barHeight;
      
      canvas.drawRect(
        Rect.fromLTWH(x, y, barWidth, barHeight),
        paint,
      );
    }
  }
  
  void _drawAreaChart(Canvas canvas, Size size, Paint paint, Paint fillPaint, double minValue, double valueRange) {
    final path = Path();
    
    for (int i = 0; i < data.length; i++) {
      final x = (i / (data.length - 1)) * size.width;
      final y = size.height - ((data[i].value - minValue) / valueRange) * size.height;
      
      if (i == 0) {
        path.moveTo(x, size.height);
        path.lineTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    
    path.lineTo(size.width, size.height);
    path.close();
    
    canvas.drawPath(path, fillPaint);
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}