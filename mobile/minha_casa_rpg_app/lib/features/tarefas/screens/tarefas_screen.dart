
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minha_casa_rpg_app/features/republica/data/bd_fake.dart';
import 'package:minha_casa_rpg_app/features/republica/data/usuario_modelfake.dart';
import 'package:minha_casa_rpg_app/features/republica/widgets/divider_screens.dart';
import 'package:minha_casa_rpg_app/features/tarefas/widgets/buttom_newtask.dart';
import 'package:minha_casa_rpg_app/features/tarefas/widgets/card_task.dart';
import 'package:minha_casa_rpg_app/features/tarefas/widgets/filtro_widgets.dart';
import 'package:minha_casa_rpg_app/features/tarefas/widgets/titulo_screen.dart';


class TarefasScreen extends ConsumerStatefulWidget{
  const TarefasScreen({super.key});

  @override
  ConsumerState<TarefasScreen> createState() => _TarefasScreenState();
}

class _TarefasScreenState extends ConsumerState<TarefasScreen> {

  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;
    //final scaleBigSprite = widthScreen*0.014;
    final scaleSmallSprite = widthScreen*0.003;

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
                          TituloScreen(),
                          DividerScreens(heightScreen: heightScreen, widthScreen: widthScreen),
                          ButtomNewtask(),
                          SizedBox(height: heightScreen*0.03),
                          FiltroWidgets(widthScreen: widthScreen, heightScreen: heightScreen),
                          SizedBox(height: heightScreen*0.025),
                        ],
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) { 
                          final atividade = atividades[index];
                          return CardTask(
                            atividade: atividade,
                            context: context,
                            scaleImage: scaleSmallSprite
                          );
                      },
                      childCount: usuarios.length
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

