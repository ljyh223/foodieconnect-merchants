import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:foodieconnect/core/theme/app_theme.dart';
import 'package:foodieconnect/core/utils/image_utils.dart';
import 'package:foodieconnect/presentation/providers/menu_provider.dart';
import 'package:foodieconnect/data/models/menu/menu_item_model.dart';
import 'package:foodieconnect/data/models/menu/menu_item_request.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

/// 菜品表单对话框组件
/// 统一处理添加和编辑菜品的表单逻辑
class ItemFormDialog extends StatefulWidget {
  /// 菜品数据，null表示添加，非null表示编辑
  final MenuItemModel? item;

  /// 保存回调
  final Function(MenuItemRequest) onSave;

  const ItemFormDialog({super.key, this.item, required this.onSave});

  @override
  State<ItemFormDialog> createState() => _ItemFormDialogState();

  /// 显示对话框 - 将静态方法移到 widget 类中
  static void show(
    BuildContext context, {
    MenuItemModel? item,
    required Function(MenuItemRequest) onSave,
  }) {
    showDialog(
      context: context,
      builder: (ctx) => ItemFormDialog(item: item, onSave: onSave),
    );
  }
}

class _ItemFormDialogState extends State<ItemFormDialog> {
  late final TextEditingController _nameController;
  late final TextEditingController _descController;
  late final TextEditingController _priceController;
  late final TextEditingController _originalPriceController;
  late final TextEditingController _sortController;
  late final TextEditingController _prepTimeController;
  late final TextEditingController _caloriesController;
  late final TextEditingController _imageUrlController;

  int? _selectedCategoryId;
  String? _selectedSpiceLevel;
  bool _isAvailable = true;
  bool _isRecommended = false;

  bool get _isEdit => widget.item != null;

  @override
  void initState() {
    super.initState();

    // 初始化控制器
    _nameController = TextEditingController(text: widget.item?.name ?? '');
    _descController = TextEditingController(
      text: widget.item?.description ?? '',
    );
    _priceController = TextEditingController(
      text: widget.item?.price.toString() ?? '',
    );
    _originalPriceController = TextEditingController(
      text: widget.item?.originalPrice == null
          ? ''
          : widget.item!.originalPrice!.toString(),
    );
    _sortController = TextEditingController(
      text: widget.item?.sortOrder.toString() ?? '0',
    );
    _prepTimeController = TextEditingController(
      text: widget.item?.preparationTime?.toString() ?? '',
    );
    _caloriesController = TextEditingController(
      text: widget.item?.calories?.toString() ?? '',
    );
    _imageUrlController = TextEditingController(
      text: widget.item?.imageUrl ?? '',
    );

    // 初始化状态
    _selectedCategoryId = widget.item?.categoryId;
    _selectedSpiceLevel = widget.item?.spiceLevel;
    _isAvailable = widget.item?.isAvailable ?? true;
    _isRecommended = widget.item?.isRecommended ?? false;
  }

