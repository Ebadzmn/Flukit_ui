import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flukit_ui/flukit_ui.dart';

void main() {
  group('cont widget tests', () {
    testWidgets('renders correctly with basic properties', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: cont(
              w: 120,
              h: 80,
              pad: 16,
              mar: 8,
              rad: 10,
              cl: white,
              ch: txt('Inside Container'),
            ),
          ),
        ),
      );

      expect(find.text('Inside Container'), findsOneWidget);
      final container = tester.widget<Container>(find.byType(Container).first);
      expect(container.constraints?.minWidth, 120);
      expect(container.constraints?.minHeight, 80);
      expect(container.padding, const EdgeInsets.all(16));
      expect(container.margin, const EdgeInsets.all(8));

      final decoration = container.decoration as BoxDecoration?;
      expect(decoration?.color, white);
      expect(decoration?.borderRadius, BorderRadius.circular(10));
    });

    testWidgets('renders border correctly with bor and bc', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: cont(
              bor: 2.0,
              bc: red,
              ch: txt('Bordered'),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container).first);
      final decoration = container.decoration as BoxDecoration?;
      expect(decoration?.border?.isUniform, isTrue);
      expect(decoration?.border?.top.color, red);
      expect(decoration?.border?.top.width, 2.0);
    });
  });
}
