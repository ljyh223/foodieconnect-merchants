// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'staff_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$StaffState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isUpdating => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  List<StaffModel> get staffList => throw _privateConstructorUsedError;
  StaffModel? get selectedStaff => throw _privateConstructorUsedError;
  String? get filterStatus => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  int get pageSize => throw _privateConstructorUsedError;
  bool get hasMore => throw _privateConstructorUsedError;
  int get totalCount => throw _privateConstructorUsedError;

  /// Create a copy of StaffState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StaffStateCopyWith<StaffState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StaffStateCopyWith<$Res> {
  factory $StaffStateCopyWith(
    StaffState value,
    $Res Function(StaffState) then,
  ) = _$StaffStateCopyWithImpl<$Res, StaffState>;
  @useResult
  $Res call({
    bool isLoading,
    bool isUpdating,
    String? errorMessage,
    List<StaffModel> staffList,
    StaffModel? selectedStaff,
    String? filterStatus,
    int currentPage,
    int pageSize,
    bool hasMore,
    int totalCount,
  });

  $StaffModelCopyWith<$Res>? get selectedStaff;
}

/// @nodoc
class _$StaffStateCopyWithImpl<$Res, $Val extends StaffState>
    implements $StaffStateCopyWith<$Res> {
  _$StaffStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StaffState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isUpdating = null,
    Object? errorMessage = freezed,
    Object? staffList = null,
    Object? selectedStaff = freezed,
    Object? filterStatus = freezed,
    Object? currentPage = null,
    Object? pageSize = null,
    Object? hasMore = null,
    Object? totalCount = null,
  }) {
    return _then(
      _value.copyWith(
            isLoading: null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
            isUpdating: null == isUpdating
                ? _value.isUpdating
                : isUpdating // ignore: cast_nullable_to_non_nullable
                      as bool,
            errorMessage: freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
            staffList: null == staffList
                ? _value.staffList
                : staffList // ignore: cast_nullable_to_non_nullable
                      as List<StaffModel>,
            selectedStaff: freezed == selectedStaff
                ? _value.selectedStaff
                : selectedStaff // ignore: cast_nullable_to_non_nullable
                      as StaffModel?,
            filterStatus: freezed == filterStatus
                ? _value.filterStatus
                : filterStatus // ignore: cast_nullable_to_non_nullable
                      as String?,
            currentPage: null == currentPage
                ? _value.currentPage
                : currentPage // ignore: cast_nullable_to_non_nullable
                      as int,
            pageSize: null == pageSize
                ? _value.pageSize
                : pageSize // ignore: cast_nullable_to_non_nullable
                      as int,
            hasMore: null == hasMore
                ? _value.hasMore
                : hasMore // ignore: cast_nullable_to_non_nullable
                      as bool,
            totalCount: null == totalCount
                ? _value.totalCount
                : totalCount // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }

  /// Create a copy of StaffState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StaffModelCopyWith<$Res>? get selectedStaff {
    if (_value.selectedStaff == null) {
      return null;
    }

    return $StaffModelCopyWith<$Res>(_value.selectedStaff!, (value) {
      return _then(_value.copyWith(selectedStaff: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StaffStateImplCopyWith<$Res>
    implements $StaffStateCopyWith<$Res> {
  factory _$$StaffStateImplCopyWith(
    _$StaffStateImpl value,
    $Res Function(_$StaffStateImpl) then,
  ) = __$$StaffStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isLoading,
    bool isUpdating,
    String? errorMessage,
    List<StaffModel> staffList,
    StaffModel? selectedStaff,
    String? filterStatus,
    int currentPage,
    int pageSize,
    bool hasMore,
    int totalCount,
  });

  @override
  $StaffModelCopyWith<$Res>? get selectedStaff;
}

/// @nodoc
class __$$StaffStateImplCopyWithImpl<$Res>
    extends _$StaffStateCopyWithImpl<$Res, _$StaffStateImpl>
    implements _$$StaffStateImplCopyWith<$Res> {
  __$$StaffStateImplCopyWithImpl(
    _$StaffStateImpl _value,
    $Res Function(_$StaffStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StaffState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isUpdating = null,
    Object? errorMessage = freezed,
    Object? staffList = null,
    Object? selectedStaff = freezed,
    Object? filterStatus = freezed,
    Object? currentPage = null,
    Object? pageSize = null,
    Object? hasMore = null,
    Object? totalCount = null,
  }) {
    return _then(
      _$StaffStateImpl(
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        isUpdating: null == isUpdating
            ? _value.isUpdating
            : isUpdating // ignore: cast_nullable_to_non_nullable
                  as bool,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
        staffList: null == staffList
            ? _value._staffList
            : staffList // ignore: cast_nullable_to_non_nullable
                  as List<StaffModel>,
        selectedStaff: freezed == selectedStaff
            ? _value.selectedStaff
            : selectedStaff // ignore: cast_nullable_to_non_nullable
                  as StaffModel?,
        filterStatus: freezed == filterStatus
            ? _value.filterStatus
            : filterStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
        currentPage: null == currentPage
            ? _value.currentPage
            : currentPage // ignore: cast_nullable_to_non_nullable
                  as int,
        pageSize: null == pageSize
            ? _value.pageSize
            : pageSize // ignore: cast_nullable_to_non_nullable
                  as int,
        hasMore: null == hasMore
            ? _value.hasMore
            : hasMore // ignore: cast_nullable_to_non_nullable
                  as bool,
        totalCount: null == totalCount
            ? _value.totalCount
            : totalCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$StaffStateImpl implements _StaffState {
  const _$StaffStateImpl({
    this.isLoading = false,
    this.isUpdating = false,
    this.errorMessage,
    final List<StaffModel> staffList = const [],
    this.selectedStaff,
    this.filterStatus,
    this.currentPage = 0,
    this.pageSize = 20,
    this.hasMore = true,
    this.totalCount = 0,
  }) : _staffList = staffList;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isUpdating;
  @override
  final String? errorMessage;
  final List<StaffModel> _staffList;
  @override
  @JsonKey()
  List<StaffModel> get staffList {
    if (_staffList is EqualUnmodifiableListView) return _staffList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_staffList);
  }

  @override
  final StaffModel? selectedStaff;
  @override
  final String? filterStatus;
  @override
  @JsonKey()
  final int currentPage;
  @override
  @JsonKey()
  final int pageSize;
  @override
  @JsonKey()
  final bool hasMore;
  @override
  @JsonKey()
  final int totalCount;

  @override
  String toString() {
    return 'StaffState(isLoading: $isLoading, isUpdating: $isUpdating, errorMessage: $errorMessage, staffList: $staffList, selectedStaff: $selectedStaff, filterStatus: $filterStatus, currentPage: $currentPage, pageSize: $pageSize, hasMore: $hasMore, totalCount: $totalCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StaffStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isUpdating, isUpdating) ||
                other.isUpdating == isUpdating) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality().equals(
              other._staffList,
              _staffList,
            ) &&
            (identical(other.selectedStaff, selectedStaff) ||
                other.selectedStaff == selectedStaff) &&
            (identical(other.filterStatus, filterStatus) ||
                other.filterStatus == filterStatus) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    isLoading,
    isUpdating,
    errorMessage,
    const DeepCollectionEquality().hash(_staffList),
    selectedStaff,
    filterStatus,
    currentPage,
    pageSize,
    hasMore,
    totalCount,
  );

  /// Create a copy of StaffState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StaffStateImplCopyWith<_$StaffStateImpl> get copyWith =>
      __$$StaffStateImplCopyWithImpl<_$StaffStateImpl>(this, _$identity);
}

abstract class _StaffState implements StaffState {
  const factory _StaffState({
    final bool isLoading,
    final bool isUpdating,
    final String? errorMessage,
    final List<StaffModel> staffList,
    final StaffModel? selectedStaff,
    final String? filterStatus,
    final int currentPage,
    final int pageSize,
    final bool hasMore,
    final int totalCount,
  }) = _$StaffStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isUpdating;
  @override
  String? get errorMessage;
  @override
  List<StaffModel> get staffList;
  @override
  StaffModel? get selectedStaff;
  @override
  String? get filterStatus;
  @override
  int get currentPage;
  @override
  int get pageSize;
  @override
  bool get hasMore;
  @override
  int get totalCount;

  /// Create a copy of StaffState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StaffStateImplCopyWith<_$StaffStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
