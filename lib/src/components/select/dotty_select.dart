import 'package:flutter/material.dart';
import '../../theme/dotty_colors.dart';
import '../../theme/dotty_typography.dart';

class DottySelect extends StatelessWidget {
  const DottySelect({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    this.hint,
    this.labelText,
  });

  final String? value;
  final List<DottySelectItem> items;
  final ValueChanged<String?> onChanged;
  final String? hint;
  final String? labelText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null) ...[
          Text(labelText!.toUpperCase(), style: DottyTypography.labelSmall),
          const SizedBox(height: 8),
        ],
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: DottyColors.surface,
            border: Border.all(color: DottyColors.border),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              hint: hint != null
                  ? Text(
                      hint!,
                      style: DottyTypography.bodyMedium.copyWith(
                        color: DottyColors.muted,
                      ),
                    )
                  : null,
              isExpanded: true,
              dropdownColor: DottyColors.surface,
              icon: Icon(Icons.keyboard_arrow_down, color: DottyColors.muted),
              style: DottyTypography.bodyMedium,
              items: items.map((item) {
                return DropdownMenuItem<String>(
                  value: item.value,
                  child: Row(
                    children: [
                      if (item.icon != null) ...[
                        Text(item.icon!, style: const TextStyle(fontSize: 16)),
                        const SizedBox(width: 8),
                      ],
                      Text(item.label),
                    ],
                  ),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}

class DottySelectItem {
  const DottySelectItem({required this.value, required this.label, this.icon});

  final String value;
  final String label;
  final String? icon;
}
