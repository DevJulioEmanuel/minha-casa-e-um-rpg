import 'package:flutter/material.dart';
import 'package:minha_casa_rpg_app/shared/enum/avatar_size.dart';
import 'package:minha_casa_rpg_app/features/avatares/avatar_view.dart';

class CardAtividade extends StatelessWidget {
  final String path;
  final String texto;
  final Color corUsuario;

  const CardAtividade({
    super.key,
    required this.path,
    required this.texto,
    required this.corUsuario,
    });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
      color: corUsuario,
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            AvatarView(
              path: path,
              avatarSize: AvatarSize.small
            ),
            Expanded(
              child: Text(
                texto,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
              ),
            )
          ]
        ),
      ),
    );
  }
}