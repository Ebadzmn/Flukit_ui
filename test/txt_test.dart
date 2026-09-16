import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flukit_ui/flukit_ui.dart';

void main() {
  group('txt widget tests', () {
    testWidgets('renders txt with shorthand properties', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: txt(
              'Hello World',
              fs: 22,
              fw: bold,
              cl: blue,
              ta: TextAlign.center,
            ),
          ),
        ),
      );

      final textFinder = find.text('Hello World');
      expect(textFinder, findsOneWidget);

      final textWidget = tester.widget<Text>(textFinder);
      expect(textWidget.style?.fontSize, 22);
      expect(textWidget.style?.fontWeight, FontWeight.bold);
      expect(textWidget.style?.color, blue);
      expect(textWidget.textAlign, TextAlign.center);
    });

    testWidgets('supports chained extensions on txt', (tester) async {
      final chained =
          txt('Fluent API').fs(18).bold().cl(green).ta(TextAlign.right);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: chained,
          ),
        ),
      );

      final textFinder = find.text('Fluent API');
      expect(textFinder, findsOneWidget);

      final textWidget = tester.widget<Text>(textFinder);
      expect(textWidget.style?.fontSize, 18);
      expect(textWidget.style?.fontWeight, FontWeight.bold);
      expect(textWidget.style?.color, green);
      expect(textWidget.textAlign, TextAlign.right);
    });
  });
}
