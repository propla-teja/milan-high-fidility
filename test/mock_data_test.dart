import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('screens mock data has required keys', () async {
    final file = File('assets/mock/screens.json');
    final jsonMap = jsonDecode(await file.readAsString()) as Map<String, dynamic>;
    final screens = jsonMap['screens'] as List<dynamic>;

    expect(screens, isNotEmpty);
    expect((screens.first as Map<String, dynamic>).containsKey('title'), isTrue);
    expect((screens.first).containsKey('ctaLabel'), isTrue);
  });
}
