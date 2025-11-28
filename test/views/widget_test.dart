import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:sandwich_shop/main.dart';

void main() {
  group('OrderScreen UI', () {
    testWidgets('renders OrderScreen as home', (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(OrderScreen), findsOneWidget);
      expect(find.text('Sandwich Counter'), findsOneWidget);
    });

    testWidgets('shows initial sandwich image and quantity', (WidgetTester tester) async {
  await tester.pumpWidget(const App());
  // There are two Image widgets: logo and sandwich
  expect(find.byType(Image), findsNWidgets(2));
  expect(find.text('Quantity: '), findsOneWidget);
  expect(find.byKey(const Key('quantity_text')), findsOneWidget);
  expect(find.text('1'), findsOneWidget);
    });

    testWidgets('changes sandwich type and updates image', (WidgetTester tester) async {
  await tester.pumpWidget(const App());
  await tester.tap(find.byKey(const Key('sandwich_type_dropdown')));
  await tester.pumpAndSettle();
  await tester.tap(find.text('Chicken Teriyaki').last);
  await tester.pumpAndSettle();
  expect(find.byType(Image), findsNWidgets(2));
    });

    testWidgets('changes bread type', (WidgetTester tester) async {
  await tester.pumpWidget(const App());
  await tester.tap(find.byKey(const Key('bread_type_dropdown')));
  await tester.pumpAndSettle();
  await tester.tap(find.text('wheat').last);
  await tester.pumpAndSettle();
  expect(find.byKey(const Key('bread_type_dropdown')), findsOneWidget);
    });

    testWidgets('changes size with Switch', (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      expect(find.text('Footlong'), findsOneWidget);
      await tester.tap(find.byType(Switch));
      await tester.pump();
      expect(find.text('Six-inch'), findsOneWidget);
    });

    testWidgets('increases and decreases quantity', (WidgetTester tester) async {
  await tester.pumpWidget(const App());
  await tester.tap(find.byIcon(Icons.add));
  await tester.pump();
  final quantityText = tester.widget<Text>(find.byKey(const Key('quantity_text')));
  expect(quantityText.data, '1');
  await tester.tap(find.byIcon(Icons.remove));
  await tester.pump();
  final quantityTextAfter = tester.widget<Text>(find.byKey(const Key('quantity_text')));
  expect(quantityTextAfter.data, '1');
    });

    testWidgets('add to cart button is enabled when quantity > 0', (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      final addButton = find.widgetWithText(ElevatedButton, 'Add to Cart');
      expect(tester.widget<ElevatedButton>(addButton).onPressed, isNotNull);
    });
  });
}
