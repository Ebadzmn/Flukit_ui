import 'package:flutter/material.dart';
import '../helpers/edge_insets.dart';

/// Lightweight, readable alias for Flutter's [Padding].
///
/// Example:
/// ```dart
/// pad(16, ch: txt('Hello'))
/// pad.all(16, ch: txt('Hello'))
/// pad.sym(h: 16, v: 8, ch: txt('Hello'))
/// pad.only(l: 10, ch: txt('Hello'))
/// ```
class pad extends StatelessWidget {
  /// The padding value. Can be a [num] (all sides) or [EdgeInsetsGeometry].
  final dynamic padding;

  /// Child widget.
  final Widget ch;

  const pad(
    this.padding, {
    super.key,
    required this.ch,
  });

  /// Shorthand for all sides
  pad.all(
    double value, {
    super.key,
    required this.ch,
  }) : padding = EdgeInsets.all(value);

  /// Shorthand for horizontal & vertical symmetric padding
  pad.sym({
    super.key,
    double h = 0.0,
    double v = 0.0,
    required this.ch,
  }) : padding = EdgeInsets.symmetric(horizontal: h, vertical: v);

  /// Shorthand for directional only padding
  pad.only({
    super.key,
    double l = 0.0,
    double t = 0.0,
    double r = 0.0,
    double b = 0.0,
    required this.ch,
  }) : padding = EdgeInsets.only(left: l, top: t, right: r, bottom: b);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: resolveInsets(padding) ?? EdgeInsets.zero,
      child: ch,
    );
  }
}
