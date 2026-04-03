import 'package:flutter/material.dart';
import '../../theme/dotty_colors.dart';
import '../../theme/dotty_typography.dart';

class DottyStat extends StatelessWidget {
  const DottyStat({
    super.key,
    required this.value,
    required this.label,
    this.valueColor,
  });

  final String value;
  final String label;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: DottyTypography.statValue.copyWith(
            color: valueColor ?? DottyColors.accent,
          ),
        ),
        const SizedBox(height: 4),
        Text(label.toUpperCase(), style: DottyTypography.statLabel),
      ],
    );
  }
}
