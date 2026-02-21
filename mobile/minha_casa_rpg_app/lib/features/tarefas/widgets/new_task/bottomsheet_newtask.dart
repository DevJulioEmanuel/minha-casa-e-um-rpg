import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:minha_casa_rpg_app/features/republica/data/tipo_tarefa.dart';
import 'package:minha_casa_rpg_app/features/tarefas/widgets/card_tasks/buttom_bottomsheets.dart';
import 'package:minha_casa_rpg_app/features/tarefas/widgets/new_task/build_nivelchip.dart';

class BottomsheetNewtaskl extends StatefulWidget {
  final double heightScreen;
  const BottomsheetNewtaskl({
    super.key,
    required this.heightScreen
    });

  @override
  State<BottomsheetNewtaskl> createState() => _BottomsheetNewtaskl();
}

class _BottomsheetNewtaskl extends State<BottomsheetNewtaskl> {
  DateTime? dataTask = null;
  final TextEditingController tituloTaskController = TextEditingController();

  Future<void> selecionarData(BuildContext context) async {
    final DateTime? dataSelecionada = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), 
      firstDate: DateTime(2026), 
      lastDate: DateTime(2027)
    );
    setState(() {
      dataTask = dataSelecionada;
    }); 
    
  }

  TipoTarefa? tipoSelecionado;
  String nivelDificuldade = "facil";
  
  @override
Widget build(BuildContext context) {
  final theme = Theme.of(context);

  return Padding(
    padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
    child: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// TÍTULO
          Center(
            child: Text(
              "NOVA TAREFA",
              style: theme.textTheme.titleLarge,
            ),
          ),

          const SizedBox(height: 32),

          /// DESCRIÇÃO
          TextField(
            controller: tituloTaskController,
            decoration: InputDecoration(
              labelText: "Descreva a atividade",
              prefixIcon: const Icon(Icons.edit),
              prefixIconColor: Theme.of(context).colorScheme.secondary,
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

          const SizedBox(height: 28),

          /// DATA
          Text(
            "Data",
            style: theme.textTheme.titleMedium,
          ),

          const SizedBox(height: 8),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => selecionarData(context),
              icon: const Icon(Icons.calendar_month),
              label: Text(
                dataTask == null
                  ? "Selecionar data"
                  : DateFormat('dd/MM/yyyy').format(dataTask!),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Theme.of(context).colorScheme.primary),
              ),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),

          const SizedBox(height: 28),

          /// TIPO
          Text(
            "Tipo da tarefa",
            style: theme.textTheme.titleMedium,
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<TipoTarefa>(
            value: tipoSelecionado,
            decoration: InputDecoration(
              labelText: "Selecione",

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
            items: const [
              DropdownMenuItem(
                value: TipoTarefa.fixa,
                child: Text("Fixa"),
              ),
              DropdownMenuItem(
                value: TipoTarefa.revezamento,
                child: Text("Revezamento"),
              ),
              DropdownMenuItem(
                value: TipoTarefa.pontual,
                child: Text("Pontual"),
              ),
              DropdownMenuItem(
                value: TipoTarefa.desafio,
                child: Text("Desafio"),
              ),
              DropdownMenuItem(
                value: TipoTarefa.coletiva,
                child: Text("Coletivo"),
              ),
            ],
            onChanged: (value) {
              setState(() {
                tipoSelecionado = value;
              });
            },
          ),

          const SizedBox(height: 28),

          /// NÍVEL
          Text(
            "Nível da tarefa",
            style: theme.textTheme.titleMedium,
          ),

          const SizedBox(height: 12),

          Wrap(
          spacing: 10,
          children: [
            BuildNivelChip(
              valor: "facil",
              label: "FÁCIL",
              nivelSelecionado: nivelDificuldade,
              onSelecionado: (valor) {
                setState(() {
                  nivelDificuldade = valor;
                });
              },
            ),
            BuildNivelChip(
              valor: "medio",
              label: "MÉDIO",
              nivelSelecionado: nivelDificuldade,
              onSelecionado: (valor) {
                setState(() {
                  nivelDificuldade = valor;
                });
              },
            ),
            BuildNivelChip(
              valor: "dificil",
              label: "DIFÍCIL",
              nivelSelecionado: nivelDificuldade,
              onSelecionado: (valor) {
                setState(() {
                  nivelDificuldade = valor;
                });
              },
            ),
          ],
        ),

          const SizedBox(height: 36),

          /// BOTÃO CRIAR
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // ação criar
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Text("CRIAR", style: Theme.of(context).textTheme.bodyLarge),
            ),
          ),
        ],
      ),
    ),
  );
}
}