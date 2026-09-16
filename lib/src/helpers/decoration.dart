import 'package:flutter/material.dart';

/// Helper to create a clean [BoxDecoration] with concise property names.
BoxDecoration bdec({
  Color? cl,
  dynamic rad,
  double? bor,
  Color? bc,
  BorderStyle bs = BorderStyle.solid,
  List<BoxShadow>? shadow,
  Gradient? gradient,
  BoxShape shape = BoxShape.rectangle,
}) {
  BorderRadius? borderRadius;
  if (shape != BoxShape.circle && rad != null) {
    if (rad is BorderRadius) {
      borderRadius = rad;
    } else if (rad is num) {
      borderRadius = BorderRadius.circular(rad.toDouble());
    }
  }

  BoxBorder? border;
  if (bor != null || bc != null) {
    border = Border.all(
      color: bc ?? const Color(0xFF000000),
      width: bor ?? 1.0,
      style: bs,
    );
  }

  return BoxDecoration(
    color: cl,
    borderRadius: borderRadius,
    border: border,
    boxShadow: shadow,
    gradient: gradient,
    shape: shape,
  );
}

/// Helper to create a subtle drop shadow.
BoxShadow dropShadow({
  Color color = const Color(0x1A000000),
  double blur = 8.0,
  double spread = 0.0,
  Offset offset = const Offset(0, 4),
}) {
  return BoxShadow(
    color: color,
    blurRadius: blur,
    spreadRadius: spread,
    offset: offset,
  );
}
