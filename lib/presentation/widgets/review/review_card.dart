import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:foodieconnectmerchant/data/models/review/dish_review_model.dart';
import 'package:foodieconnectmerchant/l10n/generated/translations.g.dart';
import 'package:foodieconnectmerchant/core/utils/image_utils.dart';
import 'package:foodieconnectmerchant/core/utils/logger.dart';

class ReviewCard extends StatelessWidget {
  final DishReviewModel review;

  const ReviewCard({
    super.key,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final theme = Theme.of(context);

    // Debug: Log image data
    AppLogger.debug('ReviewCard: images count = ${review.images.length}');
    for (var i = 0; i < review.images.length; i++) {
      AppLogger.debug('ReviewCard: image[$i] = ${review.images[i]} -> fullUrl = ${ImageUtils.getFullImageUrl(review.images[i])}');
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 用户信息和评分
            Row(
              children: [
                // 用户头像
                CircleAvatar(
                  radius: 20,
                  backgroundColor: theme.colorScheme.primaryContainer,
                  backgroundImage: review.userAvatar != null
                      ? CachedNetworkImageProvider(ImageUtils.getFullImageUrl(review.userAvatar))
                      : null,
                  child: review.userAvatar == null
                      ? Text(
                          review.userName.isNotEmpty ? review.userName[0].toUpperCase() : '?',
                          style: TextStyle(
                            color: theme.colorScheme.onPrimaryContainer,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : null,
                ),
                const SizedBox(width: 12),

                // 用户名和评分
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        review.userName,
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          ...List.generate(5, (index) {
                            return Icon(
                              index < review.rating ? Icons.star : Icons.star_border,
                              size: 16,
                              color: Colors.amber,
                            );
                          }),
                          const SizedBox(width: 8),
                          Text(
                            '${review.rating}.0',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // 时间
                Text(
                  '${t.review.postedOn}${review.createdAt}',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),

            // 评论内容
            if (review.comment != null && review.comment!.isNotEmpty) ...[
              const SizedBox(height: 12),
              Text(
                review.comment!,
                style: theme.textTheme.bodyMedium,
              ),
            ],

            // 评价图片
            if (review.images.isNotEmpty) ...[
              const SizedBox(height: 12),
              Text(
                t.review.reviewImages,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: review.images
                      .where((url) => url.isNotEmpty) // Filter out empty strings
                      .take(4)
                      .map((imageUrl) {
                    final fullImageUrl = ImageUtils.getFullImageUrl(imageUrl);
                    AppLogger.debug('Displaying image: $imageUrl -> $fullImageUrl');
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: GestureDetector(
                        onTap: () {
                          final nonEmptyImages = review.images.where((url) => url.isNotEmpty).toList();
                          _showImageViewer(context, nonEmptyImages, nonEmptyImages.indexOf(imageUrl));
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: CachedNetworkImage(
                            imageUrl: fullImageUrl,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Container(
                              width: 80,
                              height: 80,
                              color: theme.colorScheme.surfaceContainerHighest,
                              child: const Icon(Icons.image),
                            ),
                            errorWidget: (context, url, error) {
                              AppLogger.error('Failed to load image: $fullImageUrl, error: $error');
                              return Container(
                                width: 80,
                                height: 80,
                                color: theme.colorScheme.surfaceContainerHighest,
                                child: const Icon(Icons.broken_image),
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _showImageViewer(BuildContext context, List<String> images, int initialIndex) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => _ReviewImageViewer(
          images: images,
          initialIndex: initialIndex,
        ),
      ),
    );
  }
}

/// 评价图片查看器
class _ReviewImageViewer extends StatefulWidget {
  final List<String> images;
  final int initialIndex;

  const _ReviewImageViewer({
    required this.images,
    required this.initialIndex,
  });

  @override
  State<_ReviewImageViewer> createState() => _ReviewImageViewerState();
}

class _ReviewImageViewerState extends State<_ReviewImageViewer> {
  late PageController _pageController;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          '${_currentIndex + 1} / ${widget.images.length}',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: widget.images.length,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          return Center(
            child: InteractiveViewer(
              minScale: 0.5,
              maxScale: 3.0,
              child: CachedNetworkImage(
                imageUrl: ImageUtils.getFullImageUrl(widget.images[index]),
                fit: BoxFit.contain,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                ),
                errorWidget: (context, url, error) => const Center(
                  child: Icon(Icons.broken_image, color: Colors.white, size: 64),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
