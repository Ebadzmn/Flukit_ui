import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flukit_ui/flukit_ui.dart';

void main() {
  group('Utilities and Constants tests', () {
    test('hex converter parses various formats', () {
      expect(hex('#FFFFFF'), const Color(0xFFFFFFFF));
      expect(hex('FFFFFF'), const Color(0xFFFFFFFF));
      expect(hex('#FFF'), const Color(0xFFFFFFFF));
      expect(hex('#000'), const Color(0xFF000000));
      expect(hex('#121212'), const Color(0xFF121212));
      expect(hex('#80121212'), const Color(0x80121212));
    });

    test('colors and weights exist', () {
      expect(white, Colors.white);
      expect(black, Colors.black);
      expect(transparent, Colors.transparent);
      expect(bold, FontWeight.w700);
      expect(regular, FontWeight.w400);
    });

    testWidgets('gap, vgap, hgap create correct SizedBox dimensions',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                gap(10),
                vgap(20),
                hgap(30),
              ],
            ),
          ),
        ),
      );

      final boxes = tester.widgetList<SizedBox>(find.byType(SizedBox)).toList();
      expect(boxes.any((b) => b.width == 10 && b.height == 10), isTrue);
      expect(boxes.any((b) => b.height == 20 && b.width == null), isTrue);
      expect(boxes.any((b) => b.width == 30 && b.height == null), isTrue);
    });
  });
}
