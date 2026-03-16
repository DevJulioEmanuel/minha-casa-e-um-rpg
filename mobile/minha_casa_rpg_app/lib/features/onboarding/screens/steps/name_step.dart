import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minha_casa_rpg_app/core/design/backgrounds.dart';
import 'package:minha_casa_rpg_app/features/onboarding/provider/onboarding_provider.dart';
import 'package:minha_casa_rpg_app/features/onboarding/widgets/textfield_name.dart';
import 'package:minha_casa_rpg_app/l10n/app_localizations.dart';
import 'package:minha_casa_rpg_app/shared/widgets/rpg_step_buttom.dart';

class NameStep extends ConsumerWidget {
  final VoidCallback onNext;
  final TextEditingController namecontroller;
  const NameStep({super.key, required this.onNext, required this.namecontroller});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final background = Backgrounds.backgroundCasas.label;
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
                      spacing: 16,
                      children: [
                        Text(l10n.onboardingTitle,
                        style: Theme.of(context).textTheme.titleLarge,
                        textAlign: TextAlign.center,
                        ),
                        Text(l10n.onboardingSubtitle,
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 5),
                        TextfieldName(label: l10n.warriorName, controller: namecontroller),
                        SizedBox(height: 0),
                        RpgStepButtom(texto: l10n.next, function: () { 
                          FocusScope.of(context).unfocus(); 
                          final name = namecontroller.text.trim();
                          if (name.length<3) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(l10n.nameError)
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