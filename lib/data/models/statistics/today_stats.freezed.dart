// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'today_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TodayStats _$TodayStatsFromJson(Map<String, dynamic> json) {
  return _TodayStats.fromJson(json);
}

/// @nodoc
mixin _$TodayStats {
  @JsonKey(name: 'revenue')
  double get revenue => throw _privateConstructorUsedError;
  @JsonKey(name: 'dishAverageRating')
  double get dishAverageRating => throw _privateConstructorUsedError;
  @JsonKey(name: 'staffAverageRating')
  double get staffAverageRating => throw _privateConstructorUsedError;

  /// Serializes this TodayStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TodayStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TodayStatsCopyWith<TodayStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodayStatsCopyWith<$Res> {
  factory $TodayStatsCopyWith(
    TodayStats value,
    $Res Function(TodayStats) then,
  ) = _$TodayStatsCopyWithImpl<$Res, TodayStats>;
  @useResult
  $Res call({
    @JsonKey(name: 'revenue') double revenue,
    @JsonKey(name: 'dishAverageRating') double dishAverageRating,
    @JsonKey(name: 'staffAverageRating') double staffAverageRating,
  });
}

/// @nodoc
class _$TodayStatsCopyWithImpl<$Res, $Val extends TodayStats>
    implements $TodayStatsCopyWith<$Res> {
  _$TodayStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TodayStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? revenue = null,
    Object? dishAverageRating = null,
    Object? staffAverageRating = null,
  }) {
    return _then(
      _value.copyWith(
            revenue: null == revenue
                ? _value.revenue
                : revenue // ignore: cast_nullable_to_non_nullable
                      as double,
            dishAverageRating: null == dishAverageRating
                ? _value.dishAverageRating
                : dishAverageRating // ignore: cast_nullable_to_non_nullable
                      as double,
            staffAverageRating: null == staffAverageRating
                ? _value.staffAverageRating
                : staffAverageRating // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TodayStatsImplCopyWith<$Res>
    implements $TodayStatsCopyWith<$Res> {
  factory _$$TodayStatsImplCopyWith(
    _$TodayStatsImpl value,
    $Res Function(_$TodayStatsImpl) then,
  ) = __$$TodayStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'revenue') double revenue,
    @JsonKey(name: 'dishAverageRating') double dishAverageRating,
    @JsonKey(name: 'staffAverageRating') double staffAverageRating,
  });
}

/// @nodoc
class __$$TodayStatsImplCopyWithImpl<$Res>
    extends _$TodayStatsCopyWithImpl<$Res, _$TodayStatsImpl>
    implements _$$TodayStatsImplCopyWith<$Res> {
  __$$TodayStatsImplCopyWithImpl(
    _$TodayStatsImpl _value,
    $Res Function(_$TodayStatsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TodayStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? revenue = null,
    Object? dishAverageRating = null,
    Object? staffAverageRating = null,
  }) {
    return _then(
      _$TodayStatsImpl(
        revenue: null == revenue
            ? _value.revenue
            : revenue // ignore: cast_nullable_to_non_nullable
                  as double,
        dishAverageRating: null == dishAverageRating
            ? _value.dishAverageRating
            : dishAverageRating // ignore: cast_nullable_to_non_nullable
                  as double,
        staffAverageRating: null == staffAverageRating
            ? _value.staffAverageRating
            : staffAverageRating // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TodayStatsImpl implements _TodayStats {
  const _$TodayStatsImpl({
    @JsonKey(name: 'revenue') required this.revenue,
    @JsonKey(name: 'dishAverageRating') required this.dishAverageRating,
    @JsonKey(name: 'staffAverageRating') required this.staffAverageRating,
  });

  factory _$TodayStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$TodayStatsImplFromJson(json);

  @override
  @JsonKey(name: 'revenue')
  final double revenue;
  @override
  @JsonKey(name: 'dishAverageRating')
  final double dishAverageRating;
  @override
  @JsonKey(name: 'staffAverageRating')
  final double staffAverageRating;

  @override
  String toString() {
    return 'TodayStats(revenue: $revenue, dishAverageRating: $dishAverageRating, staffAverageRating: $staffAverageRating)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodayStatsImpl &&
            (identical(other.revenue, revenue) || other.revenue == revenue) &&
            (identical(other.dishAverageRating, dishAverageRating) ||
                other.dishAverageRating == dishAverageRating) &&
            (identical(other.staffAverageRating, staffAverageRating) ||
                other.staffAverageRating == staffAverageRating));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, revenue, dishAverageRating, staffAverageRating);

  /// Create a copy of TodayStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TodayStatsImplCopyWith<_$TodayStatsImpl> get copyWith =>
      __$$TodayStatsImplCopyWithImpl<_$TodayStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TodayStatsImplToJson(this);
  }
}

abstract class _TodayStats implements TodayStats {
  const factory _TodayStats({
    @JsonKey(name: 'revenue') required final double revenue,
    @JsonKey(name: 'dishAverageRating') required final double dishAverageRating,
    @JsonKey(name: 'staffAverageRating')
    required final double staffAverageRating,
  }) = _$TodayStatsImpl;

  factory _TodayStats.fromJson(Map<String, dynamic> json) =
      _$TodayStatsImpl.fromJson;

  @override
  @JsonKey(name: 'revenue')
  double get revenue;
  @override
  @JsonKey(name: 'dishAverageRating')
  double get dishAverageRating;
  @override
  @JsonKey(name: 'staffAverageRating')
  double get staffAverageRating;

  /// Create a copy of TodayStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TodayStatsImplCopyWith<_$TodayStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
