import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minha_casa_rpg_app/core/design/backgrounds.dart';
import 'package:minha_casa_rpg_app/l10n/app_localizations.dart';
import 'package:minha_casa_rpg_app/shared/widgets/rpg_step_buttom.dart';

class RepublicaStep extends ConsumerWidget {
  final VoidCallback onEntrar, onCriar, onPrevious;
  const RepublicaStep({super.key, required this.onEntrar, required this.onCriar, required this.onPrevious});

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
                      spacing: 16,
                      children: [
                        Text(l10n.chooseHouseTitle,
                        style: Theme.of(context).textTheme.titleLarge,
                        textAlign: TextAlign.center,
                        ),
                        Text(l10n.chooseHouseSubtitle,
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 0),
                        RpgStepButtom(texto: l10n.create, function: onCriar),
                        RpgStepButtom(texto: l10n.join, function: onEntrar),
                        RpgStepButtom(texto: l10n.back, function: onPrevious, color: Theme.of(context).colorScheme.error)
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