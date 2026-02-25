import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minha_casa_rpg_app/features/onboarding/provider/onboarding_provider.dart';
import 'package:minha_casa_rpg_app/features/onboarding/widgets/textfield_name.dart';
import 'package:minha_casa_rpg_app/shared/widgets/rpg_step_buttom.dart';

class CriarRepublicaStep extends ConsumerWidget {
  final VoidCallback onPrevious;
  final TextEditingController nomeRepublicacontroller;
  const CriarRepublicaStep({super.key, required this.onPrevious, required this.nomeRepublicacontroller});

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
                      spacing: 24,
                      children: [
                        Text("Fundar uma nova República",
                        style: Theme.of(context).textTheme.titleLarge,
                        textAlign: TextAlign.center,
                        ),
                        Text("Define o nome. Toda grande história começa com alguém que decidiu dar o primeiro passo.",
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                        ),
                        TextfieldName(label: "Nome da república", controller: nomeRepublicacontroller),
                        RpgStepButtom(texto: "CRIAR", function: () async {
                          ref.read(
                            onboardingProvider.notifier
                          ).setNomeRepublica(nomeRepublicacontroller.text);
                          debugPrint("Nome antes de criar: ${ref.read(onboardingProvider).nomeRepublica}");
                          await ref.read(onboardingProvider.notifier).criarRepublica();
                        }),
                        RpgStepButtom(texto: "VOLTAR", color: Theme.of(context).colorScheme.error, function: () async { 
                          FocusScope.of(context).unfocus();
                          onPrevious();
                          }
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