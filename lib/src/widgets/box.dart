import 'package:flutter/material.dart';

/// Lightweight, readable alias for Flutter's [SizedBox].
///
/// Example:
/// ```dart
/// box(w: 100, h: 50, ch: txt('Inside box'))
/// box.square(50)
/// box.shrink()
/// box.expand()
/// ```
class box extends StatelessWidget {
  /// Width
  final double? w;

  /// Height
  final double? h;

  /// Child widget
  final Widget? ch;

  const box({
    super.key,
    this.w,
    this.h,
    this.ch,
  });

  /// Creates a square box with equal width and height.
  const box.square(
    double dimension, {
    super.key,
    this.ch,
  })  : w = dimension,
        h = dimension;

  /// Creates a zero-size box.
  const box.shrink({super.key, this.ch})
      : w = 0.0,
        h = 0.0;

  /// Creates a box expanding to maximum constraints.
  const box.expand({super.key, this.ch})
      : w = double.infinity,
        h = double.infinity;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: w,
      height: h,
      child: ch,
    );
  }
}