  @override
  void dispose() {
    // 清理控制器
    _nameController.dispose();
    _descController.dispose();
    _priceController.dispose();
    _originalPriceController.dispose();
    _sortController.dispose();
    _prepTimeController.dispose();
    _caloriesController.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  /// 构建分组的UI组件
  Widget _buildSection({
    required String title,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppTheme.primaryColor,
          ),
        ),
        const SizedBox(height: 8),
        ...children,
      ],
    );
  }

  /// 处理图片上传
  Future<void> _handleImageUpload() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
    );
    if (picked == null) return;

    final file = File(picked.path);
    final provider = Provider.of<MenuProvider>(context, listen: false);
    final url = await provider.uploadMenuItemImage(file);

    if (!mounted) return;
    if (url != null) {
      _imageUrlController.text = url;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('图片上传成功')));
    }
  }

  /// 处理表单提交
  void _handleSubmit() {
    final name = _nameController.text.trim();
    final price = double.tryParse(
      _priceController.text.trim() == '' ? 'nan' : _priceController.text.trim(),
    );
    final originalPrice = _originalPriceController.text.trim().isEmpty
        ? null
        : double.tryParse(_originalPriceController.text.trim());
    final sortOrder = int.tryParse(_sortController.text.trim()) ?? 0;
    final preparationTime = _prepTimeController.text.trim().isEmpty
        ? null
        : int.tryParse(_prepTimeController.text.trim());
    final calories = _caloriesController.text.trim().isEmpty
        ? null
        : int.tryParse(_caloriesController.text.trim());

    if (name.isEmpty || price == null || _selectedCategoryId == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('请填写名称、价格并选择分类')));
      return;
    }

    final request = MenuItemRequest(
      name: name,
      description: _descController.text.trim().isEmpty
          ? null
          : _descController.text.trim(),
      price: price,
      originalPrice: originalPrice,
      categoryId: _selectedCategoryId!,
      imageUrl: _imageUrlController.text.trim().isEmpty
          ? null
          : _imageUrlController.text.trim(),
      isAvailable: _isAvailable,
      isRecommended: _isRecommended,
      sortOrder: sortOrder,
      nutritionInfo: null,
      allergenInfo: null,
      spiceLevel: _selectedSpiceLevel,
      preparationTime: preparationTime,
      calories: calories,
    );

    if (!request.isValid) {
      final msg = request.validationError ?? '数据校验失败';
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
      return;
    }

    widget.onSave(request);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MenuProvider>(context, listen: false);
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        viewInsets: EdgeInsets.zero, // 👈 让键盘不要影响 Dialog 位置
        padding: EdgeInsets.zero,   // 👈 移除系统padding影响
      ),
      child: Dialog(
        insetPadding: const EdgeInsets.all(12),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.9,
            maxHeight: MediaQuery.of(context).size.height * 0.6, // 你仍然可以控制高度
          ),
          child: Column(
            children: [
              _buildHeader(context), // 你自定义 Header 保持不参与键盘动画
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: _buildContent(provider), // 你的表单内容
                ),
              ),
              _buildFooterBottom(context), // 你的底部按钮栏也保持不动
            ],
          ),
        ),
      ),
    );

  }


  /// Header
  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: const BoxDecoration(
        color: AppTheme.primaryColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
      ),
      child: Row(
        children: [
          Text(
            _isEdit ? "编辑菜品" : "添加菜品",
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: const Text(
              "关闭",
              style: TextStyle(fontSize: 13, color: Colors.white70),
            ),
          ),
        ],
      ),
    );
  }

  /// Content
  Widget _buildContent(MenuProvider provider) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          _lightField(_nameController, "菜品名称 *"),
          const SizedBox(height: 6),
          _lightField(_descController, "描述", maxLines: 2),
          const SizedBox(height: 6),

          _lightDropdown<int>(
            value: _selectedCategoryId,
            hint: "分类 *",
            items: provider.categories
                .map(
                  (c) => DropdownMenuItem(
                    value: c.id,
                    child: Text(c.name, style: const TextStyle(fontSize: 13)),
                  ),
                )
                .toList(),
            onChanged: (v) => setState(() => _selectedCategoryId = v),
          ),
          const SizedBox(height: 10),

          Row(
            children: [
              Expanded(
                child: _lightField(_priceController, "价格 *", isNumber: true),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: _lightField(
                  _originalPriceController,
                  "原价",
                  isNumber: true,
                ),
              ),
              const SizedBox(width: 6),
              SizedBox(
                width: 60,
                child: _lightField(_sortController, "排序", isNumber: true),
              ),
            ],
          ),
          const SizedBox(height: 6),

          Row(
            children: [
              Expanded(
                child: _lightField(
                  _prepTimeController,
                  "制作时间(分)",
                  isNumber: true,
                ),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: _lightField(_caloriesController, "热量", isNumber: true),
              ),
            ],
          ),
          const SizedBox(height: 10),

          _lightField(_imageUrlController, "图片 URL"),
          const SizedBox(height: 6),

          if (_imageUrlController.text.isNotEmpty)
            SizedBox(
              height: 75,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  ImageUtils.getFullImageUrl(_imageUrlController.text),
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const SizedBox(),
                ),
              ),
            ),

          const SizedBox(height: 10),

          Row(
            children: [
              Row(
                children: [
                  Checkbox(
                    visualDensity: const VisualDensity(
                      horizontal: -3,
                      vertical: -3,
                    ),
                    value: _isAvailable,
                    onChanged: (v) => setState(() => _isAvailable = v ?? false),
                  ),
                  const Text("可售", style: TextStyle(fontSize: 13)),
                ],
              ),
              const SizedBox(width: 10),
              Row(
                children: [
                  Checkbox(
                    visualDensity: const VisualDensity(
                      horizontal: -3,
                      vertical: -3,
                    ),
                    value: _isRecommended,
                    onChanged: (v) =>
                        setState(() => _isRecommended = v ?? false),
                  ),
                  const Text("推荐", style: TextStyle(fontSize: 13)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// FooterBottom
  Widget _buildFooterBottom(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("取消", style: TextStyle(fontSize: 13)),
          ),
          const SizedBox(width: 6),
          ElevatedButton(
            onPressed: _handleSubmit,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              minimumSize: const Size(0, 32),
              backgroundColor: AppTheme.primaryColor,
              foregroundColor: Colors.white,
              elevation: 0.6,
            ),
            child: const Text(
              "保存",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  /// 轻量输入框
  Widget _lightField(
    TextEditingController c,
    String label, {
    bool isNumber = false,
    int maxLines = 1,
  }) {
    final _node = FocusNode();
    return TextField(
      focusNode: _node,
      onTap: () {},
      controller: c,
      maxLines: maxLines,
      style: const TextStyle(fontSize: 14),
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
        isDense: true,
        filled: true,
        fillColor: Colors.grey.shade50,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
      ),
    );
  }

  /// 轻量下拉框
  Widget _lightDropdown<T>({
    required T? value,
    required String hint,
    required List<DropdownMenuItem<T>> items,
    required Function(T?) onChanged,
  }) {
    return DropdownButtonFormField<T>(
      value: value,
      isDense: true,
      dropdownColor: Colors.white,
      style: const TextStyle(fontSize: 14, color: Colors.black87),
      items: items,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hint,
        isDense: true,
        filled: true,
        fillColor: Colors.grey.shade50,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
      ),
    );
  }
}

class DropDownButtonDense<T> extends StatelessWidget {
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final String hint;
  final IconData icon;
  final Function(T?) onChange;
  const DropDownButtonDense({
    required this.value,
    required this.items,
    required this.hint,
    required this.icon,
    required this.onChange,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      isDense: true,
      style: const TextStyle(fontSize: 13, color: Colors.black),
      items: items,
      onChanged: onChange,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon, size: 16),
        contentPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    );
  }
}
