import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:foodieconnect/core/constants/app_constants.dart';
import 'package:foodieconnect/core/theme/app_theme.dart';
import 'package:foodieconnect/presentation/providers/menu_provider.dart';
import 'package:foodieconnect/data/models/menu/menu_category_model.dart';
import 'package:foodieconnect/data/models/menu/menu_category_request.dart';

/// 菜单分类管理页面
class MenuCategoryScreen extends StatelessWidget {
  const MenuCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MenuProvider>(
      builder: (context, provider, child) {
        if (provider.categories.isEmpty && !provider.isCategoryLoading) {
          Future.microtask(() {
            if (context.mounted) {
              Provider.of<MenuProvider>(context, listen: false).loadCategories();
            }
          });
        }
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
          body: _buildBody(context, provider),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context, MenuProvider provider) {
    if (provider.isCategoryLoading && provider.categories.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('加载分类中...'),
          ],
        ),
      );
    }

    if (provider.errorMessage != null && provider.categories.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 64,
              color: AppTheme.errorColor,
            ),
            const SizedBox(height: AppConstants.defaultPadding),
            Text(
              provider.errorMessage!,
              style: const TextStyle(fontSize: 16, color: AppTheme.errorColor),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppConstants.defaultPadding),
            ElevatedButton(
              onPressed: () {
                Provider.of<MenuProvider>(context, listen: false).loadCategories();
              },
              child: const Text('重试'),
            ),
          ],
        ),
      );
    }

    if (provider.categories.isEmpty) {
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
              '暂无分类，点击右上角添加',
              style: TextStyle(fontSize: 16, color: AppTheme.textSecondary),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(AppConstants.defaultPadding),
      itemCount: provider.categories.length,
      itemBuilder: (context, index) {
        final category = provider.categories[index];
        return Card(
          child: ListTile(
            title: Text(category.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (category.description != null && category.description!.isNotEmpty)
                  Text(category.description!),
                Text('排序: ${category.sortOrder}')
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Switch(
                  value: category.isActive,
                  onChanged: (value) {
                    _toggleCategoryStatus(context, category, provider);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    _showEditCategoryDialog(context, category);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete_outline),
                  color: AppTheme.errorColor,
                  onPressed: () {
                    _showDeleteConfirmation(context, category, provider);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// 显示添加分类对话框
  void _showAddCategoryDialog(BuildContext context) {
    final nameController = TextEditingController();
    final descController = TextEditingController();
    final sortController = TextEditingController(text: '0');
    bool isActive = true;

    showDialog(
      context: context,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (ctx, setState) {
            return AlertDialog(
              title: const Text('添加分类'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: '分类名称',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: descController,
                      decoration: const InputDecoration(
                        labelText: '描述',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: sortController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: '排序',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        const Text('启用'),
                        const SizedBox(width: 8),
                        Switch(
                          value: isActive,
                          onChanged: (v) => setState(() => isActive = v),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(ctx).pop(),
                  child: const Text('取消'),
                ),
                TextButton(
                  onPressed: () async {
                    final name = nameController.text.trim();
                    final sort = int.tryParse(sortController.text.trim()) ?? 0;
                    if (name.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('请输入分类名称')),
                      );
                      return;
                    }
                    final request = MenuCategoryRequest(
                      name: name,
                      description: descController.text.trim().isEmpty
                          ? null
                          : descController.text.trim(),
                      sortOrder: sort,
                      isActive: isActive,
                    );
                    final ok = await Provider.of<MenuProvider>(context, listen: false)
                        .createCategory(request);
                    if (ok && context.mounted) {
                      Navigator.of(ctx).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('分类添加成功')),
                      );
                    }
                  },
                  child: const Text('保存'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  /// 显示编辑分类对话框
  void _showEditCategoryDialog(BuildContext context, MenuCategoryModel category) {
    final nameController = TextEditingController(text: category.name);
    final descController = TextEditingController(text: category.description ?? '');
    final sortController = TextEditingController(text: category.sortOrder.toString());
    bool isActive = category.isActive;

    showDialog(
      context: context,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (ctx, setState) {
            return AlertDialog(
              title: const Text('编辑分类'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: '分类名称',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: descController,
                      decoration: const InputDecoration(
                        labelText: '描述',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: sortController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: '排序',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        const Text('启用'),
                        const SizedBox(width: 8),
                        Switch(
                          value: isActive,
                          onChanged: (v) => setState(() => isActive = v),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(ctx).pop(),
                  child: const Text('取消'),
                ),
                TextButton(
                  onPressed: () async {
                    final name = nameController.text.trim();
                    final sort = int.tryParse(sortController.text.trim()) ?? 0;
                    if (name.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('请输入分类名称')),
                      );
                      return;
                    }
                    final request = MenuCategoryRequest(
                      name: name,
                      description: descController.text.trim().isEmpty
                          ? null
                          : descController.text.trim(),
                      sortOrder: sort,
                      isActive: isActive,
                    );
                    final ok = await Provider.of<MenuProvider>(context, listen: false)
                        .updateCategory(category.id, request);
                    if (ok && context.mounted) {
                      Navigator.of(ctx).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('分类更新成功')),
                      );
                    }
                  },
                  child: const Text('保存'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  /// 切换分类状态
  void _toggleCategoryStatus(BuildContext context, MenuCategoryModel category, MenuProvider provider) async {
    final newStatus = !category.isActive;
    final ok = await provider.toggleCategoryStatus(category.id, newStatus);
    if (ok && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('分类${newStatus ? '已启用' : '已禁用'}'),
          backgroundColor: newStatus ? AppTheme.successColor : AppTheme.warningColor,
        ),
      );
    }
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
    final ok = await provider.deleteCategory(category.id);
    if (ok && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('分类 "${category.name}" 已删除'),
          backgroundColor: AppTheme.successColor,
        ),
      );
    }
  }
}
