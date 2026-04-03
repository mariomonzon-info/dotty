import 'package:flutter/material.dart';
import '../../theme/dotty_colors.dart';
import '../../theme/dotty_typography.dart';

class DottyInput extends StatelessWidget {
  const DottyInput({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.onChanged,
    this.onSubmitted,
    this.keyboardType,
    this.maxLines = 1,
    this.enabled = true,
    this.errorText,
  });

  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final TextInputType? keyboardType;
  final int maxLines;
  final bool enabled;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null) ...[
          Text(labelText!.toUpperCase(), style: DottyTypography.labelSmall),
          const SizedBox(height: 8),
        ],
        TextField(
          controller: controller,
          obscureText: obscureText,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          keyboardType: keyboardType,
          maxLines: maxLines,
          enabled: enabled,
          style: DottyTypography.bodyMedium,
          cursorColor: DottyColors.accent,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: DottyTypography.bodyMedium.copyWith(
              color: DottyColors.muted,
            ),
            prefixIcon: prefixIcon != null
                ? Icon(prefixIcon, color: DottyColors.muted, size: 20)
                : null,
            suffixIcon: suffixIcon,
            filled: true,
            fillColor: enabled ? DottyColors.surface : DottyColors.card,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: DottyColors.border),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: DottyColors.border),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: DottyColors.accent),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: DottyColors.warn),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: DottyColors.border.withValues(alpha: 0.5),
              ),
            ),
          ),
        ),
        if (errorText != null) ...[
          const SizedBox(height: 4),
          Text(
            errorText!,
            style: DottyTypography.bodySmall.copyWith(color: DottyColors.warn),
          ),
        ],
      ],
    );
  }
}
