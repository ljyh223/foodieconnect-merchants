/// 应用常量定义
class AppConstants {
  // 应用信息
  static const String appName = 'Foodie Connect 商家端';
  static const String appVersion = '1.0.0';
  
  // API配置
  static const String baseUrl = 'http://192.168.124.36:8080/api/v1';
  static const String merchantApiPrefix = '/merchant';
  static const Duration apiTimeout = Duration(seconds: 30);
  
  // 存储键名
  static const String tokenKey = 'auth_token';
  static const String refreshTokenKey = 'refresh_token';
  static const String userInfoKey = 'user_info';
  static const String languageKey = 'language';
  static const String themeKey = 'theme_mode';
  
  // UI常量
  static const double defaultPadding = 16.0;
  static const double defaultRadius = 12.0;
  static const double smallRadius = 8.0;
  static const double largeRadius = 16.0;
  
  // 分页配置
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;
  
  // 图片配置
  static const double maxImageSize = 5.0; // MB
  static const List<String> supportedImageFormats = ['jpg', 'jpeg', 'png', 'webp'];
  
  // 状态枚举
  static const List<String> staffStatuses = ['ONLINE', 'OFFLINE', 'BUSY'];
  static const List<String> spiceLevels = ['NONE', 'MILD', 'MEDIUM', 'HOT'];
  static const List<String> userStatuses = ['ACTIVE', 'INACTIVE', 'BANNED'];
}