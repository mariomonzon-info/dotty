import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dotty_colors.dart';

class DottyTypography {
  DottyTypography._();

  static TextStyle get displayLarge => _displayLargeTextStyle();
  static TextStyle get displayMedium => _displayMediumTextStyle();
  static TextStyle get displaySmall => _displaySmallTextStyle();
  static TextStyle get headlineLarge => _headlineLargeTextStyle();
  static TextStyle get headlineMedium => _headlineMediumTextStyle();
  static TextStyle get headlineSmall => _headlineSmallTextStyle();
  static TextStyle get titleLarge => _titleLargeTextStyle();
  static TextStyle get titleMedium => _titleMediumTextStyle();
  static TextStyle get titleSmall => _titleSmallTextStyle();
  static TextStyle get bodyLarge => _bodyLargeTextStyle();
  static TextStyle get bodyMedium => _bodyMediumTextStyle();
  static TextStyle get bodySmall => _bodySmallTextStyle();
  static TextStyle get labelLarge => _labelLargeTextStyle();
  static TextStyle get labelMedium => _labelMediumTextStyle();
  static TextStyle get labelSmall => _labelSmallTextStyle();

  static TextStyle _displayLargeTextStyle([double scale = 1.0]) =>
      GoogleFonts.barlowCondensed(
        fontSize: 90 * scale,
        fontWeight: FontWeight.w800,
        letterSpacing: -2,
        color: DottyColors.text,
      );

  static TextStyle _displayMediumTextStyle([double scale = 1.0]) =>
      GoogleFonts.barlowCondensed(
        fontSize: 72 * scale,
        fontWeight: FontWeight.w800,
        letterSpacing: -1,
        color: DottyColors.text,
      );

  static TextStyle _displaySmallTextStyle([double scale = 1.0]) =>
      GoogleFonts.barlowCondensed(
        fontSize: 52 * scale,
        fontWeight: FontWeight.w800,
        letterSpacing: -1,
        color: DottyColors.text,
      );

  static TextStyle _headlineLargeTextStyle([double scale = 1.0]) =>
      GoogleFonts.barlowCondensed(
        fontSize: 44 * scale,
        fontWeight: FontWeight.w800,
        color: DottyColors.text,
      );

  static TextStyle _headlineMediumTextStyle([double scale = 1.0]) =>
      GoogleFonts.barlowCondensed(
        fontSize: 36 * scale,
        fontWeight: FontWeight.w800,
        color: DottyColors.text,
      );

  static TextStyle _headlineSmallTextStyle([double scale = 1.0]) =>
      GoogleFonts.barlowCondensed(
        fontSize: 30 * scale,
        fontWeight: FontWeight.w800,
        color: DottyColors.text,
      );

  static TextStyle _titleLargeTextStyle([double scale = 1.0]) =>
      GoogleFonts.barlow(
        fontSize: 22 * scale,
        fontWeight: FontWeight.w600,
        color: DottyColors.text,
      );

  static TextStyle _titleMediumTextStyle([double scale = 1.0]) =>
      GoogleFonts.barlow(
        fontSize: 18 * scale,
        fontWeight: FontWeight.w600,
        color: DottyColors.text,
      );

  static TextStyle _titleSmallTextStyle([double scale = 1.0]) =>
      GoogleFonts.barlow(
        fontSize: 16 * scale,
        fontWeight: FontWeight.w600,
        color: DottyColors.text,
      );

  static TextStyle _bodyLargeTextStyle([double scale = 1.0]) =>
      GoogleFonts.barlow(
        fontSize: 16 * scale,
        fontWeight: FontWeight.w400,
        color: DottyColors.text,
      );

  static TextStyle _bodyMediumTextStyle([double scale = 1.0]) =>
      GoogleFonts.barlow(
        fontSize: 14 * scale,
        fontWeight: FontWeight.w400,
        color: DottyColors.text,
      );

  static TextStyle _bodySmallTextStyle([double scale = 1.0]) =>
      GoogleFonts.barlow(
        fontSize: 13 * scale,
        fontWeight: FontWeight.w400,
        color: DottyColors.muted,
      );

  static TextStyle _labelLargeTextStyle([double scale = 1.0]) =>
      GoogleFonts.barlow(
        fontSize: 14 * scale,
        fontWeight: FontWeight.w600,
        letterSpacing: 1,
        color: DottyColors.text,
      );

  static TextStyle _labelMediumTextStyle([double scale = 1.0]) =>
      GoogleFonts.barlow(
        fontSize: 12 * scale,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.5,
        color: DottyColors.text,
      );

