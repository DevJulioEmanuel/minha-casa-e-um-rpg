import 'package:flutter/material.dart';
import 'package:minha_casa_rpg_app/shared/enum/avatar_size.dart';

class AvatarView extends StatelessWidget {
  final String path;
  final AvatarSize avatarSize;
  
  const AvatarView({super.key, required this.path, required this.avatarSize});

  double getSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    switch (avatarSize) {
      case AvatarSize.big:
        return width*0.7;
      case AvatarSize.medium:
        return width*0.2;
      case AvatarSize.small:
        return width*0.15;
    }
  }

  @override
  Widget build(BuildContext context) {
    final avatarSize = getSize(context);
    return Image.asset(
        path, 
        filterQuality: FilterQuality.none,
        width: avatarSize,
        height: avatarSize,
        fit: BoxFit.contain,
    );
  } 
}