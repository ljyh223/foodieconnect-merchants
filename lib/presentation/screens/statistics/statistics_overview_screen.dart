import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:foodieconnectmerchant/core/constants/app_constants.dart';
import 'package:foodieconnectmerchant/l10n/generated/translations.g.dart';
import 'package:foodieconnectmerchant/presentation/providers/statistics_provider.dart';
import 'package:foodieconnectmerchant/presentation/widgets/common/loading_indicator.dart';
import 'package:foodieconnectmerchant/presentation/widgets/statistics/today_summary_card.dart';
import 'package:foodieconnectmerchant/presentation/widgets/statistics/monthly_revenue_chart.dart';
import 'package:foodieconnectmerchant/presentation/widgets/statistics/staff_ratings_card.dart';

/// 统计概览页面
class StatisticsOverviewScreen extends StatefulWidget {
  const StatisticsOverviewScreen({super.key});

  @override
  State<StatisticsOverviewScreen> createState() => _StatisticsOverviewScreenState();
}

class _StatisticsOverviewScreenState extends State<StatisticsOverviewScreen> {
  late final StatisticsProvider _provider;

  @override
  void initState() {
    super.initState();
    _provider = StatisticsProvider();
    _loadStats();
  }

  Future<void> _loadStats() async {
    await _provider.loadStats();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ChangeNotifierProvider.value(
      value: _provider,
      child: Scaffold(
        backgroundColor: theme.colorScheme.surface,
        appBar: AppBar(
          title: Text(Translations.of(context).statistics.title),
          backgroundColor: theme.colorScheme.primary,
          foregroundColor: theme.colorScheme.onPrimary,
          elevation: 0,
          actions: [
            Consumer<StatisticsProvider>(
              builder: (context, provider, child) {
                if (!provider.isLoading) {
                  return IconButton(
                    icon: const Icon(Icons.refresh),
                    onPressed: _loadStats,
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
        body: _buildBody(context, theme),
      ),
    );
  }

  Widget _buildBody(BuildContext context, ThemeData theme) {
    return Consumer<StatisticsProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading && provider.statsData == null) {
          return const Center(child: LoadingIndicator());
        }

        if (provider.errorMessage != null && provider.statsData == null) {
          return _buildErrorView(context, theme, provider.errorMessage!, _loadStats);
        }

        final data = provider.statsData;
        if (data == null) {
          return _buildErrorView(
            context,
            theme,
            Translations.of(context).statistics.noData,
            _loadStats,
          );
        }

        return RefreshIndicator(
          onRefresh: _loadStats,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(AppConstants.defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 今日总结
                TodaySummaryCard(
                  revenue: data.today.revenue,
                  dishAverageRating: data.today.dishAverageRating,
                  staffAverageRating: data.today.staffAverageRating,
                ),

                const SizedBox(height: AppConstants.defaultPadding),

                // 月度收入曲线图
                MonthlyRevenueChart(
                  monthlyStats: data.monthly,
                ),

                const SizedBox(height: AppConstants.defaultPadding),

                // 员工评分
                StaffRatingsCard(
                  staffRatings: data.staffRatings,
                ),

                const SizedBox(height: AppConstants.defaultPadding),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildErrorView(
    BuildContext context,
    ThemeData theme,
    String message,
    VoidCallback onRetry,
  ) {
    final t = Translations.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding * 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: theme.colorScheme.error,
            ),
            const SizedBox(height: AppConstants.defaultPadding),
            Text(
              message,
              style: theme.textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppConstants.defaultPadding),
            ElevatedButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label: Text(t.statistics.retry),
            ),
          ],
        ),
      ),
    );
  }
}