  static TextStyle _labelSmallTextStyle([double scale = 1.0]) =>
      GoogleFonts.barlow(
        fontSize: 11 * scale,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.5,
        color: DottyColors.muted,
      );

  static TextStyle get subtitle => GoogleFonts.barlowCondensed(
    fontSize: 22,
    fontWeight: FontWeight.w300,
    fontStyle: FontStyle.italic,
    color: DottyColors.muted,
  );

  static TextStyle get pill => GoogleFonts.barlowCondensed(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    letterSpacing: 2,
    color: DottyColors.accent,
  );

  static TextStyle get statValue => GoogleFonts.barlowCondensed(
    fontSize: 36,
    fontWeight: FontWeight.w800,
    color: DottyColors.accent,
  );

  static TextStyle get statLabel => GoogleFonts.barlow(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    letterSpacing: 1,
    color: DottyColors.muted,
  );

  static TextStyle get sectionTitle => GoogleFonts.barlowCondensed(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    letterSpacing: 3,
    color: DottyColors.accent,
  );

  static TextStyle get badge => GoogleFonts.barlow(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: DottyColors.text,
  );

  static TextTheme get textTheme => TextTheme(
    displayLarge: displayLarge,
    displayMedium: displayMedium,
    displaySmall: displaySmall,
    headlineLarge: headlineLarge,
    headlineMedium: headlineMedium,
    headlineSmall: headlineSmall,
    titleLarge: titleLarge,
    titleMedium: titleMedium,
    titleSmall: titleSmall,
    bodyLarge: bodyLarge,
    bodyMedium: bodyMedium,
    bodySmall: bodySmall,
    labelLarge: labelLarge,
    labelMedium: labelMedium,
    labelSmall: labelSmall,
  );
}

class DottyTypographyTheme extends ThemeExtension<DottyTypographyTheme> {
  final TextStyle displayLarge;
  final TextStyle displayMedium;
  final TextStyle displaySmall;
  final TextStyle headlineLarge;
  final TextStyle headlineMedium;
  final TextStyle headlineSmall;
  final TextStyle titleLarge;
  final TextStyle titleMedium;
  final TextStyle titleSmall;
  final TextStyle bodyLarge;
  final TextStyle bodyMedium;
  final TextStyle bodySmall;
  final TextStyle labelLarge;
  final TextStyle labelMedium;
  final TextStyle labelSmall;
  final TextStyle subtitle;
  final TextStyle pill;
  final TextStyle statValue;
  final TextStyle statLabel;
  final TextStyle sectionTitle;
  final TextStyle badge;

  const DottyTypographyTheme({
    required this.displayLarge,
    required this.displayMedium,
    required this.displaySmall,
    required this.headlineLarge,
    required this.headlineMedium,
    required this.headlineSmall,
    required this.titleLarge,
    required this.titleMedium,
    required this.titleSmall,
    required this.bodyLarge,
    required this.bodyMedium,
    required this.bodySmall,
    required this.labelLarge,
    required this.labelMedium,
    required this.labelSmall,
    required this.subtitle,
    required this.pill,
    required this.statValue,
    required this.statLabel,
    required this.sectionTitle,
    required this.badge,
  });

