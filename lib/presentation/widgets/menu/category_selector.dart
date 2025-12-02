import 'package:flutter/material.dart';
import 'package:foodieconnect/core/theme/app_theme.dart';
import 'package:foodieconnect/presentation/providers/menu_provider.dart';
import 'package:foodieconnect/l10n/generated/translations.g.dart';

/// 分类选择器组件
class CategorySelector extends StatelessWidget {
  final MenuProvider provider;
  final int? selectedCategoryId;
  final ValueChanged<int> onCategorySelected;

  const CategorySelector({
    super.key,
    required this.provider,
    this.selectedCategoryId,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context).menu;

    if (provider.categories.isEmpty) {
      return _buildLoadingState(context, t);
    }

    final selectedCategory = provider.categories.firstWhere(
      (c) => c.id == selectedCategoryId,
      orElse: () => provider.categories.first,
    );

    return GestureDetector(
      onTap: () => _showCategoryBottomSheet(context, provider, t),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: selectedCategoryId != null
                ? AppTheme.primaryColor.withValues(alpha: 0.5)
                : Colors.grey.shade300,
          ),
        ),
        child: Row(
          children: [
            Icon(
              Icons.category_outlined,
              color: selectedCategoryId != null
                  ? AppTheme.primaryColor
                  : Colors.grey.shade500,
              size: 20,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    t.category,
                    style: TextStyle(
                      fontSize: 12,
                      color: selectedCategoryId != null
                          ? AppTheme.primaryColor
                          : Colors.grey.shade600,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    selectedCategory.name,
                    style: TextStyle(
                      fontSize: 16,
                      color: selectedCategoryId != null
                          ? Colors.black87
                          : Colors.grey.shade600,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              color: selectedCategoryId != null
                  ? AppTheme.primaryColor
                  : Colors.grey.shade500,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingState(BuildContext context, dynamic t) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Icon(Icons.category_outlined, color: Colors.grey.shade500, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  t.category,
                  style: TextStyle(
                    fontSize: 12,
                    color: AppTheme.primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  t.loadingCategories,
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 24,
            height: 24,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(AppTheme.primaryColor),
            ),
          ),
        ],
      ),
    );
  }

  void _showCategoryBottomSheet(
    BuildContext context,
    MenuProvider provider,
    dynamic t,
  ) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(top: 12),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              t.selectCategory,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: provider.categories.length,
                itemBuilder: (context, index) {
                  final category = provider.categories[index];
                  final isSelected = category.id == selectedCategoryId;

                  return ListTile(
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppTheme.primaryColor.withValues(alpha: 0.1)
                            : Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.category_outlined,
                        color: isSelected
                            ? AppTheme.primaryColor
                            : Colors.grey.shade600,
                      ),
                    ),
                    title: Text(
                      category.name,
                      style: TextStyle(
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: isSelected
                            ? AppTheme.primaryColor
                            : Colors.black87,
                      ),
                    ),
                    trailing: isSelected
                        ? Icon(Icons.check, color: AppTheme.primaryColor)
                        : null,
                    onTap: () {
                      onCategorySelected(category.id);
                      Navigator.of(context).pop();
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
