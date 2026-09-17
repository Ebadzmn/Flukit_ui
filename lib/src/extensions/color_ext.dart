import 'package:flutter/material.dart';

/// Extension on [Color] providing rapid opacity, alpha, and shading utilities.
extension FluKitColorExtension on Color {
  /// Sets opacity between 0.0 and 1.0 (with fallback support).
  Color withAlphaOpacity(double opacityValue) {
    return withOpacity(opacityValue.clamp(0.0, 1.0));
  }

  /// Shorthand alias for [withAlphaOpacity].
  Color op(double value) => withAlphaOpacity(value);

  /// Returns dark version of the color by darkening by [factor] (0.0 to 1.0).
  Color darken([double factor = 0.1]) {
    assert(factor >= 0 && factor <= 1);
    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness - factor).clamp(0.0, 1.0));
    return hslDark.toColor();
  }

  /// Returns light version of the color by lightening by [factor] (0.0 to 1.0).
  Color lighten([double factor = 0.1]) {
    assert(factor >= 0 && factor <= 1);
    final hsl = HSLColor.fromColor(this);
    final hslLight = hsl.withLightness((hsl.lightness + factor).clamp(0.0, 1.0));
    return hslLight.toColor();
  }
}
