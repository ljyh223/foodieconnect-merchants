import 'package:flutter/material.dart';

import 'package:foodieconnectmerchant/core/theme/app_theme.dart';
import 'package:foodieconnectmerchant/l10n/generated/translations.g.dart';
import 'package:foodieconnectmerchant/core/constants/app_constants.dart';
import 'package:foodieconnectmerchant/data/storage/shared_preferences.dart';

/// 设置页面
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
      body: ListView(children: [_buildLanguageSetting(context, theme)]),
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
}
