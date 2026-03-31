import 'package:dio/dio.dart';
import 'package:minha_casa_rpg_app/core/network/dio_client.dart';
import 'package:minha_casa_rpg_app/features/onboarding/provider/onboarding_state.dart';

class OnboardingService {
  Future<void> criarUsuario(OnboardingState state) async {
    try {
      await DioClient.dio.patch(
        "/profile",
        data: {
          "name": state.nome,
          "avatar": state.avatar!.id,
          "color": state.cor!.id,
        },
      );
    } on DioException catch (e) {
      throw Exception(e);
    }
  }

  Future<void> criarRepublica(OnboardingState state) async {
    try {
      await DioClient.dio.post(
        "/republic",
        data: {"name": state.nomeRepublica},
      );
    } on DioException catch (e) {
      throw Exception(e);
    }
  }

  Future<void> entrarRepublica(OnboardingState state) async {
    try {
      await DioClient.dio.patch(
        "/join",
        data: {"inviteCode": state.codigoRepublica},
      );
    } on DioException catch (e) {
      throw Exception(e);
    }
  }
}
