import 'package:dio/dio.dart';
import 'package:minha_casa_rpg_app/core/network/dio_client.dart';
import 'package:minha_casa_rpg_app/core/storage/token_storage.dart';

class AuthService {
  Future<void> register(String email, String password) async {
    try {
      final response = await DioClient.dio.post(
        "/user",
        data: {"email": email, "password": password},
      );
      final token = response.data["token"];
      await TokenStorage.saveToken(token);
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? "Erro ao cadastrar");
    }
  }

  Future<void> login(String email, String password) async {
    try {
      final response = await DioClient.dio.post(
        "/auth/login",
        data: {"email": email, "password": password},
      );
      final token = response.data["token"];
      await TokenStorage.saveToken(token);
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? "Erro ao logar");
    }
  }
}
