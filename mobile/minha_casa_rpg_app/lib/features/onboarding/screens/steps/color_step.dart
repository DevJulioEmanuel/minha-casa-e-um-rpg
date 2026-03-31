import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minha_casa_rpg_app/core/design/backgrounds.dart';
import 'package:minha_casa_rpg_app/l10n/app_localizations.dart';
import 'package:minha_casa_rpg_app/shared/enum/avatar_size.dart';
import 'package:minha_casa_rpg_app/features/avatares/data/color_repository.dart';
import 'package:minha_casa_rpg_app/features/onboarding/provider/onboarding_provider.dart';
import 'package:minha_casa_rpg_app/features/onboarding/widgets/avatar_view_onboarding.dart';
import 'package:minha_casa_rpg_app/shared/widgets/rpg_step_buttom.dart';

class ColorStep extends ConsumerWidget {
  final VoidCallback onNext, onPrevious;
  const ColorStep({super.key, required this.onNext, required this.onPrevious});

  final cores = ColorRepository.colors;
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onboarding = ref.watch(onboardingProvider);
    final background = Backgrounds.backgroundCasas.label;
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(background,
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
                        spacing: 16,
                        children: [
                          Text(l10n.chooseEssence,
                          style: Theme.of(context).textTheme.titleLarge,
                          textAlign: TextAlign.center,
                          ),
                          Text(l10n.colorsSayAboutYou,
                          style: Theme.of(context).textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                          ),
                          Divider(color: Theme.of(context).colorScheme.secondary, thickness: 0.5),
                          Text(onboarding.nome.toString(),
                          style: Theme.of(context).textTheme.titleLarge,
                          ),
                          AvatarViewOnboarding(path: onboarding.avatar!.imagePath, avatarSize: AvatarSize.big,cor: onboarding.cor!.color),
                          GridView.count(
                            crossAxisCount: 3,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            children: cores.map((cor) {
                              final isSelected = cor.id == onboarding.cor!.id;
                              return GestureDetector(
                                onTap: () => ref.read(onboardingProvider.notifier).setColor(cor),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: isSelected ? Colors.amber : Colors.transparent,
                                      width: 3
                                    )
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: cor.color,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                          RpgStepButtom(texto: l10n.next, function: onNext),
                          RpgStepButtom(texto: l10n.back, function: onPrevious, color: Theme.of(context).colorScheme.error)
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