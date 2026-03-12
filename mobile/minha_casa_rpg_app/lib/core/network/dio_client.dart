import 'package:dio/dio.dart';
import 'package:minha_casa_rpg_app/core/storage/token_storage.dart';

class DioClient {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://clarita-prenasal-akilah.ngrok-free.dev",
      connectTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 5),
      headers: {
        'Content-Type': 'application/json'
      }
    )
  )..interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await TokenStorage.getToken();
        if (token!=null) {
          options.headers["Authorization"] = "Bearer $token";
        }
        handler.next(options);
      }
    )
  );
}