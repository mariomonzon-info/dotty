import 'package:flutter/material.dart';
import '../../theme/dotty_colors.dart';
import '../../theme/dotty_typography.dart';
import '../icon/dotty_icon.dart';

class DottySection extends StatelessWidget {
  const DottySection({
    super.key,
    required this.title,
    this.icon,
    required this.child,
    this.margin = const EdgeInsets.only(top: 64),
  });

  final String title;
  final String? icon;
  final Widget child;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (icon != null) ...[
                DottyEmojiIcon(icon!, size: 16),
                const SizedBox(width: 10),
              ],
              Text(title.toUpperCase(), style: DottyTypography.sectionTitle),
              const SizedBox(width: 10),
              Expanded(child: Container(height: 1, color: DottyColors.border)),
            ],
          ),
          const SizedBox(height: 24),
          child,
        ],
      ),
    );
  }
}
