import 'package:flutter_riverpod/legacy.dart';
import 'package:minha_casa_rpg_app/db_fake/db_fake.dart';
import 'package:minha_casa_rpg_app/db_fake/tarefas_modelfake.dart';
import 'package:minha_casa_rpg_app/features/tarefas/provider/tarefas_state.dart';
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
}