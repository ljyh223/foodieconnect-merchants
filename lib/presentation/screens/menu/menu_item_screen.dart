import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:foodieconnect/core/theme/app_theme.dart';
import 'package:foodieconnect/core/utils/logger.dart';
import 'package:foodieconnect/presentation/providers/menu_provider.dart';
import 'package:foodieconnect/data/models/menu/menu_item_model.dart';
import 'package:foodieconnect/data/models/menu/menu_item_request.dart';
import 'package:foodieconnect/l10n/generated/translations.g.dart';
import 'package:foodieconnect/presentation/widgets/menu/efficient_text_field.dart';
import 'package:foodieconnect/presentation/widgets/menu/category_selector.dart';
import 'package:foodieconnect/presentation/widgets/menu/image_uploader.dart';

/// 菜品表单页面 (全屏模式)
class MenuItemFormScreen extends StatefulWidget {
  final MenuItemModel? item;
  final Function(MenuItemRequest) onSave;

  const MenuItemFormScreen({super.key, this.item, required this.onSave});

  static void show(
    BuildContext context, {
    MenuItemModel? item,
    required Function(MenuItemRequest) onSave,
  }) {
    Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
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

  void _handleSubmit() {
    // 基础验证
    if (_nameController.text.isEmpty ||
        _priceController.text.isEmpty ||
        _selectedCategoryId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(Translations.of(context).menu.fillNamePriceCategory),
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
          content: Text(
            request.validationError ??
                Translations.of(context).menu.validationFailed,
          ),
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
        title: Text(
          _isEdit
              ? Translations.of(context).menu.editMenuItem
              : Translations.of(context).menu.addNewMenuItem,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black, // 黑色标题和按钮
        actions: [
          TextButton(
            onPressed: _handleSubmit,
            child: Text(
              Translations.of(context).menu.save,
              style: const TextStyle(
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
            _buildSectionLabel(Translations.of(context).menu.basicInfo),
            _buildCard(
              children: [
                EfficientTextField(
                  controller: _nameController,
                  label: Translations.of(context).menu.itemName,
                  hint: Translations.of(context).menu.exampleItemName,
                  helperText: Translations.of(context).menu.shortClearName,
                  icon: Icons.restaurant_menu,
                ),
                const SizedBox(height: 16),
                Consumer<MenuProvider>(
                  builder: (context, provider, child) {
                    return CategorySelector(
                      provider: provider,
                      selectedCategoryId: _selectedCategoryId,
                      onCategorySelected: (id) {
                        setState(() => _selectedCategoryId = id);
                      },
                    );
                  },
                ),
                const SizedBox(height: 16),
                EfficientTextField(
                  controller: _descController,
                  label: Translations.of(context).menu.description,
                  hint: Translations.of(context).menu.enterDescription,
                  helperText: Translations.of(context).menu.displayInDetails,
                  icon: Icons.description_outlined,
                  maxLines: 3,
                ),
              ],
            ),

            _buildSectionLabel(Translations.of(context).menu.priceSpecs),
            _buildCard(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: EfficientTextField(
                        controller: _priceController,
                        label: Translations.of(context).menu.currentPrice,
                        hint: "0.00",
                        helperText: Translations.of(context).menu.actualPrice,
                        icon: Icons.attach_money,
                        isNumber: true,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: EfficientTextField(
                        controller: _originalPriceController,
                        label: Translations.of(context).menu.originalPrice,
                        hint: "0.00",
                        helperText: Translations.of(
                          context,
                        ).menu.showOriginalPrice,
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
                      child: EfficientTextField(
                        controller: _prepTimeController,
                        label: Translations.of(context).menu.prepTime,
                        hint: Translations.of(context).menu.minutes,
                        helperText: Translations.of(context).menu.estimatedTime,
                        icon: Icons.timer_outlined,
                        isNumber: true,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: EfficientTextField(
                        controller: _caloriesController,
                        label: Translations.of(context).menu.caloriesLabel,
                        hint: Translations.of(context).menu.kcal,
                        helperText: Translations.of(context).menu.calories,
                        icon: Icons.local_fire_department_outlined,
                        isNumber: true,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            _buildSectionLabel(Translations.of(context).menu.imageSettings),
            _buildCard(
              children: [
                Consumer<MenuProvider>(
                  builder: (context, provider, child) {
                    return ImageUploader(
                      imageUrl: _imageUrl,
                      onImageUploaded: (url) {
                        setState(() => _imageUrl = url);
                      },
                      provider: provider,
                    );
                  },
                ),

                const Divider(height: 32),

                // 开关选项
                _buildSwitchTile(
                  Translations.of(context).menu.onSale,
                  Translations.of(context).menu.hideFromCustomers,
                  _isAvailable,
                  (v) => setState(() => _isAvailable = v),
                ),
                _buildSwitchTile(
                  Translations.of(context).menu.managerRecommended,
                  Translations.of(context).menu.displayInRecommendations,
                  _isRecommended,
                  (v) => setState(() => _isRecommended = v),
                ),
                // 排序放到最后，因为改动频率较低
                const SizedBox(height: 8),
                EfficientTextField(
                  controller: _sortController,
                  label: Translations.of(context).menu.sortOrder,
                  hint: "0",
                  helperText: Translations.of(
                    context,
                  ).menu.numberGreaterMoreTop,
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
            color: Colors.black.withOpacity(0.03),
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
}
