import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:foodieconnectmerchant/core/constants/app_constants.dart';
import 'package:foodieconnectmerchant/data/models/statistics/monthly_stats.dart';
import 'package:foodieconnectmerchant/l10n/generated/translations.g.dart';

/// 月度收入曲线图组件
class MonthlyRevenueChart extends StatelessWidget {
  final MonthlyStats monthlyStats;

  const MonthlyRevenueChart({
    super.key,
    required this.monthlyStats,
  });

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final theme = Theme.of(context);

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              t.statistics.monthlySummary,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: AppConstants.defaultPadding),
            if (monthlyStats.dailyData.isEmpty)
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text(
                    t.statistics.noData,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              )
            else
              SizedBox(
                height: 200,
                child: LineChart(
                  LineChartData(
                    gridData: FlGridData(
                      show: true,
                      drawVerticalLine: false,
                      horizontalInterval: _calculateHorizontalInterval(),
                      getDrawingHorizontalLine: (value) {
                        return FlLine(
                          color: theme.colorScheme.outlineVariant,
                          strokeWidth: 1,
                        );
                      },
                    ),
                    titlesData: FlTitlesData(
                      show: true,
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 30,
                          interval: _calculateBottomInterval(),
                          getTitlesWidget: (value, meta) {
                            return _buildBottomTitle(value, theme);
                          },
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 60,
                          interval: _calculateHorizontalInterval(),
                          getTitlesWidget: (value, meta) {
                            return _buildLeftTitle(value, theme);
                          },
                        ),
                      ),
                    ),
                    borderData: FlBorderData(
                      show: true,
                      border: Border.all(
                        color: theme.colorScheme.outlineVariant,
                      ),
                    ),
                    minX: 1,
                    maxX: monthlyStats.dailyData.length.toDouble(),
                    minY: 0,
                    maxY: _calculateMaxY(),
                    lineBarsData: [
                      LineChartBarData(
                        spots: _buildSpots(),
                        isCurved: true,
                        gradient: LinearGradient(
                          colors: _isBlueColor(theme.colorScheme.primary)
                              ? [Colors.lightBlue, Colors.blue]
                              : [
                                  theme.colorScheme.primary.withValues(alpha: 0.5),
                                  theme.colorScheme.primary,
                                ],
                        ),
                        barWidth: 3,
                        isStrokeCapRound: true,
                        dotData: FlDotData(
                          show: true,
                          getDotPainter: (spot, percent, barData, index) {
                            return FlDotCirclePainter(
                              radius: 4,
                              color: theme.colorScheme.primary,
                              strokeWidth: 2,
                              strokeColor: theme.colorScheme.surface,
                            );
                          },
                        ),
                        belowBarData: BarAreaData(
                          show: true,
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              theme.colorScheme.primary.withValues(alpha: 0.3),
                              theme.colorScheme.primary.withValues(alpha: 0.0),
                            ],
                          ),
                        ),
                      ),
                    ],
                    lineTouchData: LineTouchData(
                      enabled: true,
                      touchTooltipData: LineTouchTooltipData(
                        tooltipBgColor: theme.colorScheme.surfaceContainerHighest,
                        getTooltipItems: (touchedSpots) {
                          return touchedSpots.map((spot) {
                            final index = spot.x.toInt() - 1;
                            if (index >= 0 && index < monthlyStats.dailyData.length) {
                              final data = monthlyStats.dailyData[index];
                              return LineTooltipItem(
                                '${data.date}\n¥${data.revenue.toStringAsFixed(2)}',
                                TextStyle(
                                  color: theme.colorScheme.onSurface,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            }
                            return null;
                          }).toList();
                        },
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  List<FlSpot> _buildSpots() {
    final spots = <FlSpot>[];
    for (int i = 0; i < monthlyStats.dailyData.length; i++) {
      spots.add(FlSpot(
        (i + 1).toDouble(),
        monthlyStats.dailyData[i].revenue,
      ));
    }
    return spots;
  }

  double _calculateMaxY() {
    if (monthlyStats.dailyData.isEmpty) return 100;
    final maxRevenue =
        monthlyStats.dailyData.map((e) => e.revenue).reduce((a, b) => a > b ? a : b);
    return (maxRevenue * 1.2).ceilToDouble();
  }

  double _calculateHorizontalInterval() {
    final maxY = _calculateMaxY();
    final interval = maxY / 5;
    return (interval / 100).ceilToDouble() * 100;
  }

  double _calculateBottomInterval() {
    final length = monthlyStats.dailyData.length;
    if (length <= 7) return 1;
    if (length <= 14) return 2;
    if (length <= 30) return 5;
    return (length / 6).ceilToDouble();
  }

  Widget _buildBottomTitle(double value, ThemeData theme) {
    final index = value.toInt() - 1;
    if (index >= 0 && index < monthlyStats.dailyData.length) {
      final dateStr = monthlyStats.dailyData[index].date;
      final parts = dateStr.split('-');
      if (parts.length == 3) {
        return Text(
          parts[2], // Show day only
          style: theme.textTheme.bodySmall,
        );
      }
    }
    return const SizedBox.shrink();
  }

  Widget _buildLeftTitle(double value, ThemeData theme) {
    return Text(
      '¥${value.toInt()}',
      style: theme.textTheme.bodySmall,
    );
  }

  bool _isBlueColor(Color color) {
    // Check if the color is blue by comparing with common blue values
    return color == Colors.blue ||
        color.value == Colors.blue.value ||
        (color.red < 100 && color.green > 100 && color.blue > 200);
  }
}
