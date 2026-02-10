// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'staff_ratings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

StaffRatings _$StaffRatingsFromJson(Map<String, dynamic> json) {
  return _StaffRatings.fromJson(json);
}

/// @nodoc
mixin _$StaffRatings {
  @JsonKey(name: 'highest')
  StaffInfo? get highest => throw _privateConstructorUsedError;
  @JsonKey(name: 'lowest')
  StaffInfo? get lowest => throw _privateConstructorUsedError;

  /// Serializes this StaffRatings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StaffRatings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StaffRatingsCopyWith<StaffRatings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StaffRatingsCopyWith<$Res> {
  factory $StaffRatingsCopyWith(
    StaffRatings value,
    $Res Function(StaffRatings) then,
  ) = _$StaffRatingsCopyWithImpl<$Res, StaffRatings>;
  @useResult
  $Res call({
    @JsonKey(name: 'highest') StaffInfo? highest,
    @JsonKey(name: 'lowest') StaffInfo? lowest,
  });

  $StaffInfoCopyWith<$Res>? get highest;
  $StaffInfoCopyWith<$Res>? get lowest;
}

/// @nodoc
class _$StaffRatingsCopyWithImpl<$Res, $Val extends StaffRatings>
    implements $StaffRatingsCopyWith<$Res> {
  _$StaffRatingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StaffRatings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? highest = freezed, Object? lowest = freezed}) {
    return _then(
      _value.copyWith(
            highest: freezed == highest
                ? _value.highest
                : highest // ignore: cast_nullable_to_non_nullable
                      as StaffInfo?,
            lowest: freezed == lowest
                ? _value.lowest
                : lowest // ignore: cast_nullable_to_non_nullable
                      as StaffInfo?,
          )
          as $Val,
    );
  }

  /// Create a copy of StaffRatings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StaffInfoCopyWith<$Res>? get highest {
    if (_value.highest == null) {
      return null;
    }

    return $StaffInfoCopyWith<$Res>(_value.highest!, (value) {
      return _then(_value.copyWith(highest: value) as $Val);
    });
  }

  /// Create a copy of StaffRatings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StaffInfoCopyWith<$Res>? get lowest {
    if (_value.lowest == null) {
      return null;
    }

    return $StaffInfoCopyWith<$Res>(_value.lowest!, (value) {
      return _then(_value.copyWith(lowest: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StaffRatingsImplCopyWith<$Res>
    implements $StaffRatingsCopyWith<$Res> {
  factory _$$StaffRatingsImplCopyWith(
    _$StaffRatingsImpl value,
    $Res Function(_$StaffRatingsImpl) then,
  ) = __$$StaffRatingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'highest') StaffInfo? highest,
    @JsonKey(name: 'lowest') StaffInfo? lowest,
  });

  @override
  $StaffInfoCopyWith<$Res>? get highest;
  @override
  $StaffInfoCopyWith<$Res>? get lowest;
}

/// @nodoc
class __$$StaffRatingsImplCopyWithImpl<$Res>
    extends _$StaffRatingsCopyWithImpl<$Res, _$StaffRatingsImpl>
    implements _$$StaffRatingsImplCopyWith<$Res> {
  __$$StaffRatingsImplCopyWithImpl(
    _$StaffRatingsImpl _value,
    $Res Function(_$StaffRatingsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StaffRatings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? highest = freezed, Object? lowest = freezed}) {
    return _then(
      _$StaffRatingsImpl(
        highest: freezed == highest
            ? _value.highest
            : highest // ignore: cast_nullable_to_non_nullable
                  as StaffInfo?,
        lowest: freezed == lowest
            ? _value.lowest
            : lowest // ignore: cast_nullable_to_non_nullable
                  as StaffInfo?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StaffRatingsImpl implements _StaffRatings {
  const _$StaffRatingsImpl({
    @JsonKey(name: 'highest') required this.highest,
    @JsonKey(name: 'lowest') required this.lowest,
  });

  factory _$StaffRatingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$StaffRatingsImplFromJson(json);

  @override
  @JsonKey(name: 'highest')
  final StaffInfo? highest;
  @override
  @JsonKey(name: 'lowest')
  final StaffInfo? lowest;

  @override
  String toString() {
    return 'StaffRatings(highest: $highest, lowest: $lowest)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StaffRatingsImpl &&
            (identical(other.highest, highest) || other.highest == highest) &&
            (identical(other.lowest, lowest) || other.lowest == lowest));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, highest, lowest);

  /// Create a copy of StaffRatings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StaffRatingsImplCopyWith<_$StaffRatingsImpl> get copyWith =>
      __$$StaffRatingsImplCopyWithImpl<_$StaffRatingsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StaffRatingsImplToJson(this);
  }
}

abstract class _StaffRatings implements StaffRatings {
  const factory _StaffRatings({
    @JsonKey(name: 'highest') required final StaffInfo? highest,
    @JsonKey(name: 'lowest') required final StaffInfo? lowest,
  }) = _$StaffRatingsImpl;

  factory _StaffRatings.fromJson(Map<String, dynamic> json) =
      _$StaffRatingsImpl.fromJson;

  @override
  @JsonKey(name: 'highest')
  StaffInfo? get highest;
  @override
  @JsonKey(name: 'lowest')
  StaffInfo? get lowest;

  /// Create a copy of StaffRatings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StaffRatingsImplCopyWith<_$StaffRatingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