  factory DottyTypographyTheme.dark() {
    return DottyTypographyTheme(
      displayLarge: GoogleFonts.barlowCondensed(
        fontSize: 90,
        fontWeight: FontWeight.w800,
        letterSpacing: -2,
        color: const Color(0xFFe8edf2),
      ),
      displayMedium: GoogleFonts.barlowCondensed(
        fontSize: 72,
        fontWeight: FontWeight.w800,
        letterSpacing: -1,
        color: const Color(0xFFe8edf2),
      ),
      displaySmall: GoogleFonts.barlowCondensed(
        fontSize: 52,
        fontWeight: FontWeight.w800,
        letterSpacing: -1,
        color: const Color(0xFFe8edf2),
      ),
      headlineLarge: GoogleFonts.barlowCondensed(
        fontSize: 44,
        fontWeight: FontWeight.w800,
        color: const Color(0xFFe8edf2),
      ),
      headlineMedium: GoogleFonts.barlowCondensed(
        fontSize: 36,
        fontWeight: FontWeight.w800,
        color: const Color(0xFFe8edf2),
      ),
      headlineSmall: GoogleFonts.barlowCondensed(
        fontSize: 30,
        fontWeight: FontWeight.w800,
        color: const Color(0xFFe8edf2),
      ),
      titleLarge: GoogleFonts.barlow(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: const Color(0xFFe8edf2),
      ),
      titleMedium: GoogleFonts.barlow(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: const Color(0xFFe8edf2),
      ),
      titleSmall: GoogleFonts.barlow(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: const Color(0xFFe8edf2),
      ),
      bodyLarge: GoogleFonts.barlow(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: const Color(0xFFe8edf2),
      ),
      bodyMedium: GoogleFonts.barlow(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: const Color(0xFFe8edf2),
      ),
      bodySmall: GoogleFonts.barlow(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: const Color(0xFF6b7a8d),
      ),
      labelLarge: GoogleFonts.barlow(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        letterSpacing: 1,
        color: const Color(0xFFe8edf2),
      ),
      labelMedium: GoogleFonts.barlow(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.5,
        color: const Color(0xFFe8edf2),
      ),
      labelSmall: GoogleFonts.barlow(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.5,
        color: const Color(0xFF6b7a8d),
      ),
      subtitle: GoogleFonts.barlowCondensed(
        fontSize: 22,
        fontWeight: FontWeight.w300,
        fontStyle: FontStyle.italic,
        color: const Color(0xFF6b7a8d),
      ),
      pill: GoogleFonts.barlowCondensed(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        letterSpacing: 2,
        color: const Color(0xFF00e5a0),
      ),
      statValue: GoogleFonts.barlowCondensed(
        fontSize: 36,
        fontWeight: FontWeight.w800,
        color: const Color(0xFF00e5a0),
      ),
      statLabel: GoogleFonts.barlow(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        letterSpacing: 1,
        color: const Color(0xFF6b7a8d),
      ),
      sectionTitle: GoogleFonts.barlowCondensed(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        letterSpacing: 3,
        color: const Color(0xFF00e5a0),
      ),
      badge: GoogleFonts.barlow(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: const Color(0xFFe8edf2),
      ),
    );
  }

  factory DottyTypographyTheme.light() {
    return DottyTypographyTheme(
      displayLarge: GoogleFonts.barlowCondensed(
        fontSize: 90,
        fontWeight: FontWeight.w800,
        letterSpacing: -2,
        color: const Color(0xFF1A202C),
      ),
      displayMedium: GoogleFonts.barlowCondensed(
        fontSize: 72,
        fontWeight: FontWeight.w800,
        letterSpacing: -1,
        color: const Color(0xFF1A202C),
      ),
      displaySmall: GoogleFonts.barlowCondensed(
        fontSize: 52,
        fontWeight: FontWeight.w800,
        letterSpacing: -1,
        color: const Color(0xFF1A202C),
      ),
      headlineLarge: GoogleFonts.barlowCondensed(
        fontSize: 44,
        fontWeight: FontWeight.w800,
        color: const Color(0xFF1A202C),
      ),
      headlineMedium: GoogleFonts.barlowCondensed(
        fontSize: 36,
        fontWeight: FontWeight.w800,
        color: const Color(0xFF1A202C),
      ),
      headlineSmall: GoogleFonts.barlowCondensed(
        fontSize: 30,
        fontWeight: FontWeight.w800,
        color: const Color(0xFF1A202C),
      ),
      titleLarge: GoogleFonts.barlow(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: const Color(0xFF1A202C),
      ),
      titleMedium: GoogleFonts.barlow(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: const Color(0xFF1A202C),
      ),
      titleSmall: GoogleFonts.barlow(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: const Color(0xFF1A202C),
      ),
      bodyLarge: GoogleFonts.barlow(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: const Color(0xFF1A202C),
      ),
      bodyMedium: GoogleFonts.barlow(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: const Color(0xFF1A202C),
      ),
      bodySmall: GoogleFonts.barlow(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: const Color(0xFF718096),
      ),
      labelLarge: GoogleFonts.barlow(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        letterSpacing: 1,
        color: const Color(0xFF1A202C),
      ),
      labelMedium: GoogleFonts.barlow(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.5,
        color: const Color(0xFF1A202C),
      ),
      labelSmall: GoogleFonts.barlow(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.5,
        color: const Color(0xFF718096),
      ),
      subtitle: GoogleFonts.barlowCondensed(
        fontSize: 22,
        fontWeight: FontWeight.w300,
        fontStyle: FontStyle.italic,
        color: const Color(0xFF718096),
      ),
      pill: GoogleFonts.barlowCondensed(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        letterSpacing: 2,
        color: const Color(0xFF00B880),
      ),
      statValue: GoogleFonts.barlowCondensed(
        fontSize: 36,
        fontWeight: FontWeight.w800,
        color: const Color(0xFF00B880),
      ),
      statLabel: GoogleFonts.barlow(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        letterSpacing: 1,
        color: const Color(0xFF718096),
      ),
      sectionTitle: GoogleFonts.barlowCondensed(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        letterSpacing: 3,
        color: const Color(0xFF00B880),
      ),
      badge: GoogleFonts.barlow(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: const Color(0xFF1A202C),
      ),
    );
  }

