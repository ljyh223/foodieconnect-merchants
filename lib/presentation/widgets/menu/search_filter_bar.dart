import 'package:flutter/material.dart';
import 'package:foodieconnect/core/constants/app_constants.dart';
import 'package:foodieconnect/presentation/providers/menu_provider.dart';

/// 搜索筛选栏组件
class SearchFilterBar extends StatelessWidget {
  final MenuProvider provider;

  const SearchFilterBar({
    super.key,
    required this.provider,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppConstants.defaultPadding),
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          children: [
            // 搜索框
            TextField(
              onChanged: (value) {
                // 搜索菜品
                provider.searchMenuItems(value);
              },
              decoration: const InputDecoration(
                hintText: '搜索菜品',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
           
            const SizedBox(height: AppConstants.defaultPadding / 2),
           
            // 筛选按钮
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // 筛选可用菜品
                      provider.filterByAvailability(true);
                    },
                    child: const Text('可售菜品'),
                  ),
                ),
                const SizedBox(width: AppConstants.defaultPadding / 2),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // 筛选售罄菜品
                      provider.filterByAvailability(false);
                    },
                    child: const Text('售罄菜品'),
                  ),
                ),
                const SizedBox(width: AppConstants.defaultPadding / 2),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // 筛选推荐菜品
                      provider.filterByRecommended(true);
                    },
                    child: const Text('推荐菜品'),
                  ),
                ),
                const SizedBox(width: AppConstants.defaultPadding / 2),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // 清除筛选
                      provider.clearFilters();
                    },
                    child: const Text('全部菜品'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}