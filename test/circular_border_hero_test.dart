import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:circular_border_hero/circular_border_hero.dart';

void main() {
  testWidgets('Returns no error', (WidgetTester tester) async {
    CircularBorderHero hero = CircularBorderHero(
      tag: 'test',
      radius: 0.0,
      child: Container(),
    );
    await tester.pumpWidget(MaterialApp(
      home: hero,
    ));
    expect(find.byWidget(hero), findsOneWidget);
  });
}
