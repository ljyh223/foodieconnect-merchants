import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:foodieconnect/core/constants/app_constants.dart';
import 'package:foodieconnect/core/theme/app_theme.dart';
import 'package:foodieconnect/presentation/providers/restaurant_provider.dart';

/// 餐厅信息页面
class RestaurantInfoScreen extends StatelessWidget {
  const RestaurantInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: AppTheme.surfaceColor,
          appBar: AppBar(
            title: const Text('餐厅信息'),
            backgroundColor: AppTheme.primaryColor,
            foregroundColor: Colors.white,
            elevation: 0,
          ),
          body: _buildBody(provider),
        );
      },
    );
  }

  Widget _buildBody(RestaurantProvider provider) {
    if (provider.isLoading) {
      return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  const SizedBox(height: 16),
                  Text('加载餐厅信息中...'),
                ],
              ),
            );
    }

    if (provider.errorMessage != null) {
      return _buildErrorWidget(provider.errorMessage!);
    }

    if (provider.restaurant == null) {
      return _buildEmptyWidget();
    }

    return Builder(
      builder: (context) {
        return _buildRestaurantInfo(context, provider, provider.restaurant!);
      },
    );
  }

  Widget _buildRestaurantInfo(BuildContext context, RestaurantProvider provider, dynamic restaurant) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppConstants.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 餐厅基本信息卡片
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppConstants.defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoRow('餐厅名称', restaurant.name),
                  _buildInfoRow('餐厅类型', restaurant.type),
                  _buildInfoRow('地址', restaurant.address),
                  _buildInfoRow('电话', restaurant.phone),
                  _buildInfoRow('营业时间', restaurant.hours ?? '未设置'),
                  _buildInfoRow('营业状态', restaurant.statusDisplay),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: AppConstants.defaultPadding),
          
          // 餐厅图片卡片
          if (restaurant.displayImage?.isNotEmpty == true)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(AppConstants.defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '餐厅图片',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: AppConstants.defaultPadding / 2),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
                      child: Image.network(
                        restaurant.displayImage!,
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 200,
                            width: double.infinity,
                            color: AppTheme.surfaceColor,
                            child: const Icon(
                              Icons.broken_image,
                              color: AppTheme.textSecondary,
                              size: 50,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          
          const SizedBox(height: AppConstants.defaultPadding),
          
          // 餐厅描述卡片
          if (restaurant.description?.isNotEmpty == true)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(AppConstants.defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '餐厅描述',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: AppConstants.defaultPadding / 2),
                    Text(
                      restaurant.description!,
                      style: const TextStyle(
                        fontSize: 14,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          
          const SizedBox(height: AppConstants.defaultPadding),
          
          // 评分和评价信息卡片
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppConstants.defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '评价信息',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: AppConstants.defaultPadding / 2),
                  Row(
                    children: [
                      Expanded(
                        child: _buildInfoRow('评分', restaurant.ratingDisplay),
                      ),
                      Expanded(
                        child: _buildInfoRow('评价数', restaurant.reviewCountDisplay),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: AppConstants.defaultPadding * 2),
          
          // 操作按钮
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // 编辑餐厅信息
                    _showEditRestaurantDialog(context, restaurant);
                  },
                  child: const Text('编辑信息'),
                ),
              ),
              const SizedBox(width: AppConstants.defaultPadding),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // 切换营业状态
                    _toggleRestaurantStatus(context, provider);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: restaurant.isCurrentlyOpen 
                        ? AppTheme.warningColor 
                        : AppTheme.successColor,
                  ),
                  child: Text(
                    restaurant.isCurrentlyOpen ? '设置打烊' : '设置营业',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              '$label:',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppTheme.textSecondary,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorWidget(String error) {
    return Builder(
      builder: (context) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                size: 64,
                color: AppTheme.errorColor,
              ),
              const SizedBox(height: AppConstants.defaultPadding),
              Text(
                error,
                style: const TextStyle(
                  fontSize: 16,
                  color: AppTheme.errorColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppConstants.defaultPadding),
              ElevatedButton(
                onPressed: () {
                  // 重新加载
                  if (context.mounted) {
                    Provider.of<RestaurantProvider>(context, listen: false).loadRestaurant();
                  }
                },
                child: const Text('重试'),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildEmptyWidget() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.restaurant,
            size: 64,
            color: AppTheme.textSecondary,
          ),
          SizedBox(height: AppConstants.defaultPadding),
          Text(
            '暂无餐厅信息',
            style: TextStyle(
              fontSize: 16,
              color: AppTheme.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  void _showEditRestaurantDialog(BuildContext context, dynamic restaurant) {
    // 这里可以实现编辑餐厅信息的对话框
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('编辑功能开发中...'),
      ),
    );
  }

  void _toggleRestaurantStatus(BuildContext context, RestaurantProvider provider) {
    provider.toggleRestaurantStatus().then((success) {
      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              provider.restaurant?.isCurrentlyOpen == true ? '已设置营业' : '已设置打烊',
            ),
            backgroundColor: AppTheme.successColor,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('状态切换失败'),
            backgroundColor: AppTheme.errorColor,
          ),
        );
      }
    });
  }
}