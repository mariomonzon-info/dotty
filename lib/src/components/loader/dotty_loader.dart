import 'package:flutter/material.dart';
import '../../theme/dotty_colors.dart';

class DottyLoader extends StatefulWidget {
  const DottyLoader({
    super.key,
    this.size = 40,
    this.color,
    this.strokeWidth = 3,
  });

  final double size;
  final Color? color;
  final double strokeWidth;

  @override
  State<DottyLoader> createState() => _DottyLoaderState();
}

class _DottyLoaderState extends State<DottyLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: CircularProgressIndicator(
        strokeWidth: widget.strokeWidth,
        valueColor: AlwaysStoppedAnimation<Color>(
          widget.color ?? DottyColors.accent,
        ),
      ),
    );
  }
}

class DottyDotsLoader extends StatefulWidget {
  const DottyDotsLoader({
    super.key,
    this.dotSize = 10,
    this.color,
    this.spacing = 4,
  });

  final double dotSize;
  final Color? color;
  final double spacing;

  @override
  State<DottyDotsLoader> createState() => _DottyDotsLoaderState();
}

class _DottyDotsLoaderState extends State<DottyDotsLoader>
    with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(3, (index) {
      return AnimationController(
        duration: const Duration(milliseconds: 600),
        vsync: this,
      );
    });

    _animations = _controllers.map((controller) {
      return Tween<double>(
        begin: 0,
        end: 1,
      ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
    }).toList();

    for (int i = 0; i < 3; i++) {
      Future.delayed(Duration(milliseconds: i * 200), () {
        if (mounted) _controllers[i].repeat(reverse: true);
      });
    }
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(3, (index) {
        return AnimatedBuilder(
          animation: _animations[index],
          builder: (context, child) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: widget.spacing / 2),
              width: widget.dotSize,
              height: widget.dotSize,
              decoration: BoxDecoration(
                color: (widget.color ?? DottyColors.accent).withValues(
                  alpha: 0.3 + (_animations[index].value * 0.7),
                ),
                shape: BoxShape.circle,
              ),
            );
          },
        );
      }),
    );
  }
}
