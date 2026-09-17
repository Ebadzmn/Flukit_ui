import 'package:flutter/material.dart';

/// Fluent extension methods on [String] for instant Text generation and formatting.
extension FluKitStringExtension on String {
  /// Converts this string directly into a standard Flutter [Text] widget.
  Text text() => Text(this);

  /// Capitalizes the first letter of this string.
  String get capitalizeFirst {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  /// Capitalizes the first letter of each word in this string.
  String get titleCase {
    if (isEmpty) return this;
    return split(' ')
        .map((word) => word.isNotEmpty
            ? '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}'
            : '')
        .join(' ');
  }

  /// Checks if this string is a valid email.
  bool get isValidEmail {
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegex.hasMatch(this);
  }

  /// Checks if this string contains only numbers.
  bool get isNumeric => num.tryParse(this) != null;
}
