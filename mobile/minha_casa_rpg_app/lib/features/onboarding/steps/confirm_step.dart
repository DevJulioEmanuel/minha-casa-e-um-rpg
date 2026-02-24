import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minha_casa_rpg_app/features/avatares/avatar_size.dart';
import 'package:minha_casa_rpg_app/features/onboarding/provider/onboarding_provider.dart';
import 'package:minha_casa_rpg_app/features/onboarding/widgets/avatar_view_onboarding.dart';
import 'package:minha_casa_rpg_app/features/tarefas/widgets/new_task/steps/rpg_step_buttom.dart';

class ConfirmStep extends ConsumerWidget {
  final VoidCallback onNext, onPrevious;
  const ConfirmStep({super.key, required this.onNext, required this.onPrevious});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onboarding = ref.watch(onboardingProvider);
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
                  child: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: const Color.fromARGB(238, 241, 250, 250)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        spacing: 18,
                        children: [
                          Text("Deseja concluir seu guerreiro?",
                          style: Theme.of(context).textTheme.titleLarge,
                          textAlign: TextAlign.center,
                          ),
                          Divider(color: Theme.of(context).colorScheme.secondary, thickness: 0.5),
                          Text(onboarding.nome.toString(),
                          style: Theme.of(context).textTheme.titleLarge
                          ),
                          AvatarViewOnboarding(path: onboarding.avatar!.imagePath, avatarSize: AvatarSize.big, cor: onboarding.cor!.color),
                          SizedBox(height: 8),
                          RpgStepButtom(texto: "CONCLUIR", function: () async {
                            await ref.read(onboardingProvider.notifier).criarUsuario();
                            onNext();
                            }),
                          RpgStepButtom(texto: "VOLTAR", function: onPrevious, color: Theme.of(context).colorScheme.error)
                        ],
                      ),
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