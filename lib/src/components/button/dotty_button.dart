import 'package:flutter/material.dart';
import '../../theme/dotty_colors.dart';

enum DottyButtonVariant { primary, secondary, ghost, danger }

enum DottyButtonSize { small, medium, large }

class DottyButton extends StatefulWidget {
  const DottyButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.variant = DottyButtonVariant.primary,
    this.size = DottyButtonSize.medium,
    this.disabled = false,
    this.fullWidth = false,
    this.icon,
    this.loading = false,
  });

  final VoidCallback? onPressed;
  final Widget child;
  final DottyButtonVariant variant;
  final DottyButtonSize size;
  final bool disabled;
  final bool fullWidth;
  final Widget? icon;
  final bool loading;

  @override
  State<DottyButton> createState() => _DottyButtonState();
}

class _DottyButtonState extends State<DottyButton> {
  bool _isPressed = false;

  double get _horizontalPadding {
    switch (widget.size) {
      case DottyButtonSize.small:
        return 12;
      case DottyButtonSize.medium:
        return 24;
      case DottyButtonSize.large:
        return 32;
    }
  }

  double get _verticalPadding {
    switch (widget.size) {
      case DottyButtonSize.small:
        return 8;
      case DottyButtonSize.medium:
        return 12;
      case DottyButtonSize.large:
        return 16;
    }
  }

  double get _fontSize {
    switch (widget.size) {
      case DottyButtonSize.small:
        return 12;
      case DottyButtonSize.medium:
        return 14;
      case DottyButtonSize.large:
        return 16;
    }
  }

  Color get _backgroundColor {
    if (widget.disabled || widget.loading) return DottyColors.surface;
    switch (widget.variant) {
      case DottyButtonVariant.primary:
        return _isPressed
            ? DottyColors.accent.withValues(alpha: 0.8)
            : DottyColors.accent;
      case DottyButtonVariant.danger:
        return _isPressed
            ? DottyColors.accent2.withValues(alpha: 0.8)
            : DottyColors.accent2;
      case DottyButtonVariant.secondary:
      case DottyButtonVariant.ghost:
        return Colors.transparent;
    }
  }

  Color get _foregroundColor {
    if (widget.disabled) return DottyColors.muted;
    if (widget.loading) return DottyColors.muted;
    switch (widget.variant) {
      case DottyButtonVariant.primary:
        return DottyColors.background;
      case DottyButtonVariant.danger:
        return DottyColors.background;
      case DottyButtonVariant.secondary:
      case DottyButtonVariant.ghost:
        return DottyColors.accent;
    }
  }

  Border? get _border {
    switch (widget.variant) {
      case DottyButtonVariant.primary:
      case DottyButtonVariant.ghost:
      case DottyButtonVariant.danger:
        return null;
      case DottyButtonVariant.secondary:
        return Border.all(
          color: widget.disabled || widget.loading
              ? DottyColors.muted
              : widget.variant == DottyButtonVariant.danger
              ? DottyColors.accent2
              : DottyColors.accent,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: widget.disabled || widget.loading
          ? null
          : (_) => setState(() => _isPressed = true),
      onTapUp: widget.disabled || widget.loading
          ? null
          : (_) => setState(() => _isPressed = false),
      onTapCancel: widget.disabled || widget.loading
          ? null
          : () => setState(() => _isPressed = false),
      onTap: widget.disabled || widget.loading ? null : widget.onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: widget.fullWidth ? double.infinity : null,
        padding: EdgeInsets.symmetric(
          horizontal: _horizontalPadding,
          vertical: _verticalPadding,
        ),
        decoration: BoxDecoration(
          color: _backgroundColor,
          borderRadius: BorderRadius.circular(8),
          border: _border,
        ),
        child: Row(
          mainAxisSize: widget.fullWidth ? MainAxisSize.max : MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.loading)
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: SizedBox(
                  width: _fontSize,
                  height: _fontSize,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(_foregroundColor),
                  ),
                ),
              )
            else if (widget.icon != null)
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: IconTheme(
                  data: IconThemeData(
                    size: _fontSize + 2,
                    color: _foregroundColor,
                  ),
                  child: widget.icon!,
                ),
              ),
            DefaultTextStyle(
              style: TextStyle(
                fontSize: _fontSize,
                fontWeight: FontWeight.w600,
                color: _foregroundColor,
              ),
              child: widget.child,
            ),
          ],
        ),
      ),
    );
  }
}

class DottyIconButton extends StatefulWidget {
  const DottyIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.size = DottyButtonSize.medium,
    this.variant = DottyButtonVariant.ghost,
    this.tooltip,
    this.disabled = false,
  });

  final Widget icon;
  final VoidCallback? onPressed;
  final DottyButtonSize size;
  final DottyButtonVariant variant;
  final String? tooltip;
  final bool disabled;

  @override
  State<DottyIconButton> createState() => _DottyIconButtonState();
}

class _DottyIconButtonState extends State<DottyIconButton> {
  bool _isPressed = false;

  double get _size {
    switch (widget.size) {
      case DottyButtonSize.small:
        return 28;
      case DottyButtonSize.medium:
        return 36;
      case DottyButtonSize.large:
        return 44;
    }
  }

  Color get _backgroundColor {
    if (widget.disabled) return Colors.transparent;
    if (_isPressed) return DottyColors.accentSubtle;
    return Colors.transparent;
  }

  Color get _iconColor {
    if (widget.disabled) return DottyColors.muted;
    switch (widget.variant) {
      case DottyButtonVariant.primary:
        return DottyColors.background;
      case DottyButtonVariant.ghost:
      case DottyButtonVariant.secondary:
        return DottyColors.text;
      case DottyButtonVariant.danger:
        return DottyColors.accent2;
    }
  }

  @override
  Widget build(BuildContext context) {
    final button = GestureDetector(
      onTapDown: widget.disabled
          ? null
          : (_) => setState(() => _isPressed = true),
      onTapUp: widget.disabled
          ? null
          : (_) => setState(() => _isPressed = false),
      onTapCancel: widget.disabled
          ? null
          : () => setState(() => _isPressed = false),
      onTap: widget.disabled ? null : widget.onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: _size,
        height: _size,
        decoration: BoxDecoration(
          color: _backgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: IconTheme(
          data: IconThemeData(size: _size * 0.5, color: _iconColor),
          child: widget.icon,
        ),
      ),
    );

    if (widget.tooltip != null) {
      return Tooltip(message: widget.tooltip!, child: button);
    }
    return button;
  }
}

class DottyButtonGroup extends StatelessWidget {
  const DottyButtonGroup({super.key, required this.buttons, this.spacing = 8});

  final List<Widget> buttons;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Wrap(spacing: spacing, runSpacing: spacing, children: buttons);
  }
}
