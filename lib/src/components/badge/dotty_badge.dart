import 'package:flutter/material.dart';
import '../../theme/dotty_colors.dart';

enum DottyBadgeColor { green, blue, orange, muted }

class DottyBadge extends StatelessWidget {
  const DottyBadge({
    super.key,
    required this.label,
    this.color = DottyBadgeColor.green,
    this.small = false,
  });

  final String label;
  final DottyBadgeColor color;
  final bool small;

  Color get _backgroundColor {
    switch (color) {
      case DottyBadgeColor.green:
        return DottyColors.accentSubtle;
      case DottyBadgeColor.blue:
        return DottyColors.accent3Subtle;
      case DottyBadgeColor.orange:
        return DottyColors.accent2Subtle;
      case DottyBadgeColor.muted:
        return DottyColors.mutedSubtle;
    }
  }

  Color get _foregroundColor {
    switch (color) {
      case DottyBadgeColor.green:
        return DottyColors.accent;
      case DottyBadgeColor.blue:
        return DottyColors.accent3;
      case DottyBadgeColor.orange:
        return DottyColors.accent2;
      case DottyBadgeColor.muted:
        return DottyColors.muted;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: small ? 6 : 10,
        vertical: small ? 2 : 4,
      ),
      decoration: BoxDecoration(
        color: _backgroundColor,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: small ? 10 : 12,
          fontWeight: FontWeight.w600,
          color: _foregroundColor,
        ),
      ),
    );
  }
}
