import 'package:flutter/material.dart';

/// Lightweight, readable alias for Flutter's [Text].
///
/// Example:
/// ```dart
/// txt(
///   'Hello',
///   fs: 20,
///   fw: bold,
///   cl: black,
///   ta: TextAlign.center,
/// )
/// ```
class txt extends StatelessWidget {
  /// The string data to display.
  final String text;

  /// Font size shorthand
  final double? fontSize;

  /// Font weight shorthand
  final FontWeight? fontWeight;

  /// Color shorthand
  final Color? color;

  /// Font style shorthand (italic / normal)
  final FontStyle? fontStyle;

  /// Text align shorthand
  final TextAlign? textAlign;

  /// Max lines shorthand
  final int? maxLines;

  /// Text overflow shorthand
  final TextOverflow? overflow;

  /// Letter spacing shorthand
  final double? letterSpacing;

  /// Word spacing shorthand
  final double? wordSpacing;

  /// Line height multiplier shorthand
  final double? lineHeight;

  /// Text decoration shorthand (underline, strike-through, etc.)
  final TextDecoration? decoration;

  /// Text decoration color
  final Color? decorationColor;

  /// Font family
  final String? font;

  /// Base or custom TextStyle
  final TextStyle? style;

  /// Soft wrap
  final bool? wrap;

  const txt(
    this.text, {
    super.key,
    double? fs,
    FontWeight? fw,
    Color? cl,
    FontStyle? fst,
    TextAlign? ta,
    int? max,
    TextOverflow? ovf,
    double? ls,
    double? ws,
    double? lh,
    TextDecoration? dec,
    Color? decColor,
    this.font,
    this.style,
    this.wrap,
  })  : fontSize = fs,
        fontWeight = fw,
        color = cl,
        fontStyle = fst,
        textAlign = ta,
        maxLines = max,
        overflow = ovf,
        letterSpacing = ls,
        wordSpacing = ws,
        lineHeight = lh,
        decoration = dec,
        decorationColor = decColor;

  /// Method chaining helper to create a modified [txt] with a new font size.
  txt fs(double size) => _copyWith(fontSize: size);

  /// Method chaining helper for bold text.
  txt bold() => _copyWith(fontWeight: FontWeight.bold);

  /// Method chaining helper for semi-bold text.
  txt semiBold() => _copyWith(fontWeight: FontWeight.w600);

  /// Method chaining helper for medium text.
  txt medium() => _copyWith(fontWeight: FontWeight.w500);

  /// Method chaining helper for light text.
  txt light() => _copyWith(fontWeight: FontWeight.w300);

  /// Method chaining helper for explicit font weight.
  txt fw(FontWeight weight) => _copyWith(fontWeight: weight);

  /// Method chaining helper for color.
  txt cl(Color newColor) => _copyWith(color: newColor);

  /// Method chaining helper for italic text.
  txt italic() => _copyWith(fontStyle: FontStyle.italic);

  /// Method chaining helper for text alignment.
  txt ta(TextAlign alignment) => _copyWith(textAlign: alignment);

  /// Method chaining helper for max lines.
  txt max(int lines) => _copyWith(maxLines: lines);

  /// Method chaining helper for overflow.
  txt ovf(TextOverflow newOverflow) => _copyWith(overflow: newOverflow);

  /// Method chaining helper for line height.
  txt lh(double height) => _copyWith(lineHeight: height);

  /// Method chaining helper for letter spacing.
  txt ls(double spacing) => _copyWith(letterSpacing: spacing);

  /// Method chaining helper for underline decoration.
  txt underline({Color? color}) =>
      _copyWith(decoration: TextDecoration.underline, decorationColor: color);

  /// Method chaining helper for line-through decoration.
  txt lineThrough({Color? color}) =>
      _copyWith(decoration: TextDecoration.lineThrough, decorationColor: color);

  txt _copyWith({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    FontStyle? fontStyle,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    double? letterSpacing,
    double? wordSpacing,
    double? lineHeight,
    TextDecoration? decoration,
    Color? decorationColor,
    String? font,
    TextStyle? style,
    bool? wrap,
  }) {
    return txt(
      text,
      key: key,
      fs: fontSize ?? this.fontSize,
      fw: fontWeight ?? this.fontWeight,
      cl: color ?? this.color,
      fst: fontStyle ?? this.fontStyle,
      ta: textAlign ?? this.textAlign,
      max: maxLines ?? this.maxLines,
      ovf: overflow ?? this.overflow,
      ls: letterSpacing ?? this.letterSpacing,
      ws: wordSpacing ?? this.wordSpacing,
      lh: lineHeight ?? this.lineHeight,
      dec: decoration ?? this.decoration,
      decColor: decorationColor ?? this.decorationColor,
      font: font ?? this.font,
      style: style ?? this.style,
      wrap: wrap ?? this.wrap,
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle effectiveStyle = (style ?? const TextStyle()).copyWith(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontStyle: fontStyle,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      height: lineHeight,
      decoration: decoration,
      decorationColor: decorationColor,
      fontFamily: font,
    );

    return Text(
      text,
      style: effectiveStyle,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: wrap,
    );
  }
}
