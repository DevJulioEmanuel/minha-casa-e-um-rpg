import 'package:dio/dio.dart';
import 'package:minha_casa_rpg_app/core/storage/token_storage.dart';

class DioClient {
  static final Dio dio =
      Dio(
          BaseOptions(
            baseUrl: "http://10.10.248.209:8080",
            connectTimeout: Duration(seconds: 5),
            receiveTimeout: Duration(seconds: 5),
            headers: {'Content-Type': 'application/json'},
          ),
        )
        ..interceptors.add(
          InterceptorsWrapper(
            onRequest: (options, handler) async {
              final token = await TokenStorage.getToken();
              if (token != null) {
                options.headers["Authorization"] =
                    "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJyZXBxdWVzdCIsInN1YiI6Imp1bGlvZW1hbnVlbDEwMEBnbWFpbC5jb20iLCJleHAiOjE3NzQ5ODA2MTJ9.gqfbPXvbmSA5reAHt2-H04Ycg_SJxq9KAoFleup0Xqg";
              }
              handler.next(options);
            },
          ),
        );
}
