import 'package:flutter/material.dart';

/// Shorthand aliases for [MainAxisAlignment].
///
/// Usage:
/// ```dart
/// maa.start
/// maa.center
/// maa.end
/// maa.between
/// maa.around
/// maa.evenly
/// ```
abstract final class maa {
  static const MainAxisAlignment start = MainAxisAlignment.start;
  static const MainAxisAlignment end = MainAxisAlignment.end;
  static const MainAxisAlignment center = MainAxisAlignment.center;
  static const MainAxisAlignment between = MainAxisAlignment.spaceBetween;
  static const MainAxisAlignment around = MainAxisAlignment.spaceAround;
  static const MainAxisAlignment evenly = MainAxisAlignment.spaceEvenly;
}

/// Shorthand aliases for [CrossAxisAlignment].
///
/// Usage:
/// ```dart
/// caa.start
/// caa.center
/// caa.end
/// caa.stretch
/// caa.baseline
/// ```
abstract final class caa {
  static const CrossAxisAlignment start = CrossAxisAlignment.start;
  static const CrossAxisAlignment end = CrossAxisAlignment.end;
  static const CrossAxisAlignment center = CrossAxisAlignment.center;
  static const CrossAxisAlignment stretch = CrossAxisAlignment.stretch;
  static const CrossAxisAlignment baseline = CrossAxisAlignment.baseline;
}

/// Global convenience shortcuts for commonly used alignments.
const MainAxisAlignment spaceBetween = MainAxisAlignment.spaceBetween;
const MainAxisAlignment spaceAround = MainAxisAlignment.spaceAround;
const MainAxisAlignment spaceEvenly = MainAxisAlignment.spaceEvenly;
const CrossAxisAlignment stretch = CrossAxisAlignment.stretch;
