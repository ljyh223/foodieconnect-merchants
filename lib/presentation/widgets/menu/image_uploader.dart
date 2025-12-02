import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:foodieconnect/core/utils/image_utils.dart';
import 'package:foodieconnect/presentation/providers/menu_provider.dart';
import 'package:foodieconnect/l10n/generated/translations.g.dart';
import 'dart:io';

/// 图片上传组件
class ImageUploader extends StatelessWidget {
  final String? imageUrl;
  final ValueChanged<String> onImageUploaded;
  final MenuProvider provider;

  const ImageUploader({
    super.key,
    this.imageUrl,
    required this.onImageUploaded,
    required this.provider,
  });

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context).menu;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.itemImage,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        Text(
          t.uploadClearPhoto,
          style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
        ),
        const SizedBox(height: 12),
        InkWell(
          onTap: () => _handleImageUpload(context),
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
                    imageUrl != null
                        ? t.clickToChangeImage
                        : t.clickToUploadImage,
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    t.supportAlbumCamera,
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
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
                  color: Colors.grey.shade200,
                  alignment: Alignment.center,
                  child: Text(
                    t.imageLoadFailed,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Future<void> _handleImageUpload(BuildContext context) async {
    final option = await showModalBottomSheet<int>(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: Text(Translations.of(context).menu.selectFromAlbum),
              onTap: () => Navigator.pop(context, 0),
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: Text(Translations.of(context).menu.takePhoto),
              onTap: () => Navigator.pop(context, 1),
            ),
            ListTile(
              leading: const Icon(Icons.cancel),
              title: Text(Translations.of(context).menu.cancel),
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
    final url = await provider.uploadMenuItemImage(File(picked.path));
    if (url != null) {
      onImageUploaded(url);
    }
  }
}
