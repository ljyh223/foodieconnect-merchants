// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DailyData _$DailyDataFromJson(Map<String, dynamic> json) {
  return _DailyData.fromJson(json);
}

/// @nodoc
mixin _$DailyData {
  @JsonKey(name: 'date')
  String get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'revenue')
  double get revenue => throw _privateConstructorUsedError;
  @JsonKey(name: 'orderCount')
  int get orderCount => throw _privateConstructorUsedError;

  /// Serializes this DailyData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyDataCopyWith<DailyData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyDataCopyWith<$Res> {
  factory $DailyDataCopyWith(DailyData value, $Res Function(DailyData) then) =
      _$DailyDataCopyWithImpl<$Res, DailyData>;
  @useResult
  $Res call({
    @JsonKey(name: 'date') String date,
    @JsonKey(name: 'revenue') double revenue,
    @JsonKey(name: 'orderCount') int orderCount,
  });
}

/// @nodoc
class _$DailyDataCopyWithImpl<$Res, $Val extends DailyData>
    implements $DailyDataCopyWith<$Res> {
  _$DailyDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? revenue = null,
    Object? orderCount = null,
  }) {
    return _then(
      _value.copyWith(
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as String,
            revenue: null == revenue
                ? _value.revenue
                : revenue // ignore: cast_nullable_to_non_nullable
                      as double,
            orderCount: null == orderCount
                ? _value.orderCount
                : orderCount // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DailyDataImplCopyWith<$Res>
    implements $DailyDataCopyWith<$Res> {
  factory _$$DailyDataImplCopyWith(
    _$DailyDataImpl value,
    $Res Function(_$DailyDataImpl) then,
  ) = __$$DailyDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'date') String date,
    @JsonKey(name: 'revenue') double revenue,
    @JsonKey(name: 'orderCount') int orderCount,
  });
}

/// @nodoc
class __$$DailyDataImplCopyWithImpl<$Res>
    extends _$DailyDataCopyWithImpl<$Res, _$DailyDataImpl>
    implements _$$DailyDataImplCopyWith<$Res> {
  __$$DailyDataImplCopyWithImpl(
    _$DailyDataImpl _value,
    $Res Function(_$DailyDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DailyData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? revenue = null,
    Object? orderCount = null,
  }) {
    return _then(
      _$DailyDataImpl(
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as String,
        revenue: null == revenue
            ? _value.revenue
            : revenue // ignore: cast_nullable_to_non_nullable
                  as double,
        orderCount: null == orderCount
            ? _value.orderCount
            : orderCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyDataImpl implements _DailyData {
  const _$DailyDataImpl({
    @JsonKey(name: 'date') required this.date,
    @JsonKey(name: 'revenue') required this.revenue,
    @JsonKey(name: 'orderCount') required this.orderCount,
  });

  factory _$DailyDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyDataImplFromJson(json);

  @override
  @JsonKey(name: 'date')
  final String date;
  @override
  @JsonKey(name: 'revenue')
  final double revenue;
  @override
  @JsonKey(name: 'orderCount')
  final int orderCount;

  @override
  String toString() {
    return 'DailyData(date: $date, revenue: $revenue, orderCount: $orderCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyDataImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.revenue, revenue) || other.revenue == revenue) &&
            (identical(other.orderCount, orderCount) ||
                other.orderCount == orderCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date, revenue, orderCount);

  /// Create a copy of DailyData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyDataImplCopyWith<_$DailyDataImpl> get copyWith =>
      __$$DailyDataImplCopyWithImpl<_$DailyDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyDataImplToJson(this);
  }
}

abstract class _DailyData implements DailyData {
  const factory _DailyData({
    @JsonKey(name: 'date') required final String date,
    @JsonKey(name: 'revenue') required final double revenue,
    @JsonKey(name: 'orderCount') required final int orderCount,
  }) = _$DailyDataImpl;

  factory _DailyData.fromJson(Map<String, dynamic> json) =
      _$DailyDataImpl.fromJson;

  @override
  @JsonKey(name: 'date')
  String get date;
  @override
  @JsonKey(name: 'revenue')
  double get revenue;
  @override
  @JsonKey(name: 'orderCount')
  int get orderCount;

  /// Create a copy of DailyData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyDataImplCopyWith<_$DailyDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
