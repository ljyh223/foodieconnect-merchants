import '../api/review_api.dart';
import '../models/review/paginated_review_response.dart';
import '../models/common/api_result.dart';
import 'base_repository.dart';

class ReviewRepository extends BaseRepository {
  Future<ApiResult<PaginatedReviewResponse>> getItemReviews({
    required int itemId,
    int page = 0,
    int size = 20,
    int? rating,
  }) async {
    return safeApiCall(
      () => ReviewApi.getItemReviews(
        itemId: itemId,
        page: page,
        size: size,
        rating: rating,
      ),
      (data) => PaginatedReviewResponse.fromJson(data),
    );
  }
}
