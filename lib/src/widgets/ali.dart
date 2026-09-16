import 'package:flutter/material.dart';

/// Lightweight, readable alias for Flutter's [Align].
///
/// Example:
/// ```dart
/// ali(Alignment.topRight, ch: txt('Close'))
/// ```
class ali extends StatelessWidget {
  /// Target alignment
  final AlignmentGeometry alignment;

  /// Child widget
  final Widget? ch;

  /// Width factor
  final double? wFactor;

  /// Height factor
  final double? hFactor;

  const ali(
    this.alignment, {
    super.key,
    this.ch,
    this.wFactor,
    this.hFactor,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      widthFactor: wFactor,
      heightFactor: hFactor,
      child: ch,
    );
  }
}
