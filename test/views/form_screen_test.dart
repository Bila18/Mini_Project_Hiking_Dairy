import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hiking_dairy/views/form_dairy_screen.dart';

void main() {
  group('Form Dairy', () {
    testWidgets('Dairy', (WidgetTester tester) async {
      final name = find.byKey(const ValueKey('Name'));
      final location = find.byKey(const ValueKey('Location'));
      final date = find.byKey(const ValueKey('Date'));
      final dairy = find.byKey(const ValueKey('Dairy'));

      await tester.pumpWidget(const MaterialApp(
        home: FormDairy(),
      ));

      // Test Body
      await tester.enterText(name, 'Mountain Name');
      await tester.enterText(location, 'Mountain Location');
      await tester.enterText(date, 'Date');
      await tester.enterText(dairy, 'This your dairy');
      await tester.pump();

      // Check Outputs
      expect(find.text('Mountain Name'), findsOneWidget);
      expect(find.text('Mountain Location'), findsOneWidget);
      expect(find.text('Date'), findsOneWidget);
      expect(find.text('This your dairy'), findsOneWidget);
      expect(
          find.ancestor(
              of: find.byType(Text), matching: find.byType(ElevatedButton)),
          findsWidgets);
    });
  });
}
