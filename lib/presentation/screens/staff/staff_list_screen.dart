import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:foodieconnect/core/constants/app_constants.dart';
import 'package:foodieconnect/core/theme/app_theme.dart';
import 'package:foodieconnect/core/utils/image_utils.dart';
import 'package:foodieconnect/presentation/providers/staff_provider.dart';
import 'package:foodieconnect/data/models/staff/staff_model.dart';
import 'package:foodieconnect/l10n/generated/translations.g.dart';

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
            title: Text(Translations.of(context).staff.title),
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
            Text(Translations.of(context).staff.loadingStaffList),
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
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildStatCard(Translations.of(context).staff.totalStaff, '${provider.totalCount}', Icons.people),
            _buildStatCard(Translations.of(context).staff.onlineStaff, '${provider.onlineStaffCount}', Icons.online_prediction, Colors.green),
            _buildStatCard(Translations.of(context).staff.offlineStaff, '${provider.offlineStaffCount}', Icons.offline_bolt, Colors.grey),
            _buildStatCard(Translations.of(context).staff.busyStaff, '${provider.busyStaffCount}', Icons.work, Colors.orange),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, [Color? color]) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 18,
            color: color ?? AppTheme.primaryColor,
          ),
          const SizedBox(height: 2),
          Text(
            title,
            style: TextStyle(
              fontSize: 10,
              color: AppTheme.textSecondary,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: color ?? AppTheme.primaryColor,
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
            child: Text(Translations.of(context).staff.updateRating),
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
        return Translations.of(context).staff.setAsOffline;
      case 'OFFLINE':
        return Translations.of(context).staff.setAsOnline;
      case 'BUSY':
        return '设为离线';
      default:
        return Translations.of(context).staff.unknownStatus;
    }
  }

  /// 切换员工状态
  void _toggleStaffStatus(StaffModel staff) {
    final provider = Provider.of<StaffProvider>(context, listen: false);
    final newStatus = _getNextStatus(staff.status);
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(Translations.of(context).staff.confirmOperation),
        content: Text(Translations.of(context).staff.confirmStatusChange(staffName: staff.displayName, newStatus: _getStatusDisplayText(newStatus))),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(Translations.of(context).staff.cancel),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
              await provider.updateStaffStatus(staff.id, newStatus);
            },
            child: Text(Translations.of(context).staff.confirm),
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
        return Translations.of(context).staff.unknown;
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
        title: Text(Translations.of(context).staff.updateRatingTitle),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(Translations.of(context).staff.setNewRating(staffName: staff.displayName)),
            const SizedBox(height: 16),
            TextField(
              controller: ratingController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: Translations.of(context).staff.ratingInputHint,
                border: const OutlineInputBorder(),
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
                  SnackBar(content: Text(Translations.of(context).staff.validRatingRequired)),
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
                child: Text(Translations.of(context).staff.retry),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildEmptyWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.people_outline,
            size: 64,
            color: AppTheme.textSecondary,
          ),
          const SizedBox(height: AppConstants.defaultPadding),
          Text(
            Translations.of(context).staff.noStaffInfo,
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