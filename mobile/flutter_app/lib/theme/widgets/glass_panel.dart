import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app/theme/liquid_glass_theme.dart';
import 'package:flutter_app/theme/liquid_glass_tokens.dart';

/// Frosted panel that wraps content with Liquid Glass styling and blur.
class GlassPanel extends StatelessWidget {
  const GlassPanel({
    required this.child,
    this.tone = GlassTone.day,
    this.padding = const EdgeInsets.all(24),
    this.alignment,
    super.key,
  });

  final Widget child;
  final GlassTone tone;
  final EdgeInsetsGeometry padding;
  final AlignmentGeometry? alignment;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final env =
        theme.extension<GlassEnvironment>() ??
        const GlassEnvironment(reduceTransparency: false);
    final sigma = GlassBlur.scaled(
      GlassBlur.md,
      reduceTransparency: env.reduceTransparency,
    );
    final isDark = theme.brightness == Brightness.dark;

    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
        child: Container(
          alignment: alignment,
          padding: padding,
          decoration: GlassDecorations.surface(
            tone: tone,
            isDark: isDark,
            reduceTransparency: env.reduceTransparency,
          ),
          child: child,
        ),
      ),
    );
  }
}
