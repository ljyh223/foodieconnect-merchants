import 'package:flutter/material.dart';
import 'package:foodieconnect/core/constants/app_constants.dart';
import 'package:foodieconnect/presentation/providers/menu_provider.dart';
import 'package:foodieconnect/l10n/generated/translations.g.dart';

/// 搜索筛选栏组件
class SearchFilterBar extends StatelessWidget {
  final MenuProvider provider;

  const SearchFilterBar({
    super.key,
    required this.provider,
  });

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context).menu;
    
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
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
                borderSide: const BorderSide(color: Colors.grey, width: 0.5),
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            ),
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
                ),
                const SizedBox(width: AppConstants.defaultPadding / 2),
                _buildFilterChip(
                  context: context,
                  label: t.unavailableItems,
                  onPressed: () => provider.filterByAvailability(false),
                ),
                const SizedBox(width: AppConstants.defaultPadding / 2),
                _buildFilterChip(
                  context: context,
                  label: t.recommendedItems,
                  onPressed: () => provider.filterByRecommended(true),
                ),
                const SizedBox(width: AppConstants.defaultPadding / 2),
                _buildFilterChip(
                  context: context,
                  label: t.allItems,
                  onPressed: () => provider.clearFilters(),
                  isPrimary: true,
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
  }) {
    return ActionChip(
      label: Text(
        label,
        style: TextStyle(
          color: isPrimary ? Colors.white : Colors.black87,
          fontSize: 14,
        ),
      ),
      backgroundColor: isPrimary ? Theme.of(context).primaryColor : Colors.grey[100],
      side: isPrimary ? null : BorderSide(color: Colors.grey[300]!),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
      ),
      onPressed: onPressed,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      labelPadding: EdgeInsets.zero,
    );
  }
}