import 'package:flutter/material.dart';

import 'package:flutter_app/theme/app_design_tokens.dart';
import 'package:flutter_app/theme/liquid_glass_tokens.dart';

class GlassTheme {
  const GlassTheme._();

  static ThemeData light() {
    const seed = GlassColors.dayAccent;
    final scheme = ColorScheme.fromSeed(
      seedColor: seed,
      secondary: GlassColors.dawnAccent,
      tertiary: GlassColors.dawnGlow,
    );

    final base = ThemeData(
      colorScheme: scheme,
      useMaterial3: true,
      scaffoldBackgroundColor: GlassColors.dayStart,
      splashFactory: InkSparkle.splashFactory,
      fontFamily: 'SF Pro Display', // Fallback to system font
    );

    // Enhanced typography with better hierarchy
    final textTheme = base.textTheme.copyWith(
      displayLarge: base.textTheme.displayLarge?.copyWith(
        fontSize: 57,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.25,
        height: 1.12,
      ),
      displayMedium: base.textTheme.displayMedium?.copyWith(
        fontSize: 45,
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
        height: 1.16,
      ),
      displaySmall: base.textTheme.displaySmall?.copyWith(
        fontSize: 36,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
        height: 1.22,
      ),
      headlineLarge: base.textTheme.headlineLarge?.copyWith(
        fontSize: 32,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
        height: 1.25,
      ),
      headlineMedium: base.textTheme.headlineMedium?.copyWith(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
        height: 1.29,
      ),
      headlineSmall: base.textTheme.headlineSmall?.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
        height: 1.33,
      ),
      titleLarge: base.textTheme.titleLarge?.copyWith(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
        height: 1.27,
      ),
      titleMedium: base.textTheme.titleMedium?.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.15,
        height: 1.5,
      ),
      titleSmall: base.textTheme.titleSmall?.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.1,
        height: 1.43,
      ),
      bodyLarge: base.textTheme.bodyLarge?.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        height: 1.5,
      ),
      bodyMedium: base.textTheme.bodyMedium?.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        height: 1.43,
      ),
      bodySmall: base.textTheme.bodySmall?.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
        height: 1.33,
      ),
      labelLarge: base.textTheme.labelLarge?.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.1,
        height: 1.43,
      ),
      labelMedium: base.textTheme.labelMedium?.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
        height: 1.33,
      ),
      labelSmall: base.textTheme.labelSmall?.copyWith(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
        height: 1.45,
      ),
    );

    return base.copyWith(
      textTheme: textTheme.apply(
        bodyColor: GlassColors.foregroundOnLight,
        displayColor: GlassColors.foregroundOnLight,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: _buttonStyle(scheme, foreground: AppColors.textOnPrimary),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: _buttonStyle(scheme, foreground: AppColors.textOnPrimary),
      ),
      textButtonTheme: TextButtonThemeData(
        style: _buttonStyle(
          scheme,
          backgroundOpacity: 0.0,
          foreground: AppColors.primary,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: _buttonStyle(
          scheme,
          outlined: true,
          foreground: AppColors.primary,
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
        elevation: 0,
        margin: const EdgeInsets.all(12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        clipBehavior: Clip.antiAlias,
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
    double backgroundOpacity = 0.15,
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
          return baseColor.withOpacity(0.08);
        }
        if (states.contains(MaterialState.pressed)) {
          return baseColor.withOpacity(backgroundOpacity * 1.5);
        }
        if (states.contains(MaterialState.hovered)) {
          return baseColor.withOpacity(backgroundOpacity * 1.2);
        }
        return baseColor.withOpacity(backgroundOpacity);
      }),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      ),
      elevation: MaterialStateProperty.all(0),
      shadowColor: MaterialStateProperty.all(Colors.transparent),
      side: outlined
          ? MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.disabled)) {
                return BorderSide(
                  color: baseColor.withOpacity(0.12),
                  width: 1.5,
                );
              }
              return BorderSide(
                color: baseColor.withOpacity(0.5),
                width: 1.5,
              );
            })
          : null,
      overlayColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.pressed)) {
          return baseColor.withOpacity(0.2);
        }
        if (states.contains(MaterialState.hovered)) {
          return baseColor.withOpacity(0.08);
        }
        return null;
      }),
      minimumSize: MaterialStateProperty.all(const Size(64, 48)),
      animationDuration: const Duration(milliseconds: 200),
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
