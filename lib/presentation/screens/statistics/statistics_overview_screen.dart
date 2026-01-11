import 'package:flutter/material.dart';
import 'package:foodieconnectmerchant/core/constants/app_constants.dart';
import 'package:foodieconnectmerchant/core/theme/app_theme.dart';
import 'package:foodieconnectmerchant/l10n/generated/translations.g.dart';

/// 统计概览页面
class StatisticsOverviewScreen extends StatelessWidget {
  const StatisticsOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        title: Text(Translations.of(context).statistics.title),
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.onPrimary,
        elevation: 0,
      ),
      body: _buildBody(context, theme),
    );
  }

  Widget _buildBody(BuildContext context, ThemeData theme) {
    final t = Translations.of(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppConstants.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 今日统计
          _buildTodayStats(t, theme),

          const SizedBox(height: AppConstants.defaultPadding),

          // 本周统计
          _buildWeeklyStats(t, theme),

          const SizedBox(height: AppConstants.defaultPadding),

          // 本月统计
          _buildMonthlyStats(t, theme),

          const SizedBox(height: AppConstants.defaultPadding),

          // 本年统计
          _buildYearlyStats(t, theme),
        ],
      ),
    );
  }

  Widget _buildTodayStats(Translations t, ThemeData theme) {
    return _buildStatsCard(
      '${t.statistics.today}${t.statistics.overview}',
      Icons.today,
      [
        _buildStatItem(
          '${t.statistics.today}${t.statistics.revenue}',
          '¥2,345.00',
          AppTheme.successColor,
          theme,
        ),
        _buildStatItem(
          '${t.statistics.today}${t.statistics.orders}',
          '156',
          theme.colorScheme.primary,
          theme,
        ),
        _buildStatItem(
          '${t.statistics.today}${t.statistics.customers}',
          '89',
          AppTheme.warningColor,
          theme,
        ),
        _buildStatItem(
          '${t.statistics.today}${t.statistics.reviews}',
          '23',
          theme.colorScheme.error,
          theme,
        ),
      ],
      theme,
    );
  }

  Widget _buildWeeklyStats(Translations t, ThemeData theme) {
    return _buildStatsCard(
      '${t.statistics.weekly}${t.statistics.overview}',
      Icons.date_range,
      [
        _buildStatItem(
          '${t.statistics.weekly}${t.statistics.revenue}',
          '¥16,523.00',
          AppTheme.successColor,
          theme,
        ),
        _buildStatItem(
          '${t.statistics.weekly}${t.statistics.orders}',
          '1,092',
          theme.colorScheme.primary,
          theme,
        ),
        _buildStatItem(
          '${t.statistics.weekly}${t.statistics.customers}',
          '623',
          AppTheme.warningColor,
          theme,
        ),
        _buildStatItem(
          '${t.statistics.weekly}${t.statistics.reviews}',
          '161',
          theme.colorScheme.error,
          theme,
        ),
      ],
      theme,
    );
  }

  Widget _buildMonthlyStats(Translations t, ThemeData theme) {
    return _buildStatsCard(
      '${t.statistics.monthly}${t.statistics.overview}',
      Icons.calendar_month,
      [
        _buildStatItem(
          '${t.statistics.monthly}${t.statistics.revenue}',
          '¥66,892.00',
          AppTheme.successColor,
          theme,
        ),
        _buildStatItem(
          '${t.statistics.monthly}${t.statistics.orders}',
          '4,368',
          theme.colorScheme.primary,
          theme,
        ),
        _buildStatItem(
          '${t.statistics.monthly}${t.statistics.customers}',
          '2,492',
          AppTheme.warningColor,
          theme,
        ),
        _buildStatItem(
          '${t.statistics.monthly}${t.statistics.reviews}',
          '644',
          theme.colorScheme.error,
          theme,
        ),
      ],
      theme,
    );
  }

  Widget _buildYearlyStats(Translations t, ThemeData theme) {
    return _buildStatsCard(
      '${t.statistics.yearly}${t.statistics.overview}',
      Icons.analytics,
      [
        _buildStatItem(
          '${t.statistics.yearly}${t.statistics.revenue}',
          '¥802,704.00',
          AppTheme.successColor,
          theme,
        ),
        _buildStatItem(
          '${t.statistics.yearly}${t.statistics.orders}',
          '52,416',
          theme.colorScheme.primary,
          theme,
        ),
        _buildStatItem(
          '${t.statistics.yearly}${t.statistics.customers}',
          '29,904',
          AppTheme.warningColor,
          theme,
        ),
        _buildStatItem(
          '${t.statistics.yearly}${t.statistics.reviews}',
          '7,728',
          theme.colorScheme.error,
          theme,
        ),
      ],
      theme,
    );
  }

  Widget _buildStatsCard(
    String title,
    IconData icon,
    List<Widget> children,
    ThemeData theme,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 24, color: theme.colorScheme.primary),
                const SizedBox(width: AppConstants.defaultPadding / 2),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppConstants.defaultPadding),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(
    String label,
    String value,
    Color color,
    ThemeData theme,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
