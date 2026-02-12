import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/screen_section.dart';

class MockRepository {
  const MockRepository();

  Future<List<ScreenSection>> loadSections() async {
    final raw = await rootBundle.loadString('assets/mock/milan_screens.json');
    final decoded = jsonDecode(raw) as Map<String, dynamic>;
    final sections = (decoded['sections'] as List<dynamic>)
        .map((section) => ScreenSection.fromJson(section as Map<String, dynamic>))
        .toList();
    return sections;
  }
}
