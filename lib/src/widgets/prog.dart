import 'package:flutter/material.dart';

/// Lightweight, readable alias for Flutter's [LinearProgressIndicator].
///
/// Example:
/// ```dart
/// lprog(0.65, h: 8, bg: white.op(0.2), cl: white, rad: 8)
/// ```
class lprog extends StatelessWidget {
  /// Progress value between `0.0` and `1.0`. If null, shows indeterminate animation.
  final double? val;

  /// Height of the progress bar (alias for minHeight).
  final double h;

  /// Background color of the track.
  final Color? bg;

  /// Active indicator color.
  final Color? cl;

  /// Corner radius for clipping the progress bar.
  final double? rad;

  const lprog(
    this.val, {
    super.key,
    this.h = 4.0,
    this.bg,
    this.cl,
    this.rad,
  });

  @override
  Widget build(BuildContext context) {
    Widget indicator = LinearProgressIndicator(
      value: val,
      minHeight: h,
      backgroundColor: bg,
      valueColor: cl != null ? AlwaysStoppedAnimation<Color>(cl!) : null,
    );

    if (rad != null && rad! > 0) {
      indicator = ClipRRect(
        borderRadius: BorderRadius.circular(rad!),
        child: indicator,
      );
    }

    return indicator;
  }
}
