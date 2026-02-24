import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minha_casa_rpg_app/features/onboarding/provider/onboarding_provider.dart';
import 'package:minha_casa_rpg_app/features/onboarding/widgets/textfield_name.dart';
import 'package:minha_casa_rpg_app/features/tarefas/widgets/new_task/steps/rpg_step_buttom.dart';

class NameStep extends ConsumerWidget {
  final VoidCallback onNext;
  final TextEditingController namecontroller;
  const NameStep({super.key, required this.onNext, required this.namecontroller});

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
                        Text("Bem-vindo ao seu novo capítulo!",
                        style: Theme.of(context).textTheme.titleLarge,
                        textAlign: TextAlign.center,
                        ),
                        Text("Antes de entrar na república, precisamos saber como você quer ser conhecido.",
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 0),
                        TextfieldName(label: "Nome do guerreiro", controller: namecontroller),
                        SizedBox(height: 0),
                        RpgStepButtom(texto: "PRÓXIMO", function: () { 
                          FocusScope.of(context).unfocus(); 
                          final name = namecontroller.text.trim();
                          if (name.length<3) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("o nome deve ter no mínimo 3 caracteres.")
                              )
                            );
                            return;
                          }
                          ref.read(
                            onboardingProvider.notifier
                          ).setName(namecontroller.text);
                          onNext();
                          },
                        )
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