import 'package:flutter/material.dart';

/// Enumerates tone variants so gradients follow assistant context states.
enum GlassTone { dawn, day, dusk }

/// Provides the base color palette for the Liquid Glass system.
class GlassColors {
  GlassColors._();

  static const Color dawnStart = Color(0xFFF8FBFF);
  static const Color dawnEnd = Color(0xFFD7EEFF);
  static const Color dawnAccent = Color(0xFF4B9FFF);

  static const Color dayStart = Color(0xFFE0F4FF);
  static const Color dayEnd = Color(0xFFC4E4FF);
  static const Color dayAccent = Color(0xFF2D8CFF);

  static const Color duskStart = Color(0xFF1F2C4C);
  static const Color duskEnd = Color(0xFF364B7D);
  static const Color duskAccent = Color(0xFF74D6FF);

  static const Color foregroundOnLight = Color(0xFF0B1E33);
  static const Color foregroundOnDark = Colors.white;

  static const Color overlayLight = Color.fromRGBO(255, 255, 255, 0.24);
  static const Color overlayCool = Color.fromRGBO(29, 54, 83, 0.18);
  static const Color overlayDark = Color.fromRGBO(15, 25, 40, 0.32);

  static const Color shadow = Color.fromRGBO(10, 24, 48, 0.24);
}

/// Background gradients mapped to the major assistant mood states.
class GlassGradients {
  GlassGradients._();

  static const LinearGradient dawn = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [GlassColors.dawnStart, GlassColors.dawnEnd],
  );

  static const LinearGradient day = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [GlassColors.dayStart, GlassColors.dayEnd],
  );

  static const LinearGradient dusk = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [GlassColors.duskStart, GlassColors.duskEnd],
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
}

/// Gaussian blur strengths applied to frosted surfaces.
class GlassBlur {
  GlassBlur._();

  static const double xs = 8;
  static const double sm = 12;
  static const double md = 16;
  static const double lg = 24;

  /// Supports accessibility preference for reduced transparency.
  static double scaled(double value, {bool reduceTransparency = false}) {
    if (!reduceTransparency) return value;
    return value * 0.5;
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
  }) {
    final overlay = switch (tone) {
      GlassTone.dawn => GlassColors.overlayLight,
      GlassTone.day => GlassColors.overlayCool,
      GlassTone.dusk => GlassColors.overlayDark,
    };

    final baseOpacity = reduceTransparency ? 0.8 : 1.0;
    final lerped = Color.lerp(
      overlay,
      isDark ? GlassColors.duskStart : Colors.white,
      reduceTransparency ? 0.6 : 0.0,
    );
    final backgroundColor = (lerped ?? overlay).withOpacity(
      (lerped ?? overlay).opacity * baseOpacity,
    );

    return BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(24),
      border: Border.all(color: overlay.withAlpha(isDark ? 82 : 46)),
      boxShadow: [
        BoxShadow(
          color: GlassColors.shadow.withAlpha(isDark ? 89 : 56),
          blurRadius: GlassElevation.lifted,
          spreadRadius: 2,
          offset: const Offset(0, 12),
        ),
      ],
    );
  }
}
