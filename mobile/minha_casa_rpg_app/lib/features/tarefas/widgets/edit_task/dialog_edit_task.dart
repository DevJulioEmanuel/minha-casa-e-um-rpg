import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:minha_casa_rpg_app/features/tarefas/provider/tarefas_provider.dart';
import 'package:minha_casa_rpg_app/features/tarefas/widgets/card_tasks/buttom_bottomsheets.dart';
import 'package:minha_casa_rpg_app/shared/enum/nivel_tarefa.dart';
import 'package:minha_casa_rpg_app/shared/widgets/buttom_no_cor.dart';

class DialogEditTask extends ConsumerStatefulWidget {
  final String idTarefa;

  const DialogEditTask({
    super.key,
    required this.idTarefa,
  });

  @override
  ConsumerState<DialogEditTask> createState() => _DialogEditTaskState();
}

class _DialogEditTaskState extends ConsumerState<DialogEditTask> {

  late TextEditingController descricaoController;
  late DateTime dataSelecionada;
  late NivelTarefa nivelSelecionado;

  @override
  void initState() {
    super.initState();

    final atividade = ref.read(tarefasProvider)
        .tarefas
        .firstWhere((t) => t.id == widget.idTarefa);

    descricaoController =
        TextEditingController(text: atividade.texto);
    dataSelecionada = atividade.dataPrevista;
    nivelSelecionado = atividade.nivelTarefa;
}
  @override
  Widget build(BuildContext context) {
    final atividade = ref.watch(tarefasProvider)
      .tarefas
      .firstWhere((tarefa) => tarefa.id==widget.idTarefa);

  

    return Padding(
      padding: const EdgeInsets.all(24),
      child: SingleChildScrollView(
        child: Column(
          spacing: 4,
          mainAxisSize: MainAxisSize.min,
          children: [

            /// TÍTULO
            Text(
              "Editar Tarefa",
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: 24),

            /// DESCRIÇÃO
            TextField(
              controller: descricaoController,
              decoration: const InputDecoration(
                labelText: "Descrição",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            /// DATA
            ListTile(
              title: const Text("Data prevista"),
              subtitle: Text(
                DateFormat('dd/MM/yyyy').format(dataSelecionada),
              ),
              trailing: Image.asset("assets/icons/calendario.png"),
              onTap: () async {
                final novaData = await showDatePicker(
                  context: context,
                  initialDate: dataSelecionada,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2027),
                );

                if (novaData != null) {
                  setState(() {
                    dataSelecionada = novaData;
                  });
                }
              },
            ),

            const SizedBox(height: 16),

            /// NÍVEL
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<NivelTarefa>(
                    initialValue: nivelSelecionado,
                    items: NivelTarefa.values.map((nivel) {
                      return DropdownMenuItem(
                        value: nivel,
                        child: Text(nivel.name),
                      );
                    }).toList(),
                    onChanged: (novoNivel) {
                      if (novoNivel != null) {
                        setState(() {
                          nivelSelecionado = novoNivel;
                        });
                      }
                    },
                    decoration: const InputDecoration(
                      labelText: "Nível da tarefa",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  
                ),
                SizedBox(width: 10),
                Image.asset("assets/icons/nivel_tarefa.png"),
              ],
            ),

            const SizedBox(height: 24),

            /// BOTÕES
            Column(
              spacing: 24,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtomBottomsheets(
                  texto: "SALVAR EDIÇÃO",
                  function: () {
                    ref.read(tarefasProvider.notifier).editarTarefa(
                      atividade.id, 
                      descricaoController.text,
                      dataSelecionada, 
                      nivelSelecionado
                    );
                    Navigator.pop(context);
                  }, 
                  cor: Theme.of(context).colorScheme.onError,
                ),
                
                ButtomNoCor(
                  texto: "CANCELAR",
                  function: () {
                    Navigator.pop(context);
                  },
                  color: Colors.red,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}