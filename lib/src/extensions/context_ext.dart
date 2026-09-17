import 'package:flutter/material.dart';

/// Fluent extension methods on [BuildContext] for navigation, theme, media query, and overlays.
extension FluKitContextExtension on BuildContext {
  // ==========================================
  // MEDIA QUERY & DIMENSIONS
  // ==========================================

  /// Returns [MediaQueryData] for current context.
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// Returns screen width.
  double get width => mediaQuery.size.width;

  /// Returns screen height.
  double get height => mediaQuery.size.height;

  /// Returns device pixel ratio.
  double get devicePixelRatio => mediaQuery.devicePixelRatio;

  /// Returns screen orientation.
  Orientation get orientation => mediaQuery.orientation;

  /// Returns true if screen orientation is landscape.
  bool get isLandscape => orientation == Orientation.landscape;

  /// Returns true if screen orientation is portrait.
  bool get isPortrait => orientation == Orientation.portrait;

  /// Returns screen padding (status bar, notch, etc.).
  EdgeInsets get viewPadding => mediaQuery.padding;

  /// Returns top padding (status bar / notch height).
  double get topPadding => mediaQuery.padding.top;

  /// Returns bottom padding (home bar height).
  double get bottomPadding => mediaQuery.padding.bottom;

  // ==========================================
  // THEME & COLOR SCHEME
  // ==========================================

  /// Returns the current [ThemeData].
  ThemeData get theme => Theme.of(this);

  /// Returns current [ColorScheme].
  ColorScheme get colorScheme => theme.colorScheme;

  /// Returns current [TextTheme].
  TextTheme get textTheme => theme.textTheme;

  /// Returns true if dark mode is active.
  bool get isDarkMode => theme.brightness == Brightness.dark;

  /// Returns primary color of the theme.
  Color get primaryColor => colorScheme.primary;

  /// Returns secondary color of the theme.
  Color get secondaryColor => colorScheme.secondary;

  /// Returns scaffold background color.
  Color get scaffoldBackgroundColor => theme.scaffoldBackgroundColor;

  // ==========================================
  // NAVIGATION HELPERS
  // ==========================================

  /// Pushes a new page [widget] onto the navigation stack.
  Future<T?> push<T>(Widget widget, {bool fullscreenDialog = false}) {
    return Navigator.of(this).push<T>(
      MaterialPageRoute(
        builder: (_) => widget,
        fullscreenDialog: fullscreenDialog,
      ),
    );
  }

  /// Replaces the current page with [widget].
  Future<T?> pushReplacement<T, TO>(Widget widget) {
    return Navigator.of(this).pushReplacement<T, TO>(
      MaterialPageRoute(builder: (_) => widget),
    );
  }

  /// Pushes [widget] and clears the entire navigation stack until the root.
  Future<T?> pushAndRemoveUntil<T>(Widget widget) {
    return Navigator.of(this).pushAndRemoveUntil<T>(
      MaterialPageRoute(builder: (_) => widget),
      (route) => false,
    );
  }

  /// Pops the topmost page from the navigation stack.
  void pop<T>([T? result]) => Navigator.of(this).pop<T>(result);

  /// Returns true if navigation can pop.
  bool get canPop => Navigator.of(this).canPop();

  // ==========================================
  // SNACKBAR & OVERLAYS
  // ==========================================

  /// Shows a [SnackBar] with the given text message or custom widget.
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
    dynamic message, {
    Duration duration = const Duration(seconds: 3),
    Color? backgroundColor,
    SnackBarAction? action,
    EdgeInsetsGeometry? margin,
    ShapeBorder? shape,
  }) {
    ScaffoldMessenger.of(this).hideCurrentSnackBar();
    final contentWidget = message is Widget ? message : Text('$message');
    return ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: contentWidget,
        duration: duration,
        backgroundColor: backgroundColor,
        action: action,
        margin: margin,
        shape: shape,
        behavior: margin != null ? SnackBarBehavior.floating : null,
      ),
    );
  }

  /// Unfocuses and hides the on-screen keyboard.
  void hideKeyboard() {
    final currentFocus = FocusScope.of(this);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }
}
