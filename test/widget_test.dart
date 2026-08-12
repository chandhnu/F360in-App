import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:f360in/main.dart';

void main() {
  testWidgets('F360in app starts', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: F360inApp()));
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
