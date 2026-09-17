import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flukit_ui/flukit_ui.dart';

void main() {
  group('FluKit Text & String Extensions', () {
    testWidgets('Text and String extensions work as expected', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: 'Hello World'
                .text()
                .size(24)
                .bold()
                .color(Colors.blue)
                .italic()
                .alignCenter(),
          ),
        ),
      );

      final textFinder = find.text('Hello World');
      expect(textFinder, findsOneWidget);

      final textWidget = tester.widget<Text>(textFinder);
      expect(textWidget.style?.fontSize, 24);
      expect(textWidget.style?.fontWeight, FontWeight.bold);
      expect(textWidget.style?.color, Colors.blue);
      expect(textWidget.style?.fontStyle, FontStyle.italic);
      expect(textWidget.textAlign, TextAlign.center);
    });

    test('String formatting utilities', () {
      expect('john doe'.capitalizeFirst, 'John doe');
      expect('john doe'.titleCase, 'John Doe');
      expect('test@example.com'.isValidEmail, isTrue);
      expect('invalid-email'.isValidEmail, isFalse);
      expect('12345'.isNumeric, isTrue);
    });
  });

  group('FluKit Widget & List Extensions', () {
    testWidgets('List.gap and toColumn extension works', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: [
              const Text('Item 1'),
              const Text('Item 2'),
              const Text('Item 3'),
            ].toColumn(gap: 16),
          ),
        ),
      );

      expect(find.text('Item 1'), findsOneWidget);
      expect(find.text('Item 2'), findsOneWidget);
      expect(find.text('Item 3'), findsOneWidget);
      expect(find.byType(SizedBox), findsNWidgets(2));
    });

    testWidgets('Widget extensions apply padding, center, and onTap',
        (tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: const Text('Tap Me')
                .paddingAll(16)
                .center()
                .onTap(() => tapped = true),
          ),
        ),
      );

      expect(find.text('Tap Me'), findsOneWidget);
      expect(find.byType(Padding), findsWidgets);
      expect(find.byType(Center), findsWidgets);
      expect(find.byType(InkWell), findsOneWidget);

      await tester.tap(find.text('Tap Me'));
      expect(tapped, isTrue);
    });

    testWidgets('Widget visible extension works', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                const Text('Visible Text').visible(true),
                const Text('Hidden Text').visible(false),
              ],
            ),
          ),
        ),
      );

      expect(find.text('Visible Text'), findsOneWidget);
      expect(find.text('Hidden Text'), findsNothing);
    });
  });

  group('FluKit Num & Duration Extensions', () {
    test('Num creates SizedBox, EdgeInsets and Duration', () {
      final hBox = 16.height;
      expect(hBox.height, 16.0);

      final wBox = 12.width;
      expect(wBox.width, 12.0);

      final gapBox = 20.gap;
      expect(gapBox.width, 20.0);
      expect(gapBox.height, 20.0);

      final insets = 10.padAll;
      expect(insets.top, 10.0);
      expect(insets.bottom, 10.0);

      expect(300.ms, const Duration(milliseconds: 300));
      expect(2.seconds, const Duration(seconds: 2));
      expect(5.minutes, const Duration(minutes: 5));
    });
  });

  group('FluKit Box Widget', () {
    testWidgets('Box renders with custom styling and child', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Box(
              width: 100,
              height: 100,
              color: Colors.red,
              radius: 12,
              padding: 16,
              child: const Text('Inside Box'),
            ),
          ),
        ),
      );

      expect(find.text('Inside Box'), findsOneWidget);
      final containerFinder = find.byType(Container);
      expect(containerFinder, findsOneWidget);
    });
  });

  group('FluKit Context Extensions', () {
    testWidgets('Context provides size, theme and snackbar', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              return Scaffold(
                body: ElevatedButton(
                  onPressed: () {
                    context.showSnackBar('Test message');
                  },
                  child: Text('Width: ${context.width.toInt()}'),
                ),
              );
            },
          ),
        ),
      );

      expect(find.textContaining('Width:'), findsOneWidget);
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();
      expect(find.text('Test message'), findsOneWidget);
    });
  });
}
