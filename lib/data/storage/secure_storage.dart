import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:foodieconnectmerchant/core/utils/logger.dart';

/// 安全存储工具类
/// 用于存储敏感信息如token、密码等
class SecureStorage {
  static const FlutterSecureStorage _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock_this_device,
    ),
  );

  /// 存储数据
  static Future<void> setString(String key, String value) async {
    try {
      await _storage.write(key: key, value: value);
      AppLogger.debug('SecureStorage: 存储数据成功 - $key');
    } catch (e) {
      AppLogger.error('SecureStorage: 存储数据失败 - $key', error: e);
      rethrow;
    }
  }

  /// 获取字符串数据
  static Future<String?> getString(String key) async {
    try {
      final value = await _storage.read(key: key);
      AppLogger.debug('SecureStorage: 读取数据 - $key');
      return value;
    } catch (e) {
      AppLogger.error('SecureStorage: 读取数据失败 - $key', error: e);
      return null;
    }
  }

  /// 存储布尔值
  static Future<void> setBool(String key, bool value) async {
    await setString(key, value.toString());
  }

  /// 获取布尔值
  static Future<bool?> getBool(String key) async {
    final value = await getString(key);
    if (value == null) return null;
    return value.toLowerCase() == 'true';
  }

  /// 存储整数
  static Future<void> setInt(String key, int value) async {
    await setString(key, value.toString());
  }

  /// 获取整数
  static Future<int?> getInt(String key) async {
    final value = await getString(key);
    if (value == null) return null;
    return int.tryParse(value);
  }

  /// 存储双精度浮点数
  static Future<void> setDouble(String key, double value) async {
    await setString(key, value.toString());
  }

  /// 获取双精度浮点数
  static Future<double?> getDouble(String key) async {
    final value = await getString(key);
    if (value == null) return null;
    return double.tryParse(value);
  }

  /// 删除指定键的数据
  static Future<void> remove(String key) async {
    try {
      await _storage.delete(key: key);
      AppLogger.debug('SecureStorage: 删除数据成功 - $key');
    } catch (e) {
      AppLogger.error('SecureStorage: 删除数据失败 - $key', error: e);
      rethrow;
    }
  }

  /// 清空所有数据
  static Future<void> clear() async {
    try {
      await _storage.deleteAll();
      AppLogger.debug('SecureStorage: 清空所有数据成功');
    } catch (e) {
      AppLogger.error('SecureStorage: 清空所有数据失败', error: e);
      rethrow;
    }
  }

  /// 检查键是否存在
  static Future<bool> containsKey(String key) async {
    try {
      final value = await _storage.read(key: key);
      return value != null;
    } catch (e) {
      AppLogger.error('SecureStorage: 检查键存在失败 - $key', error: e);
      return false;
    }
  }

  /// 获取所有键
  static Future<Map<String, String>> getAll() async {
    try {
      final allData = await _storage.readAll();
      AppLogger.debug('SecureStorage: 获取所有数据成功');
      return allData;
    } catch (e) {
      AppLogger.error('SecureStorage: 获取所有数据失败', error: e);
      return {};
    }
  }
}
