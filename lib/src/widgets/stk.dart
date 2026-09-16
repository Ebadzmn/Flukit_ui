import 'package:flutter/material.dart';

/// Lightweight, readable alias for Flutter's [Stack].
///
/// Example:
/// ```dart
/// stk(
///   ch: [
///     img.asset('bg.png'),
///     ctr(ch: txt('Overlay')),
///   ],
///   ali: AlignmentDirectional.topStart,
/// )
/// ```
class stk extends StatelessWidget {
  /// Children widgets
  final List<Widget> ch;

  /// Alignment of unpositioned or partially positioned children
  final AlignmentGeometry ali;

  /// Text direction
  final TextDirection? textDirection;

  /// Stack fit
  final StackFit fit;

  /// Clip behavior
  final Clip clip;

  const stk({
    super.key,
    required this.ch,
    this.ali = AlignmentDirectional.topStart,
    this.textDirection,
    this.fit = StackFit.loose,
    this.clip = Clip.hardEdge,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: ali,
      textDirection: textDirection,
      fit: fit,
      clipBehavior: clip,
      children: ch,
    );
  }
}
