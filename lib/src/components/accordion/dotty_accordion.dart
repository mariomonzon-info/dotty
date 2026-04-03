import 'package:flutter/material.dart';
import '../../theme/dotty_colors.dart';
import '../../theme/dotty_typography.dart';

class DottyAccordion extends StatefulWidget {
  const DottyAccordion({
    super.key,
    required this.title,
    required this.child,
    this.initiallyExpanded = false,
    this.icon,
  });

  final String title;
  final Widget child;
  final bool initiallyExpanded;
  final String? icon;

  @override
  State<DottyAccordion> createState() => _DottyAccordionState();
}

class _DottyAccordionState extends State<DottyAccordion>
    with SingleTickerProviderStateMixin {
  late bool _isExpanded;
  late AnimationController _controller;
  late Animation<double> _iconTurns;
  late Animation<double> _heightFactor;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.initiallyExpanded;
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _iconTurns = Tween<double>(
      begin: 0.0,
      end: 0.5,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _heightFactor = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    if (_isExpanded) _controller.value = 1.0;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: DottyColors.card,
        border: Border.all(color: DottyColors.border),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: _handleTap,
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  if (widget.icon != null) ...[
                    Text(widget.icon!, style: const TextStyle(fontSize: 18)),
                    const SizedBox(width: 12),
                  ],
                  Expanded(
                    child: Text(
                      widget.title,
                      style: DottyTypography.titleSmall,
                    ),
                  ),
                  RotationTransition(
                    turns: _iconTurns,
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: DottyColors.muted,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ClipRect(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Align(
                  alignment: Alignment.topCenter,
                  heightFactor: _heightFactor.value,
                  child: child,
                );
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: widget.child,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
