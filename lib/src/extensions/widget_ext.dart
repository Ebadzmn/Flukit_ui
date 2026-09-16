import 'package:flutter/material.dart';

/// Extension on [Widget] providing rapid layout & styling composition.
extension FlutterXWidgetExtension on Widget {
  /// Wraps with [Padding]. Supports `double`, `int`, or [EdgeInsetsGeometry].
  Widget pad(dynamic value) {
    if (value is EdgeInsetsGeometry) {
      return Padding(padding: value, child: this);
    }
    if (value is num) {
      return Padding(padding: EdgeInsets.all(value.toDouble()), child: this);
    }
    return this;
  }

  /// Horizontal padding shorthand
  Widget px(double value) =>
      Padding(padding: EdgeInsets.symmetric(horizontal: value), child: this);

  /// Vertical padding shorthand
  Widget py(double value) =>
      Padding(padding: EdgeInsets.symmetric(vertical: value), child: this);

  /// Top padding shorthand
  Widget pt(double value) =>
      Padding(padding: EdgeInsets.only(top: value), child: this);

  /// Bottom padding shorthand
  Widget pb(double value) =>
      Padding(padding: EdgeInsets.only(bottom: value), child: this);

  /// Left padding shorthand
  Widget pl(double value) =>
      Padding(padding: EdgeInsets.only(left: value), child: this);

  /// Right padding shorthand
  Widget pr(double value) =>
      Padding(padding: EdgeInsets.only(right: value), child: this);

  /// Wraps with [Center].
  Widget center() => Center(child: this);

  /// Wraps with [Align].
  Widget align(AlignmentGeometry alignment) =>
      Align(alignment: alignment, child: this);

  /// Wraps with [Expanded].
  Widget expanded({int flex = 1}) => Expanded(flex: flex, child: this);

  /// Wraps with [Flexible].
  Widget flexible({int flex = 1, FlexFit fit = FlexFit.loose}) =>
      Flexible(flex: flex, fit: fit, child: this);

  /// Wraps with [Opacity].
  Widget opacity(double opacity) => Opacity(opacity: opacity, child: this);

  /// Wraps with [SizedBox].
  Widget sz({double? w, double? h}) =>
      SizedBox(width: w, height: h, child: this);

  /// Wraps with [SizedBox.square].
  Widget sq(double dimension) =>
      SizedBox(width: dimension, height: dimension, child: this);

  /// Wraps with [ClipRRect].
  Widget clipR(double radius) => ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: this,
      );

  /// Wraps with [InkWell] providing instantaneous tap interaction and splash effect.
  ///
  /// Example:
  /// ```dart
  /// txt('Click').onTap(() => print('tapped'), rad: 8)
  /// ```
  Widget onTap(VoidCallback? onTap, {dynamic rad}) {
    if (onTap == null) return this;
    final BorderRadius? resolvedRadius = (rad != null)
        ? (rad is BorderRadius
            ? rad
            : (rad is num ? BorderRadius.circular(rad.toDouble()) : null))
        : null;

    return InkWell(
      onTap: onTap,
      borderRadius: resolvedRadius,
      child: this,
    );
  }

  /// Shorthand alias for [onTap].
  Widget ink(VoidCallback? onTap, {dynamic rad}) => this.onTap(onTap, rad: rad);

  /// Wraps with [SafeArea].
  Widget safeArea({
    bool left = true,
    bool top = true,
    bool right = true,
    bool bottom = true,
  }) =>
      SafeArea(
        left: left,
        top: top,
        right: right,
        bottom: bottom,
        child: this,
      );
}
