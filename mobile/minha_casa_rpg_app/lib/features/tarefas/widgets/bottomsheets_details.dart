import 'package:flutter/material.dart';
import 'package:minha_casa_rpg_app/features/republica/data/atividades_modelfake.dart';

class BottomsheetsDetails extends StatelessWidget {
  final AtividadesModelFake atividade;
  final double scaleImage;
  const BottomsheetsDetails({
    super.key,
    required this.atividade,
    required this.scaleImage
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 20,
        children: [
          Text(
            "TAREFA:",
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 30),
          ),
          Text(
            atividade.texto,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 20)
          ),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                atividade.usuario.pathImage,
                width: 48 * scaleImage,
                height: 48 * scaleImage,
                filterQuality: FilterQuality.none,
                fit: BoxFit.fill,
                )
              ),
              SizedBox(width: scaleImage*15),
              Text(
                atividade.usuario.nomeUsuario,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 20)
                )
            ],
          )

        ] 
      ),
    );
  }
}