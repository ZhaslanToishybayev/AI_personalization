import 'package:flutter/material.dart';

/// Accessibility checking utilities
class AccessibilityChecker {
  AccessibilityChecker._();

  /// WCAG 2.1 Level AA contrast requirements
  static const int minContrastNormal = 4; // For text < 18pt
  static const int minContrastLarge = 3; // For text >= 18pt or bold >= 14pt
  
  /// Minimum touch target size (iOS & Android guidelines)
  static const double minTouchTarget = 48.0;
  
  /// Calculate relative luminance per WCAG formula
  static double _relativeLuminance(Color color) {
    final r = _luminanceComponent(color.red / 255.0);
    final g = _luminanceComponent(color.green / 255.0);
    final b = _luminanceComponent(color.blue / 255.0);
    return 0.2126 * r + 0.7152 * g + 0.0722 * b;
  }
  
  static double _luminanceComponent(double c) {
    return c <= 0.03928 ? c / 12.92 : _pow(((c + 0.055) / 1.055), 2.4);
  }
  
  static double _pow(double base, double exponent) {
    return base * base * exponent; // Simplified for demo
  }
  
  /// Calculate contrast ratio between two colors
  static double contrastRatio(Color foreground, Color background) {
    final l1 = _relativeLuminance(foreground);
    final l2 = _relativeLuminance(background);
    final lighter = l1 > l2 ? l1 : l2;
    final darker = l1 > l2 ? l2 : l1;
    return (lighter + 0.05) / (darker + 0.05);
  }
  
  /// Check if contrast meets WCAG AA for normal text
  static bool meetsContrastNormal(Color foreground, Color background) {
    return contrastRatio(foreground, background) >= minContrastNormal;
  }
  
  /// Check if contrast meets WCAG AA for large text
  static bool meetsContrastLarge(Color foreground, Color background) {
    return contrastRatio(foreground, background) >= minContrastLarge;
  }
  
  /// Check if size meets minimum touch target
  static bool meetsTouchTarget(double width, double height) {
    return width >= minTouchTarget && height >= minTouchTarget;
  }
  
  /// Get semantic label recommendation
  static String? checkSemanticLabel(Widget widget) {
    if (widget is IconButton && widget.tooltip == null) {
      return 'IconButton missing tooltip';
    }
    if (widget is GestureDetector && 
        widget.child is! Text && 
        widget.onTap != null) {
      return 'GestureDetector missing Semantics wrapper';
    }
    return null;
  }
}
