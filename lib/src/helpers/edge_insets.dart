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
BorderRadius circular(double radius) => BorderRadius.circular(radius);

/// Helper function to create [EdgeInsets.symmetric].
EdgeInsets insetsSymmetric({double horizontal = 0, double vertical = 0}) =>
    EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical);

/// Helper function to create [EdgeInsets.all].
EdgeInsets insetsAll(double value) => EdgeInsets.all(value);

/// Helper function to create [EdgeInsets.only].
EdgeInsets insetsOnly({
  double left = 0,
  double top = 0,
  double right = 0,
  double bottom = 0,
}) =>
    EdgeInsets.only(left: left, top: top, right: right, bottom: bottom);
