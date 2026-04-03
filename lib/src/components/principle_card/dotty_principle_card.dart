import 'package:flutter/material.dart';
import '../../theme/dotty_colors.dart';
import '../../theme/dotty_typography.dart';

class DottyPrincipleCard extends StatelessWidget {
  const DottyPrincipleCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  final String icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: DottyColors.card,
        border: Border.all(color: DottyColors.border),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 3,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [DottyColors.accent, Colors.transparent],
                ),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(icon, style: const TextStyle(fontSize: 26)),
              const SizedBox(height: 10),
              Text(
                title,
                style: DottyTypography.titleSmall.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                description,
                style: DottyTypography.bodySmall.copyWith(
                  color: DottyColors.muted,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
