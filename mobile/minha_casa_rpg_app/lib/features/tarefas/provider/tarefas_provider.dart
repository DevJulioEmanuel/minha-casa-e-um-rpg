import 'package:flutter_riverpod/legacy.dart';
import 'package:minha_casa_rpg_app/db_fake/db_fake.dart';
import 'package:minha_casa_rpg_app/db_fake/tarefas_modelfake.dart';
import 'package:minha_casa_rpg_app/features/tarefas/provider/tarefas_state.dart';
import 'package:minha_casa_rpg_app/shared/enum/nivel_tarefa.dart';
import 'package:minha_casa_rpg_app/shared/enum/status_tarefa.dart';

final tarefasProvider = StateNotifierProvider<TarefasProvider, TarefasState>(
  (ref) => TarefasProvider()
);

class TarefasProvider extends StateNotifier<TarefasState>{
  TarefasProvider() : super(TarefasState.initial()) {
    carregarTarefas();
  }
  
  void setFiltro(StatusTarefa status) {
    state = state.copyWith(statusTarefa: status);
  }

  void criarTarefa(TarefasModelfake tarefa) {
    state = state.copyWith(
      tarefas: [...state.tarefas, tarefa]
    );
  }

  void carregarTarefas() {
    state = state.copyWith(
      tarefas: List.from(tarefas)
    );
  }

  void concluirTarefa(String idTarefa) {
    final tarefasUpdate = state.tarefas.map((tarefa) {
      if (idTarefa == tarefa.id) {
        return tarefa.copyWith(
          statusTarefa: StatusTarefa.concluida
        );
      }
      return tarefa;
    }).toList();

    state = state.copyWith(
      tarefas: tarefasUpdate  
    );
  }

  void editarTarefa(String idTarefa, String texto, DateTime dataPrevista, NivelTarefa nivelTarefa) {
    state = state.copyWith(
      tarefas: state.tarefas.map((tarefa) {
        if (idTarefa == tarefa.id) {
          return tarefa.copyWith(
            texto: texto,
            dataPrevista: dataPrevista,
            nivelTarefa: nivelTarefa
          );
        }
        return tarefa;
      }).toList()
    );
  }

  void excluirTarefa(String idTarefa) {
    final tarefasUpdate = 
      state.tarefas.where((tarefa) => tarefa.id != idTarefa).toList();
    state = state.copyWith(
      tarefas: tarefasUpdate
    );
  }
}