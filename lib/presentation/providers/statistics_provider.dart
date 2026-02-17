import 'package:flutter/foundation.dart';
import 'package:foodieconnectmerchant/data/services/statistics_service.dart';
import 'package:foodieconnectmerchant/data/models/statistics/overview_stats_response.dart';
import 'package:foodieconnectmerchant/core/utils/logger.dart';

class StatisticsProvider extends ChangeNotifier {
  final StatisticsService _statisticsService = StatisticsService();

  // 状态变量
  bool _isLoading = false;
  OverviewStatsResponse? _statsData;
  String? _errorMessage;

  // Getters
  bool get isLoading => _isLoading;
  OverviewStatsResponse? get statsData => _statsData;
  String? get errorMessage => _errorMessage;

  /// Load statistics data
  Future<void> loadStats({
    String? date,
    int? year,
    int? month,
  }) async {
    if (_isLoading) return;

    try {
      _isLoading = true;
      _errorMessage = null;
      notifyListeners();

      AppLogger.info('StatisticsProvider: Loading statistics data');

      final response = await _statisticsService.getOverviewStats(
        date: date,
        year: year,
        month: month,
      );

      if (response.isSuccess && response.data != null) {
        _statsData = response.data!;
        AppLogger.info('StatisticsProvider: Successfully loaded statistics data');
      } else {
        _errorMessage = response.errorMessage;
      }

      notifyListeners();
    } catch (e) {
      AppLogger.error('StatisticsProvider: Exception while loading statistics data', error: e);
      _errorMessage = 'Failed to load statistics data, please try again later';
      notifyListeners();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
