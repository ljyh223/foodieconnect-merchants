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

  /// Load reviews list
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

      AppLogger.info('ReviewProvider: Loading reviews - itemId: $itemId, page: $_currentPage');

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

        AppLogger.info('ReviewProvider: Successfully loaded reviews - Loaded ${_reviews.length} reviews');
      } else {
        _errorMessage = response.errorMessage;
      }

      notifyListeners();
    } catch (e) {
      AppLogger.error('ReviewProvider: Exception while loading reviews', error: e);
      _errorMessage = 'Failed to load reviews, please try again later';
      notifyListeners();
    } finally {
      _isLoading = false;
      _isLoadingMore = false;
      notifyListeners();
    }
  }

  /// Filter by rating
  Future<void> filterByRating(int? rating, int itemId) async {
    if (_selectedRating == rating) return;

    _selectedRating = rating;

    // Reload first page
    await loadReviews(itemId, refresh: true);
  }

  /// Clear filter
  Future<void> clearFilter(int itemId) async {
    await filterByRating(null, itemId);
  }
}
