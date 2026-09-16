import 'package:flutter/material.dart';

/// Lightweight, readable alias for Flutter's [Flexible].
///
/// Example:
/// ```dart
/// flx(ch: txt('Flexible item'))
/// ```
class flx extends StatelessWidget {
  /// Flex factor
  final int flex;

  /// Flex fit behavior
  final FlexFit fit;

  /// Child widget
  final Widget ch;

  const flx({
    super.key,
    this.flex = 1,
    this.fit = FlexFit.loose,
    required this.ch,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: flex,
      fit: fit,
      child: ch,
    );
  }
}
