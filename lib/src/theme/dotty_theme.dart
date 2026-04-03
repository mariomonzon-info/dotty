import 'package:flutter/material.dart';

class DottyTheme extends InheritedWidget {
  const DottyTheme({super.key, required super.child});

  static DottyTheme of(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<DottyTheme>();
    return provider ?? _defaultTheme;
  }

  static final DottyTheme _defaultTheme = const DottyTheme(child: SizedBox());

  @override
  bool updateShouldNotify(DottyTheme oldWidget) => false;
}

class DottyThemeData extends ThemeExtension<DottyThemeData> {
  final Brightness brightness;

  DottyThemeData({this.brightness = Brightness.dark});

  factory DottyThemeData.dark() => DottyThemeData(brightness: Brightness.dark);
  factory DottyThemeData.light() =>
      DottyThemeData(brightness: Brightness.light);

  @override
  ThemeExtension<DottyThemeData> copyWith({Brightness? brightness}) {
    return DottyThemeData(brightness: brightness ?? this.brightness);
  }

  @override
  ThemeExtension<DottyThemeData> lerp(
    covariant ThemeExtension<DottyThemeData>? other,
    double t,
  ) {
    if (other is! DottyThemeData) return this;
    return DottyThemeData(brightness: t < 0.5 ? brightness : other.brightness);
  }

  ThemeData toThemeData() {
    final isDark = brightness == Brightness.dark;
    final bg = isDark ? const Color(0xFF0a0c0f) : const Color(0xFFF5F7FA);
    final surface = isDark ? const Color(0xFF111418) : const Color(0xFFFFFFFF);
    final card = isDark ? const Color(0xFF161b22) : const Color(0xFFFFFFFF);
    final border = isDark ? const Color(0xFF1e2630) : const Color(0xFFE2E8F0);
    final text = isDark ? const Color(0xFFe8edf2) : const Color(0xFF1A202C);
    // ignore: unused_local_variable
    final muted = isDark ? const Color(0xFF6b7a8d) : const Color(0xFF718096);
    final accent = isDark ? const Color(0xFF00e5a0) : const Color(0xFF00B880);
    final accent2 = isDark ? const Color(0xFFff6b35) : const Color(0xFFE55A2B);
    final accent3 = isDark ? const Color(0xFF4d9fff) : const Color(0xFF3182CE);
    final warn = isDark ? const Color(0xFFf5c518) : const Color(0xFFD69E2E);

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      scaffoldBackgroundColor: bg,
      colorScheme: ColorScheme.dark(
        primary: accent2,
        secondary: accent3,
        tertiary: accent2,
        surface: surface,
        onPrimary: bg,
        onSecondary: bg,
        onSurface: text,
        error: warn,
        onError: bg,
      ),
      textTheme: _buildTextTheme(isDark),
      cardTheme: CardThemeData(
        color: card,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: border),
        ),
      ),
      dividerTheme: DividerThemeData(color: border, thickness: 1),
      appBarTheme: AppBarTheme(
        backgroundColor: bg,
        foregroundColor: text,
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: accent,
          foregroundColor: bg,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: accent,
          side: BorderSide(color: accent),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: accent),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: accent),
        ),
      ),
    );
  }

  TextTheme _buildTextTheme(bool isDark) {
    final text = isDark ? const Color(0xFFe8edf2) : const Color(0xFF1A202C);
    final muted = isDark ? const Color(0xFF6b7a8d) : const Color(0xFF718096);

    return TextTheme(
      displayLarge: TextStyle(
        fontSize: 90,
        fontWeight: FontWeight.w800,
        letterSpacing: -2,
        color: text,
      ),
      displayMedium: TextStyle(
        fontSize: 72,
        fontWeight: FontWeight.w800,
        letterSpacing: -1,
        color: text,
      ),
      displaySmall: TextStyle(
        fontSize: 52,
        fontWeight: FontWeight.w800,
        letterSpacing: -1,
        color: text,
      ),
      headlineLarge: TextStyle(
        fontSize: 44,
        fontWeight: FontWeight.w800,
        color: text,
      ),
      headlineMedium: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w800,
        color: text,
      ),
      headlineSmall: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w800,
        color: text,
      ),
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: text,
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: text,
      ),
      titleSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: text,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: text,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: text,
      ),
      bodySmall: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: muted,
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        letterSpacing: 1,
        color: text,
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.5,
        color: text,
      ),
      labelSmall: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.5,
        color: muted,
      ),
    );
  }
}

extension DottyThemeExtension on BuildContext {
  DottyThemeData get dottyTheme {
    final theme = Theme.of(this);
    return theme.extension<DottyThemeData>() ?? DottyThemeData.dark();
  }

  Brightness get brightness => Theme.of(this).brightness;

  bool get isDark => brightness == Brightness.dark;
}
