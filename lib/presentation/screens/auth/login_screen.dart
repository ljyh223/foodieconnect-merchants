import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:foodieconnectmerchant/core/constants/app_constants.dart';
import 'package:foodieconnectmerchant/core/theme/app_theme.dart';
import 'package:foodieconnectmerchant/core/utils/logger.dart';
import 'package:foodieconnectmerchant/l10n/generated/translations.g.dart';
import 'package:foodieconnectmerchant/presentation/providers/auth_provider.dart';
import 'package:foodieconnectmerchant/presentation/screens/auth/register_screen.dart';
import 'package:foodieconnectmerchant/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:foodieconnectmerchant/presentation/widgets/common/loading_indicator.dart';

/// 登录页面
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _rememberMe = false;

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  /// 初始化数据
  void _initializeData() {
    // 可以在这里添加记住密码的逻辑
    AppLogger.debug('LoginScreen: 初始化完成');
  }

  /// 登录处理
  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final username = _usernameController.text.trim();
    final password = _passwordController.text;
    final t = Translations.of(context);

    if (username.isEmpty || password.isEmpty) {
      _showError(t.auth.enterUsernameAndPassword);
      return;
    }

    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    final success = await authProvider.login(
      username: username,
      password: password,
    );

    if (success && mounted) {
      _showSuccess(t.auth.loginSuccess);
      _navigateToDashboard();
    } else if (mounted) {
      final errorMessage = authProvider.errorMessage ?? t.auth.loginFailed;
      _showError(errorMessage);
    }
  }

  /// 导航到仪表盘
  void _navigateToDashboard() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const DashboardScreen()),
    );
  }

  /// 显示成功消息
  void _showSuccess(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppTheme.successColor,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  /// 显示错误消息
  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppTheme.errorColor,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  /// 切换密码可见性
  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  /// 切换记住我状态
  void _toggleRememberMe() {
    setState(() {
      _rememberMe = !_rememberMe;
    });
  }

  /// 忘记密码处理
  void _handleForgotPassword() {
    // 可以在这里添加忘记密码的逻辑
    AppLogger.debug('LoginScreen: 忘记密码被点击');
    final t = Translations.of(context);
    _showInfo(t.auth.resetPasswordContactAdmin);
  }

  /// 显示信息消息
  void _showInfo(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppTheme.primaryColor,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      backgroundColor: AppTheme.surfaceColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppConstants.defaultPadding * 2),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Logo或标题
                  _buildHeader(),

                  const SizedBox(height: AppConstants.defaultPadding * 3),

                  // 登录表单
                  _buildLoginForm(authProvider),

                  const SizedBox(height: AppConstants.defaultPadding),

                  // 记住我和忘记密码
                  _buildOptions(),

                  const SizedBox(height: AppConstants.defaultPadding * 2),

                  // 登录按钮
                  _buildLoginButton(authProvider),

                  const SizedBox(height: 16),

                  // 注册链接
                  _buildRegisterLink(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// 构建头部
  Widget _buildHeader() {
    final t = Translations.of(context);
    return Column(
      children: [
        // 应用Logo（可以替换为实际的Logo）
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: AppTheme.primaryColor,
            borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
          ),
          child: const Icon(Icons.restaurant, size: 40, color: Colors.white),
        ),

        const SizedBox(height: AppConstants.defaultPadding),

        // 应用标题
        Text(
          AppConstants.appName,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: AppTheme.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: AppConstants.defaultPadding / 2),

        // 副标题
        Text(
          t.auth.merchantPlatform,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: AppTheme.textSecondary),
        ),
      ],
    );
  }

  /// 构建登录表单
  Widget _buildLoginForm(AuthProvider authProvider) {
    final t = Translations.of(context);
    return Column(
      children: [
        // 用户名输入框
        TextFormField(
          controller: _usernameController,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            labelText: t.auth.username,
            hintText: t.auth.enterUsername,
            prefixIcon: const Icon(Icons.person_outline),
            border: const OutlineInputBorder(),
          ),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return t.auth.enterUsername;
            }
            if (value.trim().length < 3) {
              return t.auth.usernameMinLength.replaceAll('{min}', '3');
            }
            return null;
          },
        ),

        const SizedBox(height: AppConstants.defaultPadding),

        // 密码输入框
        TextFormField(
          controller: _passwordController,
          obscureText: _obscurePassword,
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            labelText: t.auth.password,
            hintText: t.auth.enterPassword,
            prefixIcon: const Icon(Icons.lock_outline),
            suffixIcon: IconButton(
              icon: Icon(
                _obscurePassword ? Icons.visibility_off : Icons.visibility,
              ),
              onPressed: _togglePasswordVisibility,
            ),
            border: const OutlineInputBorder(),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return t.auth.enterPassword;
            }
            if (value.length < 6) {
              return t.auth.passwordMinLength.replaceAll('{min}', '6');
            }
            return null;
          },
          onFieldSubmitted: (_) => _handleLogin(),
        ),
      ],
    );
  }

  /// 构建选项区域
  Widget _buildOptions() {
    final t = Translations.of(context);
    return Row(
      children: [
        // 记住我
        Expanded(
          child: CheckboxListTile(
            value: _rememberMe,
            onChanged: (value) => _toggleRememberMe(),
            title: Text(t.auth.rememberMe),
            contentPadding: EdgeInsets.zero,
            dense: true,
          ),
        ),

        // 忘记密码
        TextButton(
          onPressed: _handleForgotPassword,
          child: Text(t.auth.forgotPasswordQuestion),
        ),
      ],
    );
  }

  /// 构建登录按钮
  Widget _buildLoginButton(AuthProvider authProvider) {
    final t = Translations.of(context);
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: authProvider.isLoading ? null : _handleLogin,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.primaryColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
          ),
        ),
        child: authProvider.isLoading
            ? const LoadingIndicator(color: Colors.white, size: 24)
            : Text(
                t.auth.login,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
      ),
    );
  }

  /// 构建注册链接
  Widget _buildRegisterLink() {
    final t = Translations.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(t.auth.noAccount),
        TextButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const RegisterScreen()),
            );
          },
          child: Text(t.auth.registerNow),
        ),
      ],
    );
  }
}
