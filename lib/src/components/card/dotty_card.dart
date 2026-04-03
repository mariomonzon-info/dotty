import 'package:flutter/material.dart';
import '../../theme/dotty_colors.dart';

enum DottyCardVariant { defaultVariant, elevated, outlined }

enum DottyCardAccent { none, green, orange, blue }

class DottyCard extends StatefulWidget {
  const DottyCard({
    super.key,
    required this.child,
    this.variant = DottyCardVariant.defaultVariant,
    this.accent = DottyCardAccent.none,
    this.padding = const EdgeInsets.all(20),
    this.onTap,
    this.onHover,
  });

  final Widget child;
  final DottyCardVariant variant;
  final DottyCardAccent accent;
  final EdgeInsets padding;
  final VoidCallback? onTap;
  final void Function(bool isHovered)? onHover;

  @override
  State<DottyCard> createState() => _DottyCardState();
}

class _DottyCardState extends State<DottyCard> {
  bool _isHovered = false;

  Color get _borderColor {
    if (_isHovered) return _accentColor;
    return DottyColors.border;
  }

  Color get _accentColor {
    switch (widget.accent) {
      case DottyCardAccent.green:
        return DottyColors.accent;
      case DottyCardAccent.orange:
        return DottyColors.accent2;
      case DottyCardAccent.blue:
        return DottyColors.accent3;
      case DottyCardAccent.none:
        return DottyColors.border;
    }
  }

  Color get _backgroundColor {
    switch (widget.variant) {
      case DottyCardVariant.defaultVariant:
      case DottyCardVariant.outlined:
        return DottyColors.card;
      case DottyCardVariant.elevated:
        return DottyColors.surface;
    }
  }

  double get _elevation {
    if (_isHovered) return 4;
    switch (widget.variant) {
      case DottyCardVariant.defaultVariant:
      case DottyCardVariant.outlined:
        return 0;
      case DottyCardVariant.elevated:
        return 2;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        widget.onHover?.call(true);
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        widget.onHover?.call(false);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.translationValues(0, _isHovered ? -3 : 0, 0),
        child: Container(
          decoration: BoxDecoration(
            color: _backgroundColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: _borderColor),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: _elevation * 2,
                offset: Offset(0, _elevation),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: widget.onTap,
              borderRadius: BorderRadius.circular(12),
              child: Stack(
                children: [
                  if (widget.accent != DottyCardAccent.none)
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 3,
                        decoration: BoxDecoration(
                          color: _accentColor,
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  Padding(padding: widget.padding, child: widget.child),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DottyCardWithImage extends StatefulWidget {
  const DottyCardWithImage({
    super.key,
    required this.imageUrl,
    required this.title,
    this.subtitle,
    this.onTap,
    this.imageHeight = 120,
  });

  final String imageUrl;
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;
  final double imageHeight;

  @override
  State<DottyCardWithImage> createState() => _DottyCardWithImageState();
}

class _DottyCardWithImageState extends State<DottyCardWithImage> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.translationValues(0, _isHovered ? -3 : 0, 0),
        child: Container(
          decoration: BoxDecoration(
            color: DottyColors.card,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _isHovered ? DottyColors.accent : DottyColors.border,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: _isHovered ? 8 : 0,
                offset: Offset(0, _isHovered ? 4 : 0),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: widget.onTap,
              borderRadius: BorderRadius.circular(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                    child: Image.network(
                      widget.imageUrl,
                      height: widget.imageHeight,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: widget.imageHeight,
                        color: DottyColors.surface,
                        child: Center(
                          child: Icon(Icons.image, color: DottyColors.muted),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: DottyColors.text,
                          ),
                        ),
                        if (widget.subtitle != null) ...[
                          const SizedBox(height: 4),
                          Text(
                            widget.subtitle!,
                            style: TextStyle(
                              fontSize: 13,
                              color: DottyColors.muted,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DottyCardWithFooter extends StatefulWidget {
  const DottyCardWithFooter({
    super.key,
    required this.child,
    required this.footer,
    this.onTap,
    this.variant = DottyCardVariant.defaultVariant,
  });

  final Widget child;
  final Widget footer;
  final VoidCallback? onTap;
  final DottyCardVariant variant;

  @override
  State<DottyCardWithFooter> createState() => _DottyCardWithFooterState();
}

class _DottyCardWithFooterState extends State<DottyCardWithFooter> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.translationValues(0, _isHovered ? -3 : 0, 0),
        child: Container(
          decoration: BoxDecoration(
            color: DottyColors.card,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _isHovered ? DottyColors.accent : DottyColors.border,
            ),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: widget.onTap,
              borderRadius: BorderRadius.circular(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: widget.child,
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: DottyColors.border),
                      ),
                    ),
                    child: widget.footer,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DottyCardClickable extends StatefulWidget {
  const DottyCardClickable({
    super.key,
    required this.child,
    this.onTap,
    this.onLongPress,
    this.padding = const EdgeInsets.all(20),
  });

  final Widget child;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final EdgeInsets padding;

  @override
  State<DottyCardClickable> createState() => _DottyCardClickableState();
}

class _DottyCardClickableState extends State<DottyCardClickable> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onTap,
      onLongPress: widget.onLongPress,
      child: AnimatedScale(
        scale: _isPressed ? 0.98 : 1.0,
        duration: const Duration(milliseconds: 100),
        child: Container(
          padding: widget.padding,
          decoration: BoxDecoration(
            color: DottyColors.card,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: DottyColors.border),
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
