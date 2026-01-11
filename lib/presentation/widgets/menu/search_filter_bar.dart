import 'package:flutter/material.dart';
import 'package:foodieconnectmerchant/core/constants/app_constants.dart';
import 'package:foodieconnectmerchant/presentation/providers/menu_provider.dart';
import 'package:foodieconnectmerchant/l10n/generated/translations.g.dart';

/// 搜索筛选栏组件
class SearchFilterBar extends StatelessWidget {
  final MenuProvider provider;

  const SearchFilterBar({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context).menu;
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: AppConstants.defaultPadding / 2),
      child: Column(
        children: [
          // 搜索框
          TextField(
            onChanged: (value) {
              // 搜索菜品
              provider.searchMenuItems(value);
            },
            decoration: InputDecoration(
              hintText: t.searchItems,
              prefixIcon: Icon(
                Icons.search,
                color: theme.colorScheme.onSurfaceVariant,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
                borderSide: BorderSide(
                  color: theme.colorScheme.outline,
                  width: 0.5,
                ),
              ),
              filled: true,
              fillColor: theme.colorScheme.surface,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 16,
              ),
              hintStyle: TextStyle(color: theme.colorScheme.onSurfaceVariant),
            ),
            style: TextStyle(color: theme.colorScheme.onSurface),
          ),

          const SizedBox(height: AppConstants.defaultPadding / 2),

          // 筛选按钮 - 使用流式布局，适应不同语言下的文本长度
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildFilterChip(
                  context: context,
                  label: t.availableItems,
                  onPressed: () => provider.filterByAvailability(true),
                  theme: theme,
                ),
                const SizedBox(width: AppConstants.defaultPadding / 2),
                _buildFilterChip(
                  context: context,
                  label: t.unavailableItems,
                  onPressed: () => provider.filterByAvailability(false),
                  theme: theme,
                ),
                const SizedBox(width: AppConstants.defaultPadding / 2),
                _buildFilterChip(
                  context: context,
                  label: t.recommendedItems,
                  onPressed: () => provider.filterByRecommended(true),
                  theme: theme,
                ),
                const SizedBox(width: AppConstants.defaultPadding / 2),
                _buildFilterChip(
                  context: context,
                  label: t.allItems,
                  onPressed: () => provider.clearFilters(),
                  isPrimary: true,
                  theme: theme,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 构建筛选Chip
  Widget _buildFilterChip({
    required BuildContext context,
    required String label,
    required VoidCallback onPressed,
    bool isPrimary = false,
    required ThemeData theme,
  }) {
    return ActionChip(
      label: Text(
        label,
        style: TextStyle(
          color: isPrimary
              ? theme.colorScheme.onPrimary
              : theme.colorScheme.onSurface,
          fontSize: 14,
        ),
      ),
      backgroundColor: isPrimary
          ? theme.colorScheme.primary
          : theme.colorScheme.surfaceContainerHighest,
      side: isPrimary ? null : BorderSide(color: theme.colorScheme.outline),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
      ),
      onPressed: onPressed,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      labelPadding: EdgeInsets.zero,
    );
  }
}
