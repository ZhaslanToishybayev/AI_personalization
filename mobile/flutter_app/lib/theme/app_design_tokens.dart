import 'package:flutter/material.dart';

/// Unified spacing system for consistent layout
class AppSpacing {
  AppSpacing._();

  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;
  static const double xxxl = 64.0;

  // Common padding presets
  static const EdgeInsets paddingXS = EdgeInsets.all(xs);
  static const EdgeInsets paddingSM = EdgeInsets.all(sm);
  static const EdgeInsets paddingMD = EdgeInsets.all(md);
  static const EdgeInsets paddingLG = EdgeInsets.all(lg);
  static const EdgeInsets paddingXL = EdgeInsets.all(xl);

  // Common horizontal padding
  static const EdgeInsets horizontalMD = EdgeInsets.symmetric(horizontal: md);
  static const EdgeInsets horizontalLG = EdgeInsets.symmetric(horizontal: lg);
  static const EdgeInsets horizontalXL = EdgeInsets.symmetric(horizontal: xl);

  // Common vertical padding
  static const EdgeInsets verticalMD = EdgeInsets.symmetric(vertical: md);
  static const EdgeInsets verticalLG = EdgeInsets.symmetric(vertical: lg);
  static const EdgeInsets verticalXL = EdgeInsets.symmetric(vertical: xl);

  // Screen padding
  static const EdgeInsets screenPadding = EdgeInsets.symmetric(
    horizontal: lg,
    vertical: md,
  );

  // Card padding
  static const EdgeInsets cardPadding = EdgeInsets.all(lg);
  static const EdgeInsets cardPaddingSmall = EdgeInsets.all(md);
}

/// Border radius system for consistent shapes
class AppRadius {
  AppRadius._();

  static const double xs = 8.0;
  static const double sm = 12.0;
  static const double md = 16.0;
  static const double lg = 20.0;
  static const double xl = 24.0;
  static const double xxl = 28.0;
  static const double round = 999.0;

  static BorderRadius get radiusXS => BorderRadius.circular(xs);
  static BorderRadius get radiusSM => BorderRadius.circular(sm);
  static BorderRadius get radiusMD => BorderRadius.circular(md);
  static BorderRadius get radiusLG => BorderRadius.circular(lg);
  static BorderRadius get radiusXL => BorderRadius.circular(xl);
  static BorderRadius get radiusXXL => BorderRadius.circular(xxl);
  static BorderRadius get radiusRound => BorderRadius.circular(round);
}

/// Enhanced color system with solid colors for UI elements
class AppColors {
  AppColors._();

  // Primary brand colors
  static const Color primary = Color(0xFF0EA5E9); // Sky blue
  static const Color primaryDark = Color(0xFF0284C7);
  static const Color primaryLight = Color(0xFF38BDF8);

  // Secondary colors
  static const Color secondary = Color(0xFF7C3AED); // Purple
  static const Color secondaryDark = Color(0xFF6D28D9);
  static const Color secondaryLight = Color(0xFF8B5CF6);

  // Accent colors
  static const Color accent = Color(0xFFEC4899); // Pink
  static const Color accentDark = Color(0xFFDB2777);
  static const Color accentLight = Color(0xFFF472B6);

  // Semantic colors
  static const Color success = Color(0xFF10B981); // Green
  static const Color warning = Color(0xFFF59E0B); // Amber
  static const Color error = Color(0xFFEF4444); // Red
  static const Color info = Color(0xFF06B6D4); // Cyan

  // Neutral colors - Light theme
  static const Color neutral50 = Color(0xFFF8FAFC);
  static const Color neutral100 = Color(0xFFF1F5F9);
  static const Color neutral200 = Color(0xFFE2E8F0);
  static const Color neutral300 = Color(0xFFCBD5E1);
  static const Color neutral400 = Color(0xFF94A3B8);
  static const Color neutral500 = Color(0xFF64748B);
  static const Color neutral600 = Color(0xFF475569);
  static const Color neutral700 = Color(0xFF334155);
  static const Color neutral800 = Color(0xFF1E293B);
  static const Color neutral900 = Color(0xFF0F172A);

  // Text colors with proper contrast
  static const Color textPrimary = neutral900;
  static const Color textSecondary = neutral700;
  static const Color textTertiary = neutral500;
  static const Color textOnGlass = neutral800;
  static const Color textDisabled = neutral400;

