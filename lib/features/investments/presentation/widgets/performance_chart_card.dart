import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/adaptive/adaptive_card.dart';
import '../../../../shared/widgets/adaptive/adaptive_spacing.dart';
import '../../../../shared/widgets/adaptive/adaptive_text_styles.dart';
import '../../../../shared/constants/spacing.dart';

/// Performance chart card showing portfolio performance over time
class PerformanceChartCard extends ConsumerStatefulWidget {
  final bool showDetailed;

  const PerformanceChartCard({
    super.key,
    this.showDetailed = false,
  });

  @override
  ConsumerState<PerformanceChartCard> createState() =>
      _PerformanceChartCardState();
}

class _PerformanceChartCardState extends ConsumerState<PerformanceChartCard> {
  String _selectedPeriod = '6M';
  String _selectedMetric = 'value';

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
          Icons.show_chart,
          color: Theme.of(context).colorScheme.primary,
          size: 24,
        ),
        const SizedBox(width: Spacing.sm),
        Text(
          'Performance',
          style: AdaptiveTextStyles.titleMedium(context),
        ),
        const Spacer(),
        if (!widget.showDetailed)
          PopupMenuButton<String>(
            onSelected: _handlePeriodChange,
            itemBuilder: (context) => [
              const PopupMenuItem(value: '1M', child: Text('1 Month')),
              const PopupMenuItem(value: '3M', child: Text('3 Months')),
              const PopupMenuItem(value: '6M', child: Text('6 Months')),
              const PopupMenuItem(value: '1Y', child: Text('1 Year')),
              const PopupMenuItem(value: 'ALL', child: Text('All Time')),
            ],
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: Spacing.sm, vertical: Spacing.xs),
              decoration: BoxDecoration(
                border:
                    Border.all(color: Theme.of(context).colorScheme.outline),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _selectedPeriod,
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
            // Period selector
            Expanded(
              child: SegmentedButton<String>(
                segments: const [
                  ButtonSegment(value: '1M', label: Text('1M')),
                  ButtonSegment(value: '3M', label: Text('3M')),
                  ButtonSegment(value: '6M', label: Text('6M')),
                  ButtonSegment(value: '1Y', label: Text('1Y')),
                  ButtonSegment(value: 'ALL', label: Text('All')),
                ],
                selected: {_selectedPeriod},
                onSelectionChanged: (selection) {
                  setState(() {
                    _selectedPeriod = selection.first;
                  });
                },
                style: SegmentedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  foregroundColor: Theme.of(context).colorScheme.onSurface,
                  selectedBackgroundColor:
                      Theme.of(context).colorScheme.primary,
                  selectedForegroundColor:
                      Theme.of(context).colorScheme.onPrimary,
                  side: BorderSide(
                    color:
                        Theme.of(context).colorScheme.outline.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ],
        ),
        AdaptiveSpacing.verticalMedium(),
        Row(
          children: [
            // Metric selector
            Expanded(
              child: SegmentedButton<String>(
                segments: const [
                  ButtonSegment(value: 'value', label: Text('Value')),
                  ButtonSegment(value: 'returns', label: Text('Returns')),
                  ButtonSegment(value: 'comparison', label: Text('vs Market')),
                ],
                selected: {_selectedMetric},
                onSelectionChanged: (selection) {
                  setState(() {
                    _selectedMetric = selection.first;
                  });
                },
                style: SegmentedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  foregroundColor: Theme.of(context).colorScheme.onSurface,
                  selectedBackgroundColor:
                      Theme.of(context).colorScheme.primary,
                  selectedForegroundColor:
                      Theme.of(context).colorScheme.onPrimary,
                  side: BorderSide(
                    color:
                        Theme.of(context).colorScheme.outline.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// Build performance chart
  Widget _buildChart(BuildContext context) {
    return SizedBox(
      height: widget.showDetailed ? 300 : 200,
      child: CustomPaint(
        painter: PerformanceChartPainter(
          data: _getChartData(),
          color: Theme.of(context).colorScheme.primary,
          backgroundColor: Theme.of(context).colorScheme.surface,
        ),
        child: Container(),
      ),
    );
  }

  /// Build chart legend and key metrics
  Widget _buildLegend(BuildContext context) {
    return Column(
      children: [
        // Key metrics
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildMetricItem(
              context,
              'Total Return',
              '+12.5%',
              Colors.green,
              Icons.trending_up,
            ),
            _buildMetricItem(
              context,
              'This Month',
              '+2.3%',
              Colors.blue,
              Icons.calendar_month,
            ),
            _buildMetricItem(
              context,
              'Best Day',
              '+4.7%',
              Colors.orange,
              Icons.star,
            ),
          ],
        ),

        if (widget.showDetailed) ...[
          AdaptiveSpacing.verticalMedium(),
          // Additional detailed metrics
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildMetricItem(
                context,
                'Volatility',
                '12.3%',
                Colors.purple,
                Icons.analytics,
              ),
              _buildMetricItem(
                context,
                'Sharpe Ratio',
                '1.45',
                Colors.teal,
                Icons.assessment,
              ),
              _buildMetricItem(
                context,
                'Max Drawdown',
                '-8.2%',
                Colors.red,
                Icons.trending_down,
              ),
            ],
          ),
        ],
      ],
    );
  }

  /// Build individual metric item
  Widget _buildMetricItem(
    BuildContext context,
    String label,
    String value,
    Color color,
    IconData icon,
  ) {
    return Column(
      children: [
        Icon(icon, color: color, size: 16),
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
          style: AdaptiveTextStyles.bodySmall(context).copyWith(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  /// Get mock chart data based on selected period and metric
  List<ChartDataPoint> _getChartData() {
    // Mock data - in real app would come from provider
    switch (_selectedPeriod) {
      case '1M':
        return _generateMockData(30, 144300, 156750);
      case '3M':
        return _generateMockData(90, 140000, 156750);
      case '6M':
        return _generateMockData(180, 135000, 156750);
      case '1Y':
        return _generateMockData(365, 125000, 156750);
      case 'ALL':
        return _generateMockData(730, 100000, 156750);
      default:
        return _generateMockData(180, 135000, 156750);
    }
  }

  /// Generate mock data points
  List<ChartDataPoint> _generateMockData(
      int days, double startValue, double endValue) {
    final data = <ChartDataPoint>[];
    final valueStep = (endValue - startValue) / days;

    for (int i = 0; i <= days; i++) {
      final date = DateTime.now().subtract(Duration(days: days - i));
      final baseValue = startValue + (valueStep * i);
      // Add some random variation
      final variation = (i % 7 == 0) ? baseValue * 0.02 : baseValue * 0.005;
      final value = baseValue + (variation * (i % 3 == 0 ? 1 : -1));

      data.add(ChartDataPoint(
        date: date,
        value: value,
        label: '',
      ));
    }

    return data;
  }

  /// Handle period change
  void _handlePeriodChange(String period) {
    setState(() {
      _selectedPeriod = period;
    });
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

/// Custom painter for performance chart
class PerformanceChartPainter extends CustomPainter {
  final List<ChartDataPoint> data;
  final Color color;
  final Color backgroundColor;

  PerformanceChartPainter({
    required this.data,
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
      ..color = color.withOpacity(0.1)
      ..style = PaintingStyle.fill;

    // Find min and max values
    final minValue = data.map((d) => d.value).reduce((a, b) => a < b ? a : b);
    final maxValue = data.map((d) => d.value).reduce((a, b) => a > b ? a : b);
    final valueRange = maxValue - minValue;

    // Create path
    final path = Path();
    final fillPath = Path();

    for (int i = 0; i < data.length; i++) {
      final x = (i / (data.length - 1)) * size.width;
      final y =
          size.height - ((data[i].value - minValue) / valueRange) * size.height;

      if (i == 0) {
        path.moveTo(x, y);
        fillPath.moveTo(x, size.height);
        fillPath.lineTo(x, y);
      } else {
        path.lineTo(x, y);
        fillPath.lineTo(x, y);
      }
    }

    // Complete fill path
    fillPath.lineTo(size.width, size.height);
    fillPath.close();

    // Draw fill
    canvas.drawPath(fillPath, fillPaint);

    // Draw line
    canvas.drawPath(path, paint);

    // Draw data points
    final pointPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    for (int i = 0;
        i < data.length;
        i += (data.length ~/ 10).clamp(1, data.length)) {
      final x = (i / (data.length - 1)) * size.width;
      final y =
          size.height - ((data[i].value - minValue) / valueRange) * size.height;
      canvas.drawCircle(Offset(x, y), 3, pointPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
