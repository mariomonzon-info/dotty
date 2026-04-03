import 'package:flutter/material.dart';
import '../../theme/dotty_colors.dart';

class DottySkeleton extends StatefulWidget {
  const DottySkeleton({
    super.key,
    this.width,
    this.height = 20,
    this.borderRadius = 4,
    this.shimmer = true,
  });

  final double? width;
  final double height;
  final double borderRadius;
  final bool shimmer;

  @override
  State<DottySkeleton> createState() => _DottySkeletonState();
}

class _DottySkeletonState extends State<DottySkeleton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _animation = Tween<double>(
      begin: -1,
      end: 2,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    if (widget.shimmer) _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: DottyColors.surface,
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
      child: widget.shimmer
          ? AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: const [
                        Colors.transparent,
                        Color(0x1A6b7a8d),
                        Colors.transparent,
                      ],
                      stops: [
                        _animation.value - 1,
                        _animation.value,
                        _animation.value + 1,
                      ].map((s) => s.clamp(0.0, 1.0)).toList(),
                    ),
                  ),
                );
              },
            )
          : null,
    );
  }
}

class DottySkeletonBox extends StatelessWidget {
  const DottySkeletonBox({super.key, required this.child, this.shimmer = true});

  final Widget child;
  final bool shimmer;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 300),
      opacity: 1.0,
      child: child,
    );
  }
}
