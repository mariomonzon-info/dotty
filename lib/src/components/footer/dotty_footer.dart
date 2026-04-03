import 'package:flutter/material.dart';
import '../../theme/dotty_colors.dart';
import '../../theme/dotty_typography.dart';

class DottyFooter extends StatelessWidget {
  const DottyFooter({
    super.key,
    required this.brand,
    required this.text,
    this.align = MainAxisAlignment.spaceBetween,
  });

  final String brand;
  final String text;
  final MainAxisAlignment align;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 80),
      padding: const EdgeInsets.only(top: 30),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: DottyColors.border)),
      ),
      child: Row(
        mainAxisAlignment: align,
        children: [
          Text(
            brand.toUpperCase(),
            style: DottyTypography.titleMedium.copyWith(
              fontWeight: FontWeight.w800,
              color: DottyColors.accent,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: DottyTypography.bodySmall.copyWith(color: DottyColors.muted),
          ),
        ],
      ),
    );
  }
}
