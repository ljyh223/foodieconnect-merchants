import 'package:flutter/foundation.dart';
import 'package:foodieconnectmerchant/data/services/review_service.dart';
import 'package:foodieconnectmerchant/data/models/review/dish_review_model.dart';
import 'package:foodieconnectmerchant/core/utils/logger.dart';

class ReviewProvider extends ChangeNotifier {
  final ReviewService _reviewService = ReviewService();

  // 状态变量
  bool _isLoading = false;
  bool _isLoadingMore = false;
  final List<DishReviewModel> _reviews = [];
  int _currentPage = 0;
  int _totalCount = 0;
  bool _hasMore = true;
  int? _selectedRating;
  String? _errorMessage;

  // Getters
  bool get isLoading => _isLoading;
  bool get isLoadingMore => _isLoadingMore;
  List<DishReviewModel> get reviews => _reviews;
  int get currentPage => _currentPage;
  int get totalCount => _totalCount;
  bool get hasMore => _hasMore;
  int? get selectedRating => _selectedRating;
  String? get errorMessage => _errorMessage;

  /// 加载评价列表
  Future<void> loadReviews(int itemId, {bool refresh = false}) async {
    if (refresh) {
      _currentPage = 0;
      _hasMore = true;
      _reviews.clear();
    }

    if (_isLoading || (_isLoadingMore) || !_hasMore) return;

    try {
      if (_currentPage == 0) {
        _isLoading = true;
      } else {
        _isLoadingMore = true;
      }
      _errorMessage = null;

      AppLogger.info('ReviewProvider: 加载评价 - itemId: $itemId, page: $_currentPage');

      final response = await _reviewService.getItemReviews(
        itemId: itemId,
        page: _currentPage,
        size: 20,
        rating: _selectedRating,
      );

      if (response.isSuccess && response.data != null) {
        final newReviews = response.data!.records;
        _reviews.addAll(newReviews);
        _totalCount = response.data!.total;
        _currentPage++;
        _hasMore = _reviews.length < _totalCount;

        AppLogger.info('ReviewProvider: 加载评价成功 - 已加载${_reviews.length}条');
      } else {
        _errorMessage = response.errorMessage;
      }

      notifyListeners();
    } catch (e) {
      AppLogger.error('ReviewProvider: 加载评价异常', error: e);
      _errorMessage = '加载评价失败，请稍后重试';
      notifyListeners();
    } finally {
      _isLoading = false;
      _isLoadingMore = false;
      notifyListeners();
    }
  }

  /// 按评分筛选
  Future<void> filterByRating(int? rating, int itemId) async {
    if (_selectedRating == rating) return;

    _selectedRating = rating;

    // 重新加载第一页
    await loadReviews(itemId, refresh: true);
  }

  /// 清除筛选
  Future<void> clearFilter(int itemId) async {
    await filterByRating(null, itemId);
  }
}
