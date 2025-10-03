import 'package:flutter/material.dart';

/// Enumerates tone variants so gradients follow assistant context states.
enum GlassTone { dawn, day, dusk }

/// Provides the base color palette for the Liquid Glass system.
class GlassColors {
  GlassColors._();

  // Dawn - Soft morning vibes with purple-pink-blue gradient (more visible)
  static const Color dawnStart = Color(0xFFFFE8F0);
  static const Color dawnMid1 = Color(0xFFFFB6D9);
  static const Color dawnMid2 = Color(0xFFE8D5FF);
  static const Color dawnEnd = Color(0xFFBAE6FD);
  static const Color dawnAccent = Color(0xFF7C3AED);
  static const Color dawnGlow = Color(0xFFEC4899);

  // Day - Vibrant blue-cyan gradient with energy (more saturated)
  static const Color dayStart = Color(0xFFBAE6FD);
  static const Color dayMid1 = Color(0xFF7DD3FC);
  static const Color dayMid2 = Color(0xFF38BDF8);
  static const Color dayEnd = Color(0xFF0EA5E9);
  static const Color dayAccent = Color(0xFF0EA5E9);
  static const Color dayGlow = Color(0xFF06B6D4);

  // Dusk - Deep blue-purple-indigo night theme
  static const Color duskStart = Color(0xFF1E1B4B);
  static const Color duskMid1 = Color(0xFF312E81);
  static const Color duskMid2 = Color(0xFF4338CA);
  static const Color duskEnd = Color(0xFF4F46E5);
  static const Color duskAccent = Color(0xFF818CF8);
  static const Color duskGlow = Color(0xFFA78BFA);

  static const Color foregroundOnLight = Color(0xFF1E293B);
  static const Color foregroundOnDark = Color(0xFFF8FAFC);

  // Enhanced glass overlays with better opacity
  static const Color overlayLight = Color.fromRGBO(255, 255, 255, 0.65);
  static const Color overlayCool = Color.fromRGBO(248, 250, 252, 0.45);
  static const Color overlayDark = Color.fromRGBO(15, 23, 42, 0.65);

  // Subtle border colors
  static const Color borderLight = Color.fromRGBO(255, 255, 255, 0.3);
  static const Color borderDark = Color.fromRGBO(255, 255, 255, 0.1);

  // Enhanced shadows
  static const Color shadow = Color.fromRGBO(15, 23, 42, 0.1);
  static const Color shadowStrong = Color.fromRGBO(15, 23, 42, 0.25);
}

/// Background gradients mapped to the major assistant mood states.
class GlassGradients {
  GlassGradients._();

  static const LinearGradient dawn = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      GlassColors.dawnStart,
      GlassColors.dawnMid1,
      GlassColors.dawnMid2,
      GlassColors.dawnEnd,
    ],
    stops: [0.0, 0.3, 0.7, 1.0],
  );

  static const LinearGradient day = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      GlassColors.dayStart,
      GlassColors.dayMid1,
      GlassColors.dayMid2,
      GlassColors.dayEnd,
    ],
    stops: [0.0, 0.35, 0.65, 1.0],
  );

  static const LinearGradient dusk = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      GlassColors.duskStart,
      GlassColors.duskMid1,
      GlassColors.duskMid2,
      GlassColors.duskEnd,
    ],
    stops: [0.0, 0.3, 0.7, 1.0],
  );

  static LinearGradient byTone(GlassTone tone) {
    switch (tone) {
      case GlassTone.dawn:
        return dawn;
      case GlassTone.day:
        return day;
      case GlassTone.dusk:
        return dusk;
    }
  }

  /// Shimmer gradient for loading states
  static const LinearGradient shimmer = LinearGradient(
    begin: Alignment(-1.0, -0.3),
    end: Alignment(1.0, 0.3),
    colors: [
      Color.fromRGBO(255, 255, 255, 0.0),
      Color.fromRGBO(255, 255, 255, 0.3),
      Color.fromRGBO(255, 255, 255, 0.0),
    ],
    stops: [0.0, 0.5, 1.0],
  );
}

/// Gaussian blur strengths applied to frosted surfaces.
class GlassBlur {
  GlassBlur._();

  static const double xs = 10;
  static const double sm = 16;
  static const double md = 24;
  static const double lg = 32;
  static const double xl = 48;

  /// Supports accessibility preference for reduced transparency.
  static double scaled(double value, {bool reduceTransparency = false}) {
    if (!reduceTransparency) return value;
    return value * 0.4;
  }
}

/// Elevation constants matching layered glass compositions.
class GlassElevation {
  GlassElevation._();

  static const double base = 3;
  static const double lifted = 8;
  static const double floating = 16;
}

/// Provides reusable decoration helpers for frosted surfaces.
class GlassDecorations {
  GlassDecorations._();

  static BoxDecoration surface({
    GlassTone tone = GlassTone.day,
    bool isDark = false,
    bool reduceTransparency = false,
    double borderRadius = 28,
  }) {
    final overlay = switch (tone) {
      GlassTone.dawn => GlassColors.overlayLight,
      GlassTone.day => GlassColors.overlayCool,
      GlassTone.dusk => GlassColors.overlayDark,
    };

    final baseOpacity = reduceTransparency ? 0.9 : 1.0;
    final lerped = Color.lerp(
      overlay,
      isDark ? GlassColors.duskStart : Colors.white,
      reduceTransparency ? 0.4 : 0.0,
    );
    final backgroundColor = (lerped ?? overlay).withOpacity(
      (lerped ?? overlay).opacity * baseOpacity,
    );

    final border = isDark ? GlassColors.borderDark : GlassColors.borderLight;
    final glow = switch (tone) {
      GlassTone.dawn => GlassColors.dawnGlow,
      GlassTone.day => GlassColors.dayGlow,
      GlassTone.dusk => GlassColors.duskGlow,
    };

    return BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(borderRadius),
      border: Border.all(
        color: border,
        width: 1.5,
      ),
      boxShadow: [
        // Soft ambient shadow
        BoxShadow(
          color: GlassColors.shadow,
          blurRadius: 20,
          spreadRadius: 0,
          offset: const Offset(0, 8),
        ),
        // Stronger depth shadow
        BoxShadow(
          color: GlassColors.shadowStrong,
          blurRadius: 40,
          spreadRadius: -5,
          offset: const Offset(0, 20),
        ),
        // Subtle colored glow
        BoxShadow(
          color: glow.withOpacity(isDark ? 0.15 : 0.08),
          blurRadius: 30,
          spreadRadius: -10,
          offset: const Offset(0, 10),
        ),
      ],
    );
  }

  static BoxDecoration card({
    GlassTone tone = GlassTone.day,
    bool isDark = false,
    bool reduceTransparency = false,
  }) {
    return surface(
      tone: tone,
      isDark: isDark,
      reduceTransparency: reduceTransparency,
      borderRadius: 24,
    );
  }

  static BoxDecoration button({
    GlassTone tone = GlassTone.day,
    bool isDark = false,
    bool reduceTransparency = false,
  }) {
    return surface(
      tone: tone,
      isDark: isDark,
      reduceTransparency: reduceTransparency,
      borderRadius: 20,
    );
  }
}
