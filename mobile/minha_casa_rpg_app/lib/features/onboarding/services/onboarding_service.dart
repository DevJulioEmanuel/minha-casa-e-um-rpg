

import 'package:minha_casa_rpg_app/core/network/http_client.dart';
import 'package:minha_casa_rpg_app/features/onboarding/data/Onboarding_state.dart';
import 'package:minha_casa_rpg_app/features/onboarding/steps/criar_republica_step.dart';
import 'package:minha_casa_rpg_app/features/onboarding/steps/entrar_republica_step.dart';

class OnboardingService {
  Future<void> criarUsuario(OnboardingState state) async {
    final response = await HttpClient.post(
      //COLOCA O END POINT AQUI ARTHUR "", 
      "",
      {
        "nome": state.nome,
        "avatarId": state.avatar!.id,
        "corId": state.cor!.id,
      }
      );
    if (response.statusCode != 201) {
      throw Exception("Erro ao criar usuário");
    }
  }

  Future<void> CriarRepublica(OnboardingState state) async {
    final response = await HttpClient.post(
      //COLOCA O END POINT AQUI ARTHUR "", 
      "",
      {
        "nomeRepublica": state.nomeRepublica
      }
      );
    if (response.statusCode != 201) {
      throw Exception("Erro ao criar usuário");
    }
  }

  Future<void> EntrarRepublica(OnboardingState state) async {
    final response = await HttpClient.post(
      //COLOCA O END POINT AQUI ARTHUR "", 
      "",
      {
        "nomeRepublica": state.codigoRepublica
      }
      );
    if (response.statusCode != 201) {
      throw Exception("Erro ao criar usuário");
    }
  }
}