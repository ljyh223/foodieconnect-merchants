import 'package:flutter/material.dart';
import 'package:foodieconnectmerchant/core/constants/app_constants.dart';
import 'package:foodieconnectmerchant/l10n/generated/translations.g.dart';

/// 今日总结卡片组件
class TodaySummaryCard extends StatelessWidget {
  final double revenue;
  final double dishAverageRating;
  final double staffAverageRating;

  const TodaySummaryCard({
    super.key,
    required this.revenue,
    required this.dishAverageRating,
    required this.staffAverageRating,
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
              t.statistics.todaySummary,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: AppConstants.defaultPadding),
            _buildRevenueItem(context, t, theme),
            const Divider(height: 24),
            _buildRatingItem(
              context,
              t.statistics.dishAvgRating,
              dishAverageRating,
              Icons.restaurant,
              theme,
            ),
            const SizedBox(height: 12),
            _buildRatingItem(
              context,
              t.statistics.staffAvgRating,
              staffAverageRating,
              Icons.person,
              theme,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRevenueItem(BuildContext context, Translations t, ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          t.statistics.revenue,
          style: theme.textTheme.bodyLarge,
        ),
        Text(
          '¥${revenue.toStringAsFixed(2)}',
          style: theme.textTheme.headlineMedium?.copyWith(
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildRatingItem(
    BuildContext context,
    String label,
    double rating,
    IconData icon,
    ThemeData theme,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Row(
        children: [
          Icon(icon, size: 20, color: theme.colorScheme.onSurfaceVariant),
          const SizedBox(width: 8),
          Text(
            label,
            style: theme.textTheme.bodyLarge,
          ),
        ],
      ),
      Row(
        children: [
          Text(
            rating.toStringAsFixed(1),
            style: theme.textTheme.titleMedium?.copyWith(
              color: _getRatingColor(rating),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 4),
          _buildStars(rating),
        ],
      ),
    ],
    );
  }

  Widget _buildStars(double rating) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        final starValue = index + 1;
        if (rating >= starValue) {
          return const Icon(Icons.star, size: 16, color: Colors.amber);
        } else if (rating >= starValue - 0.5) {
          return const Icon(Icons.star_half, size: 16, color: Colors.amber);
        } else {
          return const Icon(Icons.star_border, size: 16, color: Colors.amber);
        }
      }),
    );
  }

  Color _getRatingColor(double rating) {
    if (rating >= 4.0) return Colors.green;
    if (rating >= 3.0) return Colors.orange;
    return Colors.red;
  }
}
