import 'package:foodieconnectmerchant/core/constants/app_constants.dart';

/// 图片工具类
class ImageUtils {
  /// 获取完整的图片URL
  /// 如果传入的路径已经是完整URL，则直接返回
  /// 如果是相对路径，则拼接基础URL
  static String getFullImageUrl(String? imagePath) {
    if (imagePath == null || imagePath.isEmpty) {
      return '';
    }

    // 如果已经是完整URL，直接返回
    if (imagePath.startsWith('http://') || imagePath.startsWith('https://')) {
      return imagePath;
    }

    // 如果是相对路径，拼接基础URL
    if (imagePath.startsWith('/')) {
      return '${AppConstants.baseUrl}$imagePath';
    }

    // 如果是不带斜杠的相对路径，添加斜杠
    return '${AppConstants.baseUrl}/$imagePath';
  }

  /// 检查图片路径是否有效
  static bool isValidImagePath(String? imagePath) {
    if (imagePath == null || imagePath.isEmpty) {
      return false;
    }

    // 检查是否是常见的图片格式
    final imageExtensions = ['.jpg', '.jpeg', '.png', '.gif', '.webp', '.bmp'];
    final lowerPath = imagePath.toLowerCase();

    return imageExtensions.any((ext) => lowerPath.endsWith(ext));
  }

  /// 获取默认头像URL
  static String getDefaultAvatar() {
    return ''; // 返回空字符串，使用默认图标
  }

  /// 获取默认菜品图片URL
  static String getDefaultFoodImage() {
    return ''; // 返回空字符串，使用默认图标
  }
}
