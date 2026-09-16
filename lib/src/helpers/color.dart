import 'package:flutter/material.dart';

/// Converts a hex string color representation to a Flutter [Color].
///
/// Supports:
/// - 3-digit RGB (e.g., `#FFF`, `FFF`)
/// - 6-digit RRGGBB (e.g., `#121212`, `121212`)
/// - 8-digit AARRGGBB (e.g., `#FF121212`, `FF121212`)
///
/// Optionally takes an [alpha] override between `0.0` and `1.0`.
Color hex(String hexCode, {double? alpha}) {
  String clean = hexCode.replaceAll('#', '').trim();

  if (clean.length == 3) {
    clean = clean.split('').map((c) => '$c$c').join();
  }

  if (clean.length == 6) {
    clean = 'FF$clean';
  }

  final int? val = int.tryParse(clean, radix: 16);
  if (val == null) {
    return Colors.black;
  }

  final Color color = Color(val);
  if (alpha != null) {
    return color.withOpacity(alpha.clamp(0.0, 1.0));
  }
  return color;
}
