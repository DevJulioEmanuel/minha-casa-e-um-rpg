import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minha_casa_rpg_app/shared/widgets/rpg_step_buttom.dart';

class RepublicaStep extends ConsumerWidget {
  final VoidCallback onEntrar, onCriar, onPrevious;
  const RepublicaStep({super.key, required this.onEntrar, required this.onCriar, required this.onPrevious});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/images/panteao_grego.png',
            fit: BoxFit.cover,
            ) 
          ),
          Positioned.fill(
            child: SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Container(
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: const Color.fromARGB(238, 241, 250, 250)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      spacing: 16,
                      children: [
                        Text("Agora escolha onde vai morar",
                        style: Theme.of(context).textTheme.titleLarge,
                        textAlign: TextAlign.center,
                        ),
                        Text("Você pode fundar uma nova república ou entrar em uma já existente.",
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 0),
                        RpgStepButtom(texto: "CRIAR", function: onCriar),
                        RpgStepButtom(texto: "ENTRAR", function: onEntrar),
                        RpgStepButtom(texto: "VOLTAR", function: onPrevious, color: Theme.of(context).colorScheme.error)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}