# AGENTS.md - Dotty Development Guide

## Project Overview

This is a Flutter/Dart design system package (`dotty`) for creating modern dark-themed UIs.
Uses Google Fonts (Barlow, Barlow Condensed) for typography.
**Mobile-first** design system that adapts to tablet and desktop.

## Build, Lint, and Test Commands

### Running Tests
```bash
# Run all tests
flutter test

# Run a single test file
flutter test test/dotty_test.dart

# Run a specific test by name
flutter test --name "adds one to input values"
```

### Code Analysis
```bash
# Run static analysis (linting)
flutter analyze

# Fix auto-fixable issues
flutter analyze --fix
```

### Dependencies
```bash
# Install dependencies
flutter pub get

# Update dependencies
flutter pub upgrade
```

### Building
```bash
# Build for Android
flutter build apk

# Build for iOS
flutter build ios

# Build for web
flutter build web
```

## Code Style Guidelines

### General Rules
- Follow the [Dart Style Guide](https://dart.dev/guides/language/effective-dart) and [Effective Dart](https://dart.dev/effective-dart)
- This project uses `flutter_lints` (see `analysis_options.yaml`)

### Formatting
- Use 2 spaces for indentation
- Use trailing commas for better formatting
- Run `dart format .` to auto-format code

### Imports
- Use package imports: `import 'package:dotty/dotty.dart';`
- Place third-party imports before relative imports
- Sort imports alphabetically within groups

### Naming Conventions
- **Classes/Enums/Types**: `UpperCamelCase` (e.g., `DottyCard`)
- **Methods/Variables**: `lowerCamelCase` (e.g., `onTap`, `child`)
- **Constants**: `lowerCamelCase` with `k` prefix for compile-time constants
- **Files**: `snake_case` (e.g., `dotty_card.dart`)

### Types
- Use strong typing - avoid `var` unless type is obvious
- Prefer `final` over `var` when value doesn't change
- Use `late` sparingly and only when initialization is guaranteed before use

### Null Safety
- Avoid `!` operator; use `?` and provide fallbacks
- Prefer `??` and `?.` operators over explicit null checks

### Error Handling
- Use `try-catch` for recoverable errors
- Prefer specific exception types over generic `Exception`
- Never swallow errors silently - always log or rethrow with context

### Documentation
- Use `///` for public API documentation
- Document parameters using `[paramName]` notation
- Include examples in doc comments for complex functions

## Mobile-First Design System

### Responsive Breakpoints
Dotty uses a mobile-first breakpoint system:

| Breakpoint | Width | Device |
|------------|-------|---------|
| `xs` | < 576px | Small mobile |
| `sm` | 576-767px | Large mobile |
| `md` | 768-991px | Tablet |
| `lg` | 992-1199px | Desktop |
| `xl` | 1200-1399px | Large desktop |
| `xxl` | ≥ 1400px | Extra large |

### Responsive Components
```dart
// Grid with responsive columns
DottyGridFixed(
  mobileColumns: 1,
  tabletColumns: 2,
  desktopColumns: 4,
  children: [...],
)

// Conditional layout
DottyResponsive(
  mobile: Text('Mobile'),
  tablet: Text('Tablet'),
  desktop: Text('Desktop'),
)

// Visibility control
DottyVisibility(
  mobile: true,
  desktop: false,
  child: Text('Only on mobile'),
)
```

### Typography Scalable
All typography can scale based on screen size using `DottyTypography` helpers.

## Design System Components

### Theme
- `DottyColors` - Color tokens (background, surface, accent, etc.)
- `DottyTypography` - Text styles (display, headline, title, body, label)
- `DottyThemeData` - Complete ThemeData with dark mode
- `DottyBreakpoint` - Responsive breakpoint system
- `DottyResponsive` - Conditional layout widget

### Atoms
| Component | Description |
|-----------|-------------|
| `DottyButton` | Button with variants (primary, secondary, ghost, danger), sizes, loading |
| `DottyIconButton` | Icon-only button |
| `DottyBadge` | Rounded label badge |
| `DottyText` | Text helper with variants |
| `DottyIcon` | Icon wrapper |
| `DottyDivider` | Divider line |
| `DottyChip` | Interactive chip |
| `DottyLoader` | Loading spinner |
| `DottyProgressBar` | Progress indicator |

### Molecules
| Component | Description |
|-----------|-------------|
| `DottyCard` | Card with variants, accent colors, hover effects |
| `DottyCardClickable` | Clickable card with press animation |
| `DottyPill` | Pill label |
| `DottyStat` | Stat display |
| `DottyTipBox` | Tip box |
| `DottyFCBadge` | Heart rate badge |
| `DottyNoteWarn` | Warning note |
| `DottyAccordion` | Expandable accordion |

### Organisms
| Component | Description |
|-----------|-------------|
| `DottyHero` | Hero section |
| `DottySection` | Section with title |
| `DottyGrid` | Responsive grid |
| `DottyGridFixed` | Fixed columns grid |
| `DottyWeekGrid` | 7-day weekly grid |
| `DottyDayCard` | Day card (fuerza/cardio/core/rest) |
| `DottyPrincipleCard` | Principle card |
| `DottyCardioCard` | Cardio session card |
| `DottyFooter` | Footer |
| `DottySessionBlock` | Exercise session block |

### Forms
| Component | Description |
|-----------|-------------|
| `DottyInput` | Text field |
| `DottyCheckbox` | Checkbox |
| `DottySwitch` | Toggle switch |
| `DottySelect` | Dropdown |
| `DottyAvatar` | User avatar |
| `DottyListTile` | List item |
| `DottyNav` | Navigation bar |
| `DottyBreadcrumb` | Breadcrumbs |

### Complex
| Component | Description |
|-----------|-------------|
| `DottyModal` | Modal dialog |
| `DottyBottomSheet` | Bottom sheet |
| `DottyToast` | Toast notifications |
| `DottySkeleton` | Skeleton loading |
| `DottyListSection` | List section |

## Color Palette

```dart
// Background
DottyColors.background  // #0a0c0f - Main background
DottyColors.surface     // #111418 - Surface color
DottyColors.card        // #161b22 - Card background
DottyColors.border     // #1e2630 - Border color

// Accents
DottyColors.accent      // #00e5a0 - Green accent
DottyColors.accent2    // #ff6b35 - Orange accent
DottyColors.accent3    // #4d9fff - Blue accent

// Text
DottyColors.text        // #e8edf2 - Main text
DottyColors.muted      // #6b7a8d - Muted text
DottyColors.warn       // #f5c518 - Warning color

// Subtle variants
DottyColors.accentSubtle   // 10% opacity
DottyColors.accent2Subtle
DottyColors.accent3Subtle
```

## Usage Example

```dart
import 'package:dotty/dotty.dart';

void main() {
  runApp(
    MaterialApp(
      theme: DottyThemeData.dark().toThemeData(),
      home: Scaffold(
        body: DottyHero(
          pillLabel: 'Plan Híbrido',
          pillIcon: '🗺️',
          title: 'FASE ',
          titleAccent: '01',
          subtitle: 'Base & Reactivación Inteligente',
          stats: const [
            DottyStatData(value: '4', label: 'Semanas'),
            DottyStatData(value: '5', label: 'Sesiones / sem'),
          ],
          backgroundText: 'F1',
        ),
      ),
    ),
  );
}
```

## File Structure

```
lib/
  dotty.dart                    # Main export
  src/
    theme/
      dotty_colors.dart        # Color tokens
      dotty_typography.dart    # Typography styles
      dotty_theme.dart         # ThemeData
      dotty_responsive.dart    # Responsive utilities
    components/
      accordion/
      avatar/
      badge/
      breadcrumb/
      button/
      card/
      cardio_card/
      checkbox/
      chip/
      day_card/
      divider/
      exercise_row/
      fc_badge/
      footer/
      grid/
      hero/
      icon/
      input/
      list_tile/
      loader/
      modal/
      nav/
      note_warn/
      pill/
      progress_bar/
      section/
      select/
      session_block/
      skeleton/
      stat/
      step_card/
      switch/
      table/
      text/
      tip_box/
      toast/
      week_grid/
      principle_card/
example/
  lib/main.dart               # Example app
  pubspec.yaml                # Example dependencies
test/
  dotty_test.dart              # Tests
```

## Testing
- Test files go in `test/` directory
- Name test files: `[feature]_test.dart`
- Use descriptive test names: `test('description', () { ... })`
- Group related tests with `group('group name', () { ... })`
- Initialize bindings: `TestWidgetsFlutterBinding.ensureInitialized();`

## Common Patterns

### Creating a New Component
```dart
import 'package:flutter/material.dart';
import '../../theme/dotty_colors.dart';
import '../../theme/dotty_typography.dart';

class DottyNewComponent extends StatelessWidget {
  const DottyNewComponent({
    super.key,
    required this.child,
    this.onTap,
  });

  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: DottyColors.card,
        border: Border.all(color: DottyColors.border),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: child,
        ),
      ),
    );
  }
}
```
