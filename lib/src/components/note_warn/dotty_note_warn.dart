import 'package:flutter/material.dart';
import '../../theme/dotty_colors.dart';
import '../../theme/dotty_typography.dart';

class DottyNoteWarn extends StatelessWidget {
  const DottyNoteWarn({
    super.key,
    required this.text,
    this.icon = '⚠️',
    this.margin,
  });

  final String text;
  final String icon;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(icon, style: const TextStyle(fontSize: 14)),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              text,
              style: DottyTypography.bodySmall.copyWith(
                color: DottyColors.warn,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
