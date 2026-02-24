import 'package:flutter/material.dart';
import 'package:minha_casa_rpg_app/features/republica/data/tipo_tarefa.dart';
import 'package:minha_casa_rpg_app/features/tarefas/widgets/new_task/steps/rpg_step_buttom.dart';

class StepTipo extends StatelessWidget {
  final Function(String) onNext;
  final VoidCallback onBack;

  const StepTipo({super.key, required this.onNext, required this.onBack});

  @override
  Widget build(BuildContext context) {

    return Column(
      key: const ValueKey(1),
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("TIPO DA MISSÃO",
        style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height:10),
        Text("Escolha um tipo de tarefa",
        style: Theme.of(context).textTheme.bodyLarge,
        textAlign: TextAlign.center,
        ),
        SizedBox(height:10),
        Wrap(
          alignment: WrapAlignment.center ,
          spacing: 8,
          children: [
            
            ChoiceChip(
              label: Text(TipoTarefa.fixa.name),
              selected: false,
              onSelected: (_) => onNext(TipoTarefa.fixa.name),
            ),
            ChoiceChip(
              label: Text(TipoTarefa.pontual.name),
              selected: false,
              onSelected: (_) => onNext(TipoTarefa.fixa.name),
            ),
            ChoiceChip(
              label: Text(TipoTarefa.desafio.name),
              selected: false,
              onSelected: (_) => onNext(TipoTarefa.fixa.name),
            ),
            ChoiceChip(
              label: Text(TipoTarefa.coletiva.name),
              selected: false,
              onSelected: (_) => onNext(TipoTarefa.fixa.name),
            ),
            ChoiceChip(
              label: Text(TipoTarefa.revezamento.name),
              selected: false,
              onSelected: (_) => onNext(TipoTarefa.coletiva.name),
            ),
          ],
        ),
        SizedBox(height: 18),
        RpgStepButtom(texto: "VOLTAR", function: onBack)
      ],
    );
  }
}