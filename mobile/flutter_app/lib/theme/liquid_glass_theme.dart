import 'package:flutter/material.dart';

import 'package:flutter_app/theme/liquid_glass_tokens.dart';

class GlassTheme {
  const GlassTheme._();

  static ThemeData light() {
    const seed = GlassColors.dayAccent;
    final scheme = ColorScheme.fromSeed(
      seedColor: seed,
      secondary: GlassColors.dawnAccent,
    );

    final base = ThemeData(
      colorScheme: scheme,
      useMaterial3: true,
      scaffoldBackgroundColor: GlassColors.dawnStart,
      splashFactory: InkSparkle.splashFactory,
    );

    return base.copyWith(
      textTheme: base.textTheme.apply(
        bodyColor: GlassColors.foregroundOnLight,
        displayColor: GlassColors.foregroundOnLight,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: _buttonStyle(scheme, foreground: GlassColors.foregroundOnLight),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: _buttonStyle(scheme, foreground: GlassColors.foregroundOnLight),
      ),
      textButtonTheme: TextButtonThemeData(
        style: _buttonStyle(
          scheme,
          backgroundOpacity: 0.08,
          foreground: GlassColors.dayAccent,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: _buttonStyle(
          scheme,
          outlined: true,
          foreground: GlassColors.dayAccent,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        foregroundColor: GlassColors.foregroundOnLight,
        elevation: 0,
        centerTitle: false,
        surfaceTintColor: Colors.transparent,
      ),
      cardTheme: CardThemeData(
        color: GlassColors.overlayLight,
        elevation: GlassElevation.base,
        margin: const EdgeInsets.all(12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: GlassColors.overlayLight,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      ),
      chipTheme: base.chipTheme.copyWith(
        backgroundColor: GlassColors.overlayCool,
        labelStyle: base.textTheme.labelLarge?.copyWith(
          color: GlassColors.foregroundOnLight,
        ),
      ),
      dividerColor: GlassColors.overlayCool.withAlpha(102),
      extensions: <ThemeExtension<dynamic>>[
        const GlassEnvironment(reduceTransparency: false),
      ],
    );
  }

  static ThemeData dark() {
    const seed = GlassColors.duskAccent;
    final scheme = ColorScheme.fromSeed(
      seedColor: seed,
      brightness: Brightness.dark,
      secondary: GlassColors.dayAccent,
    );

    final base = ThemeData(
      colorScheme: scheme,
      useMaterial3: true,
      scaffoldBackgroundColor: GlassColors.duskStart,
      splashFactory: InkSparkle.splashFactory,
    );

    return base.copyWith(
      textTheme: base.textTheme.apply(
        bodyColor: GlassColors.foregroundOnDark,
        displayColor: GlassColors.foregroundOnDark,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: _buttonStyle(scheme, foreground: GlassColors.foregroundOnDark),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: _buttonStyle(scheme, foreground: GlassColors.foregroundOnDark),
      ),
      textButtonTheme: TextButtonThemeData(
        style: _buttonStyle(
          scheme,
          backgroundOpacity: 0.16,
          foreground: GlassColors.duskAccent,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: _buttonStyle(
          scheme,
          outlined: true,
          foreground: GlassColors.duskAccent,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        foregroundColor: GlassColors.foregroundOnDark,
        elevation: 0,
        centerTitle: false,
        surfaceTintColor: Colors.transparent,
      ),
      cardTheme: CardThemeData(
        color: GlassColors.overlayDark,
        elevation: GlassElevation.base,
        margin: const EdgeInsets.all(12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: GlassColors.overlayDark,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      ),
      chipTheme: base.chipTheme.copyWith(
        backgroundColor: GlassColors.overlayDark,
        labelStyle: base.textTheme.labelLarge?.copyWith(
          color: GlassColors.foregroundOnDark,
        ),
      ),
      dividerColor: GlassColors.overlayDark.withAlpha(82),
      extensions: <ThemeExtension<dynamic>>[
        const GlassEnvironment(reduceTransparency: false),
      ],
    );
  }

  static ThemeData themeFor(Brightness brightness) {
    return brightness == Brightness.dark ? dark() : light();
  }

  static ButtonStyle _buttonStyle(
    ColorScheme scheme, {
    required Color foreground,
    double backgroundOpacity = 0.18,
    bool outlined = false,
  }) {
    final baseColor = scheme.primary;
    return ButtonStyle(
      foregroundColor: MaterialStateProperty.resolveWith(
        (states) => states.contains(MaterialState.disabled)
            ? foreground.withOpacity(0.38)
            : foreground,
      ),
      backgroundColor: MaterialStateProperty.resolveWith((states) {
        if (outlined) {
          return Colors.transparent;
        }
        if (states.contains(MaterialState.disabled)) {
          return baseColor.withOpacity(0.12);
        }
        return baseColor.withOpacity(backgroundOpacity);
      }),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      ),
      elevation: MaterialStateProperty.resolveWith(
        (states) => outlined ? 0.0 : GlassElevation.base,
      ),
      side: outlined
          ? MaterialStateProperty.all(
              BorderSide(color: baseColor.withOpacity(0.48), width: 1.2),
            )
          : null,
      overlayColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.pressed)) {
          return baseColor.withOpacity(0.24);
        }
        if (states.contains(MaterialState.hovered)) {
          return baseColor.withOpacity(0.12);
        }
        return null;
      }),
    );
  }
}

/// Theme extension used to propagate runtime environment signals
/// (transparency/motion preferences) to custom widgets.
class GlassEnvironment extends ThemeExtension<GlassEnvironment> {
  const GlassEnvironment({required this.reduceTransparency});

  final bool reduceTransparency;

  @override
  GlassEnvironment copyWith({bool? reduceTransparency}) {
    return GlassEnvironment(
      reduceTransparency: reduceTransparency ?? this.reduceTransparency,
    );
  }

  @override
  GlassEnvironment lerp(ThemeExtension<GlassEnvironment>? other, double t) {
    if (other is! GlassEnvironment) return this;
    return GlassEnvironment(
      reduceTransparency: t < 0.5
          ? reduceTransparency
          : other.reduceTransparency,
    );
  }
}

/// Helper to expose gradient backgrounds and frosted containers.
class GlassSurfaces {
  const GlassSurfaces._();

  static BoxDecoration background({GlassTone tone = GlassTone.day}) {
    return BoxDecoration(gradient: GlassGradients.byTone(tone));
  }

  static BoxDecoration frosted({
    GlassTone tone = GlassTone.day,
    bool isDark = false,
  }) {
    return GlassDecorations.surface(
      tone: tone,
      isDark: isDark,
      reduceTransparency: false,
    );
  }
}
