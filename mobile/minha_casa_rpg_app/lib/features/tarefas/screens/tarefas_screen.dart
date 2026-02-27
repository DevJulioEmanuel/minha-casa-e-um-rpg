
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minha_casa_rpg_app/features/tarefas/provider/tarefas_provider.dart';
import 'package:minha_casa_rpg_app/l10n/app_localizations.dart';
import 'package:minha_casa_rpg_app/shared/widgets/divider_screens.dart';
import 'package:minha_casa_rpg_app/features/tarefas/widgets/new_task/buttom_newtask.dart';
import 'package:minha_casa_rpg_app/features/tarefas/widgets/card_tasks/card_task.dart';
import 'package:minha_casa_rpg_app/features/tarefas/widgets/filtro_widgets.dart';
import 'package:minha_casa_rpg_app/shared/widgets/titulo_screen.dart';


class TarefasScreen extends ConsumerWidget{
  const TarefasScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final estado = ref.watch(tarefasProvider);  
    final filtroAtual = estado.statusTarefa;
    final tarefasFiltradas = estado.tarefas
      .where((a) => a.statusTarefa == filtroAtual).toList();
    final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;
    //final scaleBigSprite = widthScreen*0.014;
    final scaleSmallSprite = widthScreen*0.003;
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/images/background_nuvens2.png',
            fit: BoxFit.cover,
            ) 
          ),
          Positioned.fill(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          SizedBox(height: heightScreen*0.025),
                          TituloScreen(texto: l10n.tarefasTitle),
                          DividerScreens(heightScreen: heightScreen, widthScreen: widthScreen),
                          ButtomNewtask(heightScreen: heightScreen),
                          SizedBox(height: heightScreen*0.03),
                          FiltroWidgets(widthScreen: widthScreen, heightScreen: heightScreen),
                          SizedBox(height: heightScreen*0.025),
                        ],
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) { 
                          final tarefa = tarefasFiltradas[index];
                          if (tarefa.statusTarefa == filtroAtual) {
                            return CardTask(
                            atividade: tarefa,
                            scaleImage: scaleSmallSprite
                            );
                          }
                          return null;
                      },
                      childCount: tarefasFiltradas.length
                      )
                    )
                  ]
                ),
              )
            )
          )
        ],
      )
    );
  }
}

