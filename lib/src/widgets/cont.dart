import 'package:flutter/material.dart';
import '../helpers/edge_insets.dart';
import '../helpers/decoration.dart';

/// Lightweight, readable alias for Flutter's [Container].
///
/// Example:
/// ```dart
/// cont(
///   w: 200,
///   h: 100,
///   pad: 16,
///   mar: 8,
///   rad: 12,
///   cl: white,
///   ch: txt('Hello'),
/// )
/// ```
class cont extends StatelessWidget {
  /// Width of container
  final double? w;

  /// Height of container
  final double? h;

  /// Padding (accepts `double`, `int` for all sides, or [EdgeInsetsGeometry])
  final dynamic pad;

  /// Margin (accepts `double`, `int` for all sides, or [EdgeInsetsGeometry])
  final dynamic mar;

  /// Border radius (accepts `double`, `int`, or [BorderRadius])
  final dynamic rad;

  /// Background color
  final Color? cl;

  /// Border width (shorthand)
  final double? bor;

  /// Border color (shorthand)
  final Color? bc;

  /// Box shadow list
  final List<BoxShadow>? shadow;

  /// Gradient background
  final Gradient? gradient;

  /// Box shape
  final BoxShape shape;

  /// Alignment of child inside container
  final AlignmentGeometry? ali;

  /// Optional custom decoration override
  final Decoration? dec;

  /// Child widget
  final Widget? ch;

  /// Clip behavior
  final Clip clip;

  /// Constraints
  final BoxConstraints? constraints;

  /// Transform matrix
  final Matrix4? transform;

  /// Optional tap callback (automatically wraps with InkWell)
  final VoidCallback? onTap;

  /// Horizontal padding shorthand
  final double? px;

  /// Vertical padding shorthand
  final double? py;

  const cont({
    super.key,
    this.w,
    this.h,
    this.pad,
    this.mar,
    this.rad,
    this.cl,
    this.bor,
    this.bc,
    this.shadow,
    this.gradient,
    this.shape = BoxShape.rectangle,
    this.ali,
    this.dec,
    this.ch,
    this.clip = Clip.none,
    this.constraints,
    this.transform,
    this.onTap,
    this.px,
    this.py,
  });

  @override
  Widget build(BuildContext context) {
    Decoration? resolvedDec = dec;

    if (resolvedDec == null &&
        (cl != null ||
            rad != null ||
            bor != null ||
            bc != null ||
            shadow != null ||
            gradient != null ||
            shape != BoxShape.rectangle)) {
      resolvedDec = bdec(
        cl: cl,
        rad: rad,
        bor: bor,
        bc: bc,
        shadow: shadow,
        gradient: gradient,
        shape: shape,
      );
    }

    EdgeInsetsGeometry? effectivePad = resolveInsets(pad);
    if (px != null || py != null) {
      final symmetric = EdgeInsets.symmetric(
        horizontal: px ?? 0.0,
        vertical: py ?? 0.0,
      );
      effectivePad = effectivePad == null
          ? symmetric
          : (effectivePad as EdgeInsets).add(symmetric);
    }

    final BorderRadius? resolvedRadius = resolveRadius(rad);

    Widget result = Container(
      width: w,
      height: h,
      alignment: ali,
      padding: effectivePad,
      margin: resolveInsets(mar),
      color: resolvedDec == null ? cl : null,
      decoration: resolvedDec,
      clipBehavior: clip,
      constraints: constraints,
      transform: transform,
      child: ch,
    );

    if (onTap != null) {
      result = InkWell(
        onTap: onTap,
        borderRadius: resolvedRadius,
        child: result,
      );
    }

    return result;
  }
}
