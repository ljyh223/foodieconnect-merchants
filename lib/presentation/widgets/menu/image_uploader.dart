import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:foodieconnectmerchant/core/utils/image_utils.dart';
import 'package:foodieconnectmerchant/presentation/providers/menu_provider.dart';
import 'package:foodieconnectmerchant/l10n/generated/translations.g.dart';
import 'dart:io';

/// 图片上传组件
class ImageUploader extends StatelessWidget {
  final String? imageUrl;
  final ValueChanged<String> onImageUploaded;
  final MenuProvider provider;
  final ThemeData theme;

  const ImageUploader({
    super.key,
    this.imageUrl,
    required this.onImageUploaded,
    required this.provider,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context).menu;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.itemImage,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
            color: theme.colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          t.uploadClearPhoto,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 12),
        InkWell(
          onTap: () => _handleImageUpload(context, theme),
          child: Container(
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: theme.colorScheme.outline,
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
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    imageUrl != null
                        ? t.clickToChangeImage
                        : t.clickToUploadImage,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    t.supportAlbumCamera,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // 图片预览区
        if (imageUrl != null)
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                ImageUtils.getFullImageUrl(imageUrl!),
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  height: 100,
                  color: theme.colorScheme.surfaceVariant,
                  alignment: Alignment.center,
                  child: Text(
                    t.imageLoadFailed,
                    style: TextStyle(color: theme.colorScheme.onSurfaceVariant),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Future<void> _handleImageUpload(BuildContext context, ThemeData theme) async {
    final option = await showModalBottomSheet<int>(
      context: context,
      builder: (context) => SafeArea(
        child: Container(
          color: theme.colorScheme.surface,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(
                  Icons.photo_library,
                  color: theme.colorScheme.onSurface,
                ),
                title: Text(
                  Translations.of(context).menu.selectFromAlbum,
                  style: TextStyle(color: theme.colorScheme.onSurface),
                ),
                onTap: () => Navigator.pop(context, 0),
              ),
              ListTile(
                leading: Icon(
                  Icons.camera_alt,
                  color: theme.colorScheme.onSurface,
                ),
                title: Text(
                  Translations.of(context).menu.takePhoto,
                  style: TextStyle(color: theme.colorScheme.onSurface),
                ),
                onTap: () => Navigator.pop(context, 1),
              ),
              ListTile(
                leading: Icon(Icons.cancel, color: theme.colorScheme.onSurface),
                title: Text(
                  Translations.of(context).menu.cancel,
                  style: TextStyle(color: theme.colorScheme.onSurface),
                ),
                onTap: () => Navigator.pop(context, -1),
              ),
            ],
          ),
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
    final url = await provider.uploadMenuItemImage(File(picked.path));
    if (url != null) {
      onImageUploaded(url);
    }
  }
}
