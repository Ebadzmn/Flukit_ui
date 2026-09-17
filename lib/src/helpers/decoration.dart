import 'package:flutter/material.dart';

/// Helper to create a clean [BoxDecoration] with standard property names.
BoxDecoration boxDecoration({
  Color? color,
  double? radius,
  BorderRadiusGeometry? borderRadius,
  Border? border,
  Color? borderColor,
  double borderWidth = 1.0,
  List<BoxShadow>? shadow,
  Gradient? gradient,
  BoxShape shape = BoxShape.rectangle,
}) {
  BorderRadiusGeometry? resolvedRadius = borderRadius;
  if (shape != BoxShape.circle && resolvedRadius == null && radius != null) {
    resolvedRadius = BorderRadius.circular(radius);
  }

  Border? resolvedBorder = border;
  if (resolvedBorder == null && borderColor != null) {
    resolvedBorder = Border.all(color: borderColor, width: borderWidth);
  }

  return BoxDecoration(
    color: color,
    borderRadius: shape == BoxShape.circle ? null : resolvedRadius,
    border: resolvedBorder,
    boxShadow: shadow,
    gradient: gradient,
    shape: shape,
  );
}

/// Helper to create a clean drop shadow.
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
