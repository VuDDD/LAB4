// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:magic_8_ball/main.dart';

void main() {
  testWidgets('tapping the ball displays one of its answer images', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Magic 8 Ball'), findsOneWidget);
    expect(
      (tester.widget<Image>(find.byType(Image)).image as AssetImage).assetName,
      'assets/ball1.png',
    );

    await tester.tap(find.byType(TextButton));
    await tester.pump();

    final image = tester.widget<Image>(find.byType(Image)).image as AssetImage;
    expect(
      RegExp(r'^assets/ball[1-5]\.png$').hasMatch(image.assetName),
      isTrue,
    );
  });
}
