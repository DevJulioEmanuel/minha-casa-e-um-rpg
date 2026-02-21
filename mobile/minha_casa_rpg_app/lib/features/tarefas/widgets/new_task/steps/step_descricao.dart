import 'package:flutter/material.dart';
import 'package:minha_casa_rpg_app/features/tarefas/widgets/new_task/steps/rpg_step_buttom.dart';

class StepDescricao extends StatelessWidget {
  final ValueChanged<String> onNext;

  const StepDescricao({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return Column(
      key: const ValueKey(0),
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("Qual é a tarefa?",
          style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 16),
        TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: "Descreva a atividade",
              
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              labelStyle: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
              ),

              floatingLabelStyle: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.secondary,
                  width: 1.5,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.secondary,
                  width: 2,
                ),
              ),
            ),
          ),
        const SizedBox(height: 24),
        RpgStepButtom(texto: "Próximo", function: () => onNext(controller.text))
      ],
    );
  }
}