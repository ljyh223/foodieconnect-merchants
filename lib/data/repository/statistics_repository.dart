import '../api/statistics_api.dart';
import '../models/statistics/overview_stats_response.dart';
import '../models/common/api_result.dart';
import 'base_repository.dart';

class StatisticsRepository extends BaseRepository {
  Future<ApiResult<OverviewStatsResponse>> getOverviewStats({
    String? date,
    int? year,
    int? month,
  }) async {
    return safeApiCall(
      () => StatisticsApi.getOverviewStats(
        date: date,
        year: year,
        month: month,
      ),
      (data) => OverviewStatsResponse.fromJson(data),
    );
  }
}
