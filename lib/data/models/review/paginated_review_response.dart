import 'package:freezed_annotation/freezed_annotation.dart';
import 'dish_review_model.dart';

part 'paginated_review_response.freezed.dart';
part 'paginated_review_response.g.dart';

@freezed
class PaginatedReviewResponse with _$PaginatedReviewResponse {
  const factory PaginatedReviewResponse({
    @JsonKey(name: 'records') required List<DishReviewModel> records,
    @JsonKey(name: 'total') required int total,
    @JsonKey(name: 'size') required int size,
    @JsonKey(name: 'current') required int current,
  }) = _PaginatedReviewResponse;

  factory PaginatedReviewResponse.fromJson(Map<String, dynamic> json) =>
      _$PaginatedReviewResponseFromJson(json);
}
