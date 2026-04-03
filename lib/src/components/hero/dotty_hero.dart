import 'package:flutter/material.dart';
import '../../theme/dotty_colors.dart';
import '../../theme/dotty_typography.dart';
import '../stat/dotty_stat.dart';
import '../pill/dotty_pill.dart';

class DottyHero extends StatelessWidget {
  const DottyHero({
    super.key,
    this.pillLabel,
    this.pillIcon,
    required this.title,
    this.titleAccent,
    this.subtitle,
    this.stats = const [],
    this.backgroundText,
    this.backgroundTextColor,
    this.padding = const EdgeInsets.symmetric(vertical: 70),
  });

  final String? pillLabel;
  final String? pillIcon;
  final String title;
  final String? titleAccent;
  final String? subtitle;
  final List<DottyStatData> stats;
  final String? backgroundText;
  final Color? backgroundTextColor;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          if (backgroundText != null)
            Positioned(
              right: -60,
              top: 10,
              child: Text(
                backgroundText!,
                style: DottyTypography.displayLarge.copyWith(
                  fontSize: 220,
                  color:
                      backgroundTextColor ??
                      DottyColors.accent.withValues(alpha: 0.04),
                ),
              ),
            ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (pillLabel != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: DottyPill(label: pillLabel!, icon: pillIcon),
                ),
              if (titleAccent != null)
                RichText(
                  text: TextSpan(
                    style: DottyTypography.displaySmall,
                    children: [
                      TextSpan(text: title),
                      TextSpan(text: ' '),
                      TextSpan(
                        text: titleAccent,
                        style: DottyTypography.displaySmall.copyWith(
                          color: DottyColors.accent,
                        ),
                      ),
                    ],
                  ),
                )
              else
                Text(title, style: DottyTypography.displaySmall),
              if (subtitle != null) ...[
                const SizedBox(height: 10),
                Text(subtitle!, style: DottyTypography.subtitle),
              ],
              if (stats.isNotEmpty) ...[
                const SizedBox(height: 30),
                Wrap(
                  spacing: 32,
                  runSpacing: 16,
                  children: stats
                      .map(
                        (s) => DottyStat(
                          value: s.value,
                          label: s.label,
                          valueColor: s.valueColor,
                        ),
                      )
                      .toList(),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

class DottyStatData {
  const DottyStatData({
    required this.value,
    required this.label,
    this.valueColor,
  });

  final String value;
  final String label;
  final Color? valueColor;
}
