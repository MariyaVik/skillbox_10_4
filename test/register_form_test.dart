import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:skillbox_10_4/main.dart';

void main() {
  group('last name test', () {
    testWidgets('empty last name field', (WidgetTester tester) async {
      final Finder changeButton = find.byType(TextButton);

      await tester.pumpWidget(MyApp());

      await tester.tap(changeButton);
      await tester.pump();

      final Finder registerButton = find.byType(ElevatedButton);

      await tester.tap(registerButton);
      await tester.pump();

      expect(find.text('Введите фамилию'), findsOneWidget);
      expect(find.text('Вы успешно зарегистрировались'), findsNothing);
    });

    testWidgets('not empty last name field', (WidgetTester tester) async {
      final Finder changeButton = find.byType(TextButton);
      final Finder surnameField = find.bySemanticsLabel('Last name');

      await tester.pumpWidget(MyApp());

      await tester.tap(changeButton);
      await tester.pump();

      final Finder registerButton = find.byType(ElevatedButton);

      await tester.enterText(surnameField, 'Surname');

      await tester.tap(registerButton);
      await tester.pump();

      expect(find.text('Surname'), findsOneWidget);
    });
  });

  group('first name test', () {
    testWidgets('empty first name field', (WidgetTester tester) async {
      final Finder changeButton = find.byType(TextButton);

      await tester.pumpWidget(MyApp());

      await tester.tap(changeButton);
      await tester.pump();

      final Finder registerButton = find.byType(ElevatedButton);

      await tester.tap(registerButton);
      await tester.pump();

      expect(find.text('Введите имя'), findsOneWidget);
      expect(find.text('Вы успешно зарегистрировались'), findsNothing);
    });

    testWidgets('not empty first name field', (WidgetTester tester) async {
      final Finder changeButton = find.byType(TextButton);
      final Finder nameField = find.bySemanticsLabel('First name');

      await tester.pumpWidget(MyApp());

      await tester.tap(changeButton);
      await tester.pump();

      final Finder registerButton = find.byType(ElevatedButton);

      await tester.enterText(nameField, 'Name');

      await tester.tap(registerButton);
      await tester.pump();

      expect(find.text('Name'), findsOneWidget);
    });
  });

  group('phone test', () {
    testWidgets('empty phone field', (WidgetTester tester) async {
      final Finder changeButton = find.byType(TextButton);

      await tester.pumpWidget(MyApp());

      await tester.tap(changeButton);
      await tester.pump();

      final Finder registerButton = find.byType(ElevatedButton);

      await tester.tap(registerButton);
      await tester.pump();

      expect(find.text('Заполните поле телефон'), findsOneWidget);
      expect(find.text('Вы успешно зарегистрировались'), findsNothing);
    });

    testWidgets('text in phone field', (WidgetTester tester) async {
      final Finder changeButton = find.byType(TextButton);
      final Finder phoneField = find.bySemanticsLabel('Phone');

      await tester.pumpWidget(MyApp());

      await tester.tap(changeButton);
      await tester.pump();

      final Finder registerButton = find.byType(ElevatedButton);

      await tester.enterText(phoneField, 'phone');

      await tester.tap(registerButton);
      await tester.pump();

      expect(find.text('phone'), findsNothing);
      expect(find.text('Вы успешно зарегистрировались'), findsNothing);
    });

    testWidgets('good phone', (WidgetTester tester) async {
      final Finder changeButton = find.byType(TextButton);
      final Finder phoneField = find.bySemanticsLabel('Phone');

      await tester.pumpWidget(MyApp());

      await tester.tap(changeButton);
      await tester.pump();
      final Finder registerButton = find.byType(ElevatedButton);

      await tester.enterText(phoneField, '88008008080');

      await tester.tap(registerButton);
      await tester.pump();

      expect(find.text('88008008080'), findsOneWidget);
    });
  });
}
