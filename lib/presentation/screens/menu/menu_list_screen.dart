import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:foodieconnect/core/constants/app_constants.dart';
import 'package:foodieconnect/core/theme/app_theme.dart';
import 'package:foodieconnect/core/utils/image_utils.dart';
import 'package:foodieconnect/presentation/providers/menu_provider.dart';
import 'package:foodieconnect/data/models/menu/menu_item_model.dart';

/// 菜单列表页面
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
    return Consumer<MenuProvider>(
      builder: (context, provider, child) {
        return Scaffold(
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

  Widget _buildSearchAndFilterBar(MenuProvider provider) {
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

  Widget _buildMenuList(MenuProvider provider) {
    return RefreshIndicator(
      onRefresh: () async {
        await provider.refreshMenuItems();
      },
      child: ListView(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        children: [
          // 搜索和筛选栏 - 作为列表的第一项
          _buildSearchAndFilterBar(provider),
          
          // 菜品列表
          ...provider.menuItems.map((menuItem) => _buildMenuItemCard(context, menuItem, provider)),
        ],
      ),
    );
  }

  Widget _buildMenuItemCard(BuildContext context, MenuItemModel menuItem, MenuProvider provider) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppConstants.defaultPadding / 2),
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 菜品头部信息
            Row(
              children: [
                // 菜品图片
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppConstants.smallRadius),
                  child: Image.network(
                    ImageUtils.getFullImageUrl(menuItem.imageUrl),
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 60,
                        height: 60,
                        color: AppTheme.surfaceColor,
                        child: const Icon(
                          Icons.restaurant,
                          color: AppTheme.textSecondary,
                        ),
                      );
                    },
                  ),
                ),
                
                const SizedBox(width: AppConstants.defaultPadding),
                
                // 菜品基本信息
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        menuItem.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      
                      const SizedBox(height: 4),
                      
                      // 价格信息
                      Row(
                        children: [
                          if (menuItem.hasDiscount) ...[
                            Text(
                              menuItem.originalPriceDisplay!,
                              style: const TextStyle(
                                fontSize: 12,
                                color: AppTheme.textSecondary,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            const SizedBox(width: 8),
                          ],
                          Text(
                            menuItem.priceDisplay,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.primaryColor,
                            ),
                          ),
                          
                          if (menuItem.hasDiscount) ...[
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: AppTheme.errorColor,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                menuItem.discountDisplay,
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
                
                // 操作按钮
                PopupMenuButton<String>(
                  icon: const Icon(Icons.more_vert),
                  onSelected: (value) => _handleMenuItemAction(context, value, menuItem, provider),
                  itemBuilder: (BuildContext context) => [
                    PopupMenuItem<String>(
                      value: 'edit',
                      child: Row(
                        children: [
                          const Icon(Icons.edit, size: 20),
                          const SizedBox(width: 8),
                          const Text('编辑'),
                        ],
                      ),
                    ),
                    PopupMenuItem<String>(
                      value: menuItem.isAvailable ? 'disable' : 'enable',
                      child: Row(
                        children: [
                          Icon(
                            menuItem.isAvailable ? Icons.block : Icons.check_circle,
                            size: 20,
                            color: menuItem.isAvailable ? AppTheme.errorColor : AppTheme.successColor,
                          ),
                          const SizedBox(width: 8),
                          Text(menuItem.isAvailable ? '停售' : '启用'),
                        ],
                      ),
                    ),
                    PopupMenuItem<String>(
                      value: menuItem.isRecommended ? 'unrecommend' : 'recommend',
                      child: Row(
                        children: [
                          Icon(
                            menuItem.isRecommended ? Icons.star_border : Icons.star,
                            size: 20,
                            color: AppTheme.warningColor,
                          ),
                          const SizedBox(width: 8),
                          Text(menuItem.isRecommended ? '取消推荐' : '设为推荐'),
                        ],
                      ),
                    ),
                    PopupMenuItem<String>(
                      value: 'delete',
                      child: Row(
                        children: [
                          const Icon(Icons.delete, size: 20, color: AppTheme.errorColor),
                          const SizedBox(width: 8),
                          const Text('删除', style: TextStyle(color: AppTheme.errorColor)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            
            // 菜品描述
            if (menuItem.description?.isNotEmpty == true) ...[
              const SizedBox(height: 8),
              Text(
                menuItem.description!,
                style: const TextStyle(
                  fontSize: 12,
                  color: AppTheme.textSecondary,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
            
            // 菜品状态标签和额外信息
            const SizedBox(height: 8),
            Row(
              children: [
                // 状态标签
                Wrap(
                  spacing: 8,
                  children: [
                    if (menuItem.isRecommended)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppTheme.warningColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          '推荐',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    
                    if (!menuItem.isAvailable)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppTheme.errorColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          '售罄',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    
                    if (menuItem.spiceLevel != null)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          menuItem.spiceLevelDisplay,
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    
                    if (menuItem.preparationTime != null)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppTheme.successColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          menuItem.preparationTimeDisplay,
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                  ],
                ),
                
                const Spacer(),
                
                // 创建时间
                if (menuItem.createdAt != null)
                  Text(
                    '创建: ${_formatDate(menuItem.createdAt!)}',
                    style: const TextStyle(
                      fontSize: 10,
                      color: AppTheme.textSecondary,
                    ),
                  ),
              ],
            ),
          ],
        ),
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
              const SizedBox(height: AppConstants.defaultPadding),
              Text(
                error,
                style: const TextStyle(
                  fontSize: 16,
                  color: AppTheme.errorColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppConstants.defaultPadding),
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
          SizedBox(height: AppConstants.defaultPadding),
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
    // TODO: 实现添加菜品对话框
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('添加菜品功能开发中...'),
      ),
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

  /// 显示编辑菜品对话框
  void _showEditItemDialog(BuildContext context, MenuItemModel menuItem, MenuProvider provider) {
    // TODO: 实现编辑菜品对话框
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('编辑菜品: ${menuItem.name}'),
      ),
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

  /// 格式化日期显示
  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);
    
    if (difference.inDays == 0) {
      return '今天';
    } else if (difference.inDays == 1) {
      return '昨天';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}天前';
    } else {
      return '${date.month}/${date.day}';
    }
  }
}