import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minha_casa_rpg_app/core/design/backgrounds.dart';
import 'package:minha_casa_rpg_app/features/onboarding/provider/onboarding_provider.dart';
import 'package:minha_casa_rpg_app/features/onboarding/widgets/textfield_name.dart';
import 'package:minha_casa_rpg_app/l10n/app_localizations.dart';
import 'package:minha_casa_rpg_app/shared/widgets/rpg_step_buttom.dart';

class CriarRepublicaStep extends ConsumerWidget {
  final VoidCallback onPrevious;
  final TextEditingController nomeRepublicacontroller;
  const CriarRepublicaStep({super.key, required this.onPrevious, required this.nomeRepublicacontroller});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final background = Backgrounds.backgroundCasas.label;
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(background,
            fit: BoxFit.cover,
            filterQuality: FilterQuality.none,
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
                        Text(l10n.foundHouseTitle,
                        style: Theme.of(context).textTheme.titleLarge,
                        textAlign: TextAlign.center,
                        ),
                        Text(l10n.foundHouseDescription,
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                        ),
                        TextfieldName(label: l10n.houseName, controller: nomeRepublicacontroller),
                        RpgStepButtom(texto: l10n.create, function: () async {
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