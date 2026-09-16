import 'package:flutter/material.dart';

/// Lightweight, readable alias for Flutter's [Scaffold].
///
/// Example:
/// ```dart
/// scaf(
///   appBar: AppBar(title: txt('Home')),
///   body: col(ch: [txt('Hello')]),
///   bg: white,
/// )
/// ```
class scaf extends StatelessWidget {
  /// App bar
  final PreferredSizeWidget? appBar;

  /// Main body
  final Widget? body;

  /// Floating action button
  final Widget? fab;

  /// FAB location
  final FloatingActionButtonLocation? fabLocation;

  /// Bottom navigation bar
  final Widget? bottomNav;

  /// Bottom sheet
  final Widget? bottomSheet;

  /// Background color
  final Color? bg;

  /// Drawer
  final Widget? drawer;

  /// End drawer
  final Widget? endDrawer;

  /// Resize to avoid bottom inset
  final bool? resizeToAvoidBottomInset;

  /// Extend body
  final bool extendBody;

  /// Extend body behind app bar
  final bool extendBodyBehindAppBar;

  const scaf({
    super.key,
    this.appBar,
    this.body,
    this.fab,
    this.fabLocation,
    this.bottomNav,
    this.bottomSheet,
    this.bg,
    this.drawer,
    this.endDrawer,
    this.resizeToAvoidBottomInset,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: body,
      floatingActionButton: fab,
      floatingActionButtonLocation: fabLocation,
      bottomNavigationBar: bottomNav,
      bottomSheet: bottomSheet,
      backgroundColor: bg,
      drawer: drawer,
      endDrawer: endDrawer,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      extendBody: extendBody,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
    );
  }
}
