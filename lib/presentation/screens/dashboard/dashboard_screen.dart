import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:foodieconnect/core/constants/app_constants.dart';
import 'package:foodieconnect/core/theme/app_theme.dart';
import 'package:foodieconnect/core/utils/logger.dart';
import 'package:foodieconnect/l10n/generated/translations.g.dart';
import 'package:foodieconnect/presentation/providers/auth_provider.dart';
import 'package:foodieconnect/presentation/providers/restaurant_provider.dart';
import 'package:foodieconnect/presentation/providers/menu_provider.dart';
import 'package:foodieconnect/presentation/providers/staff_provider.dart';
import 'package:foodieconnect/presentation/providers/chat_provider.dart';
import 'package:foodieconnect/presentation/screens/restaurant/restaurant_info_screen.dart';
import 'package:foodieconnect/presentation/screens/staff/staff_list_screen.dart';
import 'package:foodieconnect/presentation/screens/statistics/statistics_overview_screen.dart';

import '../menu/menu_list_screen.dart';
import '../chat/chat_screen.dart';

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
    const MenuListScreen(),
    const StaffListScreen(),
    const StatisticsOverviewScreen(),
    const ChatScreen(),
  ];

  // 底部导航项 - 动态创建，使用多语言资源

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
      final restaurantProvider = Provider.of<RestaurantProvider>(
        context,
        listen: false,
      );
      final menuProvider = Provider.of<MenuProvider>(context, listen: false);
      final staffProvider = Provider.of<StaffProvider>(context, listen: false);
      final chatProvider = Provider.of<ChatProvider>(context, listen: false);

      if (authProvider.isLoggedIn) {
        restaurantProvider.loadRestaurant();
        menuProvider.loadMenuItems(refresh: true);
        staffProvider.loadStaffList(refresh: true);
        chatProvider.init();
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

  /// 构建页面内容
  Widget _buildPageContent() {
    return Consumer5<
      AuthProvider,
      RestaurantProvider,
      MenuProvider,
      StaffProvider,
      ChatProvider
    >(
      builder:
          (
            context,
            authProvider,
            restaurantProvider,
            menuProvider,
            staffProvider,
            chatProvider,
            child,
          ) {
            // 检查是否正在加载
            if (authProvider.isLoading ||
                restaurantProvider.isLoading ||
                menuProvider.isLoading ||
                staffProvider.isLoading ||
                chatProvider.isLoading) {
              final t = Translations.of(context);
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(),
                    const SizedBox(height: 16),
                    Text(t.common.loading),
                  ],
                ),
              );
            }

            // 检查是否有错误
            final hasError =
                authProvider.errorMessage != null ||
                restaurantProvider.errorMessage != null ||
                menuProvider.errorMessage != null ||
                staffProvider.errorMessage != null ||
                chatProvider.errorMessage != null;

            if (hasError) {
              return _buildErrorWidget();
            }

            return IndexedStack(index: _currentIndex, children: _pages);
          },
    );
  }

  /// 构建错误页面
  Widget _buildErrorWidget() {
    final t = Translations.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 64, color: AppTheme.errorColor),
          const SizedBox(height: AppConstants.defaultPadding),
          Text(
            t.common.loadFailed,
            style: const TextStyle(
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
            child: Text(t.common.retry),
          ),
        ],
      ),
    );
  }

  /// 构建底部导航栏
  Widget _buildBottomNavigationBar() {
    final t = Translations.of(context);

    final List<BottomNavigationBarItem> items = [
      BottomNavigationBarItem(
        icon: const Icon(Icons.restaurant),
        label: t.navigation.restaurant,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.restaurant_menu),
        label: t.navigation.menu,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.people),
        label: t.navigation.staff,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.analytics),
        label: t.navigation.statistics,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.chat),
        label: t.navigation.chat,
      ),
    ];

    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: _onBottomNavTap,
      type: BottomNavigationBarType.fixed,
      items: items,
      selectedItemColor: AppTheme.primaryColor,
      unselectedItemColor: AppTheme.textSecondary,
      backgroundColor: Colors.white,
      elevation: 8,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.surfaceColor,
      body: _buildPageContent(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}
