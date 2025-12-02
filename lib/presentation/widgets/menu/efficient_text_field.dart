
import 'package:flutter/material.dart';
import 'package:foodieconnect/core/theme/app_theme.dart';
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

  const EfficientTextField({
    super.key,
    required this.controller,
    required this.label,
    this.hint,
    this.helperText,
    this.icon,
    this.isNumber = false,
    this.maxLines = 1,
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
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        helperText: helperText,
        helperStyle: TextStyle(
          color: Colors.grey.shade500,
          fontSize: 11,
        ),
        helperMaxLines: 1,
        prefixIcon: icon != null
            ? Icon(icon, size: 20, color: Colors.grey.shade500)
            : null,
        filled: true,
        fillColor: Colors.grey.shade50,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: AppTheme.primaryColor, width: 1.5),
        ),
      ),
    );
  }
}
