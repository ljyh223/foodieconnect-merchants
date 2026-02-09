import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:foodieconnectmerchant/core/theme/app_theme.dart';
import 'package:foodieconnectmerchant/l10n/generated/translations.g.dart';
import 'package:foodieconnectmerchant/core/constants/app_constants.dart';
import 'package:foodieconnectmerchant/data/storage/shared_preferences.dart';
import 'package:foodieconnectmerchant/presentation/providers/auth_provider.dart';
import 'package:foodieconnectmerchant/presentation/screens/auth/login_screen.dart';

/// 设置页面
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        title: Text(t.auth.settings),
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.onPrimary,
        elevation: 0,
      ),
      body: ListView(children: [
        _buildLanguageSetting(context, theme),
        const SizedBox(height: 24),
        _buildLogoutSection(context, theme),
      ]),
    );
  }

  /// 构建语言设置选项
  Widget _buildLanguageSetting(BuildContext context, ThemeData theme) {
    final t = Translations.of(context);
    final currentLocale = LocaleSettings.currentLocale;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            t.auth.language,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onSurface,
            ),
          ),
        ),
        Card(
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          elevation: 0,
          color: theme.colorScheme.surface,
          surfaceTintColor: theme.colorScheme.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(color: theme.colorScheme.outline),
          ),
          child: Column(
            children: [
              _buildLanguageOption(
                context,
                '简体中文',
                AppLocale.zhCn,
                currentLocale == AppLocale.zhCn,
                theme,
              ),
              const Divider(height: 1),
              _buildLanguageOption(
                context,
                '繁體中文',
                AppLocale.zhTw,
                currentLocale == AppLocale.zhTw,
                theme,
              ),
              const Divider(height: 1),
              _buildLanguageOption(
                context,
                'English',
                AppLocale.en,
                currentLocale == AppLocale.en,
                theme,
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// 构建语言选项
  Widget _buildLanguageOption(
    BuildContext context,
    String languageName,
    AppLocale locale,
    bool isSelected,
    ThemeData theme,
  ) {
    return ListTile(
      title: Text(
        languageName,
        style: TextStyle(color: theme.colorScheme.onSurface),
      ),
      trailing: isSelected
          ? Icon(Icons.check, color: theme.colorScheme.primary)
          : null,
      onTap: () async {
        // 设置语言
        LocaleSettings.setLocale(locale);
        // 保存到本地存储
        await PrefsStorage.setString(
          AppConstants.languageKey,
          locale.toString(),
        );
      },
    );
  }

  /// 构建退出登录部分
  Widget _buildLogoutSection(BuildContext context, ThemeData theme) {
    final t = Translations.of(context);
    final authProvider = Provider.of<AuthProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            t.auth.settings,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onSurface,
            ),
          ),
        ),
        Card(
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          elevation: 0,
          color: theme.colorScheme.surface,
          surfaceTintColor: theme.colorScheme.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(color: theme.colorScheme.outline),
          ),
          child: ListTile(
            leading: Icon(
              Icons.logout,
              color: theme.colorScheme.error,
            ),
            title: Text(
              t.auth.logout,
              style: TextStyle(
                color: theme.colorScheme.error,
              ),
            ),
            trailing: Icon(
              Icons.chevron_right,
              color: theme.colorScheme.onSurfaceVariant,
            ),
            onTap: authProvider.isLoading
                ? null
                : () => _showLogoutDialog(context, authProvider),
          ),
        ),
      ],
    );
  }

  /// 显示退出登录确认对话框
  Future<void> _showLogoutDialog(
    BuildContext context,
    AuthProvider authProvider,
  ) async {
    final t = Translations.of(context);

    return showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(t.auth.logout),
        content: Text(t.auth.logoutConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(t.auth.cancel),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(dialogContext).pop();
              await _handleLogout(context, authProvider);
            },
            child: Text(
              t.auth.confirm,
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ),
        ],
      ),
    );
  }

  /// 处理退出登录
  Future<void> _handleLogout(
    BuildContext context,
    AuthProvider authProvider,
  ) async {
    final t = Translations.of(context);
    final messenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);

    await authProvider.logout();

    if (!mounted) return;

    // 显示成功消息
    messenger.showSnackBar(
      SnackBar(
        content: Text(t.auth.logoutSuccess),
        backgroundColor: AppTheme.successColor,
        duration: const Duration(seconds: 2),
      ),
    );

    // 导航到登录页，清除所有路由栈
    navigator.pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (route) => false,
    );
  }
}
