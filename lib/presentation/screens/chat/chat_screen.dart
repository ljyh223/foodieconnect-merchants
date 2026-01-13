import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/models/chat/chat_message_model.dart';
import '../../providers/chat_provider.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/utils/image_utils.dart';
import '../../../l10n/generated/translations.g.dart';

/// 聊天室页面
class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ScrollController _scrollController = ScrollController();

  // 新消息计数
  int _unreadMessageCount = 0;

  // 是否在底部
  bool _isAtBottom = true;

  // 上一次的消息数量
  int _previousMessageCount = 0;

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

    // 设置滚动监听
    _setupScrollListener();

    // 初始化时设置为底部
    _isAtBottom = true;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // 监听消息变化，当不在底部时增加未读消息计数
    final chatProvider = Provider.of<ChatProvider>(context);
    final currentMessageCount = chatProvider.messages.length;

    if (currentMessageCount > _previousMessageCount && !_isAtBottom) {
      setState(() {
        _unreadMessageCount += currentMessageCount - _previousMessageCount;
      });
    }

    _previousMessageCount = currentMessageCount;
  }

  // 设置滚动监听
  void _setupScrollListener() {
    _scrollController.addListener(() {
      // 检查是否在底部
      final isAtBottom =
          _scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200; // 允许200px的误差

      if (_isAtBottom != isAtBottom) {
        setState(() {
          _isAtBottom = isAtBottom;
        });

        // 如果滚动到底部，重置未读消息计数
        if (isAtBottom) {
          setState(() {
            _unreadMessageCount = 0;
          });
        }
      }
    });
  }

  // 滚动到底部
  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final chatProvider = Provider.of<ChatProvider>(context);
    final theme = Theme.of(context);

    // 监听消息变化，当不在底部时增加未读消息计数
    // 使用DidChangeDependencies来避免在build中直接监听
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: _buildAppBar(context, t, chatProvider),
      body: Stack(
        children: [
          _buildBody(context, t, chatProvider),
          // 新消息提示按钮
          _buildNewMessageButton(),
        ],
      ),
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
  Widget _buildMessageItem(BuildContext context, ChatMessageModel message) {
    // 获取完整的头像URL
    final String? senderAvatar = message.senderAvatar;
    final avatarUrl = (senderAvatar != null && senderAvatar.isNotEmpty)
        ? ImageUtils.getFullImageUrl(senderAvatar)
        : '';
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.only(bottom: AppConstants.defaultPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 头像
          Container(
            margin: const EdgeInsets.only(
              right: AppConstants.defaultPadding / 2,
            ),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: avatarUrl.isNotEmpty
                  ? NetworkImage(avatarUrl)
                  : null,
              backgroundColor: isDarkMode
                  ? const Color(0xFF3C3C3C)
                  : AppTheme.primaryLight,
              child: avatarUrl.isEmpty
                  ? Icon(
                      Icons.person,
                      size: 20,
                      color: isDarkMode
                          ? const Color(0xFFBB86FC)
                          : AppTheme.primaryColor,
                    )
                  : null,
            ),
          ),

          // 消息内容区域
          Expanded(
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
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: theme.textTheme.bodyLarge?.color,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        _formatTime(message.createdAt),
                        style: TextStyle(
                          fontSize: 12,
                          color: theme.textTheme.bodySmall?.color,
                        ),
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
                    color: isDarkMode ? const Color(0xFF2C2C2C) : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: isDarkMode
                            ? const Color.fromARGB(50, 0, 0, 0)
                            : const Color.fromARGB(13, 0, 0, 0),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Text(
                    message.content ?? '',
                    style: TextStyle(
                      fontSize: 16,
                      color: theme.textTheme.bodyLarge?.color,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 构建新消息提示按钮
  Widget _buildNewMessageButton() {
    return Positioned(
      bottom: AppConstants.defaultPadding * 2,
      right: AppConstants.defaultPadding * 2,
      child: AnimatedOpacity(
        opacity: _unreadMessageCount > 0 ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 300),
        child: ScaleTransition(
          scale: Tween<double>(begin: 0.8, end: 1.0).animate(
            CurvedAnimation(
              parent: AlwaysStoppedAnimation(1.0),
              curve: Curves.easeOut,
            ),
          ),
          child: GestureDetector(
            onTap: () {
              // 点击按钮，滚动到底部
              _scrollToBottom();
              // 重置未读消息计数
              setState(() {
                _unreadMessageCount = 0;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: AppTheme.primaryColor,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.notifications_active,
                    color: Colors.white,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '$_unreadMessageCount条新消息',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
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
