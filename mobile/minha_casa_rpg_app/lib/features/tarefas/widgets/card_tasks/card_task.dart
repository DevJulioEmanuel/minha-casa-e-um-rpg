import 'package:flutter/material.dart';
import 'package:minha_casa_rpg_app/db_fake/atividades_modelfake.dart';
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
      showDragHandle: false,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFF3EFE6),
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(24),
              ),
              image: DecorationImage(
                image: AssetImage("assets/texture/textura_papel.png"),
                fit: BoxFit.cover,
                opacity: 0.2
              )
            ),
            child: Wrap(
              children: [ 
                BottomsheetsDetails(atividade: atividade, scaleImage: scaleImage)
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
      onTap: openAtividade,
      child: CardAtividade(
        path: atividade.usuario.pathImage, 
        texto: atividade.texto, 
        corUsuario: Color(atividade.usuario.corUsuario), 
      ),
    );
  }
}