import 'package:flutter/material.dart';

/// Lightweight, readable alias for Flutter's [Center].
///
/// Example:
/// ```dart
/// ctr(ch: txt('Centered text'))
/// ```
class ctr extends StatelessWidget {
  /// The child widget.
  final Widget? ch;

  /// Width factor
  final double? wFactor;

  /// Height factor
  final double? hFactor;

  const ctr({
    super.key,
    this.ch,
    this.wFactor,
    this.hFactor,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      widthFactor: wFactor,
      heightFactor: hFactor,
      child: ch,
    );
  }
}
