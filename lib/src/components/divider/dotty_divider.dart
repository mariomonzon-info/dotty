import 'package:flutter/material.dart';
import '../../theme/dotty_colors.dart';

class DottyDivider extends StatelessWidget {
  const DottyDivider({
    super.key,
    this.color,
    this.thickness = 1,
    this.space = 0,
  });

  final Color? color;
  final double thickness;
  final double space;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: space),
        Divider(color: color ?? DottyColors.border, thickness: thickness),
        SizedBox(height: space),
      ],
    );
  }
}

class DottySectionDivider extends StatelessWidget {
  const DottySectionDivider({super.key, this.accent = false});

  final bool accent;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 1,
        color: accent ? DottyColors.accent : DottyColors.border,
      ),
    );
  }
}
