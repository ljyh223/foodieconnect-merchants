import 'package:flutter/material.dart';

import 'package:foodieconnect/core/theme/app_theme.dart';
import 'package:foodieconnect/l10n/generated/translations.g.dart';
import 'package:foodieconnect/core/constants/app_constants.dart';
import 'package:foodieconnect/data/storage/shared_preferences.dart';

/// 设置页面
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Scaffold(
      backgroundColor: AppTheme.surfaceColor,
      appBar: AppBar(
        title: Text(t.auth.settings),
        backgroundColor: AppTheme.primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(children: [_buildLanguageSetting(context)]),
    );
  }

  /// 构建语言设置选项
  Widget _buildLanguageSetting(BuildContext context) {
    final t = Translations.of(context);
    final currentLocale = LocaleSettings.currentLocale;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            t.auth.language,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        Card(
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(color: Colors.grey[200]!),
          ),
          child: Column(
            children: [
              _buildLanguageOption(
                context,
                '简体中文',
                AppLocale.zhCn,
                currentLocale == AppLocale.zhCn,
              ),
              const Divider(height: 1),
              _buildLanguageOption(
                context,
                '繁體中文',
                AppLocale.zhTw,
                currentLocale == AppLocale.zhTw,
              ),
              const Divider(height: 1),
              _buildLanguageOption(
                context,
                'English',
                AppLocale.en,
                currentLocale == AppLocale.en,
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
  ) {
    return ListTile(
      title: Text(languageName),
      trailing: isSelected
          ? const Icon(Icons.check, color: AppTheme.primaryColor)
          : null,
      onTap: () async {
        // 设置语言
        LocaleSettings.setLocale(locale);
        // 保存到本地存储
        await PrefsStorage.setString(AppConstants.languageKey, locale.toString());
      },
    );
  }
}
