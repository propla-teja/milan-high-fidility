import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:milan_high_fidility/widgets/screen_card.dart';
import 'package:milan_high_fidility/models/screen_item.dart';

void main() {
  testWidgets('ScreenCard renders title, tags and CTA', (tester) async {
    const item = ScreenItem(
      id: 'otp',
      title: 'OTP Screen',
      category: 'authentication',
      description: 'OTP input and retry state.',
      cta: 'Verify OTP',
      tags: ['OTP', 'Security'],
    );

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: SizedBox(height: 260, width: 320, child: ScreenCard(item: item)),
        ),
      ),
    );

    expect(find.text('OTP Screen'), findsOneWidget);
    expect(find.text('Verify OTP'), findsOneWidget);
    expect(find.text('Security'), findsOneWidget);
  });
}
