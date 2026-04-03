import 'package:flutter/material.dart';
import '../../theme/dotty_colors.dart';

class DottyProgressBar extends StatelessWidget {
  const DottyProgressBar({
    super.key,
    required this.value,
    this.height = 8,
    this.backgroundColor,
    this.progressColor,
    this.borderRadius,
  });

  final double value;
  final double height;
  final Color? backgroundColor;
  final Color? progressColor;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    final clampedValue = value.clamp(0.0, 1.0);
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor ?? DottyColors.surface,
        borderRadius: BorderRadius.circular(borderRadius ?? height / 2),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: clampedValue,
        child: Container(
          decoration: BoxDecoration(
            color: progressColor ?? DottyColors.accent,
            borderRadius: BorderRadius.circular(borderRadius ?? height / 2),
          ),
        ),
      ),
    );
  }
}
