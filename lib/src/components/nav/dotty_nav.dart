import 'package:flutter/material.dart';
import '../../theme/dotty_colors.dart';
import '../../theme/dotty_typography.dart';

class DottyNav extends StatelessWidget {
  const DottyNav({
    super.key,
    required this.items,
    this.selectedIndex,
    this.onItemSelected,
    this.height = 60,
  });

  final List<DottyNavItem> items;
  final int? selectedIndex;
  final ValueChanged<int>? onItemSelected;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: DottyColors.surface,
        border: Border(top: BorderSide(color: DottyColors.border)),
      ),
      child: Row(
        children: items.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          final isSelected = selectedIndex == index;
          return Expanded(
            child: InkWell(
              onTap: () => onItemSelected?.call(index),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    item.icon,
                    size: 24,
                    color: isSelected ? DottyColors.accent : DottyColors.muted,
                  ),
                  if (item.label != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      item.label!,
                      style: DottyTypography.labelSmall.copyWith(
                        color: isSelected
                            ? DottyColors.accent
                            : DottyColors.muted,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class DottyNavItem {
  const DottyNavItem({required this.icon, this.label});

  final IconData icon;
  final String? label;
}
