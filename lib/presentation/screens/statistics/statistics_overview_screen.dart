import 'package:flutter/material.dart';
import 'package:foodieconnect/core/constants/app_constants.dart';
import 'package:foodieconnect/core/theme/app_theme.dart';

/// 统计概览页面
class StatisticsOverviewScreen extends StatelessWidget {
  const StatisticsOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.surfaceColor,
      appBar: AppBar(
        title: const Text('数据统计'),
        backgroundColor: AppTheme.primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppConstants.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 今日统计
          _buildTodayStats(),
          
          const SizedBox(height: AppConstants.defaultPadding),
          
          // 本周统计
          _buildWeeklyStats(),
          
          const SizedBox(height: AppConstants.defaultPadding),
          
          // 本月统计
          _buildMonthlyStats(),
          
          const SizedBox(height: AppConstants.defaultPadding),
          
          // 本年统计
          _buildYearlyStats(),
        ],
      ),
    );
  }

  Widget _buildTodayStats() {
    return _buildStatsCard(
      '今日统计',
      Icons.today,
      [
        _buildStatItem('今日营收', '¥2,345.00', AppTheme.successColor),
        _buildStatItem('今日订单', '156', AppTheme.primaryColor),
        _buildStatItem('今日顾客', '89', AppTheme.warningColor),
        _buildStatItem('今日评价', '23', AppTheme.errorColor),
      ],
    );
  }

  Widget _buildWeeklyStats() {
    return _buildStatsCard(
      '本周统计',
      Icons.date_range,
      [
        _buildStatItem('本周营收', '¥16,523.00', AppTheme.successColor),
        _buildStatItem('本周订单', '1,092', AppTheme.primaryColor),
        _buildStatItem('本周顾客', '623', AppTheme.warningColor),
        _buildStatItem('本周评价', '161', AppTheme.errorColor),
      ],
    );
  }

  Widget _buildMonthlyStats() {
    return _buildStatsCard(
      '本月统计',
      Icons.calendar_month,
      [
        _buildStatItem('本月营收', '¥66,892.00', AppTheme.successColor),
        _buildStatItem('本月订单', '4,368', AppTheme.primaryColor),
        _buildStatItem('本月顾客', '2,492', AppTheme.warningColor),
        _buildStatItem('本月评价', '644', AppTheme.errorColor),
      ],
    );
  }

  Widget _buildYearlyStats() {
    return _buildStatsCard(
      '本年统计',
      Icons.analytics,
      [
        _buildStatItem('本年营收', '¥802,704.00', AppTheme.successColor),
        _buildStatItem('本年订单', '52,416', AppTheme.primaryColor),
        _buildStatItem('本年顾客', '29,904', AppTheme.warningColor),
        _buildStatItem('本年评价', '7,728', AppTheme.errorColor),
      ],
    );
  }

  Widget _buildStatsCard(String title, IconData icon, List<Widget> children) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  size: 24,
                  color: AppTheme.primaryColor,
                ),
                const SizedBox(width: AppConstants.defaultPadding / 2),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: AppTheme.primaryColor,
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

  Widget _buildStatItem(String label, String value, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                color: AppTheme.textSecondary,
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