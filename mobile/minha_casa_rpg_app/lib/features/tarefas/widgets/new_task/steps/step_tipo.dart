import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:minha_casa_rpg_app/shared/enum/tipo_tarefa.dart';
import 'package:minha_casa_rpg_app/shared/widgets/buttom_no_cor.dart';
import 'package:minha_casa_rpg_app/shared/widgets/rpg_step_buttom.dart';

class StepTipo extends StatelessWidget {
  final Function(TipoTarefa) onNext;
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
              onSelected: (_) => onNext(TipoTarefa.fixa),
            ),
            ChoiceChip(
              label: Text(TipoTarefa.pontual.name),
              selected: false,
              onSelected: (_) => onNext(TipoTarefa.fixa),
            ),
            ChoiceChip(
              label: Text(TipoTarefa.desafio.name),
              selected: false,
              onSelected: (_) => onNext(TipoTarefa.fixa),
            ),
            ChoiceChip(
              label: Text(TipoTarefa.coletiva.name),
              selected: false,
              onSelected: (_) => onNext(TipoTarefa.fixa),
            ),
            ChoiceChip(
              label: Text(TipoTarefa.revezamento.name),
              selected: false,
              onSelected: (_) => onNext(TipoTarefa.coletiva),
            ),
          ],
        ),
        SizedBox(height: 18),
        RpgStepButtom(texto: "VOLTAR", function: onBack),
        SizedBox(height: 18),
        ButtomNoCor(texto: "CANCELAR", color: Colors.red, function: context.pop)
      ],
    );
  }
}