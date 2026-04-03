import 'package:flutter/material.dart';
import '../../theme/dotty_colors.dart';
import '../../theme/dotty_typography.dart';
import '../badge/dotty_badge.dart';

class DottyExerciseRow extends StatelessWidget {
  const DottyExerciseRow({
    super.key,
    required this.name,
    this.series,
    this.reps,
    this.rest,
    this.notes,
  });

  final String name;
  final String? series;
  final String? reps;
  final String? rest;
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
            name,
            style: DottyTypography.bodyMedium.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        if (series != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            child: DottyBadge(label: series!, color: DottyBadgeColor.green),
          ),
        if (reps != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            child: Text(reps!, style: DottyTypography.bodyMedium),
          ),
        if (rest != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            child: Text(rest!, style: DottyTypography.bodyMedium),
          ),
        if (notes != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            child: notes!,
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) => const SizedBox();
}
