import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:foodieconnectmerchant/core/constants/app_constants.dart';
import 'package:foodieconnectmerchant/core/theme/app_theme.dart';
import 'package:foodieconnectmerchant/l10n/generated/translations.g.dart';
import 'package:foodieconnectmerchant/presentation/providers/auth_provider.dart';
import 'package:foodieconnectmerchant/presentation/screens/auth/login_screen.dart';
import 'package:foodieconnectmerchant/presentation/widgets/common/loading_indicator.dart';

/// 注册页面
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _restaurantNameController = TextEditingController();
  final _restaurantTypeController = TextEditingController();
  final _restaurantAddressController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _restaurantNameController.dispose();
    _restaurantTypeController.dispose();
    _restaurantAddressController.dispose();
    super.dispose();
  }

  /// 注册处理
  Future<void> _handleRegister() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final username = _usernameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text;
    final name = _nameController.text.trim();
    final phone = _phoneController.text.trim();
    final restaurantName = _restaurantNameController.text.trim();
    final restaurantType = _restaurantTypeController.text.trim();
    final restaurantAddress = _restaurantAddressController.text.trim();
    final t = Translations.of(context);

    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    final success = await authProvider.register(
      username: username,
      email: email,
      password: password,
      name: name,
      phone: phone.isEmpty ? null : phone,
      restaurantName: restaurantName,
      restaurantType: restaurantType,
      restaurantAddress: restaurantAddress,
    );

    if (success && mounted) {
      _showSuccess(t.auth.registerSuccess);
      _navigateToLogin();
    } else if (mounted) {
      final errorMessage = authProvider.errorMessage ?? t.auth.registerFailed;
      _showError(errorMessage);
    }
  }

  /// 导航到登录页
  void _navigateToLogin() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const LoginScreen()),
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

  /// 切换确认密码可见性
  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _obscureConfirmPassword = !_obscureConfirmPassword;
    });
  }

  /// 验证用户名
  String? _validateUsername(String? value) {
    final t = Translations.of(context);
    if (value == null || value.trim().isEmpty) {
      return t.auth.enterUsername;
    }
    if (value.trim().length < 3 || value.trim().length > 50) {
      return t.validation.usernameLength;
    }
    // 只能包含字母、数字和下划线
    if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(value.trim())) {
      return t.validation.usernameFormat;
    }
    return null;
  }

  /// 验证邮箱
  String? _validateEmail(String? value) {
    final t = Translations.of(context);
    if (value == null || value.trim().isEmpty) {
      return t.auth.enterEmail;
    }
    // 验证邮箱格式
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value.trim())) {
      return t.validation.email;
    }
    return null;
  }

  /// 验证密码
  String? _validatePassword(String? value) {
    final t = Translations.of(context);
    if (value == null || value.isEmpty) {
      return t.auth.enterPassword;
    }
    if (value.length < 6 || value.length > 20) {
      return t.validation.passwordLength;
    }
    // 必须同时包含字母和数字
    if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d).+$').hasMatch(value)) {
      return t.auth.passwordContentLetterNumber;
    }
    return null;
  }

  /// 验证确认密码
  String? _validateConfirmPassword(String? value) {
    final t = Translations.of(context);
    if (value == null || value.isEmpty) {
      return t.auth.enterConfirmPassword;
    }
    if (value != _passwordController.text) {
      return t.auth.passwordMismatch;
    }
    return null;
  }

  /// 验证姓名
  String? _validateName(String? value) {
    final t = Translations.of(context);
    if (value == null || value.trim().isEmpty) {
      return t.auth.enterName;
    }
    if (value.trim().length < 2 || value.trim().length > 100) {
      return t.validation.nameLength;
    }
    return null;
  }

  /// 验证手机号（可选）
  String? _validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return null; // 手机号是可选的
    }
    final t = Translations.of(context);
    // 验证手机号格式（11位数字，以1开头）
    if (!RegExp(r'^1[3-9]\d{9}$').hasMatch(value.trim())) {
      return t.validation.phoneFormat;
    }
    return null;
  }

  /// 验证餐厅名称
  String? _validateRestaurantName(String? value) {
    final t = Translations.of(context);
    if (value == null || value.trim().isEmpty) {
      return t.auth.enterRestaurantName;
    }
    if (value.trim().length < 2 || value.trim().length > 100) {
      return t.validation.nameLength;
    }
    return null;
  }

  /// 验证餐厅类型
  String? _validateRestaurantType(String? value) {
    final t = Translations.of(context);
    if (value == null || value.trim().isEmpty) {
      return t.auth.enterRestaurantType;
    }
    return null;
  }

  /// 验证餐厅地址
  String? _validateRestaurantAddress(String? value) {
    final t = Translations.of(context);
    if (value == null || value.trim().isEmpty) {
      return t.auth.enterRestaurantAddress;
    }
    return null;
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

                  const SizedBox(height: AppConstants.defaultPadding * 2),

                  // 注册表单
                  _buildRegisterForm(),

                  const SizedBox(height: AppConstants.defaultPadding * 2),

                  // 注册按钮
                  _buildRegisterButton(authProvider),

                  const SizedBox(height: AppConstants.defaultPadding),

                  // 已有账户？去登录
                  _buildLoginLink(),
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
    return Column(
      children: [
        // 应用Logo
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

        // 注册标题
        Text(
          Translations.of(context).auth.register,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: AppTheme.textSecondary,
          ),
        ),
      ],
    );
  }

  /// 构建注册表单
  Widget _buildRegisterForm() {
    return Column(
      children: [
        // 账户信息部分
        _buildAccountSection(),

        const SizedBox(height: AppConstants.defaultPadding),

        // 个人信息部分
        _buildPersonalSection(),

        const SizedBox(height: AppConstants.defaultPadding),

        // 餐厅信息部分
        _buildRestaurantSection(),
      ],
    );
  }

  /// 构建账户信息部分
  Widget _buildAccountSection() {
    final t = Translations.of(context);

    return _buildFormSection(
      title: t.auth.accountInfo,
      icon: Icons.account_circle,
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
          validator: _validateUsername,
          autofillHints: const [AutofillHints.username],
        ),

        const SizedBox(height: 12),

        // 邮箱输入框
        TextFormField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            labelText: t.auth.email,
            hintText: t.auth.enterEmail,
            prefixIcon: const Icon(Icons.email_outlined),
            border: const OutlineInputBorder(),
          ),
          validator: _validateEmail,
          autofillHints: const [AutofillHints.email],
        ),

        const SizedBox(height: 12),

        // 密码输入框
        TextFormField(
          controller: _passwordController,
          obscureText: _obscurePassword,
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.next,
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
          validator: _validatePassword,
          autofillHints: const [AutofillHints.newPassword],
        ),

        const SizedBox(height: 12),

        // 确认密码输入框
        TextFormField(
          controller: _confirmPasswordController,
          obscureText: _obscureConfirmPassword,
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            labelText: t.auth.confirmPassword,
            hintText: t.auth.enterConfirmPassword,
            prefixIcon: const Icon(Icons.lock_outline),
            suffixIcon: IconButton(
              icon: Icon(
                _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
              ),
              onPressed: _toggleConfirmPasswordVisibility,
            ),
            border: const OutlineInputBorder(),
          ),
          validator: _validateConfirmPassword,
        ),
      ],
    );
  }

  /// 构建个人信息部分
  Widget _buildPersonalSection() {
    final t = Translations.of(context);

    return _buildFormSection(
      title: t.auth.personalInfo,
      icon: Icons.person,
      children: [
        // 姓名输入框
        TextFormField(
          controller: _nameController,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            labelText: t.auth.name,
            hintText: t.auth.enterName,
            prefixIcon: const Icon(Icons.badge_outlined),
            border: const OutlineInputBorder(),
          ),
          validator: _validateName,
        ),

        const SizedBox(height: 12),

        // 手机号输入框（可选）
        TextFormField(
          controller: _phoneController,
          keyboardType: TextInputType.phone,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            labelText: t.auth.phone,
            prefixIcon: const Icon(Icons.phone_outlined),
            border: const OutlineInputBorder(),
          ),
          validator: _validatePhone,
          autofillHints: const [AutofillHints.telephoneNumber],
        ),
      ],
    );
  }

  /// 构建餐厅信息部分
  Widget _buildRestaurantSection() {
    final t = Translations.of(context);

    return _buildFormSection(
      title: t.auth.restaurantInfo,
      icon: Icons.store,
      children: [
        // 餐厅名称输入框
        TextFormField(
          controller: _restaurantNameController,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            labelText: t.auth.restaurantName,
            hintText: t.auth.enterRestaurantName,
            prefixIcon: const Icon(Icons.restaurant_outlined),
            border: const OutlineInputBorder(),
          ),
          validator: _validateRestaurantName,
        ),

        const SizedBox(height: 12),

        // 餐厅类型输入框
        TextFormField(
          controller: _restaurantTypeController,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            labelText: t.auth.restaurantType,
            hintText: t.auth.enterRestaurantType,
            prefixIcon: const Icon(Icons.category_outlined),
            border: const OutlineInputBorder(),
            helperText: '例如：中餐、西餐、日料、韩料等',
          ),
          validator: _validateRestaurantType,
        ),

        const SizedBox(height: 12),

        // 餐厅地址输入框
        TextFormField(
          controller: _restaurantAddressController,
          keyboardType: TextInputType.streetAddress,
          textInputAction: TextInputAction.done,
          maxLines: 2,
          decoration: InputDecoration(
            labelText: t.auth.restaurantAddress,
            hintText: t.auth.enterRestaurantAddress,
            prefixIcon: const Icon(Icons.location_on_outlined),
            border: const OutlineInputBorder(),
          ),
          validator: _validateRestaurantAddress,
          onFieldSubmitted: (_) => _handleRegister(),
        ),
      ],
    );
  }

  /// 构建表单部分（带标题和图标）
  Widget _buildFormSection({
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: theme.colorScheme.outline.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 部分标题
          Row(
            children: [
              Icon(icon, size: 20, color: theme.colorScheme.primary),
              const SizedBox(width: 8),
              Text(
                title,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // 表单字段
          ...children,
        ],
      ),
    );
  }

  /// 构建注册按钮
  Widget _buildRegisterButton(AuthProvider authProvider) {
    final t = Translations.of(context);
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: authProvider.isLoading ? null : _handleRegister,
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
                t.auth.register,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
      ),
    );
  }

  /// 构建登录链接
  Widget _buildLoginLink() {
    final t = Translations.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(t.auth.hasAccount),
        TextButton(
          onPressed: _navigateToLogin,
          child: Text(t.auth.goToLogin),
        ),
      ],
    );
  }
}
