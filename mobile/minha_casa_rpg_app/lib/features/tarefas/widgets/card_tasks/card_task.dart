import 'package:flutter/material.dart';
import 'package:minha_casa_rpg_app/db_fake/tarefas_modelfake.dart';
import 'package:minha_casa_rpg_app/features/republica/widgets/card_atividade.dart';
import 'package:minha_casa_rpg_app/features/tarefas/widgets/card_tasks/bottomsheets_details.dart';

class CardTask extends StatelessWidget {
  final TarefasModelfake atividade;
  final double scaleImage;

  const CardTask({
    super.key,
    required this.atividade,
    required this.scaleImage,
  });

  void openAtividade(BuildContext context) {
    showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      useSafeArea: true,
      showDragHandle: false,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).padding.bottom,
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(24),
              ),
              image: DecorationImage(
                image: AssetImage("assets/texture/textura_papel.png"),
                fit: BoxFit.cover,
                opacity: 1
              )
            ),
            child: Wrap(
              children: [ 
                BottomsheetsDetails(idTarefa: atividade.id, scaleImage: scaleImage)
              ]
            ),
          )
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () { openAtividade(context); },
      child: CardAtividade(
        path: atividade.usuario.pathImage, 
        texto: atividade.texto, 
        corUsuario: Color(atividade.usuario.corUsuario), 
      ),
    );
  }
}