import 'package:flutter/material.dart';
import 'package:minha_casa_rpg_app/features/tarefas/widgets/card_tasks/bottomsheets_stats.dart';
import 'package:minha_casa_rpg_app/shared/widgets/rpg_step_buttom.dart';

class StepConfirmar extends StatelessWidget {
  final String descricao;
  final String tipo;
  final String nivel;
  final DateTime? data;

  const StepConfirmar({
    super.key,
    required this.descricao,
    required this.tipo,
    required this.nivel,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
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
          texto: "${data?.day}/${data?.month}/${data?.year}",
          scaleImage: 1
        ),
        BottomsheetsStats(
          path: 'assets/icons/etiqueta.png', 
          texto: tipo,
          scaleImage: 1
        ),
        BottomsheetsStats(
          path: 'assets/icons/nivel_tarefa.png', 
          texto: nivel,
          scaleImage: 1
        ),
        RpgStepButtom(texto: "CRIAR MISSÃO", function: () => Navigator.pop(context))
      ],
    );
  }
}