import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:minha_casa_rpg_app/features/republica/data/tipo_tarefa.dart';

class NewtaskModal extends StatefulWidget {
  final double heightScreen;
  const NewtaskModal({
    super.key,
    required this.heightScreen
    });

  @override
  State<NewtaskModal> createState() => _NewtaskModal();
}

class _NewtaskModal extends State<NewtaskModal> {
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
  String? nivelDificuldade;
  
  @override
  Widget build(BuildContext context) {
    
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 15,
          children: [
            Text(
              "NOVA TAREFA",
              style: Theme.of(context).textTheme.titleLarge
            ),

            SizedBox(height: widget.heightScreen*0.01),


            // TITULO DA TAREFA
            TextField(
              controller: tituloTaskController,
              decoration: InputDecoration(
                labelText: "O que você vai fazer?",
                labelStyle: TextStyle(
                  color: Theme.of(context).colorScheme.secondary
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.secondary
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.secondary
                  )
                ),
              )
            ),

            // ESCOLHA DA DATA
            ElevatedButton(
              onPressed: () => selecionarData(context),
              style: ElevatedButton.styleFrom(

              ),
              child: Text(
                dataTask == null
                ? "Selecionar Data"
                : DateFormat('dd/MM/yyyy').format(dataTask!)
              )
            ),

            // ESCOLHA DO TIPO DA TAREFA
            DropdownButtonFormField(
              decoration: InputDecoration(
                labelText: "Tipo de Tarefa" 
              ),
              items: const [
                DropdownMenuItem(
                  value: TipoTarefa.fixa,
                  child: Text("Fixa")
                ),
                DropdownMenuItem(
                  value: TipoTarefa.revezamento,
                  child: Text("Revezameto")
                ),
                DropdownMenuItem(
                  value: TipoTarefa.pontual,
                  child: Text("Pontual")
                ),
                DropdownMenuItem(
                  value: TipoTarefa.desafio,
                  child: Text("Desafio")
                ),
                DropdownMenuItem(
                  value: TipoTarefa.coletiva,
                  child: Text("Coletivo")
                )
              ], 
              onChanged: (value) {
                setState(() {
                  tipoSelecionado = value;
                });
              }
            ),
            
            // ESCOLHA DO NIVEL DA TAREFA
            Text("QUAL O NÍVEL DA TAREFA?"),
            Wrap(
              spacing: 8,
              children: [
                ChoiceChip(
                  label: const Text("FÁCIL"), 
                  labelStyle: TextStyle(
                    color : nivelDificuldade == "facil"
                    ? Colors.white
                    : Theme.of(context).colorScheme.secondary
                  ),
                  selected: nivelDificuldade == "facil",
                  selectedColor: Theme.of(context).colorScheme.primary,
                  checkmarkColor: Colors.white,
                  onSelected: (_) {
                    setState(() {
                      nivelDificuldade = "facil";
                    });
                  },
                ),
                ChoiceChip(
                  label: const Text("MÉDIO"), 
                  selected: nivelDificuldade == "medio",
                  labelStyle: TextStyle(
                    color : nivelDificuldade == "medio"
                    ? Colors.white
                    : Theme.of(context).colorScheme.secondary
                  ),
                  selectedColor: Theme.of(context).colorScheme.primary,
                  checkmarkColor: Colors.white,
                  onSelected: (_) {
                    setState(() {
                      nivelDificuldade = "medio";
                    });
                  },
                ),
                ChoiceChip(
                  label: const Text("DIFÍCIL"), 
                  labelStyle: TextStyle(
                    color : nivelDificuldade == "dificil"
                    ? Colors.white
                    : Theme.of(context).colorScheme.secondary
                  ),
                  selected: nivelDificuldade == "dificil",
                  selectedColor: Theme.of(context).colorScheme.primary,
                  checkmarkColor: Colors.white,
                  onSelected: (_) {
                    setState(() {
                      nivelDificuldade = "dificil";
                    });
                  },
                )
              ],
            )
          ]
        )
      )
    );
  }
}