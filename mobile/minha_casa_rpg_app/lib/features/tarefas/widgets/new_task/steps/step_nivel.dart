import 'package:flutter/material.dart';
import 'package:minha_casa_rpg_app/features/republica/data/nivel_tarefa.dart';
import 'package:minha_casa_rpg_app/features/tarefas/widgets/new_task/steps/rpg_step_buttom.dart';

class StepNivel extends StatelessWidget {
  final Function(String) onNext;
  final VoidCallback onBack;

  const StepNivel({super.key, required this.onNext, required this.onBack});

  @override
  Widget build(BuildContext context) {

    return Column(
      key: const ValueKey(2),
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("NIVEL DA MISSÃO",
        style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height:10),
        Text("Escolha um nivel da tarefa",
        style: Theme.of(context).textTheme.bodyLarge,
        textAlign: TextAlign.center,
        ),
        SizedBox(height:10),
        Wrap(
          spacing: 8,
          children: [
            ChoiceChip(
              label: Text(NivelTarefa.facil.name),
              selected: false,
              onSelected: (_) => onNext(NivelTarefa.facil.name),
            ),
            ChoiceChip(
              label: Text(NivelTarefa.medio.name),
              selected: false,
              onSelected: (_) => onNext(NivelTarefa.medio.name),
            ),
            ChoiceChip(
              label: Text(NivelTarefa.dificil.name),
              selected: false,
              onSelected: (_) => onNext(NivelTarefa.dificil.name),
            ),
          ],
        ),
        SizedBox(height: 18),
        RpgStepButtom(texto: "VOLTAR", function: onBack)
      ],
    );
  }
}