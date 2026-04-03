import 'package:flutter/material.dart';

enum DottyBreakpoint {
  xs(0, 'xs'),
  sm(576, 'sm'),
  md(768, 'md'),
  lg(992, 'lg'),
  xl(1200, 'xl'),
  xxl(1400, 'xxl');

  const DottyBreakpoint(this.width, this.name);
  final double width;
  final String name;

  static DottyBreakpoint of(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 576) return DottyBreakpoint.xs;
    if (width < 768) return DottyBreakpoint.sm;
    if (width < 992) return DottyBreakpoint.md;
    if (width < 1200) return DottyBreakpoint.lg;
    if (width < 1400) return DottyBreakpoint.xl;
    return DottyBreakpoint.xxl;
  }

  bool get isXs => this == DottyBreakpoint.xs;
  bool get isSm => this == DottyBreakpoint.sm;
  bool get isMd => this == DottyBreakpoint.md;
  bool get isLg => this == DottyBreakpoint.lg;
  bool get isXl => this == DottyBreakpoint.xl;
  bool get isMobile => this == DottyBreakpoint.xs || this == DottyBreakpoint.sm;
  bool get isTablet => this == DottyBreakpoint.md;
  bool get isDesktop =>
      this == DottyBreakpoint.lg ||
      this == DottyBreakpoint.xl ||
      this == DottyBreakpoint.xxl;
}

class DottyResponsive extends StatelessWidget {
  const DottyResponsive({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  @override
  Widget build(BuildContext context) {
    final breakpoint = DottyBreakpoint.of(context);
    if (breakpoint.isMobile) return mobile;
    if (breakpoint.isTablet || tablet != null) return tablet ?? mobile;
    return desktop ?? tablet ?? mobile;
  }
}

class DottyResponsiveBuilder extends StatelessWidget {
  const DottyResponsiveBuilder({super.key, required this.builder});

  final Widget Function(BuildContext context, DottyBreakpoint breakpoint)
  builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final breakpoint = DottyBreakpoint.of(context);
        return builder(context, breakpoint);
      },
    );
  }
}

class DottyVisibility extends StatelessWidget {
  const DottyVisibility({
    super.key,
    required this.child,
    this.mobile = true,
    this.tablet = true,
    this.desktop = true,
  });

  final Widget child;
  final bool mobile;
  final bool tablet;
  final bool desktop;

  @override
  Widget build(BuildContext context) {
    final breakpoint = DottyBreakpoint.of(context);
    if (breakpoint.isMobile && !mobile) return const SizedBox.shrink();
    if (breakpoint.isTablet && !tablet) return const SizedBox.shrink();
    if (breakpoint.isDesktop && !desktop) return const SizedBox.shrink();
    return child;
  }
}
