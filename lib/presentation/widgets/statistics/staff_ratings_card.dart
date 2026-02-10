import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:foodieconnectmerchant/core/constants/app_constants.dart';
import 'package:foodieconnectmerchant/core/utils/image_utils.dart';
import 'package:foodieconnectmerchant/data/models/statistics/staff_ratings.dart';
import 'package:foodieconnectmerchant/l10n/generated/translations.g.dart';

/// 员工评分卡片组件
class StaffRatingsCard extends StatelessWidget {
  final StaffRatings staffRatings;

  const StaffRatingsCard({
    super.key,
    required this.staffRatings,
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
              t.statistics.staffRatings,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: AppConstants.defaultPadding),
            if (staffRatings.highest == null && staffRatings.lowest == null)
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
            else ...[
              if (staffRatings.highest != null) ...[
                _buildStaffItem(
                  context,
                  t.statistics.highestRated,
                  staffRatings.highest!,
                  Icons.arrow_upward,
                  Colors.green,
                  theme,
                ),
                if (staffRatings.lowest != null) const Divider(height: 24),
              ],
              if (staffRatings.lowest != null)
                _buildStaffItem(
                  context,
                  t.statistics.lowestRated,
                  staffRatings.lowest!,
                  Icons.arrow_downward,
                  Colors.red,
                  theme,
                ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildStaffItem(
    BuildContext context,
    String title,
    dynamic staff,
    IconData icon,
    Color color,
    ThemeData theme,
  ) {
    final avatarUrl = ImageUtils.getFullImageUrl(staff.avatarUrl);

    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: theme.colorScheme.surfaceContainerHighest,
          ),
          child: staff.avatarUrl != null && staff.avatarUrl!.isNotEmpty
              ? ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: avatarUrl,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                    errorWidget: (context, url, error) => Icon(
                      Icons.person,
                      size: 30,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                )
              : Icon(
                  Icons.person,
                  size: 30,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(icon, size: 16, color: color),
                  const SizedBox(width: 4),
                  Text(
                    title,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                staff.name,
                style: theme.textTheme.titleMedium,
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              staff.rating.toStringAsFixed(1),
              style: theme.textTheme.titleLarge?.copyWith(
                color: _getRatingColor(staff.rating),
                fontWeight: FontWeight.bold,
              ),
            ),
            _buildStars(staff.rating),
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
          return const Icon(Icons.star, size: 14, color: Colors.amber);
        } else if (rating >= starValue - 0.5) {
          return const Icon(Icons.star_half, size: 14, color: Colors.amber);
        } else {
          return const Icon(Icons.star_border, size: 14, color: Colors.amber);
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
