import 'package:flutter/material.dart';

/// Helper to convert dynamic padding/margin representations into [EdgeInsetsGeometry].
///
/// Supports:
/// - `double` or `int` -> [EdgeInsets.all]
/// - `EdgeInsetsGeometry` -> returns as-is
EdgeInsetsGeometry? resolveInsets(dynamic value) {
  if (value == null) return null;
  if (value is EdgeInsetsGeometry) return value;
  if (value is num) return EdgeInsets.all(value.toDouble());
  return null;
}

/// Helper to convert dynamic radius representations into [BorderRadius].
///
/// Supports:
/// - `double` or `int` -> [BorderRadius.circular]
/// - `BorderRadius` -> returns as-is
BorderRadius? resolveRadius(dynamic value) {
  if (value == null) return null;
  if (value is BorderRadius) return value;
  if (value is num) return BorderRadius.circular(value.toDouble());
  return null;
}

/// Shorthand helper function for [BorderRadius.circular].
///
/// Example:
/// ```dart
/// circular(12)
/// radCirc(12)
/// ```
BorderRadius circular(double radius) => BorderRadius.circular(radius);
BorderRadius radCirc(double radius) => BorderRadius.circular(radius);

/// Helper function to create [EdgeInsets.symmetric].
EdgeInsets insetsSym({double h = 0, double v = 0}) =>
    EdgeInsets.symmetric(horizontal: h, vertical: v);

/// Helper function to create [EdgeInsets.all].
EdgeInsets insetsAll(double value) => EdgeInsets.all(value);

/// Helper function to create [EdgeInsets.only].
EdgeInsets insetsOnly({
  double l = 0,
  double t = 0,
  double r = 0,
  double b = 0,
}) =>
    EdgeInsets.only(left: l, top: t, right: r, bottom: b);
