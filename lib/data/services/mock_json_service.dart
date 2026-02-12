import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class MockJsonService {
  const MockJsonService({this.baseUrl = 'http://localhost:3000'});

  final String baseUrl;

  Future<List<dynamic>> loadCollection(String key, String assetPath) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/$key'));
      if (response.statusCode == 200) {
        return jsonDecode(response.body) as List<dynamic>;
      }
    } catch (_) {
      // Fallback to local asset for offline and demo mode.
    }

    final source = await rootBundle.loadString(assetPath);
    final decoded = jsonDecode(source) as Map<String, dynamic>;
    return decoded[key] as List<dynamic>;
  }
}
