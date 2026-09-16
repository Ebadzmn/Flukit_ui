import 'package:flutter/material.dart';

/// Creates a horizontal gap (width spacing) using [SizedBox].
SizedBox hgap(double width) => SizedBox(width: width);

/// Creates a vertical gap (height spacing) using [SizedBox].
SizedBox vgap(double height) => SizedBox(height: height);

/// Intelligent or square gap.
/// If only one argument is provided, creates a square [SizedBox] of (size x size).
/// Can also specify explicit `w` and `h`.
SizedBox gap([double? size, double? h]) {
  if (h != null) {
    return SizedBox(width: size, height: h);
  }
  return SizedBox(width: size, height: size);
}
