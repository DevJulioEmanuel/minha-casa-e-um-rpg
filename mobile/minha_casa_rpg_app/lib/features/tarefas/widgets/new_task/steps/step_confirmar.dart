import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minha_casa_rpg_app/db_fake/db_fake.dart';
import 'package:minha_casa_rpg_app/db_fake/tarefas_modelfake.dart';
import 'package:minha_casa_rpg_app/features/tarefas/provider/tarefas_provider.dart';
import 'package:minha_casa_rpg_app/features/tarefas/widgets/card_tasks/bottomsheets_stats.dart';
import 'package:minha_casa_rpg_app/shared/enum/status_tarefa.dart';
import 'package:minha_casa_rpg_app/shared/enum/tipo_tarefa.dart';
import 'package:minha_casa_rpg_app/shared/widgets/buttom_no_cor.dart';
import 'package:minha_casa_rpg_app/shared/widgets/rpg_step_buttom.dart';

class StepConfirmar extends ConsumerWidget {
  final String descricao;
  final TipoTarefa tipo;
  final String nivel;
  final DateTime data;
  final VoidCallback onBack;

  const StepConfirmar({
    super.key,
    required this.descricao,
    required this.tipo,
    required this.nivel,
    required this.data,
    required this.onBack
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      key: const ValueKey(4),
      mainAxisSize: MainAxisSize.min,
      spacing: 16,
      children: [
        Text("Confirmar missão",
            style: Theme.of(context).textTheme.titleMedium),
          
        Row(
          children: [
            Text(descricao,
            style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        BottomsheetsStats(
          path: 'assets/icons/calendario.png', 
          texto: "${data.day}/${data.month}/${data.year}",
          scaleImage: 1
        ),
        BottomsheetsStats(
          path: 'assets/icons/etiqueta.png', 
          texto: tipo.name,
          scaleImage: 1
        ),
        BottomsheetsStats(
          path: 'assets/icons/nivel_tarefa.png', 
          texto: nivel,
          scaleImage: 1
        ),
        RpgStepButtom(
          texto: "CRIAR MISSÃO", 
          function: () {
            ref.read(tarefasProvider.notifier).criarTarefa(
              TarefasModelfake(
                texto: descricao, 
                usuario: usuarios[0], 
                dataCriada: DateTime.now(), 
                dataPrevista: data, 
                xp: 300, 
                coins: 100, 
                tipoTarefa: tipo, 
                statusTarefa: StatusTarefa.pendente
              )
            );
            Navigator.pop(context);
          }
        ),
        ButtomNoCor(texto: "VOLTAR", color: Colors.red, function: onBack)
      ],
    );
  }
}