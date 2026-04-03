import 'package:flutter/material.dart';

class DottyColors {
  DottyColors._();

  static const dark = _DottyDarkColors();
  static const light = _DottyLightColors();

  static _DottyColorTheme get _current => _isDark ? _dark : _light;
  static bool _isDark = true;

  static void setTheme(bool isDark) {
    _isDark = isDark;
  }

  static Color get background => _current.background;
  static Color get surface => _current.surface;
  static Color get card => _current.card;
  static Color get border => _current.border;
  static Color get text => _current.text;
  static Color get muted => _current.muted;
  static Color get warn => _current.warn;

  static Color get accent => _current.accent;
  static Color get accent2 => _current.accent2;
  static Color get accent3 => _current.accent3;

  static Color get accentSubtle => _current.accentSubtle;
  static Color get accent2Subtle => _current.accent2Subtle;
  static Color get accent3Subtle => _current.accent3Subtle;
  static Color get mutedSubtle => _current.mutedSubtle;
  static Color get warnSubtle => _current.warnSubtle;

  static const _dark = _DottyDarkColors();
  static const _light = _DottyLightColors();
}

abstract class _DottyColorTheme {
  Color get background;
  Color get surface;
  Color get card;
  Color get border;
  Color get text;
  Color get muted;
  Color get warn;

  Color get accent;
  Color get accent2;
  Color get accent3;

  Color get accentSubtle;
  Color get accent2Subtle;
  Color get accent3Subtle;
  Color get mutedSubtle;
  Color get warnSubtle;

  MaterialColor get accentPalette;
  MaterialColor get accent2Palette;
  MaterialColor get accent3Palette;
}

class _DottyDarkColors implements _DottyColorTheme {
  const _DottyDarkColors();

  @override
  Color get background => const Color(0xFF0a0c0f);
  @override
  Color get surface => const Color(0xFF111418);
  @override
  Color get card => const Color(0xFF161b22);
  @override
  Color get border => const Color(0xFF1e2630);
  @override
  Color get text => const Color(0xFFe8edf2);
  @override
  Color get muted => const Color(0xFF6b7a8d);
  @override
  Color get warn => const Color(0xFFf5c518);

  @override
  Color get accent => const Color(0xFF00e5a0);
  @override
  Color get accent2 => const Color(0xFFff6b35);
  @override
  Color get accent3 => const Color(0xFF4d9fff);

  @override
  Color get accentSubtle => const Color(0x1A00e5a0);
  @override
  Color get accent2Subtle => const Color(0x1Aff6b35);
  @override
  Color get accent3Subtle => const Color(0x1A4d9fff);
  @override
  Color get mutedSubtle => const Color(0x1A6b7a8d);
  @override
  Color get warnSubtle => const Color(0x1Af5c518);

  @override
  MaterialColor get accentPalette => MaterialColor(0xFF00e5a0, {
    50: const Color(0xFFE6FFF5),
    100: const Color(0xFFB3FFE0),
    200: const Color(0xFF80FFCC),
    300: const Color(0xFF4DFFB8),
    400: const Color(0xFF1AFFA3),
    500: const Color(0xFF00e5a0),
    600: const Color(0xFF00B880),
    700: const Color(0xFF008A60),
    800: const Color(0xFF005C40),
    900: const Color(0xFF002E20),
  });

  @override
  MaterialColor get accent2Palette => MaterialColor(0xFFff6b35, {
    50: const Color(0xFFFFF0EB),
    100: const Color(0xFFFFD9C7),
    200: const Color(0xFFFFC3A3),
    300: const Color(0xFFFFAC7F),
    400: const Color(0xFFFF965B),
    500: const Color(0xFFff6b35),
    600: const Color(0xFFCC5529),
    700: const Color(0xFF993F1E),
    800: const Color(0xFF662913),
    900: const Color(0xFF331307),
  });

  @override
  MaterialColor get accent3Palette => MaterialColor(0xFF4d9fff, {
    50: const Color(0xFFE6F0FF),
    100: const Color(0xFFB3D4FF),
    200: const Color(0xFF80B8FF),
    300: const Color(0xFF4D9CFF),
    400: const Color(0xFF1A80FF),
    500: const Color(0xFF4d9fff),
    600: const Color(0xFF3D7FCC),
    700: const Color(0xFF2C5F99),
    800: const Color(0xFF1B3F66),
    900: const Color(0xFF0A1F33),
  });
}

class _DottyLightColors implements _DottyColorTheme {
  const _DottyLightColors();

  @override
  Color get background => const Color(0xFFF5F7FA);
  @override
  Color get surface => const Color(0xFFFFFFFF);
  @override
  Color get card => const Color(0xFFFFFFFF);
  @override
  Color get border => const Color(0xFFE2E8F0);
  @override
  Color get text => const Color(0xFF1A202C);
  @override
  Color get muted => const Color(0xFF718096);
  @override
  Color get warn => const Color(0xFFD69E2E);

  @override
  Color get accent => const Color(0xFF00B880);
  @override
  Color get accent2 => const Color(0xFFE55A2B);
  @override
  Color get accent3 => const Color(0xFF3182CE);

  @override
  Color get accentSubtle => const Color(0x1A00B880);
  @override
  Color get accent2Subtle => const Color(0x1AE55A2B);
  @override
  Color get accent3Subtle => const Color(0x1A3182CE);
  @override
  Color get mutedSubtle => const Color(0x1A718096);
  @override
  Color get warnSubtle => const Color(0x1AD69E2E);

  @override
  MaterialColor get accentPalette => MaterialColor(0xFF00B880, {
    50: const Color(0xFFE6FFF5),
    100: const Color(0xFFB3FFE0),
    200: const Color(0xFF80FFCC),
    300: const Color(0xFF4DFFB8),
    400: const Color(0xFF1AFFA3),
    500: const Color(0xFF00B880),
    600: const Color(0xFF009A6A),
    700: const Color(0xFF007A54),
    800: const Color(0xFF005A3E),
    900: const Color(0xFF002A1F),
  });

  @override
  MaterialColor get accent2Palette => MaterialColor(0xFFE55A2B, {
    50: const Color(0xFFFFF0EB),
    100: const Color(0xFFFFD9C7),
    200: const Color(0xFFFFC3A3),
    300: const Color(0xFFFFAC7F),
    400: const Color(0xFFFF965B),
    500: const Color(0xFFE55A2B),
    600: const Color(0xFFB84722),
    700: const Color(0xFF8A351A),
    800: const Color(0xFF5C2311),
    900: const Color(0xFF2E1109),
  });

  @override
  MaterialColor get accent3Palette => MaterialColor(0xFF3182CE, {
    50: const Color(0xFFE6F0FF),
    100: const Color(0xFFB3D4FF),
    200: const Color(0xFF80B8FF),
    300: const Color(0xFF4D9CFF),
    400: const Color(0xFF1A80FF),
    500: const Color(0xFF3182CE),
    600: const Color(0xFF2A6BA6),
    700: const Color(0xFF1F547D),
    800: const Color(0xFF143D55),
    900: const Color(0xFF0A1E2C),
  });
}
