import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:foodieconnect/core/theme/app_theme.dart';
import 'package:foodieconnect/presentation/providers/menu_provider.dart';
import 'package:foodieconnect/data/models/menu/menu_item_model.dart';
import 'package:foodieconnect/presentation/widgets/menu/item_form_dialog.dart';
import 'package:foodieconnect/presentation/widgets/menu/item_card.dart';
import 'package:foodieconnect/presentation/widgets/menu/search_filter_bar.dart';

/// 重构后的菜单列表页面
/// 使用提取的组件，代码更简洁、可维护
class MenuListScreenRefactored extends StatefulWidget {
  const MenuListScreenRefactored({super.key});

  @override
  State<MenuListScreenRefactored> createState() => _MenuListScreenRefactoredState();
}

class _MenuListScreenRefactoredState extends State<MenuListScreenRefactored> {
  bool _isInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialized) {
      // 延迟初始化，避免在build阶段触发状态更新
      Future.microtask(() {
        if (mounted && !_isInitialized) {
          _loadMenuData();
        }
      });
    }
  }

  /// 加载菜单数据
  void _loadMenuData() {
    final provider = Provider.of<MenuProvider>(context, listen: false);
    if (provider.menuItems.isEmpty) {
      provider.loadMenuItems(refresh: true);
    }
    _isInitialized = true;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MenuProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppTheme.surfaceColor,
          appBar: AppBar(
            title: const Text('菜单管理'),
            backgroundColor: AppTheme.primaryColor,
            foregroundColor: Colors.white,
            elevation: 0,
            actions: [
              IconButton(
                onPressed: () {
                  // 添加菜品
                  _showAddItemDialog(context);
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
    if (provider.isLoading && provider.menuItems.isEmpty) {
      return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('加载菜单中...'),
                ],
              ),
            );
    }

    if (provider.errorMessage != null) {
      return _buildErrorWidget(provider.errorMessage!);
    }

    if (provider.menuItems.isEmpty) {
      return _buildEmptyWidget();
    }

    return _buildMenuList(provider);
  }

  Widget _buildMenuList(MenuProvider provider) {
    return RefreshIndicator(
      onRefresh: () async {
        await provider.refreshMenuItems();
      },
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 搜索和筛选栏 - 使用提取的组件
          SearchFilterBar(provider: provider),
          
          // 菜品列表 - 使用提取的组件
          ...provider.menuItems.map((menuItem) => ItemCard(
            item: menuItem,
            onAction: (action) => _handleMenuItemAction(context, action, menuItem, provider),
          )),
        ],
      ),
    );
  }

  Widget _buildErrorWidget(String error) {
    return Builder(
      builder: (context) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                size: 64,
                color: AppTheme.errorColor,
              ),
              const SizedBox(height: 16),
              Text(
                error,
                style: const TextStyle(
                  fontSize: 16,
                  color: AppTheme.errorColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // 重新加载
                  if (context.mounted) {
                    Provider.of<MenuProvider>(context, listen: false).refreshMenuItems();
                  }
                },
                child: const Text('重试'),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildEmptyWidget() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.restaurant_menu,
            size: 64,
            color: AppTheme.textSecondary,
          ),
          SizedBox(height: 16),
          Text(
            '暂无菜品',
            style: TextStyle(
              fontSize: 16,
              color: AppTheme.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

void _showAddItemDialog(BuildContext context) {
  ItemFormDialog.show(
    context,
    item: null, // null表示添加模式
    onSave: (request) async {
      final ok = await Provider.of<MenuProvider>(context, listen: false).createMenuItem(request);
      if (!context.mounted) return;
      if (ok) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('菜品添加成功')));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('菜品添加失败')));
      }
    },
  );
}

  /// 处理菜品操作
  void _handleMenuItemAction(BuildContext context, String action, MenuItemModel menuItem, MenuProvider provider) {
    switch (action) {
      case 'edit':
        _showEditItemDialog(context, menuItem, provider);
        break;
      case 'enable':
      case 'disable':
        _toggleMenuItemStatus(context, menuItem, provider);
        break;
      case 'recommend':
      case 'unrecommend':
        _toggleRecommendedStatus(context, menuItem, provider);
        break;
      case 'delete':
        _showDeleteConfirmation(context, menuItem, provider);
        break;
    }
  }

void _showEditItemDialog(BuildContext context, MenuItemModel menuItem, MenuProvider provider) {
  ItemFormDialog.show(
    context,
    item: menuItem,
    onSave: (request) async {
      final ok = await Provider.of<MenuProvider>(context, listen: false)
          .updateMenuItem(menuItem.id, request);
      if (!context.mounted) return;
      if (ok) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('菜品更新成功')));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('菜品更新失败')));
      }
    },
  );
}

  /// 切换菜品状态
  void _toggleMenuItemStatus(BuildContext context, MenuItemModel menuItem, MenuProvider provider) async {
    final newStatus = !menuItem.isAvailable;
    
    final result = await provider.toggleMenuItemStatus(menuItem.id, newStatus);
    
    if (!context.mounted) return;
    
    if (result) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('菜品${newStatus ? '已启用' : '已停售'}'),
          backgroundColor: newStatus ? AppTheme.successColor : AppTheme.warningColor,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('操作失败，请重试'),
          backgroundColor: AppTheme.errorColor,
        ),
      );
    }
  }

  /// 切换推荐状态
  void _toggleRecommendedStatus(BuildContext context, MenuItemModel menuItem, MenuProvider provider) async {
    final newStatus = !menuItem.isRecommended;
    
    final result = await provider.setRecommendedMenuItem(menuItem.id, newStatus);
    
    if (!context.mounted) return;
    
    if (result) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('菜品${newStatus ? '已设为推荐' : '已取消推荐'}'),
          backgroundColor: AppTheme.warningColor,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('操作失败，请重试'),
          backgroundColor: AppTheme.errorColor,
        ),
      );
    }
  }

  /// 显示删除确认对话框
  void _showDeleteConfirmation(BuildContext context, MenuItemModel menuItem, MenuProvider provider) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('确认删除'),
          content: Text('确定要删除菜品 "${menuItem.name}" 吗？此操作不可恢复。'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('取消'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                await _deleteMenuItem(context, menuItem, provider);
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

  /// 删除菜品
  Future<void> _deleteMenuItem(BuildContext context, MenuItemModel menuItem, MenuProvider provider) async {
    final result = await provider.deleteMenuItem(menuItem.id);
    
    if (!context.mounted) return;
    
    if (result) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('菜品 "${menuItem.name}" 已删除'),
          backgroundColor: AppTheme.successColor,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('删除失败，请重试'),
          backgroundColor: AppTheme.errorColor,
        ),
      );
    }
  }
}