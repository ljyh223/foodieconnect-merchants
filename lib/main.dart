import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'core/theme/app_theme.dart';
import 'core/constants/app_constants.dart';
import 'data/storage/shared_preferences.dart';
import 'data/services/api_service.dart';
import 'presentation/providers/auth_provider.dart';
import 'presentation/providers/restaurant_provider.dart';
import 'presentation/providers/menu_provider.dart';
import 'presentation/providers/staff_provider.dart';
import 'presentation/screens/auth/login_screen.dart';
import 'presentation/screens/dashboard/dashboard_screen.dart';

/// 应用入口点
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // 初始化本地存储
  await PrefsStorage.init();
  
  // 初始化API服务
  ApiService().init();
  
  // 创建并初始化AuthProvider
  final authProvider = AuthProvider();
  await authProvider.init();
  
  runApp(FoodieConnectApp(authProvider: authProvider));
}

/// 主应用组件
class FoodieConnectApp extends StatelessWidget {
  final AuthProvider authProvider;
  
  const FoodieConnectApp({
    super.key,
    required this.authProvider,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // 状态管理提供者 - 使用预初始化的AuthProvider
        ChangeNotifierProvider.value(value: authProvider),
        ChangeNotifierProvider(create: (_) => RestaurantProvider()),
        ChangeNotifierProvider(create: (_) => MenuProvider()),
        ChangeNotifierProvider(create: (_) => StaffProvider()),
      ],
      child: MaterialApp(
        title: AppConstants.appName,
        debugShowCheckedModeBanner: false,
        
        // 主题配置
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        
        // 国际化配置
        localizationsDelegates: const [
          // AppLocalizations.delegate, // 待生成后启用
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('zh', 'CN'), // 中文简体
          Locale('en', 'US'), // 英文
        ],
        
        // 路由配置
        home: Consumer<AuthProvider>(
          builder: (context, authProvider, child) {
            // 根据登录状态显示不同页面
            return authProvider.isLoggedIn
                ? const DashboardScreen()
                : const LoginScreen();
          },
        ),
        
        // 页面过渡动画
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) {
              switch (settings.name) {
                case '/login':
                  return const LoginScreen();
                case '/dashboard':
                  return const DashboardScreen();
                default:
                  return const LoginScreen();
              }
            },
          );
        },
      ),
    );
  }
}
