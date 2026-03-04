import 'package:dio/dio.dart';
import 'package:minha_casa_rpg_app/core/network/dio_client.dart';

class AuthService {
  Future<Map<String, dynamic>> register(String email, String password) async {
    try {
      final response = await DioClient.dio.post (
        "/user",
        data: {
          "email": email,
          "password": password,
        },
      );
      return response.data;
    } on DioException catch (e) {
      throw Exception(e.response?.data?? "Erro ao cadastrar");
    }
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await DioClient.dio.post (
        "/user",
        data: {
          "email": email,
          "password": password,
        },
      );
      return response.data;
    } on DioException catch (e) {
      throw Exception(e.response?.data?? "Erro ao logar");
    }
  }
}