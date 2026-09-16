import 'package:flutter/material.dart';

/// Extension on [num] to provide instantaneous spacing and radius helpers.
///
/// Example:
/// ```dart
/// 16.gap   // SizedBox(width: 16, height: 16)
/// 16.vgap  // SizedBox(height: 16)
/// 16.hgap  // SizedBox(width: 16)
/// 12.rad   // BorderRadius.circular(12)
/// 16.pad   // EdgeInsets.all(16)
/// ```
extension FlutterXNumExtension on num {
  /// Creates a square [SizedBox] of (this x this).
  SizedBox get gap => SizedBox(width: toDouble(), height: toDouble());

  /// Creates a vertical [SizedBox] of (height: this).
  SizedBox get vgap => SizedBox(height: toDouble());

  /// Creates a horizontal [SizedBox] of (width: this).
  SizedBox get hgap => SizedBox(width: toDouble());

  /// Creates a [BorderRadius.circular(this)].
  BorderRadius get rad => BorderRadius.circular(toDouble());

  /// Creates an [EdgeInsets.all(this)].
  EdgeInsets get pad => EdgeInsets.all(toDouble());

  /// Creates an [EdgeInsets.symmetric(horizontal: this)].
  EdgeInsets get px => EdgeInsets.symmetric(horizontal: toDouble());

  /// Creates an [EdgeInsets.symmetric(vertical: this)].
  EdgeInsets get py => EdgeInsets.symmetric(vertical: toDouble());
}
