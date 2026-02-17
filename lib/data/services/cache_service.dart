import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/utils/logger.dart';

/// 缓存服务，用于管理Repository层的缓存
class CacheService {
  static final CacheService _instance = CacheService._internal();
  factory CacheService() => _instance;
  CacheService._internal();

  late SharedPreferences _prefs;

  /// 初始化缓存服务
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    AppLogger.info('CacheService: Initialization completed');
  }

  /// 保存数据到缓存
  Future<bool> save<T>(String key, T data, [Duration? expiryDuration]) async {
    try {
      final cacheItem = _CacheItem(
        data: data,
        expiryTime: expiryDuration != null
            ? DateTime.now().add(expiryDuration)
            : null,
      );

      final json = cacheItem.toJson();
      return await _prefs.setString(key, json);
    } catch (e) {
      AppLogger.error('CacheService: Failed to save cache - $key', error: e);
      return false;
    }
  }

  /// 从缓存获取数据
  T? get<T>(String key, T Function(dynamic) fromJson) {
    try {
      final json = _prefs.getString(key);
      if (json == null) return null;

      final cacheItem = _CacheItem.fromJson(json);

      // 检查缓存是否过期
      if (cacheItem.expiryTime != null &&
          cacheItem.expiryTime!.isBefore(DateTime.now())) {
        // 缓存过期，删除
        remove(key);
        return null;
      }

      return fromJson(cacheItem.data);
    } catch (e) {
      AppLogger.error('CacheService: Failed to retrieve cache - $key', error: e);
      return null;
    }
  }

  /// 移除缓存
  Future<bool> remove(String key) async {
    try {
      return await _prefs.remove(key);
    } catch (e) {
      AppLogger.error('CacheService: Failed to remove cache - $key', error: e);
      return false;
    }
  }

  /// 清空所有缓存
  Future<bool> clear() async {
    try {
      return await _prefs.clear();
    } catch (e) {
      AppLogger.error('CacheService: Failed to clear cache', error: e);
      return false;
    }
  }

  /// 检查缓存是否存在且有效
  bool containsKey(String key) {
    return get<dynamic>(key, (data) => data) != null;
  }
}

/// 缓存项
class _CacheItem {
  final dynamic data;
  final DateTime? expiryTime;

  _CacheItem({required this.data, this.expiryTime});

  /// 转换为JSON字符串
  String toJson() {
    final map = <String, dynamic>{
      'data': data,
      if (expiryTime != null) 'expiryTime': expiryTime!.toIso8601String(),
    };
    return _stringify(map);
  }

  /// 从JSON字符串创建实例
  factory _CacheItem.fromJson(String json) {
    final map = _parse(json) as Map<String, dynamic>;
    return _CacheItem(
      data: map['data'],
      expiryTime: map.containsKey('expiryTime')
          ? DateTime.parse(map['expiryTime'] as String)
          : null,
    );
  }

  /// 简单的JSON序列化（处理基本类型和List/Map）
  static String _stringify(dynamic value) {
    if (value == null) return 'null';
    if (value is num || value is bool) return value.toString();
    if (value is String) return '"${value.replaceAll('"', '\\"')}"';
    if (value is List) {
      final items = value.map(_stringify).join(',');
      return '[$items]';
    }
    if (value is Map) {
      final entries = value.entries
          .map((e) => '"${e.key}":${_stringify(e.value)}')
          .join(',');
      return '{$entries}';
    }
    return value.toString();
  }

  /// 简单的JSON解析
  static dynamic _parse(String json) {
    // 这里使用内置的json.decode方法，更可靠
    return _jsonDecode(json);
  }

  /// 使用dart:convert的json.decode方法
  static dynamic _jsonDecode(String json) {
    try {
      return jsonDecode(json);
    } catch (e) {
      rethrow;
    }
  }
}
