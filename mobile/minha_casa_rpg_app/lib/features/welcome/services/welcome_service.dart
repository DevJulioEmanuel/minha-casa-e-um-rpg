import 'dart:convert';

import 'package:minha_casa_rpg_app/core/network/http_client.dart';

class WelcomeService {
  Future<Map<String, dynamic>> register(String email, String password) async {
    final response = await HttpClient.post(
      "",
      {
        "email": email,
        "password": password,
      },
    );

    if (response.statusCode != 201) {
      throw Exception("Erro ao cadastrar");
    }

    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await HttpClient.post(
      "",
      {
        "email": email,
        "password": password,
      },
    );

    if (response.statusCode != 200) {
      throw Exception("Email ou senha inválidos");
    }

    return jsonDecode(response.body);
  }
}