import 'package:flutter/material.dart';
import 'package:minha_casa_rpg_app/shared/enum/avatar_size.dart';
import 'package:minha_casa_rpg_app/features/avatares/avatar_view.dart';

class CardRanking extends StatelessWidget {
  final String path;
  final String nomeUsuario;
  final int xp;
  final int cor;

  const CardRanking({
    super.key,
    required this.path,
    required this.nomeUsuario,
    required this.cor,
    required this.xp,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Row(
        children: [
          Material(
            borderRadius: BorderRadius.circular(12),
            clipBehavior: Clip.antiAlias,
            color: Color(cor),
            elevation: 5,
            child: AvatarView(path: path, avatarSize: AvatarSize.medium)
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                nomeUsuario,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 20.0),
                ),
              Text(
                "$xp xp",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 15.0, color: Colors.blueGrey),
              ),
            ],
          )
        ]
      ),
    );
  }
}