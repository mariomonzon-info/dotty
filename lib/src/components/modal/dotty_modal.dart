import 'package:flutter/material.dart';
import '../../theme/dotty_colors.dart';
import '../../theme/dotty_typography.dart';

class DottyModal extends StatelessWidget {
  const DottyModal({
    super.key,
    required this.child,
    this.title,
    this.actions,
    this.onClose,
    this.width,
    this.padding,
  });

  final Widget child;
  final String? title;
  final List<Widget>? actions;
  final VoidCallback? onClose;
  final double? width;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: width ?? 400,
        constraints: const BoxConstraints(maxWidth: 500),
        decoration: BoxDecoration(
          color: DottyColors.card,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: DottyColors.border),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.5),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null || onClose != null)
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    if (title != null)
                      Expanded(
                        child: Text(title!, style: DottyTypography.titleLarge),
                      ),
                    if (onClose != null)
                      IconButton(
                        onPressed: onClose,
                        icon: const Icon(Icons.close, size: 20),
                        color: DottyColors.muted,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                  ],
                ),
              ),
            Padding(
              padding: padding ?? const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: child,
            ),
            if (actions != null && actions!.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: DottyColors.border)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: actions!
                      .map(
                        (action) => Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: action,
                        ),
                      )
                      .toList(),
                ),
              ),
          ],
        ),
      ),
    );
  }

  static Future<T?> show<T>({
    required BuildContext context,
    required Widget child,
    String? title,
    List<Widget>? actions,
    VoidCallback? onClose,
    double? width,
    EdgeInsets? padding,
    bool barrierDismissible = true,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => DottyModal(
        title: title,
        actions: actions,
        onClose: onClose ?? () => Navigator.of(context).pop(),
        width: width,
        padding: padding,
        child: child,
      ),
    );
  }
}

class DottyBottomSheet extends StatelessWidget {
  const DottyBottomSheet({
    super.key,
    required this.child,
    this.title,
    this.actions,
    this.onClose,
  });

  final Widget child;
  final String? title;
  final List<Widget>? actions;
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: DottyColors.card,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        border: Border(top: BorderSide(color: DottyColors.border)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: DottyColors.border,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 20),
          if (title != null)
            Row(
              children: [
                Expanded(
                  child: Text(title!, style: DottyTypography.titleLarge),
                ),
                if (onClose != null)
                  IconButton(
                    onPressed: onClose,
                    icon: const Icon(Icons.close, size: 20),
                    color: DottyColors.muted,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
              ],
            ),
          child,
          if (actions != null && actions!.isNotEmpty) ...[
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: actions!
                  .map(
                    (action) => Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: action,
                    ),
                  )
                  .toList(),
            ),
          ],
        ],
      ),
    );
  }

  static Future<T?> show<T>({
    required BuildContext context,
    required Widget child,
    String? title,
    List<Widget>? actions,
    VoidCallback? onClose,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => DottyBottomSheet(
        title: title,
        actions: actions,
        onClose: onClose ?? () => Navigator.of(context).pop(),
        child: child,
      ),
    );
  }
}
