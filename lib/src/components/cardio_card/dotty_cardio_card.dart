import 'package:flutter/material.dart';
import '../../theme/dotty_colors.dart';
import '../../theme/dotty_typography.dart';

class DottyCardioCard extends StatelessWidget {
  const DottyCardioCard({
    super.key,
    required this.weekLabel,
    required this.totalTime,
    required this.steps,
    this.accentColor,
  });

  final String weekLabel;
  final String totalTime;
  final List<DottyCardioStep> steps;
  final Color? accentColor;

  Color get _accent => accentColor ?? DottyColors.accent3;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: DottyColors.card,
        border: Border.all(color: DottyColors.border),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [_accent.withValues(alpha: 0.12), Colors.transparent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              border: Border(bottom: BorderSide(color: DottyColors.border)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  weekLabel,
                  style: DottyTypography.headlineMedium.copyWith(
                    color: _accent,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  totalTime,
                  style: DottyTypography.bodyMedium.copyWith(
                    color: DottyColors.muted,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: steps.asMap().entries.map((entry) {
                return _buildStep(entry.key, entry.value);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStep(int index, DottyCardioStep step) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color:
                  step.backgroundColor?.withValues(alpha: 0.15) ??
                  DottyColors.muted.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(step.icon, style: const TextStyle(fontSize: 16)),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  step.label,
                  style: DottyTypography.titleSmall.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (step.sublabel != null)
                  Text(
                    step.sublabel!,
                    style: DottyTypography.bodySmall.copyWith(
                      color: DottyColors.muted,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DottyCardioStep {
  const DottyCardioStep({
    required this.icon,
    required this.label,
    this.sublabel,
    this.backgroundColor,
  });

  final String icon;
  final String label;
  final String? sublabel;
  final Color? backgroundColor;
}
