import 'package:flutter/material.dart';

/// Extension on [List<Widget>] providing automatic spacing and separation.
extension FluKitWidgetListExtension on List<Widget> {
  /// Inserts a [gap] sized [SizedBox] between each widget in this list.
  /// Works for both [Column] and [Row].
  List<Widget> gap(double spacing) {
    if (isEmpty) return [];
    if (length == 1) return toList();

    final result = <Widget>[];
    for (int i = 0; i < length; i++) {
      result.add(this[i]);
      if (i < length - 1) {
        result.add(SizedBox(width: spacing, height: spacing));
      }
    }
    return result;
  }

  /// Inserts a custom [separator] widget between each widget in this list.
  List<Widget> separatedBy(Widget separator) {
    if (isEmpty) return [];
    if (length == 1) return toList();

    final result = <Widget>[];
    for (int i = 0; i < length; i++) {
      result.add(this[i]);
      if (i < length - 1) {
        result.add(separator);
      }
    }
    return result;
  }

  /// Wraps this list in a [Column].
  Column toColumn({
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    double? gap,
  }) {
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      children: gap != null ? this.gap(gap) : this,
    );
  }

  /// Wraps this list in a [Row].
  Row toRow({
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    double? gap,
  }) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      children: gap != null ? this.gap(gap) : this,
    );
  }
}
