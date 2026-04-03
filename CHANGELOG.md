# Changelog

All notable changes to this project will be documented in this file.

## [1.2.14] - 2026-04-03

### Added
- **ThemeExtension support** - Full ThemeExtension implementation with lerp/copyWith for theme transitions
- **Light theme** - Complete light color palette alongside dark theme
- **Context extensions** - `context.dottyTheme`, `context.isDark`, `context.brightness` for easy theme access
- **MaterialColor palettes** - Accent colors now have MaterialColor with 50-900 shades (accentPalette, accent2Palette, accent3Palette)
- **DottyTypographyTheme** - Typography ThemeExtension for theme-aware text styles
- **DottyResponsive** - Responsive widget for mobile/tablet/desktop layouts
- **DottyVisibility** - Conditional visibility widget per breakpoint
- **DottyBreakpoint** - Breakpoint system (xs, sm, md, lg, xl, xxl) with helpers (isMobile, isTablet, isDesktop)

### Changed
- **DottyColors** - Restructured to support dark/light theme switching while maintaining backward compatibility
- **DottyThemeData** - Now extends ThemeExtension with proper implementation
- **DottyTypography** - Added DottyTypographyTheme for theme-aware typography

### Components Added (40+ total)
- Atoms: DottyButton, DottyIconButton, DottyBadge, DottyText, DottyIcon, DottyDivider, DottyChip, DottyLoader, DottyProgressBar
- Molecules: DottyCard, DottyCardClickable, DottyPill, DottyStat, DottyTipBox, DottyFCBadge, DottyNoteWarn, DottyAccordion
- Organisms: DottyHero, DottySection, DottyGrid, DottyGridFixed, DottyWeekGrid, DottyDayCard, DottyPrincipleCard, DottyCardioCard, DottyFooter, DottySessionBlock
- Forms: DottyInput, DottyCheckbox, DottySwitch, DottySelect, DottyAvatar, DottyListTile, DottyNav, DottyBreadcrumb
- Complex: DottyModal, DottyBottomSheet, DottyToast, DottySkeleton, DottyListSection

### Dependencies
- google_fonts: ^6.0.0

---

## [0.0.1] - Initial Release

- TODO: Describe initial release.