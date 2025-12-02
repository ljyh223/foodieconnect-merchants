import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:foodieconnect/core/theme/app_theme.dart';
import 'package:foodieconnect/data/models/restaurant/restaurant_model.dart';
import 'package:foodieconnect/data/models/restaurant/restaurant_update_request.dart';
import 'package:foodieconnect/presentation/providers/restaurant_provider.dart';
import 'package:foodieconnect/presentation/widgets/restaurant/restaurant_edit_form.dart';
import 'package:foodieconnect/l10n/generated/translations.g.dart';

/// 餐厅编辑页面
class RestaurantEditScreen extends StatefulWidget {
  final RestaurantModel? restaurant;

  const RestaurantEditScreen({
    super.key,
    this.restaurant,
  });

  @override
  State<RestaurantEditScreen> createState() => _RestaurantEditScreenState();
}

class _RestaurantEditScreenState extends State<RestaurantEditScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _hoursController = TextEditingController();

  String? _imageUrl;
  XFile? _selectedImage;
  bool _isImageChanged = false;
  bool _hasChanges = false;
  bool _isLoading = false;
  bool _isUploadingImage = false;
  double _uploadProgress = 0.0;

  @override
  void initState() {
    super.initState();
    _initializeForm();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _typeController.dispose();
    _descriptionController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    _hoursController.dispose();
    super.dispose();
  }

  /// 初始化表单数据
  void _initializeForm() {
    if (widget.restaurant != null) {
      final restaurant = widget.restaurant!;
      _nameController.text = restaurant.name;
      _typeController.text = restaurant.type;
      _descriptionController.text = restaurant.description ?? '';
      _addressController.text = restaurant.address;
      _phoneController.text = restaurant.phone;
      _hoursController.text = restaurant.hours ?? '';
      _imageUrl = restaurant.displayImage;
    }
  }

  /// 重置表单
  void _resetForm() {
    if (widget.restaurant != null) {
      final restaurant = widget.restaurant!;
      setState(() {
        _nameController.text = restaurant.name;
        _typeController.text = restaurant.type;
        _descriptionController.text = restaurant.description ?? '';
        _addressController.text = restaurant.address;
        _phoneController.text = restaurant.phone;
        _hoursController.text = restaurant.hours ?? '';
        _imageUrl = restaurant.displayImage;
        _selectedImage = null;
        _isImageChanged = false;
        _hasChanges = false;
        _isUploadingImage = false;
        _uploadProgress = 0.0;
      });
    }
  }

  /// 选择图片
  Future<void> _pickImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 800,
        maxHeight: 600,
        imageQuality: 85,
      );
      
      if (image != null) {
        setState(() {
          _selectedImage = image;
          _isImageChanged = true;
          _hasChanges = true;
        });
      }
    } catch (e) {
      _showErrorSnackBar('选择图片失败');
    }
  }

  /// 拍照
  Future<void> _takePhoto() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? photo = await picker.pickImage(
        source: ImageSource.camera,
        maxWidth: 800,
        maxHeight: 600,
        imageQuality: 85,
      );
      
      if (photo != null) {
        setState(() {
          _selectedImage = photo;
          _isImageChanged = true;
          _hasChanges = true;
        });
      }
    } catch (e) {
      _showErrorSnackBar('拍照失败');
    }
  }

  /// 图片选择回调
  void _onImageSelected(XFile? image) {
    setState(() {
      _selectedImage = image;
      _isImageChanged = image != null;
      _hasChanges = true;
    });
  }

  /// 表单变化回调
  void _onFormChanged(bool hasChanges) {
    setState(() {
      _hasChanges = hasChanges || _isImageChanged;
    });
  }

  /// 保存餐厅信息
  Future<void> _saveRestaurant() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final restaurantProvider = Provider.of<RestaurantProvider>(context, listen: false);
      
      // 如果有新图片，先上传图片
        if (_isImageChanged && _selectedImage != null) {
          setState(() {
            _isUploadingImage = true;
          });
          
          final imageSuccess = await restaurantProvider.updateRestaurantImage(_selectedImage!);
          
          setState(() {
            _isUploadingImage = false;
            // 更新本地_imageUrl为新上传的图片URL
            if (restaurantProvider.restaurant?.displayImage != null) {
              _imageUrl = restaurantProvider.restaurant!.displayImage;
            }
          });
          
          if (!imageSuccess) {
            if (mounted) {
              _showErrorSnackBar(restaurantProvider.errorMessage ?? '图片上传失败');
            }
            return;
          }
        }

      // 创建更新请求
      final request = RestaurantUpdateRequest(
        name: _nameController.text.trim(),
        type: _typeController.text.trim(),
        description: _descriptionController.text.trim().isEmpty
            ? null
            : _descriptionController.text.trim(),
        address: _addressController.text.trim(),
        phone: _phoneController.text.trim(),
        hours: _hoursController.text.trim().isEmpty
            ? null
            : _hoursController.text.trim(),
        imageUrl: _imageUrl,
      );

      // 更新餐厅信息
      final success = await restaurantProvider.updateRestaurant(request);
      
      if (success) {
        _showSuccessSnackBar('餐厅信息更新成功');
        if (mounted) {
          Navigator.of(context).pop(true);
        }
      } else {
        _showErrorSnackBar('餐厅信息更新失败');
      }
    } catch (e) {
      _showErrorSnackBar('保存失败，请稍后重试');
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
          _isUploadingImage = false;
          _uploadProgress = 0.0;
        });
      }
    }
  }

  /// 显示放弃更改确认对话框
  Future<void> _showDiscardConfirmationDialog() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(t.common.confirm),
        content: Text(t.restaurant.confirmDiscard),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(t.restaurant.keepEditing),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(t.restaurant.discard),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      Navigator.of(context).pop();
    }
  }

  /// 显示成功提示
  void _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppTheme.successColor,
      ),
    );
  }

  /// 显示错误提示
  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppTheme.errorColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(t.restaurant.editTitle),
        backgroundColor: AppTheme.primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          if (_hasChanges)
            TextButton(
              onPressed: _resetForm,
              child: Text(
                t.restaurant.reset,
                style: const TextStyle(color: Colors.white),
              ),
            ),
        ],
      ),
      body: PopScope(
        canPop: !_hasChanges,
        onPopInvokedWithResult: (didPop, result) {
          if (_hasChanges && !didPop) {
            _showDiscardConfirmationDialog();
          }
        },
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: RestaurantEditForm(
                restaurant: widget.restaurant,
                formKey: _formKey,
                nameController: _nameController,
                typeController: _typeController,
                descriptionController: _descriptionController,
                addressController: _addressController,
                phoneController: _phoneController,
                hoursController: _hoursController,
                imageUrl: _imageUrl,
                selectedImage: _selectedImage,
                isImageChanged: _isImageChanged,
                hasChanges: _hasChanges,
                onImageSelected: _onImageSelected,
                onPickImage: _pickImage,
                onTakePhoto: _takePhoto,
                onChanged: _onFormChanged,
              ),
            ),
            if (_isLoading)
              Container(
                color: Colors.black.withOpacity(0.3),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (_isUploadingImage) ...[
                        const Text(
                          '正在上传图片...',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                      const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        _isUploadingImage ? '图片上传中...' : '正在保存...',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: _isLoading ? null : _saveRestaurant,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primaryColor,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: _isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : Text(t.restaurant.save),
          ),
        ),
      ),
    );
  }
}