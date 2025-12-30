
/// 店员状态枚举
enum StaffStatus {
  /// 在线
  online('ONLINE'),
  
  /// 离线
  offline('OFFLINE'),
  
  /// 忙碌
  busy('BUSY');

  final String value;

  const StaffStatus(this.value);

  /// 从字符串值获取枚举
  static StaffStatus? fromValue(String? value) {
    if (value == null) return null;
    return values.firstWhereOrNull((status) => status.value == value.toUpperCase());
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
