
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minha_casa_rpg_app/shared/widgets/divider_screens.dart';
import 'package:minha_casa_rpg_app/shared/widgets/titulo_screen.dart';


class LojaScreen extends ConsumerStatefulWidget{
  const LojaScreen({super.key});

  @override
  ConsumerState<LojaScreen> createState() => _LojaScreenState();
}

class _LojaScreenState extends ConsumerState<LojaScreen> {

  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;
    //final scaleBigSprite = widthScreen*0.014;
    //final scaleSmallSprite = widthScreen*0.003;

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
                          TituloScreen(texto: "Loja"),
                          DividerScreens(heightScreen: heightScreen, widthScreen: widthScreen)
                        ],
                      ),
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

