import 'package:flutter/material.dart';

/// Lightweight, readable alias for Flutter's [Expanded].
///
/// Example:
/// ```dart
/// exp(ch: txt('Fills remaining space'))
/// ```
class exp extends StatelessWidget {
  /// Flex factor
  final int flex;

  /// Child widget
  final Widget ch;

  const exp({
    super.key,
    this.flex = 1,
    required this.ch,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: ch,
    );
  }
}
