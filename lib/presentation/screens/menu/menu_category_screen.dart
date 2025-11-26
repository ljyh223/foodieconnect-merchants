import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:foodieconnect/core/constants/app_constants.dart';
import 'package:foodieconnect/core/theme/app_theme.dart';
import 'package:foodieconnect/presentation/providers/menu_provider.dart';
import 'package:foodieconnect/data/models/menu/menu_category_model.dart';

/// 菜单分类管理页面
class MenuCategoryScreen extends StatelessWidget {
  const MenuCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MenuProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: AppTheme.surfaceColor,
          appBar: AppBar(
            title: const Text('菜单分类管理'),
            backgroundColor: AppTheme.primaryColor,
            foregroundColor: Colors.white,
            elevation: 0,
            actions: [
              IconButton(
                onPressed: () {
                  _showAddCategoryDialog(context);
                },
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          body: _buildBody(provider),
        );
      },
    );
  }

  Widget _buildBody(MenuProvider provider) {
    // TODO: 实现分类列表显示
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.category,
            size: 64,
            color: AppTheme.textSecondary,
          ),
          SizedBox(height: AppConstants.defaultPadding),
          Text(
            '分类管理功能开发中...',
            style: TextStyle(
              fontSize: 16,
              color: AppTheme.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  /// 显示添加分类对话框
  void _showAddCategoryDialog(BuildContext context) {
    // TODO: 实现添加分类对话框
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('添加分类功能开发中...'),
      ),
    );
  }

  /// 显示编辑分类对话框
  void _showEditCategoryDialog(BuildContext context, MenuCategoryModel category) {
    // TODO: 实现编辑分类对话框
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('编辑分类: ${category.name}'),
      ),
    );
  }

  /// 切换分类状态
  void _toggleCategoryStatus(BuildContext context, MenuCategoryModel category, MenuProvider provider) async {
    final newStatus = !category.isActive;
    
    // TODO: 实现分类状态切换
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('分类${newStatus ? '已启用' : '已禁用'}'),
        backgroundColor: newStatus ? AppTheme.successColor : AppTheme.warningColor,
      ),
    );
  }

  /// 显示删除确认对话框
  void _showDeleteConfirmation(BuildContext context, MenuCategoryModel category, MenuProvider provider) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('确认删除'),
          content: Text('确定要删除分类 "${category.name}" 吗？此操作不可恢复。'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('取消'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                await _deleteCategory(context, category, provider);
              },
              style: TextButton.styleFrom(
                foregroundColor: AppTheme.errorColor,
              ),
              child: const Text('删除'),
            ),
          ],
        );
      },
    );
  }

  /// 删除分类
  Future<void> _deleteCategory(BuildContext context, MenuCategoryModel category, MenuProvider provider) async {
    // TODO: 实现分类删除
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('分类 "${category.name}" 已删除'),
        backgroundColor: AppTheme.successColor,
      ),
    );
  }
}