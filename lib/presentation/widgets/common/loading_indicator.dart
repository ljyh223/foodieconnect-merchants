import 'package:flutter/material.dart';

/// 加载指示器组件
class LoadingIndicator extends StatelessWidget {
  final Color? color;
  final double? size;
  final double? strokeWidth;

  const LoadingIndicator({
    super.key,
    this.color,
    this.size,
    this.strokeWidth,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size ?? 24,
      height: size ?? 24,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth ?? 2.0,
        valueColor: AlwaysStoppedAnimation<Color>(color ?? Colors.white),
      ),
    );
  }
}

/// 页面级加载指示器
class PageLoadingIndicator extends StatelessWidget {
  final String? message;
  final Color? backgroundColor;

  const PageLoadingIndicator({
    super.key,
    this.message,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor ?? Colors.black.withValues(alpha: 0.5),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LoadingIndicator(
              color: Colors.white,
              size: 40,
            ),
            if (message != null) ...[
              const SizedBox(height: 16),
              Text(
                message!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// 按钮加载指示器
class ButtonLoadingIndicator extends StatelessWidget {
  final Color? color;
  final double? size;

  const ButtonLoadingIndicator({
    super.key,
    this.color,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size ?? 16,
      height: size ?? 16,
      child: CircularProgressIndicator(
        strokeWidth: 2.0,
        valueColor: AlwaysStoppedAnimation<Color>(color ?? Colors.white),
      ),
    );
  }
}