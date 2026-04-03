import 'package:flutter/material.dart';
import '../../theme/dotty_colors.dart';
import '../../theme/dotty_typography.dart';

enum DottyTextVariant { display, headline, title, body, label }

class DottyText extends StatelessWidget {
  const DottyText(
    this.text, {
    super.key,
    this.variant = DottyTextVariant.body,
    this.color,
    this.accent = false,
  });

  final String text;
  final DottyTextVariant variant;
  final Color? color;
  final bool accent;

  TextStyle get _style {
    switch (variant) {
      case DottyTextVariant.display:
        return DottyTypography.displaySmall.copyWith(color: _textColor);
      case DottyTextVariant.headline:
        return DottyTypography.headlineSmall.copyWith(color: _textColor);
      case DottyTextVariant.title:
        return DottyTypography.titleMedium.copyWith(color: _textColor);
      case DottyTextVariant.body:
        return DottyTypography.bodyMedium.copyWith(color: _textColor);
      case DottyTextVariant.label:
        return DottyTypography.labelMedium.copyWith(color: _textColor);
    }
  }

  Color get _textColor {
    if (color != null) return color!;
    if (accent) return DottyColors.accent;
    return DottyColors.text;
  }

  @override
  Widget build(BuildContext context) {
    return Text(text, style: _style);
  }

  factory DottyText.display(
    String text, {
    Key? key,
    Color? color,
    bool accent = false,
  }) {
    return DottyText(
      text,
      key: key,
      variant: DottyTextVariant.display,
      color: color,
      accent: accent,
    );
  }

  factory DottyText.headline(
    String text, {
    Key? key,
    Color? color,
    bool accent = false,
  }) {
    return DottyText(
      text,
      key: key,
      variant: DottyTextVariant.headline,
      color: color,
      accent: accent,
    );
  }

  factory DottyText.title(
    String text, {
    Key? key,
    Color? color,
    bool accent = false,
  }) {
    return DottyText(
      text,
      key: key,
      variant: DottyTextVariant.title,
      color: color,
      accent: accent,
    );
  }

  factory DottyText.body(
    String text, {
    Key? key,
    Color? color,
    bool accent = false,
  }) {
    return DottyText(
      text,
      key: key,
      variant: DottyTextVariant.body,
      color: color,
      accent: accent,
    );
  }

  factory DottyText.label(
    String text, {
    Key? key,
    Color? color,
    bool accent = false,
  }) {
    return DottyText(
      text,
      key: key,
      variant: DottyTextVariant.label,
      color: color,
      accent: accent,
    );
  }
}
