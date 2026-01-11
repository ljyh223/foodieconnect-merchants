import 'package:shared_preferences/shared_preferences.dart';
import 'package:foodieconnectmerchant/core/utils/logger.dart';

/// SharedPreferences存储工具类
/// 用于存储非敏感的配置信息
class PrefsStorage {
  static SharedPreferences? _prefs;

  /// 初始化存储
  static Future<void> init() async {
    try {
      _prefs = await SharedPreferences.getInstance();
      AppLogger.debug('PrefsStorage: 初始化成功');
    } catch (e) {
      AppLogger.error('PrefsStorage: 初始化失败', error: e);
      rethrow;
    }
  }

  /// 确保已初始化
  static SharedPreferences get _instance {
    if (_prefs == null) {
      throw Exception('PrefsStorage 未初始化，请先调用 init() 方法');
    }
    return _prefs!;
  }

  /// 存储字符串
  static Future<void> setString(String key, String value) async {
    try {
      await _instance.setString(key, value);
      AppLogger.debug('PrefsStorage: 存储字符串成功 - $key');
    } catch (e) {
      AppLogger.error('PrefsStorage: 存储字符串失败 - $key', error: e);
      rethrow;
    }
  }

  /// 获取字符串
  static String? getString(String key, {String? defaultValue}) {
    try {
      final value = _instance.getString(key) ?? defaultValue;
      AppLogger.debug('PrefsStorage: 读取字符串 - $key');
      return value;
    } catch (e) {
      AppLogger.error('PrefsStorage: 读取字符串失败 - $key', error: e);
      return defaultValue;
    }
  }

  /// 存储布尔值
  static Future<void> setBool(String key, bool value) async {
    try {
      await _instance.setBool(key, value);
      AppLogger.debug('PrefsStorage: 存储布尔值成功 - $key');
    } catch (e) {
      AppLogger.error('PrefsStorage: 存储布尔值失败 - $key', error: e);
      rethrow;
    }
  }

  /// 获取布尔值
  static bool? getBool(String key, {bool? defaultValue}) {
    try {
      final value = _instance.getBool(key) ?? defaultValue;
      AppLogger.debug('PrefsStorage: 读取布尔值 - $key');
      return value;
    } catch (e) {
      AppLogger.error('PrefsStorage: 读取布尔值失败 - $key', error: e);
      return defaultValue;
    }
  }

  /// 存储整数
  static Future<void> setInt(String key, int value) async {
    try {
      await _instance.setInt(key, value);
      AppLogger.debug('PrefsStorage: 存储整数成功 - $key');
    } catch (e) {
      AppLogger.error('PrefsStorage: 存储整数失败 - $key', error: e);
      rethrow;
    }
  }

  /// 获取整数
  static int? getInt(String key, {int? defaultValue}) {
    try {
      final value = _instance.getInt(key) ?? defaultValue;
      AppLogger.debug('PrefsStorage: 读取整数 - $key');
      return value;
    } catch (e) {
      AppLogger.error('PrefsStorage: 读取整数失败 - $key', error: e);
      return defaultValue;
    }
  }

  /// 存储双精度浮点数
  static Future<void> setDouble(String key, double value) async {
    try {
      await _instance.setDouble(key, value);
      AppLogger.debug('PrefsStorage: 存储双精度浮点数成功 - $key');
    } catch (e) {
      AppLogger.error('PrefsStorage: 存储双精度浮点数失败 - $key', error: e);
      rethrow;
    }
  }

  /// 获取双精度浮点数
  static double? getDouble(String key, {double? defaultValue}) {
    try {
      final value = _instance.getDouble(key) ?? defaultValue;
      AppLogger.debug('PrefsStorage: 读取双精度浮点数 - $key');
      return value;
    } catch (e) {
      AppLogger.error('PrefsStorage: 读取双精度浮点数失败 - $key', error: e);
      return defaultValue;
    }
  }

  /// 存储字符串列表
  static Future<void> setStringList(String key, List<String> value) async {
    try {
      await _instance.setStringList(key, value);
      AppLogger.debug('PrefsStorage: 存储字符串列表成功 - $key');
    } catch (e) {
      AppLogger.error('PrefsStorage: 存储字符串列表失败 - $key', error: e);
      rethrow;
    }
  }

  /// 获取字符串列表
  static List<String>? getStringList(String key, {List<String>? defaultValue}) {
    try {
      final value = _instance.getStringList(key) ?? defaultValue;
      AppLogger.debug('PrefsStorage: 读取字符串列表 - $key');
      return value;
    } catch (e) {
      AppLogger.error('PrefsStorage: 读取字符串列表失败 - $key', error: e);
      return defaultValue;
    }
  }

  /// 删除指定键的数据
  static Future<void> remove(String key) async {
    try {
      await _instance.remove(key);
      AppLogger.debug('PrefsStorage: 删除数据成功 - $key');
    } catch (e) {
      AppLogger.error('PrefsStorage: 删除数据失败 - $key', error: e);
      rethrow;
    }
  }

  /// 清空所有数据
  static Future<void> clear() async {
    try {
      await _instance.clear();
      AppLogger.debug('PrefsStorage: 清空所有数据成功');
    } catch (e) {
      AppLogger.error('PrefsStorage: 清空所有数据失败', error: e);
      rethrow;
    }
  }

  /// 检查键是否存在
  static bool containsKey(String key) {
    try {
      final exists = _instance.containsKey(key);
      AppLogger.debug('PrefsStorage: 检查键存在 - $key: $exists');
      return exists;
    } catch (e) {
      AppLogger.error('PrefsStorage: 检查键存在失败 - $key', error: e);
      return false;
    }
  }

  /// 获取所有键
  static Set<String> getAllKeys() {
    try {
      final keys = _instance.getKeys();
      AppLogger.debug('PrefsStorage: 获取所有键成功');
      return keys;
    } catch (e) {
      AppLogger.error('PrefsStorage: 获取所有键失败', error: e);
      return <String>{};
    }
  }

  /// 重新加载数据
  static Future<void> reload() async {
    try {
      await _instance.reload();
      AppLogger.debug('PrefsStorage: 重新加载数据成功');
    } catch (e) {
      AppLogger.error('PrefsStorage: 重新加载数据失败', error: e);
      rethrow;
    }
  }
}
