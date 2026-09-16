import 'package:flutter/material.dart';

/// Extension on [Color] providing rapid opacity, alpha, and contrast utilities.
/// Compatible with both Flutter 3.27+ `withValues` and earlier versions.
extension FlutterXColorExtension on Color {
  /// Shorthand to adjust opacity/alpha using a value between 0.0 and 1.0.
  ///
  /// Example:
  /// ```dart
  /// white.op(0.2)
  /// Colors.black.op(0.5)
  /// ```
  Color op(double opacity) {
    return withValues(alpha: opacity.clamp(0.0, 1.0));
  }

  /// Shorthand alias for `.op(alpha)`.
  Color alpha(double alphaValue) => op(alphaValue);
}
