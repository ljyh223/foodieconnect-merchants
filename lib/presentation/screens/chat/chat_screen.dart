import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/chat_provider.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_theme.dart';
import '../../../l10n/generated/translations.g.dart';

/// 聊天室页面
class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    // 初始化ChatProvider
    final chatProvider = Provider.of<ChatProvider>(context, listen: false);
    chatProvider.init();

    // 加载聊天室信息
    Future.microtask(() {
      chatProvider.loadChatRoom();
    });

    // 监听消息变化，自动滚动到底部
    _setupMessageScroll();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // 设置消息自动滚动
  void _setupMessageScroll() {
    _scrollController.addListener(() {
      // 自动滚动到底部
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels != 0) {
          // 到达底部，保持滚动位置
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final chatProvider = Provider.of<ChatProvider>(context);

    return Scaffold(
      backgroundColor: AppTheme.surfaceColor,
      appBar: _buildAppBar(context, t, chatProvider),
      body: _buildBody(context, t, chatProvider),
    );
  }

  // 构建AppBar
  AppBar _buildAppBar(
    BuildContext context,
    Translations t,
    ChatProvider chatProvider,
  ) {
    return AppBar(
      title: Text(t.navigation.chat),
      backgroundColor: AppTheme.primaryColor,
      foregroundColor: Colors.white,
      actions: [
        // 连接状态指示器
        Padding(
          padding: const EdgeInsets.only(right: AppConstants.defaultPadding),
          child: _buildConnectionStatusIndicator(chatProvider.isConnected),
        ),
      ],
    );
  }

  // 构建连接状态指示器
  Widget _buildConnectionStatusIndicator(bool isConnected) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isConnected ? AppTheme.successColor : AppTheme.errorColor,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          isConnected ? '已连接' : '未连接',
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  // 构建页面主体
  Widget _buildBody(
    BuildContext context,
    Translations t,
    ChatProvider chatProvider,
  ) {
    if (chatProvider.isLoading && chatProvider.messages.isEmpty) {
      return _buildLoadingWidget(t);
    }

    if (chatProvider.errorMessage != null && chatProvider.messages.isEmpty) {
      return _buildErrorWidget(t, chatProvider);
    }

    return Column(
      children: [
        // 消息列表
        Expanded(child: _buildMessageList(context, t, chatProvider)),

        // 提示信息
        _buildObserverHint(t),
      ],
    );
  }

  // 构建加载组件
  Widget _buildLoadingWidget(Translations t) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: AppConstants.defaultPadding),
          Text(t.common.loading),
        ],
      ),
    );
  }

  // 构建错误组件
  Widget _buildErrorWidget(Translations t, ChatProvider chatProvider) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 64, color: AppTheme.errorColor),
          const SizedBox(height: AppConstants.defaultPadding),
          Text(
            chatProvider.errorMessage ?? t.common.loadFailed,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, color: AppTheme.errorColor),
          ),
          const SizedBox(height: AppConstants.defaultPadding),
          ElevatedButton(
            onPressed: () {
              chatProvider.loadChatRoom();
            },
            child: Text(t.common.retry),
          ),
        ],
      ),
    );
  }

  // 构建消息列表
  Widget _buildMessageList(
    BuildContext context,
    Translations t,
    ChatProvider chatProvider,
  ) {
    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.all(AppConstants.defaultPadding),
      itemCount: chatProvider.messages.length,
      itemBuilder: (context, index) {
        final message = chatProvider.messages[index];
        return _buildMessageItem(context, message);
      },
    );
  }

  // 构建消息项
  Widget _buildMessageItem(BuildContext context, message) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppConstants.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 发送者信息
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Row(
              children: [
                Text(
                  message.senderName ?? '未知用户',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  _formatTime(message.createdAt),
                  style: TextStyle(fontSize: 12, color: AppTheme.textSecondary),
                ),
              ],
            ),
          ),

          // 消息内容
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.75,
            ),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Text(
              message.content ?? '',
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  // 构建观察者提示
  Widget _buildObserverHint(Translations t) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      color: AppTheme.primaryLight,
      child: Row(
        children: [
          const Icon(
            Icons.info_outline,
            color: AppTheme.primaryColor,
            size: 16,
          ),
          const SizedBox(width: 8),
          Text(
            '您当前以观察者身份查看聊天室，只能接收消息，无法发送消息。',
            style: TextStyle(fontSize: 14, color: AppTheme.primaryColor),
          ),
        ],
      ),
    );
  }

  // 格式化时间
  String _formatTime(DateTime? time) {
    if (time == null) {
      return '';
    }

    final now = DateTime.now();
    final difference = now.difference(time);

    if (difference.inMinutes < 1) {
      return '刚刚';
    } else if (difference.inHours < 1) {
      return '${difference.inMinutes}分钟前';
    } else if (difference.inDays < 1) {
      return '${difference.inHours}小时前';
    } else {
      return '${time.month}/${time.day} ${time.hour}:${time.minute.toString().padLeft(2, '0')}';
    }
  }
}
