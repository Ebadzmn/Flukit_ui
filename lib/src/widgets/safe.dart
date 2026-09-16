import 'package:flutter/material.dart';

/// Lightweight, readable alias for Flutter's [SafeArea].
///
/// Example:
/// ```dart
/// safe(ch: scaf(body: ...))
/// ```
class safe extends StatelessWidget {
  /// Child widget
  final Widget ch;

  /// Inset top
  final bool top;

  /// Inset bottom
  final bool bottom;

  /// Inset left
  final bool left;

  /// Inset right
  final bool right;

  /// Minimum padding
  final EdgeInsets minimum;

  /// Maintain bottom view padding
  final bool maintainBottomViewPadding;

  const safe({
    super.key,
    required this.ch,
    this.left = true,
    this.top = true,
    this.right = true,
    this.bottom = true,
    this.minimum = EdgeInsets.zero,
    this.maintainBottomViewPadding = false,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      left: left,
      top: top,
      right: right,
      bottom: bottom,
      minimum: minimum,
      maintainBottomViewPadding: maintainBottomViewPadding,
      child: ch,
    );
  }
}
