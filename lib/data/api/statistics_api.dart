import '../services/api_service.dart';

class StatisticsApi {
  static Future<Map<String, dynamic>> getOverviewStats({
    String? date,
    int? year,
    int? month,
  }) async {
    final Map<String, dynamic> queryParameters = {};

    if (date != null) {
      queryParameters['date'] = date;
    }
    if (year != null) {
      queryParameters['year'] = year;
    }
    if (month != null) {
      queryParameters['month'] = month;
    }

    final response = await ApiService().get<Map<String, dynamic>>(
      '/merchant/statistics/overview',
      queryParameters: queryParameters,
    );
    return response.data!;
  }
}
