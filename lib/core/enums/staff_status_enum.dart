
/// 店员状态枚举
enum StaffStatus {
  /// 在线
  online('ONLINE', '在线'),
  
  /// 离线
  offline('OFFLINE', '离线'),
  
  /// 忙碌
  busy('BUSY', '忙碌');

  final String value;
  final String displayName;

  const StaffStatus(this.value, this.displayName);

  /// 从字符串值获取枚举
  static StaffStatus? fromValue(String? value) {
    if (value == null) return null;
    return values.firstWhereOrNull((status) => status.value == value.toUpperCase());
  }

  /// 从显示名称获取枚举
  static StaffStatus? fromDisplayName(String? displayName) {
    if (displayName == null) return null;
    return values.firstWhereOrNull((status) => status.displayName == displayName);
  }

  /// 检查状态是否在线
  bool get isOnline => this == StaffStatus.online;

  /// 检查状态是否离线
  bool get isOffline => this == StaffStatus.offline;

  /// 检查状态是否忙碌
  bool get isBusy => this == StaffStatus.busy;
}

/// 扩展方法：添加firstWhereOrNull方法到Iterable
extension IterableExtension<E> on Iterable<E> {
  E? firstWhereOrNull(bool Function(E) test) {
    for (final element in this) {
      if (test(element)) return element;
    }
    return null;
  }
}