  // Text on colored backgrounds
  static const Color textOnPrimary = Colors.white;
  static const Color textOnSecondary = Colors.white;
  static const Color textOnAccent = Colors.white;

  // Glass surface colors with subtle tint for better contrast
  static const Color glassLight = Color.fromRGBO(240, 248, 255, 0.55);  // Slight blue tint
  static const Color glassMedium = Color.fromRGBO(235, 245, 255, 0.45);
  static const Color glassDark = Color.fromRGBO(230, 242, 255, 0.35);

  // Border colors - more visible
  static const Color borderLight = Color.fromRGBO(14, 165, 233, 0.2);  // Primary color tint
  static const Color borderMedium = Color.fromRGBO(14, 165, 233, 0.3);
  static const Color borderDark = Color.fromRGBO(0, 0, 0, 0.2);

  // Shadow colors
  static const Color shadowLight = Color.fromRGBO(15, 23, 42, 0.08);
  static const Color shadowMedium = Color.fromRGBO(15, 23, 42, 0.15);
  static const Color shadowDark = Color.fromRGBO(15, 23, 42, 0.25);
}

/// Unified shadow system for consistent elevation
class AppShadows {
  AppShadows._();

  // Subtle shadow for minimal elevation
  static List<BoxShadow> get sm => [
    BoxShadow(
      color: AppColors.shadowLight,
      blurRadius: 8,
      spreadRadius: 0,
      offset: const Offset(0, 2),
    ),
  ];

  // Medium shadow for cards and panels
  static List<BoxShadow> get md => [
    BoxShadow(
      color: AppColors.shadowLight,
      blurRadius: 16,
      spreadRadius: 0,
      offset: const Offset(0, 4),
    ),
    BoxShadow(
      color: AppColors.shadowMedium,
      blurRadius: 32,
      spreadRadius: -8,
      offset: const Offset(0, 12),
    ),
  ];

  // Large shadow for floating elements
  static List<BoxShadow> get lg => [
    BoxShadow(
      color: AppColors.shadowLight,
      blurRadius: 24,
      spreadRadius: 0,
      offset: const Offset(0, 8),
    ),
    BoxShadow(
      color: AppColors.shadowMedium,
      blurRadius: 48,
      spreadRadius: -12,
      offset: const Offset(0, 20),
    ),
  ];

  // Extra large shadow for modals and overlays
  static List<BoxShadow> get xl => [
    BoxShadow(
      color: AppColors.shadowMedium,
      blurRadius: 32,
      spreadRadius: 0,
      offset: const Offset(0, 16),
    ),
    BoxShadow(
      color: AppColors.shadowDark,
      blurRadius: 64,
      spreadRadius: -16,
      offset: const Offset(0, 32),
    ),
  ];

  // Colored glow effect
  static List<BoxShadow> glow(Color color, {double intensity = 0.3}) => [
    BoxShadow(
      color: color.withOpacity(intensity),
      blurRadius: 24,
      spreadRadius: -4,
      offset: const Offset(0, 8),
    ),
  ];
}

/// Animation durations for consistent timing
class AppDurations {
  AppDurations._();

  static const Duration instant = Duration(milliseconds: 0);
  static const Duration fastest = Duration(milliseconds: 100);
  static const Duration fast = Duration(milliseconds: 150);
  static const Duration normal = Duration(milliseconds: 200);
  static const Duration medium = Duration(milliseconds: 300);
  static const Duration slow = Duration(milliseconds: 400);
  static const Duration slowest = Duration(milliseconds: 500);

  // Common animation curves
  static const Curve defaultCurve = Curves.easeInOut;
  static const Curve entranceCurve = Curves.easeOut;
  static const Curve exitCurve = Curves.easeIn;
  static const Curve bounceCurve = Curves.elasticOut;
}

/// Icon sizes for consistency
class AppIconSizes {
  AppIconSizes._();

  static const double xs = 16.0;
  static const double sm = 20.0;
  static const double md = 24.0;
  static const double lg = 32.0;
  static const double xl = 40.0;
  static const double xxl = 48.0;
}

/// Typography weights for consistency
class AppFontWeights {
  AppFontWeights._();

  static const FontWeight thin = FontWeight.w100;
  static const FontWeight extraLight = FontWeight.w200;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
  static const FontWeight black = FontWeight.w900;
}

/// Touch target sizes for accessibility
class AppTouchTargets {
  AppTouchTargets._();

  static const double minimum = 48.0;
  static const double comfortable = 56.0;
  static const double spacious = 64.0;
}
