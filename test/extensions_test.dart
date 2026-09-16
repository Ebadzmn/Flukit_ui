import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flukit_ui/flukit_ui.dart';

void main() {
  group('Extensions tests', () {
    testWidgets('Widget extensions wrap properly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: txt('Wrapped')
                .pad(12)
                .px(16)
                .py(8)
                .center()
                .opacity(0.8)
                .clipR(10),
          ),
        ),
      );

      expect(find.byType(Padding), findsWidgets);
      expect(find.byType(Center), findsOneWidget);
      expect(find.byType(Opacity), findsOneWidget);
      expect(find.byType(ClipRRect), findsOneWidget);

      final opacityWidget = tester.widget<Opacity>(find.byType(Opacity));
      expect(opacityWidget.opacity, 0.8);

      final clipWidget = tester.widget<ClipRRect>(find.byType(ClipRRect));
      expect(clipWidget.borderRadius, BorderRadius.circular(10));
    });

    test('num extensions create correct geometries and boxes', () {
      expect(16.gap.width, 16);
      expect(16.gap.height, 16);
      expect(24.vgap.height, 24);
      expect(12.hgap.width, 12);
      expect(8.rad, BorderRadius.circular(8));
      expect(16.pad, const EdgeInsets.all(16));
      expect(10.px, const EdgeInsets.symmetric(horizontal: 10));
      expect(20.py, const EdgeInsets.symmetric(vertical: 20));
    });
  });
}
