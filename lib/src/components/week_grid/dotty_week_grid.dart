import 'package:flutter/material.dart';

class DottyWeekGrid extends StatelessWidget {
  const DottyWeekGrid({
    super.key,
    required this.children,
    this.crossAxisSpacing = 10,
    this.mainAxisSpacing = 10,
  });

  final List<Widget> children;
  final double crossAxisSpacing;
  final double mainAxisSpacing;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 700;
        final columns = isMobile ? 2 : 7;
        return GridView.count(
          crossAxisCount: columns,
          crossAxisSpacing: crossAxisSpacing,
          mainAxisSpacing: mainAxisSpacing,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          childAspectRatio: isMobile ? 1.2 : 0.85,
          children: children,
        );
      },
    );
  }
}
