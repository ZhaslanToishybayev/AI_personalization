import 'package:flutter/material.dart';

/// Simple Material Card - replaces GlassPanel
class SimpleCard extends StatelessWidget {
  const SimpleCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.elevation,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation ?? 1,
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: padding ?? const EdgeInsets.all(16),
        child: child,
      ),
    );
  }
}
