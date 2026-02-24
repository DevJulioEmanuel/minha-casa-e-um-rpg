import 'avatar_model.dart';

class AvatarRepository {
  static const List<AvatarModel> avatars = [
    AvatarModel(
      id: 'mago',
      imagePath: 'assets/images/avatar/meu_avatar.png',
    ),
    AvatarModel(
      id: 'guerreiro',
      imagePath: 'assets/images/avatar/meu_avatar2.png',
    ),
    AvatarModel(
      id: 'arqueiro',
      imagePath: 'assets/images/avatar/meu_avatar3.png',
    ),
    AvatarModel(
      id: 'arqueiro_nordico',
      imagePath: 'assets/images/avatar/meu_avatar4.png',
    ),
  ];
}