import 'package:flutter/material.dart';
import 'txt.dart';
import 'ico.dart';

enum _BtnVariant { elevated, outlined, text }

/// Lightweight, readable alias for Flutter's [ElevatedButton], [OutlinedButton], and [TextButton].
///
/// Examples:
/// ```dart
/// btn('Save', onTap: () {}, bg: hex('#4F46E5'), fg: white, rad: 10)
/// btn.icon(icon: Icons.add, label: 'Create', onTap: () {}, bg: hex('#4F46E5'))
/// btn.outline('Cancel', onTap: () {}, cl: grey700)
/// btn.text('Forgot Password?', onTap: () {})
/// ```
class btn extends StatelessWidget {
  /// Button child widget or text label
  final dynamic label;

  /// Optional icon data or widget
  final dynamic icon;

  /// Tap callback shorthand
  final VoidCallback? onTap;

  /// Background color shorthand
  final Color? bg;

  /// Foreground / Text / Icon color shorthand
  final Color? fg;

  /// Corner radius shorthand
  final double? rad;

  /// Horizontal padding shorthand
  final double? px;

  /// Vertical padding shorthand
  final double? py;

  /// Elevation shorthand
  final double? el;

  /// Border color for outline buttons
  final Color? bc;

  /// Variant type
  final _BtnVariant _variant;

  const btn(
    this.label, {
    super.key,
    this.onTap,
    this.bg,
    this.fg,
    this.rad,
    this.px,
    this.py,
    this.el,
    this.bc,
  })  : icon = null,
        _variant = _BtnVariant.elevated;

  /// Creates a button with an icon.
  const btn.icon({
    super.key,
    required this.icon,
    required this.label,
    this.onTap,
    this.bg,
    this.fg,
    this.rad,
    this.px,
    this.py,
    this.el,
    this.bc,
  }) : _variant = _BtnVariant.elevated;

  /// Creates an outlined button with thin border.
  const btn.outline(
    this.label, {
    super.key,
    this.icon,
    this.onTap,
    this.bg,
    this.fg,
    this.rad,
    this.px,
    this.py,
    this.bc,
  })  : el = 0,
        _variant = _BtnVariant.outlined;

  /// Creates a plain text button.
  const btn.text(
    this.label, {
    super.key,
    this.icon,
    this.onTap,
    this.fg,
    this.px,
    this.py,
  })  : bg = null,
        rad = null,
        el = 0,
        bc = null,
        _variant = _BtnVariant.text;

  Widget _resolveChild(Widget fallback) {
    if (label is Widget) return label as Widget;
    if (label is String) {
      return txt(label as String, fw: FontWeight.w600, cl: fg);
    }
    return fallback;
  }

  Widget? _resolveIcon() {
    if (icon == null) return null;
    if (icon is Widget) return icon as Widget;
    if (icon is IconData) return ico(icon as IconData, sz: 18, cl: fg);
    return null;
  }

  ButtonStyle _resolveStyle() {
    final shape = rad != null
        ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(rad!))
        : null;

    final EdgeInsetsGeometry? padding = (px != null || py != null)
        ? EdgeInsets.symmetric(horizontal: px ?? 16.0, vertical: py ?? 10.0)
        : null;

    final BorderSide? side =
        bc != null ? BorderSide(color: bc!, width: 1) : null;

    switch (_variant) {
      case _BtnVariant.elevated:
        return ElevatedButton.styleFrom(
          backgroundColor: bg,
          foregroundColor: fg,
          elevation: el,
          shape: shape,
          padding: padding,
        );
      case _BtnVariant.outlined:
        return OutlinedButton.styleFrom(
          backgroundColor: bg,
          foregroundColor: fg,
          side: side,
          shape: shape,
          padding: padding,
        );
      case _BtnVariant.text:
        return TextButton.styleFrom(
          foregroundColor: fg,
          padding: padding,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final style = _resolveStyle();
    final childWidget = _resolveChild(const SizedBox.shrink());
    final iconWidget = _resolveIcon();

    if (iconWidget != null) {
      switch (_variant) {
        case _BtnVariant.elevated:
          return ElevatedButton.icon(
            onPressed: onTap,
            icon: iconWidget,
            label: childWidget,
            style: style,
          );
        case _BtnVariant.outlined:
          return OutlinedButton.icon(
            onPressed: onTap,
            icon: iconWidget,
            label: childWidget,
            style: style,
          );
        case _BtnVariant.text:
          return TextButton.icon(
            onPressed: onTap,
            icon: iconWidget,
            label: childWidget,
            style: style,
          );
      }
    }

    switch (_variant) {
      case _BtnVariant.elevated:
        return ElevatedButton(
          onPressed: onTap,
          style: style,
          child: childWidget,
        );
      case _BtnVariant.outlined:
        return OutlinedButton(
          onPressed: onTap,
          style: style,
          child: childWidget,
        );
      case _BtnVariant.text:
        return TextButton(
          onPressed: onTap,
          style: style,
          child: childWidget,
        );
    }
  }
}
