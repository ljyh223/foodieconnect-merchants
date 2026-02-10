// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginated_review_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PaginatedReviewResponse _$PaginatedReviewResponseFromJson(
  Map<String, dynamic> json,
) {
  return _PaginatedReviewResponse.fromJson(json);
}

/// @nodoc
mixin _$PaginatedReviewResponse {
  @JsonKey(name: 'records')
  List<DishReviewModel> get records => throw _privateConstructorUsedError;
  @JsonKey(name: 'total')
  int get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'size')
  int get size => throw _privateConstructorUsedError;
  @JsonKey(name: 'current')
  int get current => throw _privateConstructorUsedError;

  /// Serializes this PaginatedReviewResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaginatedReviewResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginatedReviewResponseCopyWith<PaginatedReviewResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedReviewResponseCopyWith<$Res> {
  factory $PaginatedReviewResponseCopyWith(
    PaginatedReviewResponse value,
    $Res Function(PaginatedReviewResponse) then,
  ) = _$PaginatedReviewResponseCopyWithImpl<$Res, PaginatedReviewResponse>;
  @useResult
  $Res call({
    @JsonKey(name: 'records') List<DishReviewModel> records,
    @JsonKey(name: 'total') int total,
    @JsonKey(name: 'size') int size,
    @JsonKey(name: 'current') int current,
  });
}

/// @nodoc
class _$PaginatedReviewResponseCopyWithImpl<
  $Res,
  $Val extends PaginatedReviewResponse
>
    implements $PaginatedReviewResponseCopyWith<$Res> {
  _$PaginatedReviewResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginatedReviewResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? records = null,
    Object? total = null,
    Object? size = null,
    Object? current = null,
  }) {
    return _then(
      _value.copyWith(
            records: null == records
                ? _value.records
                : records // ignore: cast_nullable_to_non_nullable
                      as List<DishReviewModel>,
            total: null == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as int,
            size: null == size
                ? _value.size
                : size // ignore: cast_nullable_to_non_nullable
                      as int,
            current: null == current
                ? _value.current
                : current // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PaginatedReviewResponseImplCopyWith<$Res>
    implements $PaginatedReviewResponseCopyWith<$Res> {
  factory _$$PaginatedReviewResponseImplCopyWith(
    _$PaginatedReviewResponseImpl value,
    $Res Function(_$PaginatedReviewResponseImpl) then,
  ) = __$$PaginatedReviewResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'records') List<DishReviewModel> records,
    @JsonKey(name: 'total') int total,
    @JsonKey(name: 'size') int size,
    @JsonKey(name: 'current') int current,
  });
}

/// @nodoc
class __$$PaginatedReviewResponseImplCopyWithImpl<$Res>
    extends
        _$PaginatedReviewResponseCopyWithImpl<
          $Res,
          _$PaginatedReviewResponseImpl
        >
    implements _$$PaginatedReviewResponseImplCopyWith<$Res> {
  __$$PaginatedReviewResponseImplCopyWithImpl(
    _$PaginatedReviewResponseImpl _value,
    $Res Function(_$PaginatedReviewResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PaginatedReviewResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? records = null,
    Object? total = null,
    Object? size = null,
    Object? current = null,
  }) {
    return _then(
      _$PaginatedReviewResponseImpl(
        records: null == records
            ? _value._records
            : records // ignore: cast_nullable_to_non_nullable
                  as List<DishReviewModel>,
        total: null == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as int,
        size: null == size
            ? _value.size
            : size // ignore: cast_nullable_to_non_nullable
                  as int,
        current: null == current
            ? _value.current
            : current // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginatedReviewResponseImpl implements _PaginatedReviewResponse {
  const _$PaginatedReviewResponseImpl({
    @JsonKey(name: 'records') required final List<DishReviewModel> records,
    @JsonKey(name: 'total') required this.total,
    @JsonKey(name: 'size') required this.size,
    @JsonKey(name: 'current') required this.current,
  }) : _records = records;

  factory _$PaginatedReviewResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginatedReviewResponseImplFromJson(json);

  final List<DishReviewModel> _records;
  @override
  @JsonKey(name: 'records')
  List<DishReviewModel> get records {
    if (_records is EqualUnmodifiableListView) return _records;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_records);
  }

  @override
  @JsonKey(name: 'total')
  final int total;
  @override
  @JsonKey(name: 'size')
  final int size;
  @override
  @JsonKey(name: 'current')
  final int current;

  @override
  String toString() {
    return 'PaginatedReviewResponse(records: $records, total: $total, size: $size, current: $current)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginatedReviewResponseImpl &&
            const DeepCollectionEquality().equals(other._records, _records) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.current, current) || other.current == current));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_records),
    total,
    size,
    current,
  );

  /// Create a copy of PaginatedReviewResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginatedReviewResponseImplCopyWith<_$PaginatedReviewResponseImpl>
  get copyWith =>
      __$$PaginatedReviewResponseImplCopyWithImpl<
        _$PaginatedReviewResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginatedReviewResponseImplToJson(this);
  }
}

abstract class _PaginatedReviewResponse implements PaginatedReviewResponse {
  const factory _PaginatedReviewResponse({
    @JsonKey(name: 'records') required final List<DishReviewModel> records,
    @JsonKey(name: 'total') required final int total,
    @JsonKey(name: 'size') required final int size,
    @JsonKey(name: 'current') required final int current,
  }) = _$PaginatedReviewResponseImpl;

  factory _PaginatedReviewResponse.fromJson(Map<String, dynamic> json) =
      _$PaginatedReviewResponseImpl.fromJson;

  @override
  @JsonKey(name: 'records')
  List<DishReviewModel> get records;
  @override
  @JsonKey(name: 'total')
  int get total;
  @override
  @JsonKey(name: 'size')
  int get size;
  @override
  @JsonKey(name: 'current')
  int get current;

  /// Create a copy of PaginatedReviewResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginatedReviewResponseImplCopyWith<_$PaginatedReviewResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
