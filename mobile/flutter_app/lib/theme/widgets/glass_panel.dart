import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app/theme/app_design_tokens.dart';
import 'package:flutter_app/theme/liquid_glass_theme.dart';
import 'package:flutter_app/theme/liquid_glass_tokens.dart';

/// Frosted panel that wraps content with Liquid Glass styling and blur.
/// V2 - Enhanced with better contrast and visibility
class GlassPanel extends StatelessWidget {
  const GlassPanel({
    required this.child,
    this.tone = GlassTone.day,
    this.padding,
    this.alignment,
    this.borderRadius,
    this.enhancedContrast = true,
    super.key,
  });

  final Widget child;
  final GlassTone tone;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;
  final double? borderRadius;
  final bool enhancedContrast;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final env =
        theme.extension<GlassEnvironment>() ??
        const GlassEnvironment(reduceTransparency: false);
    final sigma = GlassBlur.scaled(
      GlassBlur.lg,
      reduceTransparency: env.reduceTransparency,
    );
    final isDark = theme.brightness == Brightness.dark;
    final effectivePadding = padding ?? AppSpacing.cardPadding;
    final effectiveRadius = borderRadius ?? AppRadius.xxl;

    // Glass color with subtle tint to avoid pure white
    final glassTintColor = switch (tone) {
      GlassTone.dawn => const Color.fromRGBO(255, 240, 245, 0.5),  // Pink tint
      GlassTone.day => const Color.fromRGBO(224, 242, 254, 0.55),  // Blue tint
      GlassTone.dusk => const Color.fromRGBO(30, 27, 75, 0.6),     // Dark blue
    };
    
    final baseColor = enhancedContrast ? glassTintColor : GlassColors.overlayCool;
    
    return ClipRRect(
      borderRadius: BorderRadius.circular(effectiveRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: sigma,
          sigmaY: sigma,
          tileMode: TileMode.clamp,
        ),
        child: Container(
          alignment: alignment,
          padding: effectivePadding,
          decoration: BoxDecoration(
            color: baseColor,
            borderRadius: BorderRadius.circular(effectiveRadius),
            border: Border.all(
              color: enhancedContrast 
                  ? AppColors.borderMedium
                  : GlassColors.borderLight,
              width: 2,
            ),
            boxShadow: [
              ...AppShadows.md,
              // Colored inner glow for depth
              BoxShadow(
                color: AppColors.primary.withOpacity(0.05),
                blurRadius: 12,
                spreadRadius: -2,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: DefaultTextStyle(
            style: TextStyle(
              color: AppColors.textOnGlass,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}

/// Small glass card for compact content
class GlassCard extends StatelessWidget {
  const GlassCard({
    required this.child,
    this.tone = GlassTone.day,
    this.padding = const EdgeInsets.all(16),
    super.key,
  });

  final Widget child;
  final GlassTone tone;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return GlassPanel(
      tone: tone,
      padding: padding,
      borderRadius: 24,
      child: child,
    );
  }
}

/// Glass button with hover effects
class GlassButton extends StatefulWidget {
  const GlassButton({
    required this.child,
    required this.onPressed,
    this.tone = GlassTone.day,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
    super.key,
  });

  final Widget child;
  final VoidCallback? onPressed;
  final GlassTone tone;
  final EdgeInsetsGeometry padding;

  @override
  State<GlassButton> createState() => _GlassButtonState();
}

class _GlassButtonState extends State<GlassButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    if (widget.onPressed != null) {
      setState(() => _isPressed = true);
      _controller.forward();
    }
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() => _isPressed = false);
    _controller.reverse();
  }

  void _handleTapCancel() {
    setState(() => _isPressed = false);
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      onTap: widget.onPressed,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: GlassPanel(
          tone: widget.tone,
          padding: widget.padding,
          borderRadius: 20,
          child: widget.child,
        ),
      ),
    );
  }
}
