import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpClient {
  static const String baseUrl = "https://clarita-prenasal-akilah.ngrok-free.dev";

  static Future<http.Response> post(String endpoint, Map<String, dynamic> body) {
    return http.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: {
        "Content-Type": "application/json",
        "ngrok-skip-browser-warning": "true",
        },
      body: jsonEncode(body)
    );
  }

  static Future<http.Response> patch(String endpoint, Map<String, dynamic> body) {
    return http.patch(
      Uri.parse('$baseUrl$endpoint'),
      headers: {
        "Content-Type": "application/json",
        "ngrok-skip-browser-warning": "true",
        },
      body: jsonEncode(body)
    );
  }
}