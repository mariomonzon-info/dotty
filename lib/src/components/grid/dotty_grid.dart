import 'package:flutter/material.dart';

class DottyGrid extends StatelessWidget {
  const DottyGrid({
    super.key,
    required this.children,
    this.minItemWidth = 160,
    this.crossAxisSpacing = 12,
    this.mainAxisSpacing = 12,
  });

  final List<Widget> children;
  final double minItemWidth;
  final double crossAxisSpacing;
  final double mainAxisSpacing;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final columns = _calculateColumns(constraints.maxWidth);
        return GridView.count(
          crossAxisCount: columns,
          crossAxisSpacing: crossAxisSpacing,
          mainAxisSpacing: mainAxisSpacing,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          childAspectRatio: minItemWidth / 100,
          children: children,
        );
      },
    );
  }

  int _calculateColumns(double width) {
    if (width < 576) return 1;
    if (width < 768) return 2;
    if (width < 992) return 3;
    if (width < 1200) return 4;
    return 5;
  }
}

class DottyGridFixed extends StatelessWidget {
  const DottyGridFixed({
    super.key,
    required this.children,
    this.columns,
    this.crossAxisSpacing = 12,
    this.mainAxisSpacing = 12,
    this.childAspectRatio,
    this.mobileColumns,
    this.tabletColumns,
    this.desktopColumns,
  });

  final List<Widget> children;
  final int? columns;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final double? childAspectRatio;
  final int? mobileColumns;
  final int? tabletColumns;
  final int? desktopColumns;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final cols = _getColumns(width);

    return GridView.count(
      crossAxisCount: cols,
      crossAxisSpacing: crossAxisSpacing,
      mainAxisSpacing: mainAxisSpacing,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: childAspectRatio ?? (width < 576 ? 1.0 : 1.5),
      children: children,
    );
  }

  int _getColumns(double width) {
    if (columns != null) return columns!;

    if (width < 576 && mobileColumns != null) return mobileColumns!;
    if (width < 992 && tabletColumns != null) return tabletColumns!;
    if (width >= 992 && desktopColumns != null) return desktopColumns!;

    if (width < 576) return 1;
    if (width < 768) return 2;
    if (width < 992) return 3;
    return 4;
  }
}

class DottyStack extends StatelessWidget {
  const DottyStack({
    super.key,
    required this.children,
    this.alignment = Alignment.center,
  });

  final List<Widget> children;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: alignment, children: children);
  }
}

class DottyStackPositioned extends StatelessWidget {
  const DottyStackPositioned({
    super.key,
    required this.child,
    this.top,
    this.bottom,
    this.left,
    this.right,
    this.width,
    this.height,
  });

  final Widget child;
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      width: width,
      height: height,
      child: child,
    );
  }
}

class DottyFlex extends StatelessWidget {
  const DottyFlex({
    super.key,
    required this.children,
    this.direction = Axis.horizontal,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.spacing = 0,
    this.runSpacing = 0,
    this.wrap = true,
    this.mainAxisSize = MainAxisSize.min,
  });

  final List<Widget> children;
  final Axis direction;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final double spacing;
  final double runSpacing;
  final bool wrap;
  final MainAxisSize mainAxisSize;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    final effectiveWrap = wrap || isMobile;
    final effectiveSpacing = isMobile ? spacing * 0.5 : spacing;
    final effectiveRunSpacing = isMobile ? runSpacing * 0.5 : runSpacing;

    if (effectiveWrap) {
      return Wrap(
        direction: direction,
        alignment: _wrapAlignment(mainAxisAlignment),
        crossAxisAlignment: _wrapCrossAlignment(crossAxisAlignment),
        spacing: effectiveSpacing,
        runSpacing: effectiveRunSpacing,
        children: children,
      );
    }

    if (direction == Axis.horizontal) {
      return Row(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: mainAxisSize,
        children: _separateChildren(effectiveSpacing),
      );
    }

    return Column(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: mainAxisSize,
      children: _separateChildren(effectiveSpacing),
    );
  }

  WrapAlignment _wrapAlignment(MainAxisAlignment alignment) {
    switch (alignment) {
      case MainAxisAlignment.start:
        return WrapAlignment.start;
      case MainAxisAlignment.end:
        return WrapAlignment.end;
      case MainAxisAlignment.center:
        return WrapAlignment.center;
      case MainAxisAlignment.spaceBetween:
        return WrapAlignment.spaceBetween;
      case MainAxisAlignment.spaceAround:
        return WrapAlignment.spaceAround;
      case MainAxisAlignment.spaceEvenly:
        return WrapAlignment.spaceEvenly;
    }
  }

  WrapCrossAlignment _wrapCrossAlignment(CrossAxisAlignment alignment) {
    switch (alignment) {
      case CrossAxisAlignment.start:
        return WrapCrossAlignment.start;
      case CrossAxisAlignment.end:
        return WrapCrossAlignment.end;
      case CrossAxisAlignment.center:
        return WrapCrossAlignment.center;
      default:
        return WrapCrossAlignment.start;
    }
  }

  List<Widget> _separateChildren(double spacing) {
    if (children.isEmpty) return children;
    final result = <Widget>[];
    for (var i = 0; i < children.length; i++) {
      result.add(children[i]);
      if (i < children.length - 1) {
        result.add(SizedBox(width: spacing, height: spacing));
      }
    }
    return result;
  }
}

class DottySpacer extends StatelessWidget {
  const DottySpacer({super.key, this.size = 8});

  final double size;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    final effectiveSize = isMobile ? size * 0.5 : size;
    return SizedBox(width: effectiveSize, height: effectiveSize);
  }

  factory DottySpacer.xs() => const DottySpacer(size: 4);
  factory DottySpacer.sm() => const DottySpacer(size: 8);
  factory DottySpacer.md() => const DottySpacer(size: 16);
  factory DottySpacer.lg() => const DottySpacer(size: 24);
  factory DottySpacer.xl() => const DottySpacer(size: 32);
  factory DottySpacer.xxl() => const DottySpacer(size: 48);
}
