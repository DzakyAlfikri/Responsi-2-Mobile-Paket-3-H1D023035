// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:responsi2mobile_paket3_h1d023035/main.dart';

void main() {
  testWidgets('App starts with login page', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Wait for the app to initialize
    await tester.pumpAndSettle();

    // Verify that we can find the login form elements
    expect(find.text('Login Inventaris Dzaky'), findsOneWidget);
  });
}
