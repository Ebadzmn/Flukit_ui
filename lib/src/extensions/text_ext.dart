import 'package:flutter/material.dart';

/// Extension on standard Flutter [Text] for easy styling chaining.
extension FlutterXStandardTextExtension on Text {
  /// Copy with updated font size
  Text fs(double size) => Text(
        data ?? '',
        key: key,
        style: (style ?? const TextStyle()).copyWith(fontSize: size),
        strutStyle: strutStyle,
        textAlign: textAlign,
        textDirection: textDirection,
        locale: locale,
        softWrap: softWrap,
        overflow: overflow,
        textScaler: textScaler,
        maxLines: maxLines,
        semanticsLabel: semanticsLabel,
        textWidthBasis: textWidthBasis,
        textHeightBehavior: textHeightBehavior,
      );

  /// Shorthand for bold text
  Text bold() => Text(
        data ?? '',
        key: key,
        style:
            (style ?? const TextStyle()).copyWith(fontWeight: FontWeight.bold),
        strutStyle: strutStyle,
        textAlign: textAlign,
        textDirection: textDirection,
        locale: locale,
        softWrap: softWrap,
        overflow: overflow,
        textScaler: textScaler,
        maxLines: maxLines,
        semanticsLabel: semanticsLabel,
        textWidthBasis: textWidthBasis,
        textHeightBehavior: textHeightBehavior,
      );

  /// Shorthand for color change
  Text cl(Color color) => Text(
        data ?? '',
        key: key,
        style: (style ?? const TextStyle()).copyWith(color: color),
        strutStyle: strutStyle,
        textAlign: textAlign,
        textDirection: textDirection,
        locale: locale,
        softWrap: softWrap,
        overflow: overflow,
        textScaler: textScaler,
        maxLines: maxLines,
        semanticsLabel: semanticsLabel,
        textWidthBasis: textWidthBasis,
        textHeightBehavior: textHeightBehavior,
      );
}
