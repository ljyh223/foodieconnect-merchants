import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:foodieconnect/core/theme/app_theme.dart';
import 'package:foodieconnect/core/extensions/string_extension.dart';
import 'package:foodieconnect/data/models/restaurant/restaurant_model.dart';
import 'package:foodieconnect/l10n/generated/translations.g.dart';

/// 餐厅编辑表单组件
class RestaurantEditForm extends StatefulWidget {
  final RestaurantModel? restaurant;
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController typeController;
  final TextEditingController descriptionController;
  final TextEditingController addressController;
  final TextEditingController phoneController;
  final TextEditingController hoursController;
  final String? imageUrl;
  final XFile? selectedImage;
  final bool isImageChanged;
  final bool hasChanges;
  final ValueChanged<XFile?> onImageSelected;
  final VoidCallback onPickImage;
  final VoidCallback onTakePhoto;
  final ValueChanged<bool> onChanged;

  const RestaurantEditForm({
    super.key,
    this.restaurant,
    required this.formKey,
    required this.nameController,
    required this.typeController,
    required this.descriptionController,
    required this.addressController,
    required this.phoneController,
    required this.hoursController,
    this.imageUrl,
    this.selectedImage,
    this.isImageChanged = false,
    this.hasChanges = false,
    required this.onImageSelected,
    required this.onPickImage,
    required this.onTakePhoto,
    required this.onChanged,
  });

  @override
  State<RestaurantEditForm> createState() => _RestaurantEditFormState();
}

class _RestaurantEditFormState extends State<RestaurantEditForm> {
  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return Form(
      key: widget.formKey,
      onChanged: () => widget.onChanged(true),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImageSection(context, t),
          const SizedBox(height: 24),
          _buildBasicInfoSection(context, t),
          const SizedBox(height: 24),
          _buildContactSection(context, t),
          const SizedBox(height: 24),
          _buildHoursSection(context, t),
        ],
      ),
    );
  }

  /// 构建图片选择区域
  Widget _buildImageSection(BuildContext context, Translations t) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.restaurant.image,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 12),
        GestureDetector(
          onTap: () => _showImageSourceDialog(context, t),
          child: Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: _buildImageContent(),
          ),
        ),
        if (widget.isImageChanged) ...[
          const SizedBox(height: 8),
          Text(
            t.common.imageChanged,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: AppTheme.successColor),
          ),
        ],
      ],
    );
  }

  /// 构建图片内容
  Widget _buildImageContent() {
    if (widget.selectedImage != null) {
      // 本地选择的图片使用 Image.file 显示
      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.file(
          File(widget.selectedImage!.path),
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return _buildPlaceholder();
          },
        ),
      );
    } else if (widget.imageUrl?.isNotEmpty == true) {
      // 网络图片使用 Image.network 显示
      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          widget.imageUrl!,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return _buildPlaceholder();
          },
        ),
      );
    } else {
      return _buildPlaceholder();
    }
  }

  /// 构建占位符
  Widget _buildPlaceholder() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.add_photo_alternate_outlined,
          size: 48,
          color: Colors.grey[400],
        ),
        const SizedBox(height: 8),
        Text(
          t.common.clickToUploadImage,
          style: TextStyle(color: Colors.grey[600], fontSize: 16),
        ),
      ],
    );
  }

  /// 显示图片来源选择对话框
  void _showImageSourceDialog(BuildContext context, Translations t) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: Text(t.restaurant.chooseFromGallery),
              onTap: () {
                Navigator.of(context).pop();
                widget.onPickImage();
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: Text(t.restaurant.takePhoto),
              onTap: () {
                Navigator.of(context).pop();
                widget.onTakePhoto();
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  /// 构建基本信息区域
  Widget _buildBasicInfoSection(BuildContext context, Translations t) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.common.basicInfo,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 12),
        TextFormField(
          controller: widget.nameController,
          decoration: InputDecoration(
            labelText: t.restaurant.name,
            hintText: '${t.restaurant.pleaseEnter}${t.restaurant.name}',
            border: const OutlineInputBorder(),
            prefixIcon: const Icon(Icons.restaurant),
          ),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return '${t.restaurant.name}${t.validation.required}';
            }
            if (value.trim().length < 2) {
              return t.validation.minLength.replaceAll('{min}', '2');
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: widget.typeController,
          decoration: InputDecoration(
            labelText: t.restaurant.type,
            hintText: '${t.restaurant.pleaseEnter}${t.restaurant.type}',
            border: const OutlineInputBorder(),
            prefixIcon: const Icon(Icons.category),
          ),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return '${t.restaurant.type}${t.validation.required}';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: widget.descriptionController,
          decoration: InputDecoration(
            labelText: t.restaurant.description,
            hintText: '${t.restaurant.pleaseEnter}${t.restaurant.description}',
            border: const OutlineInputBorder(),
            prefixIcon: const Icon(Icons.description),
          ),
          maxLines: 3,
        ),
      ],
    );
  }

  /// 构建联系信息区域
  Widget _buildContactSection(BuildContext context, Translations t) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.common.contactInfo,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 12),
        TextFormField(
          controller: widget.addressController,
          decoration: InputDecoration(
            labelText: t.restaurant.address,
            hintText: '${t.restaurant.pleaseEnter}${t.restaurant.address}',
            border: const OutlineInputBorder(),
            prefixIcon: const Icon(Icons.location_on),
          ),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return '${t.restaurant.address}${t.validation.required}';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: widget.phoneController,
          decoration: InputDecoration(
            labelText: t.restaurant.phone,
            hintText: '${t.restaurant.pleaseEnter}${t.restaurant.phone}',
            border: const OutlineInputBorder(),
            prefixIcon: const Icon(Icons.phone),
          ),
          keyboardType: TextInputType.phone,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return '${t.restaurant.phone}${t.validation.required}';
            }
            if (!value.isValidPhoneNumber) {
              return t.validation.phone;
            }
            return null;
          },
        ),
      ],
    );
  }

  /// 构建营业时间区域
  Widget _buildHoursSection(BuildContext context, Translations t) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.restaurant.hours,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 12),
        TextFormField(
          controller: widget.hoursController,
          decoration: InputDecoration(
            labelText: t.restaurant.hours,
            hintText: '${t.common.example}09:00-22:00',
            border: const OutlineInputBorder(),
            prefixIcon: const Icon(Icons.access_time),
            helperText: '${t.common.example}09:00-22:00',
          ),
        ),
      ],
    );
  }
}
