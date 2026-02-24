import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpClient {
  static const String baseUrl = "";

  static Future<http.Response> post(String endpoint, Map<String, dynamic> body) {
    return http.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body)
    );
  }
}