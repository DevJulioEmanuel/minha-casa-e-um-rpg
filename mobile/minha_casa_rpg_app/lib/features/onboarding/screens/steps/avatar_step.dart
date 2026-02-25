import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minha_casa_rpg_app/features/avatares/data/avatar_repository.dart';
import 'package:minha_casa_rpg_app/shared/enum/avatar_size.dart';
import 'package:minha_casa_rpg_app/features/onboarding/provider/onboarding_provider.dart';
import 'package:minha_casa_rpg_app/features/onboarding/widgets/avatar_view_onboarding.dart';
import 'package:minha_casa_rpg_app/shared/widgets/rpg_step_buttom.dart';

class AvatarStep extends ConsumerWidget {
  final VoidCallback onNext, onPrevious;
  const AvatarStep({super.key, required this.onNext, required this.onPrevious});

  final avatares = AvatarRepository.avatars;
  
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
                        spacing: 16,
                        children: [
                          Text("Escolha seu avatar!",
                          style: Theme.of(context).textTheme.titleLarge,
                          textAlign: TextAlign.center,
                          ),
                          Text("Essa será sua identidade dentro da república.",
                          style: Theme.of(context).textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                          ),
                          Divider(color: Theme.of(context).colorScheme.secondary, thickness: 0.5),
                          Text(onboarding.nome.toString(),
                          style: Theme.of(context).textTheme.titleLarge,
                          ),
                          AvatarViewOnboarding(path: onboarding.avatar!.imagePath, avatarSize: AvatarSize.big),
                          GridView.count(
                            crossAxisCount: 3,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            children: avatares.map((avatar) {
                              final isSelected = avatar.id == onboarding.avatar!.id;
                              return GestureDetector(
                                onTap: () => ref.read(onboardingProvider.notifier).setAvatar(avatar),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: isSelected ? Colors.amber : Colors.transparent,
                                      width: 3
                                    )
                                  ),
                                  child: AvatarViewOnboarding(
                                    path: avatar.imagePath, 
                                    avatarSize: AvatarSize.medium
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                          RpgStepButtom(texto: "PRÓXIMO", function: onNext),
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