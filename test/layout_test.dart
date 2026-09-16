import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flukit_ui/flukit_ui.dart';

void main() {
  group('Layout widgets tests', () {
    testWidgets('col and row render correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: col(
              main: MainAxisAlignment.center,
              cross: CrossAxisAlignment.start,
              ch: [
                row(
                  main: MainAxisAlignment.spaceBetween,
                  ch: [
                    const txt('Item 1'),
                    hgap(10),
                    const txt('Item 2'),
                  ],
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(Column), findsOneWidget);
      expect(find.byType(Row), findsOneWidget);
      expect(find.text('Item 1'), findsOneWidget);
      expect(find.text('Item 2'), findsOneWidget);

      final colWidget = tester.widget<Column>(find.byType(Column));
      expect(colWidget.mainAxisAlignment, MainAxisAlignment.center);
      expect(colWidget.crossAxisAlignment, CrossAxisAlignment.start);

      final rowWidget = tester.widget<Row>(find.byType(Row));
      expect(rowWidget.mainAxisAlignment, MainAxisAlignment.spaceBetween);
    });

    testWidgets('stk, ctr, pad, ali, exp, flx, box, safe, scaf render', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: scaf(
            body: safe(
              ch: stk(
                ch: [
                  ctr(
                    ch: ali(
                      Alignment.bottomRight,
                      ch: box(
                        w: 50,
                        h: 50,
                        ch: pad(
                          8,
                          ch: txt('Inside All'),
                        ),
                      ),
                    ),
                  ),
                  row(
                    ch: [
                      exp(flex: 2, ch: txt('Expanded')),
                      flx(flex: 1, ch: txt('Flexible')),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      expect(find.byType(scaf), findsOneWidget);
      expect(find.byType(safe), findsOneWidget);
      expect(find.byType(stk), findsOneWidget);
      expect(find.byType(ctr), findsOneWidget);
      expect(find.byType(ali), findsWidgets);
      expect(find.byType(box), findsWidgets);
      expect(find.byType(pad), findsWidgets);
      expect(find.byType(exp), findsOneWidget);
      expect(find.byType(flx), findsWidgets);
      expect(find.text('Inside All'), findsOneWidget);
    });
  });
}
