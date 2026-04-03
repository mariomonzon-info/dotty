import 'package:flutter/material.dart';
import '../../theme/dotty_colors.dart';

class DottySwitch extends StatelessWidget {
  const DottySwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.activeColor,
    this.inactiveColor,
    this.width,
    this.height,
  });

  final bool value;
  final ValueChanged<bool> onChanged;
  final Color? activeColor;
  final Color? inactiveColor;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: width ?? 48,
        height: height ?? 26,
        decoration: BoxDecoration(
          color: value
              ? activeColor ?? DottyColors.accent
              : inactiveColor ?? DottyColors.surface,
          borderRadius: BorderRadius.circular(13),
          border: Border.all(
            color: value
                ? (activeColor ?? DottyColors.accent)
                : DottyColors.muted,
          ),
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 200),
          alignment: value ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 20,
            height: 20,
            margin: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: value ? DottyColors.background : DottyColors.muted,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}

class DottySwitchListTile extends StatelessWidget {
  const DottySwitchListTile({
    super.key,
    required this.value,
    required this.onChanged,
    required this.title,
    this.subtitle,
  });

  final bool value;
  final ValueChanged<bool> onChanged;
  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!value),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 14, color: DottyColors.text),
                  ),
                  if (subtitle != null)
                    Text(
                      subtitle!,
                      style: TextStyle(fontSize: 13, color: DottyColors.muted),
                    ),
                ],
              ),
            ),
            DottySwitch(value: value, onChanged: onChanged),
          ],
        ),
      ),
    );
  }
}
