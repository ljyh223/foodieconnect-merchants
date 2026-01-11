import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:foodieconnectmerchant/core/constants/app_constants.dart';
import 'package:foodieconnectmerchant/core/theme/app_theme.dart';
import 'package:foodieconnectmerchant/l10n/generated/translations.g.dart';
import 'package:foodieconnectmerchant/presentation/providers/restaurant_provider.dart';
import 'package:foodieconnectmerchant/presentation/screens/restaurant/restaurant_edit_screen.dart';

import '../../../core/utils/image_utils.dart';

/// 餐厅信息页面
class RestaurantInfoScreen extends StatelessWidget {
  const RestaurantInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantProvider>(
      builder: (context, provider, child) {
        final t = Translations.of(context);
        final theme = Theme.of(context);
        return Scaffold(
          backgroundColor: theme.colorScheme.surface,
          appBar: AppBar(
            title: Text(t.restaurant.infoTitle),
            backgroundColor: theme.colorScheme.primary,
            foregroundColor: theme.colorScheme.onPrimary,
            elevation: 0,
          ),
          body: _buildBody(provider, t, theme),
        );
      },
    );
  }

  Widget _buildBody(
    RestaurantProvider provider,
    Translations t,
    ThemeData theme,
  ) {
    if (provider.isLoading) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(color: theme.colorScheme.primary),
            const SizedBox(height: 16),
            Text(t.restaurant.loading, style: theme.textTheme.bodyLarge),
          ],
        ),
      );
    }

    if (provider.errorMessage != null) {
      return _buildErrorWidget(provider.errorMessage!, t, theme);
    }

    if (provider.restaurant == null) {
      return _buildEmptyWidget(t, theme);
    }

    return Builder(
      builder: (context) {
        return _buildRestaurantInfo(
          context,
          provider,
          provider.restaurant!,
          t,
          theme,
        );
      },
    );
  }

  Widget _buildRestaurantInfo(
    BuildContext context,
    RestaurantProvider provider,
    dynamic restaurant,
    Translations t,
    ThemeData theme,
  ) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppConstants.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 餐厅名称 - 大标题
          Text(
            restaurant.name,
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onSurface,
            ),
          ),

          const SizedBox(height: AppConstants.defaultPadding),

          // 餐厅基本信息 - 扁平化布局
          _buildSectionTitle(t.restaurant.basicInfo, theme),
          _buildInfoRow(t.restaurant.restaurantType, restaurant.type, theme),
          _buildInfoRow(
            t.restaurant.restaurantAddress,
            restaurant.address,
            theme,
          ),
          _buildInfoRow(t.restaurant.restaurantPhone, restaurant.phone, theme),
          _buildInfoRow(
            t.restaurant.businessHours,
            restaurant.hours ?? t.restaurant.closed,
            theme,
          ),
          _buildInfoRow(
            t.restaurant.operatingStatus,
            restaurant.statusDisplay,
            theme,
          ),

          const SizedBox(height: AppConstants.defaultPadding * 2),

          // 餐厅图片 - 仅当有图片时显示
          if (restaurant.displayImage?.isNotEmpty == true)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionTitle(t.restaurant.restaurantImage, theme),
                const SizedBox(height: AppConstants.defaultPadding / 2),
                GestureDetector(
                  onTap: () {
                    _showImagePreview(context, restaurant.displayImage!);
                  },
                  child: Image.network(
                    ImageUtils.getFullImageUrl(restaurant.displayImage!),
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(); // 如果图片加载失败，不显示任何内容
                    },
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        height: 200,
                        width: double.infinity,
                        color: theme.colorScheme.surfaceContainerHighest,
                        child: Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                : null,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),

          // 餐厅描述 - 仅当有描述时显示
          if (restaurant.description?.isNotEmpty == true)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: AppConstants.defaultPadding * 2),
                _buildSectionTitle(t.restaurant.restaurantDescription, theme),
                const SizedBox(height: AppConstants.defaultPadding / 2),
                Text(
                  restaurant.description!,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    height: 1.5,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ],
            ),

          const SizedBox(height: AppConstants.defaultPadding * 2),

          // 评价信息
          _buildSectionTitle(t.restaurant.reviewInfo, theme),
          const SizedBox(height: AppConstants.defaultPadding / 2),
          Row(
            children: [
              Expanded(
                child: _buildInfoRow(
                  t.restaurant.rating,
                  restaurant.ratingDisplay,
                  theme,
                ),
              ),
              Expanded(
                child: _buildInfoRow(
                  t.restaurant.reviewCount,
                  restaurant.reviewCountDisplay,
                  theme,
                ),
              ),
            ],
          ),

          const SizedBox(height: AppConstants.defaultPadding * 2),

          // 聊天室验证码
          _buildSectionTitle(t.restaurant.chatRoomVerificationCode, theme),
          const SizedBox(height: AppConstants.defaultPadding / 2),
          Row(
            children: [
              Expanded(
                child: _buildInfoRow(
                  t.restaurant.currentCode,
                  provider.chatRoomVerificationCode ?? t.restaurant.loadingCode,
                  theme,
                ),
              ),
              const SizedBox(width: AppConstants.defaultPadding),
              ElevatedButton(
                onPressed: () {
                  // 修改验证码
                  _showUpdateVerificationCodeDialog(
                    context,
                    provider,
                    t,
                    theme,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  foregroundColor: theme.colorScheme.onPrimary,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  minimumSize: const Size(80, 40),
                ),
                child: Text(t.restaurant.modify),
              ),
            ],
          ),

          const SizedBox(height: AppConstants.defaultPadding * 3),

          // 操作按钮
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // 编辑餐厅信息
                    _showEditRestaurantDialog(context, restaurant);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    foregroundColor: theme.colorScheme.onPrimary,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: Text(t.restaurant.editInfo),
                ),
              ),
              const SizedBox(width: AppConstants.defaultPadding),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // 切换营业状态
                    _toggleRestaurantStatus(context, provider, t);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    foregroundColor: theme.colorScheme.onPrimary,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: Text(
                    restaurant.isCurrentlyOpen
                        ? t.restaurant.setClosed
                        : t.restaurant.setOpen,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: AppConstants.defaultPadding),

          // 设置按钮
          ElevatedButton(
            onPressed: () {
              // 跳转到设置页面
              Navigator.of(context).pushNamed('/settings');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.colorScheme.secondary,
              foregroundColor: theme.colorScheme.onSecondary,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: Text(t.auth.settings),
          ),
        ],
      ),
    );
  }

  /// 构建章节标题
  Widget _buildSectionTitle(String title, ThemeData theme) {
    return Text(
      title,
      style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
    );
  }

  Widget _buildInfoRow(String label, String value, ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              '$label:',
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorWidget(String error, Translations t, ThemeData theme) {
    return Builder(
      builder: (context) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, size: 64, color: AppTheme.errorColor),
              const SizedBox(height: AppConstants.defaultPadding),
              Text(
                error,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: AppTheme.errorColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppConstants.defaultPadding),
              ElevatedButton(
                onPressed: () {
                  // 重新加载
                  if (context.mounted) {
                    Provider.of<RestaurantProvider>(
                      context,
                      listen: false,
                    ).loadRestaurant();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  foregroundColor: theme.colorScheme.onPrimary,
                ),
                child: Text(t.restaurant.retry),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildEmptyWidget(Translations t, ThemeData theme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.restaurant,
            size: 64,
            color: theme.colorScheme.onSurfaceVariant,
          ),
          SizedBox(height: AppConstants.defaultPadding),
          Text(
            t.restaurant.noData,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  void _showEditRestaurantDialog(BuildContext context, dynamic restaurant) {
    Navigator.of(context)
        .push(
          MaterialPageRoute(
            builder: (context) => RestaurantEditScreen(restaurant: restaurant),
          ),
        )
        .then((result) {
          if (result == true) {
            // 编辑成功，刷新数据
            if (context.mounted) {
              Provider.of<RestaurantProvider>(
                context,
                listen: false,
              ).loadRestaurant();
            }
          }
        });
  }

  void _toggleRestaurantStatus(
    BuildContext context,
    RestaurantProvider provider,
    Translations t,
  ) {
    provider.toggleRestaurantStatus().then((success) {
      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              provider.restaurant?.isCurrentlyOpen == true
                  ? t.restaurant.setOpenSuccess
                  : t.restaurant.setClosedSuccess,
            ),
            backgroundColor: AppTheme.successColor,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(t.restaurant.statusToggleFailed),
            backgroundColor: AppTheme.errorColor,
          ),
        );
      }
    });
  }

  /// 显示图片预览对话框
  void _showImagePreview(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(20),
        child: Stack(
          children: [
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                color: Colors.black54,
                child: Center(
                  child: Hero(
                    tag: 'restaurant_image_$imageUrl',
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        ImageUtils.getFullImageUrl(imageUrl),
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 300,
                            height: 300,
                            color: Colors.grey[300],
                            child: const Icon(
                              Icons.broken_image,
                              size: 50,
                              color: Colors.grey,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 40,
              right: 20,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white, size: 30),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 显示修改聊天室验证码对话框
  void _showUpdateVerificationCodeDialog(
    BuildContext context,
    RestaurantProvider provider,
    Translations t,
    ThemeData theme,
  ) {
    final TextEditingController _controller = TextEditingController(
      text: provider.chatRoomVerificationCode,
    );
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: theme.colorScheme.surface,
        surfaceTintColor: theme.colorScheme.surface,
        title: Text(t.restaurant.editVerificationCode),
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: t.restaurant.newCode,
                  hintText: t.restaurant.enterNewCode,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: theme.colorScheme.outline),
                  ),
                ),
                style: TextStyle(color: theme.colorScheme.onSurface),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return t.restaurant.enterCode;
                  }
                  if (value.length < 4) {
                    return t.restaurant.codeMinLength.replaceAll('{min}', '4');
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            style: TextButton.styleFrom(
              foregroundColor: theme.colorScheme.onSurface,
            ),
            child: Text(t.restaurant.cancel),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState?.validate() == true) {
                final newCode = _controller.text.trim();
                provider.updateChatRoomVerificationCode(newCode).then((
                  success,
                ) {
                  if (success) {
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(t.restaurant.codeUpdateSuccess),
                        backgroundColor: AppTheme.successColor,
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          provider.errorMessage ??
                              t.restaurant.codeUpdateFailed,
                        ),
                        backgroundColor: AppTheme.errorColor,
                      ),
                    );
                  }
                });
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.colorScheme.primary,
              foregroundColor: theme.colorScheme.onPrimary,
            ),
            child: Text(t.restaurant.save),
          ),
        ],
      ),
    );
  }
}
