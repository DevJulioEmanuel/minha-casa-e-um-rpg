import 'package:minha_casa_rpg_app/features/avatares/data/avatar_model.dart';
import 'package:minha_casa_rpg_app/features/avatares/data/color_model.dart';

class OnboardingState {
  final String? nome;
  final AvatarModel? avatar;
  final ColorModel? cor;
  String? nomeRepublica;
  String? codigoRepublica;

  OnboardingState({
    this.nome,
    this.avatar,
    this.cor,
    String? nomeRepublica,
    String? codigoRepublica
  });

  OnboardingState copyWith({
    String? nome,
    AvatarModel? avatar,
    ColorModel? cor,
    String? nomeRepublica,
    String? codigoRepublica
  }) {
    return OnboardingState(
      nome: nome ?? this.nome,
      avatar: avatar ?? this.avatar,
      cor: cor ?? this.cor,
      nomeRepublica: nomeRepublica ?? this.nomeRepublica,
      codigoRepublica: codigoRepublica ?? this.codigoRepublica
    );
  }
}