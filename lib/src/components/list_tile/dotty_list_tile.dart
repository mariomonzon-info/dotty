import 'package:flutter/material.dart';
import '../../theme/dotty_colors.dart';
import '../../theme/dotty_typography.dart';

class DottyListTile extends StatelessWidget {
  const DottyListTile({
    super.key,
    this.leading,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.onLongPress,
    this.selected = false,
  });

  final Widget? leading;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: selected
            ? BoxDecoration(
                color: DottyColors.accentSubtle,
                border: Border(
                  left: BorderSide(color: DottyColors.accent, width: 3),
                ),
              )
            : null,
        child: Row(
          children: [
            if (leading != null) ...[leading!, const SizedBox(width: 16)],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: DottyTypography.bodyMedium.copyWith(
                      fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                    ),
                  ),
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
            trailing ?? const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

class DottyListSection extends StatelessWidget {
  const DottyListSection({
    super.key,
    required this.title,
    required this.children,
    this.margin,
  });

  final String title;
  final List<Widget> children;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        color: DottyColors.card,
        border: Border.all(color: DottyColors.border),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              title.toUpperCase(),
              style: DottyTypography.labelSmall.copyWith(
                color: DottyColors.muted,
                letterSpacing: 1.5,
              ),
            ),
          ),
          ...children,
        ],
      ),
    );
  }
}
