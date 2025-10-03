import 'package:flutter/material.dart';
import 'package:flutter_app/theme/app_design_tokens.dart';

/// Button variant types
enum AppButtonVariant {
  primary,
  secondary,
  outline,
  text,
}

/// Button size presets
enum AppButtonSize {
  small,
  medium,
  large,
}

/// Modern button with solid background and clear contrast
class AppButton extends StatefulWidget {
  const AppButton({
    required this.onPressed,
    required this.child,
    this.variant = AppButtonVariant.primary,
    this.size = AppButtonSize.medium,
    this.icon,
    this.fullWidth = false,
    this.isLoading = false,
    super.key,
  });

  final VoidCallback? onPressed;
  final Widget child;
  final AppButtonVariant variant;
  final AppButtonSize size;
  final IconData? icon;
  final bool fullWidth;
  final bool isLoading;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: AppDurations.fast,
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.96).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    if (widget.onPressed != null && !widget.isLoading) {
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
    final isDisabled = widget.onPressed == null || widget.isLoading;
    final buttonConfig = _getButtonConfig();
    final sizeConfig = _getSizeConfig();

    Widget buttonChild = widget.child;

    // Add icon if provided
    if (widget.icon != null) {
      buttonChild = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(widget.icon, size: sizeConfig.iconSize),
          SizedBox(width: AppSpacing.sm),
          Flexible(child: widget.child),
        ],
      );
    }

    // Add loading indicator
    if (widget.isLoading) {
      buttonChild = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: sizeConfig.iconSize,
            height: sizeConfig.iconSize,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(
                buttonConfig.textColor,
              ),
            ),
          ),
          SizedBox(width: AppSpacing.sm),
          Flexible(child: widget.child),
        ],
      );
    }

    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      onTap: isDisabled ? null : widget.onPressed,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: AnimatedContainer(
          duration: AppDurations.fast,
          curve: Curves.easeInOut,
          width: widget.fullWidth ? double.infinity : null,
          height: sizeConfig.height,
          padding: sizeConfig.padding,
          decoration: BoxDecoration(
            gradient: isDisabled
                ? null
                : (buttonConfig.gradient ??
                    LinearGradient(
                      colors: [
                        buttonConfig.backgroundColor,
                        buttonConfig.backgroundColor,
                      ],
                    )),
            color: isDisabled ? AppColors.neutral200 : null,
            borderRadius: BorderRadius.circular(sizeConfig.borderRadius),
            border: buttonConfig.borderColor != null
                ? Border.all(
                    color: isDisabled
                        ? AppColors.neutral300
                        : buttonConfig.borderColor!,
                    width: 2,
                  )
                : null,
            boxShadow: isDisabled
                ? null
                : (_isPressed ? AppShadows.sm : buttonConfig.shadows),
          ),
          child: DefaultTextStyle(
            style: TextStyle(
              color: isDisabled ? AppColors.textDisabled : buttonConfig.textColor,
              fontSize: sizeConfig.fontSize,
              fontWeight: AppFontWeights.semiBold,
              letterSpacing: 0.5,
            ),
            textAlign: TextAlign.center,
            child: IconTheme(
              data: IconThemeData(
                color: isDisabled
                    ? AppColors.textDisabled
                    : buttonConfig.textColor,
                size: sizeConfig.iconSize,
              ),
              child: Center(
                child: buttonChild,
              ),
            ),
          ),
        ),
      ),
    );
  }

  _ButtonConfig _getButtonConfig() {
    switch (widget.variant) {
      case AppButtonVariant.primary:
        return _ButtonConfig(
          backgroundColor: AppColors.primary,
          textColor: AppColors.textOnPrimary,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.primary,
              AppColors.primaryDark,
            ],
          ),
          shadows: [
            ...AppShadows.md,
            ...AppShadows.glow(AppColors.primary, intensity: 0.3),
          ],
        );
      case AppButtonVariant.secondary:
        return _ButtonConfig(
          backgroundColor: AppColors.secondary,
          textColor: AppColors.textOnSecondary,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.secondary,
              AppColors.secondaryDark,
            ],
          ),
          shadows: [
            ...AppShadows.md,
            ...AppShadows.glow(AppColors.secondary, intensity: 0.25),
          ],
        );
      case AppButtonVariant.outline:
        return _ButtonConfig(
          backgroundColor: Colors.transparent,
          textColor: AppColors.primary,
          borderColor: AppColors.primary,
          shadows: AppShadows.sm,
        );
      case AppButtonVariant.text:
        return _ButtonConfig(
          backgroundColor: Colors.transparent,
          textColor: AppColors.primary,
          shadows: [],
        );
    }
  }

  _ButtonSizeConfig _getSizeConfig() {
    switch (widget.size) {
      case AppButtonSize.small:
        return _ButtonSizeConfig(
          height: 40,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm,
          ),
          fontSize: 14,
          iconSize: AppIconSizes.sm,
          borderRadius: AppRadius.md,
        );
      case AppButtonSize.medium:
        return _ButtonSizeConfig(
          height: AppTouchTargets.minimum,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.md,
          ),
          fontSize: 16,
          iconSize: AppIconSizes.md,
          borderRadius: AppRadius.lg,
        );
      case AppButtonSize.large:
        return _ButtonSizeConfig(
          height: AppTouchTargets.comfortable,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.xl,
            vertical: AppSpacing.lg,
          ),
          fontSize: 18,
          iconSize: AppIconSizes.lg,
          borderRadius: AppRadius.xl,
        );
    }
  }
}

class _ButtonConfig {
  const _ButtonConfig({
    required this.backgroundColor,
    required this.textColor,
    this.gradient,
    this.borderColor,
    this.shadows = const [],
  });

  final Color backgroundColor;
  final Color textColor;
  final Gradient? gradient;
  final Color? borderColor;
  final List<BoxShadow> shadows;
}

class _ButtonSizeConfig {
  const _ButtonSizeConfig({
    required this.height,
    required this.padding,
    required this.fontSize,
    required this.iconSize,
    required this.borderRadius,
  });

  final double height;
  final EdgeInsetsGeometry padding;
  final double fontSize;
  final double iconSize;
  final double borderRadius;
}
