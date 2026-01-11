import 'package:flutter/material.dart';
import 'package:foodieconnectmerchant/core/theme/app_theme.dart';
import 'package:flutter/services.dart';

/// 高效输入框组件
class EfficientTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? hint;
  final String? helperText;
  final IconData? icon;
  final bool isNumber;
  final int maxLines;
  final ThemeData theme;

  const EfficientTextField({
    super.key,
    required this.controller,
    required this.label,
    this.hint,
    this.helperText,
    this.icon,
    this.isNumber = false,
    this.maxLines = 1,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: isNumber
          ? const TextInputType.numberWithOptions(decimal: true)
          : TextInputType.text,
      inputFormatters: isNumber
          ? [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))]
          : null,
      style: TextStyle(color: theme.colorScheme.onSurface),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        helperText: helperText,
        helperStyle: theme.textTheme.bodySmall?.copyWith(
          color: theme.colorScheme.onSurfaceVariant,
        ),
        helperMaxLines: 1,
        prefixIcon: icon != null
            ? Icon(icon, size: 20, color: theme.colorScheme.onSurfaceVariant)
            : null,
        filled: true,
        fillColor: theme.colorScheme.surface,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: theme.colorScheme.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: theme.colorScheme.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: theme.colorScheme.primary, width: 1.5),
        ),
        labelStyle: TextStyle(color: theme.colorScheme.onSurfaceVariant),
        hintStyle: TextStyle(color: theme.colorScheme.onSurfaceVariant),
      ),
    );
  }
}
