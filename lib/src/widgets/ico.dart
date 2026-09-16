import 'package:flutter/material.dart';

/// Lightweight, readable alias for Flutter's [Icon].
///
/// Example:
/// ```dart
/// ico(Icons.home, sz: 24, cl: black)
/// ```
class ico extends StatelessWidget {
  /// Icon data
  final IconData? icon;

  /// Icon size
  final double? sz;

  /// Icon color
  final Color? cl;

  /// Semantic label
  final String? semanticLabel;

  /// Text direction
  final TextDirection? textDirection;

  const ico(
    this.icon, {
    super.key,
    this.sz,
    this.cl,
    this.semanticLabel,
    this.textDirection,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: sz,
      color: cl,
      semanticLabel: semanticLabel,
      textDirection: textDirection,
    );
  }
}
