import 'package:flutter/material.dart';
import 'package:minha_casa_rpg_app/features/tarefas/widgets/new_task/steps/step_confirmar.dart';
import 'package:minha_casa_rpg_app/features/tarefas/widgets/new_task/steps/step_data.dart';
import 'package:minha_casa_rpg_app/features/tarefas/widgets/new_task/steps/step_descricao.dart';
import 'package:minha_casa_rpg_app/features/tarefas/widgets/new_task/steps/step_nivel.dart';
import 'package:minha_casa_rpg_app/features/tarefas/widgets/new_task/steps/step_tipo.dart';

class DialogNewtask extends StatefulWidget {
  const DialogNewtask({super.key});

  @override
  State<DialogNewtask> createState() => _DialogNewtask();
}

class _DialogNewtask extends State<DialogNewtask> {
  int step = 0;

  String descricao = "";
  String tipo = "";
  String nivel = "";
  DateTime? data;
  
  void next() => setState(() => step++);
  void back() => setState(() => step--);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 300),
      child: _builStep(),
    );
  }

  Widget _builStep() {
    switch (step) {
      case 0:
        return StepDescricao(onNext: (value) {
          descricao = value;
          next();
        });
      case 1:
        return StepTipo(
          onNext: (value) {
            tipo = value;
            next();
          },
          onBack: back,
        );
      case 2:
        return StepNivel(
          onNext: (value) {
            nivel = value;
            next();
          },
          onBack: back,
          );
      case 3:
        return StepData(
          onNext: (value) {
            data = value;
            next();
          },
          onBack: back,
          );
      default:
        return StepConfirmar(
          descricao: descricao,
          tipo: tipo,
          nivel: nivel,
          data: data,
        );
    }
  }
 
}