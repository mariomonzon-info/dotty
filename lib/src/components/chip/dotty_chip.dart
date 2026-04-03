import 'package:flutter/material.dart';
import '../../theme/dotty_colors.dart';
import '../../theme/dotty_typography.dart';

enum DottyChipType { defaultType, selected, disabled }

class DottyChip extends StatelessWidget {
  const DottyChip({
    super.key,
    required this.label,
    this.type = DottyChipType.defaultType,
    this.icon,
    this.onTap,
    this.onDelete,
  });

  final String label;
  final DottyChipType type;
  final String? icon;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;

  Color get _backgroundColor {
    switch (type) {
      case DottyChipType.defaultType:
        return DottyColors.surface;
      case DottyChipType.selected:
        return DottyColors.accentSubtle;
      case DottyChipType.disabled:
        return DottyColors.card;
    }
  }

  Color get _borderColor {
    switch (type) {
      case DottyChipType.defaultType:
        return DottyColors.border;
      case DottyChipType.selected:
        return DottyColors.accent;
      case DottyChipType.disabled:
        return DottyColors.border.withValues(alpha: 0.5);
    }
  }

  Color get _textColor {
    switch (type) {
      case DottyChipType.defaultType:
        return DottyColors.text;
      case DottyChipType.selected:
        return DottyColors.accent;
      case DottyChipType.disabled:
        return DottyColors.muted;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: type == DottyChipType.disabled ? null : onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: _backgroundColor,
          border: Border.all(color: _borderColor),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Text(icon!, style: const TextStyle(fontSize: 14)),
              const SizedBox(width: 6),
            ],
            Text(
              label,
              style: DottyTypography.labelMedium.copyWith(color: _textColor),
            ),
            if (onDelete != null) ...[
              const SizedBox(width: 4),
              GestureDetector(
                onTap: onDelete,
                child: Icon(Icons.close, size: 16, color: _textColor),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class DottyChipGroup extends StatelessWidget {
  const DottyChipGroup({
    super.key,
    required this.chips,
    this.selectedChip,
    this.onChipSelected,
    this.allowMultiple = false,
  });

  final List<DottyChipData> chips;
  final String? selectedChip;
  final ValueChanged<String>? onChipSelected;
  final bool allowMultiple;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: chips.map((chip) {
        final isSelected = selectedChip == chip.value;
        return DottyChip(
          label: chip.label,
          icon: chip.icon,
          type: isSelected ? DottyChipType.selected : DottyChipType.defaultType,
          onTap: () => onChipSelected?.call(chip.value),
        );
      }).toList(),
    );
  }
}

class DottyChipData {
  const DottyChipData({required this.value, required this.label, this.icon});

  final String value;
  final String label;
  final String? icon;
}
