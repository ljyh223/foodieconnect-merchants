// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'monthly_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MonthlyStats _$MonthlyStatsFromJson(Map<String, dynamic> json) {
  return _MonthlyStats.fromJson(json);
}

/// @nodoc
mixin _$MonthlyStats {
  @JsonKey(name: 'year')
  int get year => throw _privateConstructorUsedError;
  @JsonKey(name: 'month')
  int get month => throw _privateConstructorUsedError;
  @JsonKey(name: 'dailyData')
  List<DailyData> get dailyData => throw _privateConstructorUsedError;

  /// Serializes this MonthlyStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MonthlyStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MonthlyStatsCopyWith<MonthlyStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthlyStatsCopyWith<$Res> {
  factory $MonthlyStatsCopyWith(
    MonthlyStats value,
    $Res Function(MonthlyStats) then,
  ) = _$MonthlyStatsCopyWithImpl<$Res, MonthlyStats>;
  @useResult
  $Res call({
    @JsonKey(name: 'year') int year,
    @JsonKey(name: 'month') int month,
    @JsonKey(name: 'dailyData') List<DailyData> dailyData,
  });
}

/// @nodoc
class _$MonthlyStatsCopyWithImpl<$Res, $Val extends MonthlyStats>
    implements $MonthlyStatsCopyWith<$Res> {
  _$MonthlyStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MonthlyStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? month = null,
    Object? dailyData = null,
  }) {
    return _then(
      _value.copyWith(
            year: null == year
                ? _value.year
                : year // ignore: cast_nullable_to_non_nullable
                      as int,
            month: null == month
                ? _value.month
                : month // ignore: cast_nullable_to_non_nullable
                      as int,
            dailyData: null == dailyData
                ? _value.dailyData
                : dailyData // ignore: cast_nullable_to_non_nullable
                      as List<DailyData>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MonthlyStatsImplCopyWith<$Res>
    implements $MonthlyStatsCopyWith<$Res> {
  factory _$$MonthlyStatsImplCopyWith(
    _$MonthlyStatsImpl value,
    $Res Function(_$MonthlyStatsImpl) then,
  ) = __$$MonthlyStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'year') int year,
    @JsonKey(name: 'month') int month,
    @JsonKey(name: 'dailyData') List<DailyData> dailyData,
  });
}

/// @nodoc
class __$$MonthlyStatsImplCopyWithImpl<$Res>
    extends _$MonthlyStatsCopyWithImpl<$Res, _$MonthlyStatsImpl>
    implements _$$MonthlyStatsImplCopyWith<$Res> {
  __$$MonthlyStatsImplCopyWithImpl(
    _$MonthlyStatsImpl _value,
    $Res Function(_$MonthlyStatsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MonthlyStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? month = null,
    Object? dailyData = null,
  }) {
    return _then(
      _$MonthlyStatsImpl(
        year: null == year
            ? _value.year
            : year // ignore: cast_nullable_to_non_nullable
                  as int,
        month: null == month
            ? _value.month
            : month // ignore: cast_nullable_to_non_nullable
                  as int,
        dailyData: null == dailyData
            ? _value._dailyData
            : dailyData // ignore: cast_nullable_to_non_nullable
                  as List<DailyData>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MonthlyStatsImpl implements _MonthlyStats {
  const _$MonthlyStatsImpl({
    @JsonKey(name: 'year') required this.year,
    @JsonKey(name: 'month') required this.month,
    @JsonKey(name: 'dailyData') required final List<DailyData> dailyData,
  }) : _dailyData = dailyData;

  factory _$MonthlyStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$MonthlyStatsImplFromJson(json);

  @override
  @JsonKey(name: 'year')
  final int year;
  @override
  @JsonKey(name: 'month')
  final int month;
  final List<DailyData> _dailyData;
  @override
  @JsonKey(name: 'dailyData')
  List<DailyData> get dailyData {
    if (_dailyData is EqualUnmodifiableListView) return _dailyData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dailyData);
  }

  @override
  String toString() {
    return 'MonthlyStats(year: $year, month: $month, dailyData: $dailyData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonthlyStatsImpl &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.month, month) || other.month == month) &&
            const DeepCollectionEquality().equals(
              other._dailyData,
              _dailyData,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    year,
    month,
    const DeepCollectionEquality().hash(_dailyData),
  );

  /// Create a copy of MonthlyStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MonthlyStatsImplCopyWith<_$MonthlyStatsImpl> get copyWith =>
      __$$MonthlyStatsImplCopyWithImpl<_$MonthlyStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MonthlyStatsImplToJson(this);
  }
}

abstract class _MonthlyStats implements MonthlyStats {
  const factory _MonthlyStats({
    @JsonKey(name: 'year') required final int year,
    @JsonKey(name: 'month') required final int month,
    @JsonKey(name: 'dailyData') required final List<DailyData> dailyData,
  }) = _$MonthlyStatsImpl;

  factory _MonthlyStats.fromJson(Map<String, dynamic> json) =
      _$MonthlyStatsImpl.fromJson;

  @override
  @JsonKey(name: 'year')
  int get year;
  @override
  @JsonKey(name: 'month')
  int get month;
  @override
  @JsonKey(name: 'dailyData')
  List<DailyData> get dailyData;

  /// Create a copy of MonthlyStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MonthlyStatsImplCopyWith<_$MonthlyStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
