import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minha_casa_rpg_app/core/design/backgrounds.dart';
import 'package:minha_casa_rpg_app/l10n/app_localizations.dart';
import 'package:minha_casa_rpg_app/shared/enum/avatar_size.dart';
import 'package:minha_casa_rpg_app/features/onboarding/provider/onboarding_provider.dart';
import 'package:minha_casa_rpg_app/features/onboarding/widgets/avatar_view_onboarding.dart';
import 'package:minha_casa_rpg_app/shared/widgets/rpg_step_buttom.dart';

class ConfirmStep extends ConsumerWidget {
  final VoidCallback onNext, onPrevious;
  const ConfirmStep({super.key, required this.onNext, required this.onPrevious});

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
            filterQuality: FilterQuality.none,
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
                          Text(l10n.finishWarriorQuestion,
                          style: Theme.of(context).textTheme.titleLarge,
                          textAlign: TextAlign.center,
                          ),
                          Divider(color: Theme.of(context).colorScheme.secondary, thickness: 0.5),
                          Text(onboarding.nome.toString(),
                          style: Theme.of(context).textTheme.titleLarge
                          ),
                          AvatarViewOnboarding(path: onboarding.avatar!.imagePath, avatarSize: AvatarSize.big, cor: onboarding.cor!.color),
                          SizedBox(height: 8),
                          RpgStepButtom(texto: l10n.finish, function: () async {
                            try {
                              await ref.read(onboardingProvider.notifier).criarUsuario();
                              onNext();
                            } catch (e) {
                              if (!context.mounted) return;
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(e.toString()))
                              );
                            }
                            }),
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