import 'package:flutter/material.dart';
import 'package:foodieconnectmerchant/core/theme/app_theme.dart';
import 'package:foodieconnectmerchant/core/utils/image_utils.dart';
import 'package:foodieconnectmerchant/data/models/menu/menu_item_model.dart';
import 'package:foodieconnectmerchant/l10n/generated/translations.g.dart';

/// 菜品卡片组件
class ItemCard extends StatelessWidget {
  final MenuItemModel item;
  final Function(String) onAction;

  const ItemCard({super.key, required this.item, required this.onAction});

  /// 格式化日期显示
  String _formatDate(DateTime date, BuildContext context) {
    final t = Translations.of(context).menu;
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) {
      return t.today;
    } else if (difference.inDays == 1) {
      return t.yesterday;
    } else if (difference.inDays < 7) {
      return '${difference.inDays}${t.daysAgo}';
    } else {
      return '${date.month}/${date.day}';
    }
  }

  /// 获取辣度显示文本
  String _getSpiceLevelDisplay(BuildContext context) {
    final t = Translations.of(context).menu;
    if (item.spiceLevel == null) return t.spiceNone;
    switch (item.spiceLevel!.toUpperCase()) {
      case 'NONE':
        return t.spiceNone;
      case 'MILD':
        return t.spiceMild;
      case 'MEDIUM':
        return t.spiceMedium;
      case 'HOT':
        return t.spiceHot;
      default:
        return item.spiceLevel!;
    }
  }

  /// 获取制作时间显示文本
  String _getPreparationTimeDisplay(BuildContext context) {
    final t = Translations.of(context).menu;
    if (item.preparationTime == null) return '';
    return '${item.preparationTime}${t.minutes}';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 菜品头部信息
            Row(
              children: [
                // 菜品图片
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    ImageUtils.getFullImageUrl(item.imageUrl),
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 60,
                        height: 60,
                        color: colorScheme.surfaceContainerHighest,
                        child: Icon(
                          Icons.restaurant,
                          color: colorScheme.onSurfaceVariant,
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(width: 16),

                // 菜品基本信息
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name,
                        style: textTheme.titleSmall,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),

                      const SizedBox(height: 4),

                      // 价格信息
                      Row(
                        children: [
                          if (item.hasDiscount) ...[
                            Text(
                              item.originalPriceDisplay!,
                              style: TextStyle(
                                fontSize: 12,
                                color: colorScheme.onSurfaceVariant,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            const SizedBox(width: 8),
                          ],
                          Text(
                            item.priceDisplay,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: colorScheme.primary,
                            ),
                          ),

                          if (item.hasDiscount) ...[
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: colorScheme.error,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                item.discountDisplay,
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),

                // 操作按钮
                PopupMenuButton<String>(
                  icon: const Icon(Icons.more_vert),
                  onSelected: onAction,
                  itemBuilder: (BuildContext context) => [
                    PopupMenuItem<String>(
                      value: 'edit',
                      child: Row(
                        children: [
                          const Icon(Icons.edit, size: 20),
                          const SizedBox(width: 8),
                          Text(Translations.of(context).menu.edit),
                        ],
                      ),
                    ),
                    PopupMenuItem<String>(
                      value: item.isAvailable ? 'disable' : 'enable',
                      child: Row(
                        children: [
                          Icon(
                            item.isAvailable ? Icons.block : Icons.check_circle,
                            size: 20,
                            color: item.isAvailable
                                ? colorScheme.error
                                : AppTheme.successColor,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            item.isAvailable
                                ? Translations.of(context).menu.disable
                                : Translations.of(context).menu.enable,
                          ),
                        ],
                      ),
                    ),
                    PopupMenuItem<String>(
                      value: item.isRecommended ? 'unrecommend' : 'recommend',
                      child: Row(
                        children: [
                          Icon(
                            item.isRecommended ? Icons.star_border : Icons.star,
                            size: 20,
                            color: AppTheme.warningColor,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            item.isRecommended
                                ? Translations.of(
                                    context,
                                  ).menu.unsetAsRecommended
                                : Translations.of(
                                    context,
                                  ).menu.setAsRecommended,
                          ),
                        ],
                      ),
                    ),
                    PopupMenuItem<String>(
                      value: 'reviews',
                      child: Row(
                        children: [
                          const Icon(Icons.rate_review, size: 20),
                          const SizedBox(width: 8),
                          Text(Translations.of(context).review.viewReviews),
                        ],
                      ),
                    ),
                    PopupMenuItem<String>(
                      value: 'delete',
                      child: Row(
                        children: [
                          const Icon(
                            Icons.delete,
                            size: 20,
                            color: AppTheme.errorColor,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            Translations.of(context).menu.delete,
                            style: TextStyle(color: colorScheme.error),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),

            // 菜品描述
            if (item.description?.isNotEmpty == true) ...[
              const SizedBox(height: 8),
              Text(
                item.description!,
                style: TextStyle(
                  fontSize: 12,
                  color: colorScheme.onSurfaceVariant,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],

            // 菜品状态标签和额外信息
            const SizedBox(height: 8),
            Row(
              children: [
                // 状态标签
                Wrap(
                  spacing: 8,
                  children: [
                    if (item.isRecommended)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.warningColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          Translations.of(context).menu.recommended,
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),

                    if (!item.isAvailable)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: colorScheme.error,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          Translations.of(context).menu.unavailable,
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),

                    if (item.spiceLevel != null)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: colorScheme.secondary,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          _getSpiceLevelDisplay(context),
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),

                    if (item.preparationTime != null)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.successColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          _getPreparationTimeDisplay(context),
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                  ],
                ),

                const Spacer(),

                // 创建时间
                if (item.createdAt != null)
                  Text(
                    '${Translations.of(context).menu.created}${_formatDate(item.createdAt!, context)}',
                    style: TextStyle(
                      fontSize: 10,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
