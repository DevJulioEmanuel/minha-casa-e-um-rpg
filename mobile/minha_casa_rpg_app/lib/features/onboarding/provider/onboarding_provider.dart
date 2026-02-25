import 'package:flutter_riverpod/legacy.dart';
import 'package:minha_casa_rpg_app/features/avatares/data/avatar_model.dart';
import 'package:minha_casa_rpg_app/features/avatares/data/avatar_repository.dart';
import 'package:minha_casa_rpg_app/features/avatares/data/color_model.dart';
import 'package:minha_casa_rpg_app/features/avatares/data/color_repository.dart';
import 'package:minha_casa_rpg_app/features/onboarding/data/onboarding_state.dart';
import 'package:minha_casa_rpg_app/features/onboarding/services/onboarding_service.dart';

final onboardingProvider = StateNotifierProvider<OnboardingProvider, OnboardingState>(
  (ref) => OnboardingProvider(OnboardingService()),
);

class OnboardingProvider extends StateNotifier<OnboardingState> {
  final OnboardingService remote;

  OnboardingProvider(this.remote) 
    : super(
      OnboardingState(
        avatar: AvatarRepository.avatars[0],
        cor: ColorRepository.colors[0]
      ));

  void setName(String nome) {
    state = state.copyWith(nome: nome);
  }
  void setAvatar(AvatarModel avatar) {
    state = state.copyWith(avatar: avatar);
  }
  void setColor(ColorModel cor) {
    state = state.copyWith(cor: cor);
  }
  void setNomeRepublica(String nome) {
    state = state.copyWith(nomeRepublica: nome);
  }
  void setCodigoRepublica(String codigo) {
    state = state.copyWith(codigoRepublica: codigo);
  }

  Future <bool> criarUsuario() async {
    final response = await remote.criarUsuario(state);
    if (response) {
      return true;
    } else {
      return false;
    }
 
  }
  Future <void> criarRepublica() async {
    await remote.criarRepublica(state);
  }
  Future <void> entrarRepublica() async {
    await remote.entrarRepublica(state);
  }
} 