import 'package:flutter/material.dart';
import '../../theme/dotty_colors.dart';
import '../../theme/dotty_typography.dart';

class DottyTipBox extends StatelessWidget {
  const DottyTipBox({
    super.key,
    required this.icon,
    required this.text,
    this.margin = const EdgeInsets.only(top: 24),
  });

  final String icon;
  final String text;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: DottyColors.accentSubtle,
        border: Border(left: BorderSide(color: DottyColors.accent, width: 4)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(icon, style: const TextStyle(fontSize: 22)),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              text,
              style: DottyTypography.bodyMedium.copyWith(
                color: DottyColors.text,
                height: 1.7,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
