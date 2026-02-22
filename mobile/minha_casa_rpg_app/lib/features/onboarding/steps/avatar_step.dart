import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minha_casa_rpg_app/features/tarefas/widgets/new_task/steps/rpg_step_buttom.dart';

class AvatarStep extends ConsumerWidget {
  final VoidCallback onNext, onPrevious;
  const AvatarStep({super.key, required this.onNext, required this.onPrevious});
  
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
                      color: const Color.fromARGB(239, 230, 255, 255)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      spacing: 24,
                      children: [
                        Text("Escolha um avatar, guerreiro!",
                        style: Theme.of(context).textTheme.titleLarge,
                        
                        ),
                        SizedBox(height: 300),
                        RpgStepButtom(texto: "PRÓXIMO", function: onNext),
                        RpgStepButtom(texto: "VOLTAR", function: onPrevious)
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