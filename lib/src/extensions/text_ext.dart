import 'package:flutter/material.dart';

/// Fluent extension methods on standard Flutter [Text] widgets.
extension FluKitTextExtension on Text {
  /// Internal helper to copy the text with an updated [TextStyle].
  Text _copyWithStyle(TextStyle Function(TextStyle base) update) {
    final currentStyle = style ?? const TextStyle();
    return Text(
      data ?? '',
      key: key,
      style: update(currentStyle),
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
      selectionColor: selectionColor,
    );
  }

  /// Sets the font size.
  Text size(double fontSize) =>
      _copyWithStyle((base) => base.copyWith(fontSize: fontSize));

  /// Alias for [size].
  Text fontSize(double fontSize) => size(fontSize);

  /// Sets the text color.
  Text color(Color color) =>
      _copyWithStyle((base) => base.copyWith(color: color));

  /// Sets the font weight.
  Text weight(FontWeight weight) =>
      _copyWithStyle((base) => base.copyWith(fontWeight: weight));

  /// Sets bold font weight ([FontWeight.bold] / w700).
  Text bold() => weight(FontWeight.bold);

  /// Sets semi-bold font weight ([FontWeight.w600]).
  Text semiBold() => weight(FontWeight.w600);

  /// Sets medium font weight ([FontWeight.w500]).
  Text medium() => weight(FontWeight.w500);

  /// Sets normal font weight ([FontWeight.normal] / w400).
  Text normal() => weight(FontWeight.normal);

  /// Sets light font weight ([FontWeight.w300]).
  Text light() => weight(FontWeight.w300);

  /// Sets thin font weight ([FontWeight.w100]).
  Text thin() => weight(FontWeight.w100);

  /// Sets black/heavy font weight ([FontWeight.w900]).
  Text blackWeight() => weight(FontWeight.w900);

  /// Sets italic font style.
  Text italic() =>
      _copyWithStyle((base) => base.copyWith(fontStyle: FontStyle.italic));

  /// Sets underline decoration.
  Text underline({Color? color, TextDecorationStyle? style, double? thickness}) =>
      _copyWithStyle((base) => base.copyWith(
            decoration: TextDecoration.underline,
            decorationColor: color,
            decorationStyle: style,
            decorationThickness: thickness,
          ));

  /// Sets line-through / strikethrough decoration.
  Text lineThrough({Color? color, TextDecorationStyle? style, double? thickness}) =>
      _copyWithStyle((base) => base.copyWith(
            decoration: TextDecoration.lineThrough,
            decorationColor: color,
            decorationStyle: style,
            decorationThickness: thickness,
          ));

  /// Sets letter spacing.
  Text letterSpacing(double spacing) =>
      _copyWithStyle((base) => base.copyWith(letterSpacing: spacing));

  /// Sets word spacing.
  Text wordSpacing(double spacing) =>
      _copyWithStyle((base) => base.copyWith(wordSpacing: spacing));

  /// Sets line height multiplier.
  Text lineHeight(double height) =>
      _copyWithStyle((base) => base.copyWith(height: height));

  /// Sets custom font family.
  Text fontFamily(String family) =>
      _copyWithStyle((base) => base.copyWith(fontFamily: family));

  /// Sets text shadows.
  Text shadows(List<Shadow> shadows) =>
      _copyWithStyle((base) => base.copyWith(shadows: shadows));

  /// Sets a single shadow.
  Text shadow({
    Color color = const Color(0x33000000),
    double blurRadius = 4.0,
    Offset offset = const Offset(0, 2),
  }) =>
      shadows([
        Shadow(
          color: color,
          blurRadius: blurRadius,
          offset: offset,
        )
      ]);

  /// Sets text alignment to [TextAlign.center].
  Text alignCenter() => _copyWith(textAlign: TextAlign.center);

  /// Sets text alignment to [TextAlign.left] (or start).
  Text alignLeft() => _copyWith(textAlign: TextAlign.left);

  /// Sets text alignment to [TextAlign.right] (or end).
  Text alignRight() => _copyWith(textAlign: TextAlign.right);

  /// Sets text alignment to [TextAlign.justify].
  Text alignJustify() => _copyWith(textAlign: TextAlign.justify);

  /// Sets maximum lines and text overflow behavior.
  Text maxLine(int lines, {TextOverflow overflow = TextOverflow.ellipsis}) =>
      _copyWith(maxLines: lines, overflow: overflow);

  /// Sets text overflow to [TextOverflow.ellipsis].
  Text ellipsis() => _copyWith(overflow: TextOverflow.ellipsis);

  /// Internal helper to copy Text properties.
  Text _copyWith({
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return Text(
      data ?? '',
      key: key,
      style: style,
      strutStyle: strutStyle,
      textAlign: textAlign ?? this.textAlign,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      overflow: overflow ?? this.overflow,
      textScaler: textScaler,
      maxLines: maxLines ?? this.maxLines,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      selectionColor: selectionColor,
    );
  }
}
