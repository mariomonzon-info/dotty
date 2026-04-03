import 'package:flutter/material.dart';
import '../../theme/dotty_colors.dart';
import '../../theme/dotty_typography.dart';

class DottyStepCard extends StatelessWidget {
  const DottyStepCard({
    super.key,
    required this.icon,
    required this.label,
    this.sublabel,
    this.backgroundColor,
  });

  final String icon;
  final String label;
  final String? sublabel;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color:
                  backgroundColor ?? DottyColors.muted.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(icon, style: const TextStyle(fontSize: 16)),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: DottyTypography.titleSmall.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (sublabel != null)
                  Text(
                    sublabel!,
                    style: DottyTypography.bodySmall.copyWith(
                      color: DottyColors.muted,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
