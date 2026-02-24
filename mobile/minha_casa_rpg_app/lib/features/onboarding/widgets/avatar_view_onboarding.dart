import 'package:flutter/material.dart';
import 'package:minha_casa_rpg_app/features/avatares/avatar_size.dart';
import 'package:minha_casa_rpg_app/features/avatares/avatar_view_onboarding.dart';

class AvatarViewOnboarding extends StatelessWidget {
  final AvatarSize avatarSize;
  final String path;
  final Color cor;
  const AvatarViewOnboarding({super.key, required this.path, required this.avatarSize, this.cor = const Color(0xff60A7CD)});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: cor,
      ),
      child: AvatarView(path: path, avatarSize: avatarSize),
    );
  }
}