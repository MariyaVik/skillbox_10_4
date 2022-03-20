import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:skillbox_10_4/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('Login test', () {
    testWidgets('Test login form', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      final Finder emailField = find.bySemanticsLabel('Email');
      final Finder phoneField = find.bySemanticsLabel('Phone');
      final Finder loginButton = find.byType(ElevatedButton);

      await tester.enterText(emailField, "test@test.ru");
      await tester.enterText(phoneField, "123456");
      await tester.pumpAndSettle();

      await tester.tap(loginButton);
      await tester.pumpAndSettle();
      expect(find.text('Добро пожаловать'), findsOneWidget);
    });
  });

  group('Register test', () {
    testWidgets('Test register form', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      final Finder changeButton = find.byType(TextButton);

      await tester.tap(changeButton);
      await tester.pumpAndSettle();

      final Finder nameField = find.bySemanticsLabel('First name');
      final Finder surnameField = find.bySemanticsLabel('Last name');
      final Finder phoneField = find.bySemanticsLabel('Phone');
      final Finder emailField = find.bySemanticsLabel('Email');
      final Finder regButton = find.byType(ElevatedButton);

      await tester.enterText(nameField, "Name");
      await tester.enterText(surnameField, "Surname");
      await tester.enterText(phoneField, "123456");
      await tester.enterText(emailField, "test@test.ru");
      await tester.pumpAndSettle();

      await tester.tap(regButton);
      await tester.pumpAndSettle();
      expect(find.text('Вы успешно зарегистрировались'), findsOneWidget);
    });
  });
}
