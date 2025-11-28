import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:foodieconnect/core/constants/app_constants.dart';
import 'package:foodieconnect/core/theme/app_theme.dart';
import 'package:foodieconnect/core/utils/logger.dart';
import 'package:foodieconnect/presentation/providers/auth_provider.dart';
import 'package:foodieconnect/presentation/providers/restaurant_provider.dart';
import 'package:foodieconnect/presentation/providers/menu_provider.dart';
import 'package:foodieconnect/presentation/providers/staff_provider.dart';
import 'package:foodieconnect/presentation/screens/restaurant/restaurant_info_screen.dart';
import 'package:foodieconnect/presentation/screens/staff/staff_list_screen.dart';
import 'package:foodieconnect/presentation/screens/statistics/statistics_overview_screen.dart';

import '../menu/menu_list_screen_refactored.dart';

/// 仪表盘页面
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;
  bool _isInitialized = false; // 添加初始化标志

  // 页面列表
  final List<Widget> _pages = [
    const RestaurantInfoScreen(),
    const MenuListScreenRefactored(),
    const StaffListScreen(),
    const StatisticsOverviewScreen(),
  ];

  // 底部导航项
  final List<BottomNavigationBarItem> _bottomNavItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.restaurant),
      label: '餐厅',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.restaurant_menu),
      label: '菜单',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.people),
      label: '员工',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.analytics),
      label: '统计',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialized) {
      // 延迟初始化，避免在build阶段触发状态更新
      Future.microtask(() {
        if (mounted && !_isInitialized) {
          _initializeProviders();
        }
      });
    }
  }

  /// 初始化数据
  void _initializeData() {
    AppLogger.debug('DashboardScreen: 初始化数据');
  }

  /// 初始化Providers
  void _initializeProviders() async {
    try {
      // 检查widget是否仍然挂载
      if (!mounted) {
        AppLogger.debug('DashboardScreen: Widget已卸载，跳过初始化');
        return;
      }

      // AuthProvider已经在应用启动时初始化，这里需要加载餐厅、菜单和员工信息
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      final restaurantProvider = Provider.of<RestaurantProvider>(context, listen: false);
      final menuProvider = Provider.of<MenuProvider>(context, listen: false);
      final staffProvider = Provider.of<StaffProvider>(context, listen: false);
      
      if (authProvider.isLoggedIn) {
        restaurantProvider.loadRestaurant();
        menuProvider.loadMenuItems(refresh: true);
        staffProvider.loadStaffList(refresh: true);
      }

      _isInitialized = true; // 设置初始化完成标志
      AppLogger.info('DashboardScreen: Providers初始化完成');
    } catch (e) {
      // 只有在widget仍然挂载时才记录错误
      if (mounted) {
        AppLogger.error('DashboardScreen: Providers初始化失败', error: e);
      } else {
        AppLogger.debug('DashboardScreen: Widget已卸载，忽略初始化错误');
      }
    }
  }

  /// 处理底部导航切换
  void _onBottomNavTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  /// 登出处理
  Future<void> _handleLogout() async {
    final confirmed = await _showLogoutConfirmation();
    if (!confirmed) return;

    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    await authProvider.logout();

    // 重置所有Provider状态
    if (mounted) {
      if (context.mounted) {
              Provider.of<RestaurantProvider>(context, listen: false).reset();
              Provider.of<MenuProvider>(context, listen: false).reset();
              Provider.of<StaffProvider>(context, listen: false).reset();
            }
    }
  }

  /// 显示登出确认对话框
  Future<bool> _showLogoutConfirmation() async {
    return await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('确认登出'),
        content: const Text('您确定要退出登录吗？'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('取消'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('确定'),
          ),
        ],
      ),
    ) ?? false;
  }

  /// 构建应用栏
  PreferredSizeWidget _buildAppBar(AuthProvider authProvider) {
    return AppBar(
      title: Text(
        AppConstants.appName,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      backgroundColor: AppTheme.primaryColor,
      elevation: 0,
      actions: [
        // 用户信息或登出按钮
        PopupMenuButton<String>(
          icon: const Icon(Icons.account_circle, color: Colors.white),
          onSelected: (value) async {
            if (value == 'logout') {
              await _handleLogout();
            }
          },
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'profile',
              child: Row(
                children: [
                  Icon(Icons.person, size: 20),
                  SizedBox(width: 8),
                  Text('个人中心'),
                ],
              ),
            ),
            const PopupMenuItem(
              value: 'logout',
              child: Row(
                children: [
                  Icon(Icons.logout, size: 20),
                  SizedBox(width: 8),
                  Text('退出登录'),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// 构建页面内容
  Widget _buildPageContent() {
    return Consumer4<AuthProvider, RestaurantProvider, MenuProvider, StaffProvider>(
      builder: (context, authProvider, restaurantProvider, menuProvider, staffProvider, child) {
        // 检查是否正在加载
        if (authProvider.isLoading ||
            restaurantProvider.isLoading ||
            menuProvider.isLoading ||
            staffProvider.isLoading) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                const SizedBox(height: 16),
                Text('加载中...'),
              ],
            ),
          );
        }

        // 检查是否有错误
        final hasError = authProvider.errorMessage != null ||
            restaurantProvider.errorMessage != null ||
            menuProvider.errorMessage != null ||
            staffProvider.errorMessage != null;

        if (hasError) {
          return _buildErrorWidget();
        }

        return IndexedStack(
          index: _currentIndex,
          children: _pages,
        );
      },
    );
  }

  /// 构建错误页面
  Widget _buildErrorWidget() {
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
          const Text(
            '加载失败',
            style: TextStyle(
              fontSize: 18,
              color: AppTheme.errorColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: AppConstants.defaultPadding),
          ElevatedButton(
            onPressed: () {
              // 重新初始化数据
              if (mounted) {
                _initializeProviders();
              }
            },
            child: const Text('重试'),
          ),
        ],
      ),
    );
  }

  /// 构建底部导航栏
  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: _onBottomNavTap,
      type: BottomNavigationBarType.fixed,
      items: _bottomNavItems,
      selectedItemColor: AppTheme.primaryColor,
      unselectedItemColor: AppTheme.textSecondary,
      backgroundColor: Colors.white,
      elevation: 8,
    );
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      backgroundColor: AppTheme.surfaceColor,
      appBar: _buildAppBar(authProvider),
      body: _buildPageContent(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}