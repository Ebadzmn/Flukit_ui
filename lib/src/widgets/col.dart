import 'package:flutter/material.dart';

/// Lightweight, readable alias for Flutter's [Column].
///
/// Example:
/// ```dart
/// col(
///   ch: [
///     txt('Hello'),
///     txt('World'),
///   ],
///   main: MainAxisAlignment.center,
///   cross: CrossAxisAlignment.start,
/// )
/// ```
class col extends StatelessWidget {
  /// Children widgets
  final List<Widget> ch;

  /// Main axis alignment
  final MainAxisAlignment main;

  /// Cross axis alignment
  final CrossAxisAlignment cross;

  /// Main axis size
  final MainAxisSize mainSize;

  /// Text direction
  final TextDirection? textDirection;

  /// Vertical direction
  final VerticalDirection verticalDirection;

  /// Text baseline
  final TextBaseline? textBaseline;

  const col({
    super.key,
    required this.ch,
    this.main = MainAxisAlignment.start,
    this.cross = CrossAxisAlignment.center,
    this.mainSize = MainAxisSize.max,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: main,
      crossAxisAlignment: cross,
      mainAxisSize: mainSize,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
      children: ch,
    );
  }
}
