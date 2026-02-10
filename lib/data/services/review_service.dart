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
      AppLogger.info('ReviewService: 获取菜品评价 - itemId: $itemId, page: $page');

      final result = await _reviewRepository.getItemReviews(
        itemId: itemId,
        page: page,
        size: size,
        rating: rating,
      );

      return result.when(
        loading: () => ApiResponse.error('加载中'),
        success: (data) {
          AppLogger.info('ReviewService: 获取菜品评价成功');
          return ApiResponse.success(data);
        },
        error: (message, code, details) {
          AppLogger.warning('ReviewService: 获取菜品评价失败 - $message');
          return ApiResponse.error(message, code: code);
        },
      );
    } catch (e) {
      AppLogger.error('ReviewService: 获取菜品评价异常', error: e);
      return ApiResponse.error('获取菜品评价失败，请稍后重试');
    }
  }
}
