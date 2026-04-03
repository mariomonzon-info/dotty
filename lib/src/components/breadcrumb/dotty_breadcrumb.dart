import 'package:flutter/material.dart';
import '../../theme/dotty_colors.dart';
import '../../theme/dotty_typography.dart';

class DottyBreadcrumb extends StatelessWidget {
  const DottyBreadcrumb({
    super.key,
    required this.items,
    this.separator = '/',
    this.onItemTap,
  });

  final List<DottyBreadcrumbItem> items;
  final String separator;
  final ValueChanged<int>? onItemTap;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: items.asMap().entries.map((entry) {
        final index = entry.key;
        final item = entry.value;
        final isLast = index == items.length - 1;

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: isLast ? null : () => onItemTap?.call(index),
              child: Text(
                item.label,
                style: isLast
                    ? DottyTypography.bodyMedium.copyWith(
                        color: DottyColors.accent,
                        fontWeight: FontWeight.w600,
                      )
                    : DottyTypography.bodyMedium.copyWith(
                        color: DottyColors.muted,
                      ),
              ),
            ),
            if (!isLast) ...[
              const SizedBox(width: 8),
              Text(
                separator,
                style: DottyTypography.bodyMedium.copyWith(
                  color: DottyColors.muted,
                ),
              ),
              const SizedBox(width: 8),
            ],
          ],
        );
      }).toList(),
    );
  }
}

class DottyBreadcrumbItem {
  const DottyBreadcrumbItem({required this.label, this.href});

  final String label;
  final String? href;
}
