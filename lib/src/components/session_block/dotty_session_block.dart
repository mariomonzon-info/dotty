import 'package:flutter/material.dart';
import '../../theme/dotty_colors.dart';
import '../../theme/dotty_typography.dart';

enum DottySessionType { upper, lower, core }

class DottySessionBlock extends StatelessWidget {
  const DottySessionBlock({
    super.key,
    required this.title,
    required this.subtitle,
    required this.type,
    required this.rows,
    this.icon,
  });

  final String title;
  final String subtitle;
  final DottySessionType type;
  final List<TableRow> rows;
  final String? icon;

  Color get _accentColor {
    switch (type) {
      case DottySessionType.upper:
        return DottyColors.accent2;
      case DottySessionType.lower:
        return DottyColors.accent3;
      case DottySessionType.core:
        return DottyColors.accent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: DottyColors.card,
        border: Border.all(color: DottyColors.border),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: _accentColor.withValues(alpha: 0.07),
            blurRadius: 20,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  _accentColor.withValues(alpha: 0.07),
                  Colors.transparent,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              border: Border(bottom: BorderSide(color: DottyColors.border)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: DottyTypography.titleLarge.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: DottyTypography.bodyMedium.copyWith(
                        color: DottyColors.muted,
                      ),
                    ),
                  ],
                ),
                if (icon != null)
                  Text(icon!, style: const TextStyle(fontSize: 28)),
              ],
            ),
          ),
          Table(
            columnWidths: const {
              0: FlexColumnWidth(3),
              1: FlexColumnWidth(1),
              2: FlexColumnWidth(1),
              3: FlexColumnWidth(1),
            },
            children: [
              TableRow(
                decoration: BoxDecoration(
                  color: DottyColors.surface.withValues(alpha: 0.5),
                ),
                children: ['Ejercicio', 'Series', 'Reps', 'Notas']
                    .map(
                      (h) => Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        child: Text(
                          h.toUpperCase(),
                          style: DottyTypography.labelSmall.copyWith(
                            color: DottyColors.muted,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              ...rows,
            ],
          ),
        ],
      ),
    );
  }
}

class DottySessionRow extends StatelessWidget {
  const DottySessionRow({
    super.key,
    required this.exercise,
    required this.series,
    required this.reps,
    this.notes,
  });

  final String exercise;
  final String series;
  final String reps;
  final Widget? notes;

  TableRow toTableRow() {
    return TableRow(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: DottyColors.border)),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          child: Text(
            exercise,
            style: DottyTypography.bodyMedium.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          child: Text(series, style: DottyTypography.bodyMedium),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          child: Text(reps, style: DottyTypography.bodyMedium),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          child: notes ?? const SizedBox(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) => const SizedBox();
}
