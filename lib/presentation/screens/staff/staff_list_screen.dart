import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:foodieconnect/core/constants/app_constants.dart';
import 'package:foodieconnect/core/theme/app_theme.dart';
import 'package:foodieconnect/core/utils/image_utils.dart';
import 'package:foodieconnect/presentation/providers/staff_provider.dart';
import 'package:foodieconnect/data/models/staff/staff_model.dart';

/// 员工列表页面
class StaffListScreen extends StatefulWidget {
  const StaffListScreen({super.key});

  @override
  State<StaffListScreen> createState() => _StaffListScreenState();
}

class _StaffListScreenState extends State<StaffListScreen> {
  bool _isInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialized) {
      // 延迟初始化，避免在build阶段触发状态更新
      Future.microtask(() {
        if (mounted && !_isInitialized) {
          _loadStaffData();
        }
      });
    }
  }

  /// 加载员工数据
  void _loadStaffData() {
    final provider = Provider.of<StaffProvider>(context, listen: false);
    if (provider.staffList.isEmpty) {
      provider.loadStaffList(refresh: true);
    }
    _isInitialized = true;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<StaffProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: AppTheme.surfaceColor,
          appBar: AppBar(
            title: const Text('员工管理'),
            backgroundColor: AppTheme.primaryColor,
            foregroundColor: Colors.white,
            elevation: 0,
            actions: [
              IconButton(
                onPressed: () {
                  // 刷新员工列表
                  provider.refreshStaffList();
                },
                icon: const Icon(Icons.refresh),
              ),
            ],
          ),
          body: _buildBody(provider),
        );
      },
    );
  }

  Widget _buildBody(StaffProvider provider) {
    if (provider.isLoading && provider.staffList.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            const SizedBox(height: 16),
            Text('加载员工列表中...'),
          ],
        ),
      );
    }

    if (provider.errorMessage != null) {
      return _buildErrorWidget(provider.errorMessage!);
    }

    if (provider.staffList.isEmpty) {
      return _buildEmptyWidget();
    }

    return _buildStaffList(provider);
  }

  Widget _buildStatsSection(StaffProvider provider) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppConstants.defaultPadding),
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          children: [
            const Text(
              '员工统计',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: AppConstants.defaultPadding),
            Row(
              children: [
                Expanded(
                  child: _buildStatCard('总员工数', '${provider.totalCount}', Icons.people),
                ),
                const SizedBox(width: AppConstants.defaultPadding),
                Expanded(
                  child: _buildStatCard('在线员工', '${provider.onlineStaffCount}', Icons.online_prediction),
                ),
              ],
            ),
            const SizedBox(height: AppConstants.defaultPadding),
            Row(
              children: [
                Expanded(
                  child: _buildStatCard('离线员工', '${provider.offlineStaffCount}', Icons.offline_bolt),
                ),
                const SizedBox(width: AppConstants.defaultPadding),
                Expanded(
                  child: _buildStatCard('忙碌员工', '${provider.busyStaffCount}', Icons.work),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(AppConstants.defaultPadding),
      decoration: BoxDecoration(
        color: AppTheme.primaryColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 24,
            color: AppTheme.primaryColor,
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: AppTheme.textSecondary,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppTheme.primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStaffList(StaffProvider provider) {
    return ListView(
      padding: const EdgeInsets.all(AppConstants.defaultPadding),
      children: [
        // 统计信息卡片 - 作为列表的第一项
        _buildStatsSection(provider),
        
        // 员工列表
        ...provider.staffList.map((staff) => _buildStaffCard(staff)),
      ],
    );
  }

  Widget _buildStaffCard(StaffModel staff) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppConstants.defaultPadding / 2),
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // 员工头像
                CircleAvatar(
                  radius: 30,
                  backgroundColor: AppTheme.surfaceColor,
                  backgroundImage: ImageUtils.isValidImagePath(staff.avatarUrl)
                      ? NetworkImage(ImageUtils.getFullImageUrl(staff.avatarUrl))
                      : null,
                  child: !ImageUtils.isValidImagePath(staff.avatarUrl)
                      ? Icon(
                          Icons.person,
                          color: AppTheme.textSecondary,
                        )
                      : null,
                ),
                
                const SizedBox(width: AppConstants.defaultPadding),
                
                // 员工信息
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                       staff.displayName,
                       style: const TextStyle(
                         fontSize: 16,
                         fontWeight: FontWeight.w500,
                       ),
                     ),
                      const SizedBox(height: 4),
                      Text(
                        staff.positionDisplay,
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppTheme.textSecondary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: _getStatusColor(staff.status),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              staff.statusDisplay,
                              style: const TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Text(
                            staff.ratingDisplay,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            
            // 操作按钮
            const SizedBox(height: 12),
            _buildActionButtons(staff),
          ],
        ),
      ),
    );
  }

  /// 构建操作按钮
  Widget _buildActionButtons(StaffModel staff) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              _toggleStaffStatus(staff);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: _getStatusButtonColor(staff.status),
              foregroundColor: Colors.white,
            ),
            child: Text(_getStatusButtonText(staff.status)),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: OutlinedButton(
            onPressed: () {
              _updateStaffRating(staff);
            },
            child: const Text('更新评分'),
          ),
        ),
      ],
    );
  }

  /// 获取状态颜色
  Color _getStatusColor(String status) {
    switch (status.toUpperCase()) {
      case 'ONLINE':
        return Colors.green; // 绿色
      case 'OFFLINE':
        return Colors.grey; // 灰色
      case 'BUSY':
        return Colors.orange; // 橙色
      default:
        return Colors.grey;
    }
  }

  /// 获取状态按钮颜色
  Color _getStatusButtonColor(String status) {
    switch (status.toUpperCase()) {
      case 'ONLINE':
        return Colors.orange; // 在线 -> 设为离线
      case 'OFFLINE':
        return Colors.green; // 离线 -> 设为在线
      case 'BUSY':
        return Colors.grey; // 忙碌 -> 设为离线
      default:
        return Colors.grey;
    }
  }

  /// 获取状态按钮文本
  String _getStatusButtonText(String status) {
    switch (status.toUpperCase()) {
      case 'ONLINE':
        return '设为离线';
      case 'OFFLINE':
        return '设为在线';
      case 'BUSY':
        return '设为离线';
      default:
        return '未知状态';
    }
  }

  /// 切换员工状态
  void _toggleStaffStatus(StaffModel staff) {
    final provider = Provider.of<StaffProvider>(context, listen: false);
    final newStatus = _getNextStatus(staff.status);
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('确认操作'),
        content: Text('确定要将 ${staff.displayName} 的状态设置为 ${_getStatusDisplayText(newStatus)} 吗？'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('取消'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
              await provider.updateStaffStatus(staff.id, newStatus);
            },
            child: const Text('确定'),
          ),
        ],
      ),
    );
  }

  /// 获取下一个状态
  String _getNextStatus(String currentStatus) {
    switch (currentStatus.toUpperCase()) {
      case 'ONLINE':
        return 'OFFLINE';
      case 'OFFLINE':
        return 'ONLINE';
      case 'BUSY':
        return 'OFFLINE';
      default:
        return 'OFFLINE';
    }
  }

  /// 获取状态显示文本
  String _getStatusDisplayText(String status) {
    switch (status.toUpperCase()) {
      case 'ONLINE':
        return '在线';
      case 'OFFLINE':
        return '离线';
      case 'BUSY':
        return '忙碌';
      default:
        return '未知';
    }
  }

  /// 更新员工评分
  void _updateStaffRating(StaffModel staff) {
    final provider = Provider.of<StaffProvider>(context, listen: false);
    final ratingController = TextEditingController(
      text: staff.rating?.toStringAsFixed(1) ?? '5.0'
    );
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('更新评分'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('为 ${staff.displayName} 设置新评分：'),
            const SizedBox(height: 16),
            TextField(
              controller: ratingController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: '评分 (0.0-5.0)',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('取消'),
          ),
          TextButton(
            onPressed: () async {
              final newRating = double.tryParse(ratingController.text);
              if (newRating != null && newRating >= 0 && newRating <= 5) {
                Navigator.of(context).pop();
                await provider.updateStaffRating(staff.id, newRating);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('请输入有效的评分 (0.0-5.0)')),
                );
              }
            },
            child: const Text('确定'),
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
                  Provider.of<StaffProvider>(context, listen: false).refreshStaffList();
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
            Icons.people_outline,
            size: 64,
            color: AppTheme.textSecondary,
          ),
          SizedBox(height: AppConstants.defaultPadding),
          Text(
            '暂无员工信息',
            style: TextStyle(
              fontSize: 16,
              color: AppTheme.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}