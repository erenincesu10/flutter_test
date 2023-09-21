import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_example/main.dart';

void main() {
  testWidgets('Add numbers widget test', (WidgetTester widgetTester) async {
    await widgetTester.pumpWidget(MyApp());
    var textField1 = find.byType(TextField);
    expect(textField1, findsWidgets);
    await widgetTester.enterText(textField1.first, "9");
    expect(find.text("9"), findsOneWidget);
    await widgetTester.enterText(textField1.last, "10");
    expect(find.text("10"), findsOneWidget);
    var button = find.text("Calculate");
    expect(button, findsOneWidget);
    await widgetTester.tap(button);
    await widgetTester.pump();
    expect(find.text("19"), findsOneWidget);
  });
}
