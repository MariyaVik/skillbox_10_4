import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:skillbox_10_4/main.dart';

void main() {
  group('email test', () {
    testWidgets('empty email field', (WidgetTester tester) async {
      final Finder loginButton = find.byType(ElevatedButton);

      await tester.pumpWidget(MyApp());

      await tester.tap(loginButton);
      await tester.pump();

      expect(find.text('Введите email'), findsOneWidget);
      expect(find.text('Добро пожаловать'), findsNothing);
    });

    testWidgets('bed email', (WidgetTester tester) async {
      final Finder emailField = find.bySemanticsLabel('Email');
      final Finder loginButton = find.byType(ElevatedButton);

      await tester.pumpWidget(MyApp());

      await tester.enterText(emailField, 'test');

      await tester.tap(loginButton);
      await tester.pump();

      expect(find.text('Поле email заполнено не корректно'), findsOneWidget);
      expect(find.text('Добро пожаловать'), findsNothing);
    });

    testWidgets('good email', (WidgetTester tester) async {
      final Finder emailField = find.bySemanticsLabel('Email');
      final Finder loginButton = find.byType(ElevatedButton);

      await tester.pumpWidget(MyApp());

      await tester.enterText(emailField, 'test@test.ru');

      await tester.tap(loginButton);
      await tester.pump();

      expect(find.text('test@test.ru'), findsOneWidget);
      expect(find.text('Поле email заполнено не корректно'), findsNothing);
      expect(find.text('Поле email заполнено не корректно'), findsNothing);
    });
  });

  group('phone test', () {
    testWidgets('empty phone field', (WidgetTester tester) async {
      final Finder loginButton = find.byType(ElevatedButton);

      await tester.pumpWidget(MyApp());

      await tester.tap(loginButton);
      await tester.pump();

      expect(find.text('Введите телефон'), findsOneWidget);
      expect(find.text('Добро пожаловать'), findsNothing);
    });

    testWidgets('text in phone field', (WidgetTester tester) async {
      final Finder phoneField = find.bySemanticsLabel('Phone');
      final Finder loginButton = find.byType(ElevatedButton);

      await tester.pumpWidget(MyApp());

      await tester.enterText(phoneField, 'phone');

      await tester.tap(loginButton);
      await tester.pump();

      expect(find.text('phone'), findsNothing);
      expect(find.text('Добро пожаловать'), findsNothing);
    });

    testWidgets('good phone', (WidgetTester tester) async {
      final Finder phoneField = find.bySemanticsLabel('Phone');
      final Finder loginButton = find.byType(ElevatedButton);

      await tester.pumpWidget(MyApp());

      await tester.enterText(phoneField, '88008008080');

      await tester.tap(loginButton);
      await tester.pump();

      expect(find.text('88008008080'), findsOneWidget);
    });
  });
}
