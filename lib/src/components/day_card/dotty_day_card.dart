import 'package:flutter/material.dart';
import '../../theme/dotty_colors.dart';
import '../../theme/dotty_typography.dart';

enum DottyDayType { fuerza, cardio, core, rest }

class DottyDayCard extends StatelessWidget {
  const DottyDayCard({
    super.key,
    required this.dayName,
    required this.type,
    required this.dayType,
    required this.focus,
    this.place,
  });

  final String dayName;
  final DottyDayType type;
  final String dayType;
  final String focus;
  final String? place;

  Color get _accentColor {
    switch (type) {
      case DottyDayType.fuerza:
        return DottyColors.accent2;
      case DottyDayType.cardio:
        return DottyColors.accent3;
      case DottyDayType.core:
        return DottyColors.accent;
      case DottyDayType.rest:
        return DottyColors.muted;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: DottyColors.card,
        borderRadius: BorderRadius.circular(12),
        border: type != DottyDayType.rest
            ? Border(top: BorderSide(color: _accentColor, width: 3))
            : Border.all(color: DottyColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            dayName,
            style: DottyTypography.headlineMedium.copyWith(fontSize: 18),
          ),
          const SizedBox(height: 4),
          Text(
            dayType.toUpperCase(),
            style: DottyTypography.labelMedium.copyWith(
              color: _accentColor,
              letterSpacing: 1.5,
            ),
          ),
          if (place != null) ...[
            const SizedBox(height: 6),
            Text(
              place!,
              style: DottyTypography.bodySmall.copyWith(
                color: DottyColors.muted,
              ),
            ),
          ],
          const SizedBox(height: 6),
          Text(
            focus,
            style: DottyTypography.bodyMedium.copyWith(color: DottyColors.text),
          ),
        ],
      ),
    );
  }
}
