// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'overview_stats_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OverviewStatsResponse _$OverviewStatsResponseFromJson(
  Map<String, dynamic> json,
) {
  return _OverviewStatsResponse.fromJson(json);
}

/// @nodoc
mixin _$OverviewStatsResponse {
  @JsonKey(name: 'today')
  TodayStats get today => throw _privateConstructorUsedError;
  @JsonKey(name: 'monthly')
  MonthlyStats get monthly => throw _privateConstructorUsedError;
  @JsonKey(name: 'staffRatings')
  StaffRatings get staffRatings => throw _privateConstructorUsedError;

  /// Serializes this OverviewStatsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OverviewStatsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OverviewStatsResponseCopyWith<OverviewStatsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OverviewStatsResponseCopyWith<$Res> {
  factory $OverviewStatsResponseCopyWith(
    OverviewStatsResponse value,
    $Res Function(OverviewStatsResponse) then,
  ) = _$OverviewStatsResponseCopyWithImpl<$Res, OverviewStatsResponse>;
  @useResult
  $Res call({
    @JsonKey(name: 'today') TodayStats today,
    @JsonKey(name: 'monthly') MonthlyStats monthly,
    @JsonKey(name: 'staffRatings') StaffRatings staffRatings,
  });

  $TodayStatsCopyWith<$Res> get today;
  $MonthlyStatsCopyWith<$Res> get monthly;
  $StaffRatingsCopyWith<$Res> get staffRatings;
}

/// @nodoc
class _$OverviewStatsResponseCopyWithImpl<
  $Res,
  $Val extends OverviewStatsResponse
>
    implements $OverviewStatsResponseCopyWith<$Res> {
  _$OverviewStatsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OverviewStatsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? today = null,
    Object? monthly = null,
    Object? staffRatings = null,
  }) {
    return _then(
      _value.copyWith(
            today: null == today
                ? _value.today
                : today // ignore: cast_nullable_to_non_nullable
                      as TodayStats,
            monthly: null == monthly
                ? _value.monthly
                : monthly // ignore: cast_nullable_to_non_nullable
                      as MonthlyStats,
            staffRatings: null == staffRatings
                ? _value.staffRatings
                : staffRatings // ignore: cast_nullable_to_non_nullable
                      as StaffRatings,
          )
          as $Val,
    );
  }

  /// Create a copy of OverviewStatsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TodayStatsCopyWith<$Res> get today {
    return $TodayStatsCopyWith<$Res>(_value.today, (value) {
      return _then(_value.copyWith(today: value) as $Val);
    });
  }

  /// Create a copy of OverviewStatsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MonthlyStatsCopyWith<$Res> get monthly {
    return $MonthlyStatsCopyWith<$Res>(_value.monthly, (value) {
      return _then(_value.copyWith(monthly: value) as $Val);
    });
  }

  /// Create a copy of OverviewStatsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StaffRatingsCopyWith<$Res> get staffRatings {
    return $StaffRatingsCopyWith<$Res>(_value.staffRatings, (value) {
      return _then(_value.copyWith(staffRatings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OverviewStatsResponseImplCopyWith<$Res>
    implements $OverviewStatsResponseCopyWith<$Res> {
  factory _$$OverviewStatsResponseImplCopyWith(
    _$OverviewStatsResponseImpl value,
    $Res Function(_$OverviewStatsResponseImpl) then,
  ) = __$$OverviewStatsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'today') TodayStats today,
    @JsonKey(name: 'monthly') MonthlyStats monthly,
    @JsonKey(name: 'staffRatings') StaffRatings staffRatings,
  });

  @override
  $TodayStatsCopyWith<$Res> get today;
  @override
  $MonthlyStatsCopyWith<$Res> get monthly;
  @override
  $StaffRatingsCopyWith<$Res> get staffRatings;
}

/// @nodoc
class __$$OverviewStatsResponseImplCopyWithImpl<$Res>
    extends
        _$OverviewStatsResponseCopyWithImpl<$Res, _$OverviewStatsResponseImpl>
    implements _$$OverviewStatsResponseImplCopyWith<$Res> {
  __$$OverviewStatsResponseImplCopyWithImpl(
    _$OverviewStatsResponseImpl _value,
    $Res Function(_$OverviewStatsResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OverviewStatsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? today = null,
    Object? monthly = null,
    Object? staffRatings = null,
  }) {
    return _then(
      _$OverviewStatsResponseImpl(
        today: null == today
            ? _value.today
            : today // ignore: cast_nullable_to_non_nullable
                  as TodayStats,
        monthly: null == monthly
            ? _value.monthly
            : monthly // ignore: cast_nullable_to_non_nullable
                  as MonthlyStats,
        staffRatings: null == staffRatings
            ? _value.staffRatings
            : staffRatings // ignore: cast_nullable_to_non_nullable
                  as StaffRatings,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OverviewStatsResponseImpl implements _OverviewStatsResponse {
  const _$OverviewStatsResponseImpl({
    @JsonKey(name: 'today') required this.today,
    @JsonKey(name: 'monthly') required this.monthly,
    @JsonKey(name: 'staffRatings') required this.staffRatings,
  });

  factory _$OverviewStatsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$OverviewStatsResponseImplFromJson(json);

  @override
  @JsonKey(name: 'today')
  final TodayStats today;
  @override
  @JsonKey(name: 'monthly')
  final MonthlyStats monthly;
  @override
  @JsonKey(name: 'staffRatings')
  final StaffRatings staffRatings;

  @override
  String toString() {
    return 'OverviewStatsResponse(today: $today, monthly: $monthly, staffRatings: $staffRatings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OverviewStatsResponseImpl &&
            (identical(other.today, today) || other.today == today) &&
            (identical(other.monthly, monthly) || other.monthly == monthly) &&
            (identical(other.staffRatings, staffRatings) ||
                other.staffRatings == staffRatings));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, today, monthly, staffRatings);

  /// Create a copy of OverviewStatsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OverviewStatsResponseImplCopyWith<_$OverviewStatsResponseImpl>
  get copyWith =>
      __$$OverviewStatsResponseImplCopyWithImpl<_$OverviewStatsResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OverviewStatsResponseImplToJson(this);
  }
}

abstract class _OverviewStatsResponse implements OverviewStatsResponse {
  const factory _OverviewStatsResponse({
    @JsonKey(name: 'today') required final TodayStats today,
    @JsonKey(name: 'monthly') required final MonthlyStats monthly,
    @JsonKey(name: 'staffRatings') required final StaffRatings staffRatings,
  }) = _$OverviewStatsResponseImpl;

  factory _OverviewStatsResponse.fromJson(Map<String, dynamic> json) =
      _$OverviewStatsResponseImpl.fromJson;

  @override
  @JsonKey(name: 'today')
  TodayStats get today;
  @override
  @JsonKey(name: 'monthly')
  MonthlyStats get monthly;
  @override
  @JsonKey(name: 'staffRatings')
  StaffRatings get staffRatings;

  /// Create a copy of OverviewStatsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OverviewStatsResponseImplCopyWith<_$OverviewStatsResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
