import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:minha_casa_rpg_app/db_fake/tarefas_modelfake.dart';
import 'package:minha_casa_rpg_app/features/tarefas/provider/tarefas_provider.dart';
import 'package:minha_casa_rpg_app/features/tarefas/widgets/card_tasks/bottomsheets_stats.dart';
import 'package:minha_casa_rpg_app/features/tarefas/widgets/card_tasks/buttom_bottomsheets.dart';
import 'package:minha_casa_rpg_app/features/tarefas/widgets/edit_task/dialog_edit_task.dart';
import 'package:minha_casa_rpg_app/shared/enum/status_tarefa.dart';

class BottomsheetsDetails extends ConsumerWidget {
  final String idTarefa;
  final double scaleImage;

  const BottomsheetsDetails({
    super.key,
    required this.idTarefa,
    required this.scaleImage
  });

  void openEditTask(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            width: 320,
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Color(0xFFF3EFE6),
              borderRadius: BorderRadius.circular(24),
              image: DecorationImage(
                image: AssetImage("assets/texture/textura_papel.png") ,
                fit: BoxFit.cover,
                opacity: 0.95
              ),
            ),
            child: DialogEditTask(idTarefa: idTarefa),
          ),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final atividade = ref.watch(tarefasProvider)
      .tarefas
      .firstWhere((tarefa) => tarefa.id==idTarefa);

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
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 24, color: Colors.black)
            ),
            SizedBox(height: scaleImage*0.5),

            // NOME E FOTO DO USUARIO
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(atividade.usuario.corUsuario),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.asset(
                  atividade.usuario.pathImage,
                  width: 32 * scaleImage,
                  height: 32 * scaleImage,
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
              path: 'assets/icons/nivel_tarefa.png', 
              texto: atividade.nivelTarefa.name,
              scaleImage: scaleImage
            ),
            BottomsheetsStats(
              path: 'assets/icons/etiqueta.png', 
              texto: atividade.tipoTarefa.name.toString(),
              scaleImage: scaleImage
            ),
            BottomsheetsStats(
              path: 'assets/icons/ampulheta.png', 
              texto: atividade.statusTarefa.name.toString(),
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
            atividade.statusTarefa != StatusTarefa.concluida 
            ? Center(
              child: ButtomBottomsheets(
                texto: "CONCLUIR TAREFA", 
                function: () { ref.read(tarefasProvider.notifier).concluirTarefa(atividade.id); }, 
                cor: Theme.of(context).colorScheme.onError)
            ) 
            : SizedBox.shrink(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if (atividade.statusTarefa!=StatusTarefa.concluida) ButtomBottomsheets(texto: "EDITAR", function: () => openEditTask(context), cor: Theme.of(context).colorScheme.primary),
                ButtomBottomsheets(texto: "EXCLUIR", function: () {
                  Navigator.pop(context);
                  ref.read(tarefasProvider.notifier).excluirTarefa(atividade.id);
                  }, 
                  cor: Theme.of(context).colorScheme.error)
                  
              ],
            ),
            SizedBox(width: scaleImage*15),
          ],
        ),
      ),
    );
  }
}