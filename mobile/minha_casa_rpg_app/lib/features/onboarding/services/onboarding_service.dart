import 'package:minha_casa_rpg_app/core/network/http_client.dart';
import 'package:minha_casa_rpg_app/features/onboarding/provider/onboarding_state.dart';

class OnboardingService {
  Future<bool> criarUsuario(OnboardingState state) async {
    final response = await HttpClient.patch(
      "/user/7dcc527d-f823-44f6-a2aa-42bbd3652718/profile",
      {
        "name": state.nome,
        "avatar": state.avatar!.id,
        "color": state.cor!.id,
      }
      );
    if (response.statusCode != 200) {
      return false;
    }
    return true;
  }

  Future<void> criarRepublica(OnboardingState state) async {
    final response = await HttpClient.post(
      "/republic",
      {
        "name": state.nomeRepublica
      }
      );
    if (response.statusCode != 200) {
      throw Exception("Erro ao criar o usuário");
    }
  }

  Future<void> entrarRepublica(OnboardingState state) async {
    final response = await HttpClient.patch(
      "/user/7dcc527d-f823-44f6-a2aa-42bbd3652718/join",
      {
        "inviteCode": state.codigoRepublica
      }
      );
    if (response.statusCode != 200) {
      throw Exception("Erro ao criar usuário");
    }
  }
}