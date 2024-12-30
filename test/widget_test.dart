import 'package:flutter_test/flutter_test.dart';
import 'package:quizy/main.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('Start quiz', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Tap the 'Start Quiz' button.
    await tester.tap(find.text('Start Quiz'));
    await tester.pumpAndSettle();

    // Verify that we navigated to the quiz page.
    expect(find.text('Question 1 of 6'), findsOneWidget);
  });

  testWidgets('Answer questions', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Tap the 'Start Quiz' button.
    await tester.tap(find.text('Start Quiz'));
    await tester.pumpAndSettle();

    // Answer the first question.
    await tester.tap(find.text('True'));
    await tester.pumpAndSettle();

    // Verify that we navigated to the next question.
    expect(find.text('Question 2 of 6'), findsOneWidget);

    // Answer the second question.
    await tester.tap(find.text('True'));
    await tester.pumpAndSettle();

    // Verify that we navigated to the next question.
    expect(find.text('Question 3 of 6'), findsOneWidget);
  });

  testWidgets('Complete quiz', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Tap the 'Start Quiz' button.
    await tester.tap(find.text('Start Quiz'));
    await tester.pumpAndSettle();

    // Answer all questions.
    for (var i = 0; i < 6; i++) {
      await tester.tap(find.text('True'));
      await tester.pumpAndSettle();
    }

    // Verify that we navigated to the score screen.
    expect(find.text('You scored 5 out of 6'), findsOneWidget);
  });

  testWidgets('Profile Card', (WidgetTester tester) async {
    // Build our app and trigger a frame.

    await tester.pumpWidget(const MyApp());

    await tester.tap(find.byIcon(Icons.account_circle));
    await tester.pumpAndSettle();

    // Verify that the profile card is displayed.
    expect(find.text('Profile Card'), findsOneWidget);
  });
}
