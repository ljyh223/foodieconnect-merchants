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
                  // 创建新员工
                  _showStaffFormDialog();
                },
                icon: const Icon(Icons.add),
              ),
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
            _buildStatCard(
              Translations.of(context).staff.totalStaff,
              '${provider.totalCount}',
              Icons.people,
            ),
            _buildStatCard(
              Translations.of(context).staff.onlineStaff,
              '${provider.onlineStaffCount}',
              Icons.online_prediction,
              Colors.green,
            ),
            _buildStatCard(
              Translations.of(context).staff.offlineStaff,
              '${provider.offlineStaffCount}',
              Icons.offline_bolt,
              Colors.grey,
            ),
            _buildStatCard(
              Translations.of(context).staff.busyStaff,
              '${provider.busyStaffCount}',
              Icons.work,
              Colors.orange,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(
    String title,
    String value,
    IconData icon, [
    Color? color,
  ]) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 18, color: color ?? AppTheme.primaryColor),
          const SizedBox(height: 2),
          Text(
            title,
            style: TextStyle(fontSize: 10, color: AppTheme.textSecondary),
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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      margin: const EdgeInsets.only(bottom: AppConstants.defaultPadding),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: () {
            // 点击卡片可以查看详情或编辑
            _showStaffFormDialog(staff);
          },
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 顶部：头像、姓名、职位和评分
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // 头像和状态
                    Stack(
                      children: [
                        Container(
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: ImageUtils.isValidImagePath(staff.avatarUrl)
                                ? DecorationImage(
                                    image: NetworkImage(
                                      ImageUtils.getFullImageUrl(
                                        staff.avatarUrl,
                                      ),
                                    ),
                                    fit: BoxFit.cover,
                                  )
                                : null,
                            color: colorScheme.primary.withValues(alpha: 0.1),
                          ),
                          child: !ImageUtils.isValidImagePath(staff.avatarUrl)
                              ? Center(
                                  child: Icon(
                                    Icons.person,
                                    size: 32,
                                    color: colorScheme.primary,
                                  ),
                                )
                              : null,
                        ),
                        // 状态指示器
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(
                              color: _getStatusColor(staff.status),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: colorScheme.surface,
                                width: 3,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(width: 16),

                    // 姓名和职位
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  staff.displayName.isEmpty
                                      ? Translations.of(
                                          context,
                                        ).staff.unknownStaff
                                      : staff.displayName,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              // 评分标签
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.amber.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  staff.rating != null
                                      ? '${staff.rating!.toStringAsFixed(1)} ⭐'
                                      : Translations.of(context).staff.rating,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.amber,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Text(
                                staff.position?.trim().isEmpty != false
                                    ? Translations.of(
                                        context,
                                      ).staff.defaultPosition
                                    : staff.position!,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppTheme.textSecondary,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(width: 12),
                              // 状态标签
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: _getStatusColor(
                                    staff.status,
                                  ).withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  _getStatusDisplayText(staff.status),
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: _getStatusColor(staff.status),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          // 经验信息
                          Text(
                            staff.experience?.trim().isEmpty != false
                                ? Translations.of(
                                    context,
                                  ).staff.defaultExperience
                                : staff.experience!,
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppTheme.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // 底部：操作按钮
                _buildActionButtons(staff),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 构建操作按钮
  Widget _buildActionButtons(StaffModel staff) {
    return Row(
      children: [
        // 状态切换按钮 - 主要操作
        Expanded(
          child: Container(
            height: 44,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: staff.status.toUpperCase() == 'ONLINE'
                  ? Colors.orange.withValues(alpha: 0.1)
                  : Colors.green.withValues(alpha: 0.1),
            ),
            child: TextButton.icon(
              onPressed: () {
                _toggleStaffStatus(staff);
              },
              icon: Icon(
                staff.status.toUpperCase() == 'ONLINE'
                    ? Icons.pause
                    : Icons.play_arrow,
                size: 18,
                color: staff.status.toUpperCase() == 'ONLINE'
                    ? Colors.orange
                    : Colors.green,
              ),
              label: Text(
                staff.status.toUpperCase() == 'ONLINE'
                    ? Translations.of(context).staff.setAsOffline
                    : Translations.of(context).staff.setAsOnline,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: staff.status.toUpperCase() == 'ONLINE'
                      ? Colors.orange
                      : Colors.green,
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ),

        const SizedBox(width: 12),

        // 评分按钮
        Container(
          height: 44,
          width: 44,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.amber.withValues(alpha: 0.1),
          ),
          child: IconButton(
            onPressed: () {
              _updateStaffRating(staff);
            },
            icon: const Icon(Icons.star, size: 20, color: Colors.amber),
            tooltip: Translations.of(context).staff.updateRating,
            style: IconButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),

        const SizedBox(width: 12),

        // 编辑按钮
        Container(
          height: 44,
          width: 44,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppTheme.primaryColor.withValues(alpha: 0.1),
          ),
          child: IconButton(
            onPressed: () {
              _showStaffFormDialog(staff);
            },
            icon: const Icon(
              Icons.edit,
              size: 20,
              color: AppTheme.primaryColor,
            ),
            tooltip: Translations.of(context).staff.editStaff,
            style: IconButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),

        const SizedBox(width: 12),

        // 删除按钮
        Container(
          height: 44,
          width: 44,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppTheme.errorColor.withValues(alpha: 0.1),
          ),
          child: IconButton(
            onPressed: () {
              _showDeleteConfirmDialog(staff);
            },
            icon: const Icon(
              Icons.delete_outline,
              size: 20,
              color: AppTheme.errorColor,
            ),
            tooltip: Translations.of(context).staff.delete,
            style: IconButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
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

  /// 切换员工状态
  void _toggleStaffStatus(StaffModel staff) {
    final provider = Provider.of<StaffProvider>(context, listen: false);
    final newStatus = _getNextStatus(staff.status);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(Translations.of(context).staff.confirmOperation),
        content: Text(
          Translations.of(context).staff.confirmStatusChange(
            staffName: staff.displayName,
            newStatus: _getStatusDisplayText(newStatus),
          ),
        ),
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
    final t = Translations.of(context);
    switch (status.toUpperCase()) {
      case 'ONLINE':
        return t.staff.online;
      case 'OFFLINE':
        return t.staff.offline;
      case 'BUSY':
        return t.staff.busy;
      default:
        return t.staff.unknown;
    }
  }

  /// 更新员工评分
  void _updateStaffRating(StaffModel staff) {
    final provider = Provider.of<StaffProvider>(context, listen: false);
    final ratingController = TextEditingController(
      text: staff.rating?.toStringAsFixed(1) ?? '5.0',
    );

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(Translations.of(context).staff.updateRatingTitle),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              Translations.of(
                context,
              ).staff.setNewRating(staffName: staff.displayName),
            ),
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
            child: Text(Translations.of(context).staff.cancel),
          ),
          TextButton(
            onPressed: () async {
              final newRating = double.tryParse(ratingController.text);
              if (newRating != null && newRating >= 0 && newRating <= 5) {
                Navigator.of(context).pop();
                await provider.updateStaffRating(staff.id, newRating);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      Translations.of(context).staff.validRatingRequired,
                    ),
                  ),
                );
              }
            },
            child: Text(Translations.of(context).staff.confirm),
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
                  Provider.of<StaffProvider>(
                    context,
                    listen: false,
                  ).refreshStaffList();
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
            style: TextStyle(fontSize: 16, color: AppTheme.textSecondary),
          ),
          const SizedBox(height: AppConstants.defaultPadding),
          ElevatedButton(
            onPressed: () {
              _showStaffFormDialog();
            },
            child: Text(Translations.of(context).staff.addStaff),
          ),
        ],
      ),
    );
  }

  /// 显示员工表单对话框（用于创建或编辑）
  void _showStaffFormDialog([StaffModel? staff]) {
    final provider = Provider.of<StaffProvider>(context, listen: false);
    final nameController = TextEditingController(text: staff?.name ?? '');
    final positionController = TextEditingController(
      text: staff?.position ?? '',
    );
    final experienceController = TextEditingController(
      text: staff?.experience ?? '',
    );
    final statusController = TextEditingController(
      text: staff?.status ?? 'OFFLINE',
    );
    final ratingController = TextEditingController(
      text: staff?.rating?.toStringAsFixed(1) ?? '',
    );

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          staff != null
              ? Translations.of(context).staff.editStaff
              : Translations.of(context).staff.createStaff,
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 员工姓名
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: Translations.of(context).staff.name,
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // 员工职位
              TextField(
                controller: positionController,
                decoration: InputDecoration(
                  labelText: Translations.of(context).staff.position,
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // 工作经验
              TextField(
                controller: experienceController,
                decoration: InputDecoration(
                  labelText: Translations.of(context).staff.experience,
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // 员工状态
              DropdownButtonFormField<String>(
                initialValue: staff?.status ?? 'OFFLINE',
                decoration: InputDecoration(
                  labelText: Translations.of(context).staff.status,
                  border: const OutlineInputBorder(),
                ),
                items: [
                  DropdownMenuItem(
                    value: 'ONLINE',
                    child: Text(Translations.of(context).staff.online),
                  ),
                  DropdownMenuItem(
                    value: 'OFFLINE',
                    child: Text(Translations.of(context).staff.offline),
                  ),
                  DropdownMenuItem(
                    value: 'BUSY',
                    child: Text(Translations.of(context).staff.busy),
                  ),
                ],
                onChanged: (value) {
                  if (value != null) {
                    statusController.text = value;
                  }
                },
              ),
              const SizedBox(height: 16),

              // 员工评分
              TextField(
                controller: ratingController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: Translations.of(context).staff.rating,
                  border: const OutlineInputBorder(),
                  helperText: Translations.of(context).staff.ratingHelper,
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(Translations.of(context).staff.cancel),
          ),
          TextButton(
            onPressed: () async {
              final name = nameController.text.trim();
              if (name.isEmpty) {
                final currentContext = context;
                ScaffoldMessenger.of(currentContext).showSnackBar(
                  SnackBar(
                    content: Text(
                      Translations.of(currentContext).staff.nameRequired,
                    ),
                  ),
                );
                return;
              }

              final staffData = {
                'name': name,
                'position': positionController.text.trim(),
                'experience': experienceController.text.trim(),
                'status': statusController.text,
              };

              if (ratingController.text.isNotEmpty) {
                final rating = double.tryParse(ratingController.text);
                if (rating != null && rating >= 0 && rating <= 5) {
                  staffData['rating'] = rating.toStringAsFixed(1);
                } else {
                  final currentContext = context;
                  ScaffoldMessenger.of(currentContext).showSnackBar(
                    SnackBar(
                      content: Text(
                        Translations.of(
                          currentContext,
                        ).staff.validRatingRequired,
                      ),
                    ),
                  );
                  return;
                }
              }

              final currentContext = context;
              Navigator.of(currentContext).pop();

              bool success;
              if (staff != null) {
                // 更新员工
                success = await provider.updateStaff(staff.id, staffData);
              } else {
                // 创建员工
                success = await provider.createStaff(staffData);
              }

              if (success) {
                ScaffoldMessenger.of(currentContext).showSnackBar(
                  SnackBar(
                    content: Text(
                      staff != null
                          ? Translations.of(currentContext).staff.staffUpdated
                          : Translations.of(currentContext).staff.staffCreated,
                    ),
                  ),
                );
              } else {
                ScaffoldMessenger.of(currentContext).showSnackBar(
                  SnackBar(
                    content: Text(
                      staff != null
                          ? Translations.of(currentContext).staff.updateFailed
                          : Translations.of(currentContext).staff.createFailed,
                    ),
                    backgroundColor: AppTheme.errorColor,
                  ),
                );
              }
            },
            child: Text(Translations.of(context).staff.save),
          ),
        ],
      ),
    );
  }

  /// 显示删除确认对话框
  void _showDeleteConfirmDialog(StaffModel staff) {
    final provider = Provider.of<StaffProvider>(context, listen: false);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(Translations.of(context).staff.confirmDelete),
        content: Text(
          Translations.of(
            context,
          ).staff.confirmDeleteMessage(staffName: staff.displayName),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(Translations.of(context).staff.cancel),
          ),
          TextButton(
            style: TextButton.styleFrom(foregroundColor: AppTheme.errorColor),
            onPressed: () async {
              final currentContext = context;
              Navigator.of(currentContext).pop();
              final success = await provider.deleteStaff(staff.id);

              if (success) {
                ScaffoldMessenger.of(currentContext).showSnackBar(
                  SnackBar(
                    content: Text(
                      Translations.of(currentContext).staff.staffDeleted,
                    ),
                  ),
                );
              } else {
                ScaffoldMessenger.of(currentContext).showSnackBar(
                  SnackBar(
                    content: Text(
                      Translations.of(currentContext).staff.deleteFailed,
                    ),
                    backgroundColor: AppTheme.errorColor,
                  ),
                );
              }
            },
            child: Text(Translations.of(context).staff.delete),
          ),
        ],
      ),
    );
  }
}
