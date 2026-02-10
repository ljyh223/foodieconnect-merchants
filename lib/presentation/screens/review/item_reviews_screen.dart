import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:foodieconnectmerchant/core/theme/app_theme.dart';
import 'package:foodieconnectmerchant/l10n/generated/translations.g.dart';
import 'package:foodieconnectmerchant/presentation/providers/review_provider.dart';
import 'package:foodieconnectmerchant/presentation/widgets/review/review_card.dart';
import 'package:foodieconnectmerchant/presentation/widgets/review/rating_filter_chip.dart';

class ItemReviewsScreen extends StatefulWidget {
  final int itemId;
  final String itemName;

  const ItemReviewsScreen({
    super.key,
    required this.itemId,
    required this.itemName,
  });

  static void show(BuildContext context, {
    required int itemId,
    required String itemName,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider(
          create: (_) => ReviewProvider(),
          child: ItemReviewsScreen(itemId: itemId, itemName: itemName),
        ),
      ),
    );
  }

  @override
  State<ItemReviewsScreen> createState() => _ItemReviewsScreenState();
}

class _ItemReviewsScreenState extends State<ItemReviewsScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _loadReviews();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      _loadMore();
    }
  }

  Future<void> _loadReviews() async {
    final provider = Provider.of<ReviewProvider>(context, listen: false);
    await provider.loadReviews(widget.itemId, refresh: true);
  }

  Future<void> _loadMore() async {
    final provider = Provider.of<ReviewProvider>(context, listen: false);
    if (!provider.isLoadingMore && provider.hasMore) {
      await provider.loadReviews(widget.itemId);
    }
  }

  Future<void> _onRefresh() async {
    await _loadReviews();
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(t.review.itemReviews),
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.onPrimary,
      ),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: Consumer<ReviewProvider>(
          builder: (context, provider, child) {
            // Build the content section based on state
            Widget content;

            if (provider.isLoading && provider.reviews.isEmpty) {
              // Initial loading state
              content = const Center(child: CircularProgressIndicator());
            } else if (provider.errorMessage != null && provider.reviews.isEmpty) {
              // Error state
              content = Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error_outline, size: 64, color: AppTheme.errorColor),
                    const SizedBox(height: 16),
                    Text(provider.errorMessage!),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _loadReviews,
                      child: Text(t.review.retry),
                    ),
                  ],
                ),
              );
            } else if (provider.reviews.isEmpty) {
              // Empty state (no reviews)
              content = Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.rate_review, size: 64, color: AppTheme.textSecondary),
                    const SizedBox(height: 16),
                    Text(t.review.noReviewsForItem),
                  ],
                ),
              );
            } else {
              // Reviews list
              content = ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.all(16),
                itemCount: provider.reviews.length + (provider.hasMore ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index < provider.reviews.length) {
                    return ReviewCard(review: provider.reviews[index]);
                  } else {
                    return provider.isLoadingMore
                        ? const Center(
                            child: Padding(
                              padding: EdgeInsets.all(16),
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : const SizedBox.shrink();
                  }
                },
              );
            }

            // Always show filter bar at the top, then the content
            return Column(
              children: [
                // 评分筛选栏 - Always visible
                RatingFilterChip(
                  selectedRating: provider.selectedRating,
                  onFilterChanged: (rating) {
                    provider.filterByRating(rating, widget.itemId);
                  },
                ),
                // 内容区域
                Expanded(child: content),
              ],
            );
          },
        ),
      ),
    );
  }
}
