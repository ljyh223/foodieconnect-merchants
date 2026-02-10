import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:foodieconnectmerchant/core/theme/app_theme.dart';
import 'package:foodieconnectmerchant/presentation/providers/menu_provider.dart';
import 'package:foodieconnectmerchant/data/models/menu/menu_item_model.dart';
import 'package:foodieconnectmerchant/presentation/widgets/menu/item_card.dart';
import 'package:foodieconnectmerchant/presentation/widgets/menu/search_filter_bar.dart';
import 'package:foodieconnectmerchant/l10n/generated/translations.g.dart';

import 'menu_item_screen.dart';
import '../review/item_reviews_screen.dart';

/// 重构后的菜单列表页面
/// 使用提取的组件，代码更简洁、可维护
class MenuListScreen extends StatefulWidget {
  const MenuListScreen({super.key});

  @override
  State<MenuListScreen> createState() => _MenuListScreenState();
}

class _MenuListScreenState extends State<MenuListScreen> {
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
    final theme = Theme.of(context);
    return Consumer<MenuProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: theme.colorScheme.surface,
          appBar: AppBar(
            title: Text(Translations.of(context).menu.title),
            backgroundColor: theme.colorScheme.primary,
            foregroundColor: theme.colorScheme.onPrimary,
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
          body: _buildBody(provider, theme),
        );
      },
    );
  }

  Widget _buildBody(MenuProvider provider, ThemeData theme) {
    if (provider.isLoading && provider.menuItems.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(color: theme.colorScheme.primary),
            SizedBox(height: 16),
            Text(
              Translations.of(context).menu.loadingMenu,
              style: theme.textTheme.bodyLarge,
            ),
          ],
        ),
      );
    }

    if (provider.errorMessage != null) {
      return _buildErrorWidget(provider.errorMessage!, theme);
    }

    if (provider.menuItems.isEmpty) {
      return _buildEmptyWidget(theme);
    }

    return _buildMenuList(provider, theme);
  }

  Widget _buildMenuList(MenuProvider provider, ThemeData theme) {
    return RefreshIndicator(
      color: theme.colorScheme.primary,
      onRefresh: () async {
        await provider.refreshMenuItems();
      },
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 搜索和筛选栏 - 使用提取的组件
          SearchFilterBar(provider: provider),

          // 菜品列表 - 使用提取的组件
          ...provider.menuItems.map(
            (menuItem) => ItemCard(
              item: menuItem,
              onAction: (action) =>
                  _handleMenuItemAction(context, action, menuItem, provider),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorWidget(String error, ThemeData theme) {
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
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: AppTheme.errorColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // 重新加载
                  if (context.mounted) {
                    Provider.of<MenuProvider>(
                      context,
                      listen: false,
                    ).refreshMenuItems();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  foregroundColor: theme.colorScheme.onPrimary,
                ),
                child: Text(Translations.of(context).menu.retry),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildEmptyWidget(ThemeData theme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.restaurant_menu,
            size: 64,
            color: theme.colorScheme.onSurfaceVariant,
          ),
          SizedBox(height: 16),
          Text(
            Translations.of(context).menu.noItems,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  void _showAddItemDialog(BuildContext context) {
    MenuItemFormScreen.show(
      context,
      item: null, // null表示添加模式
      onSave: (request) async {
        final ok = await Provider.of<MenuProvider>(
          context,
          listen: false,
        ).createMenuItem(request);
        if (!context.mounted) return;
        if (ok) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(Translations.of(context).menu.itemAdded)),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(Translations.of(context).menu.itemAddFailed),
            ),
          );
        }
      },
    );
  }

  /// 处理菜品操作
  void _handleMenuItemAction(
    BuildContext context,
    String action,
    MenuItemModel menuItem,
    MenuProvider provider,
  ) {
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
      case 'reviews':
        ItemReviewsScreen.show(
          context,
          itemId: menuItem.id,
          itemName: menuItem.name,
        );
        break;
      case 'delete':
        _showDeleteConfirmation(context, menuItem, provider);
        break;
    }
  }

  void _showEditItemDialog(
    BuildContext context,
    MenuItemModel menuItem,
    MenuProvider provider,
  ) {
    MenuItemFormScreen.show(
      context,
      item: menuItem,
      onSave: (request) async {
        final ok = await Provider.of<MenuProvider>(
          context,
          listen: false,
        ).updateMenuItem(menuItem.id, request);
        if (!context.mounted) return;
        if (ok) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(Translations.of(context).menu.itemUpdated)),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(Translations.of(context).menu.itemUpdateFailed),
            ),
          );
        }
      },
    );
  }

  /// 切换菜品状态
  void _toggleMenuItemStatus(
    BuildContext context,
    MenuItemModel menuItem,
    MenuProvider provider,
  ) async {
    final newStatus = !menuItem.isAvailable;

    final result = await provider.toggleMenuItemStatus(menuItem.id, newStatus);

    if (!context.mounted) return;

    if (result) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            newStatus
                ? Translations.of(context).menu.itemEnabled
                : Translations.of(context).menu.itemDisabled,
          ),
          backgroundColor: newStatus
              ? AppTheme.successColor
              : AppTheme.warningColor,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(Translations.of(context).menu.operationFailed),
          backgroundColor: AppTheme.errorColor,
        ),
      );
    }
  }

  /// 切换推荐状态
  void _toggleRecommendedStatus(
    BuildContext context,
    MenuItemModel menuItem,
    MenuProvider provider,
  ) async {
    final newStatus = !menuItem.isRecommended;

    final result = await provider.setRecommendedMenuItem(
      menuItem.id,
      newStatus,
    );

    if (!context.mounted) return;

    if (result) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            newStatus
                ? Translations.of(context).menu.itemSetAsRecommended
                : Translations.of(context).menu.itemUnsetAsRecommended,
          ),
          backgroundColor: AppTheme.warningColor,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(Translations.of(context).menu.operationFailed),
          backgroundColor: AppTheme.errorColor,
        ),
      );
    }
  }

  /// 显示删除确认对话框
  void _showDeleteConfirmation(
    BuildContext context,
    MenuItemModel menuItem,
    MenuProvider provider,
  ) {
    final theme = Theme.of(context);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: theme.colorScheme.surface,
          surfaceTintColor: theme.colorScheme.surface,
          title: Text(Translations.of(context).menu.confirmDelete),
          content: Text(
            Translations.of(
              context,
            ).menu.deleteConfirmMessage.replaceAll('{name}', menuItem.name),
            style: TextStyle(color: theme.colorScheme.onSurface),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              style: TextButton.styleFrom(
                foregroundColor: theme.colorScheme.onSurface,
              ),
              child: Text(Translations.of(context).menu.cancel),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                await _deleteMenuItem(context, menuItem, provider);
              },
              style: TextButton.styleFrom(foregroundColor: AppTheme.errorColor),
              child: Text(Translations.of(context).menu.delete),
            ),
          ],
        );
      },
    );
  }

  /// 删除菜品
  Future<void> _deleteMenuItem(
    BuildContext context,
    MenuItemModel menuItem,
    MenuProvider provider,
  ) async {
    final result = await provider.deleteMenuItem(menuItem.id);

    if (!context.mounted) return;

    if (result) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            Translations.of(
              context,
            ).menu.itemDeleted.replaceAll('{name}', menuItem.name),
          ),
          backgroundColor: AppTheme.successColor,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(Translations.of(context).menu.deleteFailed),
          backgroundColor: AppTheme.errorColor,
        ),
      );
    }
  }
}
