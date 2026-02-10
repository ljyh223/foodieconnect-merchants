import '../services/api_service.dart';

class ReviewApi {
  static Future<Map<String, dynamic>> getItemReviews({
    required int itemId,
    int page = 0,
    int size = 20,
    int? rating,
  }) async {
    final Map<String, dynamic> queryParameters = {
      'page': page,
      'size': size,
    };

    if (rating != null) {
      queryParameters['rating'] = rating;
    }

    final response = await ApiService().get<Map<String, dynamic>>(
      '/merchant/menu-items/$itemId/reviews',
      queryParameters: queryParameters,
    );
    return response.data!;
  }
}
