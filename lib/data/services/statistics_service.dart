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
      AppLogger.info('StatisticsService: 获取统计概览');

      final result = await _statisticsRepository.getOverviewStats(
        date: date,
        year: year,
        month: month,
      );

      return result.when(
        loading: () => ApiResponse.error('加载中'),
        success: (data) {
          AppLogger.info('StatisticsService: 获取统计概览成功');
          return ApiResponse.success(data);
        },
        error: (message, code, details) {
          AppLogger.warning('StatisticsService: 获取统计概览失败 - $message');
          return ApiResponse.error(message, code: code);
        },
      );
    } catch (e) {
      AppLogger.error('StatisticsService: 获取统计概览异常', error: e);
      return ApiResponse.error('获取统计数据失败，请稍后重试');
    }
  }
}
