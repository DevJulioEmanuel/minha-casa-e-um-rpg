import 'package:flutter/material.dart';
import 'package:minha_casa_rpg_app/features/republica/data/atividades_modelfake.dart';
import 'package:minha_casa_rpg_app/features/republica/widgets/card_atividade.dart';
import 'package:minha_casa_rpg_app/features/tarefas/widgets/card_tasks/bottomsheets_details.dart';

class CardTask extends StatelessWidget {
  final AtividadesModelFake atividade;
  final BuildContext context;
  final double scaleImage;

  const CardTask({
    super.key,
    required this.atividade,
    required this.context,
    required this.scaleImage
  });

  void openAtividade() {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      showDragHandle: true,
      isScrollControlled: true,
      backgroundColor: Color.fromARGB(255, 215, 225, 240),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Wrap(
            children: [ 
              BottomsheetsDetails(atividade: atividade, scaleImage: scaleImage)
            ]
          )
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: openAtividade,
      child: CardAtividade(
        path: atividade.usuario.pathImage, 
        texto: atividade.texto, 
        corUsuario: Color(atividade.usuario.corUsuario), 
        scaleImage: scaleImage
      ),
    );
  }
}