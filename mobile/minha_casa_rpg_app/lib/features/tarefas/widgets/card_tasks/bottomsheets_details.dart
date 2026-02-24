import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:minha_casa_rpg_app/features/republica/data/atividades_modelfake.dart';
import 'package:minha_casa_rpg_app/features/tarefas/widgets/card_tasks/bottomsheets_stats.dart';
import 'package:minha_casa_rpg_app/features/tarefas/widgets/card_tasks/buttom_bottomsheets.dart';

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
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 15,
          children: [
            SizedBox(height: scaleImage*10),
            Text(
              atividade.texto,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 24)
            ),
            SizedBox(height: scaleImage*0.5),
            // NOME E FOTO DO USUARIO
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                  atividade.usuario.pathImage,
                  width: 30 * scaleImage,
                  height: 30 * scaleImage,
                  filterQuality: FilterQuality.none,
                  fit: BoxFit.fill,
                  )
                ),
                SizedBox(width: scaleImage*15),
                Text(
                  atividade.usuario.nomeUsuario,
                  style: Theme.of(context).textTheme.bodyLarge
                ),
              ],
            ),
           
            BottomsheetsStats(
              path: 'assets/icons/calendario.png', 
              texto: DateFormat('dd/MM/yyyy').format(atividade.dataPrevista),
              scaleImage: scaleImage
            ),
            
            BottomsheetsStats(
              path: 'assets/icons/ampulheta.png', 
              texto: atividade.statusTarefa.name.toString(),
              scaleImage: scaleImage
            ),
            BottomsheetsStats(
              path: 'assets/icons/etiqueta.png', 
              texto: atividade.tipoTarefa.name.toString(),
              scaleImage: scaleImage
            ),
            
            BottomsheetsStats(
              path: 'assets/icons/xp_estrela.png', 
              texto: "${atividade.xp.toString()} xp",
              scaleImage: scaleImage
            ),
            
            BottomsheetsStats(
              path: 'assets/icons/coins.png', 
              texto: "${atividade.coins.toString()} coins",
              scaleImage: scaleImage
            ),
      
            //BOTOES
      
            Center(child: ButtomBottomsheets(texto: "CONCLUIR TAREFA", cor: Theme.of(context).colorScheme.onError)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ButtomBottomsheets(texto: "EDITAR", cor: Theme.of(context).colorScheme.primary),
                ButtomBottomsheets(texto: "EXCLUIR", cor: Theme.of(context).colorScheme.error)
              ],
            ),
            SizedBox(width: scaleImage*15),
          ],
        ),
      ),
    );
  }
}