  @override
  ThemeExtension<DottyTypographyTheme> copyWith({
    TextStyle? displayLarge,
    TextStyle? displayMedium,
    TextStyle? displaySmall,
    TextStyle? headlineLarge,
    TextStyle? headlineMedium,
    TextStyle? headlineSmall,
    TextStyle? titleLarge,
    TextStyle? titleMedium,
    TextStyle? titleSmall,
    TextStyle? bodyLarge,
    TextStyle? bodyMedium,
    TextStyle? bodySmall,
    TextStyle? labelLarge,
    TextStyle? labelMedium,
    TextStyle? labelSmall,
    TextStyle? subtitle,
    TextStyle? pill,
    TextStyle? statValue,
    TextStyle? statLabel,
    TextStyle? sectionTitle,
    TextStyle? badge,
  }) {
    return DottyTypographyTheme(
      displayLarge: displayLarge ?? this.displayLarge,
      displayMedium: displayMedium ?? this.displayMedium,
      displaySmall: displaySmall ?? this.displaySmall,
      headlineLarge: headlineLarge ?? this.headlineLarge,
      headlineMedium: headlineMedium ?? this.headlineMedium,
      headlineSmall: headlineSmall ?? this.headlineSmall,
      titleLarge: titleLarge ?? this.titleLarge,
      titleMedium: titleMedium ?? this.titleMedium,
      titleSmall: titleSmall ?? this.titleSmall,
      bodyLarge: bodyLarge ?? this.bodyLarge,
      bodyMedium: bodyMedium ?? this.bodyMedium,
      bodySmall: bodySmall ?? this.bodySmall,
      labelLarge: labelLarge ?? this.labelLarge,
      labelMedium: labelMedium ?? this.labelMedium,
      labelSmall: labelSmall ?? this.labelSmall,
      subtitle: subtitle ?? this.subtitle,
      pill: pill ?? this.pill,
      statValue: statValue ?? this.statValue,
      statLabel: statLabel ?? this.statLabel,
      sectionTitle: sectionTitle ?? this.sectionTitle,
      badge: badge ?? this.badge,
    );
  }

  @override
  ThemeExtension<DottyTypographyTheme> lerp(
    covariant ThemeExtension<DottyTypographyTheme>? other,
    double t,
  ) {
    if (other is! DottyTypographyTheme) return this;
    return DottyTypographyTheme(
      displayLarge: TextStyle.lerp(displayLarge, other.displayLarge, t)!,
      displayMedium: TextStyle.lerp(displayMedium, other.displayMedium, t)!,
      displaySmall: TextStyle.lerp(displaySmall, other.displaySmall, t)!,
      headlineLarge: TextStyle.lerp(headlineLarge, other.headlineLarge, t)!,
      headlineMedium: TextStyle.lerp(headlineMedium, other.headlineMedium, t)!,
      headlineSmall: TextStyle.lerp(headlineSmall, other.headlineSmall, t)!,
      titleLarge: TextStyle.lerp(titleLarge, other.titleLarge, t)!,
      titleMedium: TextStyle.lerp(titleMedium, other.titleMedium, t)!,
      titleSmall: TextStyle.lerp(titleSmall, other.titleSmall, t)!,
      bodyLarge: TextStyle.lerp(bodyLarge, other.bodyLarge, t)!,
      bodyMedium: TextStyle.lerp(bodyMedium, other.bodyMedium, t)!,
      bodySmall: TextStyle.lerp(bodySmall, other.bodySmall, t)!,
      labelLarge: TextStyle.lerp(labelLarge, other.labelLarge, t)!,
      labelMedium: TextStyle.lerp(labelMedium, other.labelMedium, t)!,
      labelSmall: TextStyle.lerp(labelSmall, other.labelSmall, t)!,
      subtitle: TextStyle.lerp(subtitle, other.subtitle, t)!,
      pill: TextStyle.lerp(pill, other.pill, t)!,
      statValue: TextStyle.lerp(statValue, other.statValue, t)!,
      statLabel: TextStyle.lerp(statLabel, other.statLabel, t)!,
      sectionTitle: TextStyle.lerp(sectionTitle, other.sectionTitle, t)!,
      badge: TextStyle.lerp(badge, other.badge, t)!,
    );
  }
}
