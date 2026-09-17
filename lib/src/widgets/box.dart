import 'package:flutter/material.dart';

/// A smart, boilerplate-free [Container] wrapper with clean and intuitive properties.
/// Eliminates the need for writing nested `BoxDecoration` and `EdgeInsets`.
class Box extends StatelessWidget {
  final Widget? child;
  final double? width;
  final double? height;
  final Color? color;
  final double? radius;
  final BorderRadiusGeometry? borderRadius;
  final Border? border;
  final Color? borderColor;
  final double borderWidth;
  final List<BoxShadow>? shadow;
  final dynamic padding;
  final dynamic margin;
  final AlignmentGeometry? alignment;
  final Gradient? gradient;
  final Clip clipBehavior;
  final VoidCallback? onTap;

  const Box({
    super.key,
    this.child,
    this.width,
    this.height,
    this.color,
    this.radius,
    this.borderRadius,
    this.border,
    this.borderColor,
    this.borderWidth = 1.0,
    this.shadow,
    this.padding,
    this.margin,
    this.alignment,
    this.gradient,
    this.clipBehavior = Clip.none,
    this.onTap,
  });

  /// Resolves flexible dynamic padding/margin (accepts `double`, `int`, or `EdgeInsetsGeometry`).
  EdgeInsetsGeometry? _resolveInsets(dynamic insets) {
    if (insets == null) return null;
    if (insets is EdgeInsetsGeometry) return insets;
    if (insets is num) return EdgeInsets.all(insets.toDouble());
    return null;
  }

  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry? resolvedRadius = borderRadius;
    if (resolvedRadius == null && radius != null) {
      resolvedRadius = BorderRadius.circular(radius!);
    }

    Border? resolvedBorder = border;
    if (resolvedBorder == null && borderColor != null) {
      resolvedBorder = Border.all(color: borderColor!, width: borderWidth);
    }

    final hasDecoration = color != null ||
        resolvedRadius != null ||
        resolvedBorder != null ||
        shadow != null ||
        gradient != null;

    Widget current = Container(
      width: width,
      height: height,
      alignment: alignment,
      padding: _resolveInsets(padding),
      margin: _resolveInsets(margin),
      clipBehavior: clipBehavior,
      decoration: hasDecoration
          ? BoxDecoration(
              color: color,
              borderRadius: resolvedRadius,
              border: resolvedBorder,
              boxShadow: shadow,
              gradient: gradient,
            )
          : null,
      child: child,
    );

    if (onTap != null) {
      current = InkWell(
        onTap: onTap,
        borderRadius: resolvedRadius is BorderRadius ? resolvedRadius : null,
        child: current,
      );
    }

    return current;
  }
}
