import '../models/statistics/overview_stats_response.dart';
import '../models/common/api_response.dart';
import '../repository/statistics_repository.dart';
import 'package:foodieconnectmerchant/core/utils/logger.dart';

class StatisticsService {
  final StatisticsRepository _statisticsRepository = StatisticsRepository();

  Future<ApiResponse<OverviewStatsResponse>> getOverviewStats({
    String? date,
    int? year,
    int? month,
  }) async {
    try {
      AppLogger.info('StatisticsService: Fetching statistics overview');

      final result = await _statisticsRepository.getOverviewStats(
        date: date,
        year: year,
        month: month,
      );

      return result.when(
        loading: () => ApiResponse.error('Loading'),
        success: (data) {
          AppLogger.info('StatisticsService: Successfully fetched statistics overview');
          return ApiResponse.success(data);
        },
        error: (message, code, details) {
          AppLogger.warning('StatisticsService: Failed to fetch statistics overview - $message');
          return ApiResponse.error(message, code: code);
        },
      );
    } catch (e) {
      AppLogger.error('StatisticsService: Exception while fetching statistics overview', error: e);
      return ApiResponse.error('Failed to fetch statistics data, please try again later');
    }
  }
}
