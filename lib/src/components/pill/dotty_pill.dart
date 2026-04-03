import 'package:flutter/material.dart';
import '../../theme/dotty_colors.dart';
import '../../theme/dotty_typography.dart';

class DottyPill extends StatelessWidget {
  const DottyPill({super.key, required this.label, this.icon});

  final String label;
  final String? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
      decoration: BoxDecoration(
        color: DottyColors.accentSubtle,
        border: Border.all(color: DottyColors.accent.withValues(alpha: 0.25)),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Text(icon!, style: const TextStyle(fontSize: 13)),
            const SizedBox(width: 6),
          ],
          Text(label.toUpperCase(), style: DottyTypography.pill),
        ],
      ),
    );
  }
}
