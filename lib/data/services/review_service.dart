import '../models/review/paginated_review_response.dart';
import '../models/common/api_response.dart';
import '../repository/review_repository.dart';
import 'package:foodieconnectmerchant/core/utils/logger.dart';

class ReviewService {
  final ReviewRepository _reviewRepository = ReviewRepository();

  Future<ApiResponse<PaginatedReviewResponse>> getItemReviews({
    required int itemId,
    int page = 0,
    int size = 20,
    int? rating,
  }) async {
    try {
      AppLogger.info('ReviewService: Fetching item reviews - itemId: $itemId, page: $page');

      final result = await _reviewRepository.getItemReviews(
        itemId: itemId,
        page: page,
        size: size,
        rating: rating,
      );

      return result.when(
        loading: () => ApiResponse.error('Loading'),
        success: (data) {
          AppLogger.info('ReviewService: Successfully fetched item reviews');
          return ApiResponse.success(data);
        },
        error: (message, code, details) {
          AppLogger.warning('ReviewService: Failed to fetch item reviews - $message');
          return ApiResponse.error(message, code: code);
        },
      );
    } catch (e) {
      AppLogger.error('ReviewService: Exception while fetching item reviews', error: e);
      return ApiResponse.error('Failed to fetch item reviews, please try again later');
    }
  }
}
