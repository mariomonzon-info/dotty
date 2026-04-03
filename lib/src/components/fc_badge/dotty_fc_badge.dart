import 'package:flutter/material.dart';
import '../../theme/dotty_colors.dart';
import '../../theme/dotty_typography.dart';

class DottyFCBadge extends StatelessWidget {
  const DottyFCBadge({super.key, required this.bpmRange, this.icon = '💓'});

  final String bpmRange;
  final String icon;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 576;

    if (isMobile) {
      return Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: DottyColors.warnSubtle,
          border: Border.all(color: DottyColors.warn.withValues(alpha: 0.25)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(icon, style: const TextStyle(fontSize: 16)),
                const SizedBox(width: 8),
                Text(
                  'Zone 2',
                  style: DottyTypography.labelMedium.copyWith(
                    color: DottyColors.warn,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              'FC objetivo: $bpmRange ppm',
              style: DottyTypography.bodySmall.copyWith(
                fontWeight: FontWeight.w600,
                color: DottyColors.warn,
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: DottyColors.warnSubtle,
        border: Border.all(color: DottyColors.warn.withValues(alpha: 0.25)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(icon, style: const TextStyle(fontSize: 16)),
          const SizedBox(width: 8),
          RichText(
            text: TextSpan(
              style: DottyTypography.bodyMedium.copyWith(height: 1.5),
              children: [
                const TextSpan(
                  text: 'Zone 2 = puedes mantener una conversación ',
                ),
                TextSpan(
                  text: '| ',
                  style: DottyTypography.bodyMedium.copyWith(
                    color: DottyColors.muted,
                  ),
                ),
                TextSpan(
                  text: 'FC objetivo: $bpmRange ppm',
                  style: DottyTypography.bodyMedium.copyWith(
                    fontWeight: FontWeight.w600,
                    color: DottyColors.warn,
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
