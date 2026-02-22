import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minha_casa_rpg_app/features/tarefas/widgets/new_task/steps/rpg_step_buttom.dart';

class ColorStep extends ConsumerWidget {
  final VoidCallback onNext, onPrevious;
  const ColorStep({super.key, required this.onNext, required this.onPrevious});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Column(
        children: [
          Text("Escolha uma cor!"),
          RpgStepButtom(texto: "Próximo", function: onNext),
          RpgStepButtom(texto: "Voltar", function: onPrevious)
        ],
      ),
    );
  }
}