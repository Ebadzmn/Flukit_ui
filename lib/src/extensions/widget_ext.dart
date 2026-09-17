import 'package:flutter/material.dart';

/// Fluent extension methods on any standard Flutter [Widget].
extension FluKitWidgetExtension on Widget {
  // ==========================================
  // PADDING EXTENSIONS
  // ==========================================

  /// Wraps widget with [Padding] on all sides.
  Widget paddingAll(double value) =>
      Padding(padding: EdgeInsets.all(value), child: this);

  /// Wraps widget with symmetric [Padding].
  Widget paddingSymmetric({double horizontal = 0, double vertical = 0}) =>
      Padding(
        padding: EdgeInsets.symmetric(
            horizontal: horizontal, vertical: vertical),
        child: this,
      );

  /// Wraps widget with directional [Padding].
  Widget paddingOnly({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) =>
      Padding(
        padding: EdgeInsets.only(
          left: left,
          top: top,
          right: right,
          bottom: bottom,
        ),
        child: this,
      );

  /// Shorthand alias for padding from [EdgeInsetsGeometry].
  Widget padding(EdgeInsetsGeometry insets) =>
      Padding(padding: insets, child: this);

  /// Shorthand padding on all sides.
  Widget pad(double value) => paddingAll(value);

  /// Shorthand horizontal padding.
  Widget padX(double value) => paddingSymmetric(horizontal: value);

  /// Shorthand vertical padding.
  Widget padY(double value) => paddingSymmetric(vertical: value);

  /// Shorthand padding for X and Y.
  Widget padXY(double horizontal, double vertical) =>
      paddingSymmetric(horizontal: horizontal, vertical: vertical);

  // ==========================================
  // ALIGNMENT & POSITIONING
  // ==========================================

  /// Wraps widget with [Center].
  Widget center() => Center(child: this);

  /// Wraps widget with [Align].
  Widget align(Alignment alignment) =>
      Align(alignment: alignment, child: this);

  /// Aligns widget to top center.
  Widget alignTop() => align(Alignment.topCenter);

  /// Aligns widget to bottom center.
  Widget alignBottom() => align(Alignment.bottomCenter);

  /// Aligns widget to left/center-left.
  Widget alignLeft() => align(Alignment.centerLeft);

  /// Aligns widget to right/center-right.
  Widget alignRight() => align(Alignment.centerRight);

  /// Aligns widget to top left.
  Widget alignTopLeft() => align(Alignment.topLeft);

  /// Aligns widget to top right.
  Widget alignTopRight() => align(Alignment.topRight);

  /// Aligns widget to bottom left.
  Widget alignBottomLeft() => align(Alignment.bottomLeft);

  /// Aligns widget to bottom right.
  Widget alignBottomRight() => align(Alignment.bottomRight);

  // ==========================================
  // FLEXIBLE & EXPANDED
  // ==========================================

  /// Wraps widget with [Expanded].
  Widget expanded([int flex = 1]) => Expanded(flex: flex, child: this);

  /// Wraps widget with [Flexible].
  Widget flexible([int flex = 1, FlexFit fit = FlexFit.loose]) =>
      Flexible(flex: flex, fit: fit, child: this);

  // ==========================================
  // SIZING & CONSTRAINTS
  // ==========================================

  /// Wraps widget with a [SizedBox] of specified width and/or height.
  Widget size({double? width, double? height}) =>
      SizedBox(width: width, height: height, child: this);

  /// Wraps widget with [SizedBox] with fixed width.
  Widget width(double width) => SizedBox(width: width, child: this);

  /// Wraps widget with [SizedBox] with fixed height.
  Widget height(double height) => SizedBox(height: height, child: this);

  /// Wraps widget in a square [SizedBox].
  Widget square(double dimension) =>
      SizedBox(width: dimension, height: dimension, child: this);

  // ==========================================
  // CLIPPING, RADIUS & SHAPE
  // ==========================================

  /// Wraps widget with [ClipRRect] with rounded corners.
  Widget rounded(double radius) => ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: this,
      );

  /// Wraps widget with [ClipRRect] with custom [BorderRadius].
  Widget clipRadius(BorderRadius borderRadius) => ClipRRect(
        borderRadius: borderRadius,
        child: this,
      );

  /// Wraps widget with [ClipOval] to make it circular or oval.
  Widget circle() => ClipOval(child: this);

  // ==========================================
  // GESTURES & INTERACTION
  // ==========================================

  /// Wraps widget with [InkWell] and Material container for instant touch interaction.
  Widget onTap(
    VoidCallback? onTap, {
    double? radius,
    BorderRadius? borderRadius,
    Color? splashColor,
    Color? highlightColor,
  }) {
    if (onTap == null) return this;
    final r = borderRadius ?? (radius != null ? BorderRadius.circular(radius) : null);
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: r,
        splashColor: splashColor,
        highlightColor: highlightColor,
        child: this,
      ),
    );
  }

  /// Wraps widget with [GestureDetector] for flexible gestures.
  Widget onGesture({
    VoidCallback? onTap,
    VoidCallback? onDoubleTap,
    VoidCallback? onLongPress,
    HitTestBehavior behavior = HitTestBehavior.opaque,
  }) {
    return GestureDetector(
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      onLongPress: onLongPress,
      behavior: behavior,
      child: this,
    );
  }

  // ==========================================
  // OPACITY & VISIBILITY
  // ==========================================

  /// Wraps widget with [Opacity].
  Widget opacity(double opacity) => Opacity(opacity: opacity, child: this);

  /// Conditionally displays the widget. When [condition] is false, displays [replacement] or empty [SizedBox.shrink].
  Widget visible(bool condition, {Widget? replacement}) {
    return condition ? this : (replacement ?? const SizedBox.shrink());
  }

  // ==========================================
  // SCROLLING & UTILITIES
  // ==========================================

  /// Wraps widget in a [SingleChildScrollView].
  Widget scrollable({
    Axis scrollDirection = Axis.vertical,
    ScrollPhysics? physics,
    EdgeInsetsGeometry? padding,
  }) {
    return SingleChildScrollView(
      scrollDirection: scrollDirection,
      physics: physics,
      padding: padding,
      child: this,
    );
  }

  /// Wraps widget with [SafeArea].
  Widget safeArea({
    bool left = true,
    bool top = true,
    bool right = true,
    bool bottom = true,
  }) {
    return SafeArea(
      left: left,
      top: top,
      right: right,
      bottom: bottom,
      child: this,
    );
  }

  /// Wraps widget with [Card].
  Widget card({
    Color? color,
    double? elevation,
    ShapeBorder? shape,
    EdgeInsetsGeometry? margin,
    Clip clipBehavior = Clip.antiAlias,
  }) {
    return Card(
      color: color,
      elevation: elevation,
      shape: shape,
      margin: margin,
      clipBehavior: clipBehavior,
      child: this,
    );
  }
}
