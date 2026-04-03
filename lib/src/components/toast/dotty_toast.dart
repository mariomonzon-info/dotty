import 'package:flutter/material.dart';
import '../../theme/dotty_colors.dart';
import '../../theme/dotty_typography.dart';

enum DottyToastType { info, success, warning, error }

class DottyToast extends StatelessWidget {
  const DottyToast({
    super.key,
    required this.message,
    this.type = DottyToastType.info,
    this.icon,
    this.duration = 3000,
    this.onDismiss,
  });

  final String message;
  final DottyToastType type;
  final String? icon;
  final int duration;
  final VoidCallback? onDismiss;

  Color get _backgroundColor {
    switch (type) {
      case DottyToastType.info:
        return DottyColors.accent3;
      case DottyToastType.success:
        return DottyColors.accent;
      case DottyToastType.warning:
        return DottyColors.warn;
      case DottyToastType.error:
        return DottyColors.accent2;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: _backgroundColor.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: _backgroundColor.withValues(alpha: 0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Text(icon!, style: const TextStyle(fontSize: 18)),
            const SizedBox(width: 10),
          ],
          Flexible(
            child: Text(
              message,
              style: DottyTypography.bodyMedium.copyWith(
                color: DottyColors.background,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DottyToastOverlay {
  static OverlayEntry? _overlayEntry;

  static void show(
    BuildContext context, {
    required String message,
    DottyToastType type = DottyToastType.info,
    String? icon,
    int duration = 3000,
  }) {
    _overlayEntry?.remove();

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).padding.top + 16,
        left: 16,
        right: 16,
        child: DottyToast(message: message, type: type, icon: icon),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);

    Future.delayed(Duration(milliseconds: duration), () {
      _overlayEntry?.remove();
      _overlayEntry = null;
    });
  }

  static void hide() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}
