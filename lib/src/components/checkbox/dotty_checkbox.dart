import 'package:flutter/material.dart';
import '../../theme/dotty_colors.dart';
import '../../theme/dotty_typography.dart';

class DottyCheckbox extends StatelessWidget {
  const DottyCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.label,
    this.labelStyle,
  });

  final bool value;
  final ValueChanged<bool> onChanged;
  final String? label;
  final TextStyle? labelStyle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!value),
      borderRadius: BorderRadius.circular(4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: value ? DottyColors.accent : Colors.transparent,
              border: Border.all(
                color: value ? DottyColors.accent : DottyColors.muted,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            child: value
                ? Icon(Icons.check, size: 14, color: DottyColors.background)
                : null,
          ),
          if (label != null) ...[
            const SizedBox(width: 12),
            Text(label!, style: labelStyle ?? DottyTypography.bodyMedium),
          ],
        ],
      ),
    );
  }
}

class DottyCheckboxListTile extends StatelessWidget {
  const DottyCheckboxListTile({
    super.key,
    required this.value,
    required this.onChanged,
    required this.title,
    this.subtitle,
    this.controlAffinity = ListTileControlAffinity.leading,
  });

  final bool value;
  final ValueChanged<bool> onChanged;
  final String title;
  final String? subtitle;
  final ListTileControlAffinity controlAffinity;

  @override
  Widget build(BuildContext context) {
    final checkbox = DottyCheckbox(value: value, onChanged: onChanged);

    return InkWell(
      onTap: () => onChanged(!value),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            if (controlAffinity == ListTileControlAffinity.leading) checkbox,
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: DottyTypography.bodyMedium),
                  if (subtitle != null)
                    Text(
                      subtitle!,
                      style: DottyTypography.bodySmall.copyWith(
                        color: DottyColors.muted,
                      ),
                    ),
                ],
              ),
            ),
            if (controlAffinity == ListTileControlAffinity.trailing) checkbox,
          ],
        ),
      ),
    );
  }
}
