import 'package:flutter_riverpod/legacy.dart';
import 'package:minha_casa_rpg_app/features/avatares/data/avatar_model.dart';
import 'package:minha_casa_rpg_app/features/avatares/data/avatar_repository.dart';
import 'package:minha_casa_rpg_app/features/avatares/data/color_model.dart';
import 'package:minha_casa_rpg_app/features/avatares/data/color_repository.dart';
import 'package:minha_casa_rpg_app/features/onboarding/data/Onboarding_state.dart';

final onboardingProvider = StateNotifierProvider<OnboardingProvider, OnboardingState>(
  (ref) => OnboardingProvider(),
);

class OnboardingProvider extends StateNotifier<OnboardingState> {
  OnboardingProvider() 
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
} 