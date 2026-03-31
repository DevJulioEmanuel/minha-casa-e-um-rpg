import 'package:minha_casa_rpg_app/db_fake/tarefas_modelfake.dart';
import 'package:minha_casa_rpg_app/shared/enum/status_tarefa.dart';

class TarefasState {
  final StatusTarefa statusTarefa;
  final List<TarefasModelfake> tarefas;

  TarefasState({
    this.statusTarefa = StatusTarefa.pendente,
    this.tarefas = const []
  });

  TarefasState copyWith({
    StatusTarefa? statusTarefa,
    List<TarefasModelfake>? tarefas
  }) {
    return TarefasState(
      statusTarefa: statusTarefa ?? this.statusTarefa,
      tarefas: tarefas ?? this.tarefas
    );
  }

  factory TarefasState.initial() => TarefasState();
}