/// 字符串扩展工具类
extension StringExtension on String {
  /// 判断字符串是否为空或null
  bool get isNullOrEmpty => isEmpty;

  /// 判断字符串是否不为空
  bool get isNotNullOrEmpty => isNotEmpty;

  /// 判断是否为有效的邮箱地址
  bool get isValidEmail {
    final emailRegExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegExp.hasMatch(this);
  }

  /// 判断是否为有效的手机号码（中国）
  bool get isValidPhoneNumber {
    final phoneRegExp = RegExp(r'^1[3-9]\d{9}$');
    return phoneRegExp.hasMatch(this);
  }

  /// 判断是否为数字
  bool get isNumeric {
    return double.tryParse(this) != null;
  }

  /// 判断是否为正数
  bool get isPositive {
    final number = double.tryParse(this);
    return number != null && number > 0;
  }

  /// 首字母大写
  String get capitalize {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  /// 每个单词首字母大写
  String get capitalizeWords {
    return split(' ').map((word) => word.capitalize).join(' ');
  }

  /// 移除所有空白字符
  String get removeAllWhitespace {
    return replaceAll(RegExp(r'\s+'), '');
  }

  /// 限制字符串长度
  String limitLength(int maxLength, {String suffix = '...'}) {
    if (length <= maxLength) return this;
    return '${substring(0, maxLength)}$suffix';
  }

  /// 格式化货币显示
  String formatCurrency({String symbol = '¥'}) {
    final number = double.tryParse(this);
    if (number == null) return this;
    return '$symbol${number.toStringAsFixed(2)}';
  }

  /// 格式化手机号码显示
  String formatPhoneNumber() {
    if (length != 11) return this;
    return '${substring(0, 3)} ${substring(3, 7)} ${substring(7)}';
  }

  /// 隐藏敏感信息（如手机号、身份证）
  String maskSensitiveInfo({int start = 3, int end = 4, String mask = '****'}) {
    if (length <= start + end) return this;
    return '${substring(0, start)}$mask${substring(length - end)}';
  }

  /// 转换为安全的文件名
  String get toSafeFileName {
    return replaceAll(RegExp(r'[<>:"/\\|?*]'), '_');
  }

  /// 获取文件扩展名
  String get fileExtension {
    final lastDotIndex = lastIndexOf('.');
    return lastDotIndex != -1 && lastDotIndex < length - 1 
        ? substring(lastDotIndex + 1).toLowerCase() 
        : '';
  }

  /// 判断是否为图片文件
  bool get isImageFile {
    final imageExtensions = ['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp'];
    return imageExtensions.contains(fileExtension);
  }

  /// 转换为URL安全的字符串
  String get toUrlSafe {
    return replaceAll(' ', '%20')
        .replaceAll('&', '%26')
        .replaceAll('=', '%3D')
        .replaceAll('?', '%3F')
        .replaceAll('#', '%23');
  }
}