import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:foodieconnect/core/theme/app_theme.dart';
import 'package:foodieconnect/core/utils/image_utils.dart';
import 'package:foodieconnect/core/utils/logger.dart';
import 'package:foodieconnect/presentation/providers/menu_provider.dart';
import 'package:foodieconnect/data/models/menu/menu_item_model.dart';
import 'package:foodieconnect/data/models/menu/menu_item_request.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

/// 菜品表单页面 (全屏模式)
class MenuItemFormScreen extends StatefulWidget {
  final MenuItemModel? item;
  final Function(MenuItemRequest) onSave;

  const MenuItemFormScreen({super.key, this.item, required this.onSave});

  /// 静态跳转方法：方便你在原处直接调用
  /// 使用方法: MenuItemFormScreen.show(context, onSave: (req){...});
  static void show(
    BuildContext context, {
    MenuItemModel? item,
    required Function(MenuItemRequest) onSave,
  }) {
    // 使用 Navigator.push 打开新页面，自带原生流畅动画
    Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true, // 在iOS上呈现为模态页面效果(从下往上滑)，Android为普通页面
        builder: (ctx) => MenuItemFormScreen(item: item, onSave: onSave),
      ),
    );
  }

  @override
  State<MenuItemFormScreen> createState() => _MenuItemFormScreenState();
}

class _MenuItemFormScreenState extends State<MenuItemFormScreen> {
  // --- 控制器 ---
  late final TextEditingController _nameController;
  late final TextEditingController _descController;
  late final TextEditingController _priceController;
  late final TextEditingController _originalPriceController;
  late final TextEditingController _sortController;
  late final TextEditingController _prepTimeController;
  late final TextEditingController _caloriesController;

  String? _imageUrl;
  int? _selectedCategoryId;
  bool _isAvailable = true;
  bool _isRecommended = false;

  bool get _isEdit => widget.item != null;

  @override
  void initState() {
    super.initState();
    final item = widget.item;
    _nameController = TextEditingController(text: item?.name ?? '');
    _descController = TextEditingController(text: item?.description ?? '');
    _priceController = TextEditingController(
      text: item?.price.toString() ?? '',
    );
    _originalPriceController = TextEditingController(
      text: item?.originalPrice?.toString() ?? '',
    );
    _sortController = TextEditingController(
      text: item?.sortOrder.toString() ?? '0',
    );
    _prepTimeController = TextEditingController(
      text: item?.preparationTime?.toString() ?? '',
    );
    _caloriesController = TextEditingController(
      text: item?.calories?.toString() ?? '',
    );
    _imageUrl = item?.imageUrl;

    _selectedCategoryId = item?.categoryId;
    _isAvailable = item?.isAvailable ?? true;
    _isRecommended = item?.isRecommended ?? false;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    _priceController.dispose();
    _originalPriceController.dispose();
    _sortController.dispose();
    _prepTimeController.dispose();
    _caloriesController.dispose();
    super.dispose();
  }

