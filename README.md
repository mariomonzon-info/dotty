<!-- Dotty - Flutter Design System -->

[![Pub](https://img.shields.io/pub/v/dotty?color=00e5a0&style=flat-square)](https://pub.dev/packages/dotty)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=flat-square)](https://opensource.org/licenses/MIT)

# Dotty

A modern Flutter design system built with Barlow typography for creating consistent, beautiful UIs.

## Features

- **40+ reusable components** - Cards, buttons, badges, inputs, and more
- **Dark/Light themes** - Full theme support with ThemeExtension
- **Barlow typography** - Clean, readable text styles using Google Fonts
- **Mobile-first** - Designed for mobile, adapts to tablet and desktop
- **Responsive breakpoints** - DottyBreakpoint system (xs, sm, md, lg, xl, xxl)
- **ThemeExtension** - Proper theme interpolation and context access
- **MaterialColor palettes** - Accent colors with 50-900 shades

## Getting Started

Add `dotty` and `google_fonts` to your `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  dotty: ^1.0.0
  google_fonts: ^6.0.0
```

## Usage

### Basic Setup

```dart
import 'package:dotty/dotty.dart';

void main() {
  runApp(
    MaterialApp(
      theme: DottyThemeData.dark().toThemeData(),
      home: const MyHomePage(),
    ),
  );
}
```

### Light Theme

```dart
// Use light theme
MaterialApp(
  theme: DottyThemeData.light().toThemeData(),
  home: const MyHomePage(),
)

// Or with theme switching
MaterialApp(
  theme: DottyThemeData.dark().toThemeData(),
  darkTheme: DottyThemeData.dark().toThemeData(),
  themeMode: ThemeMode.dark, // or .light, .system
  home: const MyHomePage(),
)
```

### Context Extensions

```dart
// Access theme from BuildContext
DottyThemeData theme = context.dottyTheme;
bool isDark = context.isDark;
Brightness brightness = context.brightness;

// Access colors (uses current theme)
Color accent = DottyColors.accent;
Color accentShade500 = DottyColors.accentPalette.shade500;

// Use DottyTypography static getters
TextStyle title = DottyTypography.titleLarge;
TextStyle subtitle = DottyTypography.subtitle;
```

### Components Example

```dart
import 'package:dotty/dotty.dart';

void main() {
  runApp(
    MaterialApp(
      theme: DottyThemeData.dark().toThemeData(),
      home: const MyHomePage(),
    ),
  );
}
```

### More Examples

#### Buttons
```dart
// Primary button
DottyButton(
  onPressed: () {},
  child: Text('Primary'),
)

// Secondary with icon
DottyButton(
  onPressed: () {},
  variant: DottyButtonVariant.secondary,
  icon: const Icon(Icons.add),
  child: Text('Add Item'),
)

// Loading state
DottyButton(
  onPressed: () {},
  loading: true,
  child: Text('Saving...'),
)

// Full width
DottyButton(
  onPressed: () {},
  fullWidth: true,
  child: Text('Submit'),
)
```

#### Cards
```dart
// Card with green accent border
DottyCard(
  accent: DottyCardAccent.green,
  onTap: () => print('Tapped!'),
  child: DottyText.title('Training Plan'),
)

// Elevated card with hover effect
DottyCard(
  variant: DottyCardVariant.elevated,
  onHover: (isHovered) => print('Hover: $isHovered'),
  child: DottyText.body('Hover me!'),
)

// Clickable card with animation
DottyCardClickable(
  onTap: () => print('Pressed!'),
  child: Column(
    children: [
      Icon(Icons.fitness_center),
      DottyText.title('Workout'),
    ],
  ),
)
```

#### Forms
```dart
// Text input
DottyInput(
  labelText: 'Email',
  hintText: 'Enter your email',
  prefixIcon: Icons.email,
  keyboardType: TextInputType.emailAddress,
)

// Password input
DottyInput(
  labelText: 'Password',
  hintText: 'Enter password',
  obscureText: true,
  prefixIcon: Icons.lock,
)

// Select dropdown
DottySelect(
  value: selectedValue,
  labelText: 'Plan Type',
  hint: 'Select a plan',
  items: const [
    DottySelectItem(value: 'basic', label: 'Basic'),
    DottySelectItem(value: 'pro', label: 'Pro', icon: '⭐'),
    DottySelectItem(value: 'premium', label: 'Premium', icon: '👑'),
  ],
  onChanged: (value) => setState(() => selectedValue = value),
)

// Switch
DottySwitchListTile(
  value: isEnabled,
  onChanged: (value) => setState(() => isEnabled = value),
  title: 'Enable notifications',
  subtitle: 'Get updates about your progress',
)

// Checkbox
DottyCheckboxListTile(
  value: acceptTerms,
  onChanged: (value) => setState(() => acceptTerms = value!),
  title: 'Accept terms and conditions',
)
```

#### Layout & Grid
```dart
// Responsive grid with different columns per device
DottyGridFixed(
  mobileColumns: 1,
  tabletColumns: 2,
  desktopColumns: 4,
  children: [
    DottyCard(child: DottyText.title('Item 1')),
    DottyCard(child: DottyText.title('Item 2')),
    DottyCard(child: DottyText.title('Item 3')),
    DottyCard(child: DottyText.title('Item 4')),
  ],
)

// Flex with wrapping (mobile-first)
DottyFlex(
  spacing: 12,
  wrap: true,
  children: [
    DottyChip(label: 'Tag 1'),
    DottyChip(label: 'Tag 2'),
    DottyChip(label: 'Tag 3'),
  ],
)

// Week grid for training schedule
DottyWeekGrid(
  children: [
    DottyDayCard(
      dayName: 'LUN',
      type: DottyDayType.fuerza,
      dayType: 'Upper Body',
      focus: 'Pecho + Espalda',
      place: '🏋️ Gimnasio',
    ),
    DottyDayCard(
      dayName: 'MAR',
      type: DottyDayType.cardio,
      dayType: 'Zone 2',
      focus: 'Correr suave',
      place: '🌿 Parque',
    ),
    // ... more days
  ],
)
```

#### Hero & Sections
```dart
// Hero section
DottyHero(
  pillLabel: 'Plan Híbrido',
  pillIcon: '🗺️',
  title: 'FASE ',
  titleAccent: '01',
  subtitle: 'Base & Reactivación Inteligente',
  stats: const [
    DottyStatData(value: '4', label: 'Semanas'),
    DottyStatData(value: '5', label: 'Sesiones / sem'),
    DottyStatData(value: 'Z2', label: 'Cardio'),
  ],
  backgroundText: 'F1',
)

// Section with divider
DottySection(
  title: 'Guía de Entrenamiento',
  icon: '🧠',
  child: DottyText.body('Contenido de la sección...'),
)
```

#### Feedback
```dart
// Toast notification
DottyToastOverlay.show(
  context,
  message: 'Training saved!',
  type: DottyToastType.success,
  icon: '✅',
)

// Loading indicator
DottyLoader(size: 40)

// Dots loader for inline loading
DottyDotsLoader()

// Skeleton for loading states
DottySkeleton(width: 200, height: 20)

// Progress bar
DottyProgressBar(value: 0.75)

// Modal dialog
DottyModal.show(
  context: context,
  title: 'Confirm Training',
  child: DottyText.body('¿Guardar este entrenamiento?'),
  actions: [
    DottyButton(
      variant: DottyButtonVariant.ghost,
      onPressed: () => Navigator.pop(context),
      child: Text('Cancel'),
    ),
    DottyButton(
      onPressed: () {
        Navigator.pop(context);
        // save training
      },
      child: Text('Save'),
    ),
  ],
)
```

#### Responsive Utilities
```dart
// Show different content per device
DottyResponsive(
  mobile: DottyText.headline('Mobile View'),
  tablet: DottyText.headline('Tablet View'),
  desktop: DottyText.headline('Desktop View'),
)

// Hide content per device
DottyVisibility(
  mobile: true,
  desktop: false,
  child: DottyPill(label: 'Mobile Only'),
)

// Use breakpoints directly
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final breakpoint = DottyBreakpoint.of(context);
    
    if (breakpoint.isMobile) {
      return _buildMobileLayout();
    } else if (breakpoint.isTablet) {
      return _buildTabletLayout();
    }
    return _buildDesktopLayout();
  }
}
```

#### Cards Collection
```dart
// Principle cards grid
DottyGridFixed(
  mobileColumns: 1,
  tabletColumns: 2,
  childAspectRatio: 1.3,
  children: [
    DottyPrincipleCard(
      icon: '🦵',
      title: 'Rodilla derecha',
      description: 'Sin flexión profunda. Bajo impacto en todo momento.',
    ),
    DottyPrincipleCard(
      icon: '🫀',
      title: 'Cardiovascular',
      description: 'El ejercicio aeróbico es medicina. Prioridad Zone 2.',
    ),
    DottyPrincipleCard(
      icon: '☀️',
      title: 'Vitamina D',
      description: 'Sesiones al aire libre siempre que sea posible.',
    ),
  ],
)

// Cardio session card
DottyCardioCard(
  weekLabel: 'Semanas 1-2',
  totalTime: '⏱ 35-40 min',
  steps: const [
    DottyCardioStep(icon: '🚶', label: 'Caminar 5 min', sublabel: 'Calentamiento'),
    DottyCardioStep(icon: '🏃', label: 'Correr 5 min', sublabel: 'Bloque principal'),
    DottyCardioStep(icon: '🔁', label: 'Repetir 3x', sublabel: 'Intervalos'),
    DottyCardioStep(icon: '❄️', label: 'Caminar 5 min', sublabel: 'Enfriamiento'),
  ],
)
```

#### Session Block (Exercise Table)
```dart
DottySessionBlock(
  title: 'Lunes — Upper Body',
  subtitle: 'Gimnasio · 45-60 min',
  type: DottySessionType.upper,
  icon: '🔥',
  rows: [
    TableRow(
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Text('Press banca'),
        ),
        Padding(
          padding: EdgeInsets.all(16),
          child: DottyBadge(label: '3', color: DottyBadgeColor.green),
        ),
        Padding(
          padding: EdgeInsets.all(16),
          child: Text('10-12'),
        ),
        Padding(
          padding: EdgeInsets.all(16),
          child: Text('90s'),
        ),
      ],
    ),
    // more rows...
  ],
)
```

## Color Palette (Dark Theme)

| Token | Hex | Usage |
|-------|-----|-------|
| `background` | `#0a0c0f` | Main background |
| `surface` | `#111418` | Surface color |
| `card` | `#161b22` | Card background |
| `border` | `#1e2630` | Border color |
| `accent` | `#00e5a0` | Primary accent (green) |
| `accent2` | `#ff6b35` | Secondary accent (orange) |
| `accent3` | `#4d9fff` | Tertiary accent (blue) |
| `text` | `#e8edf2` | Main text |
| `muted` | `#6b7a8d` | Muted text |
| `warn` | `#f5c518` | Warning color |

### Light Theme Colors

| Token | Hex | Usage |
|-------|-----|-------|
| `background` | `#F5F7FA` | Main background |
| `surface` | `#FFFFFF` | Surface color |
| `card` | `#FFFFFF` | Card background |
| `border` | `#E2E8F0` | Border color |
| `accent` | `#00B880` | Primary accent (green) |
| `accent2` | `#E55A2B` | Secondary accent (orange) |
| `accent3` | `#3182CE` | Tertiary accent (blue) |
| `text` | `#1A202C` | Main text |
| `muted` | `#718096` | Muted text |
| `warn` | `#D69E2E` | Warning color |

### MaterialColor Palettes

Access color shades (50-900) for each accent:

```dart
// Get specific shade
Color greenShade500 = DottyColors.accentPalette.shade500; // #00e5a0 (dark)
Color blueShade200 = DottyColors.accent3Palette.shade200; // #80B8FF

// Palettes available:
// - DottyColors.accentPalette (green)
// - DottyColors.accent2Palette (orange)  
// - DottyColors.accent3Palette (blue)
```

## Responsive (Mobile-First)

Dotty usa un sistema de breakpoints orientado a mobile-first:

| Breakpoint | Width | Dispositivo |
|-----------|-------|-------------|
| `xs` | < 576px | Mobile pequeño |
| `sm` | 576-767px | Mobile grande |
| `md` | 768-991px | Tablet |
| `lg` | 992-1199px | Desktop |
| `xl` | 1200-1399px | Desktop grande |
| `xxl` | ≥ 1400px | Pantalla grande |

### Componentes Responsivos

```dart
// Grid que se adapta automáticamente
DottyGridFixed(
  mobileColumns: 1,
  tabletColumns: 2,
  desktopColumns: 4,
  children: [...],
)

// Layout condicional según tamaño
DottyResponsive(
  mobile: Text('Mobile'),
  tablet: Text('Tablet'),
  desktop: Text('Desktop'),
)

// Visibilidad condicional
DottyVisibility(
  mobile: true,
  desktop: false,
  child: Text('Solo mobile'),
)
```

## Components List

### Theme
| Component | Description |
|-----------|-------------|
| `DottyColors` | Color tokens |
| `DottyTypography` | Text styles |
| `DottyThemeData` | Flutter ThemeData |

### Atoms
| Component | Description |
|-----------|-------------|
| `DottyButton` | Button with variants (primary, secondary, ghost, danger), sizes, loading state |
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
| `DottyCardWithImage` | Card with image header |
| `DottyCardWithFooter` | Card with footer section |
| `DottyCardClickable` | Clickable card with press animation |
| `DottyPill` | Pill label |
| `DottyStat` | Stat display |
| `DottyTipBox` | Tip box with icon |
| `DottyFCBadge` | Heart rate badge |
| `DottyNoteWarn` | Warning note |
| `DottyAccordion` | Expandable accordion |

### Forms
| Component | Description |
|-----------|-------------|
| `DottyInput` | Text field with validation |
| `DottyCheckbox` | Custom checkbox |
| `DottyCheckboxListTile` | Checkbox with label |
| `DottySwitch` | Toggle switch |
| `DottySwitchListTile` | Switch with label |
| `DottySelect` | Dropdown selector |
| `DottyAvatar` | User avatar |
| `DottyAvatarGroup` | Group of avatars |
| `DottyListTile` | List item |
| `DottyListSection` | List section container |
| `DottyNav` | Navigation bar |

### Organisms
| Component | Description |
|-----------|-------------|
| `DottyHero` | Hero section with stats |
| `DottySection` | Section with title and divider |
| `DottyGrid` | Responsive grid |
| `DottyGridFixed` | Fixed columns grid |
| `DottyWeekGrid` | 7-day weekly grid |
| `DottyStat` | Stat display |
| `DottyPill` | Pill label |
| `DottyTipBox` | Tip box with icon |
| `DottyFCBadge` | Heart rate badge |
| `DottyNoteWarn` | Warning note |
| `DottyBreadcrumb` | Breadcrumbs |
| `DottyToast` | Toast notifications |
| `DottyModal` | Modal dialog |
| `DottyBottomSheet` | Bottom sheet |
| `DottyListTile` | List item |
| `DottyListSection` | List section |
| `DottyAccordion` | Expandable accordion |
| `DottySkeleton` | Skeleton loading |
| `DottyTable` | Styled table |
| `DottySessionBlock` | Exercise session block |
| `DottyDayCard` | Day card (fuerza/cardio/core/rest) |
| `DottyExerciseRow` | Exercise table row |
| `DottyCardioCard` | Cardio session card |
| `DottyStepCard` | Step card |
| `DottyPrincipleCard` | Principle card |
| `DottyFooter` | Page footer |

## License

MIT License - see [LICENSE](LICENSE) for details.

## Example App

Check the `example/` folder for a complete demo application showcasing all components.

## Contributing

Contributions are welcome! Please follow these guidelines:

### Pull Requests
1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Run tests: `flutter test`
4. Run analysis: `flutter analyze`
5. Commit your changes following conventional commits
6. Push to your branch and open a Pull Request

### Code Style
- Follow [Dart Style Guide](https://dart.dev/guides/language/effective-dart)
- Use 2 spaces for indentation
- Use trailing commas for better formatting
- Run `dart format .` before committing

### Testing
- Add tests for new components
- Ensure all existing tests pass
- Run `flutter test` before submitting PR

### Adding Components
1. Create component in `lib/src/components/[name]/`
2. Export from `lib/dotty.dart`
3. Add example to `example/lib/main.dart`
4. Update README component list

---

Made with ❤️ for Flutter developers
