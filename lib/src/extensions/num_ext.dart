import 'package:flutter/material.dart';

/// Extension on numeric values ([num], [int], [double]) to create spacing, insets, radius, and duration effortlessly.
extension FluKitNumExtension on num {
  // ==========================================
  // SPACING EXTENSIONS
  // ==========================================

  /// Creates a vertical [SizedBox] with `height = this`.
  SizedBox get height => SizedBox(height: toDouble());

  /// Short alias for [height].
  SizedBox get h => height;

  /// Creates a horizontal [SizedBox] with `width = this`.
  SizedBox get width => SizedBox(width: toDouble());

  /// Short alias for [width].
  SizedBox get w => width;

  /// Creates a square [SizedBox] of `(this x this)`.
  SizedBox get gap => SizedBox(width: toDouble(), height: toDouble());

  // ==========================================
  // RADIUS EXTENSIONS
  // ==========================================

  /// Creates a [BorderRadius.circular(this)].
  BorderRadius get radius => BorderRadius.circular(toDouble());

  /// Creates a [Radius.circular(this)].
  Radius get circularRadius => Radius.circular(toDouble());

  // ==========================================
  // PADDING / INSETS EXTENSIONS
  // ==========================================

  /// Creates an [EdgeInsets.all(this)].
  EdgeInsets get padAll => EdgeInsets.all(toDouble());

  /// Creates an [EdgeInsets.symmetric(horizontal: this)].
  EdgeInsets get padX => EdgeInsets.symmetric(horizontal: toDouble());

  /// Creates an [EdgeInsets.symmetric(vertical: this)].
  EdgeInsets get padY => EdgeInsets.symmetric(vertical: toDouble());

  /// Creates an [EdgeInsets.only(top: this)].
  EdgeInsets get padTop => EdgeInsets.only(top: toDouble());

  /// Creates an [EdgeInsets.only(bottom: this)].
  EdgeInsets get padBottom => EdgeInsets.only(bottom: toDouble());

  /// Creates an [EdgeInsets.only(left: this)].
  EdgeInsets get padLeft => EdgeInsets.only(left: toDouble());

  /// Creates an [EdgeInsets.only(right: this)].
  EdgeInsets get padRight => EdgeInsets.only(right: toDouble());

  // ==========================================
  // DURATION EXTENSIONS
  // ==========================================

  /// Creates a [Duration] in milliseconds.
  Duration get ms => Duration(milliseconds: toInt());

  /// Creates a [Duration] in milliseconds.
  Duration get milliseconds => Duration(milliseconds: toInt());

  /// Creates a [Duration] in seconds.
  Duration get seconds => Duration(seconds: toInt());

  /// Creates a [Duration] in minutes.
  Duration get minutes => Duration(minutes: toInt());

  /// Creates a [Duration] in hours.
  Duration get hours => Duration(hours: toInt());

  /// Creates a [Duration] in days.
  Duration get days => Duration(days: toInt());
}