  Future<void> _handleImageUpload() async {
    // 显示选择菜单
    final option = await showModalBottomSheet<int>(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('从相册选择'),
              onTap: () => Navigator.pop(context, 0),
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('拍照'),
              onTap: () => Navigator.pop(context, 1),
            ),
            ListTile(
              leading: const Icon(Icons.cancel),
              title: const Text('取消'),
              onTap: () => Navigator.pop(context, -1),
            ),
          ],
        ),
      ),
    );

    if (option == null || option == -1) return;

    final picker = ImagePicker();
    final picked = await picker.pickImage(
      source: option == 0 ? ImageSource.gallery : ImageSource.camera,
      imageQuality: 80,
    );

    if (picked == null) return;

    // 在异步操作前获取context引用
    final provider = Provider.of<MenuProvider>(context, listen: false);
    // 这里建议加一个 Loading 状态
    final url = await provider.uploadMenuItemImage(File(picked.path));
    if (!mounted) return;
    if (url != null) {
      setState(() => _imageUrl = url);
    }
  }

  void _handleSubmit() {
    // 基础验证
    if (_nameController.text.isEmpty ||
        _priceController.text.isEmpty ||
        _selectedCategoryId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('请填写名称、价格并选择分类'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final request = MenuItemRequest(
      name: _nameController.text,
      price: double.tryParse(_priceController.text) ?? 0,
      categoryId: _selectedCategoryId!,
      description: _descController.text,
      imageUrl: _imageUrl,
      isAvailable: _isAvailable,
      isRecommended: _isRecommended,
      sortOrder: int.tryParse(_sortController.text) ?? 0,
      originalPrice: double.tryParse(_originalPriceController.text),
      preparationTime: int.tryParse(_prepTimeController.text),
      calories: int.tryParse(_caloriesController.text),
    );

    // 使用模型内置的验证
    if (!request.isValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(request.validationError ?? '数据验证失败'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // 记录调试信息
    AppLogger.info('MenuItemFormScreen: 准备保存菜品 - ${request.toJson()}');

    widget.onSave(request);
    Navigator.of(context).pop(); // 关闭页面
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MenuProvider>(context, listen: false);

    // 确保分类数据已加载
    if (provider.categories.isEmpty) {
      // 使用 Future.delayed 确保在 build 完成后执行
      Future.delayed(Duration.zero, () {
        provider.loadCategories();
      });
    }

    return Scaffold(
      backgroundColor: Colors.grey.shade50, // 浅灰背景，突显白色输入框
      appBar: AppBar(
        title: Text(_isEdit ? "编辑菜品" : "添加新菜品"),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black, // 黑色标题和按钮
        actions: [
          TextButton(
            onPressed: _handleSubmit,
            child: const Text(
              "保存",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppTheme.primaryColor,
              ),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        // SafeArea 保证内容不会被 iPhone 底部横条或异形屏遮挡
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildSectionLabel("基本信息"),
            _buildCard(
              children: [
                _EfficientTextField(
                  controller: _nameController,
                  label: "菜品名称",
                  hint: "例如：招牌牛肉面",
                  helperText: "简短清晰的名称（必填）",
                  icon: Icons.restaurant_menu,
                ),
                const SizedBox(height: 16),
                Consumer<MenuProvider>(
                  builder: (context, provider, child) {
                    return _buildModernCategorySelector(provider);
                  },
                ),
                const SizedBox(height: 16),
                _EfficientTextField(
                  controller: _descController,
                  label: "菜品描述",
                  hint: "介绍食材、口味、分量等",
                  helperText: "将在点餐详情页展示",
                  icon: Icons.description_outlined,
                  maxLines: 3,
                ),
              ],
            ),

            _buildSectionLabel("价格与规格"),
            _buildCard(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _EfficientTextField(
                        controller: _priceController,
                        label: "现价",
                        hint: "0.00",
                        helperText: "实际售价",
                        icon: Icons.attach_money,
                        isNumber: true,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _EfficientTextField(
                        controller: _originalPriceController,
                        label: "原价",
                        hint: "0.00",
                        helperText: "展示划线价",
                        isNumber: true,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _EfficientTextField(
                        controller: _prepTimeController,
                        label: "制作时间",
                        hint: "分钟",
                        helperText: "预估耗时",
                        icon: Icons.timer_outlined,
                        isNumber: true,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _EfficientTextField(
                        controller: _caloriesController,
                        label: "热量",
                        hint: "Kcal",
                        helperText: "卡路里",
                        icon: Icons.local_fire_department_outlined,
                        isNumber: true,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            _buildSectionLabel("图片与设置"),
            _buildCard(
              children: [
                // 图片上传区域
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "菜品图片",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "上传清晰的菜品照片，有助于提升销量",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    const SizedBox(height: 12),
                    InkWell(
                      onTap: _handleImageUpload,
                      child: Container(
                        height: 120,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.grey.shade300,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.cloud_upload_outlined,
                                size: 36,
                                color: Colors.grey.shade400,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                _imageUrl != null ? "点击更换图片" : "点击上传图片",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "支持相册选择或拍照",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // 图片预览区
                    if (_imageUrl != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            ImageUtils.getFullImageUrl(_imageUrl!),
                            height: 150,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => Container(
                              height: 100,
                              color: Colors.grey.shade200,
                              alignment: Alignment.center,
                              child: const Text(
                                "图片无法加载",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),

                const Divider(height: 32),

                // 开关选项
                _buildSwitchTile(
                  "上架销售",
                  "关闭后顾客端将不可见",
                  _isAvailable,
                  (v) => setState(() => _isAvailable = v),
                ),
                _buildSwitchTile(
                  "店长推荐",
                  "在推荐栏目优先展示",
                  _isRecommended,
                  (v) => setState(() => _isRecommended = v),
                ),
                // 排序放到最后，因为改动频率较低
                const SizedBox(height: 8),
                _EfficientTextField(
                  controller: _sortController,
                  label: "排序权重",
                  hint: "0",
                  helperText: "数字越大越靠前",
                  icon: Icons.sort,
                  isNumber: true,
                ),
              ],
            ),
            // 底部留白，防止键盘遮挡最后一个元素
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // --- 辅助构建方法 ---

  Widget _buildSectionLabel(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 8, 0, 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.grey.shade600,
        ),
      ),
    );
  }

  // 白色卡片容器，让界面更有层次感
  Widget _buildCard({required List<Widget> children}) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }

  Widget _buildSwitchTile(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
      ),
      value: value,
      onChanged: onChanged,
      activeTrackColor: AppTheme.primaryColor,
      activeThumbColor: AppTheme.primaryColor,
      contentPadding: EdgeInsets.zero,
      dense: true,
    );
  }

  /// 现代化的分类选择器
  Widget _buildModernCategorySelector(MenuProvider provider) {
    if (provider.categories.isEmpty) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            Icon(
              Icons.category_outlined,
              color: Colors.grey.shade500,
              size: 20,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "所属分类",
                    style: TextStyle(
                      fontSize: 12,
                      color: AppTheme.primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "正在加载分类...",
                    style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(
                  AppTheme.primaryColor,
                ),
              ),
            ),
          ],
        ),
      );
    }

    final selectedCategory = provider.categories.firstWhere(
      (c) => c.id == _selectedCategoryId,
      orElse: () => provider.categories.first,
    );

    return GestureDetector(
      onTap: () => _showCategoryBottomSheet(provider),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: _selectedCategoryId != null
                ? AppTheme.primaryColor.withValues(alpha: 0.5)
                : Colors.grey.shade300,
          ),
        ),
        child: Row(
          children: [
            Icon(
              Icons.category_outlined,
              color: _selectedCategoryId != null
                  ? AppTheme.primaryColor
                  : Colors.grey.shade500,
              size: 20,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "所属分类",
                    style: TextStyle(
                      fontSize: 12,
                      color: _selectedCategoryId != null
                          ? AppTheme.primaryColor
                          : Colors.grey.shade600,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _selectedCategoryId != null
                        ? selectedCategory.name
                        : "请选择分类",
                    style: TextStyle(
                      fontSize: 16,
                      color: _selectedCategoryId != null
                          ? Colors.black87
                          : Colors.grey.shade600,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              color: _selectedCategoryId != null
                  ? AppTheme.primaryColor
                  : Colors.grey.shade500,
            ),
          ],
        ),
      ),
    );
  }

  /// 显示分类选择底部弹窗
  void _showCategoryBottomSheet(MenuProvider provider) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(top: 12),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "选择分类",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: provider.categories.length,
                itemBuilder: (context, index) {
                  final category = provider.categories[index];
                  final isSelected = category.id == _selectedCategoryId;

                  return ListTile(
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppTheme.primaryColor.withValues(alpha: 0.1)
                            : Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.category_outlined,
                        color: isSelected
                            ? AppTheme.primaryColor
                            : Colors.grey.shade600,
                      ),
                    ),
                    title: Text(
                      category.name,
                      style: TextStyle(
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: isSelected
                            ? AppTheme.primaryColor
                            : Colors.black87,
                      ),
                    ),
                    trailing: isSelected
                        ? Icon(Icons.check, color: AppTheme.primaryColor)
                        : null,
                    onTap: () {
                      setState(() => _selectedCategoryId = category.id);
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

/// 高效输入框组件 (保持不变，非常好用)
class _EfficientTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? hint;
  final String? helperText;
  final IconData? icon;
  final bool isNumber;
  final int maxLines;

  const _EfficientTextField({
    required this.controller,
    required this.label,
    this.hint,
    this.helperText,
    this.icon,
    this.isNumber = false,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: isNumber
          ? const TextInputType.numberWithOptions(decimal: true)
          : TextInputType.text,
      inputFormatters: isNumber
          ? [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))]
          : null,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        helperText: helperText,
        helperStyle: TextStyle(
          color: Colors.grey.shade500,
          fontSize: 11,
        ), // 你的要求：提示文字可见且不拥挤
        helperMaxLines: 1,
        prefixIcon: icon != null
            ? Icon(icon, size: 20, color: Colors.grey.shade500)
            : null,
        filled: true,
        fillColor: Colors.grey.shade50.withValues(alpha: 1.0), // 微微的灰色底色，区分输入区
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none, // 平时不显示边框，更干净
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: AppTheme.primaryColor, width: 1.5),
        ),
      ),
    );
  }
}
